import { LightningElement, track } from 'lwc';
import getContacts from '@salesforce/apex/ContactService.getContacts';

export default class AccountContactManager extends LightningElement {
    @track accountId;
    @track contacts;

    handleInputChange(event) {
        this.accountId = event.target.value;
    }

    fetchContacts() {
        getContacts({ accountId: this.accountId })
            .then((result) => {
                this.contacts = result;
            })
            .catch((error) => {
                console.error('Error fetching contacts:', error);
            });
    }
}
