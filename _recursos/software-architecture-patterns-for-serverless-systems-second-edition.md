---
title: "Software Architecture Patterns for Serverless Systems - Second Edition"
date: 2026-02-26
tipo: libro
layout: recurso-libro
libro:
  autores:
    - "John Gilbert"
  editorial: "Packt Publishing"
  anio: 2024
  isbn: "9781803235448"
  portada: /assets/img/recursos/software-architecture-patterns-for-serverless-systems-second-edition/cover.jpg
capitulos:
  - numero: 1
    titulo: "Architecting for Innovation"
    excerpt: "Introduce los principios de diseño para sistemas serverless, resaltando la importancia del event-driven design y la agilidad para innovar sin fricción operacional."
    pdf: cap-01-architecting-for-innovation.pdf
    resumido_por: [augusto]
  - numero: 2
    titulo: "Defining Boundaries and Letting Go"
    excerpt: "Explica cómo identificar y definir los límites correctos entre microservicios usando Domain-Driven Design, aplicando el principio de responsabilidad única a nivel arquitectónico."
    pdf: cap-02-defining-boundaries-and-letting-go.pdf
    resumido_por: [augusto]
  - numero: 3
    titulo: "Taming the Presentation Tier"
    excerpt: "Aborda el diseño de micro frontends y cómo estructurar la capa de presentación en sistemas distribuidos para mantener la independencia entre equipos de desarrollo."
    pdf: cap-03-taming-the-presentation-tier.pdf
    resumido_por: [augusto]
  - numero: 4
    titulo: "Trusting Facts and Eventual Consistency"
    excerpt: "Examina el modelo de consistencia eventual en sistemas distribuidos, el uso de eventos como hechos inmutables y cómo diseñar servicios que toleren la asincronía."
    pdf: cap-04-trusting-facts-and-eventual-consistency.pdf
    resumido_por: [augusto]
  - numero: 5
    titulo: "Turning the Cloud into the Database"
    excerpt: "Propone aprovechar los servicios cloud nativos (DynamoDB, S3, etc.) como capa de persistencia, eliminando la necesidad de gestionar bases de datos relacionales tradicionales."
    pdf: cap-05-turning-the-cloud-into-the-database.pdf
    resumido_por: [augusto]
  - numero: 6
    titulo: "A Best Friend for the Frontend"
    excerpt: "Los servicios Backend for Frontend (BFF) se diseñan alrededor de las actividades de los usuarios finales, otorgando a cada actividad su propio servicio autónomo con almacén de datos dedicado, funciones de comando, consulta, escucha y disparo. Se fragmenta la responsabilidad para que cada equipo sea dueño tanto del frontend como del backend, eliminando dependencias síncronas mediante vistas materializadas y eventos de dominio, y estructurando internamente cada función con una nano arquitectura hexagonal. Según la fase del ciclo de vida de los datos, se aplican variantes especializadas del patrón BFF —CRUD, lista de valores, tareas, búsqueda, acciones, dashboards, reportes y archivo— cada una optimizada para su patrón de acceso específico."
    pdf: cap-06-a-best-friend-for-the-frontend.pdf
    resumido_por: [augusto]
resumido_por: [augusto]
tags: [arquitectura, serverless]
excerpt: "Guía práctica para diseñar sistemas serverless escalables y resilientes usando microservicios orientados a eventos y micro frontends. Abarca patrones de arquitectura, despliegue multi-región, observabilidad y seguridad en entornos cloud."
---

A partir de la lectura de Building Multi-Tenant SaaS Architectures, el autor propone que el modelo serverless es apropiado para este tipo de arquitecturas.

Cuando construimos Bitákora, lo hicimos creando microservicios alojados en contenedores y orquestados en un Docker-swarm. Nuestra experiencia en Serverless se limitaba a crear una función para realizar la evaluación de un documento o una foto y determinar si era una incapacidad y obtener los datos para crear automáticamente un registro.

Tomar la decisión de crear una arquitectura Serverless sin experiencia previa nos exige estudiar y aprender de este tipo de arquitecturas. Nos apoyaremos en este libro para entender los patrones de diseño y las bondades y limitaciones de los Funtions as a Service (FaaS) para hacer los experimentos de desarrollo en el Control Plane y posiblemente para los nuevos productos montados en el Application Plane.
