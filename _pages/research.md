---
permalink: /research/
title: "Research"
layout: minimal
---

#### Research Projects

{% assign sorted_publications = site.publications | sort: 'date' | reverse %}
{% for publication in sorted_publications %}
<div class="publication">
  {% if publication.image %}
    <img src="{{ base_path }}/images/{{ publication.image }}" alt="{{ publication.title }}" class="publication-image">
  {% else %}
    <div class="publication-image-placeholder"></div>
  {% endif %}
  
  <div class="publication-content">
    {% if publication.paperurl %}
      <h3><a href="{{ publication.paperurl }}" target="_blank">{{ publication.title }}</a></h3>
    {% else %}
      <h3>{{ publication.title }}</h3>
    {% endif %}
    
    {% if publication.authors %}
      <h4>{{ publication.authors }}</h4>
    {% endif %}
    
    {% if publication.venue %}
      <strong>{{ publication.venue }}</strong>
    {% endif %}
    
    {% if publication.excerpt %}
      <p>{{ publication.excerpt }}</p>
    {% elsif publication.content and publication.content != '' %}
      <p>{{ publication.content | strip_html | truncatewords: 50 }}</p>
    {% endif %}
    
    {% if publication.blogurl %}
      <p><a href="{{ publication.blogurl }}" target="_blank">Blog post</a></p>
    {% endif %}
  </div>
</div>
{% endfor %} 