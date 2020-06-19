({
    doInit : function(component, event, helper) {
        // Prepare a new record from template
        component.find('recordCreator').getNewRecord(
            'Beer__c',
            null,
            false,
            $A.getCallback(function(){
                
                var record = component.get('v.record');
                var error = component.get('v.recordError');
                if(error || record === null){
                    console.log('Error while creating the template '+error)
                }
                else
                {
                    console.log('Successfully initate the template');
                    alert('Successfully initate the template');
                }
            })
            
        );
    },
    saveRecord : function(component , event , helper){
        component.find('recordCreator').saveRecord(function(saveResult){
            if(saveResult.state === 'SUCCESS' || saveResult.state === 'DRAFT'){
                var toast = $A.get('e.force:showToast');
                toast.setParams({
                    title : 'Record Saved',
                    type : 'success',
                    message : 'Record has been saved with record id '+saveResult.recordId
                });
                toast.fire();
            }else if(saveResult.state === 'INCOMPLETE'){
                
            }else if(saveResult.state === 'ERROR'){
                
            }
        })        
    }   
    
})