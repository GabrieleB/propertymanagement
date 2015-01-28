{% extends '../layout.swig' %}



{% block title %}
Prova Property Management Details
{% endblock %}

{% block content %}
<div id="heading" class="heading-3">
	<div class="container container--heading">
		<a href="{{back}}" class="backArrow">
			<i class="fa fa-chevron-left"></i>
		</a>
		<h2 class="page-heading">
			{{ property.Location.AddressUnit }}
		</h2>
	</div><!-- // .container -->
	<div class="bgshadow"></div>
</div><!-- // #heading -->

<div class="main-content" id="portfolio-detail">
	<div class="container">

		<div class="row bottom-30-sm bottom-30-xs">
			<div class="col-lg-5 col-md-5">
				<div class="portfolio-slider">
					<div class="slider flexslider">
						<ul class="slides">
							{% for image in property.Images %}
							<li><img src="{{ image.url }}" alt="" /></li>	
							{% endfor %}
						</ul><!-- // .slides -->
					</div><!-- // .slider -->
				</div><!-- // .portfolio-slider -->
				<div id="map-canvas" class="map map-separator"></div>
				
			</div><!-- // end column -->

			<div class="col-lg-7 col-md-7">

				<h4 class="heading-block heading-style1">
					<span>Property Description</span>
				</h4><!-- // end column -->
				<p align="justify">{{ property.Info.Description|safe }}</p> 

				<h4 class="heading-block heading-style1 heading-separator">
					<span>Property Amenities</span>
				</h4><!-- // end column -->
				<!-- <textarea type="text" rows="10"> {{ property.Info.Amenities }} </textarea> -->
				<p align="justify">{{ property.Info.Amenities|safe }}</p> 

				<h4 class="heading-block heading-style1 heading-separator">
					<span>Price Table</span>
				</h4>

				<table class="table table-bordered">
      <thead>
        <tr>
          <th>#</th>
          <th>Low Season</th>
          <th>Med Season</th>
          <th>High Season</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Day</td>
          <td>${{ property.Rates.LowSeason.Day }}</td>
          <td>${{ property.Rates.MediumSeason.Day }}</td>
          <td>${{ property.Rates.HighSeason.Day }}</td>
        </tr>
        
        <tr>
          <td>Week</td>
          <td>${{ property.Rates.LowSeason.Week }}</td>
          <td>${{ property.Rates.MediumSeason.Week }}</td>
          <td>${{ property.Rates.HighSeason.Week}}</td>
        </tr>
        <tr>
          <td>Month</td>
          <td>${{ property.Rates.LowSeason.Month }}</td>
          <td>${{ property.Rates.MediumSeason.Month }}</td>
	  <td>${{ property.Rates.HighSeason.Month }}</td>
        </tr>
      </tbody>
    </table>

				<h4 class="heading-block heading-style1 heading-separator">
					<span>Request more informations</span>
				</h4>

				<form action="/contact" method="post" class="contact form" id="contactform">
            <div class="row">

              <div class="field col-lg-6 col-md-6">
                <label for="name" accesskey="U">Name: <span>*</span></label>
                <input class="fullwidth" name="name" type="text" id="name" placeholder="your name"/>
              </div><!-- // .field -->

              <div class="field col-lg-6 col-md-6">
                <label for="email" accesskey="E">Email: <span>*</span></label>
                <input class="fullwidth" name="email" type="email" id="email" pattern="^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})$" placeholder="your email" />
              </div><!-- // .field -->

              <div class="field col-lg-6 col-md-6" hidden>
                <label for="subject">Subject</label>
		<input class="fullwidth" type="text" name="subject" id="subject" placeholder="Subject" value="Info request for property {{property.Location.AddressUnit}}">
              </div><!-- // .field -->



            </div><!-- // .row -->


            <div class="field">
              <label for="comments" accesskey="C">Message: <span>*</span></label>
              <textarea class="fullwidth" name="comments" cols="40" rows="3" id="comments" spellcheck="true" placeholder="write here the text"></textarea>
            </div><!-- // .form -->

            <button class="button color" id="submit">Send Messages</button>

          </form><!-- // .form -->
	
	  <ul class="messages">
	  </ul>

				<!--
				<a href="/contact" class="button orange">Send me informations<i class="fa fa-mail-forward"></i></a> -->

				<!--
				<form action="{{property.Location.AddressUnitUrl}}" class="formFull" method="post">
  					<input type="text" class="form-control col-xs-12" name="propertyAddressUnit" value="{{ property.Location.AddressUnit }}" hidden="">
					<button type="submit" class="button orange">Send me informations<i class="fa fa-mail-forward"></i></button>
				</form>
				-->

				<!--
				<br><br>
				<a href="/properties" class="button">Back to Properties<i class="fa fa-mail-reply"></i></a>
				-->

			</div><!-- // end column -->
		</div><!-- // .row -->
	</div><!-- // .container -->
  <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false"></script>
  <script type="text/javascript">
    var latlng = new google.maps.LatLng(0, 0);
    var myOptions = {
      zoom: 16,
      center: latlng,
      scrollwheel: true,
      scaleControl: false,
      disableDefaultUI: false,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map2 = new google.maps.Map(document.getElementById("map-canvas"),
    myOptions);
    
        var geocoder_map2 = new google.maps.Geocoder();
	var address = '{{ property.Location.AddressUnit }}, ' + '{{ property.Location.Zip }}';
        //var address = '{{ property.Location.AddressUnit }}, ' + '{{ property.Location.City}}, ' + ' {{ property.Location.State }}';
      geocoder_map2.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          map2.setCenter(results[0].geometry.location);
          
            var marker = new google.maps.Marker({
              map: map2, 
              
              position: map2.getCenter()
            });
            
              var contentString = '';
              var infowindow = new google.maps.InfoWindow({
                content: contentString
              });
                    
              google.maps.event.addListener(marker, 'click', function() {
                infowindow.open(map2,marker);
              });
              
                  infowindow.open(map2,marker);
                
        } else {
        alert("Geocode was not successful for the following reason: " + status);
      }
      });
  </script>

</div><!-- // #portfolio-detail -->


{% endblock %}

{% block breadcrumbs %}
<li><a href="/"> Home </a></li>
<li><a href="/properties"> Properties </a></li>
<li><span> {{ property.Location.AddressUnit }} </span></li>
{% endblock %}

{% block scripts %}
<script src="/js/flexslider.js"></script>
{% endblock %}
