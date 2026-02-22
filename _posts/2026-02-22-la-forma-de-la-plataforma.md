---
title: "La forma de la plataforma"
date: 2026-02-22
categories: [plataforma, arquitectura]
author: augusto
tags: []
excerpt: "Cómo el libro de Tod Golding nos dio el vocabulario para diseñar Cosmos: un SaaS Multi-tenant construido sobre un Control Plane que unifica onboarding, identidad, aprovisionamiento y facturación."
image:
  path: /assets/img/la-forma-de-la-plataforma/la-forma-de-la-plataforma.png
  alt: "La forma de la plataforma: Control Plane y Application Plane de Cosmos"
---
Documentar nunca ha sido el fuerte de los ingenieros de software, y menos desde el momento en que el manifiesto ágil enunció: "Software funcionando sobre documentación extensiva". Este punto, además de ser un llamado a la acción, también nos dio la excusa para evitar la documentación a lo largo del proyecto.

En Cosmos consideramos que la documentación sí tiene valor. No la documentación detallada de la arquitectura como paso previo al desarrollo, sino la documentación que nos permita entender en el tiempo por qué tomamos ciertas decisiones.

Habíamos iniciado el proyecto documentando ADR (Architecture Decision Record). La primera decisión de arquitectura que documentamos fue el modelo de Multi-tenancy en la capa de datos que iba a ser utilizado para el proyecto.

Pero después de terminar no nos sentimos cómodos con los términos que escogimos para describir el multi-tenancy. Al no tener un vocabulario especializado, nuestras posibilidades se limitaron. De ahí nació la necesidad de investigar cómo podemos hablar de Multi-tenancy.

## ¿Cómo son las arquitecturas multi-tenant?

Revisamos en la literatura y encontramos el libro *Building Multi-Tenant SaaS Architectures* de Tod Golding. Desde el prefacio ya se evidencia la complejidad del tema y que estamos hablando de un tema que aún no está maduro.

> The lack of absolutes has created lots of room for competing definitions and opinions about what SaaS is meant to look like.

Para hablar de multi-tenancy es imperativo que se haya tomado una decisión previa y esta es que vamos a construir un *Software as a Service (SaaS)*. En la industria todavía no existe un consenso de qué significa SaaS, a pesar de que ya existan varias implementaciones distintas en el mercado.

El campo de las SaaS está en continua evolución. Desde un simple concepto de tener muchos clientes compartiendo una aplicación con una base de datos separada por cliente, hasta las posibilidades que nos abrió la computación en la nube en donde una infinidad de modelos de multi-tenancy pueden ser implementados a todo nivel.

La conversación de crear un *SaaS Multi-tenant* ahora es mucho más interesante. Las arquitecturas se enriquecen porque las herramientas disponibles proveen muchas más posibilidades y, por lo tanto, estamos obligados a tomar más decisiones.

Obviamente, esto no es solo una cuestión técnica. La evolución de las arquitecturas SaaS también les han dado a los usuarios posibilidades distintas como:

- Autoaprovisionar su software
- Determinar el plan que desea
- Pagar solo por lo que consume
- Usar en minutos el software

Sin dudarlo, estas son expectativas de nuestros usuarios que debemos tener en cuenta con respecto al servicio que debe entregar nuestro proyecto.

## Time to value

>¿Cuánto tiempo necesita un cliente desde el momento de la firma del contrato hasta la generación de valor tangible por el uso de la oferta SaaS?

Minimizar el *time to value* debe ser uno de los objetivos fundamentales de nuestra oferta de valor. Nadie quiere pagar y esperar meses para hacer uso del servicio. Esto es algo inquietante en las compras de vehículos. Hay personas que compran un carro, desembolsan dinero y esperan meses a que el concesionario se lo entregue.

De pronto el mercado ha normalizado la práctica y los compradores de carros se hayan resignado a que así es como se compran. No muy distinta ha sido la percepción de compra de software empresarial como los ERP. Las ofertas exigen planes de meses para que el cliente pueda hacer au uso, que no solo incluyen la capacitación del producto, sino que viene acompañado con técnicas de cambio cultural de largo aliento.

El acceso a las tecnologías deben darnos a los que deseamos ofrecer un SaaS en 2026 a combatir esta idea. Uno de nuestros indicadores de mejora continua debe ser minimizar el *time to value* de las empresas que adquieran un ERP.


## ¿Cuál es la plataforma que queremos construir para el proyecto Cosmos?

No confundamos la **plataforma de Cosmos** con el equipo de plataforma. La plataforma de Cosmos es un producto de software que habilita muchos servicios de aplicación para que sean un *SaaS Multi-tenant*. 

