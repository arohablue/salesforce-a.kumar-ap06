public class AccountsController {
      @AuraEnabled
      public static List <Account> getAccounts() {
          List<Contact_Limit__c> ContactLimits = [SELECT noOfContacts__c FROM Contact_Limit__c ];
          
          if(ContactLimits.size()> 0){
               delete ContactLimits;
          }

          Contact_Limit__c  ContactLimit = new Contact_Limit__c(noOfContacts__c = 0);
          insert ContactLimit;
          
        return [SELECT Id, name, industry, Type, NumberOfEmployees, TickerSymbol, Phone FROM Account ORDER BY createdDate ASC];
      }
    
     @AuraEnabled
     public static String addContacts(String accountId, Contact contactString) {
	 	
        List<Contact_Limit__c> ContactLimit = [SELECT noOfContacts__c FROM Contact_Limit__c LIMIT 1];
         
        Integer noContacts = (Integer) ContactLimit[0].noOfContacts__c;
           System.debug(noContacts);
        if(noContacts <= 2){
            contactString.AccountId = accountId;
        	insert contactString;
            
            ContactLimit[0].noOfContacts__c = noContacts + 1;
            update ContactLimit;
            
       	 	System.debug('here in get contacts:'+ contactString);
        	return 'true';
        } else {
             return 'Contact Limit Reached';
          }
      }
}