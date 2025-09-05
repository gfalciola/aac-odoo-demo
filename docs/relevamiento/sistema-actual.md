# Sistema Actual - AAC

## Infraestructura Actual

- Sistema web con portal de socios independiente del sitio principal (aac.org.ar)
- Base de datos accesible con exportación a CSV por módulo
- 12 usuarios internos
- Integraciones existentes:
  - Moodle (para cursos)
  - AFIP (facturación electrónica)
  - PayU (pagos)
  - Bejerman (sistema contable)

## Funcionalidades Principales

### 1. Gestión de Socios
- Administración de socios y no socios
- Actualización de datos personales
- Alta y modificación de usuarios
- Solicitudes de asociación

### 2. Gestión Financiera
- Administración de cuotas sociales
- Débitos automáticos
  - Presentación
  - Control
  - Resultados
  - Facturación
  - Envío
- Facturación electrónica AFIP
  - Configuración de acceso
  - Formularios PDF
  - Configuración de sucursal
  - Numeración de facturas y notas de crédito
- Conciliación bancaria

### 3. Comunicaciones
- Envío masivo de mails segmentados por filtro
- Gestión de información general, grupal y personal

### 4. Gestión Académica
- Integración con Moodle para cursos web
- Inscripción a cursos, congresos y actividades
- Administración de precios y vigencias

### 5. Gestión Documental
- Administración de documentación solicitada
- Clasificación por tipo y vencimiento
- Documentos vinculados a varias áreas
- Presentación y actualización de documentación

## Problemas Identificados

1. **Inconsistencias en el Sistema**
   - Problemas generales de consistencia de datos
   - Necesidad de intervención manual frecuente

2. **Gestión de Pagos**
   - Intervención manual del proveedor para cobros con tarjetas de crédito mensuales
   - Problemas con la facturación AFIP que requieren acciones manuales

3. **Limitada Autogestión**
   - Necesidad de mayor autonomía para los médicos asociados en:
     - Actualización de datos
     - Inscripciones a cursos
     - Inscripciones a eventos

4. **Integración Web**
   - Sistema separado del sitio principal
   - Necesidad de linkear externamente las funcionalidades

## Datos para Migración

### Información a Importar
- Socios y No Socios
- Cuotas sociales (actuales y anteriores)
- Saldos de cuota
- Datos de tarjetas de crédito
- Datos para débitos automáticos

### Acceso a Datos
- Acceso disponible a la base de datos a través del proveedor actual
- Posibilidad de exportación CSV por módulo

