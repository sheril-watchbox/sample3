public class ParkLocator {
    public static List<String> country(String contry){
         ParkService.ParksImplPort park = 
            new ParkService.ParksImplPort();
        return park.byCountry(contry);
    }
}