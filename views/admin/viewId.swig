{% extends '../layout.swig' %}

{% block title %}
{% endblock %}



{% block head %}

<link href="/css/dropzone.css" rel="stylesheet">

{% endblock %}

{% block content %}

<div id="heading" class="heading-3">
	<div class="container container--heading">
		<a href="/admin/view" class="backArrow">
			<i class="fa fa-chevron-left"></i>
		</a>
		<h2 class="page-heading">
			{{property.Location.AddressUnit}}
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
 
	<form action="/admin/view/{{ property.PropertyID }}" class="formFull" method="post">

		<div class="tabs clearfix tabs left ">	
		
			<ul class="tabNavigation clearfix">
					 <li class="tab active"><a data-toggle="tab" href="#login">Login</a></li>
					 <li class="tab"><a data-toggle="tab" href="#owner">Owner</a></li>
					 <li class="tab"><a data-toggle="tab" href="#property">Property</a></li>
					 <li class="tab"><a data-toggle="tab" href="#rates">Rates</a></li>
					 <li class="tab"><a data-toggle="tab" href="#financials">Financials</a></li>
					 <li class="tab">
					 	<select class="form-control" name="visible">
							{% if property.Visible == 'Visible' %}
								<option selected>Visible</option>
								<option>Hidden</option>
							{% endif %}

							{% if property.Visible == 'Hidden' %}
								<option>Visible</option>
								<option selected>Hidden</option>
							{% endif %}

					 	</select>
					 </li>
					 <li class="tab">
					 	<select class="form-control" name="featured">
							{% if property.Featured == 'Featured' %}
								<option selected>Featured</option>
								<option>NotFeatured</option>
							{% endif %}

							{% if property.Featured == 'NotFeatured' %}
								<option>Featured</option>
								<option selected>NotFeatured</option>
							{% endif %}

					 	</select>
					 </li>
					 <li class="sideButtons"> 
						<button type="submit" class="button normal color normal col-xs-6"> Save </button>
						<a data-toggle="modal" href="#infoModal" class="myButton myButton--softalert col-xs-6">Delete</a>	
					 </li>
			</ul>
			
 
		<div class="tabs-container active" id="login">

				  <fieldset>

					  <h2 class="fs-title"> Login </h2>

					  <div class="form-group">
						  <label>Property ID</label>
						  <input type="text" class="form-control col-xs-12" name="property" value="{{ property.PropertyID }}">
					  </div>
				
					  <div class="form-group">
						  <label>Password</label>
						  <input type="password" class="form-control col-xs-12" name="password" value="">
					  </div>

				  </fieldset>
		
		</div>

		<div class="tabs-container" id="owner">

				  <fieldset>

					  <h2 class="fs-title"> Owner </h2>

					  <div class="form-group">
						  <label> Name </label>
						  <input type="text" class="form-control col-xs-12" name="Owner[Name]" value="{{ property.Owner.Name }}">
					  </div>

					  <div class="form-group">
						  <label> Surname </label>
						  <input type="text" class="form-control col-xs-12" name="Owner[Surname]" value="{{ property.Owner.Surname }}">
					  </div>

					  <div class="form-group">
						  <label> Address </label>
						  <input type="text" class="form-control col-xs-12" name="Owner[Address]" value="{{ property.Owner.Address }}">
					  </div>		

					  <div class="form-group">
						  <label> City </label>
						  <input type="text" class="form-control col-xs-12" name="Owner[City]" value="{{ property.Owner.City }}">
					  </div>

					  <div class="form-group">
						  <label> State </label>
						  <input type="text" class="form-control col-xs-12" name="Owner[State]" value="{{ property.Owner.State }}">
					  </div>

					  <div class="form-group">
						  <label> Zip </label>
						  <input type="text" class="form-control col-xs-12" name="Owner[Zip]" value="{{ property.Owner.Zip }}">
					  </div>
				  
					  <div class="form-group">
						  <label> Country </label>
						  <input type="text" class="form-control col-xs-12" name="Owner[Country]" value="{{ property.Owner.Country }}">
					  </div>

					  <div class="form-group">
						  <label> Telephone </label>
						  <input type="text" class="form-control col-xs-12" name="Owner[Tel]" value="{{ property.Owner.Tel }}">
					  </div>

					  <div class="form-group">
						  <label> Email </label>
						  <input type="text" class="form-control col-xs-12" name="Owner[Email]" value="{{ property.Owner.Email }}">
					  </div>

					  <div class="form-group">
						  <label> Note </label>
						  <textarea type="text" class="form-control col-xs-12" name="Owner[Note]" rows="10">{{ property.Owner.Note }}</textarea>
					  </div>

				  </fieldset>

		</div>

		<div class="tabs-container" id="property">		

				  <fieldset>

					  <h2 class="fs-title"> Property Location </h2>

					  <div class="form-group">
						  <label> Address </label>
						  <input type="text" class="form-control col-xs-12" name="Location[AddressUnit]" value="{{ property.Location.AddressUnit }}">
					  </div>

					  <div class="form-group">
						  <label> City </label>
						  <input type="text" class="form-control col-xs-12" name="Location[City]" value="{{ property.Location.City }}">
					  </div>

					  <div class="form-group">
						  <label> State </label>
						  <input type="text" class="form-control col-xs-12" name="Location[State]" value="{{ property.Location.State }}">
					  </div>

					  <div class="form-group">
						  <label> Zip </label>
						  <input type="text" class="form-control col-xs-12" name="Location[Zip]" value="{{ property.Location.Zip }}">
					  </div>

					  <div class="form-group">
						  <label> Country </label>
						  <input type="text" class="form-control col-xs-12" name="Location[Country]" value="{{ property.Location.Country }}">
					  </div>

				  </fieldset>

				  <fieldset>

					  <h2 class="fs-title"> Property Infos </h2>

					  <div class="form-group">
						  <label> Wifi </label>
						  <input type="text" class="form-control col-xs-12" name="Info[IdPasswdWifi]" value="{{ property.Info.IdPasswdWifi }}">
					  </div>

					  <div class="form-group">
						  <label> Management </label>
						  <input type="text" class="form-control col-xs-12" name="Info[ManagementRef]" value="{{ property.Info.ManagementRef }}">
					  </div>



					  <div class="form-group">
						  <label> Frontdesk </label>
						  <input type="text" class="form-control col-xs-12" name="Info[FrontDeskTel]" value="{{ property.Info.FrontDeskTel }}">
					  </div>

					  <div class="form-group">
						  <label> Bedrooms </label>
						  <input type="text" class="form-control col-xs-12" name="Info[Bedrooms]" value="{{ property.Info.Bedrooms }}">
					  </div>

					  <div class="form-group">
						  <label> Bathrooms </label>
						  <input type="text" class="form-control col-xs-12" name="Info[Bathrooms]" value="{{ property.Info.Bathrooms }}">
					  </div>

					  <div class="form-group">
						  <label> Amenities </label>
						  <textarea type="text" class="form-control col-xs-12" name="Info[Amenities]" rows="10">{{ property.Info.Amenities }}</textarea>
					  </div>

					  <div class="form-group">
						  <label> Description </label>
						  <textarea type="text" class="form-control col-xs-12" name="Info[Description]" rows="10">{{ property.Info.Description }}</textarea>
					  </div>

				  </fieldset>

				  <fieldset>

				  		<h2 class="fs-title"> Media </h2>

						<div id="dropzone" class="form-group">
					  	 <div id="fileupload" action="/upload/{{ property.id }}" class="dropzone" name="file">
						 </div>
					  </div>

				  </fieldset>

		</div>

		<div class="tabs-container" id="rates">

				  <fieldset>

					  <h2 class="fs-title"> Property Rates </h2>

					  <h3> Low Season </h3>

					  <div class="form-group col-sm-4">
						  <label> Day </label>
						  <input type="text" class="form-control col-xs-12" name="Rates[LowSeason][Day]" value="{{ property.Rates.LowSeason.Day }}">
					  </div>			

					  <div class="form-group col-sm-4">
						  <label> Week </label>
						  <input type="text" class="form-control col-xs-12" name="Rates[LowSeason][Week]" value="{{ property.Rates.LowSeason.Week }}">
					  </div>

					  <div class="form-group col-sm-4">
						  <label> Month </label>
						  <input type="text" class="form-control col-xs-12" name="Rates[LowSeason][Month]" value="{{ property.Rates.LowSeason.Month }}">
					  </div>

					  <h3> High Season </h3>

					  <div class="form-group col-sm-4">
						  <label> Day </label>
						  <input type="text" class="form-control col-xs-12" name="Rates[HighSeason][Day]" value="{{ property.Rates.HighSeason.Day }}">
					  </div>

					  <div class="form-group col-sm-4">
						  <label> Week </label>
						  <input type="text" class="form-control col-xs-12" name="Rates[HighSeason][Week]" value="{{ property.Rates.HighSeason.Week }}">
					  </div>

					  <div class="form-group col-sm-4">
						  <label> Month </label>
						  <input type="text" class="form-control col-xs-12" name="Rates[HighSeason][Month]" value="{{ property.Rates.HighSeason.Month }}">
					  </div>

					  <h3> Peak Season </h3>

					  <div class="form-group col-sm-4">
						  <label> Day </label>
						  <input type="text" class="form-control col-xs-12" name="Rates[MediumSeason][Day]" value="{{ property.Rates.MediumSeason.Day }}">
					  </div>

					  <div class="form-group col-sm-4">
						  <label> Week </label>
						  <input type="text" class="form-control col-xs-12" name="Rates[MediumSeason][Week]" value="{{ property.Rates.MediumSeason.Week }}">
					  </div>

					  <div class="form-group col-sm-4">
						  <label> Month </label>
						  <input type="text" class="form-control col-xs-12" name="Rates[MediumSeason][Month]" value="{{ property.Rates.HighSeason.Month }}">
					  </div>

				  </fieldset>

		</div> 

		<div class="tabs-container" id="financials">
				{% for line in property.Financials %}
					<div class="form-group">
						<input type="text" class="form-control col-xs-8" name="Financials[{{line.idval}}][field]" value="{{line.field}}" />
						<input type="text" class="form-control col-xs-3 value" name="Financials[{{line.idval}}][value]" value="{{line.value}}" />
						<input type="text" class="form-control hidden" name="Financials[{{line.idval}}][idval]" value="{{line.idval}}" />
						<a href="#" class="removeItem"><i class="fa fa-times-circle col-xs-1"></i></a>
					</div>
				{% endfor %}	

			<div id="totalContainer" class="form-group">
				<fieldset class="col-sm-12">
					<p class="col-sm-8"> Total: </p> 
					<p class="total col-sm-3">0</p>
				</fieldset>
			</div>

			<fieldset>
				<a href="#"  id="addItem" class="button normal color normal"> New Item </a>
			</fieldset>
		</div>

	</div>
        </form>
 
</div>


	</div>

</section>
 
{% endblock %}

{% block scripts %}

<div class="modal fade" id="infoModal" aria-hidden="true" style="display: none;">
  				<div class="modal-dialog">
    					<div class="modal-content">
      						<div class="modal-header">
        						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        						<h4 class="modal-title">Please Confirm</h4>
      						</div>
						<div class="modal-body">
							<p>Are you sure you want to delete this property?</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<a href="/admin/delete/{{ property.PropertyID }}" type="submit" formmethod="delete" class="myButton myButton--hardalert"> Delete </a>
						</div>
    					</div><!-- /.modal-content -->
  				</div><!-- /.modal-dialog -->
			</div>

<script src="/js/dropzone.js"></script>
<script src="/js/jquery.serialize-object.js"></script>
<script src="/js/forms.js"></script>

{% endblock %}
