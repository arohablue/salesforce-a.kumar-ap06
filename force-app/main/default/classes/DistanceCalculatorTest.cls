@isTest
public class DistanceCalculatorTest {
    
    @isTest
    static void testDistance(){
        DistanceCalculater dc = new DistanceCalculater();
		double lat1 = 32.9697;
		double lon1 = -96.80322;
		double lat2 = 29.46786;
		double lon2 = 98.53506;
        
        Test.startTest();
        double dist = dc.distance(lat1, lon1, lat2,  lon2,'M');
        double dist1 = dc.distance(lat1, lon1, lat2,  lon2,'N');
        double dist2 = dc.distance(lat1, lon1, lat2,  lon2,'K');
        Test.stopTest();
        
        
    }

}