<cfscript>
	param name="head.title" default="The Local Network";
	param name="head.description" default=head.title;
</cfscript>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<cfoutput><title>#head.title#</title></cfoutput>
	<cfoutput><meta name="description" content="#head.description#"></cfoutput>
	
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	
	<link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
	<link href="/static/css/bootstrap-2.0.css" rel="stylesheet">
	<link href="/static/css/custom.css" rel="stylesheet">
	<link rel="shortcut icon" href="/static/img/favicon.png">
	<link rel="apple-touch-icon" href="/static/img/images/location 2.png">
</head>

<body>
<cfinclude template="/layout/navbar.cfm" />

<div class="container">