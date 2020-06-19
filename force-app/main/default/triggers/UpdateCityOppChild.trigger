trigger UpdateCityOppChild on Account (before update) {
    List<Opportunity> oppUpdate = new List<Opportunity>();
    for(Account acc : Trigger.New){//Bulkify
        list<Opportunity> oppList =  [select City__c,id from Opportunity where AccountId=:acc.id];
        for(Opportunity opp : oppList){
            opp.City__c = acc.City__c;
            oppUpdate.add(opp);
        }
    }
    if(oppUpdate.size() > 0){
        update oppUpdate;
    }
}