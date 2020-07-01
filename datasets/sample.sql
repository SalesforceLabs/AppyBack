BEGIN TRANSACTION;
CREATE TABLE "Company_News__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"Date_Posted__c" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	"Headline__c" VARCHAR(255), 
	"News_Type__c" VARCHAR(255), 
	"Public__c" VARCHAR(255), 
	"RecordTypeId" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Company_News__c" VALUES('a0017000006qQ7cAAE','2020-06-22','Office will open at 8:00 AM and close at 7:00 PM. Please respect the rules.','Opening office hours','Office','true','','New');
INSERT INTO "Company_News__c" VALUES('a0017000006qPzHAAU','2020-06-23','Building will be sanitised at 1:00 PM, please leave you desk for 30 minutes','Latest News','Office','true','','Urgent');
CREATE TABLE "Company_News__c_rt_mapping" (
	record_type_id VARCHAR(18) NOT NULL, 
	developer_name VARCHAR(255), 
	PRIMARY KEY (record_type_id)
);
INSERT INTO "Company_News__c_rt_mapping" VALUES('01217000001iQDhAAM','Company_New_RT');
CREATE TABLE "Employee_Request__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"Approved_Date__c" VARCHAR(255), 
	"Approved__c" VARCHAR(255), 
	"Business_Critical__c" VARCHAR(255), 
	"Denied_Checkin_Reason__c" VARCHAR(255), 
	"Description_of_Request__c" VARCHAR(255), 
	"Executive_Approval_Needed__c" VARCHAR(255), 
	"Gloves__c" VARCHAR(255), 
	"High_Risk_Zone__c" VARCHAR(255), 
	"Mask__c" VARCHAR(255), 
	"Privacy_Policy__c" VARCHAR(255), 
	"Reason_for_Request__c" VARCHAR(255), 
	"Rejection_Reason__c" VARCHAR(255), 
	"Requested_Date__c" VARCHAR(255), 
	"Requested_Slot__c" VARCHAR(255), 
	"Self_Quarantined__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"Temperature_Self_check__c" VARCHAR(255), 
	"Temperature__c" VARCHAR(255), 
	location_booking__c VARCHAR(255), 
	location__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Employee_Request__c" VALUES('a011700000BNvW1AAL','2020-06-23','true','true','','','false','false','true','false','true','Customer related activities','','2020-06-25','Full Day','true','Approved','true','false','a031700000FHLe1AAH','a041700000K4xAKAAZ');
INSERT INTO "Employee_Request__c" VALUES('a011700000BNvW6AAL','2020-06-23','true','true','','','false','false','true','false','true','Customer related activities','','2020-06-27','Morning','true','Approved','true','false','a031700000FHLfBAAX','a041700000K58m1AAB');
CREATE TABLE "Location_Administration__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"End_Date__c" VARCHAR(255), 
	"Number_of_Sanification__c" VARCHAR(255), 
	"Reserved_Seats__c" VARCHAR(255), 
	"Start_Date__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"Total_Seats_Afternoon__c" VARCHAR(255), 
	"Total_Seats_Morning__c" VARCHAR(255), 
	location__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Location_Administration__c" VALUES('a021700000I6YOVAA3','2020-07-31','1.0','5.0','2020-06-23','New','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Administration__c" VALUES('a021700000I6YOQAA3','2020-08-31','2.0','20.0','2020-06-23','New','300.0','300.0','a041700000K4xAKAAZ');