Esta plataforma nos permitirá ofrecer una experiencia unificada a todos los clientes con respecto a: registrarse dentro del producto, autenticarse, administrar accesos, solicitar nuevos productos, y administrar su facturación, entre otros.

Vamos a usar la arquitectura de referencia de Golding para diseñar el proyecto Cosmos. En esta arquitectura hay dos grandes partes:

- **Control Plane:** El cual es la aplicación que se comporta como la capa inferior de Cosmos sobre la cual se construyen las distintas aplicaciones.
- **Application Plane:** Que son todas las aplicaciones ofrecidas dentro de la solución a los usuarios.

![Application plane y Control Plane]({{ site.baseurl }}/assets/img/la-forma-de-la-plataforma/application-plane-control-plane.png)
_Application Plane y Control Plane: Tomada de Building Multi-Tenant SaaS Architectures_

## Control Plane de Cosmos

Como se puede ver en la gráfica, a la derecha se encuentra el *Control Plane*. Este es el proyecto de software del equipo de plataforma.

El *Control Plane* es altamente responsable de brindar a los usuarios la **experiencia del SaaS**.

Pensar en una experiencia es expandir la visión del proyecto, de una aplicación funcional a un servicio. Los servicios deben pensar en todos los detalles, desde la experiencia de adquisición, la habilitación, facturación, hasta la posibilidad de ver el estado de salud de la aplicación.

Un *SaaS* implica que todos los procesos de nuestra empresa deben estar profundamente relacionados con el producto que ofrecemos. El producto modela la organización y nuestros procesos amplifican el producto.

Repasemos los servicios internos del *Control Plane*:

### Onboarding

Es la puerta de entrada de un cliente a nuestro producto. Podría ser de autoservicio o administrado internamente. Para el modelo inicial, tenemos pensado que sea administrado por nosotros, dejarlo como autoservicio es una etapa posterior apalancada por la madurez de nuestro proceso.

El *onboarding* es el proceso por el cual se recibe un nuevo tenant a nuestra aplicación. El *tenant* va a ser nuestra unidad de aislamiento operativo. Es el que va a definir los límites en los que se encapsulan las transacciones.

Puede darse el caso en que se administren varios *tenants* a la vez, como puede ser en el servicio de facturación, en el cual se desee englobar en una sola la factura distintos *tenants*. Pero estas capas se deben modelar por encima de la construcción de cada *tenant*.

### Tenant Manager

Este servicio es el que administra el ciclo de vida del *tenant*. El onboarding da vida a un nuevo tenant, pero en el tiempo su estado puede cambiar:

- Registrado: tan pronto se hace la solicitud de creación.
- Activado: el proceso de aprovisionamiento ha terminado y el *tenant* está disponible para ser usado por los clientes.
- Suspendido: el cliente decide dejar de usar el servicio o por problemas de cartera se suspende esperando el pago.
- Inactivo: Alguna de las partes decide que es servicio sea terminado definitivamente.
- Destruido: Se ha solicitado que la información del *tenant* sea eliminada del sistema.

Cada uno de estos estados implicará acciones en toda la aplicación, las cuales deben ser administradas desde el *Control Plane* y ejecutadas dentro de los distintos servicios del *Application Plane*.

### Tenant provisioning

Este servicio es el puente entre el *Control Plane* y el *Application Plane*. Cuando un *tenant* solicita una aplicación, ya sea en el onboarding o durante su vida activa, el *Control Plane* debe solicitar la activación del tenant en una o varias aplicaciones.

Esta activación puede ser tan sencilla como crear un registro dentro de una tabla del servicio, hasta realizar el despliegue de infraestructura propia del *tenant* si el modelo de *multi-tenancy* solicitado así lo determina.

También es el encargado de la inactivación de un *tenant* o la destrucción de un *tenant* que estaba activo.

### Identity

Este servicio es el encargado de proveer al *Application Plane* la forma de identificar quién es el dueño de una petición, a qué tenant tiene acceso y qué acciones puede realizar ese tenant dentro de la aplicación (autorización).

Es uno de los servicios más delicados. Una de las mayores responsabilidades de un *SaaS multi-tenant* es garantizar el aislamiento de los datos y para ello se tienen que desarrollar los artefactos, tanto dentro del *Control Plane* como en el *Application Plane*, para que se garantice en todo momento esta independencia.

### Admin user management

El enfoque de este proceso dentro del *Control Plane* es principalmente la administración de los usuarios administradores. Entendiendo que son ellos los perfiles más poderosos que tendrán los *tenants* para realizar las operaciones.

