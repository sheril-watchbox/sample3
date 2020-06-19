public class ContactListController {
	@auraEnabled
    public static list<Contact> getContact(String AccountId){
        return ([select Id,FirstName,LastName,name,email,phone from contact where accountId= :AccountId]);
    }
    @auraEnabled
    public static Contact saveContact(Contact con , Id AccountId){
        con.AccountId = AccountId;
        system.debug(con +' '+ AccountId);
        upsert con;
        return con;
    }
}