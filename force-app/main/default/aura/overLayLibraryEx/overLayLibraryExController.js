({
    handleShowModal: function(component, evt, helper) {
        component.find('overlayLib').showCustomModal({
            header: "Header",
            body: 'Body',
            footer:'Footer',
            showCloseButton: true,
            closeCallback: function() {
                alert('You closed the alert!');
            }
        });
    },
    navigate : function(component, evt, helper) {
        var navService = component.find("navService");
        /*var pageReference = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'list'
            },
            state: {
                filterName: "MyAccounts"
            }
        };*/
        var pageReference = {    
            "type": "standard__component",
            "attributes": {
                "componentName": "c__BeerExplorer"    
            },    
            "state": {
                "myAttr": "attrValue"    
            }
        }
        navService.navigate(pageReference);
    },
    handleLoad : function(component, evt, helper) {
        alert('Load');
    },
    handleSubmit : function(component, evt, helper) {
        alert('Submit');
    },
    handleSuccess : function(component, evt, helper) {
        alert('Success');
    },
    handleError : function(component, evt, helper) {
        alert('Error');
    },
    createNewButton : function(component, evt, helper) {
        $A.createComponent('lightning:button',{
            label : "Created button",
            value : 'btnNew',
            onclick : component.getReference('c.handleLoad')
        },function(myButton,status,errorMessage){     
            alert(status);
            if(status === 'SUCCESS'){
                var body = component.get('v.body');
                body.push(myButton);
                component.set('v.body',body);
            }
        })
    }
})