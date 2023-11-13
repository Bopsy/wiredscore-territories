public class TerritoryAssignmentQueueable implements Queueable, Database.AllowsCallouts {

    private List<Account> accountsToProcess;

    public TerritoryAssignmentQueueable(List<Account> accounts) {
        this.accountsToProcess = accounts;
    }

    public void execute(QueueableContext context) {
        // Iterate over each account and make a callout
        // We are assuming no more than the callout limit per execution would be added
        for (Account acc : accountsToProcess) {
            // Prepare the endpoint URL
            String endpoint = '/services/data/v58.0/sobjects/Account/' + acc.Id;
            
            // Prepare the HTTP request
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://' + DomainCreator.getOrgMyDomainHostname() + endpoint); 
            req.setMethod('PATCH');
            req.setHeader('Content-Type', 'application/json');
            req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
            req.setHeader('Sforce-Auto-Assign', 'TRUE ');
            req.setBody('{"BillingPostalCode":"' + acc.BillingPostalCode + '"}');
            
            // Send the HTTP request
            Http http = new Http();
            HTTPResponse res;
            try {
                res = http.send(req);
                // Handle the response as required.
            } catch (Exception e) {
                // Handle the exception as required.
            }
        }
    }
}