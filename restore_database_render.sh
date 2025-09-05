#!/bin/bash

# Script para restaurar la base de datos de Odoo en Render
# Uso: ./restore_database_render.sh

echo "=== Restaurando Base de Datos en Render ==="

# Verificar que DATABASE_URL esté configurada
if [ -z "$DATABASE_URL" ]; then
    echo "ERROR: DATABASE_URL no está configurada"
    exit 1
fi

# Extraer componentes de la URL
DB_SCHEME=$(echo "$DATABASE_URL" | sed -nr 's/^(.*):\/\/(.*)/\1/p')
DB_USER=$(echo "$DATABASE_URL" | sed -nr 's/.*:\/\/(.*):.*@.*/\1/p')
DB_PASSWORD=$(echo "$DATABASE_URL" | sed -nr 's/.*:.*@(.*?):.*/\1/p' | sed -nr 's/(.*)\/.*/\1/p')
DB_HOST=$(echo "$DATABASE_URL" | sed -nr 's/.*@(.*):.*/\1/p' | sed -nr 's/(.*)\/.*/\1/p')
DB_PORT=$(echo "$DATABASE_URL" | sed -nr 's/.*:(.*)\/.*/\1/p')
DB_NAME=$(echo "$DATABASE_URL" | sed -nr 's/.*:\/\/[^/]*\/(.*)/\1/p')

echo "Conectando a: $DB_HOST:$DB_PORT como $DB_USER"
echo "Base de datos: $DB_NAME"

# Verificar conexión a la base de datos
echo "Verificando conexión a la base de datos..."
if ! pg_isready -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER"; then
    echo "ERROR: No se puede conectar a la base de datos"
    exit 1
fi

echo "Conexión exitosa a la base de datos"

# Restaurar el dump
echo "Restaurando dump de la base de datos..."
if [ -f "demo-gf.dump/dump.sql" ]; then
    PGPASSWORD="$DB_PASSWORD" psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -f "demo-gf.dump/dump.sql"
    if [ $? -eq 0 ]; then
        echo "✅ Base de datos restaurada exitosamente"
    else
        echo "❌ Error al restaurar la base de datos"
        exit 1
    fi
else
    echo "ERROR: No se encontró el archivo dump.sql"
    exit 1
fi

# Copiar filestore
echo "Copiando archivos del filestore..."
if [ -d "demo-gf.dump/filestore" ]; then
    cp -r demo-gf.dump/filestore/* /var/lib/odoo/filestore/
    if [ $? -eq 0 ]; then
        echo "✅ Filestore copiado exitosamente"
    else
        echo "❌ Error al copiar el filestore"
        exit 1
    fi
else
    echo "ERROR: No se encontró el directorio filestore"
    exit 1
fi

echo "=== Restauración completada ==="
echo "La base de datos y archivos han sido restaurados correctamente"
