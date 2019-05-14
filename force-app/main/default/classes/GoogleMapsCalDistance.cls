public class GoogleMapsCalDistance { 

    public static String getDistance( String address1, String address2) {
        String distance;
        JSON2Apex j2a ;
        Http http = new Http();
        String key = 'AIzaSyC87l_mrayUyKsEAalgm_HC-chhAsnTxUw';
        HttpRequest request = new HttpRequest();
        String url = 'https://maps.googleapis.com/maps/api/distancematrix/json' + '?origins=' +
         address1 + '&destinations=' + address2 + '&mode=driving' + '&sensor=false' + '&language=en' +
          '&units=imperial'+'&key'+key;
        request.setEndpoint(url);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into primitive data types.
             j2a = JSON2Apex.parse(response.getBody());
            
        }
        JSON2Apex.Elements du =  new JSON2Apex.Elements() ;
		 
        //System.debug(du.value);
        return distance;
    }
}