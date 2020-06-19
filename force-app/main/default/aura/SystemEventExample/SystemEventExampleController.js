({
	showAlert : function(component, event, helper) {
		alert('Value Changed using system event');
	},
    doChange : function(component, event, helper) {
        component.set('v.Name',"Name Changes");
    },
    doInit :function(component, event, helper) {
         component.set('v.Name',"Hello World");
    }
})