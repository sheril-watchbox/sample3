({
    updateColor : function(component, event, helper) {
        
        var action = component.get("c.getColor");
        action.setCallback(this, function(response) {
            var state = response.getState();
           
            if (state === "SUCCESS") {
                var stringItems = response.getReturnValue();
                component.set("v.favoriteColors",stringItems);
            }           
        });
         $A.enqueueAction(action);
    },
    doInit : function(component,event,helper){ 
       
        var arr = ['Test','Test1'];
        component.set('v.favoriteColors', arr);
    }
})