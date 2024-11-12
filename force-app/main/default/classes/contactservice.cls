public class ContactService {
    @AuraEnabled /* Makes the method available for us ein Lightning components */
    public static Listz<Contact> getContacts(Id accountId) { /* The getContacts method fetches contacts related to a specific Account */
        return [SELECT Id, Name FROM Contact WHERE AccountId = :accountId];
    }
}