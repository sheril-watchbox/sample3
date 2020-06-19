({
    removeRecord : function(component, event, helper) {
        var index = event.currentTarget.id;
        var existingRecord = component.get('v.contactRecords');
        existingRecord.splice(index,1);
        component.set('v.contactRecords',existingRecord);
    },
    editRecord  : function(component, event, helper) {
        var index = event.currentTarget.id;
        var existingRecord = component.get('v.contactRecords');
        var selectedRecord = existingRecord[index];
        
        var evt = component.getEvent('SelectedRecordEvent');
        evt.setParams({
            'contact' :  selectedRecord
        });
        evt.fire();
    }
})