public class BatchClassDemo implements database.Batchable<sObject> {
    public database.QueryLocator start(database.BatchableContext bc){
        String query = 'select id,name,Description from Contact';
        return database.getQueryLocator(query);        
    }
    public void execute(database.BatchableContext bc,List<Contact> conList){
        List<Contact> con = new List<Contact>();
        for(Contact c : conList){
            c.Description = 'Description is updated from batch class';
            con.add(c);
        }
        update con;        
    }
    public void finish(Database.BatchableContext bc){
        
    }
}