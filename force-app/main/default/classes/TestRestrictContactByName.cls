@isTest
public class TestRestrictContactByName {
	 @isTest static void createBadContact() {
         Contact c = new Contact(FirstName='SHERIL',Lastname='INVALIDNAME');
         Test.startTest();
         Database.SaveResult sv = database.insert(c,false);
         Test.stopTest();
         
         System.assert(!sv.isSuccess());
     }
}