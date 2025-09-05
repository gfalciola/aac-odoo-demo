#!/usr/bin/env python3
"""
Script para generar datos de asociados de AAC basado en la plantilla de Odoo
"""

import pandas as pd
import random

def generate_aac_contacts():
    """Genera datos de asociados ficticios para AAC"""
    
    # Datos de ejemplo de asociados de AAC
    asociados = [
        {
            'name': 'Dr. Juan Carlos Pérez',
            'email': 'juan.perez@hospital.com',
            'phone': '+54 11 1234-5678',
            'company_id/name': 'Hospital General de Buenos Aires',
            'job_position': 'Cirujano General',
            'street': 'Av. Corrientes 1234',
            'city': 'Buenos Aires',
            'state_id/name': 'CABA',
            'zip': '1043',
            'country_id/name': 'Argentina',
            'tags': 'Asociado,AAC,Cirujano General',
            'is_company': False
        },
        {
            'name': 'Dra. María González',
            'email': 'maria.gonzalez@cardiovascular.com',
            'phone': '+54 11 2345-6789',
            'company_id/name': 'Clínica Cardiovascular',
            'job_position': 'Cirujana Cardiovascular',
            'street': 'Av. Santa Fe 567',
            'city': 'Buenos Aires',
            'state_id/name': 'CABA',
            'zip': '1059',
            'country_id/name': 'Argentina',
            'tags': 'Asociado,AAC,Cardiovascular',
            'is_company': False
        },
        {
            'name': 'Dr. Carlos Rodríguez',
            'email': 'carlos.rodriguez@pediatria.com',
            'phone': '+54 11 3456-7890',
            'company_id/name': 'Hospital de Niños',
            'job_position': 'Cirujano Pediátrico',
            'street': 'Av. Córdoba 890',
            'city': 'Buenos Aires',
            'state_id/name': 'CABA',
            'zip': '1054',
            'country_id/name': 'Argentina',
            'tags': 'Asociado,AAC,Pediatría',
            'is_company': False
        },
        {
            'name': 'Dra. Ana Martínez',
            'email': 'ana.martinez@trauma.com',
            'phone': '+54 11 4567-8901',
            'company_id/name': 'Centro de Trauma',
            'job_position': 'Cirujana de Trauma',
            'street': 'Av. Belgrano 234',
            'city': 'Buenos Aires',
            'state_id/name': 'CABA',
            'zip': '1094',
            'country_id/name': 'Argentina',
            'tags': 'Asociado,AAC,Trauma',
            'is_company': False
        },
        {
            'name': 'Dr. Roberto Silva',
            'email': 'roberto.silva@oncologia.com',
            'phone': '+54 11 5678-9012',
            'company_id/name': 'Instituto de Oncología',
            'job_position': 'Cirujano Oncológico',
            'street': 'Av. Pueyrredón 456',
            'city': 'Buenos Aires',
            'state_id/name': 'CABA',
            'zip': '1032',
            'country_id/name': 'Argentina',
            'tags': 'Asociado,AAC,Oncología',
            'is_company': False
        },
        {
            'name': 'Dra. Laura Fernández',
            'email': 'laura.fernandez@neurocirugia.com',
            'phone': '+54 11 6789-0123',
            'company_id/name': 'Instituto de Neurocirugía',
            'job_position': 'Neurocirujana',
            'street': 'Av. Las Heras 789',
            'city': 'Buenos Aires',
            'state_id/name': 'CABA',
            'zip': '1127',
            'country_id/name': 'Argentina',
            'tags': 'Asociado,AAC,Neurocirugía',
            'is_company': False
        },
        {
            'name': 'Dr. Miguel Torres',
            'email': 'miguel.torres@ortopedia.com',
            'phone': '+54 11 7890-1234',
            'company_id/name': 'Centro de Ortopedia',
            'job_position': 'Cirujano Ortopédico',
            'street': 'Av. Callao 321',
            'city': 'Buenos Aires',
            'state_id/name': 'CABA',
            'zip': '1022',
            'country_id/name': 'Argentina',
            'tags': 'Asociado,AAC,Ortopedia',
            'is_company': False
        },
        {
            'name': 'Dra. Patricia López',
            'email': 'patricia.lopez@plastica.com',
            'phone': '+54 11 8901-2345',
            'company_id/name': 'Clínica de Cirugía Plástica',
            'job_position': 'Cirujana Plástica',
            'street': 'Av. Alvear 654',
            'city': 'Buenos Aires',
            'state_id/name': 'CABA',
            'zip': '1129',
            'country_id/name': 'Argentina',
            'tags': 'Asociado,AAC,Cirugía Plástica',
            'is_company': False
        }
    ]
    
    # Crear DataFrame
    df = pd.DataFrame(asociados)
    
    # Guardar como Excel
    df.to_excel('asociados_aac.xlsx', index=False)
    print("✅ Archivo 'asociados_aac.xlsx' creado exitosamente")
    print(f"📊 {len(asociados)} asociados generados")
    
    # Mostrar preview
    print("\n📋 Preview de los datos:")
    print(df[['name', 'email', 'company_id/name', 'job_position']].to_string(index=False))
    
    return df

if __name__ == "__main__":
    generate_aac_contacts()



