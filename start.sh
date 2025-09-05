#!/bin/bash

# Script de inicio para Odoo en Render
echo "=== Iniciando Odoo en Render ==="

# Verificar que DATABASE_URL esté configurada
if [ -z "$DATABASE_URL" ]; then
    echo "ERROR: DATABASE_URL no está configurada"
    exit 1
fi

echo "DATABASE_URL configurada correctamente"

# Extraer componentes de la URL de la base de datos
export PGPASSWORD=$(echo $DATABASE_URL | sed -n 's/.*:\/\/[^:]*:\([^@]*\)@.*/\1/p')
export PGHOST=$(echo $DATABASE_URL | sed -n 's/.*@\([^:]*\):.*/\1/p')
export PGPORT=$(echo $DATABASE_URL | sed -n 's/.*:\([0-9]*\)\/.*/\1/p')
export PGDATABASE=$(echo $DATABASE_URL | sed -n 's/.*\/\([^?]*\).*/\1/p')
export PGUSER=$(echo $DATABASE_URL | sed -n 's/.*:\/\/\([^:]*\):.*/\1/p')

echo "Conectando a: $PGHOST:$PGPORT/$PGDATABASE como $PGUSER"

# Verificar si la base de datos ya existe y tiene datos
DB_EXISTS=$(PGPASSWORD="$PGPASSWORD" psql -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -d "$PGDATABASE" -t -c "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public';" 2>/dev/null | tr -d ' ')

if [ "$DB_EXISTS" = "0" ] || [ -z "$DB_EXISTS" ]; then
    echo "Base de datos vacía o no existe. Restaurando backup..."
    
    # Restaurar dump si existe
    if [ -f "/demo-gf.dump/dump.sql" ]; then
        echo "Restaurando dump de la base de datos..."
        PGPASSWORD="$PGPASSWORD" psql -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -d "$PGDATABASE" -f "/demo-gf.dump/dump.sql"
        if [ $? -eq 0 ]; then
            echo "✅ Base de datos restaurada exitosamente"
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
else
    echo "Base de datos ya contiene datos. Saltando restauración."
fi

# Iniciar Odoo
exec odoo
