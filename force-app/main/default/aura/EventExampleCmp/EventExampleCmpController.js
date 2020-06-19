({
    triggerEvent : function(component, event, helper) {
        var cmp = component.find('test')
        var source = event.getSource();
        alert("From component reference "+cmp.get('v.label'));
        alert("From event reference "+ source.get('v.label'));
        
        alert('Events CurrentTarget ' +event.currentTarget); // Better to use event.getSource()
        alert('Events Target ' +event.Target);// Better to use event.getSource()    
    },
    sameEventTrigger : function(component,event,helper){
        switch(event.getSource().get('v.name')){
            case 'new':
                alert("New Button is clicked");
                break;
            case 'edit':
                alert("Edit Button is clicked");
                break;
            case 'save':
                alert("Save Button is clicked");
                break;
            case 'delete':
                alert("Delete Button is clicked");
                break;
            default:
                alert('No button is clicked');
                break;
        }
    },
    onActiveTabClick : function(component,event,helper){       
        switch (event.getSource().get('v.id')) {
            case 'tab1':
                alert("Tab 1 is selected");
                break;      
            case 'tab2':
                alert("Tab 2");
                break;
        }
    },
    toastEx : function (component, event, helper) {
        var toast = $A.get("e.force:showToast");
        if (toast){           
            toast.setParams({
                "title": "Success!",
                "message": "The component loaded successfully."
            });
            toast.fire();
        } else {
            alert("failure")
        }
    }
})