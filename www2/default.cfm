<cfscript>
	head.title = 'The Local Network';
	head.description = 'Welcome to The Local Network';
	include "/layout/template-open.cfm";
</cfscript>


<div class="hero-unit shadowed">
	<h1>Hello world!</h1>
	<p>Welcome to The Local Network! We're dedicated to making your world smaller by making it more personal and more useful.</p>
	<!---<p><a class="btn primary large" href="#sites">Check out our sites &raquo;</a></p>--->
</div>
	
	
	
<form class="well" action="/search.cfm" id="cse-search-box">
	<input type="hidden" name="cx" value="partner-pub-2680194687384513:2348099383" />
	<input type="hidden" name="cof" value="FORID:10" />
	<input type="hidden" name="ie" value="UTF-8" />
	
	<div style="text-align: center;">
		<input class="span6" type="text" name="q" id="q">
		<input class="btn btn-primary" type="submit" name="sa" id="sa" value="Search">
	</div>
	
</form>


<div class="row">
	<div class="span4">
		<h3>Local Nursing Homes</h3>
		<p>Local-Nursing-Homes.com provides you with directories of Nursing Homes complete with both government rating and user ratings and reviews. Information on Home Health Providers is also featured.</p>
		<p>
			<a class="btn" href="http://local-nursing-homes.com" target="_blank">View site &raquo;</a>
			<a class="btn" href="http://v4.local-nursing-homes.com" target="_blank">View beta site &raquo;</a>
		</p>
	</div>
	<div class="span4">
		<h3>Local Golf Courses</h3>
		<p>Reviews and more for courses near you!</p>
		<p>Local-Golf-Courses.com lists 18,631 golf courses spread across 22 countries, 236 states and provices, and 10,716 cities for you to choose from.</p>
		<p><a class="btn" href="http://local-golf-courses.com" target="_blank">View site &raquo;</a></p>
	</div>
	<div class="span4">
		<h3>Govsites.org</h3>
		<p>Find all your local government's web sites in one place! State, county and city sites are all here.</p>
		<p><a class="btn" href="http://govsites.org" target="_blank">View site &raquo;</a></p>
	</div>
</div>

<hr>

<div class="row" id="sites2">
	<div class="span4">
		<h3>Local Businesses For Sale</h3>
		<p>Bringing you the latest announcements of local businesses for sale in all 50 states.</p>
		<p><a class="btn" href="http://local-businesses-for-sale.com/" target="_blank">View site &raquo;</a></p>
	</div>
	<div class="span4">
		<h3>Local Rehabilitation Centers</h3>
		<p>Find rehabilitation centers in your area!</p>
		<p><a class="btn" href="http://local-rehabilitation-centers.com" target="_blank">View site &raquo;</a></p>
	</div>
	<div class="span4">
		<h3>Local Private Schools</h3>
		<p>Find private schools in your area!</p>
		<p><a class="btn" href="http://local-private-schools.com" target="_blank">View site &raquo;</a></p>
	</div>
</div>
	
	
	
	

<cfscript>
	include "/layout/template-close.cfm";
</cfscript>