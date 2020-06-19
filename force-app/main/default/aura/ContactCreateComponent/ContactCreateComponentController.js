({
	addReview : function(component, event, helper) {
        var validExpense = component.find('newContact').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        if(validExpense){
            var evt = component.getEvent('create');
            evt.setParams({
                'contactList': component.get('v.ContactRecord')
            });
            evt.fire();
        }
        else{
            alert('Failure')
        }
	},
    handleMethod :function(component, event, helper) {      
        debugger;
        var param = event.getParam('arguments');
        if(param){
            var contact = param.contact;
            component.set('v.ContactRecord',contact);
        }
        
    }
})