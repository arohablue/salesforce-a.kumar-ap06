public class AssignmentDml {

    public class Contacts {
        String firstName;
        String lastName;
        String email;
        String phone;
        String billAmount;
        
        public Contacts(){}

        public Contacts(String firstName, String lastName, String email, String phone, String billAmount) {
        	this.firstName =  firstName;
            this.lastName = lastName;
            this.email = email;
            this.phone = phone;
            this.billAmount = billAmount;
        }

    }
    
    public void addCustomerList(Contacts[] contacts){
        
        List<Contact> contactList = new List<Contact>();
        List<Opportunity> opprtunityList = new List<Opportunity>();
        
        Id acctID = createAccount();
        
        for(Contacts cont : contacts){
            Contact conn = new Contact(FirstName = cont.firstName, LastName = cont.lastName, Phone=cont.phone, Email = cont.email ,AccountId = acctID);
            contactList.add(conn);
            opprtunityList = createOpportunity(cont.lastName, cont.firstName, cont.billAmount);  
        }
        
        createCustomer(contactList, opprtunityList);

    }
    
    public Id createAccount(){
        
        ID acctID;
        List<Account> acnt = [SELECT Id FROM Account WHERE Name = 'globant101' LIMIT 1];
        
        if(acnt.size() == 0) {
        	// Create Account 
        	Account acct = new  Account(name= 'globant101');
        	acctID = acct.Id;
        	insert acct;
        } else {
            acctID = acnt[0].Id;
        }
        
        return acctID;
    }
    
    

    public void createCustomer(List<Contact> contactList,  List<Opportunity> opprtunityList){
       
        
        Set<String> emailSet = new Set<String>();
        List<Contact> updateContactList = new  List<Contact>() ;
        List<Contact> insertContactList = new  List<Contact>() ;
        Set<Contact> insertContactSet =  new Set<Contact>();
        
        // Insert all contacts
        for(Contact cont : contactList){
            emailSet.add(cont.email);
        }
        
        // Search if Contact With same email Exists
        updateContactList  = [SELECT Email FROM Contact WHERE Email IN :emailSet ];
        
        System.debug(updateContactList);
        
        // Insert all contacts 
         for (Contact conn : contactList){
               insertContactSet.add(conn);
            }
        
        // If there is a need to update contacts and remove them from insert list
        if(updateContactList.size() != 0){
            for (Contact conn : contactList){
                for(Contact cont : updateContactList){
                    if(conn.email == cont.email  ){
                        cont.FirstName= conn.FirstName;
                        cont.LastName= conn.LastName;
                        cont.Phone= conn.Phone;
                        insertContactSet.remove(conn); 
                    } 
                }   
            }
        } 

        insertContactList.addall(insertContactSet);
        
        System.debug(insertContactList);
        System.debug(updateContactList);
        update updateContactList;
        insert insertContactList;
        
        insertOpportunity(updateContactList, insertContactList, opprtunityList );
    }
    
    public void  insertOpportunity( List<Contact> updateContactList , List<Contact> insertContactList, List<Opportunity> opprtunityList) {
         
        for(Contact cont : insertContactList){
            for(Opportunity opp : opprtunityList){
                opp.Contact__c = cont.Id;
            }
        }
        
        for(Contact cont : updateContactList){
            for(Opportunity opp : opprtunityList){
                opp.Contact__c = cont.Id;
            }
        }
        
        insert opprtunityList;
    }

    // Function to create new opportunity
    Public  List<Opportunity>  createOpportunity(String lastName, String firstName , String amount){
        Decimal billAmountD = decimal.valueOf(amount);
		String OppName = lastName + firstName  ;	
	    List<Opportunity> opprtunityList = new List<Opportunity>(); 
        Date closeDate = Date.newinstance(2019,5,8);
        
        Opportunity op =  [select id, orderId__c from Opportunity order by createdDate DESC limit 1];
        if(op==null){
            OppName += 'O-0000';
        }
        else {
            OppName += op.orderId__c;
        }
        
        Opportunity opp = new Opportunity(name = OppName , Amount = billAmountD,  StageName = 'Prospecting', CloseDate= closeDate);
        opprtunityList.add(opp);
        
        return opprtunityList ;
    }
    
}