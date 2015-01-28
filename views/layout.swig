<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>{% block title %}{% endblock %}</title>

<!-- Bootstrap core CSS -->
<link href="/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/css/style.css" rel="stylesheet">
<link href="/css/plugin.css" rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet">
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/responsive.css" rel="stylesheet">

{% block head %} 
{% endblock %}
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
<![endif]-->
</head>

<body>
<header id="header">
  <div class="top-header">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 col-md-6 top-header-left">
							<span><strong>Contact:</strong> </span><span class="ds1"><span class="ds1"><span><a href="mailto:d_camerano@hotmail.com"> test@gmail.com </a></span></span></span><span><a href="mailto:test@gmail.com"> </a></span><span><strong> - Phone:</strong> +1 (305) 589-8589 </span>
        </div><!-- // .top-header-left -->

        <div class="col-lg-6 col-md-6 text-right top-header-right">

          <ul class="social list-unstyled pull-right">
            <li class="facebook"><a data-toggle="tooltip" data-placement="bottom" title="Facebook Page" href="#"><i class="fa fa-facebook"></i></a></li>
            <li class="twitter"><a data-toggle="tooltip" data-placement="bottom" title="Follow us on Twitter" href="#"><i class="fa fa-twitter"></i></a></li>
            <li class="linkedin"><a data-toggle="tooltip" data-placement="bottom" title="LinkedIn" href="#"><i class="fa fa-linkedin"></i></a></li>
          </ul><!-- // .social -->

        </div><!-- // .top-header-right -->

      </div><!-- // .row -->
    </div><!-- // .container -->
  </div><!-- // .top-header -->

  <div class="main-header">
    <div class="container logo-area">

      <h1 class="logo">
        <a href="/">
          <img src="http://www.placehold.it/312x70" alt="Sobe Welcome Logo">
        </a>

        <span class="site-title">Property Management</span>

      </h1><!-- // #logo -->

      <div id="mainmenu" class="site-menu visible-lg visible-md right-menu">

        <div class="left-menu hide">
        </div><!-- // .left-menu.hide -->

        <nav>
          <ul class="menu sf-menu list-unstyled clearfix">
            <li class="current"><a href="/">Home</a></li>

            <li><a href="/properties">Properties</a></li>
            
	    <!-- <li><a href="policy.html">Policy</a></li> -->

            <li>
	    	<a href="#">Info</a>

		<ul>
			<li><a href="/aboutmiami">About Miami</a></li>
			<li><a href="/aboutus">About Us</a></li>
		</ul>

	    </li>

	    <!--
            <li><a href="/profile.html">About us</a></li>
	    -->

            <li><a href="/contact">Contacts</a></li>

	    <li><a href="/login"> Reserved Area </a></li>

          </ul>
        </nav><!-- // nav -->
      </div><!-- // .site-menu.right-menu -->

      <!-- Repsonsive Menu Trigger -->
      <a class="pull-right responsive-menu visible-sm visible-xs" href="#panel-menu" id="responsive-menu"><i class="fa fa-bars"></i></a>
      <!-- End Reposnvie Menu Trigger -->

    </div><!-- // .container -->
  </div><!-- // .main-header -->
</header><!-- // header -->

{% block content %}
{% endblock %}

<footer id="footer">

   <div id="breadcrumb">
    <div class="container">
      <ul class="clearfix list-unstyled">
	      {% block breadcrumbs %}

	      {% endblock %}
      </ul><!-- // .list-unstyled -->
    </div><!-- // .container -->
  </div><!-- // #breadcrumb -->

  <div id="footer-1" class="widget-area">
    <div class="container">
      <div class="row">

        <div class="widget quick-contact col-lg-9 col-md-9 bottom-30-sm bottom-30-xs">
          <div class="widget-title">
            <h5>Quick Contact</h5>
          </div><!-- // .widget-title -->

          <p>Feel free to contact us for any further informations needed.</p>

          <ul class="list-unstyled contact-field-list clearfix">
            <li><i class="fa fa-home"></i>124 Some Street, Miami Beach, FL, 33139</li>
            <li><i class="fa fa-envelope"></i><a href="mailto:test@gmail.com">test@gmail.com</a></li>
            <li><i class="fa fa-mobile"></i>+1 (305) 589-8589</li>
          </ul><!-- // .contact-field-list -->

        </div><!-- // .widget -->

        <div class="widget col-lg-3 col-md-3 bottom-30-sm bottom-30-xs">
          <img src="http://www.placehold.it/263x59" alt="Sobe Welcome Logo">
        </div><!-- // .widget -->

      </div><!-- // .row -->
    </div><!-- // .container -->
  </div><!-- // .widget-area -->
  
  <div class="credit">
    <div class="container">
      <div class="row">

        <div class="col-lg-6 col-md-6">
          <span>Web Design by <a href="#">SOME COMPANY</a></span>
        </div><!-- // -->

        <div class="col-lg-6 col-md-6 text-right">
          <ul class="list-unstyled">
            <li><a href="contact.html">Contact Us</a></li>
          </ul>
        </div><!-- // -->

      </div><!-- // .row -->
    </div><!-- // .container -->
  </div><!-- // .credit -->
</footer><!-- // #footer -->

<!-- Core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="/js/easing.js"></script>
<script src="/js/superfish.js"></script>
<script src="/js/jpanelmenu.js"></script>
{% block scripts %}
{% endblock %}
<script src="/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
<script src="/js/functions.js"></script>

</body>
</html>
