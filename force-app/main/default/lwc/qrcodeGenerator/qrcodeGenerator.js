import { LightningElement, api } from 'lwc';
import qrcode from './qrcode.js';

export default class QrCodeGeneration extends LightningElement {
    @api recordId;
    @api objectApiName;
    url;
    
    renderedCallback() {
        //this.url = window.location.origin + '/lightning/r/' + this.objectApiName + '/' + this.recordId + '/view';
        this.url = 'salesforce1://sObject/' + this.recordId + '/view'; 
        const qrCodeGenerated = new qrcode(0, 'H');
        let strForGenearationOfQRCode  = this.url;
        qrCodeGenerated.addData(strForGenearationOfQRCode);
        qrCodeGenerated.make();
        let element = this.template.querySelector(".qrcode2");
        element.innerHTML = qrCodeGenerated.createSvgTag({});
   }
}