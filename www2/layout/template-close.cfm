
	
	<cfoutput>
	<footer>
		<hr>

		<div>
			<a href="http://the-local-network.com/legal/TermsAndConditions.cfm">Terms and Conditions of Use</a>
			| <a href="http://the-local-network.com/legal/PrivacyPolicy.cfm">Privacy Policy</a>
			| <a href="http://the-local-network.com/legal/ContentGuidelines.cfm">Content Policies and Guidelines</a>
		</div>
		<div>&copy;2011<cfif Year(Now()) NEQ "2011">-#Year(now())#</cfif> <a href="http://the-local-network.com/">The Local Network, LLC</a></div>
	</footer>
	</cfoutput>
	
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="/static/js/bootstrap-2.0.min.js"></script>
<script src="/static/js/scripts.js"></script>
<script src="https://www.google.com/coop/cse/brand?form=cse-search-box&amp;lang=en"></script>

<script type="text/javascript">

	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-51384-27']);
	_gaq.push(['_trackPageview']);
	_gaq.push(['_trackPageLoadTime']);

	try {
		if (document.referrer.match(/google\.com/gi) && document.referrer.match(/cd/gi)) {
			var myString = document.referrer;
			var r = myString.match(/cd=(.*?)&/);
			var rank = parseInt(r[1]);
			var kw = myString.match(/q=(.*?)&/);
			
			if (kw[1].length > 0) {
				var keyWord = decodeURI(kw[1]);
			}
			else {
				keyWord = "(not provided)";
			}
			
			var p = document.location.pathname;
			_gaq.push(['_trackEvent', 'RankTracker', keyWord, p, rank, true]);
		}
	}
	catch(err){}

	(function() {
		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	})();

</script>

</body>
</html>
