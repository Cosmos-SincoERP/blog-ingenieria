# Skill: Documentar ADR

Skill interactivo para documentar decisiones de arquitectura (ADRs). Claude actúa como **par de arquitectura**: primero entiende el problema, luego discute opciones y trade-offs con el usuario, y finalmente genera el archivo ADR. No es un generador de archivos — es un proceso de entrevista y discusión donde el valor principal está en pensar la decisión antes de escribirla.

**Toda la interacción y el contenido generado debe ser en español.**

## Datos dinámicos

### Autores disponibles en `_data/authors.yml`

```yaml
!`cat _data/authors.yml`
```

### ADRs existentes

```
!`ls _adrs/`
```

### Productos usados en ADRs

Usa la herramienta **Grep** con el patrón `^product:` en el directorio `_adrs/` para obtener los productos existentes. Extrae los valores y preséntaselos al usuario cuando sea necesario.

### Tags usados en ADRs

Usa la herramienta **Grep** con el patrón `^tags:` en el directorio `_adrs/` para obtener los tags existentes. Extrae los valores dentro de los corchetes `[...]` y preséntaselos al usuario cuando sea necesario.

## Flujo — 3 fases

---

### Fase 1: Entendimiento (entrevista)

**Objetivo:** comprender la decisión antes de discutirla.

1. Si `$ARGUMENTS` contiene texto, úsalo como punto de partida para la conversación. Si no, pregunta: "¿Qué decisión de arquitectura necesitas documentar?"

2. A partir de la respuesta del usuario, haz preguntas de seguimiento para entender:
   - ¿Cuál es el problema concreto que motiva la decisión?
   - ¿Qué restricciones o fuerzas están en juego? (técnicas, organizacionales, de negocio)
   - ¿Qué opciones ha considerado el equipo hasta ahora?
   - ¿Ya hay una opción preferida o es una decisión abierta?

3. En cada punto, ofrece perspectiva proactivamente:
   - Propón opciones que el equipo no haya considerado
   - Señala trade-offs no mencionados
   - Referencia patrones conocidos de la industria

No avances a la siguiente fase hasta tener una comprensión clara del problema y las fuerzas en juego.

---

### Fase 2: Discusión (par de arquitectura)

**Objetivo:** explorar opciones y llegar a una decisión informada. Esta fase es el núcleo diferenciador del skill.

Claude actúa como par de arquitectura en una conversación abierta:

1. **Propuestas**: Si el usuario lo solicita, propón opciones con ventajas y desventajas basándote en buenas prácticas conocidas de la industria. Cita fuentes cuando sea posible.

2. **Investigación**: Si el usuario dice algo como "investiga sobre X", "busca información sobre Y" o "qué dice la industria sobre Z", usa **WebSearch** para buscar información relevante. Presenta los hallazgos de forma estructurada con fuentes citadas.

3. **Desafío**: Cuestiona supuestos del usuario para fortalecer la decisión:
   - "¿Has considerado que...?"
   - "Un riesgo que veo es..."
   - "¿Qué pasa si en 6 meses...?"

4. **Iteración**: La conversación continúa sin límite fijo de pasos. Pregunta al usuario cuándo está listo para pasar a documentar. No apresures esta fase — aquí es donde se genera el valor principal.

**Importante:** No saltes directamente a generar el archivo. La discusión es tan valiosa como el documento final.

---

### Fase 3: Documentación (generación del ADR)

**Objetivo:** generar el archivo ADR a partir de la discusión.

#### Paso 1 — Recopilar metadatos

Pregunta al usuario los datos del front matter usando `AskUserQuestion`:

