({
    clickCreateItem: function(component, event, helper) {

         var validExpense = component.find('itemform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validExpense){
            // Create the new expense
            var newExpense = component.get("v.newItem");
            console.log("Create expense: " + JSON.stringify(newExpense));
            var items = component.get("v.items");
            items.push(item);
            component.set("v.items",items);
            var newItem = { 'sobjectType': 'Camping_Item__c',
                    'Name': '',
                    'Quantity__c': 0,
                    'Price__c': 0,
                    'Packed__c': false };
            component.set("v.newItem", newItem);
           
        }
        
        }

})