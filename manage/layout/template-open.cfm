<cfscript>
	param name="head.title" default="Manage The Local Network";
	
	
</cfscript><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<cfoutput><title>#head.title#</title></cfoutput>
	
	<!--[if lt IE 9]>
		<script src="/static/js/html5.js"></script>
	<![endif]-->
	
	<link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
	<link href="/static/css/bootstrap-2.0.1.min.css" rel="stylesheet">
	<link href="/manage/static/css/custom.css" rel="stylesheet">
	
	<link rel="shortcut icon" href="/static/img/favicon.png">
	<link rel="apple-touch-icon" href="/static/img/images/location 2.png">
	
	<script src="/static/js/head.load.min.js"></script>
</head>

<body>
<cfinclude template="/layout/navbar.cfm" />

<div class="container">