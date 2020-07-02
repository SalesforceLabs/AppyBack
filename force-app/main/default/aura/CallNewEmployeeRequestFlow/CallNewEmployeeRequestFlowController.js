({
	init : function (component) {
    	var flow = component.find("flowData");

//     var inputVariables = [
//        {
//            name : "IDFrecordID",
//            type : "flowDataType",
//            value : component.get("v.recordId")

//        }

//    ];
//     flow.startFlow("Book_Slot_at_Location_Desktop_HP_version",inputVariables);

        flow.startFlow("appyback__Book_Slot_at_Location");
	},

    handleStatusChange : function (component, event, helper) {
        if(event.getParam("status") === "FINISHED") {
            var urlEvent = $A.get("e.force:navigateToURL");
            urlEvent.setParams({"url": "/",
                                "isredirect": "true"
            });
            urlEvent.fire();
        }
    }    
})
