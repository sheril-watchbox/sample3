({
    // Load items from Salesforce
    doInit: function(component, event, helper) {
       var action = component.get("c.getItems");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    handleAdditem : function(component, event, helper) {
        var action = component.get("c.saveItem");
        var newItem = event.getParam("item");
        action.setParams({
            "campingItem": newItem
        });

        action.setCallback(this, function(response){
            var state = response.getState();

            if (state === "SUCCESS") {
                var campingItems = component.get("v.items");
                campingItems.push(response.getReturnValue());
                component.set("v.items", campingItems);
            }
        });
        $A.enqueueAction(action);
    }
})