({
    handleEvent : function(component, event, helper) {   
        var data = event.getParam('contactList');
        var conData = component.get('v.conList');    
        if(conData === null){
            conData = [];
        }
        conData.push(data);
        component.set('v.conList',conData);
    },
    saveContact : function(component, event, helper) {
        debugger;
        var action = component.get('c.save');
        console.log(JSON.stringify(component.get('v.conList')));
        console.log(component.get('v.recordId'));
        action.setParams({
            'con' : component.get('v.conList'),
            'AccountId' : component.get('v.recordId')
        });
        action.setCallback(this,function(response){
            debugger;
            var state = response.getState();
            if(state === 'SUCCESS' || state === 'DRAFT'){
                $A.get('e.force:refreshView').fire();
            }else if(state === 'INCOMPLETE'){
                
            }else if (state === 'ERROR'){
                
            }
        });
        $A.enqueueAction(action);
    },
    handleEdit : function(component, event, helper) {
        debugger;
        var evt = event.getParam('contact');
       
        var cmp = component.find('createContact');
        cmp.editContact(evt);
    }
})