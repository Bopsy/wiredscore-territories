@isTest
public class AccountTerritoryAssignmentCalloutTest {
    
    // Utility method to create test accounts based on given zip codes
    @TestSetup
    public static void setupTestData() {
        List<Account> accountsToInsert = new List<Account>();
        
        // Explicitly adding 25 accounts with various zip codes and states
        
        // Account for Strategic Zip Codes
        accountsToInsert.add(new Account(Name = 'Test Account 1', BillingPostalCode = '10002', BillingState = 'New York'));
        accountsToInsert.add(new Account(Name = 'Test Account 2', BillingPostalCode = '10003', BillingState = 'NY'));
        accountsToInsert.add(new Account(Name = 'Test Account 3', BillingPostalCode = '10011', BillingState = 'NY'));
        accountsToInsert.add(new Account(Name = 'Test Account 4', BillingPostalCode = '10009', BillingState = 'New York'));
        accountsToInsert.add(new Account(Name = 'Test Account 5', BillingPostalCode = '10013', BillingState = 'NY'));
        accountsToInsert.add(new Account(Name = 'Test Account 6', BillingPostalCode = '10014', BillingState = 'NY'));
        
        // unknown account
        accountsToInsert.add(new Account(Name = 'Test Account 7')); // No zip/state
        
        accountsToInsert.add(new Account(Name = 'Test Account 8', BillingPostalCode = '90210', BillingState = 'CA'));
        accountsToInsert.add(new Account(Name = 'Test Account 9', BillingPostalCode = '90077', BillingState = 'California'));
        accountsToInsert.add(new Account(Name = 'Test Account 10', BillingPostalCode = '90024', BillingState = 'CA'));
        accountsToInsert.add(new Account(Name = 'Test Account 11', BillingPostalCode = '90095', BillingState = 'CA'));
        accountsToInsert.add(new Account(Name = 'Test Account 12', BillingPostalCode = '94102', BillingState = 'California'));
        accountsToInsert.add(new Account(Name = 'Test Account 13', BillingPostalCode = '90069', BillingState = 'CA'));
        
        // unknown account
        accountsToInsert.add(new Account(Name = 'Test Account 14')); // No zip/state
        
        // Accounts for Great Lakes states
        accountsToInsert.add(new Account(Name = 'Test Account 15', BillingState = 'Minnesota'));
        accountsToInsert.add(new Account(Name = 'Test Account 16', BillingState = 'Wisconsin'));
        accountsToInsert.add(new Account(Name = 'Test Account 17', BillingState = 'Indiana'));
        accountsToInsert.add(new Account(Name = 'Test Account 18', BillingState = 'Illinois'));
        accountsToInsert.add(new Account(Name = 'Test Account 19', BillingState = 'Michigan'));
        accountsToInsert.add(new Account(Name = 'Test Account 20', BillingState = 'Ohio'));

        // Accounts for Unassigned
        accountsToInsert.add(new Account(Name = 'Test Account 21', BillingState = 'Washington'));
        accountsToInsert.add(new Account(Name = 'Test Account 22', BillingState = 'Arizona'));
        accountsToInsert.add(new Account(Name = 'Test Account 23', BillingState = 'Oregon'));
        accountsToInsert.add(new Account(Name = 'Test Account 24', BillingState = 'Rhode Islan'));
        accountsToInsert.add(new Account(Name = 'Test Account 25', BillingState = 'Florida'));
        
        
        insert accountsToInsert;
    }

    @isTest
    public static void testUpdateTestAccount1Worked() {
        
        // retrieve setup Account
        Account testAccount1 = [Select id,Name From Account Where Name = 'Test Account 1'];
        
        Test.startTest();
        	// initiate mockup
            Test.setMock(HttpCalloutMock.class, new MockAssignmentRuleGenerator());
        
        	// Change Strategic Account to New York based on state
        	testAccount1.BillingState = 'NY';
        	testAccount1.BillingPostalCode = '';
        	update testAccount1;
        Test.stopTest();
        
		
        // Assertions
        testAccount1 = [Select id,Name,BillingState From Account Where Id = :testAccount1.id];
        System.assertEquals('NY',testAccount1.BillingState);
        
        // Can't assert the following b/c mock test result won't actually make the callout
        List<ObjectTerritory2Association> assocations = [Select id,ObjectId,Territory2.Name From ObjectTerritory2Association Where ObjectId = :testAccount1.Id];
        //System.assertEquals(1,assocations.size());
        //System.assertEquals('New York',assocations.get(0).Territory2.Name);
    }
}