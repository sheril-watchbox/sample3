public class AccountUpdateNameField implements database.Batchable<sObject> {
    public database.QueryLocator start(database.BatchableContext bc){
        String query = 'select Name,id from Account';
        return Database.getQueryLocator(query);
    }
    public void execute(database.BatchableContext bc , List<Account> accList){
        List<Account> accTotal = new List<Account>();
        for(Account acc : accList){
            acc.name = acc.name +' Updated from batch';
            accTotal.add(acc);
        }
        update accTotal;
    }
    public void finish(database.BatchableContext bc){
        EmailManager.sendMail('sheril.thomas@happiestminds.com', 'Account Updated Successfully', 'Account Updated Successfully');
    }

}