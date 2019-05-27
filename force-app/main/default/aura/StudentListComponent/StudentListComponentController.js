({
    
    doInit: function (cmp, event, helper) {
        cmp.set('v.columns', [
            {label: 'Student Name', fieldName: 'studentName', type: 'text'},
            {label: 'Student Age', fieldName: 'studentAge', type: 'text'},
            {label: 'Dob', fieldName: 'dob', type: 'text'},
        ]);

     },
            
    saveEventHandler : function (cmp, event, helper) {
            console.log('Event Handled');
            var student = event.getParam("studentData");
            
            var studentData = {
            'studentName' : student.Name,
            'studentAge' : student.Age__c,
            'dob' : student.Dob__c};
            console.log("Student Data Recevied:",studentData);
            var studentList = cmp.get('v.data');
            
            if(studentList==null){
            cmp.set('v.data',[studentData]);
        	} else {
                studentList.push(studentData);
                cmp.set('v.data',studentList);
			  }
 
 			alert("Student Added");
 
 		} ,
 
 	updateSelectedText: function (cmp, event) {
        var selectedRows = event.getParam('selectedRows');
        cmp.set('v.selectedRowsCount', selectedRows.length);
     	var cmpEvent = cmp.getEvent("StudentCompEvent");
    	cmpEvent.setParams({'studentData':selectedRows});
    	console.log('Event Fired Selected:' ,selectedRows );
        JSON.stringify()
        var conf = confirm("Edit Student  : "+JSON.stringify(selectedRows[0].studentName) + "  ?");
        
   	 	if(selectedRows.length && conf){
        	cmpEvent.fire();
    	}
        
    },

	deleteAll: function (cmp, event) {
        cmp.set('v.data',[]);
    },

  
 
 })