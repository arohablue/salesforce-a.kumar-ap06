public class GetChildOpportunities {
    public List<Opportunity> oppList{get; set;}
   /* public String name{get; set;}
    public Decimal amount{get; set;}
    public Date closeDate{get; set;}
    public String stage{get; set;} */
    
   
    public GetChildOpportunities(ApexPages.StandardController controller){
        Opportunity opp = (Opportunity)controller.getRecord();
        System.debug(opp);
        oppList  = [SELECT  Name,Amount,CloseDate,StageName FROM Opportunity WHERE Parent_Opportunity__c = :opp.Id];
    }
    
    public void saveTo(){
        System.debug(oppList);
        update oppList;
    }
}