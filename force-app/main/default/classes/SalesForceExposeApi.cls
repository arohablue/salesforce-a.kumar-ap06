@RestResource(urlMapping='/Account/*')
global class SalesForceExposeApi {
    
    @HttpGet
    global static List<Account> getAccountByName() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String name = request.requestURI.substring(
          request.requestURI.lastIndexOf('/')+1);
        List<Account> result =  [SELECT Name FROM Account WHERE Name = :name];
        System.debug(result);
        return result;
    }

}