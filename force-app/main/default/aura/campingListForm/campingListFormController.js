({
    myAction : function(component, event, helper) {

    },
    clickCreateItem: function(component, event, helper) {
		var validItem = component.find('campform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);   
        // If we pass error checking, do some real work
        if(validItem){
			/*var itemList = component.get("v.items");*/
 			
            var itemAdded = component.get("v.newItem");
			// Copy the expense to a new object
			// THIS IS A DISGUSTING, TEMPORARY HACK
			// var newItem = JSON.parse(JSON.stringify(item));
			
            var newItem = JSON.parse(JSON.stringify(itemAdded));
            console.log(newItem);
            helper.createItem(component, itemAdded);
	
			/*
			itemList.push(newItem);
			component.set("v.items", itemList);
			component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c','Name': '','Quantity__c': 0,
                    'Price__c': 0,'Packed__c': false });
            */
		}
    }
})