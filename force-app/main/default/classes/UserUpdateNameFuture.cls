global class UserUpdateNameFuture {  
    
    @future
    public static void updateUserName(Id accId, String updatedName) {
        
         Account acc = [Select Name from Account Where Id =: accId];
         acc.Name = updatedName;
         update acc;
     
    }
    
}