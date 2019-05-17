@isTest
public class AccountWrapper_Tests {
    
    @testSetup
    static void prepareAccountData(){
        
    List<Opportunity> opps = new List<Opportunity>();
        
        Account acc = new Account(Name = 'GlowAccount');
        insert acc;
        
        Date closeDate = Date.newInstance(2020,6,7);
        
        opps.add(new Opportunity(Name = 'Test1 Opps', CloseDate = closeDate, StageName = 'Prospecting', Amount= 220000, AccountId = acc.Id, Frequency__c= 'Yearly', Year__c = '2'));
        opps.add(new Opportunity(Name = 'Test2 Opps', CloseDate = closeDate, StageName = 'Prospecting', Amount= 220000, AccountId = acc.Id, Frequency__c= 'Yearly', Year__c = '2'));
        opps.add(new Opportunity(Name = 'Test3 Opps', CloseDate = closeDate, StageName = 'Prospecting', Amount= 220000, AccountId = acc.Id, Frequency__c= 'Yearly', Year__c = '2'));
        opps.add(new Opportunity(Name = 'Test4 Opps', CloseDate = closeDate, StageName = 'Prospecting', Amount= 220000, AccountId = acc.Id, Frequency__c= 'Yearly', Year__c = '2'));
        
        insert opps; 
    }
    
    @isTest
    static void isHighPrority(){
        
        List<AccountWrapper> accounts = new List<AccountWrapper>();
        
    	for(Account a : [SELECT ID, Name FROM ACCOUNT]){
              accounts.add(new AccountWrapper(a));
              
    	}
        
        for(AccountWrapper aw : accounts){
             System.assert(aw.isHighPriority());
    	}
       
        
    }
}