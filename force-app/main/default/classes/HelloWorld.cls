public class HelloWorld {
    public static void method(){
      /*  Account acc = new Account(Name='HDFC');
        insert acc;        
        id accId = acc.id;        
        Contact con = new Contact(AccountId=accId,LastName='HDFC Contact');
        insert con; */
        
        //Child to parent
        /*Contact con = [select id,Account.Name,Account.Description from Contact where LastName='HDFC Contact' limit 1];
        con.Email = 'hdfc@s.com';
        con.Account.Description = 'Description from APEX Class';
        
        update con;
        update con.Account;*/
        
      /* Account[] accList = [select name,(select LastName,Email from Contacts) from Account where Name='HDFC' or Name='Acme'];
        for(Account acc : accList){
            List<Contact> con = acc.contacts;
            for(Contact cons : con){
                System.debug(acc.Name + ' : '+cons.Email);                
            }
        }*/
            //System.debug('Contact for acc '+ acc.name +' is '+acc.contacts[0].Email); 
        
        /*Contact[] cons = [select Account.Name,LastName,Email from Contact where LastName='HDFC Contact'];
		System.debug(cons[0].LastName);*/
        List<list<sobject>> searchText = [find 'HDFC or ACME' in all fields returning Account(Name),Contact(LastName,FirstName)];
        List<Account> accList = searchText[0];//Account
        List<Contact> conList = searchText[1];//Contact
        for(Account acc : accList){
            System.debug('Data From Account'+acc.Name);
        }
        for(Contact con:conList){
            System.debug('Data From Contact'+con.FirstName +' '+con.LastName);
        }
    } 
}