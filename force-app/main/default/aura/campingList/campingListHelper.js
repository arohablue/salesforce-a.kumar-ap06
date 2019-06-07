({
	
    validateFields : function (component,field) {
        
        var nameField = field;
        console.log('yes:'+nameField);
        var expname = nameField.get("v.value"); 
        if ($A.util.isEmpty(expname)){
           component.set("v.er",true);
           nameField.set("v.errors", [{message:"this field can't be blank."}]);
        }
        else {
            nameField.set("v.errors", null);
        }
    }
    
    
})