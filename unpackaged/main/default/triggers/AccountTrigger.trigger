trigger AccountTrigger on Account (after update) {

    AccountTerritoryAssignmentCallout.processAccounts(Trigger.new, Trigger.oldMap);
    
}