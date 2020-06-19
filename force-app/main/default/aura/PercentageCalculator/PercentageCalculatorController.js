({
	onclickFun : function(component, event, helper) {
        component.set('v.name',"sheril");
		alert(component.get('v.name'));
        alert(component.getName());
        alert(component.isValid());
		var age = component.find('age');
        age.set('v.value',34);
		alert(age.get('v.value'));   
        
	}
})