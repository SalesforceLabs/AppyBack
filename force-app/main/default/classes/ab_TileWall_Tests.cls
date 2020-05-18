@isTest
public class ab_TileWall_Tests {

    @testSetup static void setup() {

        String[] industry = new String[]{'Energy', 'Apparel', 'Energy', 'Banking', 'Agriculture'};
        List<Account> accounts = new List<Account>();
        for(Integer i=0; i<5; i++) {
            Account acc = new Account();
          acc.Name = 'Account '+i;
          acc.Industry = 'Energy';
      accounts.add(acc);        
        }
        insert(accounts);
        
    }

    static testmethod void TestGetAll() {
        
        String fieldstr = 'Name, Industry';
        ab_TileWallApexController.RecordsResult rr = ab_TileWallApexController.GetAll('Account',fieldstr,10,1,null,null,null);
        System.assertEquals(5, rr.count);
    
    }
    
    static testmethod void TestSOQLQuery() {

        Account a1 = [SELECT Id FROM Account WHERE Name='Account 1'];

        String fieldstr = 'Name, Industry';
      ab_TileWallApexController.RecordsResult rr = ab_TileWallApexController.GetAll('Account',fieldstr,10,1,'Id={{recordid}}',null,a1.Id);
        System.assertEquals(1, rr.count);        
        
    }
    
    static testmethod void TestSearch() {
        
        String fieldstr = 'Name, Industry';
        ab_TileWallApexController.RecordsResult rr = ab_TileWallApexController.Search('acc','Account',fieldstr,10,1,null,null,null);
        System.assertEquals(0, rr.count);
        
    }

    static testmethod void TestSOQLQuerySearch() {
        
        Account a1 = [SELECT Id FROM Account WHERE Name='Account 1'];

        String fieldstr = 'Name, Industry';
        ab_TileWallApexController.RecordsResult rr = ab_TileWallApexController.Search('acc','Account',fieldstr,10,1,'Id={{recordid}}',null,a1.Id);
        System.assertEquals(0, rr.count);
        
    }

}