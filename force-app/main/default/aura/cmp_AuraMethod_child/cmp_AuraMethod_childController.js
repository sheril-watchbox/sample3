({
	doAction : function(component, event, helper) {
		var params = event.getParam("arguments");
        if(params){
            var arg1 = params.param;
            var arg2 = params.param1;
            component.set('v.no_times',arg1);
        }
	},

})