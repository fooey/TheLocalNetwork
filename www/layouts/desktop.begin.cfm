<cfset defaultCanonical = "http://#application.canon.domain & cgi.script_name#" />
<cfif len(cgi.query_string)>
	<cfset defaultCanonical = listAppend(defaultCanonical, cgi.query_string, "?") />
</cfif>

<cfparam name="attributes.title" default="">
<cfparam name="attributes.metaDescription" default="#attributes.title#">
<cfparam name="attributes.canonical" default="#defaultCanonical#">

<cfprocessingdirective pageencoding="utf-8">
	
<cfoutput>
	
	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US">
<head>
	<!--[if lte IE 8]><meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /><![endif]-->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
	<title>#trim(attributes.title)#</title>
	<meta name="Description" content="#trim(attributes.metaDescription)#" />
	<meta name="canonical" content="#attributes.canonical#" />
	
	<link href="//cdn.the-ln.com/Karma/style.css" rel="stylesheet" type="text/css" />
	<!--[if lte IE 8]><link rel="stylesheet" type="text/css" href="css/lt8.css" media="screen"/><![endif]-->
	<link href="//cdn.the-ln.com/Karma/contact-form/css/standard.css" rel="stylesheet" type="text/css" />
	
	<link href="//cdn.the-ln.com/Karma/css/karma-royal-blue.css" rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" href="./img/marker2-square.png"/>
	<link href='http://fonts.googleapis.com/css?family=Indie+Flower&subset=latin&v2' rel='stylesheet' type='text/css'>
	<style>
		##menu-main-nav li strong {font-family: "Indie Flower"; font-size: 24pt; text-transform: none; font-weight: normal;}
		.logo { position:relative; top: -15px; left: 24px}
	</style>

</head>

<body>
<div id="wrapper">
<div id="header">
<div class="top-block">
<div class="top-holder">



<!-- ***************** - Top Toolbar Left Side - ***************** -->
 <div class="sub-nav">
	 <ul>
		 <li><a href="./">Home</a></li>
		 <li><a href="./sitemap.cfm">Sitemap</a></li>
		 <li><a href="./contact.cfm">Contact</a></li>
	 </ul>
 </div><!-- end sub-nav -->
 <!-- ***************** - END Top Toolbar Left Side - ***************** -->
 


<!-- ***************** - Top Toolbar Right Side - ***************** -->
<div class="sub-nav2">
    <ul><!---
	    <li><a href="//blog.the-local-network.com">The Local Network Blog</a></li>
	    <li><a href="http://www.twitter.com/TheLocalNetwork">@TheLocalNetwork</a></li>
    ---></ul>
</div><!-- end sub-nav2 -->
<!-- ***************** - END Top Toolbar Right Side - ***************** -->



</div><!-- end top-holder -->
</div><!-- end top-block -->




<div class="header-holder">
<div class="rays">
<div class="header-area">


<!-- ***************** - LOGO - ***************** -->
<a href="./" class="logo"><img src="./img/logo.sm.png" alt="The Local Network" /></a>
<!-- ***************** - END LOGO - ***************** -->




<!-- ***************** - Main Navigation - ***************** -->
<ul id="menu-main-nav">

<li<cfif cgi.script_name EQ "/network.cfm"> class="current_page_item"</cfif>><a href="network.cfm"><span><strong>Sites</strong><span class="navi-description">the local network</span></span></a>
<ul class="sub-menu">
    <li><a href="http://local-nursing-homes.com">Local Nursing Homes</a></li>
    <li><a href="http://local-businesses-for-sale.com">Local Businesses For Sale</a></li>
    <li><a href="http://local-rehabilitation-centers.com">Local Rehabilitation Centers</a></li>
    <li><a href="http://local-private-schools.com/">Local Private Schools</a></li>
    <li><a href="http://govsites.org/">GovSites.org</a></li>
</ul>
</li>


<li<cfif cgi.script_name EQ "/news.cfm"> class="current_page_item"</cfif>><a href="news.cfm"><span><strong>News</strong><span class="navi-description">what's going on</span></span></a>
<ul class="sub-menu">
    <li><a href="http://www.twitter.com/TheLocalNetwork">@TheLocalNetwork</a></li>
    <li><a href="http://www.twitter.com/NursingHomeNews">@NursingHomeNews</a></li>
    <li><a href="http://www.twitter.com/Businesses2Sell">@Businesses2Sell</a></li>
    <li><a href="http://www.twitter.com/RehabCenterNews">@RehabCenterNews</a></li>
</ul>
</li>

<li<cfif cgi.script_name EQ "/contact.cfm"> class="current_page_item"</cfif>><a href="contact.cfm"><span><strong>Contact</strong><span class="navi-description">get in touch</span></span></a></li>
<!---<li><a href="http://blog.the-local-network.com"><span><strong>Blog</strong><span class="navi-description">articles &amp; ideas</span></span></a></li>--->
</ul>
<!-- ***************** - END Main Navigation - ***************** -->




</div><!-- header-area -->
</div><!-- end rays -->
</div><!-- end header-holder -->
</div><!-- end header -->
 
 

 
<div id="main">
<div class="main-area home-main-area flash-main-area">
<div class="main-holder home-holder">




</cfoutput>