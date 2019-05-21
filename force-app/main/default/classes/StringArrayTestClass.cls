@isTest
public class StringArrayTestClass {

    @isTest
    static void testStringArray(){
        
        List<String> expectedStrings = new List<String>();
        List<String> returnedStrings = new List<String>();
        
        Test.startTest();
        returnedstrings = StringArrayTest.generateStringArray(4);
        Test.stopTest();
        
        expectedStrings.add('Test 0');
        expectedStrings.add('Test 1');
        expectedStrings.add('Test 2');
        expectedStrings.add('Test 3');
        
		System.assertEquals(expectedStrings, returnedStrings);
    }
}