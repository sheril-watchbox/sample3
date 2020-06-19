({
    toogleClick : function(component, event, helper) {
        var text = component.find('text');
        $A.util.toggleClass(text,'toggle');
        
        
        var staticLabel = $A.get("$Label.c.FirstName");
        component.set('v.ar',staticLabel);
    }
})