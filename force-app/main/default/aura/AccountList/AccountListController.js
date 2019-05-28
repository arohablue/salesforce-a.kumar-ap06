({
    doInit: function(component, event, helper) {
        // Fetch the account list from the Apex controller
        helper.getAccountList(component);
    },
    fetchContacts: function(component, event, helper) {
        // Prevent the form from getting submitted
        event.preventDefault();
        
        // Get the value from the field that's in the form
        var accountId = event.target.getElementsByClassName('account-id')[0].value;
        component.set('v.accountId', accountId);
        
        helper.showContactList(component, accountId);
    },
    createContacts: function(component, event, helper) {
        // Prevent the form from getting submitted
        event.preventDefault();
        
        helper.showPopupHelper(component, 'modaldialog', 'slds-fade-in-');
        helper.showPopupHelper(component,'backdrop','slds-backdrop--');
        
        var accountId = event.target.getElementsByClassName('account-id')[0].value;
        component.set('v.accountId', accountId);
        
    },
    closePopUp : function(component, event, helper) {
        event.preventDefault();
        
        helper.hidePopupHelper(component, 'modaldialog', 'slds-fade-in-');
        helper.hidePopupHelper(component,'backdrop','slds-backdrop--');
        
        helper.showContactList(component, component.get('v.accountId'));
        
    },
    handleSuccess : function(component, event, helper) {
        event.preventDefault();
        
        helper.hidePopupHelper(component, 'modaldialog', 'slds-fade-in-');
        helper.hidePopupHelper(component,'backdrop','slds-backdrop--');
        
        helper.showContactList(component, component.get('v.accountId'));
    },
    createNewContact : function(component, event, helper) {
        var validStudent = component.find('contactform').reduce(function (validSoFar, inputCmp) {
            
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        
        // If we pass error checking, do some real work
       	if(validStudent){
            // Create the new Contact
            helper.createContactForAccount(component)  
       	}
    },
    
     showLess: function(component, componentId, className){
		 var accounts = component.get('v.lessAccounts');
         component.set('v.accounts',accounts);
      },
     showMore: function(component, componentId, className){
         var accounts = component.get('v.allAccounts');
         component.set('v.accounts',accounts);
      },

    
})