({
    createContact : function(component, event, helper) {
        var evt = $A.get('e.force:createRecord');
        evt.setParams({
            "entityApiName" : "Contact",
            "defaultFieldValues" : {
                'AccountId' : component.get('v.recordId'),
                'Email' : 'sheril@gmail.com'
            } 
        });
        evt.fire();
    },
    edit  : function(component, event, helper) {
        var evtE = $A.get('e.force:editRecord');
        evtE.setParams({            
            'recordId' : component.get('v.recordId')
        });
        evtE.fire();
    },
})