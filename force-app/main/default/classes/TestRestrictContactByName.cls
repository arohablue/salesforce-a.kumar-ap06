@isTest
public class TestRestrictContactByName {

    @isTest 
    static void beforeUpdateContactName() {
        
        List<Contact> contacts = new List<Contact>();
        
        contacts.add(new Contact(LastName='Test Account'));
        contacts.add(new Contact(LastName='Your Account'));
        contacts.add(new Contact(LastName='INVALIDNAME'));
        contacts.add(new Contact(LastName='Test 2 Account'));
       
        Test.startTest();
        insert contacts;
        Test.stopTest();

        List<Contact> vcont = [SELECT Name FROM Contact WHERE LastName = :'Your Account'];
        List<Contact> icont = [SELECT Name FROM Contact WHERE LastName = :'INVALIDNAME'];
        
        System.assert(vcont.size()!=0); 
        System.assert(icont.size()==0);

    }

}