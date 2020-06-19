({
    helperMethod : function() {

    },
    createItem: function(component, campingItem) {
        var createEvent = component.getEvent("addItem");
        createEvent.setParams({ "item": campingItem });
        createEvent.fire();

        component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c',
        'Name': '',
        'Quantity__c': 0,
        'Price__c': 0,
        'Packed__c': false });
    }
})