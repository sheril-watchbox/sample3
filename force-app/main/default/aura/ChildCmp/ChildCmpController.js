({
    callChildMethod : function(component, event, helper) {
        var para = event.getParam('arguments');
        debugger;
        if(para!=null){
            var para1 = para.param1;
            alert("Param 1 "+para1+ " Param2 "+para.param2);
        }
    }
})