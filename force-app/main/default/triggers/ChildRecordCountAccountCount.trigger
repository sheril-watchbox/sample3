trigger ChildRecordCountAccountCount on Contact (after insert,after delete) {
    List<Account> accUpdateList = new List<Account>();
    for(Contact con : Trigger.New){
        Account acc = [select id,Count__c from Account where id = :con.AccountId]; // get account fo that contact
        List<Contact> conList = [select id from Contact where AccountId =:acc.id];
        acc.Count__c = conList.size();
        accUpdateList.add(acc);
    }
    if(accUpdateList.size() > 0){
        update accUpdateList;
    }
}