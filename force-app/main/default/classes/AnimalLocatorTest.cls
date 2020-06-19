@isTest
public class AnimalLocatorTest {    
    @isTest static void getAnimalNameByIdTes() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());  
        String result = AnimalLocator.getAnimalNameById(1);        // Verify that the response received contains fake values
        System.assertEquals('chicken', result);
    }
}