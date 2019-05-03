public class StringArrayTest {

    public  static List<String> generateStringArray(Integer num){
        List<String> nums = new List<String>();
        Integer test = 0;
        do{
            nums.add('Test '+test);
            test++;
        }
        while(num>test) ;
        
        return nums;
    }
    
}