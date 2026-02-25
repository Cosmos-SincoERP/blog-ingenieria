---
layout: page
icon: fas fa-book-open
order: 4
---

{% assign libros = site.recursos | where: "tipo", "libro" %}
{% assign articulos = site.recursos | where: "tipo", "articulo" %}
{% assign videos = site.recursos | where: "tipo", "video" %}

{% if libros.size > 0 %}
<div class="recursos-section">
  <h2><i class="fas fa-book me-2"></i>Libros</h2>
  {% for recurso in libros %}
    {% include recurso-libro-card.html recurso=recurso %}
  {% endfor %}
</div>
{% endif %}

{% if articulos.size > 0 %}
<div class="recursos-section">
  <h2><i class="fas fa-newspaper me-2"></i>Artículos</h2>
  {% for recurso in articulos %}
    <div class="card recurso-card mb-3">
      <div class="card-body">
        <h5 class="card-title">
          <a href="{{ recurso.url | relative_url }}">{{ recurso.title }}</a>
        </h5>
        {% if recurso.excerpt %}
        <p class="card-text">{{ recurso.excerpt }}</p>
        {% endif %}
      </div>
    </div>
  {% endfor %}
</div>
{% endif %}

{% if videos.size > 0 %}
<div class="recursos-section">
  <h2><i class="fas fa-video me-2"></i>Videos</h2>
  {% for recurso in videos %}
    <div class="card recurso-card mb-3">
      <div class="card-body">
        <h5 class="card-title">
          <a href="{{ recurso.url | relative_url }}">{{ recurso.title }}</a>
        </h5>
        {% if recurso.excerpt %}
        <p class="card-text">{{ recurso.excerpt }}</p>
        {% endif %}
      </div>
    </div>
  {% endfor %}
</div>
{% endif %}

{% if site.recursos.size == 0 %}
<p class="text-body-secondary">Aún no hay recursos publicados.</p>
{% endif %}
