@isTest
public class LeadProcessorTest {
	  @testSetup 
    public static void setup() {
        List<Lead> leads = new List<Lead>();
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(LastName='Lead '+i, 
                Company='HappiestMinds', Status='Working Cobtacted'));
        }
        insert leads;
    }
    public static testmethod void test() {        
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
    }
}