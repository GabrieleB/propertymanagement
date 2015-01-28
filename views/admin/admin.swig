{% extends '../layout.swig' %}

{% block title %}
{% endblock %}

{% block content %}
 
<p> Prova </p>

<a href="/admin/create" class="btn btn-default"><span class="fa fa-user"></span> Add Property</a>
<a href="/admin/view" class="btn btn-default"><span class="fa fa-user"></span> View Properties</a>

<a href="/admin/id/update" class="btn btn-default"><span class="fa fa-user"></span> Update Property</a>
<a href="/admin/id/delete" class="btn btn-default"><span class="fa fa-user"></span> Delete Property</a>

{% endblock %}
