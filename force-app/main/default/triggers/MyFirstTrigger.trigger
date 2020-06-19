trigger MyFirstTrigger on Account (before insert,before update) {
    for(Account acc: trigger.new){
        acc.Name = 'My First Trigger';
    }
}