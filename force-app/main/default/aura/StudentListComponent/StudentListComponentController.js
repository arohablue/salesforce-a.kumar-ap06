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
            'studentName' : student.studentName,
            'studentAge' : student.studentAge,
            'dob' : student.studentDob};
            
            var studentList = cmp.get('v.data');
            
            if(studentList==null){
            cmp.set('v.data',[studentData]);
        	} else {
                studentList.push(studentData);
                cmp.set('v.data',studentList);
			  }
 
 		} ,
 
 	updateSelectedText: function (cmp, event) {
        var selectedRows = event.getParam('selectedRows');
        cmp.set('v.selectedRowsCount', selectedRows.length);
     	var cmpEvent = cmp.getEvent("StudentCompEvent");
    	cmpEvent.setParams({'studentData':selectedRows});
    	console.log('Event Fired Selected:' ,selectedRows );
        cmpEvent.fire();
    }
         
 
 })