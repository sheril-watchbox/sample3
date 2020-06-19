public class SOSLDemo {
    public static void demo(){
        list<list<sObject>> data = [find 'test' in all fields returning
                                    Account(Id,Name),
                                    Contact(Id,Name),
                                    Lead(Id,Name)];
        list<Account> accList = data.get(0);
        list<Contact> conList = data.get(1);
        list<Lead> leadList = data.get(2);
        
        System.debug('accList '+accList);
        System.debug('conList '+conList);
        System.debug('leadList '+leadList);
    }
}