trigger ContactNameUpdateTrigger on Contact (after update) {
  
    TriggerFactory.createHandler(Contact.sObjectType);

}