---
status: proposed
product: cosmos
date: 2026-01-05
decision_makers: []
consulted: []
informed: []
title: "Estrategia de multitenancy a nivel de aislamiento de datos"
tags: [arquitectura, multitenancy, bases-de-datos]
excerpt: "Definir la estrategia de aislamiento de datos entre tenants para garantizar seguridad, rendimiento y eficiencia operativa."
---

## Contexto

En una plataforma SaaS multi-tenant, necesitamos decidir cómo aislar los datos de cada tenant. Los factores críticos son: seguridad (los datos de un tenant nunca deben ser accesibles por otro), costos operativos, escalabilidad en número de tenants, complejidad de desarrollo, cumplimiento regulatorio (residencia de datos y auditoría) y rendimiento (sin efecto "noisy neighbor").

> ¿Qué estrategia de aislamiento de datos debemos implementar para soportar múltiples tenants de forma segura y escalable?

## Opciones evaluadas

### Opción 1 — Base de datos por tenant

Cada tenant tiene su propia base de datos.

**Ventajas:**

- Máximo aislamiento de datos, fácil de cumplir requisitos regulatorios
- Rendimiento predecible por tenant, sin efecto "noisy neighbor"
- Backup y restore granular por tenant

**Desventajas:**

- Alto costo de infraestructura a escala
- Complejidad operativa significativa (migraciones, monitoreo, conexiones)
- Difícil de implementar queries cross-tenant para analytics

### Opción 2 — Esquema por tenant

Una base de datos compartida con un esquema separado por tenant.

**Ventajas:**

- Buen nivel de aislamiento lógico
- Costos moderados (una instancia de BD compartida)
- Migraciones se pueden automatizar por esquema

**Desventajas:**

- Límites del motor de BD en número de esquemas
- Connection pooling compartido puede generar contención
- No hay aislamiento de rendimiento real

### Opción 3 — Tablas compartidas con columna discriminadora

Todas las tablas incluyen un `tenant_id`.

**Ventajas:**

- Máxima eficiencia de recursos y menor costo operativo
- Simplicidad en desarrollo y migraciones
- Facilita queries cross-tenant para analytics y reporting

**Desventajas:**

- Riesgo de data leakage si se olvida el filtro de `tenant_id`
- Tablas grandes pueden degradar rendimiento
- Difícil cumplir requisitos estrictos de residencia de datos

## Decisión

Pendiente de definición.

## Consecuencias

Pendiente — se documentarán una vez tomada la decisión.

---

[Building Multi-Tenant SaaS Architectures — Todd Swearingen]({{ '/recursos/building-multi-tenant-saas-architectures/' | relative_url }})
