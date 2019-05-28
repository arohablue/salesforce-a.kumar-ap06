({
    doInit : function(){
        
    },
    
	contactListHandler : function(component, event, helper) {
        component.set('v.contacts','');
		var accountId = event.getParam("AccountId");
        helper.getContactList(component, accountId);
	}
})