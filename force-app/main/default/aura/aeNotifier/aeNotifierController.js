({
	fireRegisterEvent : function(component, event, helper) {
        var appEvent = $A.get("e.c:aeEvent");
       
        appEvent.setParams({
            "message" : "Hello Message"
        });
        appEvent.fire();
	}
})