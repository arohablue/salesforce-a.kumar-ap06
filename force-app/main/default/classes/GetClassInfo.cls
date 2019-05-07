public class GetClassInfo {

    public void infoObj(Object obj) {
        if (obj == null) {
            System.debug('Object does not exist');
        }
        
        Map<String, Schema.SObjectType> gd =
		Schema.getGlobalDescribe();
        System.debug(gd);
    }
    
}