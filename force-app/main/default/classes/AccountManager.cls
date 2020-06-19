@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.subStringBetween('/Accounts/','/contacts');
        Account result =  [SELECT id,name,(select id,name from contacts)
                           FROM Account
                           WHERE Id = :accountId];
        return result;
    }
}