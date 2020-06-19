({
    createContact : function(component, event, helper) {
        var validExpense = component.find('contactForm').reduce(function (validSoFar, inputCmp) {
            
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        if(!validExpense)
            return;
        
        var action = component.get('c.saveContact');
        action.setParams({
            con : component.get('v.newContact'),
            AccountId : component.get('v.accountId')
        });
        
        action.setCallback(this,function(response){
            var state = response.getState();
            alert(state);
            if(state === 'SUCCESS'){
                var compEvent = component.getEvent('quickContact');
                debugger;
                compEvent.setParams({
                    contactRecord : response.getReturnValue()
                });
                compEvent.fire();
            }            
            else if(state === 'ERROR'){
                var error = response.getError();
                console.log(error);
            }  
        });
        $A.enqueueAction(action);
    }
})