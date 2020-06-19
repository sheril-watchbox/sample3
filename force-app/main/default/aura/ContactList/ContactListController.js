({
    getContactList : function(component, event, helper) {
        var action = component.get('c.getContact');
        action.setParams({
            AccountId : component.get('v.recordId')
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            var responseValue = response.getReturnValue();
            if(state === 'SUCCESS'){
                component.set('v.contact',responseValue);
                
            }
            else if(state === 'ERROR'){
                
            }
        });
        $A.enqueueAction(action);
    },
    doRedirect : function(component, event, helper) {
        var evtSource = event.getSource();
        var contactId = evtSource.get('v.name');
        
        var navEvt = $A.get('e.force:navigateToSObject');
        navEvt.setParams({
            recordId : contactId,
            slideDevName : 'detail'
        });
        navEvt.fire();        
    },
    handleComponentEvent : function(component, event, helper) {
        debugger;
        var contactRecord = event.getParam('contactRecord');
        var availaleContact = component.get('v.contact');
        availaleContact.push(contactRecord);
        component.set('v.contact',availaleContact);
    }
})