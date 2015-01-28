{% extends '../layout.swig' %}

{% block title %}
{% endblock %}

{% block head %}

<link href="/css/dropzone.css" rel="stylesheet">

{% endblock %}

{% block content %}

<div id="heading" class="heading-3">
	<div class="container container--heading">
		<a href="/admin/view"> Properties / </a>
		<h2 class="page-heading">
			Create Property
		</h2>
		<a href="/logout" class="headingRight"> Logout </a>

	</div><!-- // .container -->
	<div class="bgshadow"></div>
</div><!-- // #heading -->

<section class="main-content">

<div class="container">
 
<div class="col-sm-12">
 
 
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
 
        <form action="/admin/create" class="formFull" method="post">

		  	<div class="tabs clearfix tabs left ">

					  <ul class="tabNavigation clearfix">
								<li class="tab active"><a data-toggle="tab" href="#login">Basic Info</a></li>
								<li class="sideButtons"> 
								  <button type="submit" class="button normal color normal col-xs-12"> Create </button>
								</li>
					  </ul>
 
			<div class="tabs-container active" id="login">

				  <fieldset>

					  <h2 class="fs-title"> Login </h2>

					  <div class="form-group">
						  <label>Property ID</label>
						  <input type="text" class="form-control col-xs-12" name="property">
					  </div>
				
					  <div class="form-group">
						  <label>Password</label>
						  <input type="password" class="form-control col-xs-12" name="password">
					  </div>

					  <h2 class="fs-title"> Owner </h2>

				          <div class="form-group">
						  <label> Name </label>
						  <input type="text" class="form-control col-xs-12" name="Owner[Name]">
					  </div>	

					  <div class="form-group">
						  <label> Surname </label>
						  <input type="text" class="form-control col-xs-12" name="Owner[Surname]">
					  </div>

					  <h2 class="fs-title"> Property Location </h2>

					  <div class="form-group">
						  <label> Address </label>
						  <input type="text" class="form-control col-xs-12" name="Location[AddressUnit]">
					  </div>

					  <div class="form-group">
						  <label> Zip </label>
						  <input type="text" class="form-control col-xs-12" name="Location[Zip]">
					  </div>

				  </fieldset>

			</div>

		  </div>

        </form>
 
 
 
        <hr>
 
</div>

</div>

</section>
 
{% endblock %}

{% block scripts %}
<script src="/js/dropzone.js"></script>
<script src="/js/jquery.serialize-object.js"></script>
<script src="/js/forms.js"></script>
{% endblock %}
