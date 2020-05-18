({	
    GetAll : function(cmp, helper, append) {
     
        helper.showSpinner(cmp, true);
        
        var action = cmp.get("c.GetAll");
        action.setParams({ objApiName : cmp.get("v.objApiName"),
                          fieldsStr : cmp.get("v.tileProperties").fieldsStr,
                          pageLimit : cmp.get("v.pageLimit"),
                          pageNumber : cmp.get("v.pageNumber"),
                          soqlQuery : cmp.get("v.soqlQuery"),
                          sortBy : cmp.get("v.sortBy"),
                          recordId : cmp.get("v.recordId") });
        
        action.setCallback(this, function(response) {
        	var state = response.getState();
        	if (state === "SUCCESS") {
					
                var count = response.getReturnValue().count;
                cmp.set("v.recordCount",count);

                if(cmp.get("v.pageLimit") * cmp.get("v.pageNumber") > count) {
                    cmp.set("v.morePages", false);
                } else {
                    cmp.set("v.morePages", true);
                }
                
                var results = response.getReturnValue().records;
                    
                if(results.length > 0) {
                    cmp.set("v.noResults",false);
                    cmp.set("v.searchResults", results);
                    helper.ProcessSearchResults(cmp, helper, append);
                } else {
                    if(cmp.get("v.pageNumber") == 1) {
                        cmp.set("v.recordCount",0);
                        cmp.set("v.noResults",true);
                        cmp.set("v.tileResults",[]);
                    }
                    cmp.set("v.pageNumber", -1);
                    helper.showSpinner(cmp, false);
            	}
        	} else if (state === "ERROR") {
            	var errors = response.getError();
            	if (errors) {
                	if (errors[0] && errors[0].message) {
                    	console.log("Error message: " + errors[0].message);
                	}
            	} else {
                	console.log("Unknown error");
            	}
                helper.showSpinner(cmp, false);
        	}
        });
        $A.enqueueAction(action);
        
    },
    Search : function(cmp, helper, queryTerm, append) {

        helper.showSpinner(cmp, true);

    	cmp.set("v.noResults",false);
            
        var action = cmp.get("c.Search");
        action.setParams({ queryTerm : queryTerm, 
                           objApiName : cmp.get("v.objApiName"), 
                           fieldsStr : cmp.get("v.tileProperties").fieldsStr,
                           pageLimit : cmp.get("v.pageLimit"),
                           pageNumber: cmp.get("v.pageNumber"),
                           soqlQuery : cmp.get("v.soqlQuery"),
                           sortBy : cmp.get("v.sortBy") });
            
        action.setCallback(this, function(response) {
        	
            var state = response.getState();
            if (state === "SUCCESS") {
					
                var count = response.getReturnValue().count;
                cmp.set("v.recordCount", count);
                
                if(cmp.get("v.pageLimit") * cmp.get("v.pageNumber") > count) {
                    cmp.set("v.morePages", false);
                } else {
                    cmp.set("v.morePages", true);
                }
                
                var results = response.getReturnValue().records;
                    
                if(results.length > 0) {
                    cmp.set("v.noResults",false);
                    cmp.set("v.searchResults", results);
                    helper.ProcessSearchResults(cmp, helper, append);
                } else {
                    if(cmp.get("v.pageNumber") == 1) {
                        cmp.set("v.noResults", true);
                        cmp.set("v.recordCount", 0);
                        cmp.set("v.tileResults",[]);
                    }
                    cmp.set("v.pageNumber", -1);
                    helper.showSpinner(cmp, false);
                }
            } else if (state === "ERROR") {
            	var errors = response.getError();
            	if (errors) {
                	if (errors[0] && errors[0].message) {
                    	console.log("Error message: " + errors[0].message);
                	}
            	} else {
                	console.log("Unknown error");
            	}
                helper.showSpinner(cmp, false);
            }
        });
        $A.enqueueAction(action);            
                
	},
  	ProcessSearchResults : function(cmp, helper, append) {
		        
        var searchResults = cmp.get("v.searchResults");
        var tileProperties = cmp.get("v.tileProperties");
        
        var tiles = new Array();
        
        for(var i=0; i<searchResults.length; i++) {
            
       		var tile = new Object();
            tile.id = searchResults[i].Id;
            tile.fields = new Array();
            tile.badges = new Array();
            
            for(var j = 0; j < (tileProperties.fields).length; j++) {
                
            	var field = helper.cloneObject(tileProperties.fields[j]);

                if((field.name).indexOf('.') > 0) {
                    var fieldArray = (field.name).split('.');
                    var objPart = fieldArray[0];
                    var valPart = fieldArray[1];
                    field.value = searchResults[i][objPart][valPart];                    
                } else {
                    field.value = searchResults[i][field.name];
                }
                
                if(! helper.isEmpty(field.value)) {
                    if(field.hasCase) {
                        if(field.case == "lowercase") field.value = (field.value).toLowerCase();
                        else if(field.case == "uppercase") field.value = (field.value).toUpperCase();
                    }
                    field.hasValue = true;
                }
                
                tile.fields.push(field);
                
            }
            
            for(var j = 0; j < (tileProperties.badges).length; j++) {
                
                var badge = helper.cloneObject(tileProperties.badges[j]);
                
                if((badge.name).indexOf('.') > 0) {
                    var badgeArray = (badge.name).split('.');
                    var objPart = badgeArray[0];
                    var valPart = badgeArray[1];
                    badge.value = searchResults[i][objPart][valPart];
                } else {
                    badge.value = searchResults[i][badge.name];
                }
                
                if(badge.hasColorFieldName) {
                    if((badge.colorFieldName).indexOf('.') > 0) {
                        var colorArray = (badge.colorFieldName).split('.');
                        var objPart = colorArray[0];
                        var valPart = colorArray[1];
                        badge.color = "color: "+searchResults[i][objPart][valPart]+"; ";
                    } else {
                        badge.color = "color: "+searchResults[i][badge.colorFieldName]+"; ";
                    }                    
                }
                if(badge.hasBGColorFieldName) {
                    if((badge.bgColorFieldName).indexOf('.') > 0) {
                        var bgColorArray = (badge.bgColorFieldName).split('.');
                        var objPart = bgColorArray[0];
                        var valPart = bgColorArray[1];
                        badge.bgColor = "background-color: "+searchResults[i][objPart][valPart]+"; ";
                    } else {
                        badge.bgColor = "background-color: "+searchResults[i][badge.bgColorFieldName]+"; ";
                    }                 
                }
                
                if(! helper.isEmpty(badge.value)) badge.hasValue = true;

				tile.badges.push(badge);
                
            }
            
            var tileBg = '';
            
            var bgImageURL = '';
            var bgColor = '';
            var tileHeight = '';
            
            if(tileProperties.hasBGImageField) {
                var bgImageFieldName = tileProperties.bgImageFieldName;
                
                if((bgImageFieldName).indexOf('.') > 0) {
                    var bgImageFieldNameArray = (bgImageFieldName).split('.');
                    var objPart = bgImageFieldNameArray[0];
                    var valPart = bgImageFieldNameArray[1];
                    bgImageURL = searchResults[i][objPart][valPart];
                } else {
                    bgImageURL = searchResults[i][bgImageFieldName];
                }                
            }
            if(helper.isEmpty(bgImageURL) && tileProperties.hasBGImageURL) {
                bgImageURL = tileProperties.bgImageURL;
            }

            if(tileProperties.hasBGColorFieldName) {
                var bgColorFieldName = tileProperties.bgColorFieldName;
                
                if((bgColorFieldName).indexOf('.') > 0) {
                    var bgColorFieldNameArray = (bgColorFieldName).split('.');
                    var objPart = bgColorFieldNameArray[0];
                    var valPart = bgColorFieldNameArray[1];
                    bgColor = searchResults[i][objPart][valPart];
                } else {
                    bgColor = searchResults[i][bgColorFieldName];
                }                
            } else if(tileProperties.hasBGColor) {
                bgColor = tileProperties.bgColor;
            }

            tileBg = (bgColor) ? "background-color: "+bgColor+ "; " : "";
            if(tileProperties.hasBGOpacity) {
                var bgRGB = (bgColor) ? helper.hexToRgb(bgColor) : helper.hexToRgb("#FFFFFF");
                tileBg += "background: linear-gradient(rgb("+bgRGB.r+","+bgRGB.g+","+bgRGB.b+","+tileProperties.bgOpacity+"), rgb("+bgRGB.r+","+bgRGB.g+","+bgRGB.b+","+tileProperties.bgOpacity+"))";
                tileBg += (bgImageURL != "") ? ", url('"+bgImageURL+"'), center/cover; " : "; ";
            } else {
                tileBg = (bgColor) ? "background-color: "+bgColor+ "; " : "";
                tileBg += (bgImageURL != "") ? "background-image: url('"+bgImageURL+"'); " : "" ;
            }
            
            if(bgImageURL != "") {
                tileBg += "background-repeat: no-repeat; background-position: center; ";
                tileBg += (tileProperties.hasBGSize) ? "background-size: " + tileProperties.bgSize + "; " : "";
            }
            
            tile.tileBg = tileBg;
            
            
            if(tileProperties.hasFixedHeight && ( tileProperties.hasHeightOption && tileProperties.heightOption == 'fixed') || ( ! tileProperties.hasHeightOption ) ) {
                tileHeight = "height: +" + tileProperties.fixedHeight;
            } else if(tileProperties.hasHeightOption && tileProperties.heightOption == "max-row") {
                tileHeight = "height: calc(100% - 24px)";
            }
            
            tile.tileHeight = tileHeight;
            tiles.push(tile);
            
        }
                
        if(! append) cmp.set("v.tileResults", []);
        for(var i=0; i<tiles.length; i++) {
            
            $A.createComponent("c:ab_TileWallTile",
            	{
                	"aura:id": "tile"+i,
                	"sizeSmall": cmp.get("v.sizeSmall"),
                	"sizeMedium": cmp.get("v.sizeMedium"),
                	"sizeLarge": cmp.get("v.sizeLarge"),
                	"tile": tiles[i]
            	},
            	function(tftile, status, errorMessage){
                	//Add the new tile to the array
                	if (status === "SUCCESS") {
                    	var tileResults = cmp.get("v.tileResults");
                    	tileResults.push(tftile);
                    	cmp.set("v.tileResults", tileResults);
                	} else if (status === "INCOMPLETE") {
                    	console.log("No response from server or client is offline.")
                    	// Show offline error
                	} else if (status === "ERROR") {
                    	console.log("Error: " + errorMessage);
                    	// Show error message
                	}
            	}
        	);
        
        }
        
        helper.showSpinner(cmp, false);        
 //       cmp.set("v.activeScreen", "SearchResults");
    },
    cloneObject : function(src) {
        let target = {};
        for (let prop in src) {
            if (src.hasOwnProperty(prop)) {
                target[prop] = src[prop];
            }
        }
        return target;
    },
    hexToRgb : function(hex) {
    	var shorthandRegex = /^#?([a-f\d])([a-f\d])([a-f\d])$/i;
    	hex = hex.replace(shorthandRegex, function(m, r, g, b) {
        	return r + r + g + g + b + b;
    	});

    	var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    	return result ? {
        	r: parseInt(result[1], 16),
        	g: parseInt(result[2], 16),
        	b: parseInt(result[3], 16)
    	} : null;
	},
    isEmpty : function(fld) {
        return (fld != null && fld != '') ? false : true; 
    },
    getNextPage : function(cmp, helper) {
        
        var pageNumber = cmp.get("v.pageNumber");
        if(pageNumber != -1) {
            cmp.set("v.pageNumber",pageNumber+1);
            if(! helper.isEmpty(cmp.find("enter-search"))) {
            	var queryTerm = (cmp.find("enter-search").get("v.value")).replace(/\'/g, "\\'").replace(/\"/g, "\\\"");        
            	if(queryTerm.length >= 2) {
                	helper.Search(cmp, helper, queryTerm, true);
            	} else if(queryTerm.length == 0) {
                	helper.GetAll(cmp, helper, true);
            	}                
            } else {
                helper.GetAll(cmp, helper, true);
            }
            
        }

    },
    showSpinner : function(cmp, show) {
        var spinner = cmp.find("spinner");
        if(show) {
            $A.util.removeClass(spinner, "hide");
        } else {
            $A.util.addClass(spinner, "hide");
        }
    }
})