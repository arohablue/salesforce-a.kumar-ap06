({
     
	setOperation : function(component, event, helper) {
		var operation = event.getSource().get("v.value");
        var num1 = component.get("v.num1");
        component.set("v.screen",num1+ " "+operation);
        component.set("v.operation",operation);
	},
    
    calculateValue: function(component, event, helper) {
		var num1 = component.get("v.num1");
        var num2 = component.get("v.input")
        var operation = component.get("v.operation")
        helper.performOperation(component, event, helper, operation, num1, num2);
	},
    
    clearInput : function(component, event, helper) {
		 component.set("v.screen","0" );
	}
 
})