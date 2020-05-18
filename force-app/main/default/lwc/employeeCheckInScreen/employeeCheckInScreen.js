import { LightningElement, api} from 'lwc';
// imported to show toast messages
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
//import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
//import QRCODE_FIELD from '@salesforce/schema/Employee_Request__c.QR_Code_Text_URL__c';
//const fields = [QRCODE_FIELD]

export default class EmployeeCheckInScreen extends LightningElement {
    @api recordId;
    @api objectApiName;
    /*@wire(getRecord, { recordId: '$recordId', fields })
    qrcodeimg;
 
    get qrcode() {
        return getFieldValue(this.qrcodeimg.data, QRCODE_FIELD);
    }*/

    // accepted parameters
    get acceptedFormats() {
        return ['.pdf', '.png','.jpg','.jpeg'];
    }
    handleUploadFinished() {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success!!',
                message: 'QR Code scanned successfully!!!',
                variant: 'success',
            }),
        );
    }
}