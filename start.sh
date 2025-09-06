#!/bin/bash

# Script de inicio para Odoo en Render
echo "=== Iniciando Odoo Community en Render ==="

# Verificar que DATABASE_URL esté configurada
if [ -z "$DATABASE_URL" ]; then
    echo "ERROR: DATABASE_URL no está configurada"
    exit 1
fi

echo "DATABASE_URL configurada correctamente"
echo "DATABASE_URL: $DATABASE_URL"

# Extraer componentes de la URL de la base de datos
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

# Configurar variables de entorno para Odoo
export HOST="$PGHOST"
export PORT="$PGPORT"
export USER="$PGUSER"
export PASSWORD="$PGPASSWORD"

echo "Iniciando Odoo Community Edition..."

# Limpiar assets CSS existentes para forzar regeneración
echo "Limpiando assets CSS existentes..."
rm -rf /var/lib/odoo/filestore/*/ir_attachment/attachment_* 2>/dev/null || true

# Iniciar Odoo con las variables de entorno configuradas
exec odoo
