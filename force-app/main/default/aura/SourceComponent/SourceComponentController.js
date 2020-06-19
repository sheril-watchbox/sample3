({
	fireEvent : function(component, event, helper) {
		var evt = component.getEvent('sourceComponent');
		alert('I am in source component');        
        evt.fire();
	}
})