({
	appEvent : function(component, event, helper) {
       var appEvent = $A.get('e.c:ApplicationEvent');
        alert('Source');
        appEvent.fire();
	}
})