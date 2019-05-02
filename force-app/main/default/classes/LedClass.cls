public class LedClass {
    
    public void myMethod(String s){
        System.debug(s);
    }
    
    public Integer screenLedCount(String ScreenInput){
        
        List<Integer> integerList = new List<Integer>();
        Integer ledCount = 0;

        List<String> client_digits = ScreenInput.split('');
        for(String s : client_digits) {
            Integer parsed_digit = safeParse(s);
            if (s == null || parsed_digit == null ) {
                System.debug('Enter a valid number');
               	
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
    
public Integer ledCount(Integer num){
        switch on num {
            when 1 {
					return 2 ;
    		}
            when 2 ,3 ,5{ 
                    return 5 ;
    		}
            when 4 {
                    return 4 ;
    		}  
            when 0, 6 {
                    return 6 ;
    		}
            when 7 {
                    return 3 ;
    		}
            when 8, 9 {
                    return 7 ;
    		}
		}
    return null;
    }

}