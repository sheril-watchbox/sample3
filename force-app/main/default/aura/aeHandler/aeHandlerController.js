({
	handleApplicationEvent : function(component, event, helper) {
        var message = event.getParam("message");
        component.set('v.messageFromEvent',message);
        
        var count = component.get('v.numEvents');
        count++;
         component.set('v.numEvents',count);
	}
})