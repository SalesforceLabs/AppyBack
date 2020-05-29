({
	init : function (component) {
        var flow = component.find("flowData");
        flow.startFlow("appysebback__Book_Slot_at_Location");
    },
    
    handleStatusChange : function (component, event, helper) {
        if(event.getParam("status") === "FINISHED") {
            var urlEvent = $A.get("e.force:navigateToURL");
            urlEvent.setParams({"url": ("/home/home.jsp"),
                                "isredirect": "true"
            });
            urlEvent.fire();
        }
    }     
})