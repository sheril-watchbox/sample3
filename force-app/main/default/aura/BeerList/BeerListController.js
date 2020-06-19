({
    viewDetails : function(component, event, helper) {
        var id = event.getSource().get('v.name');
        component.set('v.beerId',id);
        
        //Creating dynamic component
        $A.createComponent('c:BeerDetails',{
            beerId : id
        },function(beerDetails,status,errorMessage){     
            alert(status);
            if(status === 'SUCCESS'){
                // Create a modal on success
                component.find('overlayLib').showCustomModal({
                    header: "Beer Details",
                    body: beerDetails,
                    footer:'Footer',
                    showCloseButton: true,
                    closeCallback: function() {
                    }
                });
            }
            else if(status === 'INCOMPLETE'){
                console.log('No response from the server ')
            }
            else if(status === 'ERROR'){
                console.log('Error '+errorMessage)
            }
        })
    },
    addToCartHandler :  function(component, event, helper) {
        debugger;
        var index = event.getSource().get('v.value');
        var selectedData =  component.get('v.recordList')[index];
     	
        var evt = component.getEvent('updateCart');
        evt.setParams({
            selectedBeer :  selectedData
        });
        evt.fire();
    }
})