({
    getNumbers : function(component, event, helper) {
        var arr = [];
        for(var i=0;i<10;i++){
            arr.push(i);
        }
        component.set('v.num',arr);
    },
    checkStt : function(component,event,helper){
        var theComp = component.get('v.edit');
        component.set('v.edit',!theComp);      	      
    },
})