public class StringArrayTest {
    public static List<String> generateStringArray(integer indexLength){
        List<String> myArray = new List<String>();
        for(integer i=0;i<indexLength;i++){
            myArray.add('Test'+i);
            System.debug(myArray);
        }
        return myArray;
    }  
}