({
	init : function (component) {
        var flow = component.find("flowData");
        flow.startFlow("appyback__Book_Slot_at_Location"); 
    },
    
    handleStatusChange : function (component, event, helper) {
        if(event.getParam("status") === "FINISHED") {
            var urlEvent = $A.get("e.force:navigateToURL");
            urlEvent.setParams({"url": ("/"),
                                "isredirect": "true"
            });
            urlEvent.fire();
        }
    }     
})
