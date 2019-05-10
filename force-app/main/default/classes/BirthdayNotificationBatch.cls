global class BirthdayNotificationBatch implements Database.Batchable<sObject> {
    
    global Database.queryLocator start(Database.BatchableContext bc) {
        Date tody = system.today();
        String SOQL = 'SELECT Id, Name, Email__c FROM Contact WHERE DAY_IN_MONTH(Date_of_Birth__c) = ' + 
                      tody.day() +  ' AND CALENDAR_MONTH(Date_of_Birth__c) = ' + tody.month();
        return Database.getQueryLocator(SOQL);
    }

    global void execute(Database.BatchableContext bc, List<Contact> contacts) {
         List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
        for(Contact c : contacts ) {
            List<String> toAddresses = new List<String>{c.Email};           
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(toAddresses);
            mail.setSubject('Happy Birthday');
            String messageBody = 'Happy Birthday'+c.Name ;
                                 
            mail.setHtmlBody(messageBody); 
            mailList.add(mail);          
        } 
        Messaging.sendEmail(mailList);        
    }

    global void finish(Database.BatchableContext bc) {
    }
}