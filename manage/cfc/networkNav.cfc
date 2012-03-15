component 
output="false" {
	
	public function init(){
		return this;
	}
	
	
	public function getFacilityLink(
		required siteId,
		required uid,
		facilityType
	) {
		local.site = application.cfc.sites.getSiteBeanByid(arguments.siteId);
		
		if(local.site.getId() EQ 1){
			local.link = "//" & local.site.getUrl() & "/?go=" & arguments.uid;
		}
		
		return local.link;
	}
}