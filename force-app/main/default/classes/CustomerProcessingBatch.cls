public class CustomerProcessingBatch implements Database.Batchable<sobject> {
   
    List<String> emails = new list<String>{'sheril.thomas@happiestminds.com'};
   // emails.add('sheril.thomas@happiestminds.com');
    
    public database.QueryLocator start(Database.BatchableContext bc){
        String query = 'select Description__c , Status__c from Customer__c where 	Active__c = true';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc,list<Customer__c> data){
        list<Customer__c> updatedList = new List<Customer__c>();
        for(Customer__c cust : data){
            cust.Description__c = 'Updated from Batch';
            cust.Status__c = 'Pending';
            updatedList.add(cust);
        }
        if(updatedList.size() > 0){
            update updatedList;
        }
    }
    public void finish(Database.BatchableContext bc){
        Messaging.SingleEmailMessage mail = new messaging.SingleEmailMessage();
		AsyncApexJob a = [select  a.TotalJobItems,a.Status,a.NumberOfErrors,a.JobItemsProcessed,a.ExtendedStatus,
                          a.CreatedById,a.CompletedDate
                          from AsyncApexJob a where id=:bc.getJobId()]; 
        System.debug(a);
        
        mail.setToAddresses(emails);
        mail.setSubject('Batch process Status');
        mail.setPlainTextBody('This barch job has been proccessed '+a.TotalJobItems 
                           + 'batches with '+a.NumberOfErrors+' Failures' +' Job Proccessed are '+a.JobItemsProcessed);
        
        Messaging.sendEmail(new Messaging.SingleEmailMessage []{mail});
    }
}