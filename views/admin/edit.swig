{% extends '../layout.swig' %}

{% block title %}
{% endblock %}

{% block content %}
 
<div class="col-sm-6 col-sm-offset-3">
 
 
 
        <h1><span class="fa fa-sign-in"></span> Create Property </h1>
 
 
 
        <!-- show any messages that come back with authentication -->
 
	{#
        {% if message.length %}
                <div class="alert alert-danger"> {{ message }}  </div>
        {% endif %}
	#}

	{% if message.length %}

	<ul>
		{% for msg in message %}
			<li> <div class="{{msg.alertType}}"> {{ msg.msg }} </div> </li>
		{% endfor %}
	</ul>
		
	{% endif %}
 
 
 
 
        <!-- LOGIN FORM -->
 
        <form action="/admin/create" method="post">
 
		<fieldset>

			<h2 class="fs-title"> Login </h2>

			<div class="form-group">
				<label>Property ID</label>
				<input type="text" class="form-control" name="property">
			</div>
	 
			<div class="form-group">
				<label>Password</label>
				<input type="password" class="form-control" name="password">
			</div>

		</fieldset>

		<fieldset>

			<h2 class="fs-title"> Owner </h2>

			<div class="form-group">
				<label> Name </label>
				<input type="text" class="form-control" name="ownerName">
			</div>

			<div class="form-group">
				<label> Surname </label>
				<input type="text" class="form-control" name="ownerSurname">
			</div>

			<div class="form-group">
				<label> Address </label>
				<input type="text" class="form-control" name="ownerAddress">
			</div>		

			<div class="form-group">
				<label> City </label>
				<input type="text" class="form-control" name="ownerCity">
			</div>

			<div class="form-group">
				<label> State </label>
				<input type="text" class="form-control" name="ownerState">
			</div>

			<div class="form-group">
				<label> Zip </label>
				<input type="text" class="form-control" name="ownerZip">
			</div>
 		
			<div class="form-group">
				<label> Country </label>
				<input type="text" class="form-control" name="ownerCountry">
			</div>

			<div class="form-group">
				<label> Telephone </label>
				<input type="text" class="form-control" name="ownerTel">
			</div>

			<div class="form-group">
				<label> Email </label>
				<input type="text" class="form-control" name="ownerEmail">
			</div>

			<div class="form-group">
				<label> Note </label>
				<textarea type="text" class="form-control" name="ownerNote"></textarea>
			</div>

		</fieldset>

		<fieldset>

			<h2 class="fs-title"> Property Location </h2>

			<div class="form-group">
				<label> Address </label>
				<input type="text" class="form-control" name="locationAddressUnit">
			</div>

			<div class="form-group">
				<label> City </label>
				<input type="text" class="form-control" name="locationCity">
			</div>

			<div class="form-group">
				<label> State </label>
				<input type="text" class="form-control" name="locationState">
			</div>

			<div class="form-group">
				<label> Zip </label>
				<input type="text" class="form-control" name="locationZip">
			</div>

			<div class="form-group">
				<label> Country </label>
				<input type="text" class="form-control" name="locationCountry">
			</div>

		</fieldset>

		<fieldset>

			<h2 class="fs-title"> Property Infos </h2>

			<div class="form-group">
				<label> Wifi </label>
				<input type="text" class="form-control" name="infoIdPasswdWifi">
			</div>

			<div class="form-group">
				<label> Management </label>
				<input type="text" class="form-control" name="infoManagementRef">
			</div>

			<div class="form-group">
				<label> Frontdesk </label>
				<input type="text" class="form-control" name="infoFrontDeskTel">
			</div>

			<div class="form-group">
				<label> Bedrooms </label>
				<input type="text" class="form-control" name="infoBedrooms">
			</div>

			<div class="form-group">
				<label> Bathrooms </label>
				<input type="text" class="form-control" name="infoBathrooms">
			</div>

			<div class="form-group">
				<label> Amenities </label>
				<textarea type="text" class="form-control" name="infoAmenities"></textarea>
			</div>

			<div class="form-group">
				<label> Description </label>
				<textarea type="text" class="form-control" name="infoDescription"></textarea>
			</div>

		</fieldset>

		<fieldset>

			<h2 class="fs-title"> Property Rates </h2>

			<div class="form-group">
				<label> Low Season Day </label>
				<input type="text" class="form-control" name="ratesLowSeasonDay">
			</div>			

			<div class="form-group">
				<label> Low Season Week </label>
				<input type="text" class="form-control" name="ratesLowSeasonWeek">
			</div>

			<div class="form-group">
				<label> Low Season Month </label>
				<input type="text" class="form-control" name="ratesLowSeasonMonth">
			</div>

			<div class="form-group">
				<label> High Season Day </label>
				<input type="text" class="form-control" name="ratesHighSeasonDay">
			</div>

			<div class="form-group">
				<label> High Season Week </label>
				<input type="text" class="form-control" name="ratesHighSeasonWeek">
			</div>

			<div class="form-group">
				<label> High Season Month </label>
				<input type="text" class="form-control" name="ratesHighSeasonMonth">
			</div>

			<div class="form-group">
				<label> Medium Season Day </label>
				<input type="text" class="form-control" name="ratesMediumSeasonDay">
			</div>

			<div class="form-group">
				<label> Medium Season Week </label>
				<input type="text" class="form-control" name="ratesMediumSeasonWeek">
			</div>

			<div class="form-group">
				<label> Medium Season Month </label>
				<input type="text" class="form-control" name="ratesMediumSeasonMonth">
			</div>

		</fieldset>

		<fieldset>

			<div class="form-group">
				<label> Visible </label>
				<input type="text" class="form-control" name="visible">
			</div>

			<div class="checkbox">
				<label> 
					<input type="checkbox" value="" name="visible">
					Visible	
				</label>
			</div>

		</fieldset>

                <button type="submit" class="btn btn-warning btn-lg"> Create </button>
 
        </form>
 
 
 
        <hr>
 
</div>
 
{% endblock %}
