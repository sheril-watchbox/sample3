({
    active : function(component, event, helper) {
        var tab = event.getSource();
        var tabId = tab.get('v.id');
        switch(tabId){
            case 'Contact' :
                component.set('v.label','Contact');
                break;
            case 'Account' :
                component.set('v.label','Account');
                break;
            case 'Case' :
                component.set('v.label','Case');
                break;
        }
        
    }
})