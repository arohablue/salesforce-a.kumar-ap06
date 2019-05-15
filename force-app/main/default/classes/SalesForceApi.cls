public class SalesForceApi {
        public static void makeGetCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://ap6.lightning.force.com/services/apexrest/Account/globant');
        request.setHeader('Authorization', 'OAuth00D0K0000024C2t!AQgAQGxN60eUTr7heRLOySOTCpku8GvsPRtPAPu75z4U7KzTvKVMadOawf13XgyRiEAA4ghw9oO6ZnNnN82oOfZqKcRi.q1U');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
			System.debug(results);
            }
        }
}