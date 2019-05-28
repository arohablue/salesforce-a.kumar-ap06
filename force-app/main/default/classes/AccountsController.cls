public class AccountsController {
      @AuraEnabled
      public static List <Account> getAccounts() {
        return [SELECT Id, name, industry, Type, NumberOfEmployees, TickerSymbol, Phone FROM Account ORDER BY createdDate ASC];
      }
     @AuraEnabled
     public static String getContacts(String accountId, Contact contactString) {
        contactString.AccountId = accountId;
        insert contactString;
        System.debug('here in get contacts:'+ contactString);
        return 'true';
      }
    }