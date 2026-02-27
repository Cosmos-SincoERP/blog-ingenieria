---
layout: page
icon: fas fa-clipboard-list
order: 5
---

{% assign adrs = site.adrs | sort: "date" | reverse %}

{% if adrs.size > 0 %}
<div class="adrs-section">
  {% assign products = adrs | map: "product" | uniq | sort %}
  {% for prod in products %}
  <h2>{{ prod | capitalize }}</h2>
  {% assign prod_adrs = adrs | where: "product", prod %}
  {% for adr in prod_adrs %}
    {% include adr-list-card.html adr=adr %}
  {% endfor %}
  {% endfor %}
</div>
{% endif %}

{% if site.adrs.size == 0 %}
<p class="text-body-secondary">Aún no hay ADRs publicados.</p>
{% endif %}
