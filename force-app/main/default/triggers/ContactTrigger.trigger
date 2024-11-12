/* The trigger runs after insert and after update on the Contact object */
trigger ContactTrigger on Contact (after insert, after update) {
    /* The trigger logic checks if the Contact has an associated Account and updates a custom field NumberOfContacts__c on the Account */
    List<Account> accountsToUpdate = new List<Account>();

    for (Contact contact : Trigger.new) { /* Trigger.new refers to the new version of the Contact records being inserted or updated */
        if (contact.AccountId != null) {
            Account acc = [SELECT Id, NumberOfContact__c FROM Account WHERE Id = :contact.AccountId]; /* SOQL Query to fetch the Account informations */
            acc.NumberOfContacts__c = (acc.NumberOfContacts__c == null ? 0 : acc.NumberOfContacts__c) + 1;
            accountsToUpdate.add(acc);
        }
    }

    if (!accountsToUpdate.isEmpty()){
        update accountsToUpdate;
    }
}