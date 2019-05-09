public class AssignmentDml {

    public class Contacts {
        String firstName;
        String lastName;
        String email;
        String phone;
        Decimal billAmount;
        
        public Contacts(){}

        public Contacts(String firstName, String lastName, String email, String phone, Decimal billAmount) {
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
            opprtunityList.add(createOpportunity(cont.billAmount));  
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
         
        String orderId = '' ;
        Opportunity op =  [select id, orderId__c from Opportunity order by createdDate DESC limit 1];
        if(op==null){
            orderId += 'O-0000';
        }
        else {
            orderId += op.orderId__c;
        }
        
        for(Contact cont : insertContactList){
            for(Opportunity opp : opprtunityList){
                String OppName = cont.LastName + cont.FirstName  ;	
                opp.Contact__c = cont.Id;
                opp.Name = OppName + orderId;
            }
        }
        
        for(Contact cont : updateContactList){
            for(Opportunity opp : opprtunityList){
                String OppName = cont.LastName + cont.FirstName  ;	
                opp.Contact__c = cont.Id;
                opp.Name = OppName +orderId;
            }
        }
        
        insert opprtunityList;
    }

    // Function to create new opportunity
    Public  Opportunity createOpportunity( Decimal amount){
	
	    List<Opportunity> opprtunityList = new List<Opportunity>(); 
        Date closeDate = Date.newinstance(2019,5,8);
        
        Opportunity opp = new Opportunity( Amount = amount,  StageName = 'Prospecting', CloseDate= closeDate);
        
        
        return opp ;
    }
    
}