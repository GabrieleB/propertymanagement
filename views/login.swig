{% extends 'layout.swig' %}



{% block title %}
{% endblock %}

{% block content %}
<div id="heading" class="heading-3">
	<div class="container">
		<h2 class="page-heading">
			Reserved Area
		</h2>
	</div><!-- // .container -->
	<div class="bgshadow"></div>
</div><!-- // #heading -->

<section class="main-content">

	<div class="container">
 
		<div class="col-sm-6 col-sm-offset-3">
	<!--
      	<h1><span class="fa fa-sign-in"></span> Login</h1>
	-->
	
 
        	<!-- show any messages that come back with authentication -->
 
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
 
        	<!-- LOGIN FORM -->
 
        	<form action="/login" method="post" class="formFull">
         	<div class="form-group">
            	<label>Property ID</label>
               <input type="text" class="form-control col-xs-12"  name="property" required>
            </div>

            <div class="form-group">
	            <label>Password</label>
               <input type="password" class="form-control col-xs-12" name="password" required>
            </div>
 
            <button type="submit" class="btn btn-warning btn-lg">Login</button>
 
        	</form>
 
		<!--
        	<hr>
 
        	<p>Need an account? <a href="/signup">Signup</a></p>
        	<p>Or go <a href="/">home</a>.</p>


		-->

		</div>

	</div>

</section>
 
{% endblock %}

{% block breadcrumbs %}

<li><a href="/">Home</a></li>
<li><span> Login </span></li>

{% endblock %}
