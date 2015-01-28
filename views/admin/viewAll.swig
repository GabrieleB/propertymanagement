{% extends '../layout.swig' %}



{% block title %}
{% endblock %}



{% block content %}

<div id="heading" class="heading-3">
	<div class="container container--heading">
		<h2 class="page-heading">
			Properties
		</h2>
		<a href="/logout" class="headingRight"> Logout </a>
	</div><!-- // .container -->
	<div class="bgshadow"></div>
</div><!-- // #heading -->

<section class="main-content">
	
	<div class="container">

		<div class="col-sm-12">

		{% if message.length %}

			<ul class="messages">
				{% for msg in message %}
					<li> 
						<div class="{{msg.alertType}}">
							<p>{{msg.msg}}</p>
			     <a class="close" data-dismiss="alert" href="#" aria-hidden="true"><i class="fa fa-times-circle"></i></a> 
						</div>
					</li>
				{% endfor %}
			</ul>	
				
		{% endif %}

			<ul>
			{% for property in properties %}
	 			<li class="property-list"> <a href="/admin/view/{{ property.PropertyID }}"   class="button large black border"> {{ property.Location.AddressUnit }} </a> </li>
			{% endfor %}
			<li class="property-list"><a href="/admin/create" class="button large blue"> Add New </a></li>
			</ul>

		</div>

	</div>

</section>

{% endblock %}
