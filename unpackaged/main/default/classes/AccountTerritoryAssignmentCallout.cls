public class AccountTerritoryAssignmentCallout {
    
    // This method will be called from the Account trigger
    public static void processAccounts(List<Account> newAccounts, Map<Id, Account> oldMap) {
        // List to hold the accounts that need callouts
        List<Account> accountsForCallout = new List<Account>();

        for (Account acc : newAccounts) {
            Account oldAcc = oldMap.get(acc.Id);

            // Check if BillingPostalCode has changed
            // We would recommend state changes as well as zip code
            // but that wasn't the requirement
            if ((acc.BillingPostalCode != oldAcc.BillingPostalCode)){ 
                // || (acc.BillingState != oldAcc.BillingState)){

                // Add to the list for callouts
                accountsForCallout.add(acc);
            }
        }

        // If there are accounts that need callouts, enqueue the job
        if (!accountsForCallout.isEmpty()) {
            // TODO:
            // Given more time, this should check size for callout limits per executable
            // and ensure it's chunked into 100 account lists
            System.enqueueJob(new TerritoryAssignmentQueueable(accountsForCallout));
        }
    }
}