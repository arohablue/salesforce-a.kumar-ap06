({
	saveData : function(component, event, helper) {
		var studentName = component.get("v.studentName");
        var studentAge = component.get("v.studentAge");
       	var studentDob = component.get("v.studentDob");
        var student = {};
        student.studentName = studentName;
        student.studentAge = studentAge
        student.studentDob = studentDob;
        
        // Get the component event by using the
        // name value from aura:registerEvent
        var cmpEvent = $A.get('e.c:StudentListEvent'); 
        
        // cmpEvent.setParams('studentData',student);
        console.log(student);
        cmpEvent.setParams({"studentData" : student}); 
        cmpEvent.fire();
    
	},
    
    doAction : function(component, event) {
         console.log('Aura method called :');
        var params = event.getParam('arguments');
        if (params) {
            var studentData = params.studentData;
            console.log('Aura method called data:',studentData);
            component.set("v.studentName",studentData.studentName);
            component.set("v.studentAge",studentData.studentAge);
            component.set("v.studentDob",studentData.dob);              
        }
    }
})