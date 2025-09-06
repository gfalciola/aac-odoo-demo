#!/bin/bash

# Script de inicio para Odoo en Render
echo "=== Iniciando Odoo Community en Render ==="

# Verificar que DATABASE_URL esté configurada
if [ -z "$DATABASE_URL" ]; then
    echo "ERROR: DATABASE_URL no está configurada"
    exit 1
fi

echo "DATABASE_URL configurada correctamente"
echo "Iniciando Odoo Community Edition..."

# Iniciar Odoo directamente - permitir que se inicialice normalmente
exec odoo
