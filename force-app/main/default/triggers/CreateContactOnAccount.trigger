trigger CreateContactOnAccount on Account (after insert) {
    List<Contact> conList = new List<Contact>();
    for(Account acc : Trigger.new){
        Contact objCont = new Contact();
        objCont.description = 'Created from trigger';
        objCont.lastname = acc.name;
        objCont.accountId = acc.id;
        conList.add(objCont);        
    }
    if(conList.size() > 0){
        insert conList;
    }
}