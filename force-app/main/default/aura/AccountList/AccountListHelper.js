({
      // Fetch the accounts from the Apex controller
      getAccountList: function(component) {
        var action = component.get('c.getAccounts');
          
        // Set up the callback
        var self = this;
        action.setCallback(this, function(actionResult) {
            var accounts = actionResult.getReturnValue();
            var lessAccounts = accounts.slice(0,10)
         	component.set('v.accounts',lessAccounts);
            component.set('v.lessAccounts',lessAccounts);
            component.set('v.allAccounts',accounts);
            
        });
          
        $A.enqueueAction(action);
      },
        
      // Fetch the contacts from the Apex controller
      showContactList: function(component, AccountId) {
      	var cmpEvent = $A.get('e.c:ContactListEvent'); 
      	cmpEvent.setParams({"AccountId" : AccountId}); 
      	cmpEvent.fire();
      },
        
      showPopupHelper: function(component, componentId, className){
        var modal = component.find(componentId);
        $A.util.removeClass(modal, className + 'hide');
        $A.util.addClass(modal, className + 'open');
      },
      hidePopupHelper: function(component, componentId, className){
        var modal = component.find(componentId);
        $A.util.addClass(modal, className+'hide');
        $A.util.removeClass(modal, className+'open');
      },
      createContactForAccount : function(component) {
        var newContact = component.get("v.newContact");
        var accountId = component.get("v.accountId");
        var action = component.get('c.getContacts');
        	
        // Set up the callback
        var contactString = { 'FirstName':newContact.FirstName,
                                 'LastName':newContact.LastName,
                                 'Email':newContact.Email  ,
                                  'Phone':newContact.Phone 
      	}
            
        console.log( contactString )
        var contactStringNew = JSON.stringify(contactString);
        console.log( contactStringNew )
        
        action.setParams({ accountId : accountId, contactString : contactStringNew });
        
        action.setCallback(this, function(actionResult) {
            if("true" == actionResult.getReturnValue()){
                var newContact = component.set("v.newContact", "");
               
               }
        });
        
        $A.enqueueAction(action);  
      } 
    
 
    
})