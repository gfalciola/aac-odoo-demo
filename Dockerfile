FROM odoo:17.0

# Instalar dependencias adicionales
USER root
RUN apt-get update && apt-get install -y \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Copiar archivos de configuración
COPY ./config/odoo.conf /etc/odoo/odoo.conf
COPY ./start.sh /start.sh

# Copiar backup de la base de datos
COPY ./demo-gf.dump /demo-gf.dump

# Hacer ejecutable el script de inicio
RUN chmod +x /start.sh

# Volver al usuario odoo
USER odoo

# Exponer puerto
EXPOSE 10000

# Usar script de inicio personalizado
CMD ["/start.sh"]
