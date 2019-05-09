trigger TriggerContextVariables on Account (before insert, before update) {
    
    
    if (Trigger.isBefore && Trigger.isInsert) {
        System.debug('isBefore & isInsert');
        System.debug(Trigger.newMap);
        System.debug(Trigger.oldMap	);
        System.debug(Trigger.operationType);
        System.debug(Trigger.size);
        System.debug('Trigger new val--->'+Trigger.new);
        System.debug(Trigger.old);
    }
    
    if (Trigger.isBefore && Trigger.isUpdate) {
        System.debug('isBefore & isUpdate ');
        System.debug(Trigger.newMap);
        System.debug(Trigger.oldMap	);
        System.debug(Trigger.operationType);
        System.debug(Trigger.size);
        System.debug(Trigger.new);
        System.debug(Trigger.old);
    }
    
    if (Trigger.isBefore && Trigger.isDelete) {
        System.debug('isBefore & isDelete ');
        System.debug(Trigger.newMap);
        System.debug(Trigger.oldMap	);
        System.debug(Trigger.operationType);
        System.debug(Trigger.size);
        System.debug(Trigger.new);
        System.debug(Trigger.old);
    }
    
    if (Trigger.isAfter && Trigger.isInsert) {
        System.debug('isAfter & isInsert ');
        System.debug(Trigger.newMap);
        System.debug(Trigger.oldMap	);
        System.debug(Trigger.operationType);
        System.debug(Trigger.size);
        System.debug(Trigger.new);
        System.debug(Trigger.old);
    }
    
    if (Trigger.isAfter && Trigger.isUpdate) {
        System.debug('isAfter & isUpdate ');
        System.debug(Trigger.newMap);
        System.debug(Trigger.oldMap	);
        System.debug(Trigger.operationType);
        System.debug(Trigger.size);
        System.debug(Trigger.new);
        System.debug(Trigger.old);
    }
    
    if (Trigger.isAfter && Trigger.isDelete) {
        System.debug('isAfter & isDelete ');
        System.debug(Trigger.newMap);
        System.debug(Trigger.oldMap	);
        System.debug(Trigger.operationType);
        System.debug(Trigger.size);
        System.debug(Trigger.new);
        System.debug(Trigger.old);
    }
    
    if (Trigger.isAfter && Trigger.isUndelete) {
        System.debug('isAfter & isUndelete ');
        System.debug(Trigger.newMap);
        System.debug(Trigger.oldMap	);
        System.debug(Trigger.operationType);
        System.debug(Trigger.size);
        System.debug(Trigger.new);
        System.debug(Trigger.old);
    }

}