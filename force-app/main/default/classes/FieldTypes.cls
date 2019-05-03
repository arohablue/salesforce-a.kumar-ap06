public class FieldTypes {
    
    public Map<String,String> getFieldMap(String obj) {
        
           // Convert to schema.sObjectType
		Schema.SObjectType convertType = Schema.getGlobalDescribe().get(obj);

		// Create an instance of that type
		Sobject genericObject = convertType.newSObject();
        
        Map<String ,String> fieldMap = new Map<String ,String>();
        
		Map<String, Schema.SObjectField> M;
		if (obj=='Account') M = Schema.SObjectType.Account.fields.getMap();
        
        for (String fieldName : M.keySet()){
            Schema.SObjectField field = M.get(fieldName);
            Schema.DisplayType FldType = field.getDescribe().getType();
            fieldMap.put(fieldName, string.valueOf(FldType) );
        }
        
        return fieldMap;
    }
}