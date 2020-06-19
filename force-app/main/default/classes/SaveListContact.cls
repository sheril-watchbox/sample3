public class SaveListContact {
	@AuraEnabled
    public static void save(List<Contact> con,String AccountId){
        for(Contact cons: con){
            cons.AccountId = AccountId;
        }
        insert con;
    }
}