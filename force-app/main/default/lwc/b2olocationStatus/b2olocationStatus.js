import { LightningElement, wire, track } from 'lwc';
import { getListUi } from 'lightning/uiListApi'; 

// This is a beta functionality that is not working currently in Summer '20
// Use at your own risk
import OFFICE_LOCATION_OBJECT from '@salesforce/schema/appyback__Location__c';

export default class B2olocationStatus extends LightningElement {
    @track sobjectResult;
    @wire(getListUi, {
        objectApiName: OFFICE_LOCATION_OBJECT,
        listViewApiName: 'All'
    })
    wiredlistView({
        error,
        data
    }) {
        if (data) {
            this.sobjectResult = data.records.records;
        } else if (error) {
            this.error = error;
        }
    }
}
