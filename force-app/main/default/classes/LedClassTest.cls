@isTest
public class LedClassTest {
    
    @isTest
    static void testLead(){
        
         LedClass ls = new LedClass();
        
        String s = '124234321425134134123123';
        String s1 = '1242343214rwe134123123';
        String s2 = '1234567890';
        
        Test.startTest();
        
        
        Integer lc = ls.screenLedCount(s);
        Integer lc1 = ls.screenLedCount(s1);
        Integer lc2 = ls.screenLedCount(s2);
        
        
        Test.stopTest();
        
         System.assertEquals(97, lc);
         System.assertEquals(0, lc1);
        System.assertEquals(50, lc2);
        
        
    }    
    
}