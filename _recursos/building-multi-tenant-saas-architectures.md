---
title: "Building Multi-Tenant SaaS Architectures: Principles, Practices, and Patterns Using AWS"
date: 2026-02-25
tipo: libro
layout: recurso-libro
libro:
  autores:
    - "Tod Golding"
  editorial: "O'Reilly Media"
  anio: 2024
  isbn: "9781098140649"
  portada: /assets/img/recursos/building-multi-tenant-saas-architectures/cover.jpg
capitulos:
  - numero: 1
    titulo: "The SaaS Mindset"
    excerpt: "Introduce el pensamiento SaaS: por qué los modelos tradicionales no escalan y cómo el enfoque multi-tenant transforma la forma de construir y operar software."
    pdf: cap-01-the-saas-mindset.pdf
    resumido_por: [augusto]
  - numero: 2
    titulo: "Multi-Tenant Architecture Fundamentals"
    excerpt: "Explora los conceptos fundamentales de la arquitectura multi-tenant, incluyendo los modelos de aislamiento y las implicaciones de compartir infraestructura entre múltiples clientes."
    pdf: cap-02-multi-tenant-architecture-fundamentals.pdf
    resumido_por: [augusto]
  - numero: 3
    titulo: "Multi-tenant Deployment Models"
    excerpt: "Analiza los modelos de despliegue para sistemas multi-tenant —silo, pool y bridge— con sus ventajas, desventajas y criterios para elegir entre ellos."
    pdf: cap-03-multi-tenant-deployment-models.pdf
    resumido_por: [augusto]
  - numero: 4
    titulo: "Onboarding and Identity"
    excerpt: "Describe cómo gestionar el proceso de incorporación de nuevos tenants y cómo manejar la identidad de usuarios en el contexto de un sistema multi-tenant."
    pdf: cap-04-onboarding-and-identity.pdf
    resumido_por: [augusto]
  - numero: 5
    titulo: "Tenant Management"
    excerpt: "Cubre las estrategias para gestionar el ciclo de vida de los tenants: aprovisionamiento, configuración, actualización y eliminación de forma controlada."
    pdf: cap-05-tenant-management.pdf
    resumido_por: [augusto]
  - numero: 6
    titulo: "Tenant Authentication and Routing"
    excerpt: "Explica cómo autenticar usuarios en el contexto de un tenant específico y cómo enrutar las solicitudes hacia los recursos correctos según el tenant activo."
    pdf: cap-06-tenant-authentication-and-routing.pdf
    resumido_por: [augusto]
  - numero: 7
    titulo: "Building Multi-tenant Services"
    excerpt: "Presenta patrones para diseñar servicios que operen eficientemente en entornos multi-tenant, gestionando el contexto de tenant y el acceso a recursos compartidos."
    pdf: cap-07-building-multi-tenant-services.pdf
    resumido_por: [augusto]
  - numero: 8
    titulo: "Data Partitioning"
    excerpt: "Analiza las estrategias de particionamiento de datos para separar y aislar la información de cada tenant en la capa de persistencia."
    pdf: cap-08-data-partitioning.pdf
    resumido_por: [augusto]
  - numero: 9
    titulo: "Tenant Isolation"
    excerpt: "Profundiza en los mecanismos técnicos para garantizar que los recursos y datos de un tenant no sean accesibles por otros, tanto en cómputo como en almacenamiento."
    pdf: cap-09-tenant-isolation.pdf
    resumido_por: [augusto]
  - numero: 11
    titulo: "Serverless SaaS: Architecture Patterns and Strategies"
    excerpt: "Explora cómo el modelo serverless se alinea con los requerimientos de una arquitectura SaaS, con patrones específicos para Functions as a Service en contextos multi-tenant."
    pdf: cap-11-serverless-saas-architecture-patterns-and-strategies.pdf
    resumido_por: [augusto]
resumido_por: [augusto]
tags: [arquitectura, saas, multi-tenancy]
excerpt: "Guía práctica de Tod Golding, SaaS lead de AWS, que aborda los principios, patrones y estrategias arquitectónicas para construir plataformas de software multi-tenant en la nube. Cubre temas esenciales como el aislamiento de tenants, la partición de datos, el onboarding y el diseño de microservicios en contextos SaaS."
---

Cuando comenzamos a documentar nuestros ADR, iniciamos por la decisión de ser un SaaS multitenancy. Encontramos este libro como guía metodológica y de producto, para entender y planear la construcción de la plataforma del proyecto Cosmos. 

Este libro nos enseñó los conceptos de Control Plane y Application plane, además de las implicaciones técnicas y empresariales de ofrecer un Software as a Service.
