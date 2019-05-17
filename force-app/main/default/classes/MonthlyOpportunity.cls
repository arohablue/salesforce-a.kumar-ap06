public class MonthlyOpportunity {
    
    public List<Id> getAccountsOfContactBasedOnAge(Integer lowerAge, Integer UpperAge){
        List<Id> accountIds= new List<Id>();
    
        List<Contact> conts = new List<Contact>();
           conts =  [SELECT AccountId, birthdate FROM Contact ] ;
        
        for(Contact cont : conts){
            if(cont.birthdate != null) {
            	Date birthdate = Date.newinstance(cont.birthdate.year(), cont.birthdate.month(), cont.birthdate.day());
            	Date todaydate = Date.newinstance(System.Today().year(), System.Today().month(), System.Today().day());
            
            	Decimal monthDiff = (Decimal)birthdate.daysBetween(todaydate);
            	Integer age =  (monthDiff/365.2425).intValue();
                
            	if(age > lowerAge && age < UpperAge ) {
                	accountIds.add(cont.AccountId);
            	} 
            }
                     
        }
       
        return accountIds;
    		
        }
    
    
    public Map<Integer,Map<String, Decimal>> getOpportunitySummary(Integer lage, Integer uage){
        
        List<Id> accountIds = getAccountsOfContactBasedOnAge(lage, uage);
        Map<String, Decimal> oppSumMonthly;
        
        Map<Integer,Map<String, Decimal>> oppSumYearly = new  Map<Integer,Map<String, Decimal>>();
        
        for(Opportunity[] opps:[Select AccountId, Amount, CloseDate from Opportunity where AccountId in:accountIds]) {
            
   				for(Opportunity opp : opps)
   				{
                    if(opp.CloseDate != null) {
                        Integer year = opp.CloseDate.year();
                        String month =   DateTime.newInstance(opp.CloseDate.year(), opp.CloseDate.month(), opp.CloseDate.day()).format('MMMMM');
                        if(oppSumYearly.containsKey(year)){
                            oppSumMonthly = oppSumYearly.get(year);
                            if(oppSumMonthly.containsKey(month)){
                                oppSumMonthly.put(month,oppSumMonthly.get(month)+opp.amount);
                                oppSumYearly.put(year,oppSumMonthly);
                            } else {
                                oppSumMonthly.put(month,opp.amount);
                                oppSumYearly.put(year,oppSumMonthly);
                            }
                            
                        } else {
                         oppSumMonthly = new Map<String,Decimal>();
                         oppSumMonthly.put(month,opp.amount);
                         oppSumYearly.put(year,oppSumMonthly);
                        }
                         
                    }
   				}
		}
        
        return oppSumYearly;
    }  

}