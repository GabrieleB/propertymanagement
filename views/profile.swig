{% extends 'layout.swig' %}

{% block title %}
{% endblock %}
 
{% block content %}

<div class="page-header text-center">
                <h1><span class="fa fa-anchor"></span> Profile Page: {{property}}</h1>
                <a href="/logout" class="btn btn-default btn-sm">Logout</a>
        </div>

<section class="main-content">

	<div class="container">

		<div class="col-sm-12">

			<form action="#" class="formFull formFull--profile" method="post">

				<fieldset>
					<div class="" id="financials">
					{% for line in financials %}
						<div class="form-group">
							<input type="text" class="form-control col-xs-8" value="{{line.field}}" disabled/>
							<input type="text" class="form-control col-xs-3 value" value="{{line.value}}" disabled/>
						</div>
					{% endfor %}	

						<div id="totalContainer" class="form-group">
							<fieldset class="col-sm-12">
							<p class="col-sm-8"> Total: </p> 
							<p class="total col-sm-3">0</p>
						</div>
					</div>
				</fieldset>

			</form>

		</div>

	</div>

</section>
 
{% endblock %}



{% block scripts %}
<script src="/js/forms.js"></script>
{% endblock%}
