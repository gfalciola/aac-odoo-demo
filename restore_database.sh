#!/bin/bash

# Script para restaurar la base de datos en Railway
echo "=== Restaurando Base de Datos AAC Demo ==="

# Variables
DB_HOST=${DB_HOST:-localhost}
DB_PORT=${DB_PORT:-5432}
DB_NAME=${DB_NAME:-odoo}
DB_USER=${DB_USER:-odoo}
DB_PASSWORD=${DB_PASSWORD:-odoo}
DUMP_FILE="demo-gf.dump/dump.sql"

# Verificar que existe el archivo dump
if [ ! -f "$DUMP_FILE" ]; then
    echo "❌ Error: No se encontró el archivo $DUMP_FILE"
    exit 1
fi

echo "📁 Archivo dump encontrado: $DUMP_FILE"

# Crear base de datos si no existe
echo "🗄️ Creando base de datos..."
PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d postgres -c "CREATE DATABASE $DB_NAME;" 2>/dev/null || echo "Base de datos ya existe"

# Restaurar dump
echo "📥 Restaurando dump..."
PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME < $DUMP_FILE

if [ $? -eq 0 ]; then
    echo "✅ Base de datos restaurada exitosamente"
    echo "🌐 Accede a tu Odoo en: http://localhost:8069"
    echo "👤 Usuario: admin"
    echo "🔑 Contraseña: admin"
else
    echo "❌ Error al restaurar la base de datos"
    exit 1
fi
