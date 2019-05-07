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
        
        for(Contacts cont : contacts){
            createCustomer(cont.firstName,cont.lastName,cont.email,cont.phone,cont.billAmount);
        }
    }
    
    

    public void createCustomer(String firstName, String lastName, String email, String phone, String billAmount){
       // Variables
        
        Decimal billAmountD = decimal.valueOf(billAmount);


        // Search if Contact Exists
        Contact[] con = [SELECT Email FROM Contact WHERE Email = :email];

		System.debug(con);  
        if(con.size() == 0) { 
            
            
        // Create Account 
        Account acct = new  Account(name= 'globant');
        ID acctID = acct.Id;
        insert acct;

        // Create of doesn't contact exists
        Contact conn = new Contact(FirstName=firstName,LastName=lastName,Phone=phone,Email = email ,AccountId=acctID);           
        insert conn;
        } else {
            
            // Update if contact exists
            for (Contact conn : con){
                conn.FirstName=firstName;
            	conn.LastName=lastName;
            	conn.Phone=phone;
            	update conn ;
            }
        }
        //Create new Opportunity
        createOpportunity(firstName + lastName,billAmountD);
    }

    // Function to create new opportunity
    Public void createOpportunity(String name, Decimal Amount){
        Integer Id  = 0;
        Id = Id +1;
        String OppName = name+Id;
        Date closeDate = Date.newinstance(2019,5,8);
        Opportunity opp = new Opportunity(name = OppName , Amount = Amount,  StageName = 'Prospecting', CloseDate= closeDate);
        insert opp;
    }
}