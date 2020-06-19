public class LeadProcessor implements database.Batchable<sObject> {
    public Database.QueryLocator start(database.BatchableContext bc){
        string query = 'select id,name,LeadSource from Lead';
        return  Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc,List<Lead> leadList){
        List<Lead> leadListUpdate = new List<Lead>();
        for(Lead ld : leadList){
            ld.LeadSource = 'Dreamforce';
            leadListUpdate.add(ld);
        }
        update leadListUpdate;
    }
    public void finish(database.BatchableContext bc){
        
    } 
}