public with sharing class VerifyPhone {
    public VerifyPhone() {

    }
    public static String verifyNum(SObject data,String phoneField){        
        //http://apilayer.net/api/validate?access_key=21c9c627aa48c3cedb1433a15c7050a5
        //&number=14158586273&country_code=&format=1
        //Create endpoint url
        String endPointUrl = System.label.verifyNumUrl + System.label.verifyNumKey;

       
        String phoneValue = (String)data.get(phoneField);
        endPointUrl = endPointUrl + '&number=' + phoneValue + '&country_code=&format=1';
        // Prepare rrquest
        HttpRequest httPeq = new HttpRequest();
        httPeq.setMethod('GET');
        httPeq.setEndpoint(endPointUrl);
        httPeq.setHeader('Content-Type', 'applicaton/json');
		System.debug('EndPoint '+endPointUrl);
        Http http = new Http();
        HttpResponse res = new HttpResponse();
        try {
            res = http.send(httPeq);
            if(res.getStatusCode() == 200){
                String respone = res.getBody();
                //data.put(statusField, respone); // update the status field
                //update data;
                return respone;
                
            }else{
                String respone = res.getBody();
                //data.put(statusField, respone); // update the status field
                //update data;
                return respone;
            }
            
        } catch (Exception e) {
            System.debug('Exception occured while callout');
            return '';
        }
        
    }
}