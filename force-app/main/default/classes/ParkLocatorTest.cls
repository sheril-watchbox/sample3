@isTest
public class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        
        List<String> parks = new List<String>();
        parks.add('park1');
        parks.add('park2');
        
        List<String> result = ParkLocator.country('India');
        // Verify that a fake result is returned
        System.assertEquals(parks, result); 
    }
}