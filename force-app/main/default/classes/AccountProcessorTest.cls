@IsTest
public class AccountProcessorTest {
    
    @IsTest
  private static void testAccount() {
    Test.startTest();
      List<Id> recordIds = new List<Id>();
      List<Account> AccountIds = [SELECT Id FROM Account WHERE Name = 'GenePoint'];
      
      for(Account acc : AccountIds){
          recordIds.add(acc.Id);
      }
      
      AccountProcessor.countContacts(recordIds);
      Test.stopTest();
      Account acc = [SELECT Number_of_Contacts__c FROM Account WHERE Name = 'GenePoint' LIMIT 1];
      Decimal contCount = acc.Number_of_Contacts__c;
      
      System.assertEquals(1,contCount);
    
  }

}