({
    eventHandler : function(component, event, helper) {
		var searchText = event.getParam('searchText');
        var action = component.get('c.bearSearch');
        action.setParams({
            searchText : searchText
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            var responseValue = response.getReturnValue();
            if(state === 'SUCCESS'){
                console.log(responseValue);
                component.set('v.recordList',responseValue);
            }
            else{
                console.log(response.getError());
            }
        });
        $A.enqueueAction(action);
    },
    doUpdateCart : function(component, event, helper) {
        debugger;
        var param = event.getParam('selectedBeer');
        var cmp = component.find('header');
        cmp.updateCart(param);
    }
})