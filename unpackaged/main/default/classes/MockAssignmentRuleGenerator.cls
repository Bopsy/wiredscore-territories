@isTest
public class MockAssignmentRuleGenerator implements HttpCalloutMock {
    
    // This method generates a mock HTTP Response
    public HTTPResponse respond(HTTPRequest req) {
        // Create a fake response
        HttpResponse res = new HttpResponse();
        
        // Mimic the headers from the mock response provided
        res.setHeader('Content-Type', 'application/json');
        res.setHeader('date', 'Mon, 06 Nov 2023 18:59:10 GMT');
        res.setHeader('set-cookie', 'CookieConsentPolicy=0:1; path=/; expires=Tue, 05-Nov-2024 18:59:10 GMT; Max-Age=31536000');
        res.setHeader('set-cookie', 'LSKey-c$CookieConsentPolicy=0:1; path=/; expires=Tue, 05-Nov-2024 18:59:10 GMT; Max-Age=31536000');
        res.setHeader('strict-transport-security', 'max-age=63072000; includeSubDomains');
        res.setHeader('x-content-type-options', 'nosniff');
        res.setHeader('x-xss-protection', '1; mode=block');
        res.setHeader('content-security-policy', 'upgrade-insecure-requests');
        res.setHeader('x-robots-tag', 'none');
        res.setHeader('cache-control', 'no-cache,must-revalidate,max-age=0,no-store,private');
        res.setHeader('set-cookie', 'BrowserId=kdVh7HzWEe6zfcFdmD_fLg; domain=.salesforce.com; path=/; expires=Tue, 05-Nov-2024 18:59:10 GMT; Max-Age=31536000');
        res.setHeader('sforce-limit-info', 'api-usage=3/15000');
        res.setHeader('server', 'sfdcedge');
        res.setHeader('x-sfdc-request-id', 'dfba7ee1c2c22fb7f42fb67aebe58694');

        // Set status code to 204 as per the provided response
        res.setStatusCode(204);
        res.setStatus('HTTP/2 204');
        // Since status code 204 means no content, we don't set a response body.
        
        return res;
    }
}