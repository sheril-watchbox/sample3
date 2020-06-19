trigger DuplicateAccountNotAllowed on Account (before insert) {    
    for(Account acc : Trigger.New){
        List<Account> accList = [select id from Account where name=:acc.Name];
        if(accList.size() > 0){
            acc.addError('Duplicate account is there in the same name'+' '+acc.Name);
        }        
    }
}