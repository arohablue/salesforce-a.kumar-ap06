public class AnimalLocator { 

    public class Animal{
        String name;
        String eats;
        String says;
        public Animal(String name, String eats, String says)
        {
            this.eats = eats;
            this.says = says;
            this.name = name;
        }
    }

    public static String getAnimalNameById(Integer animalId) {
        String animalName;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+animalId);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
             Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            List<Animal> animals = (List<Animal>) results.get('animal');
            System.debug('Received the following animals:');
            for (Animal animal: animals) {
                animalName = animal.name;
            }
            
        }
        return animalName;
    }
}