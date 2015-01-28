{% extends '../layout.swig' %}

{% block title %}
Prova Property Management
{% endblock %}



{% block content %}
<div id="heading" class="heading-3 map">
	<div id="map-canvas" class="map"></div>
  <div class="bgshadow"></div>
</div><!-- // #heading -->

<div class="main-content" id="page-full-width">
	<div class="container">
		
		<div class="single" id="content">
      <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-8">
          
          <div class="heading bottom-30">
            <h3 class="bottom-10 heading-separator">Thank for your interest.</h3>
            <span>If you have any question, please fill out the form below. We'll reply as soon as we can.</span>
          </div><!-- // .heading -->

          <!-- begin form -->

          <form action="/contact" method="post" class="contact form" id="contactform">
            <div class="row">

              <div class="field col-lg-6 col-md-6">
                <label for="name" accesskey="U">Name: <span>*</span></label>
                <input class="fullwidth" name="name" type="text" id="name" placeholder="your name"/>
              </div><!-- // .field -->

              <div class="field col-lg-6 col-md-6">
                <label for="email" accesskey="E">Email: <span>*</span></label>
                <input class="fullwidth" name="email" type="email" id="email" pattern="^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})$" placeholder="your email"/>
              </div><!-- // .field -->

              <div class="field col-lg-6 col-md-6">
                <label for="subject">Subject: <span>*</span></label>
		<input class="fullwidth" type="text" name="subject" id="subject" placeholder="Subject">
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

        </div><!-- // end column -->

        <div class="col-lg-3 col-md-3 col-sm-3 col-lg-offset-1 col-md-offset-1 col-sm-offset-1">

          <div class="heading bottom-30">
            <h3 class="bottom-10 heading-separator">Our Office</h3>
            <span></span>
          </div><!-- // .heading -->
          
          <h4>Office</h4>
          <ul class="list-unstyled icon-list">
            <li><i class="fa fa-map-marker"></i>124 Some Street, Miami Beach, FL, 33139 </li>
            <li><i class="fa fa-phone"></i>+1 (589) 589-8589 </li>
            <li><i class="fa fa-envelope"></i><a href="mailto:test@gmail.com">test@gmail.com</a></li>
          </ul>

        </div><!-- // end column -->
        
      </div><!-- // .row -->
		</div><!-- // #content -->
	</div><!-- // .container -->

  <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false"></script>
  <script type="text/javascript">
    var latlng = new google.maps.LatLng(0, 0);
    var myOptions = {
      zoom: 14,
      center: latlng,
      scrollwheel: true,
      scaleControl: false,
      disableDefaultUI: false,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map2 = new google.maps.Map(document.getElementById("map-canvas"),
    myOptions);
    
        var geocoder_map2 = new google.maps.Geocoder();
      var address = '6700 Indian Creek, Miami Beach, FL, 33139';
      geocoder_map2.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          map2.setCenter(results[0].geometry.location);
          
            var marker = new google.maps.Marker({
              map: map2, 
              
              position: map2.getCenter()
            });
            
		/*
              var contentString = 'SobeWelcome<br />Property Management';
              var infowindow = new google.maps.InfoWindow({
                content: contentString
              });
                    
              google.maps.event.addListener(marker, 'click', function() {
                infowindow.open(map2,marker);
              });
              
                  infowindow.open(map2,marker);
		*/
                
        } else {
        alert("Geocode was not successful for the following reason: " + status);
      }
      });
  </script>


</div><!-- // .main-content -->

{% endblock %}

{% block breadcrumbs %}
<li><a href="/"> Home </a></li>
<li><span> Contact </span></li>
{% endblock %}
