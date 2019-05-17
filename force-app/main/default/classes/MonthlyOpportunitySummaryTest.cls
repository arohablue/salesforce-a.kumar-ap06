@isTest
public class MonthlyOpportunitySummaryTest {
    
     @TestSetup
    static void generateTestData(){
        
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        
        List<Contact> contacts = new List<Contact>();
        List<Opportunity> opps = new List<Opportunity>();
        
        Date birthDate = Date.newInstance(1995, 15, 10);
        Date closeDate = System.today().addMonths(3);
        
        contacts.add(new Contact(LastName ='contactTest1', birthdate = birthDate, AccountId = acc.Id ));
        contacts.add(new Contact(LastName ='contactTest2' , birthdate = birthDate, AccountId = acc.Id));
        contacts.add(new Contact(LastName ='contactTest3', birthdate = birthDate, AccountId = acc.Id));
        contacts.add(new Contact(LastName ='contactTest4', birthdate = birthDate, AccountId = acc.Id));
        
        opps.add(new Opportunity(Name = 'Test1 Opps', CloseDate = closeDate.addYears(1), StageName = 'Prospecting', Amount= 240000, AccountId = acc.Id, Frequency__c= 'Yearly', Year__c = '1'));
        opps.add(new Opportunity(Name = 'Test2 Opps', CloseDate = closeDate.addMonths(3), StageName = 'Prospecting', Amount= 2340000, AccountId = acc.Id, Frequency__c= 'Quarterly', Year__c = '1'));
        opps.add(new Opportunity(Name = 'Test3 Opps', CloseDate = closeDate.addMonths(3), StageName = 'Prospecting', Amount= 3240000, AccountId = acc.Id, Frequency__c= 'Yearly', Year__c = '2'));
        opps.add(new Opportunity(Name = 'Test4 Opps', CloseDate = closeDate, StageName = 'Prospecting', Amount= 245466, AccountId = acc.Id, Frequency__c= 'Yearly', Year__c = '2'));
        opps.add(new Opportunity(Name = 'Test5 Opps', CloseDate = closeDate, StageName = 'Prospecting', Amount= 2453000, AccountId = acc.Id, Frequency__c= 'Monthly', Year__c = '1'));
        
        
        insert opps;
        insert contacts;
                
    }
    
    
    @isTest
    static void testMonthlyOpp(){
    
        Test.startTest();
        MonthlyOpportunity mo = new MonthlyOpportunity();
		Map<Integer,Map<String, Decimal>>  summary = mo.getOpportunitySummary(10,80);
        
        Map<String, Decimal> oppSumMonthly =new  Map<String, Decimal>();
        Map<String, Decimal> oppSumMonthly1 =new  Map<String, Decimal>();
        Map<Integer,Map<String, Decimal>> oppSumYearly = new  Map<Integer,Map<String, Decimal>>();
        
        oppSumMonthly.put('August',2698466.00);
        oppSumMonthly.put('November',5580000.00);
        oppSumMonthly1.put('August',240000.00);
        oppSumYearly.put(2019,oppSumMonthly);
        oppSumYearly.put(2020,oppSumMonthly1);

        Test.stopTest();
        
        System.assertEquals(oppSumYearly, summary);
        
        
    }
    
}