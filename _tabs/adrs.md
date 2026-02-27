---
layout: page
icon: fas fa-clipboard-list
order: 5
---

{% assign adrs = site.adrs | sort: "date" | reverse %}

{% if adrs.size > 0 %}
<div class="adrs-section">
  {% for adr in adrs %}
    {% include adr-list-card.html adr=adr %}
  {% endfor %}
</div>
{% endif %}

{% if site.adrs.size == 0 %}
<p class="text-body-secondary">Aún no hay ADRs publicados.</p>
{% endif %}
