global class BirthdayScheduleJob implements Schedulable{
    
    global void execute(SchedulableContext ctx) {
        BirthdayNotificationBatch myBatchObject = new BirthdayNotificationBatch();
        Id batchId = Database.executeBatch(myBatchObject, 1);
    }
}