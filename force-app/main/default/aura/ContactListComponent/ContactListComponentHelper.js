({
	      // Fetch the accounts from the Apex controller
      getContactList: function(component, accountId) {
          console.log(accountId);
        var action = component.get('c.getContacts');
        action.setParams({  accountId : accountId  });
        // Set up the callback
        var self = this;
        action.setCallback(this, function(actionResult) {
         component.set('v.contacts', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
      }
})