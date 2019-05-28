({
      // Fetch the accounts from the Apex controller
      getAccountList: function(component) {
        var action = component.get('c.getAccounts');
        // Set up the callback
        var self = this;
        action.setCallback(this, function(actionResult) {
         component.set('v.accounts', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
      },
        
      // Fetch the accounts from the Apex controller
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
           console.log('here');
        var modal = component.find(componentId);
        $A.util.addClass(modal, className+'hide');
        $A.util.removeClass(modal, className+'open');
    }
        
        
        
        
    })