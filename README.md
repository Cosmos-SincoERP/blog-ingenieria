# Blog de Ingeniería Cosmos

Blog técnico del equipo de ingeniería de [Cosmos SincoERP](https://github.com/Cosmos-SincoERP), construido con [Jekyll](https://jekyllrb.com/) y el tema [Chirpy](https://github.com/cotes2339/jekyll-theme-chirpy).

**URL de producción:** https://cosmos-sincoerp.github.io/blog-ingenieria

---

## Prerrequisitos

Antes de instalar el blog localmente, asegúrate de tener instalado:

- **Ruby** >= 3.3 — [Guía de instalación](https://www.ruby-lang.org/es/documentation/installation/)
- **Bundler** — gestor de dependencias de Ruby

  ```bash
  gem install bundler
  ```

Puedes verificar tus versiones con:

```bash
ruby --version
bundler --version
```

---

## Instalación local

1. **Clona el repositorio:**

   ```bash
   git clone https://github.com/Cosmos-SincoERP/blog-ingenieria.git
   cd blog-ingenieria
   ```

2. **Instala las dependencias:**

   ```bash
   bundle install
   ```

---

## Correr el servidor local

```bash
bundle exec jekyll serve
```

El blog estará disponible en [http://localhost:4000/blog-ingenieria](http://localhost:4000/blog-ingenieria).

Jekyll detecta cambios en los archivos automáticamente y regenera el sitio. Solo recarga el navegador para ver los cambios.

> **Tip:** Si quieres ver borradores (`_drafts`), agrega el flag `--drafts`:
> ```bash
> bundle exec jekyll serve --drafts
> ```

---

## Despliegue

El despliegue es **automático**. Cada push a la rama `main` dispara el workflow de GitHub Actions (`.github/workflows/pages-deploy.yml`), que:

1. Construye el sitio con Jekyll en modo producción.
2. Publica el resultado en **GitHub Pages**.

No se requiere ninguna acción manual. En unos minutos de hacer el push, los cambios estarán visibles en https://cosmos-sincoerp.github.io/blog-ingenieria.

> **Nota:** Cambios en `.gitignore`, `README.md` o `LICENSE` no disparan el despliegue.

---

## Crear un recurso

Los recursos son materiales de estudio del equipo (libros, artículos, videos). Viven en el directorio `_recursos/` y cada uno genera su propia página en `/recursos/`.

---

### Opción A: Con Claude Code (recomendada)

Si tienes [Claude Code](https://claude.ai/code) instalado en este repositorio, puedes registrar libros y capítulos usando los skills interactivos. Claude se encarga de buscar la información bibliográfica, descargar la portada, crear los directorios y archivos, y verificar que el sitio compile.

#### Registrar un libro nuevo

Ejecuta el skill desde Claude Code:

```
/registrar-libro
```

Claude te guiará paso a paso:

1. Busca la información bibliográfica del libro en internet.
2. Propone un excerpt en español (puedes corregirlo).
3. Muestra los tags ya usados en el sitio para que elijas; también puedes agregar nuevos.
4. Pregunta quiénes participan en los resúmenes.
5. Pide el contexto sobre por qué el equipo eligió el libro.
6. Descarga la portada, crea los directorios y genera el archivo `_recursos/<slug>.md`.
7. Verifica que el sitio compile.

También puedes pasar el título directamente como argumento:

```
/registrar-libro Designing Data-Intensive Applications
```

#### Agregar un capítulo a un libro existente

```
/registrar-capitulo
```

Claude te guiará para:

1. Seleccionar el libro al que agregar el capítulo.
2. Indicar el número, título y autor del resumen.
3. Proporcionar la ruta local al PDF — Claude lo copia al directorio correcto y lo nombra según la convención.
4. Actualizar el front matter del libro automáticamente.
5. Verificar que el sitio compile.

---

### Opción B: Manualmente (paso a paso)

Un recurso de libro presenta la información del libro junto con los resúmenes de capítulos elaborados por el equipo en PDF.

#### 1. Crear las carpetas para los archivos del libro

Elige un **slug** para el libro (nombre corto, en minúsculas, separado por guiones). Ejemplo: `software-architecture-the-hard-parts`.

```bash
mkdir -p assets/img/recursos/<slug>
mkdir -p assets/docs/recursos/<slug>
```

#### 2. Agregar la imagen de portada

Coloca la imagen de portada del libro en `assets/img/recursos/<slug>/`. El formato puede ser `.png`, `.jpg` o `.svg`.

```
assets/img/recursos/software-architecture-the-hard-parts/cover.png
```

#### 3. Agregar los PDFs de los resúmenes

Coloca los PDFs de cada capítulo en `assets/docs/recursos/<slug>/`. Se recomienda nombrarlos con prefijo numérico:

```
assets/docs/recursos/software-architecture-the-hard-parts/cap-01-que-pasa-cuando-no-hay-suficientes.pdf
assets/docs/recursos/software-architecture-the-hard-parts/cap-02-descubriendo-acoplamiento.pdf
```

#### 4. Crear el archivo del recurso

Crea un archivo Markdown en `_recursos/` con el nombre `<slug>.md`:

```bash
touch _recursos/software-architecture-the-hard-parts.md
```

#### 5. Escribir el front matter

```yaml
---
title: "Software Architecture: The Hard Parts"
date: 2026-03-01                      # Fecha de publicación en el blog
tipo: libro
layout: recurso-libro
libro:
  autores:                             # Autores originales del libro
    - "Neal Ford"
    - "Mark Richards"
    - "Pramod Sadalage"
    - "Zhamak Dehghani"
  editorial: "O'Reilly Media"
  anio: 2021                           # Año de publicación del libro
  isbn: "978-1492086895"               # Opcional
  portada: /assets/img/recursos/software-architecture-the-hard-parts/cover.png
capitulos:
  - numero: 1
    titulo: "What Happens When There Are No 'Best Practices'?"
    pdf: cap-01-que-pasa-cuando-no-hay-suficientes.pdf
    resumido_por: [augusto]            # Claves de _data/authors.yml
  - numero: 2
    titulo: "Discerning Coupling"
    pdf: cap-02-descubriendo-acoplamiento.pdf
    resumido_por: [felipe, camilo]
resumido_por: [augusto, felipe, camilo] # Todos los que participaron
tags: [arquitectura, microservicios]
excerpt: "Resúmenes del libro sobre decisiones de arquitectura en sistemas distribuidos."
---

Aquí va contenido libre en Markdown: contexto sobre por qué el equipo eligió
este libro, qué temas cubre, o cualquier nota relevante.
```

**Notas sobre el front matter:**

| Campo | Descripción |
|---|---|
| `tipo` | Siempre `libro` para libros |
| `layout` | Siempre `recurso-libro` para libros |
| `libro.autores` | Autores originales del libro (texto libre) |
| `libro.anio` | Año de publicación original del libro |
| `libro.isbn` | Opcional. ISBN del libro |
| `capitulos[].numero` | Número del capítulo |
| `capitulos[].titulo` | Título del capítulo |
| `capitulos[].pdf` | Nombre del archivo PDF (solo el nombre, no la ruta completa) |
| `capitulos[].resumido_por` | Lista de claves de `_data/authors.yml` de quienes resumieron ese capítulo |
| `resumido_por` | Lista general de todos los que participaron en los resúmenes |

> **Importante:** Las claves en `resumido_por` deben coincidir con las definidas en `_data/authors.yml` (por ejemplo: `augusto`, `felipe`, `camilo`, `didier`).

#### 6. Verificar localmente

```bash
bundle exec jekyll serve
```

Navega a [http://localhost:4000/blog-ingenieria/recursos/](http://localhost:4000/blog-ingenieria/recursos/) y verifica que:

- El libro aparece en el listado de recursos con su portada y datos.
- Al entrar al libro se ven: portada, metadatos, disclaimer de derechos de autor, contenido y lista de capítulos.
- Los links de descarga de PDF funcionan.
- La página se ve correctamente en modo claro y oscuro.

#### 7. Publicar

Haz commit y push a `main`. El recurso se publicará automáticamente.

#### Agregar capítulos a un libro existente

1. Coloca el nuevo PDF en `assets/docs/recursos/<slug>/`.
2. Agrega la entrada al array `capitulos` en el front matter del archivo `_recursos/<slug>.md`.
3. Si es un nuevo autor, agrégalo primero a `_data/authors.yml` y luego referéncialo en `resumido_por`.

---

## Publicar un nuevo post

Los posts van en el directorio `_posts/` con el formato de nombre:

```
YYYY-MM-DD-titulo-del-post.md
```

El front matter mínimo de cada post es:

```yaml
---
title: Título del post
date: YYYY-MM-DD
categories: [Categoría]
tags: [tag1, tag2]
---
```
