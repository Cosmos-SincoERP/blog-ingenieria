# Skill: Registrar libro

Skill interactivo para registrar un nuevo libro en la sección de recursos del blog de ingeniería.

## Datos dinámicos

### Autores disponibles en `_data/authors.yml`

```yaml
!`cat _data/authors.yml`
```

### Libros ya registrados

```
!`ls _recursos/`
```

### Tags ya usados en `_recursos/`

```
!`grep -h "^tags:" _recursos/*.md 2>/dev/null | sed 's/tags: \[//;s/\]//' | tr ',' '\n' | sed 's/^ *//;s/ *$//' | sort -u`
```

## Flujo

### 1. Obtener el título del libro

Si `$ARGUMENTS` contiene texto, úsalo como título del libro. Si no, pregunta al usuario el título del libro.

### 2. Buscar información bibliográfica en internet

Usa **WebSearch** para buscar la información bibliográfica del libro:

- Autores
- Editorial
- Año de publicación
- ISBN (ISBN-13 preferido)
- Descripción breve del libro

Busca con queries como: `"{título del libro}" book ISBN author publisher`.

### 3. Presentar la información encontrada

Muestra al usuario la información bibliográfica encontrada en un formato legible y pide confirmación. El usuario puede corregir cualquier dato.

### 4. Preguntar datos adicionales

Pregunta al usuario:

- **Tags**: muestra la lista de tags ya usados (ver datos dinámicos arriba) y permite seleccionar múltiples con `AskUserQuestion` (multiSelect). Luego pregunta si desea agregar tags adicionales no listados; si el usuario propone nuevos, inclúyelos junto con los seleccionados.
- **Excerpt**: usa la información bibliográfica ya obtenida (paso 2) para redactar una propuesta de excerpt en español, máximo 2 oraciones. Preséntala al usuario y pregunta si está de acuerdo o si desea modificarla; si propone cambios, aplícalos antes de continuar.
- **Resumido por**: quiénes participan en los resúmenes del libro. Muestra la lista de autores disponibles (ver datos dinámicos arriba) para que elija
- **Contexto**: un párrafo breve sobre por qué el equipo eligió este libro (será el contenido Markdown del archivo)

### 5. Generar el slug

Genera el slug a partir del título:

- Minúsculas
- Espacios reemplazados por guiones
- Sin caracteres especiales ni acentos
- Ejemplo: `"Diseño Dirigido por el Dominio"` → `diseno-dirigido-por-el-dominio`

### 6. Descargar la portada

Intenta descargar la portada del libro desde **Open Library**:

```
https://covers.openlibrary.org/b/isbn/{ISBN-13}-L.jpg
```

Usa `curl` para descargar. Si el ISBN no tiene portada en Open Library (archivo menor a 1KB o error), busca una imagen de portada alternativa con WebSearch y descárgala.

Guarda la imagen en: `assets/img/recursos/{slug}/cover.jpg`

### 7. Crear directorios

Crea los directorios necesarios si no existen:

```
assets/img/recursos/{slug}/
assets/docs/recursos/{slug}/
```

### 8. Crear el archivo del libro

Crea el archivo `_recursos/{slug}.md` con esta estructura exacta:

```yaml
---
title: "{Título del libro}"
date: {fecha de hoy YYYY-MM-DD}
tipo: libro
layout: recurso-libro
libro:
  autores:
    - "Nombre Autor 1"
    - "Nombre Autor 2"
  editorial: "Nombre Editorial"
  anio: {año}
  isbn: "{ISBN-13}"
  portada: /assets/img/recursos/{slug}/cover.jpg
capitulos: []
resumido_por: [{claves de autores separadas por coma}]
tags: [{tags separados por coma}]
excerpt: "{excerpt}"
---

{Contexto sobre por qué se eligió el libro}
```

**Importante:**

- `layout` siempre es `recurso-libro`
- `tipo` siempre es `libro`
- `capitulos` inicia como array vacío `[]`
- `resumido_por` usa las **claves** de `_data/authors.yml` (ej: `augusto`, `felipe`), NO los nombres completos
- `portada` usa ruta absoluta desde la raíz del sitio (empieza con `/`)
- `date` es la fecha de hoy

### 9. Verificar compilación

Ejecuta `bundle exec jekyll build` y verifica que compile sin errores. Si hay errores, corrígelos.

### 10. Confirmar al usuario

Muestra un resumen de lo creado:

- Ruta del archivo del libro
- Ruta de la portada
- Ruta del directorio para PDFs de capítulos
- Indica que puede usar `/registrar-capitulo` para agregar capítulos
