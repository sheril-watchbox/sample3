public class AccountHandler {
    public static Account insertNewAccount(String name){
        try{
        Account acc = new Account(Name=name);
        insert acc;  
         return acc;
        }catch(DmlException e){
            System.debug('Exception occured'+e.getMessage());
            return null;
        }
    }
}