({
    deleteRecord : function(component, event, helper) {
        component.find("recordDelete").deleteRecord($A.getCallback(function(deleteResult) {
            
            if (deleteResult.state === "SUCCESS" || deleteResult.state === "DRAFT") {
                var toast = $A.get('e.force:showToast');
                toast.setParams({
                    title : 'Record Deleted',
                    type : 'info',
                    message : 'Record has been deleted with record id '+deleteResult.recordId
                });
                toast.fire();
                var nav = component.find('nav');
                var pageReference = {    
                    "type": "standard__objectPage",
                    "attributes": {
                        "objectApiName": "Beer__c",
                        "actionName": "list"
                    },
                    "state": {
                    }
                }
                nav.navigate(pageReference);
                
            } else if (deleteResult.state === "INCOMPLETE") {
                console.log("User is offline, device doesn't support drafts.");
            } else if (deleteResult.state === "ERROR") {
                console.log('Problem deleting record, error: ' + JSON.stringify(deleteResult.error));
            } else {
                console.log('Unknown problem, state: ' + deleteResult.state + ', error: ' + JSON.stringify(deleteResult.error));
            }
        }));
    }
})