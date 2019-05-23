({
	handleClick : function (cmp, event, helper) {
        alert("You clicked: " + event.getSource().get("v.label"));
        console.log("here");
    },
    doInit : function(component, event, helper) {
		console.log("Init");
	}
})