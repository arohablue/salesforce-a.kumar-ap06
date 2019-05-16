public class AddOppExtension {
    public Opportunity parentOpp{get; set;}
    public Id oppId {get; set;}
    public String oppIdfetched {get; set;}
    
    public AddOppExtension(){
         parentOpp= new opportunity();
    }
    
    public void saveTo(){
        opportunity opp= new opportunity();
        opp.Amount = parentOpp.Amount;
        opp.StageName = parentOpp.StageName;
        opp.Name = parentOpp.Name;
        opp.Year__c = parentOpp.Year__c;
        opp.Frequency__c = parentOpp.Frequency__c;
        opp.CloseDate = parentOpp.CloseDate;
        
        insert opp;
        
        oppId = opp.Id;
        
    }
    
    public PageReference nextPage()
    {
        PageReference pr = new PageReference('/apex/ViewChildOpportunities?Id='+oppId);
        pr.setRedirect(true);
        return pr;
    }
    
}