@isTest
public class Calculator_Tests {
    
    Class NumberC{
        Integer a;
        Integer b;
        NumberC( Integer a,  Integer b){
            this.a = a;
            this.b = b;
        }
    }
    
    @isTest
    static void prepareTestData(){
        
       	List<Calculator_Tests.NumberC> numbers = new List<Calculator_Tests.NumberC>();
        
        Integer i = 0;
        for(i = 0; i<50; i++){
            numbers.add(new NumberC(i,i+2));
            if(i==49){
                numbers.add(new NumberC(i-49,49));
            }
                
                
        }
        
        List<Boolean> exceptions = new List<Boolean>();
        
        Test.startTest();
        
        for(NumberC nc : numbers){
            try{
                Calculator.addition(nc.a, nc.b);
                Calculator.multiply(nc.a, nc.b);
                Calculator.divide(nc.b, nc.a);
                Calculator.subtraction(nc.b, nc.a);
                Calculator.divide(nc.b, nc.a);
                Calculator.divide(nc.b-48, nc.a-30);
                
            } catch(Calculator.CalculatorException ce){
                exceptions.add(true);
            }
        }
        
        Test.stopTest();

    }

}