({
     
	setOperation : function(component, event, helper) {
		var operation = event.target.value;
        var num1 = component.get("v.input");
        component.set("v.screen",num1+ " "+operation);
        component.set("v.operation",operation);
        component.set("v.input"," ");
        component.set("v.num1",num1);
	},
    
    calculateValue: function(component, event, helper) {
		var num1 = component.get("v.num1");
        var num2 = component.get("v.input");
        var operation = component.get("v.operation");
        console.log(num1,num2,operation);
        helper.performOperation(component, event, helper, operation, num1, num2);
	},
    
    clearInput : function(component, event, helper) {
		 component.set("v.screen","0" );
	}
 
})