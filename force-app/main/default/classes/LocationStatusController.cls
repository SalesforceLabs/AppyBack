public with sharing class LocationStatusController {
    
    @AuraEnabled(cacheable=true)
    public static List<Location__c> getLocations(){
        return [SELECT Id, Name, City__c, Status__c FROM Location__c];
    }

    @AuraEnabled(cacheable=true)
    public static List<Location_Daily_Info__c> getLocationDates(String location){
        return [SELECT Date__c, Id, Location__c, Seats_Available_Full__c, Seats_Available_Afternoon__c,Seats_Available_Morning__c FROM Location_Daily_Info__c WHERE Location__c = :location AND Date__c != null AND Date__c >= TODAY ORDER BY Date__c];
    }

}