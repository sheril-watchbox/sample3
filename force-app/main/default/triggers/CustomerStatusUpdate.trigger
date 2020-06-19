trigger CustomerStatusUpdate on Customer__c (after insert) {
    
    if(Trigger.isAfter && Trigger.isInsert){
        CustomerStatusUpdateHelper.method(Trigger.New,Trigger.oldMap, Trigger.newMap);
    }
    else if(trigger.isBefore && trigger.isInsert){
    }
    else if(trigger.isBefore && trigger.isUpdate){
    }
    else if(trigger.isAfter && trigger.isUpdate){
    }
}