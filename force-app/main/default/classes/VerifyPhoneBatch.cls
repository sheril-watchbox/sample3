public with sharing class VerifyPhoneBatch implements database.Batchable<sObject>,Database.AllowsCallouts {

    public String ObjectName;
    public String phoneField;
    public String statusField;
    public VerifyPhoneBatch(String ObjectName, String phoneField, String statusField) {
        this.ObjectName = ObjectName;
        this.phoneField = phoneField;
        this.statusField = statusField;
    }

    public Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'select Id, '+ phoneField + ' , ' + statusField +' From '+ ObjectName ;
        System.debug(query);
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc,List<SObject> data){
        Integer size = data.size();
        for (Integer i = 0; i < size; i++) {
            String recordId = (String) data.get(i).get('Id');
            String response = VerifyPhone.verifyNum(data.get(i),phoneField);
            data.get(i).put(statusField, response);
        }
        update data;
    }
    public void finish(Database.BatchableContext bc){

    }
}