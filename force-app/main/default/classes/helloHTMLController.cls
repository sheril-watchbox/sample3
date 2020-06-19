public class helloHTMLController {
    private final String[] arrayItems;

    @auraEnabled
    public static List<String> getColor(){
         String[] arrayItems = new String[]{ 'red', 'green', 'blue' };
             return arrayItems;
    }
}