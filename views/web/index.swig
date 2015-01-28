{% extends '../layout.swig' %}

{% block title %} 
	Prova Property Management 
{% endblock %}

{% block head %}
	<!-- Revolutions slider -->
	<link href="/rs-plugin/css/settings.css" rel="stylesheet">
	<link href="/rs-plugin/css/captions.css" rel="stylesheet">
{% endblock %}

{% block content %}

<div class="rev_slider_wrapper">
  <div id="rev_slider" class="rev_slider" style="display:none;">
    <ul>
      <!-- SLIDE  -->
      <li data-transition="fade" data-slotamount="7" data-masterspeed="300">
        <img src="slideshow/001.jpg" data-bgfit="cover" data-bgposition="center top" data-bgrepeat="no-repeat">
      </li>
      <!-- SLIDE  -->
      <li data-transition="fade" data-slotamount="7" data-masterspeed="300">
        <img src="slideshow/002.jpg" data-bgfit="cover" data-bgposition="center top" data-bgrepeat="no-repeat">
      </li>
      <li data-transition="fade" data-slotamount="7" data-masterspeed="300">
        <img src="slideshow/003.jpg" data-bgfit="cover" data-bgposition="center top" data-bgrepeat="no-repeat">
      </li>
      <li data-transition="fade" data-slotamount="7" data-masterspeed="300">
        <img src="slideshow/004.jpg" data-bgfit="cover" data-bgposition="center top" data-bgrepeat="no-repeat">
      </li>
      <li data-transition="fade" data-slotamount="7" data-masterspeed="300">
        <img src="slideshow/005.jpg" data-bgfit="cover" data-bgposition="center top" data-bgrepeat="no-repeat">
      </li>
      <li data-transition="fade" data-slotamount="7" data-masterspeed="300">
        <img src="slideshow/006.jpg" data-bgfit="cover" data-bgposition="center top" data-bgrepeat="no-repeat">
      </li>
      <li data-transition="fade" data-slotamount="7" data-masterspeed="300">
        <img src="slideshow/007.jpg" data-bgfit="cover" data-bgposition="center top" data-bgrepeat="no-repeat">
      </li>
      <li data-transition="fade" data-slotamount="7" data-masterspeed="300">
        <img src="slideshow/008.jpg" data-bgfit="cover" data-bgposition="center top" data-bgrepeat="no-repeat">
      </li>
      <li data-transition="fade" data-slotamount="7" data-masterspeed="300">
        <img src="slideshow/009.jpg" data-bgfit="cover" data-bgposition="center top" data-bgrepeat="no-repeat">
      </li>
      <li data-transition="fade" data-slotamount="7" data-masterspeed="300">
        <img src="slideshow/010.jpg" data-bgfit="cover" data-bgposition="center top" data-bgrepeat="no-repeat">
      </li>
    </ul>
    <div class="tp-bannertimer">
    </div>
  </div>
</div>

<section id="store-overview" class="top-30">
	<div class="container">

  <div class="title-block"><br>
    <h3 class="title-heading">Featured Properties</h3>
    <span class="line"></span>
    <span>Some description goes here as filler.</span>
  </div><!-- // .title-block -->

		<div class="row">

			{% for property in properties %}
			<div class="col-lg-3 col-md-3 bottom-30-sm bottom-30-xs">
				<div class="infobox">
					<div class="infobox-image">
						<div class="infobox-mark"></div>
						<img src="/images/{{ property.id }}/cover.jpg" alt="">
					</div><!-- // .infobox-image -->

					<div class="infobox-content">
						<h6>{{property.Location.AddressUnit}}</h6>
					</div><!-- // .infobox-content -->
					<a href="/properties/{{ property.Location.Zip }}/{{property.Location.AddressUnitUrl}}" class="button orange">More info<i class="fa fa-mail-forward"></i></a>
				</div><!-- // .infobox -->
			</div><!-- // end column -->
			{% endfor %}
</section>

{% endblock %}

{% block breadcrumbs %}
<li><span > Home </span></li>
{% endblock %}

{% block scripts %}
<script src="/js/fitvids.js"></script>
<script src="/js/flexslider.js"></script>
<!--
<script src="js/mediaelement.js"></script>
<script src="js/isotope.js"></script>
<script src="js/easypiechart.js"></script>
<script src="js/caroufredsel.js"></script>
<script src="js/magnific.js"></script>
<script src="js/twitter/tweet.js"></script>
-->

<script type="text/javascript">
var revapi1;
jQuery(document).ready(function() {

	if (jQuery.fn.cssOriginal != undefined)
		jQuery.fn.css = jQuery.fn.cssOriginal;

	if(jQuery('#rev_slider').revolution == undefined)
		revslider_showDoubleJqueryError('#rev_slider');
	else
		revapi1 = jQuery('#rev_slider').show().revolution(
		{
			delay:3000,
			startwidth:1170,
			startheight:700,
			hideThumbs:200,

			thumbWidth:100,
			thumbHeight:50,
			thumbAmount:3,

			navigationType:"bullet",
			navigationArrows:"solo",
			navigationStyle:"round",

			touchenabled:"on",
			onHoverStop:"on",

			navigationHAlign:"center",
			navigationVAlign:"bottom",
			navigationHOffset:0,
			navigationVOffset:20,

			soloArrowLeftHalign:"left",
			soloArrowLeftValign:"center",
			soloArrowLeftHOffset:20,
			soloArrowLeftVOffset:0,

			soloArrowRightHalign:"right",
			soloArrowRightValign:"center",
			soloArrowRightHOffset:20,
			soloArrowRightVOffset:0,

			shadow:0,
			fullWidth:"off",
			fullScreen:"off",

			stopLoop:"off",
			stopAfterLoops:-1,
			stopAtSlide:-1,

			shuffle:"off",

			hideSliderAtLimit:0,
			hideCaptionAtLimit:0,
			hideAllCaptionAtLilmit:0,
			startWithSlide:0,
			videoJsPath:"js/revslider/js/videojs/",
			fullScreenOffsetContainer: ""	
		});

});	//ready
</script>

<!-- Revolutions slider -->
<script src="/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
{% endblock %}
