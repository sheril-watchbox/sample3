@isTest
private class InvoiceCreationTestClass {
    static testMethod void myUnitTest() {
        //create dummy data
        Customer__c cus = new Customer__c();
        cus.Name = 'Sheril';
        cus.Status__c = 'InActive';
        
        insert cus;
        
        Test.startTest();
        cus.Status__c = 'Active';        
        update cus;
        Test.stopTest();
        
        List<Customer__c> custLis = [select id from Customer__c where id =:cus.Id];
        System.assertEquals(1, custLis.size());
        
    }
}