public class LoopDemo {
    public static void traditionalLoop(){
        for(integer i=0;i<3;i++){
            System.debug(i);
        }
    }
    public static void iterationLoop(){
        List<String> lis = new list<String>();
        lis.add('a');
        lis.add('q');
        lis.add('d');
        for(String name:lis){
            System.debug(name);
        }
    }
    public static void SOQLforLoop(){
        for(Account acc : [select name,Industry from Account limit 10]){
            if(acc.Industry != null)
                System.debug(acc.name +' '+acc.Industry);
        }
    }
}