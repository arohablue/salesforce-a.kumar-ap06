public class ContactSearch {

    public static List<Contact> searchForContacts(String lastName, String mailPostalCode) {
        List<Contact> contacts = [SELECT Name, MailingPostalCode
                               FROM Contact 
                               WHERE (LastName =:lastName AND MailingPostalCode =: mailPostalCode)]	;
        
        return contacts;
        
    }
    
}