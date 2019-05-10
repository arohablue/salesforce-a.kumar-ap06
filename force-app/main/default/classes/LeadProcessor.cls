global class LeadProcessor implements Database.Batchable<sObject>{

    global Database.QueryLocator start(Database.BatchableContext bc) {
         	        Date tody = system.today();
        String SOQL = 'SELECT Id, Name, Email__c FROM Contact WHERE DAY_IN_MONTH(Date_of_Birth__c) = ' + 
                      tody.day() +  ' AND CALENDAR_MONTH(Date_of_Birth__c) = ' + tody.month();
        return Database.getQueryLocator(SOQL);
    }
    
    global void execute(Database.BatchableContext bc, List<Account> scope){
        
    }
    
    global void finish(Database.BatchableContext bc){
        
    }
}