@isTest
public class TestVerifyDate {
    
    @isTest
    static void dateWithinThirtyDays(){
        Date d1 = Date.newInstance(1960, 2, 17);
		Date d2 = Date.newInstance(1960, 2, 25);
        Date d3 = VerifyDate.CheckDates(d1, d2);
        System.assertEquals(d2,d3);

    }
    
    @isTest
    static void dateInPast(){
        Date d1 = Date.newInstance(1960, 2, 17);
		Date d2 = Date.newInstance(1960, 2, 15);
        Date d3 = VerifyDate.CheckDates(d1, d2);
        System.assertEquals(d2,d3);

    }
    
    @isTest
    static void dateNotWithinThirtyDays(){
        Date d1 = Date.newInstance(1960, 2, 17);
		Date d2 = Date.newInstance(1960, 3, 25);
        Date d3 = VerifyDate.CheckDates(d1, d2);
        Date date30Days = d1.addDays(30);
        System.assertEquals(date30Days,d3);

    }

}