<cfscript>
	head.title = 'The Local Network';
	head.description = 'Welcome to The Local Network';
	include "/layout/template-open.cfm";
</cfscript>


<div class="hero-unit shadowed">
	<h1>Hello world!</h1>
	<h2>Welcome to The Local Network!</h2>
	<p>We're dedicated to making the internet better by making it more personal and more useful.</p>
	<!---<p><a class="btn primary large" href="#sites">Check out our sites &raquo;</a></p>--->
</div>
	
<!--- 
<form action="http://the-local-network.com/search.cfm" id="cse-search-box">
  <div>
    <input type="hidden" name="cx" value="partner-pub-2680194687384513:2796089650" />
    <input type="hidden" name="cof" value="FORID:10" />
    <input type="hidden" name="ie" value="UTF-8" />
    <input type="text" name="q" size="55" />
    <input type="submit" name="sa" value="Search" />
  </div>
</form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=cse-search-box&amp;lang=en"></script>
 --->
	
<form class="well" action="/search.cfm" id="cse-search-box">
    <input type="hidden" name="cx" value="partner-pub-2680194687384513:2796089650" />
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
		<p>Local-Nursing-Homes.com provides you with directories of Nursing Homes complete with both government rating and user ratings and reviews.</p>
		<p><a class="btn" href="http://local-nursing-homes.com" target="_blank">Visit site &raquo;</a></p>
	</div>
	<div class="span4">
		<h3>Local Home Health Providers</h3>
		<p>Local-Home-Health.com provides you with directories of Home Health Providers complete with both government rating and user ratings and reviews.</p>
		<p><a class="btn" href="http://local-home-health.com/" target="_blank">Visit site &raquo;</a></p>
	</div>
	<div class="span4">
		<h3>Local Medical Supplies</h3>
		<p>Our directory contains durable and reusable medical equipment such as walkers, wheelchairs, hospital beds and more. We can help you find the medical equipment you need for your home care.</p>
		<p><a class="btn" href="http://local-medical-supplies.com/" target="_blank">Visit site &raquo;</a></p>
	</div>
</div>

<hr>

<div class="row">
	<div class="span4">
		<h3>Local Dialysis Providers</h3>
		<p>We can help you find and compare all Medicare certified dialysis facilties near you.</p>
		<p><a class="btn" href="http://local-dialysis.com/" target="_blank">Visit site &raquo;</a></p>
	</div>
	<div class="span4">
		<h3>MedicareContacts.org</h3>
		<p>Find the Medicare contact you need! Browse by
			<a href='http://medicarecontacts.org/topics' target="_blank">topic</a>,
			common <a href='http://medicarecontacts.org/questions' target="_blank">questions</a>,
			or by <a href='http://medicarecontacts.org/orgs' target="_blank">organization</a>.
		</p>
		<p><a class="btn" href="http://medicarecontacts.org/" target="_blank">Visit site &raquo;</a></p>
	</div>
	<div class="span4">
		<h3>Govsites.org</h3>
		<p>Find all your local government's web sites in one place! State, county and city sites are all here.</p>
		<p><a class="btn" href="http://govsites.org" target="_blank">Visit site &raquo;</a></p>
	</div>
</div>

<hr>

<div class="row">
	<div class="span4">
		<h3>Local Golf Courses</h3>
		<p>Reviews and more for courses near you!</p>
		<p>Local-Golf-Courses.com lists 18,631 golf courses spread across 22 countries, 236 states and provices, and 10,716 cities for you to choose from.</p>
		<p><a class="btn" href="http://local-golf-courses.com" target="_blank">Visit site &raquo;</a></p>
	</div>
	<div class="span4">
		<h3>Local Businesses For Sale</h3>
		<p>Bringing you the latest announcements of local businesses for sale in all 50 states.</p>
		<p><a class="btn" href="http://local-businesses-for-sale.com/" target="_blank">Visit site &raquo;</a></p>
	</div>
	<div class="span4">
		<h3>Jobszzle</h3>
		<p>Fresh jobs! Get'em while they're hot!</p>
		<p><a class="btn" href="http://Jobszzle.com" target="_blank">Visit site &raquo;</a></p>
	</div>
</div>

<hr>

<div class="row">
	<div class="span4">
		<h3>Local Rehabilitation Centers</h3>
		<p>Find rehabilitation centers in your area!</p>
		<p><a class="btn" href="http://local-rehabilitation-centers.com" target="_blank">Visit site &raquo;</a></p>
	</div>
	<div class="span4">
		<h3>Local Private Schools</h3>
		<p>Find private schools in your area!</p>
		<p><a class="btn" href="http://local-private-schools.com" target="_blank">Visit site &raquo;</a></p>
	</div>
	<div class="span4">
		<h3>NoSrc.net</h3>
		<p>Sometimes you just need a placeholder image</p>
		<p><a class="btn" href="http://nosrc.net" target="_blank">Visit site &raquo;</a></p>
	</div>
</div>
	
	
	
	

<cfscript>
	include "/layout/template-close.cfm";
</cfscript>