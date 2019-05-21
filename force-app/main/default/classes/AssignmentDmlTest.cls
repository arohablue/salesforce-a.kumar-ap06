@isTest
public class AssignmentDmlTest {
    
    @TestSetup 
    static void generateTestData(){
        List<AssignmentDml.Contacts> contacts = new List<AssignmentDml.Contacts>();
        List<Opportunity> opps = new List<Opportunity>();

		AssignmentDml asd = new AssignmentDml();
        Date birthDate = Date.newInstance(1995, 15, 10);
        Date closeDate = System.today().addMonths(3);
        
        opps.add(new Opportunity(Name = 'Test1 Opps', CloseDate = closeDate.addYears(1), StageName = 'Prospecting', Amount= 240000,  Frequency__c= 'Yearly', Year__c = '1'));
        opps.add(new Opportunity(Name = 'Test2 Opps', CloseDate = closeDate.addMonths(3), StageName = 'Prospecting', Amount= 2340000, Frequency__c= 'Quarterly', Year__c = '1'));
        opps.add(new Opportunity(Name = 'Test3 Opps', CloseDate = closeDate.addMonths(3), StageName = 'Prospecting', Amount= 3240000, Frequency__c= 'Yearly', Year__c = '2'));
        opps.add(new Opportunity(Name = 'Test4 Opps', CloseDate = closeDate, StageName = 'Prospecting', Amount= 245466,  Frequency__c= 'Yearly', Year__c = '2'));
        opps.add(new Opportunity(Name = 'Test5 Opps', CloseDate = closeDate, StageName = 'Prospecting', Amount= 2453000,  Frequency__c= 'Monthly', Year__c = '1'));
        
		insert opps;
        
		AssignmentDml.Contacts c1 = new AssignmentDml.Contacts('ganesh','gaitonedes','ganesh@globant.com','90940394039',1230000.0);
		Integer i = 0;
		for(i=0; i < 120; i++) {
    		contacts.add(new AssignmentDml.Contacts('test'+i,'testlastnae'+i,'test1@globant.com','909403'+i,12300+i));
		}
         asd.addCustomerList(contacts);
    }
    
    @isTest 
    static void testCreatedOpps(){
        
        Test.startTest();
       
        Test.startTest();
        
        List<Account> accs = [SELECT Name from Account WHERE Name = 'globant101'];
        List<Contact> cons = [SELECT Name from Contact WHERE Email = 'ganesh@globant.com'];
        List<Opportunity> oppps = [SELECT Name from Opportunity ];
        System.assert(accs.size()>0);
        System.assert(cons.size()>0);
        System.assert(oppps.size()>0);

    }
    
    
}