public class LedClass {
    
    public Integer screenLedCount(String ScreenInput){
        
        List<Integer> integerList = new List<Integer>();
        Integer ledCount = 0;
        
        List<String> client_digits = ScreenInput.split('');
        for(String s : client_digits) {
            Integer parsed_digit = safeParse(s);
            if (s == null || parsed_digit == null ) {
                 System.debug('Enter a valid number');
                 return ledCount;
   
            } else {
                integerList.add(parsed_digit);
            }
        }
        System.debug(integerList);
        
        for(Integer i : integerList) {
            ledCount += ledCount(i);
        }
        
        System.debug(ledCount);
        return ledCount;
    }
    
    public static Integer safeParse(String input) {
        Integer result = null;
        try {
            result = Integer.valueOf(input);
        } catch (Exception ex) {
            System.debug(ex);
            return null;
        }
        return result;
    }
    
    public Integer ledCount(Integer numb){
        Integer num = 0;
        switch on numb {
            when 1 {
                num = 2 ;
            }
            when 2 ,3 ,5{ 
                num = 5 ;
            }
            when 4 {
                num = 4 ;
            }  
            when 0, 6 {
                num = 6 ;
            }
            when 7 {
                num = 3 ;
            }
            when 8, 9 {
                num = 7 ;
            }
            
        }
        return num;
    }
    
}