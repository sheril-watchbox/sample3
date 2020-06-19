public class CustomerStatusUpdateHelper{
    
    public static void method(List<Customer__c> custLis , Map<id,Customer__c> oldCustLis, Map<id,Customer__c> newCustLis){        
        
        List<Invoice__c> listToUpdate = new List<Invoice__c>();
        for(Customer__c objCust : custLis){
            if(objCust.Status__c == 'Active'
               && oldCustLis.get(objCust.Id).Status__c =='InActive'){ // old status should not be active
                   Invoice__c objInv = new Invoice__c();
                   objInv.Customer__c = objCust.Id;
                   objInv.Description__c = 'Created from trigger';
                   // listToUpdate.add(objInv);
               }
        }
        if(listToUpdate.size() > 0){
            insert listToUpdate;
        }
        
       updateDescription(custLis,newCustLis);
    }
    
    public static void updateDescription(List<Customer__c> custLis,Map<id,Customer__c> newCustLis){
        List<Customer__c> custWithInvoice = [select id,name,(select id,name,description__c from invoices__r) from customer__c where id in:newCustLis.keySet()];
        
        List<invoice__c> invoiceToUpdate  = new List<invoice__c>();
        List<invoice__c> invoiceList = custWithInvoice[0].invoices__r;
        
        for(invoice__c inv : invoiceList){
            inv.description__c = 'OK TO PAY';
            invoiceToUpdate.add(inv);
        }
        update invoiceToUpdate;
        
    }
}