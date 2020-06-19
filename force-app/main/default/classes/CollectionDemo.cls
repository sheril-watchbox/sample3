public class CollectionDemo {
    public static void ListDemo(){
        List<String> lis = new List<String>();
        lis.add('Sheril');
        lis.add('Roshan');
        lis.add('Sherly');
        lis.add('Thomas');        
        lis.add(0, 'one');
        lis.set(0,'Two');
        System.debug('Lis Datas are '+lis); 
        
        String name = lis.get(0);
        System.debug(name);
        
        Boolean isContain = lis.contains('demo');
        System.debug(isContain);
        
        List<String> tes = new List<String>();
        tes.add('HM');
        lis.addAll(tes);
        System.debug(lis);
        
        Boolean isEmpty = lis.isEmpty();
        System.debug('is list empty ? '+isEmpty);
        
        lis.remove(1);
        System.debug('List after remove 1st index '+lis);
        
        lis.clear();
        System.debug('List after clear '+lis);
        
        /*   Set<String>  sdata = new Set<String>();
sdata.add('Sheril');
sdata.add('Roshan');
sdata.add('Sherly');
sdata.add('Thomas');
System.debug('Set Datas are '+sdata); */
    }
    public static void mapDemo(){
        map<string,String> nameMap = new map<String,String>();
        nameMap.put('1','SHERIL');
        
        system.debug(nameMap);
        system.debug(nameMap.containsKey('1')); // true since its there in the key
        
        set<string> keyset = nameMap.keySet(); // get the keys as a set of string(key should be unique)
        System.debug(keyset);
        
        List<string> keyValues = nameMap.values(); // get the keys as a List of string(values can be duplicated)
        System.debug(keyValues);
        
        String name = nameMap.get('1'); // based on the key , gettin the value
        System.debug(name); 
        
        nameMap.put('1','SHIFT'); // Updated the value for the key if the key exist otherwise it will be added
        System.debug(nameMap);
        
        map<string,String> nameMap1 = new map<String,String>();
        nameMap.put('2','SHERIL');
        nameMap.putAll(nameMap1);
        System.debug(nameMap);
        
    }
}