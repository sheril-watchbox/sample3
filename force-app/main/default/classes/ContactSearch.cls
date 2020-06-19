public class ContactSearch {
    public static list<Contact> searchForContacts(String lastName,String postalCode){
        	Contact[] con=[select id,name from Contact where LastName=:lastName and MailingPostalCode=:postalCode];
        return con;
    }
}