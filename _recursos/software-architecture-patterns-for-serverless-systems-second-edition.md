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
    pdf: cap-01-architecting-for-innovation.pdf
    resumido_por: [augusto]
  - numero: 2
    titulo: "Defining Boundaries and Letting Go"
    pdf: cap-02-defining-boundaries-and-letting-go.pdf
    resumido_por: [augusto]
  - numero: 3
    titulo: "Taming the Presentation Tier"
    pdf: cap-03-taming-the-presentation-tier.pdf
    resumido_por: [augusto]
resumido_por: [augusto]
tags: [arquitectura, serverless]
excerpt: "Guía práctica para diseñar sistemas serverless escalables y resilientes usando microservicios orientados a eventos y micro frontends. Abarca patrones de arquitectura, despliegue multi-región, observabilidad y seguridad en entornos cloud."
---

A partir de la lectura de Building Multi-Tenant SaaS Architectures, el autor propone que el modelo serverless es apropiado para este tipo de arquitecturas.

Cuando construimos Bitákora, lo hicimos creando microservicios alojados en contenedores y orquestados en un Docker-swarm. Nuestra experiencia en Serverless se limitaba a crear una función para realizar la evaluación de un documento o una foto y determinar si era una incapacidad y obtener los datos para crear automáticamente un registro.

Tomar la decisión de crear una arquitectura Serverless sin experiencia previa nos exige estudiar y aprender de este tipo de arquitecturas. Nos apoyaremos en este libro para entender los patrones de diseño y las bondades y limitaciones de los Funtions as a Service (FaaS) para hacer los experimentos de desarrollo en el Control Plane y posiblemente para los nuevos productos montados en el Application Plane.
