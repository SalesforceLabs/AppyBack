import { LightningElement, wire, track } from 'lwc';
import { getListUi } from 'lightning/uiListApi'; 

//import OFFICE_LOCATION_OBJECT from '@salesforce/schema/Location__c';

export default class B2olocationStatus extends LightningElement {
    @track sobjectResult;
    @wire(getListUi, {
        objectApiName: 'appysebback__Location__c',
        listViewApiName: 'appysebback__All'
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
