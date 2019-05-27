({
	createStudent : function(component, event, helper) {
		  var validStudent = component.find('studentform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validStudent){
            // Create the new expense
            var newStudent = component.get("v.newStudent");
            console.log("Create student: " + JSON.stringify(newStudent));
            var students = component.get("v.students");

        	var newStudent= JSON.parse(JSON.stringify(newStudent));
        	students.push(newStudent);
        	component.set("v.students", students);
            
            var newS = { 'sobjectType': 'Student__c',
                  		'Id' : 0,
                        'Name': '',
                        'Age__c': 0,
                        'Dob__c': '' } ;
            
            component.set("v.newStudent", newS);
            // Get the component event by using the
        // name value from aura:registerEvent
        var cmpEvent = $A.get('e.c:StudentListEvent'); 
        
            
        // cmpEvent.setParams('studentData',student);
        cmpEvent.setParams({"studentData" : newStudent}); 
        cmpEvent.fire();
    
        }
	},
    
    doAction : function(component, event) {
         console.log('Aura method called :');
        var params = event.getParam('arguments');
        if (params) {
           
            var studentData = params.studentData;
            if(studentData){
                var newS = { 'sobjectType': 'Student__c',
                  		'Id' : 0,
                        'Name': studentData[0].studentName,
                        'Age__c': studentData[0].studentAge,
                        'Dob__c':studentData[0].dob  } ;
            
            component.set("v.newStudent", newS);
                
            }
            
          
        }
    },
    
    
})