({
	onClick : function(component, event, helper) {
        alert("Success");
		component.set('v.childAttr','Updated From Child')
	},
    onChildAttrChange: function(cmp, evt) {
       
        alert('Old Value' +evt.getParam('oldValue'));
        alert('New Value'+evt.getParam('value'));
    }
})