El *Control Plane* también podría admisnitrar a todos los demás usuarios, no solamente los administradores. Lo que hay que tener en cuenta es que estos últimos deben tener un manejo especial debido a los poderes que tendrán sobre la aplicación.

### Metrics

En los *SaaS multi-tenant* el monitoreo de la aplicación es fundamental para el servicio. Tanto la identificación de errores, como los patrones de uso de cada *tenant*, así como el estado de la aplicación a nivel general deben ser fácilmente accesibles para las personas de desarrollo, soporte e incluso a los usuarios de la aplicación.

El sistema de recolección de información en forma de logs, trazas y métricas es la construcción de un producto de información con el cual se deben tomar las decisiones de producto.

Estas decisiones pueden apalancar: los distintos planes de facturación, ayudar a tomar decisiones de aprovisionamiento de infraestructura, ya sea por escalado vertical, horizontal o incluso la creación de servicios en silo por *tenant*.

A nivel de usuario, información del estado de salud del servicio es importante para mantenerlo informado de posibles momentos en los que el servicio esté degradado y la posibilidad de ser informado cuando el servicio vuelva a la normalidad.

### Facturación

Un *tenant* contrata servicios y estos pueden tener distintas métricas de cobro, ya sean por uso o por asignación de cuotas y recursos, dependiendo del plan (tier) contratado.

Las capacidades de adquisición o actualización de los planes deben estar sincronizadas con los cobros del servicio. Es responsabilidad del *Control Plane* sincronizar el servicio y el valor a facturar.

El *Control Plane* no provee un sistema de facturación, es el intermediario para poder entregar la información calculada de los conceptos y valores a facturar al sistema contable encargado.

El *Control Plane* también puede tener el rol de evaluar la cartera con el fin de suspender el servicio de los *tenants* que no hayan realizado el pago oportuno, así como la reactivación cuando el pago haya sido realizado. Es en este servicio donde debemos hacer las conexiones con los sistemas pertinentes para monitorear los cambios en la cartera.

## Comparativo: la evolución del Control Plane en Sincosoft

Para dimensionar lo que significa construir un *Control Plane* real, vale la pena mirar hacia atrás. Sincosoft ha tenido productos previos que, en distintos grados, han tenido que resolver los mismos problemas que hoy abordamos con Cosmos. Cada uno representa una generación distinta en la madurez del servicio.

> ✅ Cumplida a cabalidad  🔶 Cumplida a medias ❌ No cumplida

| Característica | SincoERP | Bitákora | Cosmos (esperado) |
|:---|:---|:---|:---|
| **Time to value** | ❌ ~ 3 meses | ✅  ~ 4 días | ✅ |
| **Onboarding** | ❌ equipo dedicado | 🔶 Solo licencia. | ✅ internamente |
| **Modelo Multi-tenant** | ❌ Aplicación y BD por tenant | ✅ para un solo producto | ✅ multiproducto |
| **Tenant Manager** | ❌ | 🔶 No hay destrucción | ✅ |
| **Tenant Provisioning** | ❌ | 🔶 Falta BD independiente | ✅ |
| **Identity y aislamiento de datos** | ✅ silos | ✅ usuario direcciona al tenant | ✅ por subdominio? |
| **Admin User Management** | 🔶 no centralizado | ✅ | ✅ |
| **Metrics y Observabilidad** | ❌ mediado por el equipo| 🔶 disponible para desarrollo | ✅ |
| **Facturación integrada** | ❌ | ❌ | ✅ |



## Building Multi-Tenant SaaS Architectures

El libro de Tod Golding va a ser nuestra guía de ruta para la construcción del proyecto Cosmos. En él encontramos un camino, basado en la experiencia que tuvo y la investigación de muchos otros SaaS construidos al largo del tiempo.

En ese libro hemos encontrado los distintos retos y posibilidades para la toma de decisiones de arquitectura para nuestro nuevo proyecto.

Compartimos con ustedes este [resumen traducido al español]({{ site.baseurl }}/assets/docs/fundamentos-de-arquitectura-multi-tenant.pdf) del capítulo *Multi-tenant Architecture Fundamentals*, donde podrán ahondar en lo que significa la incorporación del multi-tenancy a un producto y cada uno de los subsistemas del *Control Plane*. **Todos los créditos de ese contenido son de Tod Golding.**

---

## Referencias

- Golding, Tod. *Building Multi-Tenant SaaS Architectures*. O'Reilly Media, 2024.

- Beck, Kent, et al. *Manifesto for Agile Software Development*. 2001. [https://agilemanifesto.org](https://agilemanifesto.org)

- Nygard, Michael. "Documenting Architecture Decisions". *Cognitect Blog*, 2011. [https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions)