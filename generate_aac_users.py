#!/usr/bin/env python3
"""
Script para generar usuarios de AAC en formato compatible con Odoo
"""

import pandas as pd

def generate_aac_users():
    """Genera archivo de usuarios para importar en Odoo"""
    
    # Datos de usuarios para AAC
    usuarios = [
        {
            'name': 'Admin AAC',
            'email': 'admin@aac.org.ar',
            'job_title': 'Administrador del Sistema',
            'department_id/name': 'Administración',
            'work_phone': '+54 11 1234-5678',
            'mobile_phone': '+54 9 11 1234-5678',
            'work_email': 'admin@aac.org.ar',
            'is_company': False
        },
        {
            'name': 'Gestión AAC',
            'email': 'gestion@aac.org.ar',
            'job_title': 'Gestión de Asociados',
            'department_id/name': 'Gestión',
            'work_phone': '+54 11 2345-6789',
            'mobile_phone': '+54 9 11 2345-6789',
            'work_email': 'gestion@aac.org.ar',
            'is_company': False
        },
        {
            'name': 'Dr. Demo Asociado',
            'email': 'demo.asociado@aac.org.ar',
            'job_title': 'Asociado',
            'department_id/name': 'Asociados',
            'work_phone': '+54 11 3456-7890',
            'mobile_phone': '+54 9 11 3456-7890',
            'work_email': 'demo.asociado@aac.org.ar',
            'is_company': False
        },
        {
            'name': 'Secretaría AAC',
            'email': 'secretaria@aac.org.ar',
            'job_title': 'Secretaria Administrativa',
            'department_id/name': 'Administración',
            'work_phone': '+54 11 4567-8901',
            'mobile_phone': '+54 9 11 4567-8901',
            'work_email': 'secretaria@aac.org.ar',
            'is_company': False
        },
        {
            'name': 'Tesorería AAC',
            'email': 'tesoreria@aac.org.ar',
            'job_title': 'Tesorero',
            'department_id/name': 'Finanzas',
            'work_phone': '+54 11 5678-9012',
            'mobile_phone': '+54 9 11 5678-9012',
            'work_email': 'tesoreria@aac.org.ar',
            'is_company': False
        }
    ]
    
    # Crear DataFrame
    df = pd.DataFrame(usuarios)
    
    # Guardar como Excel
    df.to_excel('usuarios_aac.xlsx', index=False)
    print("✅ Archivo 'usuarios_aac.xlsx' creado exitosamente")
    print(f"📊 {len(usuarios)} usuarios generados")
    
    # Mostrar preview
    print("\n📋 Preview de los usuarios:")
    print(df[['name', 'email', 'job_title', 'department_id/name']].to_string(index=False))
    
    print("\n🔑 Datos de acceso para configurar manualmente:")
    print("Admin AAC:")
    print("  - Usuario: admin.aac")
    print("  - Contraseña: admin123")
    print("  - Permisos: Acceso completo")
    print("\nGestión AAC:")
    print("  - Usuario: gestion.aac")
    print("  - Contraseña: gestion123")
    print("  - Permisos: CRM, Ventas, Eventos")
    print("\nDemo Asociado:")
    print("  - Usuario: demo.asociado")
    print("  - Contraseña: demo123")
    print("  - Permisos: Portal de autogestión")
    
    return df

if __name__ == "__main__":
    generate_aac_users()


