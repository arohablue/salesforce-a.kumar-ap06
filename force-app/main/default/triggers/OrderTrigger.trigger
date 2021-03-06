trigger OrderTrigger on Order__c (before insert,before update) {
    List<Order__c> orderList=new List<Order__c>();
    List<String> orderEIdList=new List<String>();
    List<AssignmentDml.Contacts> pmList= new List<AssignmentDml.Contacts>();
    for(Order__c ord : Trigger.new){
        if (ord.Order_Id__c != null ){
            orderList.add(ord);
            orderEIdList.add(ord.Email_ID__c);
        }
        else{
            pmList.add( new AssignmentDml.Contacts(ord.First_Name__c,ord.Last_Name__c,ord.Phone__c,ord.Email_ID__c,ord.Amount__c));
        }
    }
    if(orderEIdList.size()!=0){
    OrderTriggerHelper.ExtractDetails(orderList,orderEIdList);
    }
    if(pmList.size()!=0){
    AssignmentDml d= new AssignmentDml();
    d.addCustomerList(pmList);
    }
}