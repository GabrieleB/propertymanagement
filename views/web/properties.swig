{% extends '../layout.swig' %}

{% block title %}

Prova Property Management
{% endblock %}

{% block content %}
<div id="heading" class="heading-3">
	<div class="container">
		<h2 class="page-heading">
			Properties
		</h2>
	</div><!-- // .container -->
	<div class="bgshadow"></div>
</div><!-- // #heading -->
<section class="main-content" id="content">

	<div class="container portfolio-page">
		<div class="row">

	{% for property in properties %}
		{% if property.Visible == 'Visible' %}

		<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 element t2">
        <div class="portfolio-item">
          <div class="portfolio-overlay">
            <div class="portfolio-overlay-content">
              <span class="top-top-bottom">
                <a href="/properties/{{ property.Location.Zip }}/{{property.Location.AddressUnitUrl}}">
                  <i class="fa fa-search-plus"></i>
                </a>
              </span><!-- // .top-top-bottom -->
            </div><!-- // .portfolio-overlay-content -->
          </div><!-- // .portfoli-overlay -->
          <div class="portfolio-info">
            <div class="portfolio-short-content">
              <h5><a href="/properties/{{ property.Location.Zip }}/{{property.Location.AddressUnitUrl}}">{{ property.Location.AddressUnit }}</a></h5>
              <span class="portfolio-categories"><a href="pre/ariamiami.html">Miami Bayfront</a></span>
            </div><!-- // .portfolio-short-content -->
          </div><!-- // .portfolio-info -->

          <img class="img-responsive" src="/images/{{ property.id }}/cover.jpg" alt="">
        </div><!-- // .portfolio-item -->
      </div><!-- // end column -->
		{% endif %}

	{% endfor %}

	</div> <!-- end row -->
	</div> <!-- end container portfoliopage -->

</section><!-- // #content -->

{% endblock %}

{% block breadcrumbs %}
<li><a href="/"> Home </a></li>
<li><span> Properties </span></li> 
{% endblock %}
