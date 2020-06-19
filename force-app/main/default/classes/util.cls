public class util {
    public static void insertUserWithRole(String uname, String al, String em, String lname){
        Profile p = [select id from Profile where name='Standard User'];
        UserRole r = [select id from UserRole where name='COO'];
        User u = new User(Alias=al,Email=em,EmailEncodingKey='UTF-8',LastName=lname,
                         LanguageLocaleKey='en_US',LocaleSidKey='en_US',TimeZoneSidKey='America/Los_Angeles',
                         ProfileId=p.Id,UserRoleId=r.Id,Username= uname);
        insert u;
    }
    public static void insertUserWithNoRole(String uname, String al, String em, String lname){
        Profile p = [select id from Profile where name='Standard User'];
        User u = new User(Alias=al,Email=em,EmailEncodingKey='UTF-8',LastName=lname,
                         LanguageLocaleKey='en_US',LocaleSidKey='en_US',TimeZoneSidKey='America/Los_Angeles',
                         ProfileId=p.Id,Username= uname);
        insert u;
    }
}