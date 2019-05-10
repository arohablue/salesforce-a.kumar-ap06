public class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> recordIds) {
        List<Account> accounts = new List<Account>();
        Map<Id,Integer> noOfContacts = new Map<Id,Integer>();
        
        
        for(Id id : recordIds){
            
            List<Contact> contacts = [Select Id, Name from Contact Where AccountId =:id];
            noOfContacts.put(id, contacts.size());     
        }
        
        for(Id id : recordIds){
            Account acc = [Select Id, Name from Account Where Id =:id];
            acc.Number_of_Contacts__c = noOfContacts.get(id);
            accounts.add(acc);
        }
        update accounts;
 
    }
    
}