public class ContactsController {
      @AuraEnabled
      public static List <Contact> getContacts(String accountId) {
        return [SELECT Id, name, Phone FROM Contact WHERE AccountId=:accountId];
      }
    }