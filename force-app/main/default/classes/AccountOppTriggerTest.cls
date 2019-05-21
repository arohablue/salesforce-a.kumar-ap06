@isTest
public class AccountOppTriggerTest {
    
     @TestSetup
    static void generateTestData(){
        
        List<Account> accounts = new List<Account>();
        List<Opportunity> opps = new List<Opportunity>();
        
        accounts.add(new Account(Name = 'Test1 Account'));
        accounts.add(new Account(Name = 'Test2 Account'));
        accounts.add(new Account(Name = 'Test3 Account'));
        accounts.add(new Account(Name = 'Test4 Account'));
        //mychange is
        
        Date birthDate = Date.newInstance(1995, 15, 10);
        Date closeDate = System.today().addMonths(3);
        
        insert accounts;
                
        for(Account acc  : accounts){
            
             opps.add(new Opportunity(Name = 'Test1 Opps'+acc.Id, CloseDate = closeDate.addYears(1), StageName = 'Closed Won', Amount= 240000, AccountId = acc.Id, Frequency__c= 'Yearly', Year__c = '1'));
             opps.add(new Opportunity(Name = 'Test2 Opps'+acc.Id, CloseDate = closeDate.addYears(1), StageName = 'Closed Lost', Amount= 240000, AccountId = acc.Id, Frequency__c= 'Yearly', Year__c = '1'));
			 opps.add(new Opportunity(Name = 'Test3 Opps'+acc.Id, CloseDate = closeDate.addYears(1), StageName = 'Prospecting', Amount= 240000, AccountId = acc.Id, Frequency__c= 'Yearly', Year__c = '1'));
        }
        
        insert opps;
        
    }
    
    @isTest
    static void accountDel(){
        
         List<Exception> exp = new List<Exception>();
         Account accounts = [SELECT Name FROM Account WHERE Name = 'Test1 Account'];
         Test.startTest();
        try{
            delete accounts;
        } catch(Exception e){
            exp.add(e);
        }
         Test.stopTest();
        
         System.assertNotEquals(0, exp.size());
        
    }

}