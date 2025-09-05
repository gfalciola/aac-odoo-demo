#!/usr/bin/env python3
"""
Script de configuración completa para la demo de AAC
Configura productos, usuarios, eventos y portal web
"""

import pandas as pd
import json

def generate_aac_config():
    """Genera archivos de configuración para AAC"""
    
    # 1. PRODUCTOS (Cuotas y Servicios)
    productos = [
        {
            'name': 'Cuota Social Mensual',
            'list_price': 5000,
            'type': 'service',
            'description': 'Cuota mensual de asociación AAC',
            'categ_name': 'Cuotas Sociales'
        },
        {
            'name': 'Cuota Social Anual',
            'list_price': 50000,
            'type': 'service',
            'description': 'Cuota anual de asociación AAC (10% descuento)',
            'categ_name': 'Cuotas Sociales'
        },
        {
            'name': 'Inscripción Congreso Anual',
            'list_price': 15000,
            'type': 'service',
            'description': 'Inscripción al Congreso Anual de Cirugía',
            'categ_name': 'Eventos'
        },
        {
            'name': 'Curso de Cirugía Laparoscópica',
            'list_price': 8000,
            'type': 'service',
            'description': 'Curso intensivo de cirugía laparoscópica',
            'categ_name': 'Cursos'
        },
        {
            'name': 'Simposio de Cardiología',
            'list_price': 12000,
            'type': 'service',
            'description': 'Simposio internacional de cardiología',
            'categ_name': 'Eventos'
        }
    ]
    
    # 2. EVENTOS
    eventos = [
        {
            'name': 'Congreso Anual de Cirugía 2024',
            'date_begin': '2024-11-15 09:00:00',
            'date_end': '2024-11-17 18:00:00',
            'address': 'Hotel Sheraton, Buenos Aires',
            'description': 'El evento más importante de cirugía en Argentina',
            'seats_availability': 500,
            'seats_max': 500
        },
        {
            'name': 'Curso de Cirugía Laparoscópica',
            'date_begin': '2024-10-20 08:00:00',
            'date_end': '2024-10-22 17:00:00',
            'address': 'Centro de Simulación Quirúrgica',
            'description': 'Curso práctico de técnicas laparoscópicas',
            'seats_availability': 30,
            'seats_max': 30
        },
        {
            'name': 'Simposio de Cardiología',
            'date_begin': '2024-12-05 09:00:00',
            'date_end': '2024-12-06 18:00:00',
            'address': 'Centro de Convenciones',
            'description': 'Simposio con expertos internacionales',
            'seats_availability': 200,
            'seats_max': 200
        }
    ]
    
    # 3. USUARIOS
    usuarios = [
        {
            'name': 'Admin AAC',
            'email': 'admin@aac.org.ar',
            'login': 'admin.aac',
            'job_title': 'Administrador del Sistema',
            'department': 'Administración',
            'groups': ['Administración', 'Ventas', 'CRM']
        },
        {
            'name': 'Gestión AAC',
            'email': 'gestion@aac.org.ar',
            'login': 'gestion.aac',
            'job_title': 'Gestión de Asociados',
            'department': 'Gestión',
            'groups': ['Ventas', 'CRM', 'Eventos']
        },
        {
            'name': 'Dr. Demo Asociado',
            'email': 'demo.asociado@aac.org.ar',
            'login': 'demo.asociado',
            'job_title': 'Asociado',
            'department': 'Asociados',
            'groups': ['Portal']
        }
    ]
    
    # 4. CONFIGURACIÓN DEL PORTAL
    portal_config = {
        'name': 'Portal de Asociados AAC',
        'description': 'Portal de autogestión para asociados de la Asociación Argentina de Cirugía',
        'features': [
            'Actualización de datos personales',
            'Consulta de cuotas y pagos',
            'Inscripción a eventos y cursos',
            'Descarga de certificados',
            'Comunicaciones personalizadas'
        ]
    }
    
    # Guardar configuraciones
    configs = {
        'productos': productos,
        'eventos': eventos,
        'usuarios': usuarios,
        'portal': portal_config
    }
    
    with open('aac_demo_config.json', 'w', encoding='utf-8') as f:
        json.dump(configs, f, indent=2, ensure_ascii=False)
    
    # Crear archivo CSV para productos
    df_productos = pd.DataFrame(productos)
    df_productos.to_excel('productos_aac.xlsx', index=False)
    
    # Crear archivo CSV para eventos
    df_eventos = pd.DataFrame(eventos)
    df_eventos.to_excel('eventos_aac.xlsx', index=False)
    
    print("✅ Configuración de AAC generada exitosamente")
    print("📁 Archivos creados:")
    print("   - aac_demo_config.json (configuración completa)")
    print("   - productos_aac.xlsx (productos para importar)")
    print("   - eventos_aac.xlsx (eventos para importar)")
    
    return configs

