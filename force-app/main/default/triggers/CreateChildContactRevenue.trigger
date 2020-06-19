trigger CreateChildContactRevenue on Account (after insert,after update) {
    List<Contact> conList = new List<Contact>();
    for(Account acc:Trigger.New){
        if(acc.AnnualRevenue > 1000000){
            Contact c = new Contact();
            c.LastName = acc.name;
            c.Phone = acc.Phone;
            c.AccountId = acc.id;
            conList.add(c);
        }
    }
    if(conList.size() > 0){
        upsert conList;
    }
}