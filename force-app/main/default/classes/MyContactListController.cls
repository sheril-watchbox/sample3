public class MyContactListController {
	@auraenabled
    public static List<Contact> getContacts(Id recordId){
        return [Select Id, FirstName, LastName, Email, Phone From Contact Where AccountId = :recordId];
    }
}