def generate_demo_instructions():
    """Genera instrucciones para la demo"""
    
    instrucciones = """
# INSTRUCCIONES PARA LA DEMO DE AAC

## 🔗 ENLACES IMPORTANTES

### 📊 Gestión Administrativa:
- **Contactos/Asociados**: [Ver todos los asociados]
- **Crear Nuevo Asociado**: [Nuevo contacto]
- **Productos/Cuotas**: [Gestionar productos]
- **Eventos**: [Gestionar eventos y cursos]

### 👥 Gestión de Usuarios:
- **Empleados/Usuarios**: [Gestionar usuarios del sistema]
- **Crear Nuevo Usuario**: [Nuevo empleado con acceso]
- **Permisos**: [Configurar roles y permisos]

### 🌐 Portal de Autogestión:
- **Portal Web**: [Acceso público al sitio]
- **Registro de Asociados**: [Formulario de alta]
- **Inscripción a Eventos**: [Formulario de inscripción]

## 📋 FUNCIONALIDADES A MOSTRAR

### 1. Gestión de Asociados:
- Ver lista de asociados
- Crear nuevo asociado
- Editar datos de asociado
- Asignar cuotas y servicios

### 2. Gestión de Eventos:
- Crear nuevo evento
- Configurar fechas y lugares
- Gestionar inscripciones
- Control de capacidad

### 3. Portal de Autogestión:
- Registro de nuevos asociados
- Inscripción a eventos
- Consulta de cuotas
- Actualización de datos

### 4. Gestión de Usuarios:
- Crear usuarios del sistema
- Asignar permisos
- Configurar roles

## 🎯 FLUJOS PRINCIPALES

### Flujo 1: Alta de Nuevo Asociado
1. Asociado se registra en el portal web
2. Administrador aprueba la solicitud
3. Se crea el contacto en el sistema
4. Se asigna cuota inicial

### Flujo 2: Inscripción a Evento
1. Asociado accede al portal
2. Ve eventos disponibles
3. Se inscribe al evento
4. Recibe confirmación por email

### Flujo 3: Gestión de Cuotas
1. Administrador crea factura de cuota
2. Sistema envía email al asociado
3. Asociado puede pagar online
4. Sistema registra el pago

## 📧 DATOS DE ACCESO

### Usuario Administrador:
- Email: admin@aac.org.ar
- Contraseña: admin123

### Usuario Gestión:
- Email: gestion@aac.org.ar
- Contraseña: gestion123

### Usuario Demo:
- Email: demo.asociado@aac.org.ar
- Contraseña: demo123

## 🔧 CONFIGURACIONES IMPORTANTES

### Portal Web:
- Activar registro de usuarios
- Configurar formularios de inscripción
- Personalizar diseño y contenido

### Email:
- Configurar plantillas de email
- Activar notificaciones automáticas
- Personalizar mensajes

### Integraciones:
- Configurar pasarela de pagos
- Integrar con AFIP
- Conectar con Moodle (cursos)
"""
    
    with open('instrucciones_demo_aac.md', 'w', encoding='utf-8') as f:
        f.write(instrucciones)
    
    print("📋 Instrucciones de demo creadas en 'instrucciones_demo_aac.md'")

if __name__ == "__main__":
    generate_aac_config()
    generate_demo_instructions()


