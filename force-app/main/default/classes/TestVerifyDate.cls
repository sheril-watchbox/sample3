@isTest
public class TestVerifyDate {
    @isTest static void positiveCase(){
        Date d = VerifyDate.CheckDates(date.newInstance(2020, 3, 8),date.newInstance(2020, 4, 1));
        System.assertEquals(date.newInstance(2020, 4, 1),d);        
    }
     @isTest static void negativeCase(){
        Date d = VerifyDate.CheckDates(date.newInstance(2020, 3, 1),date.newInstance(2020, 4, 1));
        System.assertEquals(date.newInstance(2020, 3, 31),d);        
    }
}