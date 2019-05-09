public class OpportunityHandler  implements ITrigger {


    private static final Integer annualy = 1;
    private static final Integer monthly = 12;
    private static final Integer quaterly = 4;
    
    public void bulkBefore(){}
    public void bulkAfter(){}
    public void beforeInsert(SObject so){}
    public void beforeUpdate(SObject oldSo, SObject so){}
    public void beforeDelete(SObject so){}
    public void afterInsert(SObject so){

        Opportunity opp = (Opportunity)so;

        if(opp.Parent_Opportunity__c == null){
            CreateOpp(opp);
        }

    }

    public void CreateOpp(Opportunity opp){

        Id parentOpp = opp.Id;
        String frequency = opp.Frequency__c;
        Integer year = integer.valueof(opp.Year__c);
        Integer amount = integer.valueof(opp.Amount);
        Integer frequencyCount ;
        Date closeDate = opp.CloseDate;
        Integer noOfMonths ;
        Date oppCloseDate;

        switch on frequency {
            when 'Yearly'  {
                frequencyCount = annualy*year;
                noOfMonths = 12;
            }
            when 'Monthly' {
                frequencyCount = monthly*year;
                noOfMonths = 1;
            }
            when 'Quarterly' {
                frequencyCount = quaterly*year;
                noOfMonths = 4;
            }
            when else {
                frequencyCount = 0;
            }
        }

        Decimal OppAmount = amount/frequencyCount;

        List<Opportunity> OppList =  new List<Opportunity>();
            Integer i = 0;
            for(i = 0 ; i <frequencyCount ; i ++){
                if(i == 0){
				oppCloseDate =   opp.closeDate ;            	  
                } else {
                    Date oppCDate = OppList[i-1].closeDate;
                	oppCloseDate = Date.newInstance(oppCDate.year(), oppCDate.month(), oppCDate.day());
                    
                	oppCloseDate = oppCloseDate.addMonths(noOfMonths);
                    System.debug(oppCloseDate);
                    System.debug(noOfMonths);
                }
                
                
                OppList.add(new Opportunity(Name = opp.Name+i+1, Amount = OppAmount, closeDate = oppCloseDate, Parent_Opportunity__c = opp.Id, StageName =opp.StageName));
            }
        System.debug(OppList);
        insert OppList;
            
        }

    public void afterUpdate(SObject oldSo, SObject so){
        
        Opportunity opp = (Opportunity)so;
        System.debug(opp.stageName.equals('Prospecting'));
        if(opp.Parent_Opportunity__c != null){
            if(!opp.stageName.equals('Prospecting')){
                 updateOpp(opp);
            }
        }

        
    }
    
    public void updateOpp(Opportunity opp){
        System.debug('Update opp Called');
        String stageName = opp.StageName;

        List<Opportunity> opps= new List<Opportunity>();
        Map<String, Id> totalStages = new Map<String,Id>();

        opps = [SELECT  Id, StageName FROM Opportunity WHERE Parent_Opportunity__c = :opp.Parent_Opportunity__c];
		System.debug(opps);
        for(Opportunity op : opps){
            totalStages.put(op.StageName, op.Id);
        }
        System.debug(totalStages);

        if(totalStages.get('Closed Won') != null){ 
           
            Opportunity parentOpp =  [SELECT  StageName FROM Opportunity WHERE Id = :opp.Parent_Opportunity__c];
            parentOpp.StageName = 'Qualification';
            System.debug(parentOpp);
            update parentOpp;
        } 

        if(totalStages.get('Prospecting') == null){
            Opportunity parentOpp =  [SELECT  StageName FROM Opportunity WHERE Id = :opp.Parent_Opportunity__c];
            parentOpp.StageName = 'Closed';
            System.debug(parentOpp);
            update parentOpp;  
        }

    }

    public void afterDelete(SObject so){}
    public void andFinally(){}

}