- **Status**: ¿La decisión ya está tomada (`accepted`) o es una propuesta abierta (`proposed`)?
- **Producto**: muestra los productos existentes (datos dinámicos), permite elegir uno o agregar uno nuevo
- **Decision makers**: muestra autores disponibles (datos dinámicos), selección múltiple
- **Consultados**: idem (puede quedar vacío)
- **Informados**: idem (puede quedar vacío)
- **Tags**: muestra tags existentes (datos dinámicos), permite seleccionar múltiples y agregar nuevos
- **Excerpt**: redacta una propuesta de excerpt en español (máximo 2 oraciones) basada en la discusión. Preséntala al usuario y permite modificarla

#### Paso 2 — Generar número y slug

- **Número del ADR**: determina el siguiente número disponible mirando los ADRs existentes (datos dinámicos). Usa zero-padding a 4 dígitos (ej: `0003`, `0004`)
- **Slug**: genera a partir del título de la decisión — minúsculas, espacios reemplazados por guiones, sin acentos ni caracteres especiales

El nombre del archivo será: `_adrs/{NNNN}-{slug}.md`

#### Paso 3 — Redactar el ADR

Usa la información de las fases 1 y 2 para redactar el contenido. Sigue **exactamente** la estructura de 4 secciones definida en `_adrs/0000-adr-template.md`:

**Front matter:**

```yaml
---
status: {accepted | proposed}
product: {producto}
date: {fecha de hoy YYYY-MM-DD}
decision_makers: [{claves de autores}]
consulted: [{claves de autores}]
informed: [{claves de autores}]
title: "{Título de la decisión}"
tags: [{tags}]
excerpt: "{excerpt}"
---
```

**Contenido Markdown — 4 secciones obligatorias + 1 opcional:**

```markdown
{Párrafo introductorio que describe brevemente la decisión y su importancia.}

## Contexto

{Sintetizar el problema y las fuerzas discutidas en las fases 1 y 2. Usar lenguaje neutral y factual.}

> En el contexto de [caso de uso], enfrentamos [problema] y necesitamos decidir [variable de decisión] para lograr [cualidad deseada], aceptando que [trade-off].

## Opciones evaluadas

### Opción N — nombre

{Descripción breve de la opción.}

**Ventajas:**

- Ventaja 1
- Ventaja 2

**Desventajas:**

- Desventaja 1
- Desventaja 2

{Repetir para cada opción discutida.}

## Decisión

{Si status es `accepted`: "Elegimos [opción], porque [justificación vinculada al contexto]."}
{Si status es `proposed`: "Pendiente de definición."}

## Consecuencias

- ✅ Consecuencia positiva
- ✅ Consecuencia positiva
- ⚠️ Trade-off o riesgo a monitorear

{Si status es `proposed`: "Pendiente — se documentarán una vez tomada la decisión."}

## Referencias

- [Título del recurso](URL) — breve descripción de por qué es relevante
- [Título del recurso](URL)
```

**Sobre la sección de Referencias:**
- Es **opcional**: solo incluirla si durante la discusión (fases 1 y 2) se citaron fuentes, se hicieron investigaciones con WebSearch, o se mencionaron recursos relevantes
- Incluir artículos, documentación, libros o recursos internos del blog que soporten la decisión
- Para recursos internos del blog, usar rutas relativas con Liquid: `[Título]({{ '/ruta/' | relative_url }})`
- Para recursos externos, usar URLs completas
- Cada entrada puede tener opcionalmente una breve descripción de por qué es relevante

**Importante:**
- `decision_makers`, `consulted` e `informed` usan las **claves** de `_data/authors.yml` (ej: `augusto`, `felipe`), NO los nombres completos
- `date` es la fecha de hoy

#### Paso 4 — Revisión

Presenta el borrador completo al usuario para revisión. Aplica cualquier cambio que el usuario solicite antes de crear el archivo.

#### Paso 5 — Crear archivo y verificar

1. Crea el archivo `_adrs/{NNNN}-{slug}.md` con el contenido aprobado
2. Ejecuta `bundle exec jekyll build` para verificar que compila sin errores. Si hay errores, corrígelos
3. Muestra un resumen de lo creado:
   - Ruta del archivo
   - Título y número del ADR
   - Status de la decisión
