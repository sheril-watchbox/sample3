@IsTest
public class AccountManagerTest {
	@isTest static void testGetAccountById() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://yourInstance.salesforce.com/services/apexrest/Accounts/'+ recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test record', thisAccount.name);
    }
    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account accountTest = new Account(
            name='Test record');
        insert accountTest;
        Contact conTest = new Contact(lastName='Test Record',AccountId=accountTest.Id);
        insert conTest;
        
        return accountTest.Id;
    }   
}