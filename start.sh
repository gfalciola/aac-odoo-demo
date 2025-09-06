#!/bin/bash

# Script de inicio para Odoo en Render
echo "=== Iniciando Odoo en Render ==="

# Verificar que DATABASE_URL esté configurada
if [ -z "$DATABASE_URL" ]; then
    echo "ERROR: DATABASE_URL no está configurada"
    exit 1
fi

echo "DATABASE_URL configurada correctamente"

# Extraer componentes de la URL de la base de datos usando un método más robusto
echo "DATABASE_URL: $DATABASE_URL"

# Usar python para parsear la URL de manera más confiable
export PGPASSWORD=$(python3 -c "
import os
import urllib.parse
url = os.environ.get('DATABASE_URL', '')
parsed = urllib.parse.urlparse(url)
print(parsed.password or '')
")

export PGHOST=$(python3 -c "
import os
import urllib.parse
url = os.environ.get('DATABASE_URL', '')
parsed = urllib.parse.urlparse(url)
print(parsed.hostname or '')
")

export PGPORT=$(python3 -c "
import os
import urllib.parse
url = os.environ.get('DATABASE_URL', '')
parsed = urllib.parse.urlparse(url)
print(parsed.port or 5432)
")

export PGDATABASE=$(python3 -c "
import os
import urllib.parse
url = os.environ.get('DATABASE_URL', '')
parsed = urllib.parse.urlparse(url)
print(parsed.path.lstrip('/') or '')
")

export PGUSER=$(python3 -c "
import os
import urllib.parse
url = os.environ.get('DATABASE_URL', '')
parsed = urllib.parse.urlparse(url)
print(parsed.username or '')
")

echo "Conectando a: $PGHOST:$PGPORT/$PGDATABASE como $PGUSER"

# Verificar si la base de datos ya tiene las tablas de Odoo
echo "Verificando si la base de datos está inicializada con Odoo..."
ODOO_INITIALIZED=$(PGPASSWORD="$PGPASSWORD" psql -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -d "$PGDATABASE" -t -c "SELECT 1 FROM pg_tables WHERE tablename = 'ir_module_module';" 2>/dev/null | tr -d ' ')

echo "Resultado de verificación: '$ODOO_INITIALIZED'"

# TEMPORAL: Forzar restauración siempre para debug
echo "FORZANDO RESTAURACIÓN PARA DEBUG..."
echo "Base de datos no inicializada con Odoo. Restaurando backup..."
    
# Limpiar la base de datos completamente
echo "Limpiando base de datos existente..."
PGPASSWORD="$PGPASSWORD" psql -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -d "$PGDATABASE" -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;" 2>/dev/null
    
# Restaurar dump si existe
if [ -f "/demo-gf.dump/dump.sql" ]; then
    echo "Restaurando dump de la base de datos..."
    PGPASSWORD="$PGPASSWORD" psql -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -d "$PGDATABASE" -f "/demo-gf.dump/dump.sql"
    if [ $? -eq 0 ]; then
        echo "✅ Base de datos restaurada exitosamente"
        
        # Verificar qué tablas se crearon
        echo "Verificando tablas creadas..."
        TABLES_COUNT=$(PGPASSWORD="$PGPASSWORD" psql -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -d "$PGDATABASE" -t -c "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public';" 2>/dev/null | tr -d ' ')
        echo "Total de tablas creadas: $TABLES_COUNT"
        
        # Verificar si existe la tabla ir_module_module
        IR_MODULE_EXISTS=$(PGPASSWORD="$PGPASSWORD" psql -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -d "$PGDATABASE" -t -c "SELECT 1 FROM pg_tables WHERE tablename = 'ir_module_module';" 2>/dev/null | tr -d ' ')
        echo "Tabla ir_module_module existe: $IR_MODULE_EXISTS"
        
        # Verificar si existe la tabla res_lang
        RES_LANG_EXISTS=$(PGPASSWORD="$PGPASSWORD" psql -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -d "$PGDATABASE" -t -c "SELECT 1 FROM pg_tables WHERE tablename = 'res_lang';" 2>/dev/null | tr -d ' ')
        echo "Tabla res_lang existe: $RES_LANG_EXISTS"
    else
        echo "❌ Error al restaurar la base de datos"
    fi
fi

# Copiar filestore si existe
if [ -d "/demo-gf.dump/filestore" ]; then
    echo "Copiando archivos del filestore..."
    cp -r /demo-gf.dump/filestore/* /var/lib/odoo/filestore/ 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "✅ Filestore copiado exitosamente"
    else
        echo "❌ Error al copiar el filestore"
    fi
fi

# Iniciar Odoo
exec odoo
