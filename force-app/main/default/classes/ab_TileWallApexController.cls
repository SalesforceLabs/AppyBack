public with sharing class ab_TileWallApexController {
@AuraEnabled
    public static RecordsResult GetAll(String objApiName, String fieldsStr, Integer pageLimit, Integer pageNumber, String soqlQuery, String sortBy, String recordId) {
        
        pageLimit = Integer.valueOf(pageLimit);
        pageNumber = Integer.valueOf(pageNumber);
        // escape single quotes for external inputs
        objApiName = String.escapeSingleQuotes(objApiName);
        fieldsStr = String.escapeSingleQuotes(fieldsStr);
        soqlQuery = (soqlQuery==null ? soqlQuery : String.escapeSingleQuotes(soqlQuery));
        sortBy = (sortBy==null ? sortBy : String.escapeSingleQuotes(sortBy));
        recordId = (recordId==null ? recordId : String.escapeSingleQuotes(recordId));
        
        String whereclause = (soqlQuery != null && soqlQuery != '') ? ' WHERE '+soqlQuery : '';
        if(recordId != null && recordId != '') {
            Integer startindex = whereclause.indexOf('{{');
            Integer endindex = whereclause.indexOf('}}');
            if(startindex > 0 && endindex > 0) {
                String argument = whereclause.substring(startindex+2, endindex);
                if(argument.equalsIgnoreCase('recordid')) {
                    whereclause = whereclause.replace('{{'+argument+'}}','{{recordid}}')
                               .replace('\'{{recordid}}\'', '\''+recordId+'\'')
                           .replace('{{recordid}}', '\''+recordId+'\'');
                }

            }
            
        }

        String orderby = (sortBy != null && sortBy != '') ? ' ORDER BY '+sortBy : '';

        String countQuery = 'SELECT COUNT() FROM ' + objApiName + whereclause;
        Integer count = Database.countQuery(countQuery);

        String searchquery = 'SELECT ' + fieldsStr + ' FROM ' + objApiName + whereclause + orderby + ' LIMIT ' + pageLimit + ' OFFSET ' + (pageNumber - 1) * pageLimit;
                
        System.debug('SOQL Search Query: ' + searchQuery);
        
        List<SObject> results = Database.query(searchQuery);

         // Strip fields that are not readable
         SObjectAccessDecision decision = Security.stripInaccessible(
            AccessType.READABLE,
            results);
        
        RecordsResult rr = new RecordsResult();
        rr.count = count;
        rr.records = results;
        
        return rr;
    }
    
    @AuraEnabled
    public static RecordsResult Search(String queryTerm, String objApiName, String fieldsStr, Integer pageLimit, Integer pageNumber, String soqlQuery, String sortBy, String recordId) {
        
        pageLimit = Integer.valueOf(pageLimit);
        pageNumber = Integer.valueOf(pageNumber);
        // escape single quotes for external inputs
        queryTerm = String.escapeSingleQuotes(queryTerm);
        objApiName = String.escapeSingleQuotes(objApiName);
        fieldsStr = String.escapeSingleQuotes(fieldsStr);
        soqlQuery = (soqlQuery==null ? soqlQuery : String.escapeSingleQuotes(soqlQuery));
        sortBy = (sortBy==null ? sortBy : String.escapeSingleQuotes(sortBy));
        recordId = (recordId==null ? recordId : String.escapeSingleQuotes(recordId));
        
        
        String whereclause = (soqlQuery != null && soqlQuery != '') ? ' WHERE ' + soqlQuery : '';
        if(recordId != null && recordId != '') {
            whereclause = whereclause.replace('\'{{recordid}}\'', '\''+recordId+'\'')
                           .replace('{{recordid}}', '\''+recordId+'\'');
        }

        String orderby = (sortBy != null && sortBy != '') ? ' ORDER BY ' + sortBy : '';        

        String countQuery = 'FIND \'' + queryTerm + '*\' IN ALL FIELDS RETURNING ' + objApiName + '(Id ' + whereclause + ')';
        List<List<SObject>> countList = search.query(countQuery);

        Integer count = (countList.size() > 0) ? countList[0].size() : -1;

        String searchquery = 'FIND \'' + queryTerm + '*\' IN ALL FIELDS RETURNING ' + objApiName + '(' + fieldsStr + whereclause + orderBy + ' LIMIT ' + pageLimit + ' OFFSET ' + (pageNumber - 1) * pageLimit + ')'; 
        System.debug('SOSL Search Query: ' + searchquery);
        
        List<List<SObject>> searchList=search.query(searchquery);

        // Strip fields that are not readable from all search results
        for (List<SObject> result : searchList) { Security.stripInaccessible(
            AccessType.READABLE,
            result);
        }
        List<SObject> results = null;       

        if(searchList.size() > 0) {
            results = searchList[0];
        }
        
        RecordsResult rr = new RecordsResult();
        rr.count = count;
        rr.records = results;
        
        return rr;

    } 
    
    
    public class RecordsResult {
        @AuraEnabled public Integer count { get; set; }
        @AuraEnabled public List<Sobject> records { get; set; }
    }
    
}