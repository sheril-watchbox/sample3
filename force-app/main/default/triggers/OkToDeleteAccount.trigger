trigger OkToDeleteAccount on Account (before delete) {
    if(trigger.isBefore && trigger.isdelete){ // before saving the record & trigger is delete
        for(Account acc : trigger.old){
            if(acc.name != 'OkToDelete'){
                acc.addError('Cant be deleted this account');
            }            
        }
    }    
}