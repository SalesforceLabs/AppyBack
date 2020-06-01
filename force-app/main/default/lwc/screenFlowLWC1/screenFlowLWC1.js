import {
    LightningElement,
    wire,
    track,
    api
} from 'lwc';
import getLocations from '@salesforce/apex/LocationStatusController.getLocations';
import getLocationDates from '@salesforce/apex/LocationStatusController.getLocationDates';

export default class screenFlowLWC1 extends LightningElement {
    @track locationItems = [];
    @api locationValue = ''; 

    @track dateItems = []; 
    @track dateOptions = []; 
    @api dateValue = ''; 

    @api clickedButtonLabel;
    slotValue = '';

    @wire(getLocations)
    wiredLocations({
        error,
        data
    }) {
        if (data) {
            let theOptions = [];
            for (let i = 0; i < data.length; i++) {
                theOptions.push({
                    value: data[i].Id,
                    label: data[i].Name
                });
            }
            this.locationItems = theOptions;
            this.error = undefined;
        } else if (error) {
            window.console.log('Error: ', error);
            this.locationItems = undefined;
        }
    }

    @wire(getLocationDates, {
        location: '$locationValue'
    })
    wiredLocationDates({
        error,
        data
    }) {
        if (data) {
            this.dateItems = data;
            let theOptions = [];
            for (let i = 0; i < data.length; i++) {
                theOptions.push({
                    value: data[i].Id,
                    label: new Date(data[i].appyback__Date__c).toLocaleDateString()
                });
            }
            this.dateOptions = theOptions;
            this.error = undefined;
        } else if (error) {
            window.console.log('Error: ', error);
            this.dateOptions = undefined;
        }
    }

    handleLocationChange(event) {
        window.console.log('handleLocationChange');
        this.locationValue = event.detail.value;
    }

    handleDateChange(event) {
        window.console.log('handleDateChange');
        this.dateValue = event.detail.value;
        window.console.log('this.dateValue: ', this.dateValue);
    }

    get dateDisabled() {
        return this.dateItems.length > 0 ? false : true;
    }

    get fullDayDisabled() {
        window.console.log('fullDayDisabled');
        if (!this.dateValue) {
            return true;
        }
        for (let theDateRec of this.dateItems) {
            if (theDateRec.Id === this.dateValue) {
                window.console.log('Match');
                window.console.log('theDateRec.appyback__Seats_Available_Full__c: ', theDateRec.appyback__Seats_Available_Full__c);
                return theDateRec.appyback__Seats_Available_Full__c > 0 ? false : true;
            }
        }
        return true;
    }
    get morningDisabled() {
        window.console.log('morningDisabled');
        if (!this.dateValue) {
            return true;
        }
        for (let theDateRec of this.dateItems) {
            window.console.log('theDateRec: ', theDateRec);
            if (theDateRec.Id === this.dateValue) {
                window.console.log('Match');
                window.console.log('theDateRec.appyback__Seats_Available_Morning__c: ', theDateRec.appyback__Seats_Available_Morning__c);
                return theDateRec.appyback__Seats_Available_Morning__c > 0 ? false : true;
            }
        }
        return true;
    }
    get afternoonDisabled() {
        window.console.log('afternoonDisabled');
        if (!this.dateValue) {
            return true;
        }
        for (let theDateRec of this.dateItems) {
            if (theDateRec.Id === this.dateValue) {
                window.console.log('Match');
                window.console.log('theDateRec.appyback__Seats_Available_Afternoon__c: ', theDateRec.appyback__Seats_Available_Afternoon__c);
                return theDateRec.appyback__Seats_Available_Afternoon__c > 0 ? false : true;
            }
        }
        return true;
    }

    handleClick(event) {
        this.clickedButtonLabel = event.target.label;
        window.console.log('You clicked: ', this.clickedButtonLabel);
       
        // eslint-disable-next-line
        let buttons = this.template.querySelectorAll('lightning-button').forEach(function(el) {
            el.variant = "neutral";
        });
        
        event.target.variant = "brand";
    }
}
