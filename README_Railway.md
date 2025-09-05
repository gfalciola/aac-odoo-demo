# Odoo Community Demo - AAC

## 🚀 Despliegue en Railway

### Archivos Creados:
- `Dockerfile` - Imagen de Odoo Community 17.0
- `docker-compose.yml` - Configuración con PostgreSQL
- `config/odoo.conf` - Configuración de Odoo
- `requirements.txt` - Dependencias Python
- `railway.json` - Configuración específica de Railway
- `restore_database.sh` - Script para restaurar backup

### 📋 Pasos para Desplegar en Railway:

#### 1. Crear Repositorio GitHub
```bash
git init
git add .
git commit -m "Odoo Community setup for AAC demo"
git remote add origin https://github.com/tu-usuario/aac-odoo-demo.git
git push -u origin main
```

#### 2. Conectar con Railway
1. Ve a **https://railway.app/**
2. **"New Project"** → **"Deploy from GitHub repo"**
3. **Selecciona** tu repositorio `aac-odoo-demo`
4. **Railway detectará** automáticamente el `Dockerfile`

#### 3. Configurar Variables de Entorno
En Railway Dashboard → Variables:
```
POSTGRES_DB=odoo
POSTGRES_USER=odoo
POSTGRES_PASSWORD=odoo
HOST=0.0.0.0
PORT=8069
```

#### 4. Restaurar Base de Datos
Una vez desplegado:
1. **Conecta** a la base de datos PostgreSQL de Railway
2. **Sube** el archivo `demo-gf.dump/dump.sql`
3. **Restaura** usando el script `restore_database.sh`

### 🔧 Comandos Útiles:

#### Despliegue Local (para testing):
```bash
docker-compose up -d
./restore_database.sh
```

#### Ver logs:
```bash
docker-compose logs -f web
```

#### Acceso:
- **URL:** `https://tu-proyecto.railway.app`
- **Usuario:** admin
- **Contraseña:** admin

### 📁 Estructura del Proyecto:
```
aac-migration/
├── Dockerfile
├── docker-compose.yml
├── config/
│   └── odoo.conf
├── requirements.txt
├── railway.json
├── restore_database.sh
├── demo-gf.dump/
│   ├── dump.sql
│   └── filestore/
└── README_Railway.md
```

### ⚠️ Notas Importantes:
- Railway ofrece **500 horas gratis** por mes
- El backup incluye **todos los datos** de la demo
- Una vez restaurado, tendrás **Odoo Community** completo
- **Sin límites de tiempo** como en Odoo.sh

### 🎯 Próximos Pasos:
1. **Crear repositorio** en GitHub
2. **Conectar** con Railway
3. **Desplegar** automáticamente
4. **Restaurar** backup
5. **Probar** funcionalidades
6. **Enviar** nueva URL a AAC
