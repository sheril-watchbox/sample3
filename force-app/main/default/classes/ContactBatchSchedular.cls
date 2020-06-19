public class ContactBatchSchedular implements System.Schedulable{
    public void execute(System.SchedulableContext SC){
        //execute a schedular for batch class
        ContactBatch bc = new ContactBatch();
        Database.executeBatch(bc);
        
        CronTrigger ct = [SELECT Id, CronJobDetailId, NextFireTime, PreviousFireTime, State,
                          StartTime, EndTime, CronExpression, TimeZoneSidKey, OwnerId, LastModifiedById, 
                          CreatedById, CreatedDate, TimesTriggered
                          FROM CronTrigger where id=:SC.getTriggerId()]; 
    }
}