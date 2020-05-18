({
    doInit : function(cmp, event, helper) {
                        
        if(cmp.isValid()) {
                        
        	cmp.set("v.sizeLarge", 12/parseInt(cmp.get("v.columnsLarge")));
        	cmp.set("v.sizeMedium", 12/parseInt(cmp.get("v.columnsMedium")));        
        	cmp.set("v.sizeSmall", 12/parseInt(cmp.get("v.columnsSmall")));
                            
        	var tileProperties = new Object();
        	tileProperties.fieldsStr = '';
        	tileProperties.fields = new Array();
        	tileProperties.badges = new Array();
        
        	var fieldListArr = new Array();
        
        	for(var i=0; i<=4; i++) {

            	var fieldName = cmp.get("v.name_Field"+i);
            	var fieldLabel = cmp.get("v.label_Field"+i);
            	var fieldSize = cmp.get("v.size_Field"+i);
            	var fieldCase = cmp.get("v.case_Field"+i);
            	var fieldAlign = cmp.get("v.align_Field"+i);
            
            	var field = new Object();

            	if(!helper.isEmpty(fieldName)) {

                	var fieldNameLC = fieldName.toLowerCase();
                	if(! fieldListArr.includes(fieldNameLC)) {
                	    fieldListArr.push(fieldNameLC);
                	    tileProperties.fieldsStr += (i>0? "," : "") + fieldName;
                	}

                	field.num = i;
                	field.name = fieldName;

                	if(!helper.isEmpty(fieldLabel)) { 
                	    field.label = fieldLabel;
                	    field.hasLabel = true;
                	}
                	if(!helper.isEmpty(fieldSize)) {
                	    field.size = " slds-text-" + fieldSize;
                	    field.hasSize = true;
                	}
                	if(!helper.isEmpty(fieldCase)) {
                    	field.case = fieldCase;
                    	field.hasCase = true;
                	}
                	if(!helper.isEmpty(fieldAlign)) {
                	    field.align = " slds-text-align_" + fieldAlign;
                	    field.hasAlign = true;
                	}

                	(tileProperties.fields).push(field);
            	}
             
        	}
        
        	for(var i=1; i<=4; i++) {
            
            	var badgeName = cmp.get("v.name_Badge"+i);
            	var badgeLabel = cmp.get("v.label_Badge"+i);
            	var badgeColor = cmp.get("v.color_Badge"+i);
            	var badgeBGColor = cmp.get("v.bgcolor_Badge"+i);
            
            	var badge = new Object();
            
            	if(!helper.isEmpty(badgeName)) {
                
            	    var badgeNameLC = badgeName.toLowerCase();
                
            	    if(! fieldListArr.includes(badgeNameLC)) {
                	    fieldListArr.push(badgeNameLC);
                    	tileProperties.fieldsStr += ',' + badgeName;                    
                	}
                
                	badge.num = i;
                	badge.name = badgeName;

                	if(!helper.isEmpty(badgeLabel)) { 
                	    badge.label = badgeLabel;
                	    badge.hasLabel = true;
                	}
                	if(!helper.isEmpty(badgeColor)) {
                        if(badgeColor.startsWith("{{")) {
                            badge.colorFieldName = badgeColor.replace(/[{}]+/g,"");
                            if(! fieldListArr.includes(badge.colorFieldName)) {
                                fieldListArr.push(badge.colorFieldName);
            	    			tileProperties.fieldsStr += "," + badge.colorFieldName;
                            }
                            badge.hasColorFieldName = true;
                        } else {
                            badge.color = "color: " + badgeColor + "; ";
                            badge.hasColor = true;
                        }
                	    
                	}
                	if(!helper.isEmpty(badgeBGColor)) {
                        if(badgeBGColor.startsWith("{{")) {
                            badge.bgColorFieldName = badgeBGColor.replace(/[{}]+/g,"");
                            if(! fieldListArr.includes(badge.bgColorFieldName)) {
                                fieldListArr.push(badge.bgColorFieldName);
            	    			tileProperties.fieldsStr += "," + badge.bgColorFieldName;
                            }
                            badge.hasBGColorFieldName = true;
                        } else {
                            badge.bgColor = "background-color: " + badgeBGColor + "; ";
                            badge.hasBGColor = true;
                        }
                	}
                
                	(tileProperties.badges).push(badge);

            	}
            
        	}

        	var bgImageFieldName = cmp.get("v.bgImageFieldName");
        	if(! helper.isEmpty(bgImageFieldName)) {
            
            	var bgImageFieldNameLC = bgImageFieldName.toLowerCase();
            	if(! fieldListArr.includes(bgImageFieldNameLC)) {
            	    fieldListArr.push(bgImageFieldNameLC);
            	    tileProperties.fieldsStr += "," + bgImageFieldName;
                    tileProperties.bgImageFieldName = bgImageFieldName;
                    tileProperties.hasBGImageField = true;
            	}

        	}
            
            var bgImageURL = cmp.get("v.bgImageURL");
            if(! helper.isEmpty(bgImageURL)) {
                tileProperties.bgImageURL = bgImageURL;
                tileProperties.hasBGImageURL = true;
            }

            var bgColor = cmp.get("v.bgColor");
            if(! helper.isEmpty(bgColor)) {
                if(bgColor.startsWith("{{")) {
                	tileProperties.bgColorFieldName = bgColor.replace(/[{}]+/g,"");
                    if(! fieldListArr.includes(tileProperties.bgColorFieldName)) {
                    	fieldListArr.push(tileProperties.bgColorFieldName);
            	    	tileProperties.fieldsStr += "," + tileProperties.bgColorFieldName;
                    }
                    tileProperties.hasBGColorFieldName = true;
                } else {
	                tileProperties.bgColor = bgColor;
    	            tileProperties.hasBGColor = true;
                }
            }
            
            var bgOpacity = cmp.get("v.bgOpacity");
            if(! helper.isEmpty(bgOpacity)) {
                tileProperties.bgOpacity = bgOpacity;
                tileProperties.hasBGOpacity = true;
            }
            
            var bgSize = cmp.get("v.bgSize");
            if(! helper.isEmpty(bgSize)) {
                tileProperties.bgSize = bgSize;
                tileProperties.hasBGSize = true;
            }
            
            var heightOption = cmp.get("v.heightOption");
            if(! helper.isEmpty(heightOption) ) {
                tileProperties.heightOption = heightOption;
                tileProperties.hasHeightOption = true;
            }
            
            var fixedHeight = cmp.get("v.fixedHeight");                        
            if(! helper.isEmpty(fixedHeight) ) {
                tileProperties.fixedHeight = fixedHeight;
                tileProperties.hasFixedHeight = true;
            }
            
            cmp.set("v.tileProperties", tileProperties);        
        
        	helper.GetAll(cmp, helper, false);
            
        }
                        
    },
	handleSearch : function(cmp, event, helper) {

        cmp.set("v.pageNumber",1);    
        var queryTerm = (cmp.find("enter-search").get("v.value")).replace(/\'/g, "\\'").replace(/\"/g, "\\\"");
        
        console.log(queryTerm);

        if(queryTerm.length >= 2) {

            helper.Search(cmp, helper, queryTerm, false);

        } else if(queryTerm.length == 0) {
            
            helper.GetAll(cmp, helper, false);
            
        }
            
	},
    loadMore : function(cmp, event, helper) {
        
    	helper.getNextPage( cmp, helper );
        
    }
})