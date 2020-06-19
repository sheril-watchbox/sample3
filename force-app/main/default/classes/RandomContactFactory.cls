public class RandomContactFactory {
    public static list<Contact> generateRandomContacts(integer numOfContacts, String lastName){
        List<Contact> contacts = new list<Contact>();
        
        for(integer i=0;i<numOfContacts;i++){
            Contact c = new Contact(FirstName='Test '+i,LastName=lastName);
            contacts.add(c);
        }
        return contacts;
    }
    
}