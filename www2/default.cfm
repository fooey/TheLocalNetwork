<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>The Local Network</title>
	<meta name="description" content="">
	<meta name="author" content="">
	
	<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	
	<!-- Le styles -->
	<link href="/static/css/bootstrap.css" rel="stylesheet">
	<link href="/static/css/custom.css" rel="stylesheet">
	
	<!-- Le fav and touch icons -->
	<link rel="shortcut icon" href="/static/img/favicon.png">
	<link rel="apple-touch-icon" href="/static/img/images/location 2.png">
	<!---<link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x114.png">--->
</head>

<body>


<div class="topbar" data-dropdown="dropdown" >
	<div class="topbar-inner">
		<div class="container">
			
			<h3 class="brand"><a href="/"><span>The Local Network</span></a></h3>
			
			<!---<ul class="nav">
				<li class="active"><a href="#">Home</a></li>
				<li><a href="#about">About</a></li>
				<li><a href="#contact">Contact</a></li>
			</ul>--->
		</div>
	</div><!-- /topbar-inner -->
</div>

<div class="container">

	<div class="hero-unit shadowed">
		<h1>Hello world!</h1>
		<p>Welcome to The Local Network! We're dedicated to making your world smaller by making it more personal and more useful.</p>
		<!---<p><a class="btn primary large" href="#sites">Check out our sites &raquo;</a></p>--->
	</div>
	
	<div id="sites">
		<div class="row">
			<div class="span-one-third">
				<h3>Local Nursing Homes</h3>
				<p>Local-Nursing-Homes.com provides you with directories of Nursing Homes complete with both government rating and user ratings and reviews. Information on Home Health Providers is also featured.</p>
				<p>
					<a class="btn" href="http://local-nursing-homes.com" target="_blank">View site &raquo;</a>
					<a class="btn" href="http://v4.local-nursing-homes.com" target="_blank">View beta site &raquo;</a>
				</p>
			</div>
			<div class="span-one-third">
				<h3>Local Golf Courses</h3>
				<p>Reviews and more for courses near you!</p>
				<p>Local-Golf-Courses.com lists 18,631 golf courses spread across 22 countries, 236 states and provices, and 10,716 cities for you to choose from.</p>
				<p><a class="btn" href="http://local-golf-courses.com" target="_blank">View site &raquo;</a></p>
			</div>
			<div class="span-one-third">
				<h3>Govsites.org</h3>
				<p>Find all your local government's web sites in one place! State, county and city sites are all here.</p>
				<p><a class="btn" href="http://govsites.org" target="_blank">View site &raquo;</a></p>
			</div>
		</div>
		
		<hr>
		
		<div class="row" id="sites2">
			<div class="span-one-third">
				<h3>Local Businesses For Sale</h3>
				<p>Bringing you the latest announcements of local businesses for sale in all 50 states.</p>
				<p><a class="btn" href="http://local-businesses-for-sale.com/" target="_blank">View site &raquo;</a></p>
			</div>
			<div class="span-one-third">
				<h3>Local Rehabilitation Centers</h3>
				<p>Find rehabilitation centers in your area!</p>
				<p><a class="btn" href="http://local-rehabilitation-centers.com" target="_blank">View site &raquo;</a></p>
			</div>
			<div class="span-one-third">
				<h3>Local Private Schools</h3>
				<p>Find private schools in your area!</p>
				<p><a class="btn" href="http://local-private-schools.com" target="_blank">View site &raquo;</a></p>
			</div>
		</div>
	</div>
	
	<footer>
		<p>&copy; The Local Network <cfoutput>#year(now())#</cfoutput></p>
	</footer>
	
</div>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-51384-27']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

</body>
</html>
