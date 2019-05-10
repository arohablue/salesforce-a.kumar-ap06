public class ContactHandler  implements ITrigger {
 
    public void bulkBefore(){}
    public void bulkAfter(){}
    public void beforeInsert(SObject so){}
    public void beforeUpdate(SObject oldSo, SObject so){}
    public void beforeDelete(SObject so){}
    public void afterInsert(SObject so){}

    public void afterUpdate(SObject oldSo, SObject so){
        
         Contact cont = (Contact)so;
         String first_name = cont.FirstName;
         String last_name  = cont.LastName;
         String updatedName = first_name + last_name;
        
         User user = [Select Name from User Where Id =:cont.OwnerId];
      	 user.LastName = updatedName;
      	 update user;

        UserUpdateNameFuture.updateUserName(cont.AccountId,updatedName);
        
        }

    public void afterDelete(SObject so){}
    public void andFinally(){}

}