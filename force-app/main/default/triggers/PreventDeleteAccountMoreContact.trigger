trigger PreventDeleteAccountMoreContact on Account (before delete) {    
    for(Account acc : Trigger.New){
        List<Contact> conList = [select id from Contact where AccountId = :acc.Id];
        if(conList.size()>1){
            acc.adderror('Cannot delete an account having 2 or more contacts');            
        }
    }
}