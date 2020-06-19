({
    doInit : function(component, event, helper) {
        var pagRe = component.get('v.pageReference');
        if(pagRe){
            var state = pagRe.state;
            component.set('v.orderId',state.c__OrderId);
            component.find("recordViewer").reloadRecord();
        }
    }
})