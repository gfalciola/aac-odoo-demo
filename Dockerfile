FROM odoo:17.0

# Instalar dependencias adicionales
USER root
RUN apt-get update && apt-get install -y \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Volver al usuario odoo
USER odoo

# Copiar archivos de configuración
COPY ./config/odoo.conf /etc/odoo/odoo.conf

# Exponer puerto
EXPOSE 10000
