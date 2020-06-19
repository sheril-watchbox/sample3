trigger AccountTrigger on Account (after insert,after update,after delete,after undelete,
                    before insert,before update,before delete) {

    System.debug('Size '+Trigger.new.size());          
    if(Trigger.isBefore){            
        System.debug('Before Event');
        System.debug('Trigger New '+Trigger.new);
        System.debug('Trigger Old'+Trigger.old);
        System.debug('Trigger New Map '+Trigger.newMap);
        System.debug('Trigger Old Map '+Trigger.oldMap);

        if(Trigger.isInsert){
            System.debug('I am inside before Insert');
        }else if(Trigger.isUpdate){
            System.debug('I am inside before Update');
        }else if(Trigger.isDelete){
            System.debug('I am inside before Delete');
        }
    }
    else if(Trigger.isAfter){
        System.debug('After Event');
        System.debug('Trigger New '+Trigger.new);
        System.debug('Trigger Old'+Trigger.old);
        System.debug('Trigger New Map '+Trigger.newMap);
        System.debug('Trigger Old Map '+Trigger.oldMap);

        if(Trigger.isInsert){
            System.debug('I am inside after Insert');
        }else if(Trigger.isUpdate){
            System.debug('I am inside after Update');
        }else if(Trigger.isDelete){
            System.debug('I am inside after Delete');
        }else if(Trigger.isUndelete){
            System.debug('I am inside after Undelete');
        }
    }
}