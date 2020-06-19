({
	callInit : function(component, event, helper) {
		var device = $A.get('$Browser.formFactor');
        //alert(device);
        var localeLan = $A.get('$Locale.language');
        alert(localeLan);
	}
})