/******************************/
/* Web Reservation System DDL */
/* By: HGM <July 22,2015>     */
/* Modified: 2015-08-26       */
/* For: Innosoft-Bit          */
/******************************/


/**************************/
/* WR_SECURITY_USER Table */
/**************************/
DROP TABLE WR_SECURITY_USER;
CREATE TABLE WR_SECURITY_USER (  
  USER_ID int NOT NULL, 
  USER_LOGIN varchar(255) NOT NULL,  
  USER_PASSWORD varchar(255) NOT NULL,  
  CONSTRAINT WR_SECURITY_USER_PK PRIMARY KEY (USER_ID) 
);  


/***********************************/
/* WR_SECURITY_USER_PASSWORD Table */
/***********************************/
DROP TABLE WR_SECURITY_USER_PASSWORD;
CREATE TABLE WR_SECURITY_USER_PASSWORD (  
  UPWD_ID int NOT NULL, 
  UPWD_USER_ID int NOT NULL,  
  UPWD_PASSWORD varchar(255) NOT NULL,  
  CONSTRAINT WR_SECURITY_USER_PASSWORD_PK PRIMARY KEY (UPWD_ID),
  CONSTRAINT UPWD_USER_ID_FK FOREIGN KEY (UPWD_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID)
);  


/********************/
/* WR_MESSAGE Table */
/********************/
DROP TABLE WR_MESSAGE;
CREATE TABLE WR_MESSAGE (  
  MESG_ID int NOT NULL,  
  MESG_CODE varchar(255) NOT NULL,  
  MESG_LEVEL varchar(255) NOT NULL,  
  MESG_START_DATE date NOT NULL,  
  MESG_END_DATE date NOT NULL,  
  MESG_NOTE varchar(255) NOT NULL, 
  CREATED_DATE date NOT NULL,
  CREATED_BY_USER_ID int NOT NULL,
  UPDATED_DATE date NOT NULL,
  UPDATED_BY_USER_ID int NOT NULL, 
  ISDELETED int NOT NULL,
  ISDELETED_DATE date NULL,
  ISDELETED_BY_USER_ID int NULL,
  CONSTRAINT WR_MESSAGE_PK PRIMARY KEY (MESG_ID),
  CONSTRAINT WR_MESSAGE_FK1 FOREIGN KEY (CREATED_BY_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_MESSAGE_FK2 FOREIGN KEY (UPDATED_BY_USER_ID ) REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_MESSAGE_FK3 FOREIGN KEY (ISDELETED_BY_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID)
); 


/*****************/
/* WR_CODE Table */
/*****************/
DROP TABLE WR_CODE;      
CREATE TABLE WR_CODE (  
  CODE_ID int NOT NULL,  
  CODE_KIND_CODE varchar(255) NOT NULL,  
  CODE_CODE_VALUE varchar(255) NOT NULL,  
  CODE_TEXT varchar(255) NOT NULL,  
  CODE_ISDISPLAY int NOT NULL,  
  CODE_NOTE varchar(255) NOT NULL,
  CREATED_DATE date NOT NULL,
  CREATED_BY_USER_ID int NOT NULL,
  UPDATED_DATE date NOT NULL,
  UPDATED_BY_USER_ID int NOT NULL, 
  ISDELETED int NOT NULL,
  ISDELETED_DATE date NULL,
  ISDELETED_BY_USER_ID int NULL,
  CONSTRAINT WR_CODE_PK PRIMARY KEY (CODE_ID),
  CONSTRAINT WR_CODE_FK1 FOREIGN KEY (CREATED_BY_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_CODE_FK2 FOREIGN KEY (UPDATED_BY_USER_ID ) REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_CODE_FK3 FOREIGN KEY (ISDELETED_BY_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID)
);  


/*********************/
/* WR_CUSTOMER Table */
/*********************/
DROP TABLE WR_CUSTOMER;
CREATE TABLE WR_CUSTOMER (
  CUST_ID int NOT NULL,
  CUST_CUSTOMER_NO varchar(255) NOT NULL,  
  CUST_NAME varchar(255) NOT NULL,
  CUST_PHONENO varchar(255) NOT NULL,
  CUST_EMAIL varchar(255) NOT NULL,
  CUST_ZIPCODE varchar(255) NOT NULL,
  CUST_ADDRESS1 varchar(255) NULL,
  CUST_ADDRESS2 varchar(255) NULL,
  CUST_ADDRESS3 varchar(255) NULL,
  CUST_ISDELETED int NOT NULL,
  CREATED_DATE date NOT NULL,
  CREATED_BY_USER_ID int NOT NULL,
  UPDATED_DATE date NOT NULL,
  UPDATED_BY_USER_ID int NOT NULL, 
  ISDELETED int NOT NULL,
  ISDELETED_DATE date NULL,
  ISDELETED_BY_USER_ID int NULL,
  CONSTRAINT WR_CUSTOMER_PK PRIMARY KEY(CUST_ID),
  CONSTRAINT WR_CUSTOMER_FK1 FOREIGN KEY (CREATED_BY_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_CUSTOMER_FK2 FOREIGN KEY (UPDATED_BY_USER_ID ) REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_CUSTOMER_FK3 FOREIGN KEY (ISDELETED_BY_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID)
);

/*******************/
/* WR_CHARGE Table */
/*******************/
DROP TABLE WR_CHARGE;
CREATE TABLE WR_CHARGE (  
  CHRG_ID int NOT NULL,  
  CHRG_CHARGE_NO varchar(255) NOT NULL,  
  CHRG_CUST_ID int NOT NULL,  
  CHRG_PRICE number NOT NULL,  
  CHRG_APP_DIVISION varchar(255) NOT NULL,  
  CHRG_APP_START_DATE date NOT NULL, 
  CHRG_APP_END_DATE date NOT NULL,
  CREATED_DATE date NOT NULL,
  CREATED_BY_USER_ID int NOT NULL,
  UPDATED_DATE date NOT NULL,
  UPDATED_BY_USER_ID int NOT NULL, 
  ISDELETED int NOT NULL,
  ISDELETED_DATE date NULL,
  ISDELETED_BY_USER_ID int NULL,
  CONSTRAINT WR_CHARGE_PK PRIMARY KEY (CHRG_ID),
  CONSTRAINT WR_CHARGE_FK1 FOREIGN KEY (CHRG_CUST_ID) REFERENCES WR_CUSTOMER (CUST_ID),
  CONSTRAINT WR_CHARGE_FK2 FOREIGN KEY (CREATED_BY_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_CHARGE_FK3 FOREIGN KEY (UPDATED_BY_USER_ID ) REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_CHARGE_FK4 FOREIGN KEY (ISDELETED_BY_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID)
);


/**************************/
/* WR_CUSTOMER_TIME Table */
/**************************/
DROP TABLE WR_CUSTOMER_TIME;
CREATE TABLE WR_CUSTOMER_TIME (  
  CTIM_ID int NOT NULL,  
  CTIM_CUST_ID int NULL,  
  CTIM_DETAILS_NO int NOT NULL,  
  CTIM_INTERVAL_OF_TIMES int NOT NULL, 
  CTIM_MAX_UNIT_NO int NOT NULL,
  CTIM_MAX_PARTS_NO int NOT NULL,
  CREATED_DATE date NOT NULL,
  CREATED_BY_USER_ID int NOT NULL,
  UPDATED_DATE date NOT NULL,
  UPDATED_BY_USER_ID int NOT NULL, 
  ISDELETED int NOT NULL,
  ISDELETED_DATE date NULL,
  ISDELETED_BY_USER_ID int NULL,
  CONSTRAINT WR_CUSTOMER_TIME_PK PRIMARY KEY (CTIM_ID),
  CONSTRAINT WR_CUSTOMER_TIME_FK1 FOREIGN KEY (CTIM_CUST_ID) REFERENCES WR_CUSTOMER (CUST_ID),
  CONSTRAINT WR_CUSTOMER_TIME_FK2 FOREIGN KEY (CREATED_BY_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_CUSTOMER_TIME_FK3 FOREIGN KEY (UPDATED_BY_USER_ID ) REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_CUSTOMER_TIME_FK4 FOREIGN KEY (ISDELETED_BY_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID)
);

/****************************/
/* WR_CUSTOMER_MEMBER Table */
/****************************/
DROP TABLE WR_CUSTOMER_MEMBER;		
CREATE TABLE WR_CUSTOMER_MEMBER (  
  MEBR_ID int NOT NULL,  
  MEBR_CUST_ID int NOT NULL,  
  MEBR_CUSTOMER_MEMBER_NO varchar(255) NOT NULL,
  MEBR_USER_ID int NOT NULL,
  MEBR_TEL_NO varchar(255) NOT NULL, 
  MEBR_EMAIL_ADDRESS varchar(255) NOT NULL,
  MEBR_FIRST_NAME varchar(255) NOT NULL,
  MEBR_LAST_NAME varchar(255)NOT NULL,
  MEBR_DATE_OF_BIRTH date NOT NULL,
  MEBR_ZIP_CODE varchar(255) NOT NULL,
  MEBR_ADDRESS1 varchar(255) NULL,
  MEBR_ADDRESS2 varchar(255) NULL,
  MEBR_ADDRESS3 varchar(255) NULL,
  MEBR_POINT int NOT NULL,
  MEBR_FIELD1 varchar(255) NULL,
  MEBR_FIELD2 varchar(255) NULL,
  MEBR_FIELD3 varchar(255) NULL,
  MEBR_FIELD4 varchar(255) NULL,
  MEBR_FIELD5 varchar(255) NULL,
  CREATED_DATE date NOT NULL,
  CREATED_BY_USER_ID int NOT NULL,
  UPDATED_DATE date NOT NULL,
  UPDATED_BY_USER_ID int NOT NULL, 
  ISDELETED int NOT NULL,
  ISDELETED_DATE date NULL,
  ISDELETED_BY_USER_ID int NULL,
  CONSTRAINT WR_CUSTOMER_MEMBER_PK PRIMARY KEY (MEBR_ID),
  CONSTRAINT WR_CUSTOMER_MEMBER_FK1 FOREIGN KEY (MEBR_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_CUSTOMER_MEMBER_FK2 FOREIGN KEY (MEBR_CUST_ID) REFERENCES WR_CUSTOMER (CUST_ID),
  CONSTRAINT WR_CUSTOMER_MEMBER_FK3 FOREIGN KEY (CREATED_BY_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_CUSTOMER_MEMBER_FK4 FOREIGN KEY (UPDATED_BY_USER_ID )REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_CUSTOMER_MEMBER_FK5 FOREIGN KEY (ISDELETED_BY_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID)
);


/*********************/
/* WR_CALENDAR Table */
/*********************/
DROP TABLE WR_CALENDAR;
CREATE TABLE WR_CALENDAR (  
  CLDR_ID int NOT NULL,  
  CLDR_DATE date NOT NULL,  
  CLDR_DAYCODE varchar(255) NOT NULL,  
  CLDR_NOTE varchar(255) NOT NULL,  
  CREATED_DATE date NOT NULL,
  CREATED_BY_USER_ID int NOT NULL,
  UPDATED_DATE date NOT NULL,
  UPDATED_BY_USER_ID int NOT NULL, 
  ISDELETED int NOT NULL,
  ISDELETED_DATE date NULL,
  ISDELETED_BY_USER_ID int NULL,
  CONSTRAINT WR_CALENDAR_PK PRIMARY KEY (CLDR_ID),
  CONSTRAINT WR_CALENDAR_FK1 FOREIGN KEY (CREATED_BY_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_CALENDAR_FK2 FOREIGN KEY (UPDATED_BY_USER_ID ) REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_CALENDAR_FK3 FOREIGN KEY (ISDELETED_BY_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID)
);


/******************************/
/* WR_CALENDAR_ACTIVITY Table */
/******************************/
DROP TABLE WR_CALENDAR_ACTIVITY;		
CREATE TABLE WR_CALENDAR_ACTIVITY (  
  CACT_ID int NOT NULL,  
  CACT_CLDR_ID int NOT NULL,
  CACT_CUST_ID int NOT NULL,  
  CACT_DETAILS_NO int NOT NULL,  
  CACT_ACTIVITY_CLASSIFICATION VARCHAR(255) NOT NULL, 
  CACT_ACTIVITY_CONTENTS VARCHAR(255) NOT NULL,
  CACT_START_TIME_ID int NOT NULL,
  CACT_END_TIME_ID int NOT NULL,
  CACT_OPERATION_FLAG int NOT NULL,
  CREATED_DATE date NOT NULL,
  CREATED_BY_USER_ID int NOT NULL,
  UPDATED_DATE date NOT NULL,
  UPDATED_BY_USER_ID int NOT NULL, 
  ISDELETED int NOT NULL,
  ISDELETED_DATE date NULL,
  ISDELETED_BY_USER_ID int NULL,
  CONSTRAINT WR_CALENDAR_ACTIVITY_PK PRIMARY KEY (CACT_ID),
  CONSTRAINT WR_CALENDAR_ACTIVITY_FK1 FOREIGN KEY (CACT_CLDR_ID) REFERENCES WR_CALENDAR (CLDR_ID),
  CONSTRAINT WR_CALENDAR_ACTIVITY_FK2 FOREIGN KEY (CACT_CUST_ID) REFERENCES WR_CUSTOMER (CUST_ID),
  CONSTRAINT WR_CALENDAR_ACTIVITY_FK3 FOREIGN KEY (CACT_START_TIME_ID) REFERENCES WR_CUSTOMER_TIME (CTIM_ID),
  CONSTRAINT WR_CALENDAR_ACTIVITY_FK4 FOREIGN KEY (CACT_END_TIME_ID) REFERENCES WR_CUSTOMER_TIME (CTIM_ID),
  CONSTRAINT WR_CALENDAR_ACTIVITY_FK5 FOREIGN KEY (CREATED_BY_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_CALENDAR_ACTIVITY_FK6 FOREIGN KEY (UPDATED_BY_USER_ID )REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_CALENDAR_ACTIVITY_FK7 FOREIGN KEY (ISDELETED_BY_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID)
);	

/************************/
/* WR_RESERVATION Table */
/************************/
DROP TABLE WR_RESERVATION;		
CREATE TABLE WR_RESERVATION (  
  RESV_ID int NOT NULL,  
  RESV_CUST_ID int NOT NULL,  
  RESV_MEBR_ID int NOT NULL,  
  RESV_CACT_ID int NOT NULL,
  RESV_UNIT_NO int NOT NULL, 
  RESV_PARTS_NO int NOT NULL,
  RESV_START_TIME_ID int NOT NULL,
  RESV_END_TIME_ID int NOT NULL,
  RESV_NOTE VARCHAR(255) NULL,
  CREATED_DATE date NOT NULL,
  CREATED_BY_USER_ID int NOT NULL,
  UPDATED_DATE date NOT NULL,
  UPDATED_BY_USER_ID int NOT NULL, 
  ISDELETED int NOT NULL,
  ISDELETED_DATE date NULL,
  ISDELETED_BY_USER_ID int NULL,
  CONSTRAINT WR_RESERVATION_PK PRIMARY KEY (RESV_ID),
  CONSTRAINT WR_RESERVATION_FK1 FOREIGN KEY (CREATED_BY_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_RESERVATION_FK2 FOREIGN KEY (UPDATED_BY_USER_ID )REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_RESERVATION_FK3 FOREIGN KEY (ISDELETED_BY_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID)
);	

/*************************/
/* WR_CHARGE_COUNT Table */
/*************************/
DROP TABLE WR_CHARGE_COUNT;		
CREATE TABLE WR_CHARGE_COUNT (  
  CUNT_ID int NOT NULL,  
  CUNT_TIME_STAMP timestamp NOT NULL,  
  CUNT_CUST_ID int NOT NULL,  
  CUNT_MEBR_ID int NOT NULL, 
  CUNT_EMAIL_ADDRESS varchar(255) NOT NULL,
  CREATED_DATE date NOT NULL,
  CREATED_BY_USER_ID int NOT NULL,
  UPDATED_DATE date NOT NULL,
  UPDATED_BY_USER_ID int NOT NULL, 
  ISDELETED int NOT NULL,
  ISDELETED_DATE date NULL,
  ISDELETED_BY_USER_ID int NULL,
  CONSTRAINT WR_CHARGE_COUNT_PK PRIMARY KEY (CUNT_ID),
  CONSTRAINT WR_CHARGE_COUNT_FK1 FOREIGN KEY (CREATED_BY_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_CHARGE_COUNT_FK2 FOREIGN KEY (UPDATED_BY_USER_ID )REFERENCES WR_SECURITY_USER (USER_ID),
  CONSTRAINT WR_CHARGE_COUNT_FK3 FOREIGN KEY (ISDELETED_BY_USER_ID) REFERENCES WR_SECURITY_USER (USER_ID)
);

/***********************/
/* WR_ACCESS_LOG Table */
/***********************/
DROP TABLE WR_ACCESS_LOG;		
CREATE TABLE WR_ACCESS_LOG (  
  ALOG_ID int NOT NULL,  
  ALOG_TIME_STAMP timestamp NOT NULL,  
  ALOG_CUST_ID int NOT NULL,  
  ALOG_MEBR_ID int NOT NULL, 
  ALOG_EMAIL_ADDRESS varchar(255) NOT NULL,
  ALOG_ACCESS_DATE date NOT NULL,
  CONSTRAINT WR_ACCESS_LOG_PK PRIMARY KEY (ALOG_ID)
);
 
/*********************/
/* WR_SEND_LOG Table */
/*********************/
DROP TABLE WR_SEND_LOG;		
CREATE TABLE WR_SEND_LOG (  
  SLOG_ID int NOT NULL,  
  SLOG_TIME_STAMP timestamp NOT NULL,   
  SLOG_MEBR_ID int NOT NULL, 
  SLOG_EMAIL_ADDRESS varchar(255) NOT NULL,
  SLOG_PURPOSE_DIVISION varchar(255) NOT NULL,
  CONSTRAINT WR_SEND_LOG_PK PRIMARY KEY (SLOG_ID)
);


     
          
