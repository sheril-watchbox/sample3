public with sharing class BeerSearchApexService {
    @auraenabled
    public static List<Beer__c> bearSearch(String searchText){
        string likeExp = '%'+searchText+'%';
        string query = '';
        
        if(searchText!=null)
            query  = 'select id,Name,Alcohol__c,Total_Quantity__c from Beer__c where Name like :likeExp';
        else
            query = 'select id,Name,Alcohol__c,Total_Quantity__c from Beer__c';
        List<Beer__c> searchList = Database.query(query);
        return searchList;
    }
}