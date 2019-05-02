trigger demoClassTrigger on Account (before insert) {
    demoClass.addHelloWorld(Trigger.new);
    
}