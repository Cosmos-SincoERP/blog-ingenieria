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
