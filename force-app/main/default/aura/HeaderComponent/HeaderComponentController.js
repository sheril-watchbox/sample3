({
	getCartDetails : function(component, event, helper) {
		 debugger;
        var param = event.getParam('arguments');        
        var carList = component.get('v.CartList');
        carList.push(param.selcetedRecord);
        component.set('v.CartList',carList);
        
        var toast = $A.get('e.force:showToast');
        toast.setParams({
            message : "Added to cart successfully",
            title : 'Success',
            type : 'Success'
        });
        toast.fire();
    }
})