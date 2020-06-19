({
    doAdd : function(component, event, helper) {
        var f = component.get('v.val1');
        var s = component.get('v.val2');        
        component.set('v.result',parseInt(f)+parseInt(s));
    },
    doSub : function(component, event, helper) {
        var f = component.get('v.val1');
        var s = component.get('v.val2');        
        component.set('v.result',parseInt(f)-parseInt(s));
    },
    doMul : function(component, event, helper) {
        var f = component.get('v.val1');
        var s = component.get('v.val2');        
        component.set('v.result',parseInt(f)*parseInt(s));
    },
    doDivide : function(component, event, helper) {
        var f = component.get('v.val1');
        var s = component.get('v.val2');        
        component.set('v.result',parseInt(f)/parseInt(s));
    },
})