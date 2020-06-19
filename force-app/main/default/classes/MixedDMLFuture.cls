public class MixedDMLFuture {
    public static void useFutureMethod(){
        Account acc = new Account(name='My Future Account');
        insert acc;
        util.insertUserWithRole('FutureUser@gmail.com','Future','FutureUser@gmail.com','Test');
    }
    public static void useNoFutureMethod(){
        Account acc = new Account(name='My Future Account');
        insert acc;
        util.insertUserWithNoRole('FutureUser@gmail.com','Future','FutureUser@gmail.com','Test No Role');
    }
}