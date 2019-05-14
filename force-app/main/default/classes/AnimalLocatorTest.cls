@isTest
private class AnimalLocatorTest  {
    @isTest static  void AnimalLocatorMock () {
        // Create the mock response based on a static resource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('AnimalNameResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Associate the callout with a mock response
        Test.setMock(AnimalLocatorMock.class, mock);
        // Call method to test
        String animalName = AnimalLocator.getAnimalNameById(1);

        System.assertEquals('chiken', animalName);        
    }   

}