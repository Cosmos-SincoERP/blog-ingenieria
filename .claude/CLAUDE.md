# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Static blog for the Cosmos SincoERP engineering team, built with **Jekyll 4.4.1** and the **jekyll-theme-chirpy 7.2** theme. Published at https://cosmos-sincoerp.github.io/blog-ingenieria via GitHub Pages. Content is written in Spanish.

## Commands

```bash
# Install dependencies
bundle install

# Run local dev server (auto-reloads on file changes)
bundle exec jekyll serve

# Include draft posts
bundle exec jekyll serve --drafts

# Build site (output goes to _site/)
bundle exec jekyll build
```

There are no linters or tests in this project.

## Deployment

Pushing to `main` automatically triggers `.github/workflows/pages-deploy.yml`, which builds with `JEKYLL_ENV=production` and deploys to GitHub Pages. No manual steps needed. Changes to `.gitignore`, `README.md`, and `LICENSE` do not trigger a deploy.

## Git commits

- Use **Conventional Commits** (`feat:`, `fix:`, `docs:`, `chore:`, etc.).
- Write all commit messages **in Spanish**.
- Do **not** add `Co-Authored-By` or any Claude credits to commits.

Example:

```
docs: agregar post sobre la forma de la plataforma
```

## Creating posts

Posts live in `_posts/` with the filename format `YYYY-MM-DD-slug.md`. Required front matter:

```yaml
---
title: "Título del post"
date: YYYY-MM-DD
categories: [categoria]
tags: [tag1, tag2]
author: nombre
excerpt: "Descripción corta que aparece en el listado."
---
```

Optional front matter fields:
- `image.path` / `image.alt` — cover image for the post
- Posts inherit `layout: post`, `toc: true`, and `comments: false` from `_config.yml` defaults.

Draft posts go in `_drafts/` (no date prefix needed in the filename).

## Project structure

- `_config.yml` — site-wide configuration (title, URL, theme, pagination, kramdown/rouge syntax highlighting)
- `_posts/` — published blog posts in Markdown
- `_drafts/` — unpublished drafts
- `_tabs/` — top-nav pages (About, Archives, Categories, Tags); order controlled by the `order` front matter field
- `_data/basic.yml` — paths to JS/CSS libraries used by the theme (tocbot, fontawesome, mermaid, glightbox, etc.)
- `assets/img/` — images referenced in posts
- `assets/docs/` — PDF documents linked from posts
- `_site/` — generated output (gitignored, do not edit)
