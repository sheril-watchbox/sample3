({
	doCall : function(component, event, helper) {
		var childCmp = component.find('child');
        childCmp.child('I am from parent',"Test");
	}
})