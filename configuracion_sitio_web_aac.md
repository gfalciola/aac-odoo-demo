
# CONFIGURACIÓN AUTOMÁTICA DEL SITIO WEB AAC

## 🔧 CONFIGURACIÓN MANUAL NECESARIA

### 1. Activar Registro de Usuarios
1. Ve a **"Configuración"** → **"Técnico"** → **"Usuarios y Empresas"** → **"Usuarios"**
2. Busca **"Configuración de autenticación"**
3. Activa **"Registro de usuarios"**
4. Configura **"Tipo de registro"** como "Solo usuarios invitados" o "Todos los usuarios"

### 2. Configurar Portal Web
1. Ve a **"Sitio web"** → **"Configuración"**
2. Activa **"Portal"** para usuarios externos
3. Configura **"URL del portal"** como `/my`

### 3. Crear Página de Solicitud de Afiliación
1. Ve a **"Sitio web"** → **"Páginas"**
2. Haz clic en **"Nuevo"**
3. **Título:** "Solicitud de Afiliación"
4. **URL:** `/solicitud-afiliacion`
5. **Contenido:** Usar el HTML del archivo XML generado

### 4. Configurar Botón "Únase hoy"
1. Edita la página principal
2. Selecciona el botón "Únase hoy"
3. Configura el enlace a `/solicitud-afiliacion`

### 5. Configurar Email de Notificaciones
1. Ve a **"Configuración"** → **"Técnico"** → **"Email"** → **"Plantillas"**
2. Crea nueva plantilla para solicitudes de afiliación
3. Configura destinatarios y contenido

## 📋 CAMPOS DEL FORMULARIO DE SOLICITUD

### Campos Obligatorios:
- **Nombre Completo** (name)
- **Email** (email)
- **Especialidad** (specialty)
- **Tipo de Afiliación** (membership_type)

### Campos Opcionales:
- **Teléfono** (phone)
- **Institución** (institution)
- **Comentarios** (comments)

## 🎯 FLUJO DE SOLICITUD

### Paso 1: Afiliado Completa Formulario
1. Accede a `https://demo-gf.odoo.com/solicitud-afiliacion`
2. Completa todos los campos requeridos
3. Envía la solicitud

### Paso 2: Sistema Procesa Solicitud
1. Crea lead/oportunidad en CRM
2. Envía email de notificación al administrador
3. Envía email de confirmación al solicitante

### Paso 3: Administrador Revisa
1. Recibe notificación por email
2. Ve la solicitud en CRM
3. Aprueba o rechaza la solicitud

### Paso 4: Afiliado Recibe Respuesta
1. Recibe email de aprobación/rechazo
2. Si es aprobado, recibe credenciales de acceso
3. Puede acceder al portal de autogestión

## 🔗 URLS IMPORTANTES

- **Sitio Principal:** https://demo-gf.odoo.com
- **Portal de Autogestión:** https://demo-gf.odoo.com/my
- **Solicitud de Afiliación:** https://demo-gf.odoo.com/solicitud-afiliacion
- **Registro General:** https://demo-gf.odoo.com/web/signup

## 📧 CONFIGURACIÓN DE EMAILS

### Plantillas Necesarias:
1. **Confirmación de Solicitud** (al solicitante)
2. **Notificación de Nueva Solicitud** (al administrador)
3. **Aprobación de Afiliación** (al nuevo asociado)
4. **Rechazo de Solicitud** (al solicitante)

### Configuración SMTP:
- Configurar servidor de email
- Configurar remitente por defecto
- Probar envío de emails

## 🎨 PERSONALIZACIÓN DEL DISEÑO

### Colores Sugeridos:
- **Primario:** Azul (#007bff) - Confianza y profesionalismo
- **Secundario:** Gris (#6c757d) - Neutralidad
- **Acento:** Verde (#28a745) - Éxito y aprobación

### Logo y Branding:
- Agregar logo de AAC
- Configurar favicon
- Personalizar fuentes

## 📱 RESPONSIVE DESIGN

### Dispositivos Soportados:
- **Desktop:** 1200px+
- **Tablet:** 768px - 1199px
- **Mobile:** 320px - 767px

### Elementos Responsivos:
- Formulario de solicitud
- Navegación
- Contenido principal
- Botones de acción
