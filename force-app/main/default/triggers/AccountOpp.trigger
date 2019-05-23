trigger AccountOpp on Account (before delete) {
    
    for (Account a : [SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity WHERE StageName = 'Closed Won'
                                                         OR StageName = 'Closed Lost' ) AND Id IN :Trigger.old]) {
        Trigger.oldMap.get(a.Id).addError('Cannot delete account');
    } 
        
}