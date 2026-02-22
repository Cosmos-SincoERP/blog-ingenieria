---
title: "Los primeros pasos del equipo de plataforma de Cosmos"
date: 2026-02-17
categories: [plataforma, arquitectura]
tags: []
author: augusto
excerpt: "Cuando todo está por hacerse, encontrar el rumbo no es fácil. Compartimos cómo el Blueprint de capas inteligentes, Team Topologies y los ADR nos ayudaron a dar los primeros pasos como equipo de plataforma en Cosmos."
---

No fue fácil encontrar el rumbo para enfocar los esfuerzos del equipo. En un escenario donde todo está por hacerse, es abrumador enfrentarse a empezar y sentir que se va por el camino correcto.

## Blueprint de capas inteligentes

El punto de partida fue la propuesta de ideación de producto realizada por el equipo de diseño Atom, liderado por Carlos Cipagauta.

La propuesta del [Blueprint de capas inteligentes](https://hue-manor-65432723.figma.site/) referencia a las capacidades que se deben observar al momento de idear un producto, en donde la inteligencia de la aplicación se perciba en cada acción, más que en una simple promesa de *inteligencia artificial*.

En palabras de Carlos, "Los productos que verdaderamente hacen uso de la inteligencia artificial, no proclaman que usan inteligencia artificial, nosotros como usuarios simplemente la disfrutamos."

Nos puso el ejemplo de las recomendaciones de Spotify, o las sugerencias de Uber o Waze. Estos productos no hablan de IA, la aplican.

El *Blueprint* exige un trabajo de ingeniería muy exigente. Es dejar de pensar las aplicaciones empresariales como CRUD y procesos, para anteponerles muchas otras capas que buscan explotar la productividad del usuario en sus procesos diarios.

## Las implicaciones del Blueprint para el área de ingeniería de Cosmos

La invitación es que exploren el Blueprint primero. Revisen las capas y evidenciarán las complejidades a las que un equipo de ingeniería se enfrenta para hacer realidad la propuesta.

El primer llamado que tuvimos fue determinar qué infraestructura podría necesitar una aplicación que pueda proveer esas capacidades, tanto a los usuarios como a los desarrolladores.

El enfoque en los desarrolladores es muy importante, porque es necesario tomar muchas decisiones de arquitectura y diseño detallado para resolver cada una de las capas.

El riesgo es que cada equipo de producto resuelva a su parecer cada caso y terminaríamos con una solución distinta al mismo problema por cada uno de los equipos.

Este escenario no es nuevo en Sincosoft. Si revisamos problemas comunes entre los equipos de Sinco ERP, encontramos este escenario múltiples veces: enviar un correo electrónico, generar un PDF, conectarse a un servicio externo, crear un reporte... Cada caso está resuelto de distintas formas dentro de la aplicación, y no siempre con un buen diseño.

## El equipo de plataforma según Team Topologies

Los retos mencionados anteriormente fueron los que nos llevaron a pensar que una parte del equipo de Cosmos debería comportarse como un equipo de plataforma.

Este tipo de equipos es descrito por Matthew Skelton y Manuel Pais en el libro *Team Topologies: Organizing Business and Technology Teams for Fast Flow*.

Los autores enuncian que el propósito del equipo de plataforma es:

> Habilitar a los *stream-aligned teams* a entregar su trabajo con amplia autonomía ... El equipo de plataforma provee servicios internos para reducir la carga cognitiva que requerirían los equipos *stream-aligned* para desarrollar estos servicios.

El equipo de plataforma debe proveer sus servicios habilitando mecanismos para que los desarrolladores puedan consumirlos mediante autoservicio, porque la intención es que sean fáciles de usar.

## Primera iniciativa del equipo de plataforma de Cosmos

Volviendo al *Blueprint de capas inteligentes*, revisamos cada capa y determinamos qué posibles capacidades podrían ser necesarias para habilitar cada una de ellas.

Es un inventario bastante amplio, el cual está referenciado en el documento [Blueprint de capas inteligentes - Revisión de tecnologías]({{ site.baseurl }}/assets/docs/blueprint-de-capas-inteligentes-revision-de-tecnologias.pdf).

En algunos puntos el inventario hace más referencia a tecnologías puntuales que a necesidades. Esto no fue de nuestro agrado porque imprime un sesgo tecnológico, basado en nuestra experiencia previa, más que una invitación a la exploración.

## ¿Y si creamos un listado de ADR?

Michael Nygard considera importante que en los proyectos de software exista un registro donde podamos referirnos a las *decisiones de arquitectura significativas*, entender por qué fueron tomadas y, si deseamos cambiarlas, no hacerlo ciegamente.

El término ADR (Architecture Decision Record) es acuñado en el artículo [Documenting Architecture Decisions](https://www.cognitect.com/blog/2011/11/15/documenting-architecture-decisions?utm_source=chatgpt.com) como una forma ligera de registro que debería vivir al lado del código fuente.

Los ADR son documentación de referencia, que debería estar viva y evolucionar, no es una prescripción, es la forma de evidenciar el contexto en el que se tomó una decisión, con el fin de comprender y replantearla si el nuevo contexto lo amerita.

Nos pareció una buena idea, que como equipo documentemos nuestras decisiones y construyamos esa historia. También este blog es un intento para preservar la historia del proyecto, el valor de estos esfuerzos se ve a largo plazo.

El primer ADR documentado fue [Estrategia de multitenancy a nivel de aislamiento de datos]({{ site.baseurl }}/assets/docs/aislamiento-de-datos-multitenancy.pdf). Este documento nos costó bastante tiempo definirlo y aunque habíamos revisado los distintos escenarios, sentimos que estábamos improvisando sobre este tema.

## ¿Qué es multi-tenancy?

Esta fue la pregunta que quedó en el aire. Lo único que sabíamos era cómo se había aplicado el multi-tenancy en Sinco ERP y cómo se aplicó en Bitákora.

Obviamente el modelo de Bitákora, en donde la aplicación es compartida por todos los tenants y hay bases de datos compartidas y otras aisladas por tenant era el que más nos atraía.

Pero nuestra experiencia no da para saber todas las posibilidades existentes en este tema.

Esta fue la invitación implícita a la investigación de cómo se diseña un SaaS Multitenant para B2B. Esto será explicado en otro post.

## Conclusión

Encontrar por dónde empezar fue un ejercicio de honestidad. Reconocer que no teníamos todas las respuestas nos permitió buscar marcos de referencia que nos dieran estructura sin quitarnos flexibilidad.

El *Blueprint de capas inteligentes* nos mostró la magnitud del reto. *Team Topologies* nos dio un nombre y un propósito claro para el rol que necesitábamos asumir. Los ADR nos dieron una forma de documentar decisiones sin caer en la parálisis de la documentación excesiva.


## Referencias

- Blueprint de capas inteligentes — Propuesta de ideación de producto del equipo Atom: [https://hue-manor-65432723.figma.site/](https://hue-manor-65432723.figma.site/)
- Skelton, M. & Pais, M. (2019). *Team Topologies: Organizing Business and Technology Teams for Fast Flow*. IT Revolution Press.
- Nygard, M. (2011). Documenting Architecture Decisions: [https://www.cognitect.com/blog/2011/11/15/documenting-architecture-decisions](https://www.cognitect.com/blog/2011/11/15/documenting-architecture-decisions)
