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

# Limpiar completamente todos los assets y caché
echo "Limpiando assets y caché existentes..."
rm -rf /var/lib/odoo/filestore/* 2>/dev/null || true
rm -rf /var/lib/odoo/sessions/* 2>/dev/null || true
rm -rf /var/lib/odoo/addons/17.0/*/static/src/css/* 2>/dev/null || true

# Crear directorio de assets si no existe
mkdir -p /var/lib/odoo/filestore 2>/dev/null || true

# Forzar regeneración de assets eliminando la base de datos problemática
echo "Eliminando base de datos problemática para forzar recreación..."
export PGPASSWORD="$PGPASSWORD"
psql -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -d postgres -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'aac_demo';" 2>/dev/null || true
psql -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -d postgres -c "DROP DATABASE IF EXISTS aac_demo;" 2>/dev/null || true
echo "Base de datos aac_demo eliminada (si existía)"

# Iniciar Odoo con las variables de entorno configuradas
exec odoo
