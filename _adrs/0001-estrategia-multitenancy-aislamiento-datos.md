---
status: proposed
date: 2026-01-05
decision_makers: []
consulted: []
informed: []
title: "Estrategia de multitenancy a nivel de aislamiento de datos"
tags: [arquitectura, multitenancy, bases-de-datos]
excerpt: "Definir la estrategia de aislamiento de datos entre tenants para garantizar seguridad, rendimiento y eficiencia operativa."
---

## Contexto y planteamiento del problema

En el contexto de una plataforma SaaS multi-tenant, necesitamos decidir cómo aislar los datos de cada tenant para garantizar seguridad, privacidad y rendimiento adecuado, aceptando que existen trade-offs entre aislamiento estricto y eficiencia operativa.

> ¿Qué estrategia de aislamiento de datos debemos implementar para soportar múltiples tenants de forma segura y escalable?

## Factores de decisión

- **Seguridad**: los datos de un tenant nunca deben ser accesibles por otro tenant
- **Costos operativos**: infraestructura y mantenimiento de bases de datos
- **Escalabilidad**: capacidad de crecer en número de tenants sin degradación
- **Complejidad de desarrollo**: esfuerzo para implementar y mantener la solución
- **Cumplimiento regulatorio**: requisitos de residencia de datos y auditoría
- **Rendimiento**: queries no deben verse afectadas por la carga de otros tenants

## Opciones consideradas

1. **Base de datos por tenant** — cada tenant tiene su propia base de datos
2. **Esquema por tenant** — una base de datos compartida con un esquema separado por tenant
3. **Tablas compartidas con columna discriminadora** — todas las tablas incluyen un `tenant_id`

## Resultado de la decisión

**Opción elegida**: pendiente de definición.

## Pros y Contras de las opciones

### Base de datos por tenant

- **Pro:** máximo aislamiento de datos, fácil de cumplir requisitos regulatorios
- **Pro:** rendimiento predecible por tenant, sin efecto "noisy neighbor"
- **Pro:** backup y restore granular por tenant
- **Contra:** alto costo de infraestructura a escala
- **Contra:** complejidad operativa significativa (migraciones, monitoreo, conexiones)
- **Contra:** difícil de implementar queries cross-tenant para analytics

### Esquema por tenant

- **Pro:** buen nivel de aislamiento lógico
- **Pro:** costos moderados (una instancia de BD compartida)
- **Pro:** migraciones se pueden automatizar por esquema
- **Contra:** límites del motor de BD en número de esquemas
- **Contra:** connection pooling compartido puede generar contención
- **Contra:** no hay aislamiento de rendimiento real

### Tablas compartidas con columna discriminadora

- **Pro:** máxima eficiencia de recursos y menor costo operativo
- **Pro:** simplicidad en desarrollo y migraciones
- **Pro:** facilita queries cross-tenant para analytics y reporting
- **Contra:** riesgo de data leakage si se olvida el filtro de `tenant_id`
- **Contra:** tablas grandes pueden degradar rendimiento
- **Contra:** difícil cumplir requisitos estrictos de residencia de datos

## Más información

- [Building Multi-Tenant SaaS Architectures — Todd Swearingen]({{ '/recursos/building-multi-tenant-saas-architectures/' | relative_url }})
