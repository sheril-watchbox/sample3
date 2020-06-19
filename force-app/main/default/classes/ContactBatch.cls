global with sharing class ContactBatch implements Database.Batchable<SObject>,Database.stateful {
    
    global Integer totalCount = 0;
    global Integer successCount = 0;
    global Integer failureCount = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        
        AsyncApexJob[] jobs = [select id,ApexClassID,CompletedDate,ExtendedStatus,
                               JobItemsProcessed,JobType,MethodName,NumberOfErrors,Status,
                               TotalJobItems from AsyncApexJob
                               where id=:bc.getJobId()] ;
        System.debug('Batch class start method '+jobs);
        
        String query = 'select id,Name,Fax,Email,MobilePhone,Description,Account.Name,Account.Rating,'+
            'Account.Phone,Account.Fax,Account.Industry from contact order by name desc limit 10';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc,List<Contact> conLis){
        Integer size = conLis.size();
        totalCount = totalCount + size;
        for (Integer i = 0; i < size; i++) {
            Contact con = conLis.get(i);
            if(con.Fax == null || con.Fax == ''){
                con.Fax = con.Account.Fax;
            }
            if(con.MobilePhone == null || con.MobilePhone == ''){
                con.MobilePhone = con.Account.Phone;
            }
            con.Email = 'sherilthomas100@gmail.com';
            con.Description = con.Account.Name + ' '+con.Account.Industry +' '+ con.Account.Rating
                +' '+con.Email;        
            
        }        
        // upsert conLis;
        Database.SaveResult[] result =  Database.update(conLis,false) ;    
        Integer resSize =  result.size();
        for (Integer i = 0; i < resSize; i++) {
            Database.SaveResult re = result.get(i);
            if (re.isSuccess()) {
                successCount = successCount + 1;
            }
            else {
                failureCount = failureCount + 1;
            }
        }    
        
        AsyncApexJob[] jobs = [select id,ApexClassID,CompletedDate,ExtendedStatus,
                               JobItemsProcessed,JobType,MethodName,NumberOfErrors,Status,
                               TotalJobItems from AsyncApexJob
                               where id=:bc.getJobId()] ;
        System.debug('Batch class Parent method '+jobs);
        
        AsyncApexJob[] job = [select id,ApexClassID,CompletedDate,ExtendedStatus,
                              JobItemsProcessed,JobType,MethodName,NumberOfErrors,Status,
                              TotalJobItems from AsyncApexJob
                              where id=:bc.getChildJobId()] ;
        System.debug('Batch class Child method '+job);
    }
    global void finish(Database.BatchableContext bc){
        
        Messaging.singleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setSubject('Status of  batch class : ContactBtach ');
        email.setSenderDisplayName('Demo');
        email.setHtmlBody('Dear Customer,<br/> Batch proccessed'
                          +'<br/>Total Record Proccessed '+totalCount
                          +'<br/>Successfull record count '+successCount
                          +'<br/>Failure Count '+failureCount);
        
        email.setToAddresses(new List<String> {'sherilthomas100@gmail.com'});
        List<Messaging.singleEmailMessage> emails = new List<Messaging.singleEmailMessage>();
        emails.add(email);
        Messaging.sendEmail(emails, false);
        
        AsyncApexJob[] job = [select id,ApexClassID,CompletedDate,ExtendedStatus,
                              JobItemsProcessed,JobType,MethodName,NumberOfErrors,Status,
                              TotalJobItems from AsyncApexJob
                              where id=:bc.getChildJobId()] ;
        System.debug('Batch class Finish method '+job);
        
    }
}