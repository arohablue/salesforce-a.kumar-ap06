({
	doInit : function(component, event, helper) {
		
	},
    
    handleComponentEvent : function(component, event, helper) {
        
        var student = event.getParam("studentData");
        console.log('Event Handled :' ,student );
		var childCmp = component.find('childCmp');
        childCmp.sampleMethod(student);
	}
 
})