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
        event.preventDefault();
        helper.showPopupHelper(component, 'modaldialog', 'slds-fade-in-');
		helper.showPopupHelper(component,'backdrop','slds-backdrop--');
      },
        closePopUp : function(component, event, helper) {
            console.log('here');
            event.preventDefault();
        helper.hidePopupHelper(component, 'modaldialog', 'slds-fade-in-');
		helper.hidePopupHelper(component,'backdrop','slds-backdrop--');
            
    },
        handleSuccess : function(component, event, helper) {
              event.preventDefault();
            helper.hidePopupHelper(component, 'modaldialog', 'slds-fade-in-');
		helper.hidePopupHelper(component,'backdrop','slds-backdrop--');
             helper.showContactList(component, component.get('v.accountId'));
        },
        createRecord : function (component, event, helper) {
    var createRecordEvent = $A.get("e.force:createRecord");
    createRecordEvent.setParams({
        "entityApiName": "Contact"
    });
    createRecordEvent.fire();
}
        
        
        
        
    })