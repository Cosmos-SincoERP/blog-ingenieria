---
status: accepted
product: cosmos
date: 2026-02-27
decision_makers: [equipo-plataforma]
consulted: []
informed: []
title: "Documentar decisiones de arquitectura con ADRs"
tags: [proceso, documentación, arquitectura]
excerpt: "Adoptar Architecture Decision Records (ADRs) como mecanismo estándar para documentar decisiones de arquitectura del equipo."
---

## Contexto

A medida que el equipo crece y los productos evolucionan, las decisiones de arquitectura se pierden en conversaciones de Slack, reuniones o la memoria de quienes participaron. Esto genera problemas recurrentes: nuevos integrantes no entienden por qué se tomaron ciertas decisiones, se repiten discusiones ya resueltas, y equipos diferentes llegan a soluciones contradictorias para el mismo problema.

Necesitamos un mecanismo ligero para capturar decisiones de arquitectura que sea fácil de escribir, fácil de encontrar y que sobreviva la rotación de personas.

> ¿Cómo debemos documentar las decisiones de arquitectura del equipo para preservar el contexto y las razones detrás de cada decisión?

## Opciones evaluadas

### Opción 1 — No documentar (status quo)

Las decisiones se comunican verbalmente o quedan implícitas en el código.

**Ventajas:**

- Cero fricción, no requiere esfuerzo adicional

**Desventajas:**

- El conocimiento se pierde con la rotación de personas
- Se repiten discusiones ya resueltas
- Difícil de hacer onboarding efectivo
- No hay trazabilidad de por qué el sistema es como es

### Opción 2 — Documentos extensos en wiki (Confluence, Notion)

Crear documentos de diseño detallados en una plataforma de documentación.

**Ventajas:**

- Permite capturar mucho detalle y contexto
- Herramientas de colaboración (comentarios, edición simultánea)

**Desventajas:**

- Alta fricción: documentos largos desincentivan la escritura y la lectura
- Se desactualizan rápidamente y nadie los mantiene
- Separados del código, se vuelven difíciles de encontrar
- Requieren una estructura organizativa que también hay que mantener

### Opción 3 — Architecture Decision Records (ADRs) en el repositorio

Documentos cortos en Markdown, almacenados junto al código, con una estructura fija y minimalista: Contexto, Opciones, Decisión, Consecuencias.

**Ventajas:**

- Baja fricción: documentos cortos con estructura predefinida
- Viven en el repositorio, versionados con Git junto al código
- Inmutables por diseño: cada ADR es una "cápsula de conocimiento" de un momento en el tiempo, no requiere mantenimiento continuo
- Facilitan el onboarding: un nuevo integrante puede leer el historial de decisiones
- Amplio respaldo de la industria: [ThoughtWorks lo coloca en Adopt](https://www.thoughtworks.com/radar/techniques/lightweight-architecture-decision-records), [AWS](https://docs.aws.amazon.com/prescriptive-guidance/latest/architectural-decision-records/adr-process.html) y [Microsoft](https://learn.microsoft.com/en-us/azure/well-architected/architect-role/architecture-decision-record) lo recomiendan en sus guías de arquitectura

**Desventajas:**

- Requiere disciplina del equipo para escribirlos consistentemente
- No reemplazan discusiones de diseño más amplias (RFCs, spikes)

## Decisión

Adoptamos Architecture Decision Records almacenados en el repositorio del blog de ingeniería, siguiendo una [plantilla ligera]({{ '/adrs/0000-adr-template/' | relative_url }}) basada en el [formato original de Michael Nygard](https://www.cognitect.com/blog/2011/11/15/documenting-architecture-decisions). Cada ADR es un archivo Markdown con 4 secciones: Contexto, Opciones evaluadas, Decisión y Consecuencias.

Elegimos esta opción porque ofrece el mejor balance entre capturar conocimiento valioso y minimizar la fricción de escritura. Los documentos extensos no se escriben ni se leen; la ausencia de documentación genera costos ocultos en decisiones duplicadas y onboarding lento.

## Consecuencias

- ✅ Las decisiones de arquitectura quedan documentadas con su contexto y justificación
- ✅ Nuevos integrantes pueden entender el "por qué" del sistema leyendo el historial de ADRs
- ✅ Se reduce la repetición de discusiones ya resueltas
- ✅ La plantilla minimalista mantiene la barrera de entrada baja
- ⚠️ El equipo necesita crear el hábito de escribir un ADR cuando se toma una decisión significativa
- ⚠️ Los ADRs no reemplazan la necesidad de discusiones de diseño para decisiones complejas

## Referencias

- [Documenting Architecture Decisions — Michael Nygard](https://www.cognitect.com/blog/2011/11/15/documenting-architecture-decisions) — propuesta original del formato ADR ligero
- [Lightweight Architecture Decision Records — ThoughtWorks Technology Radar](https://www.thoughtworks.com/radar/techniques/lightweight-architecture-decision-records) — recomendación de adopción por ThoughtWorks
- [ADR Process — AWS Prescriptive Guidance](https://docs.aws.amazon.com/prescriptive-guidance/latest/architectural-decision-records/adr-process.html) — guía de AWS para implementar ADRs
- [Architecture Decision Record — Microsoft Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/architect-role/architecture-decision-record) — guía de Microsoft para ADRs