CREATE TABLE "Location_Daily_Info__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"Date__c" VARCHAR(255), 
	"Number_of_Sanifications__c" VARCHAR(255), 
	"Reserved_Daily_Seats__c" VARCHAR(255), 
	"Seats_Available_Afternoon__c" VARCHAR(255), 
	"Seats_Available_Morning__c" VARCHAR(255), 
	"Total_Seats_Afternoon__c" VARCHAR(255), 
	"Total_Seats_Morning__c" VARCHAR(255), 
	location__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLe9AAH','2020-07-03','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeAAAX','2020-07-04','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeBAAX','2020-07-05','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeCAAX','2020-07-06','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeDAAX','2020-07-07','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeEAAX','2020-07-08','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeFAAX','2020-07-09','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeGAAX','2020-07-10','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeHAAX','2020-07-11','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeIAAX','2020-07-12','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeJAAX','2020-07-13','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeKAAX','2020-07-14','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeLAAX','2020-07-15','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeMAAX','2020-07-16','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeNAAX','2020-07-17','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeOAAX','2020-07-18','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLePAAX','2020-07-19','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeQAAX','2020-07-20','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeRAAX','2020-07-21','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeSAAX','2020-07-22','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeTAAX','2020-07-23','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeUAAX','2020-07-24','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeVAAX','2020-07-25','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeWAAX','2020-07-26','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeXAAX','2020-07-27','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeYAAX','2020-07-28','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeZAAX','2020-07-29','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeaAAH','2020-07-30','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLebAAH','2020-07-31','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLecAAH','2020-08-01','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLedAAH','2020-08-02','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeeAAH','2020-08-03','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLefAAH','2020-08-04','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLegAAH','2020-08-05','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLehAAH','2020-08-06','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeiAAH','2020-08-07','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLejAAH','2020-08-08','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLekAAH','2020-08-09','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLelAAH','2020-08-10','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLemAAH','2020-08-11','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLenAAH','2020-08-12','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeoAAH','2020-08-13','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLepAAH','2020-08-14','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeqAAH','2020-08-15','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLerAAH','2020-08-16','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLesAAH','2020-08-17','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLetAAH','2020-08-18','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeuAAH','2020-08-19','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLevAAH','2020-08-20','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLewAAH','2020-08-21','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLexAAH','2020-08-22','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLeyAAH','2020-08-23','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLezAAH','2020-08-24','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLf0AAH','2020-08-25','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLf1AAH','2020-08-26','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLf2AAH','2020-08-27','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLf3AAH','2020-08-28','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLf4AAH','2020-08-29','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLf5AAH','2020-08-30','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLf6AAH','2020-08-31','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLf7AAH','2020-06-23','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLf8AAH','2020-06-24','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLf9AAH','2020-06-25','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfAAAX','2020-06-26','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfBAAX','2020-06-27','1.0','5.0','50.0','49.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfCAAX','2020-06-28','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfDAAX','2020-06-29','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfEAAX','2020-06-30','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfFAAX','2020-07-01','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfGAAX','2020-07-02','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfHAAX','2020-07-03','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfIAAX','2020-07-04','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfJAAX','2020-07-05','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfKAAX','2020-07-06','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfLAAX','2020-07-07','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfMAAX','2020-07-08','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfNAAX','2020-07-09','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfOAAX','2020-07-10','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfPAAX','2020-07-11','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfQAAX','2020-07-12','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfRAAX','2020-07-13','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfSAAX','2020-07-14','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfTAAX','2020-07-15','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfUAAX','2020-07-16','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfVAAX','2020-07-17','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfWAAX','2020-07-18','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfXAAX','2020-07-19','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfYAAX','2020-07-20','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfZAAX','2020-07-21','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfaAAH','2020-07-22','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfbAAH','2020-07-23','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfcAAH','2020-07-24','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfdAAH','2020-07-25','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfeAAH','2020-07-26','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLffAAH','2020-07-27','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfgAAH','2020-07-28','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfhAAH','2020-07-29','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfiAAH','2020-07-30','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLfjAAH','2020-07-31','1.0','5.0','50.0','50.0','50.0','50.0','a041700000K58m1AAB');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLdzAAH','2020-06-23','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLe0AAH','2020-06-24','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLe1AAH','2020-06-25','2.0','20.0','299.0','299.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLe2AAH','2020-06-26','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLe3AAH','2020-06-27','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLe4AAH','2020-06-28','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLe5AAH','2020-06-29','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLe6AAH','2020-06-30','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLe7AAH','2020-07-01','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
INSERT INTO "Location_Daily_Info__c" VALUES('a031700000FHLe8AAH','2020-07-02','2.0','20.0','300.0','300.0','300.0','300.0','a041700000K4xAKAAZ');
CREATE TABLE "Location__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	"City__c" VARCHAR(255), 
	"Country__c" VARCHAR(255), 
	"Expected_Open_Date__c" VARCHAR(255), 
	"Gloves_quantity__c" VARCHAR(255), 
	"Location_Close_Date__c" VARCHAR(255), 
	"Location_Phone__c" VARCHAR(255), 
	"Location_Type__c" VARCHAR(255), 
	"Mask_quantity__c" VARCHAR(255), 
	"Ongoing_Issues__c" VARCHAR(255), 
	"Operating_Hours__c" VARCHAR(255), 
	"State_Region__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"Street_Address__c" VARCHAR(255), 
	"ZIP_Code__c" VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Location__c" VALUES('a041700000K4xAKAAZ','San Francisco - Tower','San Francisco','CA','2020-06-08','3000.0','2020-12-31','','Corporate Headquarters','5000.0','','','','Open','','');
INSERT INTO "Location__c" VALUES('a041700000K58m1AAB','Milan - Office','Milan','IT','2020-06-01','300.0','2020-12-31','','Office Building','500.0','','','','Partial Hours','Galleria Passarella 2','20100');
CREATE TABLE "Medical__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"Covid_19__c" VARCHAR(255), 
	"End_Date__c" VARCHAR(255), 
	"End_Illness_Certificate__c" VARCHAR(255), 
	"MD_Name__c" VARCHAR(255), 
	"Start_Date__c" VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Medical__c" VALUES('a0517000007BjuRAAS','Currently Impacted','2020-06-26','true','MyDoc','2020-06-23');
CREATE TABLE "Sanitization__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"Sanitization_DateTime__c" VARCHAR(255), 
	"Sanitization_Date__c" VARCHAR(255), 
	location__c VARCHAR(255), 
	location_sanitization__c VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Sanitization__c" VALUES('a061700000919TfAAI','2020-06-22T19:00:00.000Z','2020-06-23','a041700000K4xAKAAZ','a031700000FHLe1AAH');
COMMIT;
