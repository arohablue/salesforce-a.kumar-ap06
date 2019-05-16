public class RandomContactFactory {
    
    public static  List<Contact> generateRandomContacts(Integer noOfContacts, String LastName ){
        
         List<Contact> contacts = new List<Contact>();
         Integer i = 0;
        
        for(i=0; i <noOfContacts; i++){
            contacts.add(new Contact(FirstName = 'FirstName'+i, LastName = LastName ));
        }
        
        return contacts;
        
    }

}