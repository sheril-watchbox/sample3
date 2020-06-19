({
    handleChange : function(component, event, helper) {
        var searchText = component.find('searchInput').get('v.value');
        
        var evt = component.getEvent('searchEvent');
        evt.setParams({
            searchText :  searchText           
        });        
		evt.fire();        
    }
})