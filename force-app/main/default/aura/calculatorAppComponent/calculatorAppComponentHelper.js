({
	performOperation : function( component, event, helper,opp, num1, num2) {
        var total ;
        num1 = parseInt(num1);
        num2 = parseInt(num2);
        switch(opp) {
            case "-":
                total = num1 + num2;
            	break;
            case "+":
                total = num1 + num2;
                break;
            case "*" :
                total = num1 * num2;
                break;
            case "/" :
                total = num1 / num2;
                break;
        }
        
       component.set("v.screen",total );
	
	}
})