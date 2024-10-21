--------------------------------------------------------
--  File created - Monday-October-21-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type AMOUNT_VAT_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "AMOUNT_VAT_REC" AS OBJECT (
    AMOUNT      NUMBER,
    VAT   NUMBER,
    AMOUNT_WITH_VAT  NUMBER
);

/
--------------------------------------------------------
--  DDL for Type AMOUNT_VAT_TBL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "AMOUNT_VAT_TBL" AS TABLE OF AMOUNT_VAT_REC;


/
--------------------------------------------------------
--  DDL for Type BAL_BANK_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "BAL_BANK_REC" AS OBJECT (
			ACCOUNT_ID          NUMBER,
			ACCOUNT_NAME_AR    NVARCHAR2(200),
			ACCOUNT_NAME_EN    NVARCHAR2(200),
			MAIN_BANK_NAME_AR  NVARCHAR2(200),
			MAIN_BANK_NAME_EN  NVARCHAR2(200),
			BANK_NAME_AR       NVARCHAR2(200),
			BANK_NAME_EN       NVARCHAR2(200),
			DEBIT_BAL        NUMBER,
			CREDIT_BAL       NUMBER,
			BAL              NUMBER,
			BAL_NATURE       NUMBER
       );

/
--------------------------------------------------------
--  DDL for Type BAL_BANK_TBL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "BAL_BANK_TBL" AS TABLE OF BAL_BANK_REC;

/
--------------------------------------------------------
--  DDL for Type BAL_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "BAL_REC" AS OBJECT (
    ACCOUNT_ID       NUMBER,
    ACCOUNT_PARENT   NUMBER,
    ACCOUNT_NAME_AR  NVARCHAR2(200),
    ACCOUNT_NAME_EN  NVARCHAR2(200),
    DEBIT_BAL        NUMBER,
    CREDIT_BAL       NUMBER,
    BAL              NUMBER,
    BAL_NATURE       NUMBER
);

/
--------------------------------------------------------
--  DDL for Type BAL_SAFE_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "BAL_SAFE_REC" AS OBJECT (
			ACCOUNT_ID          NUMBER,
			ACCOUNT_NAME_AR    NVARCHAR2(200),
			ACCOUNT_NAME_EN    NVARCHAR2(200),
			MAIN_SAFE_NAME_AR  NVARCHAR2(200),
			MAIN_SAFE_NAME_EN  NVARCHAR2(200),
			SAFE_NAME_AR       NVARCHAR2(200),
			SAFE_NAME_EN       NVARCHAR2(200),
			DEBIT_BAL        NUMBER,
			CREDIT_BAL       NUMBER,
			BAL              NUMBER,
			BAL_NATURE       NUMBER
       );


/
--------------------------------------------------------
--  DDL for Type BAL_SAFE_TBL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "BAL_SAFE_TBL" AS TABLE OF BAL_SAFE_REC;

/
--------------------------------------------------------
--  DDL for Type BAL_TABLE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "BAL_TABLE" AS TABLE OF BAL_REC;


/
--------------------------------------------------------
--  DDL for Type ID_TBL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "ID_TBL" as TABLE of id_type;

/
--------------------------------------------------------
--  DDL for Type ID_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "ID_TYPE" as object (id varchar2(20));

/
--------------------------------------------------------
--  DDL for Type INVOICE_TOTAL_BY_CLIENT_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "INVOICE_TOTAL_BY_CLIENT_REC" IS OBJECT (
    INVOICE_NO    NUMBER,
	INVOICE_DATE  VARCHAR2(50),
	INVOICE_TYPE_AR      VARCHAR2(100) ,
	INVOICE_TYPE_EN      VARCHAR2(100) ,
    CLIENT_NAME_AR      VARCHAR2(100) ,
	CLIENT_NAME_EN      VARCHAR2(100) ,
	INVOICE_TYPE     NUMBER ,
	PURCHASE_TOTAL    NUMBER,
	SALES_TOTAL       NUMBER
	
);


/
--------------------------------------------------------
--  DDL for Type INVOICE_TOTAL_BY_CLIENT_TBL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "INVOICE_TOTAL_BY_CLIENT_TBL" AS
    TABLE OF INVOICE_TOTAL_BY_CLIENT_REC;


/
--------------------------------------------------------
--  DDL for Type INVOICE_TOTAL_BY_TYPE_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "INVOICE_TOTAL_BY_TYPE_REC" IS OBJECT (
    INVOICE_NO    NUMBER,
	INVOICE_DATE  VARCHAR2(50),
	INVOICE_TYPE_AR      VARCHAR2(100) ,
	INVOICE_TYPE_EN      VARCHAR2(100) ,
	INVOICE_TYPE     NUMBER ,
	PURCHASE_TOTAL    NUMBER,
	SALES_TOTAL       NUMBER
	
);


/
--------------------------------------------------------
--  DDL for Type INVOICE_TOTAL_BY_TYPE_TBL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "INVOICE_TOTAL_BY_TYPE_TBL" AS
    TABLE OF INVOICE_TOTAL_BY_TYPE_REC;


/
--------------------------------------------------------
--  DDL for Type INV_DTL_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "INV_DTL_REC" AS OBJECT (
    QUANTITY                NUMBER,
    BASE_PRICE                NUMBER,
    TOTAL_PRICE                NUMBER,
    DISCOUNT_VALUE             NUMBER,
    POST_DISCOUNT_TOTAL_PRICE  NUMBER,
    VAT_VALUE                  NUMBER,
    TOTAL_AMOUNT               NUMBER,
    PRE_DISCOUNT_VAT_VALUE     NUMBER
);

/
--------------------------------------------------------
--  DDL for Type INV_DTL_TBL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "INV_DTL_TBL" AS TABLE OF INV_DTL_REC;


/
--------------------------------------------------------
--  DDL for Type JOURNAL_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "JOURNAL_REC" AS OBJECT (
    DEBIT         NUMBER,
    CREDIT        NUMBER,
    ACCOUNT_ID    NUMBER,
    COST_CNTR_ID  NUMBER,
    REF_NO        NUMBER,
    NOTE          NVARCHAR2(400)
)

/
--------------------------------------------------------
--  DDL for Type JOURNAL_TABLE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "JOURNAL_TABLE" AS TABLE OF JOURNAL_REC;



/
--------------------------------------------------------
--  DDL for Type PRODUCT_MOVEMENTS_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "PRODUCT_MOVEMENTS_REC" AS OBJECT (
    PRODUCT_NO       NUMBER,
    PRODUCT_BARCODE  NUMBER,
    PRODUCT_NAME_AR  VARCHAR2(200),
    PRODUCT_NAME_EN  VARCHAR2(200),
	MAIN_PRODUCT_NAME_AR    VARCHAR2(200),
    MAIN_PRODUCT_NAME_EN    VARCHAR2(200),
    BAL              NUMBER,
    COST_AVG         NUMBER,
    COST_TOTAL       NUMBER,
	FIRST_PERIOD     NUMBER,
	PURCHASE     NUMBER,
	PUR_RETURN     NUMBER,
	SALES     NUMBER,
	SALES_RETURN     NUMBER,
	STOCKIN     NUMBER,
	STOCKOUT     NUMBER,
	ADJUSTMENT  NUMBER
);


/
--------------------------------------------------------
--  DDL for Type PRODUCT_MOVEMENTS_TBL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "PRODUCT_MOVEMENTS_TBL" AS
    TABLE OF PRODUCT_MOVEMENTS_REC;

/
--------------------------------------------------------
--  DDL for Type PURCHASES_PRODUCT_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "PURCHASES_PRODUCT_REC" IS OBJECT (
    PRODUCT_ID           NUMBER,
	PRODUCT_NO           NUMBER,
	PRODUCT_NAME_AR      VARCHAR2(100) ,
	PRODUCT_NAME_EN      VARCHAR2(100) ,
	BARCODE              VARCHAR2(50) ,
	PURCHASE_QUANTITY_TOTAL       NUMBER,
	PURCHASE_AMOUNT_TOTAL              NUMBER
	
);


/
--------------------------------------------------------
--  DDL for Type PURCHASES_PRODUCT_TBL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "PURCHASES_PRODUCT_TBL" AS
    TABLE OF PURCHASES_PRODUCT_REC;


/
--------------------------------------------------------
--  DDL for Type SALES_EMP_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "SALES_EMP_REC" IS OBJECT (
	    TRANS_TYPE_AR                      VARCHAR2(50),
        TRANS_TYPE_EN                      VARCHAR2(50),
		INVOICE_DATE                       VARCHAR2(50),
		INVOICE_NO                         NUMBER,
		USER_ID                            NUMBER,
		USER_NAME                          VARCHAR2(100),
        PRODUCT_ID                         NUMBER,
		PRODUCT_NO                         NUMBER,
        PRODUCT_NAME_AR                    VARCHAR2(100),
		PRODUCT_NAME_EN                    VARCHAR2(100),
		BARCODE                            VARCHAR2(50),
		QUANTITY                           NUMBER,
		PRICE                              NUMBER,
		TOTAL_AMOUNT                       NUMBER,
		SALES_TOTAL                         NUMBER,
		CASH_SALES_SUM                     NUMBER,
		BANK_SALES_SUM                     NUMBER,
		DEFERRED_SALES_SUM                 NUMBER,
		TAX_SALES_SUM                      NUMBER,
		SALES_RETURN_TOTAL                 NUMBER,
		CASH_SALES_RETURN_SUM              NUMBER,
		BANK_SALES_RETURN_SUM              NUMBER,
		DEFERRED_SALES_RETURN_SUM          NUMBER,
		TAX_SALES_RETURN_SUM               NUMBER
    );


/
--------------------------------------------------------
--  DDL for Type SALES_EMP_TBL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "SALES_EMP_TBL" AS
    TABLE OF SALES_EMP_REC;

/
--------------------------------------------------------
--  DDL for Type SALES_PURCHASES_CLIENT_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "SALES_PURCHASES_CLIENT_REC" IS OBJECT (
	    TRANS_TYPE_AR                      VARCHAR2(50),
        TRANS_TYPE_EN                      VARCHAR2(50),
		INVOICE_DATE                       VARCHAR2(50),
		INVOICE_NO                         NUMBER,
		CLIENT_NAME_AR                     VARCHAR2(100),
		CLIENT_NAME_EN                     VARCHAR2(100),
        PRODUCT_ID                         NUMBER,
		PRODUCT_NO                         NUMBER,
        PRODUCT_NAME_AR                    VARCHAR2(100),
		PRODUCT_NAME_EN                    VARCHAR2(100),
		BARCODE                            VARCHAR2(50),
		QUANTITY                           NUMBER,
		PRICE                              NUMBER,
		TOTAL_AMOUNT                       NUMBER,
		SALES_TOTAL                         NUMBER,
		CASH_SALES_SUM                     NUMBER,
		BANK_SALES_SUM                     NUMBER,
		DEFERRED_SALES_SUM                 NUMBER,
		TAX_SALES_SUM                      NUMBER,
		SALES_RETURN_TOTAL                 NUMBER,
		CASH_SALES_RETURN_SUM              NUMBER,
		BANK_SALES_RETURN_SUM              NUMBER,
		DEFERRED_SALES_RETURN_SUM          NUMBER,
		TAX_SALES_RETURN_SUM               NUMBER
    );


/
--------------------------------------------------------
--  DDL for Type SALES_PURCHASES_CLIENT_TBL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "SALES_PURCHASES_CLIENT_TBL" AS
    TABLE OF SALES_PURCHASES_CLIENT_REC;

/
--------------------------------------------------------
--  DDL for Type SALES_PURCHASES_DETAILS_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "SALES_PURCHASES_DETAILS_REC" AS OBJECT (
    TRANS_TYPE_AR    VARCHAR2(500),
    TRANS_TYPE_EN    VARCHAR2(500),
    PRODUCT_NAME_AR  VARCHAR2(500),
    PRODUCT_NAME_EN  VARCHAR2(500),
    STORE_NAME_AR    VARCHAR2(500),
    STORE_NAME_EN    VARCHAR2(500),
    PRO_NAME_AR      VARCHAR2(500),
    PRO_NAME_EN      VARCHAR2(500),
    INVOICE_NO       NUMBER,
    INVOICE_DATE     VARCHAR2(50),
    QUANTITY         NUMBER,
    PRICE            NUMBER,
    VAT_VALUE        NUMBER,
    TOTAL_AMOUNT     NUMBER
);

/
--------------------------------------------------------
--  DDL for Type SALES_PURCHASES_DETAILS_TBL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "SALES_PURCHASES_DETAILS_TBL" AS TABLE OF SALES_PURCHASES_DETAILS_REC;


/
--------------------------------------------------------
--  DDL for Type SALES_PURCHASES_PRODUCT_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "SALES_PURCHASES_PRODUCT_REC" IS OBJECT (
    PRODUCT_ID           NUMBER,
	PRODUCT_NO           NUMBER,
	PRODUCT_NAME_AR      VARCHAR2(100) ,
	PRODUCT_NAME_EN      VARCHAR2(100) ,
	BARCODE              VARCHAR2(50) ,
	PURCHASE_QUANTITY_TOTAL       NUMBER,
	PURCHASE_AMOUNT_TOTAL              NUMBER,
	SALES_QUANTITY_TOTAL              NUMBER,
	SALES_AMOUNT_TOTAL              NUMBER
	
);


/
--------------------------------------------------------
--  DDL for Type SALES_PURCHASES_PRODUCT_TBL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "SALES_PURCHASES_PRODUCT_TBL" AS
    TABLE OF SALES_PURCHASES_PRODUCT_REC;


/
--------------------------------------------------------
--  DDL for Type SALES_PURCHASE_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "SALES_PURCHASE_REC" IS OBJECT (
    C_NAME_AR            VARCHAR2(500),
    C_NAME_EN            VARCHAR2(500),
    C_TAX_NO             NUMBER,
    TRANS_TYPE_AR        VARCHAR2(50),
    TRANS_TYPE_EN        VARCHAR2(50),
    INVOICE_DATE         VARCHAR2(50),
    INVOICE_NO           NUMBER,
    PROVIDER_INV_ID      NUMBER,
    PRE_DISCOUNT_AMOUNT  NUMBER,
    TOTAL_DISCOUNT       NUMBER,
    PRE_TAX_AMOUNT       NUMBER,
    VAT_VALUE            NUMBER,
    TOTAL_AMOUNT         NUMBER
);

/
--------------------------------------------------------
--  DDL for Type SALES_PURCHASE_TBL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "SALES_PURCHASE_TBL" IS table of SALES_PURCHASE_REC;


/
--------------------------------------------------------
--  DDL for Type SALES_PUR_RETURN_INV_SUMMARY_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "SALES_PUR_RETURN_INV_SUMMARY_REC" IS OBJECT (
    INVOICE_NO    NUMBER,
	INVOICE_DATE  VARCHAR2(50),
    PRE_TAX_TOTAL_AMOUNT     NUMBER,
    TOTAL_DISCOUNT      NUMBER,
    POST_DISCOUNT_TOTAL_AMOUNT      NUMBER,
    TOTAL_VAT  NUMBER,
    INVOICE_TOTAL_AMOUNT   NUMBER,
    PROVIDER_NAME_AR          VARCHAR2(100) ,
	PROVIDER_NAME_EN          VARCHAR2(100) ,
	PROVIDER_TAX_NO           VARCHAR2(50) ,
	INVOICE_TYPE_AR      VARCHAR2(100) ,
	INVOICE_TYPE_EN      VARCHAR2(100) ,
	INVOICE_TYPE     NUMBER ,
    PROVIDER_ID  NUMBER,
	PURCHASE_INV_NO     NUMBER,
	PURCHASE_INV_DATE   VARCHAR2(50),
    BRANCH_NAME_AR    VARCHAR2(100) ,
    BRANCH_NAME_EN    VARCHAR2(100) ,
    BRANCH_ID         NUMBER NULL,
	PROVIDER_MAIN_AR  VARCHAR2(100) ,
	PROVIDER_MAIN_EN  VARCHAR2(100) 
	
);


/
--------------------------------------------------------
--  DDL for Type SALES_PUR_RETURN_INV_SUMMARY_TBL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "SALES_PUR_RETURN_INV_SUMMARY_TBL" AS
    TABLE OF SALES_PUR_RETURN_INV_SUMMARY_REC;


/
--------------------------------------------------------
--  DDL for Type SALES_SUMMARY_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "SALES_SUMMARY_REC" IS OBJECT (
    TRANS_TYPE_AR     VARCHAR2(50),
    TRANS_TYPE_EN     VARCHAR2(50),
    CASH_INV_SUM      NUMBER,
    BANK_INV_SUM      NUMBER,
    DEFERRED_INV_SUM  NUMBER,
    PRE_TAX_INV_SUM   NUMBER,
    VAT_SUM           NUMBER,
    POST_TAX_INV_SUM  NUMBER,
    CNT               NUMBER,
    BRANCH_NAME_AR    VARCHAR2(50) NULL,
    BRANCH_NAME_EN    VARCHAR2(50) NULL,
    BRANCH_ID         NUMBER NULL,
    USER_ID         NUMBER NULL,
    USER_NAME    VARCHAR2(50) NULL
);

/
--------------------------------------------------------
--  DDL for Type SALES_SUMMARY_TBL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "SALES_SUMMARY_TBL" AS
    TABLE OF SALES_SUMMARY_REC;


/
--------------------------------------------------------
--  DDL for Type SALES_WITH_NET_PROFITS_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "SALES_WITH_NET_PROFITS_REC" AS OBJECT (
    PRODUCT_NO       NUMBER,
    PRODUCT_NAME_AR  VARCHAR2(500),
    PRODUCT_NAME_EN  VARCHAR2(500),
    QUANTITY         NUMBER,
    DISCOUNT_VALUE   NUMBER,
    VAT_VALUE        NUMBER,
    TOTAL_AMOUNT     NUMBER,
    PRODUCT_COST     NUMBER,
    NET_PROFIT       NUMBER
);

/
--------------------------------------------------------
--  DDL for Type SALES_WITH_NET_PROFITS_TBL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "SALES_WITH_NET_PROFITS_TBL" AS
    TABLE OF SALES_WITH_NET_PROFITS_REC;


/
--------------------------------------------------------
--  DDL for Type STORES_STATISTICS_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "STORES_STATISTICS_REC" AS OBJECT (
    PRODUCT_NO       NUMBER,
    PRODUCT_BARCODE  NUMBER,
    PRODUCT_NAME_AR  VARCHAR2(200),
    PRODUCT_NAME_EN  VARCHAR2(200),
	STORE_NAME_AR  VARCHAR2(200),
    STORE_NAME_EN  VARCHAR2(200),
    BAL              NUMBER,
    COST_AVG         NUMBER,
    COST_TOTAL       NUMBER
);

/
--------------------------------------------------------
--  DDL for Type STORES_STATISTICS_TBL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "STORES_STATISTICS_TBL" as table of STORES_STATISTICS_REC;

/
--------------------------------------------------------
--  DDL for Type TAX_RETURN_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "TAX_RETURN_REC" AS OBJECT (
    COST_CTR_NAME_AR                     VARCHAR2(200),
    COST_CTR_NAME_EN                     VARCHAR2(200),
    BRANCH_NAME_AR                       VARCHAR2(200),
    BRANCH_NAME_EN                       VARCHAR2(200),
    AMOUNT_OF_SALES_UNDER_VAT            NUMBER,
    VAT_OF_SALES_UNDER_VAT               NUMBER,
    AMOUNT_OF_SALES_WITH_ZERO_VAT        NUMBER,
    AMOUNT_OF_SALES_WITH_VAT_EXEMPT      NUMBER,
    AMOUNT_OF_PURCHASES_UNDER_VAT        NUMBER,
    VAT_OF_PURCHASES_UNDER_VAT           NUMBER,
    AMOUNT_OF_PURCHASES_WITH_ZERO_VAT    NUMBER,
    AMOUNT_OF_PURCHASES_WITH_VAT_EXEMPT  NUMBER,
    OPERATIONAL_EXPENSES                 NUMBER,
    OPERATIONAL_EXPENSES_VAT             NUMBER
);

/
--------------------------------------------------------
--  DDL for Type TAX_RETURN_TBL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "TAX_RETURN_TBL" AS TABLE OF TAX_RETURN_REC;



/
--------------------------------------------------------
--  DDL for Type TB_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "TB_REC" AS OBJECT (
ACCOUNT_ID NUMBER,
ACCOUNT_PARENT NUMBER,
    ACCOUNT_NAME_AR    NVARCHAR2(200),
    ACCOUNT_NAME_EN    NVARCHAR2(200),
 PRE_DEBIT NUMBER,
 PRE_CREDIT NUMBER,
 IN_DEBIT NUMBER,
 IN_CREDIT NUMBER,
 POST_DEBIT NUMBER,
 POST_CREDIT  NUMBER

);

/
--------------------------------------------------------
--  DDL for Type TB_TABLE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "TB_TABLE" AS TABLE OF TB_REC;


/
--------------------------------------------------------
--  DDL for Sequence ACC_JOURNAL_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ACC_JOURNAL_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ACC_JOURNAL_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "ACC_JOURNAL_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence DEPT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "DEPT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 50 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence EMP_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "EMP_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 8000 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SETUP_BRANCH_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SETUP_BRANCH_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SETUP_BRANCH_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "SETUP_BRANCH_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table ACC_ACCOUNTS
--------------------------------------------------------

  CREATE TABLE "ACC_ACCOUNTS" 
   (	"ACCOUNT_ID" NUMBER, 
	"ACCOUNT_NAME_AR" VARCHAR2(200 BYTE), 
	"ACCOUNT_NATURE" NUMBER, 
	"ACCOUNT_TYPE" NUMBER, 
	"ACCOUNT_PARENT" NUMBER, 
	"SUB_ACCOUNT" NUMBER DEFAULT 0, 
	"ACCOUNT_LEVEL" NUMBER, 
	"ACC_DATE" DATE, 
	"COMPANY_ID" NUMBER, 
	"ACCOUNT_NAME_EN" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table ACC_CASH_ACCOUNTS
--------------------------------------------------------

  CREATE TABLE "ACC_CASH_ACCOUNTS" 
   (	"ACCOUNT_ID" NUMBER, 
	"RESPONSIBLE_USER_ID" NUMBER, 
	"COMPANY_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table ACC_COST_CENTER
--------------------------------------------------------

  CREATE TABLE "ACC_COST_CENTER" 
   (	"COST_CTR_ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"COST_CTR_NAME_AR" VARCHAR2(200 BYTE), 
	"COST_CTR_PARENT" NUMBER, 
	"COST_CTR_LEVEL" NUMBER, 
	"IS_SUB_COST_CTR" NUMBER, 
	"CREATED_AT" DATE, 
	"COST_CTR_STATUS" NUMBER DEFAULT 1, 
	"COMPANY_ID" NUMBER, 
	"COST_CTR_NAME_EN" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table ACC_JOURNAL
--------------------------------------------------------

  CREATE TABLE "ACC_JOURNAL" 
   (	"ACC_JOURNAL_ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"JOURNAL_DATE" DATE, 
	"POSTED" NUMBER DEFAULT 0, 
	"NOTE" VARCHAR2(500 BYTE), 
	"IS_CANCELED" NUMBER, 
	"COMPANY_ID" NUMBER, 
	"JOURNAL_TYPE" NUMBER DEFAULT 1
   ) ;
--------------------------------------------------------
--  DDL for Table ACC_JOURNAL_DTL
--------------------------------------------------------

  CREATE TABLE "ACC_JOURNAL_DTL" 
   (	"JOURNAL_DTL_ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"JOURNAL_ID" NUMBER, 
	"DEBIT" NUMBER, 
	"CREDIT" NUMBER, 
	"ACCOUNT_ID" NUMBER, 
	"NOTE" VARCHAR2(500 BYTE), 
	"COST_CNTR_ID" NUMBER, 
	"REF_NO" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table ACC_LEDGER
--------------------------------------------------------

  CREATE TABLE "ACC_LEDGER" 
   (	"LEDGER_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"JOURNAL_ID" NUMBER, 
	"JOURNAL_TYPE" NUMBER, 
	"ACCOUNT_ID" NUMBER, 
	"CREDIT" NUMBER, 
	"DEBIT" NUMBER, 
	"NOTE" VARCHAR2(500 BYTE), 
	"JOURNAL_DATE" DATE, 
	"COMPANY_ID" NUMBER, 
	"COST_CNTR_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table ACC_SETUP
--------------------------------------------------------

  CREATE TABLE "ACC_SETUP" 
   (	"ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"COMPANY_ID" NUMBER, 
	"ACC_CLIENT" NUMBER, 
	"ACC_PROVIDER" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table ACC_VOUCHER
--------------------------------------------------------

  CREATE TABLE "ACC_VOUCHER" 
   (	"ACC_VOUCHER_ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"AMOUNT" NUMBER, 
	"ACCOUNT_ID" NUMBER, 
	"REF_ID" NUMBER, 
	"PAYMENT_METHOD" NUMBER, 
	"PAID_TO" NUMBER, 
	"VOUCHER_DATE" DATE, 
	"POSTED" NUMBER DEFAULT 0, 
	"VOUCHER_TYPE" NUMBER DEFAULT 1, 
	"NOTE" VARCHAR2(500 BYTE), 
	"CHECK_NO" NUMBER, 
	"CHECK_DATE" DATE, 
	"COST_CNTR_ID" NUMBER, 
	"COMPANY_ID" NUMBER, 
	"TOTAL_VAT" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table ACC_VOUCHER_DTL
--------------------------------------------------------

  CREATE TABLE "ACC_VOUCHER_DTL" 
   (	"ACC_VOUCHER_DTL_ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"ACC_VOUCHER_ID" NUMBER, 
	"ACCOUNT_ID" NUMBER, 
	"REF_ID" NUMBER, 
	"AMOUNT" NUMBER, 
	"NOTE" VARCHAR2(500 BYTE), 
	"COST_CNTR_ID" NUMBER, 
	"TAX_RATE" NUMBER, 
	"TAX_AMOUNT" NUMBER, 
	"TOTAL_AMOUNT" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table ACC_YEAR
--------------------------------------------------------

  CREATE TABLE "ACC_YEAR" 
   (	"YEAR_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"YEAR_DESC_AR" VARCHAR2(200 BYTE), 
	"YEAR_DESC_EN" VARCHAR2(200 BYTE), 
	"YEAR_START" DATE, 
	"YEAR_END" DATE, 
	"YEAR_STATUS" NUMBER, 
	"COMPANY_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table ACL_APP_INTERFACE
--------------------------------------------------------

  CREATE TABLE "ACL_APP_INTERFACE" 
   (	"PRIV_IF_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"INTERFACE_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"ROLE_ID" NUMBER, 
	"STATUS" NUMBER, 
	"CREATED_BY" NUMBER, 
	"CREATED_AT" TIMESTAMP (6), 
	"MODIFIED_BY" NUMBER, 
	"MODIFIED_AT" DATE, 
	"COMPANY_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table ACL_APP_ROLE
--------------------------------------------------------

  CREATE TABLE "ACL_APP_ROLE" 
   (	"ACL_APP_ROLE_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"USER_ID" NUMBER, 
	"ROLE_ID" NUMBER, 
	"CREATED_BY" NUMBER, 
	"CREATED_AT" TIMESTAMP (6), 
	"MODIFIED_BY" NUMBER, 
	"MODIFIED_AT" DATE, 
	"COMPANY_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table ACL_INTERFACE_OPR
--------------------------------------------------------

  CREATE TABLE "ACL_INTERFACE_OPR" 
   (	"ACL_INTERFACE_OPR_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"OPERATION_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"ROLE_ID" NUMBER, 
	"STATUS" NUMBER, 
	"CREATED_BY" NUMBER, 
	"CREATED_AT" TIMESTAMP (6), 
	"MODIFIED_BY" NUMBER, 
	"MODIFIED_AT" DATE, 
	"INTERFACE_ID" NUMBER, 
	"COMPANY_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table ACL_SAFE
--------------------------------------------------------

  CREATE TABLE "ACL_SAFE" 
   (	"ACL_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"SAFE_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"GRANTED_BY" NUMBER, 
	"GRANTED_AT" TIMESTAMP (6), 
	"ACL_STATUS" NUMBER, 
	"COMPANY_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table ACL_STORE
--------------------------------------------------------

  CREATE TABLE "ACL_STORE" 
   (	"ACL_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"STORE_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"GRANTED_BY" NUMBER, 
	"GRANTED_AT" TIMESTAMP (6), 
	"ACL_STATUS" NUMBER, 
	"COMPANY_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table ADMIN_APP_INTERFACE
--------------------------------------------------------

  CREATE TABLE "ADMIN_APP_INTERFACE" 
   (	"INTERFACE_ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"NAME_AR" VARCHAR2(100 BYTE), 
	"NAME_EN" VARCHAR2(100 BYTE), 
	"TYPE" NUMBER, 
	"ORDERE" NUMBER, 
	"PARENT_ID" NUMBER, 
	"ICON_IMG" VARCHAR2(50 BYTE), 
	"STATUS" NUMBER, 
	"SHOW_TITLE" NUMBER, 
	"DIC_TITLE" VARCHAR2(50 BYTE), 
	"PAGE_NO" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table ADMIN_APP_INTERFACEE
--------------------------------------------------------

  CREATE TABLE "ADMIN_APP_INTERFACEE" 
   (	"INTERFACE_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"INTERFACE_NAME" VARCHAR2(50 BYTE), 
	"PAGE_ID" VARCHAR2(50 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table ADMIN_APP_OPERATION
--------------------------------------------------------

  CREATE TABLE "ADMIN_APP_OPERATION" 
   (	"OPERATION_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"OPERATION_NAME" VARCHAR2(50 BYTE), 
	"CREATED_BY" NUMBER, 
	"CREATED_AT" TIMESTAMP (6), 
	"MODIFIED_BY" NUMBER, 
	"MODIFIED_AT" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table ADMIN_COMPANY
--------------------------------------------------------

  CREATE TABLE "ADMIN_COMPANY" 
   (	"COMPANY_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"NAME_AR" VARCHAR2(500 BYTE), 
	"NAME_EN" VARCHAR2(500 BYTE), 
	"MOBILE_NO" VARCHAR2(20 BYTE), 
	"TEL_NO" VARCHAR2(20 BYTE), 
	"FAX" VARCHAR2(20 BYTE), 
	"EMAIL" VARCHAR2(20 BYTE), 
	"TAX_NO" VARCHAR2(20 BYTE), 
	"COUNTRY_ID" NUMBER, 
	"CITY_ID" NUMBER, 
	"REGION_ID" NUMBER, 
	"BUILDING_NO" VARCHAR2(20 BYTE), 
	"SREET" VARCHAR2(200 BYTE), 
	"POST_CODE" VARCHAR2(20 BYTE), 
	"NOTE" VARCHAR2(20 BYTE), 
	"STATUS" NUMBER, 
	"COMERCIAL_REC_NO" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table ADMIN_ERROR_MSG
--------------------------------------------------------

  CREATE TABLE "ADMIN_ERROR_MSG" 
   (	"MSG_ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"MSG_TEXT_AR" VARCHAR2(2000 BYTE), 
	"MSG_TEXT_EN" VARCHAR2(2000 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table ADMIN_INTERFACE_OPR
--------------------------------------------------------

  CREATE TABLE "ADMIN_INTERFACE_OPR" 
   (	"OPERATION_IF_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"INTERFACE_ID" NUMBER, 
	"OPERATION_ID" NUMBER, 
	"STATUS" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table ADMIN_LIST
--------------------------------------------------------

  CREATE TABLE "ADMIN_LIST" 
   (	"LIST_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"LIST_NAME" VARCHAR2(200 CHAR), 
	"LIST_DESC" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table ADMIN_LIST_ITEM
--------------------------------------------------------

  CREATE TABLE "ADMIN_LIST_ITEM" 
   (	"ITEM_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"LIST_ID" NUMBER, 
	"ITEM_NO" NUMBER, 
	"ITEM_DISPLAY_AR" VARCHAR2(200 CHAR), 
	"ITEM_DISPLAY_EN" VARCHAR2(200 CHAR), 
	"ITEM_NOTE_AR" VARCHAR2(2000 BYTE), 
	"ITEM_NOTE_EN" VARCHAR2(2000 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table ADMIN_PWD_HMAC_KEY
--------------------------------------------------------

  CREATE TABLE "ADMIN_PWD_HMAC_KEY" 
   (	"H_KEY" RAW(128), 
	"COMPANY_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table ADMIN_USER_SESSION
--------------------------------------------------------

  CREATE TABLE "ADMIN_USER_SESSION" 
   (	"SESSION_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"USER_ID" NUMBER, 
	"COMPANY_ID" NUMBER, 
	"CREATED_AT" TIMESTAMP (6), 
	"EXPIRES" NUMBER, 
	"TOKEN" VARCHAR2(2000 BYTE), 
	"USER_PREFERED_LANG" VARCHAR2(200 BYTE), 
	"USER_PREFERED_LANG_ID" NUMBER, 
	"USERNAME" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table API_LOG
--------------------------------------------------------

  CREATE TABLE "API_LOG" 
   (	"LOG_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"API" VARCHAR2(200 BYTE), 
	"REQ_BODY" CLOB, 
	"RES_BODY" CLOB
   ) ;
--------------------------------------------------------
--  DDL for Table SALES_CLIENT
--------------------------------------------------------

  CREATE TABLE "SALES_CLIENT" 
   (	"CLIENT_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"NAME_AR" VARCHAR2(500 BYTE), 
	"NAME_EN" VARCHAR2(500 BYTE), 
	"MOBILE_NO" VARCHAR2(20 BYTE), 
	"COMPANY_ID" NUMBER, 
	"TEL_NO" VARCHAR2(20 BYTE), 
	"FAX" VARCHAR2(20 BYTE), 
	"EMAIL" VARCHAR2(20 BYTE), 
	"TAX_NO" VARCHAR2(20 BYTE), 
	"COUNTRY_ID" NUMBER, 
	"CITY_ID" NUMBER, 
	"REGION_ID" NUMBER, 
	"BUILDING_NO" VARCHAR2(20 BYTE), 
	"SREET" VARCHAR2(20 BYTE), 
	"POST_CODE" VARCHAR2(20 BYTE), 
	"NOTE" VARCHAR2(20 BYTE), 
	"STATUS" NUMBER, 
	"ACCOUNT_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SALES_INV
--------------------------------------------------------

  CREATE TABLE "SALES_INV" 
   (	"INVOICE_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"INVOICE_DATE" TIMESTAMP (6), 
	"STORE_DATE" TIMESTAMP (6), 
	"STORE_ID" NUMBER, 
	"INVOICE_TYPE" NUMBER, 
	"PAYMENT_TYPE" NUMBER, 
	"SAFE_ID" NUMBER, 
	"COST_CTR_ID" NUMBER, 
	"CLIENT_ID" NUMBER, 
	"PRE_TAX_TOTAL_AMOUNT" NUMBER, 
	"CLIENT_DISCOUNT" NUMBER, 
	"TOTAL_DISCOUNT" NUMBER, 
	"POST_DISCOUNT_TOTAL_AMOUNT" NUMBER, 
	"TOTAL_VAT" NUMBER, 
	"TOTAL_QUANTITY" NUMBER, 
	"INVOICE_TOTAL_AMOUNT" NUMBER, 
	"PAID_CASH_AMOUNT" NUMBER, 
	"PAID_BANK_AMOUNT" NUMBER, 
	"NOTES" VARCHAR2(400 BYTE), 
	"COMPANY_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"BANK_ACC_ID" NUMBER, 
	"PAID_AMOUNT" NUMBER, 
	"DEFERRED_AMOUNT" NUMBER, 
	"ACC_JOURNAL_ID" NUMBER, 
	"INVOICE_NO" NUMBER, 
	"BRANCH_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SALES_INV_DTL
--------------------------------------------------------

  CREATE TABLE "SALES_INV_DTL" 
   (	"INVOICE_DTL_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"INVOICE_ID" NUMBER, 
	"PRODUCT_ID" NUMBER, 
	"PRODUCT_UNIT_ID" NUMBER, 
	"QUANTITY" NUMBER, 
	"PRICE" NUMBER, 
	"TOTAL_PRICE" NUMBER, 
	"DISCOUNT_PERCENTAGE" NUMBER, 
	"DISCOUNT_VALUE" NUMBER, 
	"POST_DISCOUNT_TOTAL_PRICE" NUMBER, 
	"VAT_PERCENTAGE" NUMBER, 
	"VAT_VALUE" NUMBER, 
	"TOTAL_AMOUNT" NUMBER, 
	"PRE_DISCOUNT_VAT_VALUE" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SALES_PRODUCT
--------------------------------------------------------

  CREATE TABLE "SALES_PRODUCT" 
   (	"PRODUCT_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"PRODUCT_NAME_AR" VARCHAR2(200 BYTE), 
	"PRODUCT_NAME_EN" VARCHAR2(200 BYTE), 
	"BARCODE" VARCHAR2(200 BYTE), 
	"TYPE_ID" NUMBER, 
	"TAX_GROUP_ID" NUMBER, 
	"TAX_VALUE" NUMBER, 
	"DEFAULT_UNIT_ID" NUMBER, 
	"PRODUCT_GROUP_ID" NUMBER, 
	"PURCHASE_PRICE" NUMBER, 
	"SELL_PRICE" NUMBER, 
	"PROVIDER_ID" NUMBER, 
	"PRODUCT_STATUS" NUMBER, 
	"COMPANY_ID" NUMBER, 
	"PRODUCT_NO" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SALES_PRODUCT_BARCODES
--------------------------------------------------------

  CREATE TABLE "SALES_PRODUCT_BARCODES" 
   (	"PRODUCT_BARCODE_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"PRODUCT_ID" NUMBER, 
	"BARCODE" VARCHAR2(200 BYTE), 
	"COMPANY_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SALES_PRODUCT_FILES
--------------------------------------------------------

  CREATE TABLE "SALES_PRODUCT_FILES" 
   (	"FILE_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"FILE_PATH" VARCHAR2(50 BYTE), 
	"FILE_MIME_TYPE" VARCHAR2(50 BYTE), 
	"FILE_SIZE" VARCHAR2(50 BYTE), 
	"IS_THUMBNAIL" NUMBER, 
	"PRODUCT_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SALES_PRODUCT_UNIT
--------------------------------------------------------

  CREATE TABLE "SALES_PRODUCT_UNIT" 
   (	"PRODUCT_UNIT_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"PRODUCT_ID" NUMBER, 
	"UNIT_ID" NUMBER, 
	"UNIT_VALUE" NUMBER, 
	"PURCHASE_PRICE" NUMBER, 
	"SELL_PRICE" NUMBER, 
	"BARCODE" VARCHAR2(200 BYTE), 
	"COMPANY_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SALES_PROVIDER
--------------------------------------------------------

  CREATE TABLE "SALES_PROVIDER" 
   (	"PROVIDER_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"NAME_AR" VARCHAR2(500 BYTE), 
	"NAME_EN" VARCHAR2(500 BYTE), 
	"MOBILE_NO" VARCHAR2(20 BYTE), 
	"COMPANY_ID" NUMBER, 
	"TEL_NO" VARCHAR2(20 BYTE), 
	"FAX" VARCHAR2(20 BYTE), 
	"EMAIL" VARCHAR2(20 BYTE), 
	"TAX_NO" VARCHAR2(20 BYTE), 
	"COUNTRY_ID" NUMBER, 
	"CITY_ID" NUMBER, 
	"REGION_ID" NUMBER, 
	"BUILDING_NO" VARCHAR2(20 BYTE), 
	"SREET" VARCHAR2(20 BYTE), 
	"POST_CODE" VARCHAR2(20 BYTE), 
	"NOTE" VARCHAR2(20 BYTE), 
	"STATUS" NUMBER, 
	"ACCOUNT_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SALES_PURCHASE_INV
--------------------------------------------------------

  CREATE TABLE "SALES_PURCHASE_INV" 
   (	"INVOICE_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"INVOICE_DATE" TIMESTAMP (6), 
	"STORE_DATE" TIMESTAMP (6), 
	"PROVIDER_INV_DATE" TIMESTAMP (6), 
	"STORE_ID" NUMBER, 
	"INVOICE_TYPE" NUMBER, 
	"PAYMENT_TYPE" NUMBER, 
	"SAFE_ID" NUMBER, 
	"COST_CTR_ID" NUMBER, 
	"PROVIDER_ID" NUMBER, 
	"PROVIDER_INV_ID" VARCHAR2(50 BYTE), 
	"PRE_TAX_TOTAL_AMOUNT" NUMBER, 
	"CLIENT_DISCOUNT" NUMBER, 
	"TOTAL_DISCOUNT" NUMBER, 
	"POST_DISCOUNT_TOTAL_AMOUNT" NUMBER, 
	"TOTAL_VAT" NUMBER, 
	"TOTAL_QUANTITY" NUMBER, 
	"INVOICE_TOTAL_AMOUNT" NUMBER, 
	"PAID_CASH_AMOUNT" NUMBER, 
	"PAID_BANK_AMOUNT" NUMBER, 
	"NOTES" VARCHAR2(400 BYTE), 
	"COMPANY_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"BANK_ACC_ID" NUMBER, 
	"PAID_AMOUNT" NUMBER, 
	"DEFERRED_AMOUNT" NUMBER, 
	"ACC_JOURNAL_ID" NUMBER, 
	"INVOICE_NO" NUMBER, 
	"BRANCH_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SALES_PURCHASE_INV_DTL
--------------------------------------------------------

  CREATE TABLE "SALES_PURCHASE_INV_DTL" 
   (	"DTL_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"INVOICE_ID" NUMBER, 
	"PRODUCT_ID" NUMBER, 
	"PRODUCT_UNIT_ID" NUMBER, 
	"QUANTITY" NUMBER, 
	"PRICE" NUMBER, 
	"TOTAL_PRICE" NUMBER, 
	"DISCOUNT_PERCENTAGE" NUMBER, 
	"DISCOUNT_VALUE" NUMBER, 
	"POST_DISCOUNT_TOTAL_PRICE" NUMBER, 
	"VAT_PERCENTAGE" NUMBER, 
	"VAT_VALUE" NUMBER, 
	"TOTAL_AMOUNT" NUMBER, 
	"PRE_DISCOUNT_VAT_VALUE" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SALES_PURCHASE_ORDER
--------------------------------------------------------

  CREATE TABLE "SALES_PURCHASE_ORDER" 
   (	"ORDER_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"ORDER_DATE" TIMESTAMP (6), 
	"STORE_DATE" TIMESTAMP (6), 
	"PROVIDER_INV_DATE" TIMESTAMP (6), 
	"STORE_ID" NUMBER, 
	"INVOICE_TYPE" NUMBER, 
	"PAYMENT_TYPE" NUMBER, 
	"SAFE_ID" NUMBER, 
	"COST_CTR_ID" NUMBER, 
	"PROVIDER_ID" NUMBER, 
	"PROVIDER_INV_ID" VARCHAR2(50 BYTE), 
	"PRE_TAX_TOTAL_AMOUNT" NUMBER, 
	"CLIENT_DISCOUNT" NUMBER, 
	"TOTAL_DISCOUNT" NUMBER, 
	"POST_DISCOUNT_TOTAL_AMOUNT" NUMBER, 
	"TOTAL_VAT" NUMBER, 
	"TOTAL_QUANTITY" NUMBER, 
	"INVOICE_TOTAL_AMOUNT" NUMBER, 
	"PAID_CASH_AMOUNT" NUMBER, 
	"PAID_BANK_AMOUNT" NUMBER, 
	"NOTES" VARCHAR2(400 BYTE), 
	"COMPANY_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"BANK_ACC_ID" NUMBER, 
	"PAID_AMOUNT" NUMBER, 
	"DEFERRED_AMOUNT" NUMBER, 
	"ACC_JOURNAL_ID" NUMBER, 
	"ORDER_NO" NUMBER, 
	"BRANCH_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SALES_PURCHASE_ORDER_DTL
--------------------------------------------------------

  CREATE TABLE "SALES_PURCHASE_ORDER_DTL" 
   (	"DTL_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"ORDER_ID" NUMBER, 
	"PRODUCT_ID" NUMBER, 
	"PRODUCT_UNIT_ID" NUMBER, 
	"QUANTITY" NUMBER, 
	"PRICE" NUMBER, 
	"TOTAL_PRICE" NUMBER, 
	"DISCOUNT_PERCENTAGE" NUMBER, 
	"DISCOUNT_VALUE" NUMBER, 
	"POST_DISCOUNT_TOTAL_PRICE" NUMBER, 
	"VAT_PERCENTAGE" NUMBER, 
	"VAT_VALUE" NUMBER, 
	"TOTAL_AMOUNT" NUMBER, 
	"PRE_DISCOUNT_VAT_VALUE" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SALES_PUR_RETURN_INV
--------------------------------------------------------

  CREATE TABLE "SALES_PUR_RETURN_INV" 
   (	"INVOICE_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"PURCHASE_INV_ID" NUMBER, 
	"INVOICE_DATE" TIMESTAMP (6), 
	"STORE_DATE" TIMESTAMP (6), 
	"PROVIDER_INV_DATE" TIMESTAMP (6), 
	"STORE_ID" NUMBER, 
	"INVOICE_TYPE" NUMBER, 
	"PAYMENT_TYPE" NUMBER, 
	"SAFE_ID" NUMBER, 
	"COST_CTR_ID" NUMBER, 
	"PROVIDER_ID" NUMBER, 
	"PROVIDER_INV_ID" VARCHAR2(50 BYTE), 
	"PRE_TAX_TOTAL_AMOUNT" NUMBER, 
	"CLIENT_DISCOUNT" NUMBER, 
	"TOTAL_DISCOUNT" NUMBER, 
	"POST_DISCOUNT_TOTAL_AMOUNT" NUMBER, 
	"TOTAL_VAT" NUMBER, 
	"TOTAL_QUANTITY" NUMBER, 
	"INVOICE_TOTAL_AMOUNT" NUMBER, 
	"PAID_CASH_AMOUNT" NUMBER, 
	"PAID_BANK_AMOUNT" NUMBER, 
	"NOTES" VARCHAR2(400 BYTE), 
	"COMPANY_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"BANK_ACC_ID" NUMBER, 
	"PAID_AMOUNT" NUMBER, 
	"DEFERRED_AMOUNT" NUMBER, 
	"ACC_JOURNAL_ID" NUMBER, 
	"INVOICE_NO" NUMBER, 
	"BRANCH_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SALES_PUR_RETURN_INV_DTL
--------------------------------------------------------

  CREATE TABLE "SALES_PUR_RETURN_INV_DTL" 
   (	"DTL_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"INVOICE_ID" NUMBER, 
	"PRODUCT_ID" NUMBER, 
	"PRODUCT_UNIT_ID" NUMBER, 
	"QUANTITY" NUMBER, 
	"PRICE" NUMBER, 
	"TOTAL_PRICE" NUMBER, 
	"DISCOUNT_PERCENTAGE" NUMBER, 
	"DISCOUNT_VALUE" NUMBER, 
	"POST_DISCOUNT_TOTAL_PRICE" NUMBER, 
	"VAT_PERCENTAGE" NUMBER, 
	"VAT_VALUE" NUMBER, 
	"TOTAL_AMOUNT" NUMBER, 
	"PRE_DISCOUNT_VAT_VALUE" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SALES_RENT_INV
--------------------------------------------------------

  CREATE TABLE "SALES_RENT_INV" 
   (	"INVOICE_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"INVOICE_DATE" TIMESTAMP (6), 
	"STORE_DATE" TIMESTAMP (6), 
	"STORE_ID" NUMBER, 
	"INVOICE_TYPE" NUMBER, 
	"PAYMENT_TYPE" NUMBER, 
	"SAFE_ID" NUMBER, 
	"COST_CTR_ID" NUMBER, 
	"CLIENT_ID" NUMBER, 
	"PRE_TAX_TOTAL_AMOUNT" NUMBER, 
	"CLIENT_DISCOUNT" NUMBER, 
	"TOTAL_DISCOUNT" NUMBER, 
	"POST_DISCOUNT_TOTAL_AMOUNT" NUMBER, 
	"TOTAL_VAT" NUMBER, 
	"TOTAL_QUANTITY" NUMBER, 
	"INVOICE_TOTAL_AMOUNT" NUMBER, 
	"PAID_CASH_AMOUNT" NUMBER, 
	"PAID_BANK_AMOUNT" NUMBER, 
	"NOTES" VARCHAR2(400 BYTE), 
	"COMPANY_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"BANK_ACC_ID" NUMBER, 
	"PAID_AMOUNT" NUMBER, 
	"DEFERRED_AMOUNT" NUMBER, 
	"ACC_JOURNAL_ID" NUMBER, 
	"DELIVERY_DATE" TIMESTAMP (6), 
	"RETURN_DATE" TIMESTAMP (6), 
	"INVOICE_NO" NUMBER, 
	"BRANCH_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SALES_RENT_INV_DTL
--------------------------------------------------------

  CREATE TABLE "SALES_RENT_INV_DTL" 
   (	"DTL_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"INVOICE_ID" NUMBER, 
	"PRODUCT_ID" NUMBER, 
	"PRODUCT_UNIT_ID" NUMBER, 
	"QUANTITY" NUMBER, 
	"PRICE" NUMBER, 
	"TOTAL_PRICE" NUMBER, 
	"DISCOUNT_PERCENTAGE" NUMBER, 
	"DISCOUNT_VALUE" NUMBER, 
	"POST_DISCOUNT_TOTAL_PRICE" NUMBER, 
	"VAT_PERCENTAGE" NUMBER, 
	"VAT_VALUE" NUMBER, 
	"TOTAL_AMOUNT" NUMBER, 
	"PRE_DISCOUNT_VAT_VALUE" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SALES_RETURN_INV
--------------------------------------------------------

  CREATE TABLE "SALES_RETURN_INV" 
   (	"INVOICE_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"INVOICE_DATE" TIMESTAMP (6), 
	"STORE_DATE" TIMESTAMP (6), 
	"SALES_INV_ID" NUMBER, 
	"STORE_ID" NUMBER, 
	"INVOICE_TYPE" NUMBER, 
	"PAYMENT_TYPE" NUMBER, 
	"SAFE_ID" NUMBER, 
	"COST_CTR_ID" NUMBER, 
	"CLIENT_ID" NUMBER, 
	"PRE_TAX_TOTAL_AMOUNT" NUMBER, 
	"CLIENT_DISCOUNT" NUMBER, 
	"TOTAL_DISCOUNT" NUMBER, 
	"POST_DISCOUNT_TOTAL_AMOUNT" NUMBER, 
	"TOTAL_VAT" NUMBER, 
	"TOTAL_QUANTITY" NUMBER, 
	"INVOICE_TOTAL_AMOUNT" NUMBER, 
	"PAID_CASH_AMOUNT" NUMBER, 
	"PAID_BANK_AMOUNT" NUMBER, 
	"NOTES" VARCHAR2(400 BYTE), 
	"COMPANY_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"BANK_ACC_ID" NUMBER, 
	"PAID_AMOUNT" NUMBER, 
	"DEFERRED_AMOUNT" NUMBER, 
	"ACC_JOURNAL_ID" NUMBER, 
	"INVOICE_NO" NUMBER, 
	"BRANCH_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SALES_RETURN_INV_DTL
--------------------------------------------------------

  CREATE TABLE "SALES_RETURN_INV_DTL" 
   (	"DTL_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"INVOICE_ID" NUMBER, 
	"PRODUCT_ID" NUMBER, 
	"PRODUCT_UNIT_ID" NUMBER, 
	"QUANTITY" NUMBER, 
	"PRICE" NUMBER, 
	"TOTAL_PRICE" NUMBER, 
	"DISCOUNT_PERCENTAGE" NUMBER, 
	"DISCOUNT_VALUE" NUMBER, 
	"POST_DISCOUNT_TOTAL_PRICE" NUMBER, 
	"VAT_PERCENTAGE" NUMBER, 
	"VAT_VALUE" NUMBER, 
	"TOTAL_AMOUNT" NUMBER, 
	"PRE_DISCOUNT_VAT_VALUE" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SETUP_APP_ROLE
--------------------------------------------------------

  CREATE TABLE "SETUP_APP_ROLE" 
   (	"ROLE_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"ROLE_NAME" VARCHAR2(50 BYTE), 
	"CREATED_BY" NUMBER, 
	"CREATED_AT" TIMESTAMP (6), 
	"MODIFIED_BY" NUMBER, 
	"MODIFIED_AT" DATE, 
	"COMPANY_ID" NUMBER, 
	"ROLE_NAME_EN" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table SETUP_APP_USER
--------------------------------------------------------

  CREATE TABLE "SETUP_APP_USER" 
   (	"USER_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"USER_NAME" VARCHAR2(50 BYTE), 
	"PASS" VARCHAR2(50 BYTE), 
	"CREATED_BY" NUMBER, 
	"CREATED_AT" TIMESTAMP (6), 
	"MODIFIED_BY" NUMBER, 
	"MODIFIED_AT" DATE, 
	"STATUS" NUMBER, 
	"USER_TYPE" NUMBER, 
	"COMPANY_ID" NUMBER, 
	"PREFERED_LANG_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SETUP_BANK_EXT_ACC
--------------------------------------------------------

  CREATE TABLE "SETUP_BANK_EXT_ACC" 
   (	"BANK_ACC_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"ACC_NAME_AR" VARCHAR2(200 BYTE), 
	"ACCOUNT_ID" NUMBER, 
	"TEL_NO" VARCHAR2(50 BYTE), 
	"MOBILE_NO" VARCHAR2(50 BYTE), 
	"COUNTRY_ID" NUMBER, 
	"CITY_ID" NUMBER, 
	"REGION_ID" NUMBER, 
	"NOTE" VARCHAR2(2000 BYTE), 
	"FOR_ALL_BRANCHES" NUMBER, 
	"STATUS" NUMBER, 
	"COMPANY_ID" NUMBER, 
	"ACC_NAME_EN" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table SETUP_BRANCH
--------------------------------------------------------

  CREATE TABLE "SETUP_BRANCH" 
   (	"BRANCH_ID" NUMBER, 
	"NAME_AR" VARCHAR2(200 BYTE), 
	"NAME_EN" VARCHAR2(200 BYTE), 
	"TEL_NO" VARCHAR2(20 BYTE), 
	"MOBILE_NO" VARCHAR2(20 BYTE), 
	"FAX" VARCHAR2(20 BYTE), 
	"EMAIL" VARCHAR2(20 BYTE), 
	"COMERCIAL_REC_NO" VARCHAR2(20 BYTE), 
	"TAX_NO" VARCHAR2(20 BYTE), 
	"COUNTRY_ID" NUMBER, 
	"CITY_ID" NUMBER, 
	"REGION_ID" NUMBER, 
	"BUILDING_NO" VARCHAR2(20 BYTE), 
	"SREET" VARCHAR2(20 BYTE), 
	"POST_CODE" VARCHAR2(20 BYTE), 
	"NOTE" VARCHAR2(20 BYTE), 
	"COMPANY_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SETUP_CITY
--------------------------------------------------------

  CREATE TABLE "SETUP_CITY" 
   (	"CITY_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"CITY_NAME_AR" VARCHAR2(200 BYTE), 
	"CITY_NAME_EN" VARCHAR2(200 BYTE), 
	"COUNTRY_ID" NUMBER, 
	"STATUS" NUMBER, 
	"COMPANY_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SETUP_COUNTRY
--------------------------------------------------------

  CREATE TABLE "SETUP_COUNTRY" 
   (	"COUNTRY_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"NAME_AR" VARCHAR2(200 BYTE), 
	"NAME_EN" VARCHAR2(200 BYTE), 
	"NATIONALITY_NAME_AR" VARCHAR2(200 BYTE), 
	"NATIONALITY_NAME_EN" VARCHAR2(200 BYTE), 
	"STATUS" NUMBER, 
	"COMPANY_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SETUP_CURRENCY
--------------------------------------------------------

  CREATE TABLE "SETUP_CURRENCY" 
   (	"CURRENCY_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"CODE_AR" VARCHAR2(30 BYTE), 
	"NAME_AR" VARCHAR2(30 BYTE), 
	"CREATED_BY" NUMBER, 
	"CREATED_AT" TIMESTAMP (6), 
	"MODIFIED_BY" NUMBER, 
	"MODIFIED_AT" TIMESTAMP (6), 
	"COMPANY_ID" NUMBER, 
	"NAME_EN" VARCHAR2(30 BYTE), 
	"CODE_EN" VARCHAR2(30 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table SETUP_PARAMS
--------------------------------------------------------

  CREATE TABLE "SETUP_PARAMS" 
   (	"PARAM_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"PARAM_DESC_AR" VARCHAR2(2000 CHAR), 
	"PARAM_DESC_EN" VARCHAR2(2000 CHAR), 
	"COMPANY_ID" NUMBER, 
	"PARAM_VALUE" VARCHAR2(200 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table SETUP_PROD_GROUP
--------------------------------------------------------

  CREATE TABLE "SETUP_PROD_GROUP" 
   (	"GROUP_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"NAME_AR" VARCHAR2(200 BYTE), 
	"NAME_EN" VARCHAR2(200 BYTE), 
	"STATUS" NUMBER, 
	"COMPANY_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SETUP_REGION
--------------------------------------------------------

  CREATE TABLE "SETUP_REGION" 
   (	"REGION_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"REGION_NAME_AR" VARCHAR2(200 BYTE), 
	"REGION_NAME_EN" VARCHAR2(200 BYTE), 
	"COUNTRY_ID" NUMBER, 
	"CITY_ID" NUMBER, 
	"STATUS" NUMBER, 
	"COMPANY_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SETUP_SAFE
--------------------------------------------------------

  CREATE TABLE "SETUP_SAFE" 
   (	"SAFE_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"SAFE_NAME_AR" VARCHAR2(200 BYTE), 
	"BRANCH_ID" NUMBER, 
	"ACCOUNT_ID" NUMBER, 
	"NOTE" VARCHAR2(2000 BYTE), 
	"IS_DEFAULT" NUMBER, 
	"FOR_ALL_BRANCHES" NUMBER, 
	"STATUS" NUMBER, 
	"COMPANY_ID" NUMBER, 
	"SAFE_NAME_EN" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table SETUP_STORE
--------------------------------------------------------

  CREATE TABLE "SETUP_STORE" 
   (	"STORE_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"STORE_NAME_AR" VARCHAR2(200 BYTE), 
	"BRANCH_ID" NUMBER, 
	"NOTE" VARCHAR2(2000 BYTE), 
	"STATUS" NUMBER, 
	"COMPANY_ID" NUMBER, 
	"STORE_NAME_EN" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table SETUP_TAX_GROUP
--------------------------------------------------------

  CREATE TABLE "SETUP_TAX_GROUP" 
   (	"GROUP_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"NAME_AR" VARCHAR2(200 BYTE), 
	"NAME_EN" VARCHAR2(200 BYTE), 
	"GROUP_VALUE" NUMBER, 
	"STATUS" NUMBER, 
	"COMPANY_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table SETUP_UNIT
--------------------------------------------------------

  CREATE TABLE "SETUP_UNIT" 
   (	"UNIT_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"UNIT_NAME_AR" VARCHAR2(200 BYTE), 
	"COMPANY_ID" NUMBER, 
	"UNIT_NAME_EN" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table STORE_FIRST_PERIOD_STOCK
--------------------------------------------------------

  CREATE TABLE "STORE_FIRST_PERIOD_STOCK" 
   (	"INVOICE_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"INVOICE_DATE" TIMESTAMP (6), 
	"STORE_DATE" TIMESTAMP (6), 
	"PROVIDER_INV_DATE" TIMESTAMP (6), 
	"STORE_ID" NUMBER, 
	"INVOICE_TYPE" NUMBER, 
	"SAFE_ID" NUMBER, 
	"COST_CTR_ID" NUMBER, 
	"PROVIDER_ID" NUMBER, 
	"PROVIDER_INV_ID" VARCHAR2(50 BYTE), 
	"TOTAL_QUANTITY" NUMBER, 
	"INVOICE_TOTAL_AMOUNT" NUMBER, 
	"NOTES" VARCHAR2(400 BYTE), 
	"COMPANY_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"INVOICE_NO" NUMBER, 
	"BRANCH_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table STORE_FIRST_PERIOD_STOCK_DTL
--------------------------------------------------------

  CREATE TABLE "STORE_FIRST_PERIOD_STOCK_DTL" 
   (	"DTL_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"INVOICE_ID" NUMBER, 
	"PRODUCT_ID" NUMBER, 
	"PRODUCT_UNIT_ID" NUMBER, 
	"QUANTITY" NUMBER, 
	"PRICE" NUMBER, 
	"TOTAL_AMOUNT" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table STORE_STOCKIN_ORDER
--------------------------------------------------------

  CREATE TABLE "STORE_STOCKIN_ORDER" 
   (	"ORDER_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"STORE_ID" NUMBER, 
	"ORDER_DATE" TIMESTAMP (6), 
	"REF_ID" NUMBER, 
	"ACCOUNT_ID" NUMBER, 
	"COST_CTR_ID" NUMBER, 
	"ACCOUNTABLE" NUMBER, 
	"NOTES" VARCHAR2(2000 BYTE), 
	"COMPANY_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"TOTAL_AMOUNT" NUMBER, 
	"ACC_JOURNAL_ID" NUMBER, 
	"ORDER_NO" NUMBER, 
	"BRANCH_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table STORE_STOCKIN_ORDER_DTL
--------------------------------------------------------

  CREATE TABLE "STORE_STOCKIN_ORDER_DTL" 
   (	"DTL_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"ORDER_ID" NUMBER, 
	"PRODUCT_ID" NUMBER, 
	"PRODUCT_UNIT_ID" NUMBER, 
	"QUANTITY" NUMBER, 
	"PRICE" NUMBER, 
	"TOTAL" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table STORE_STOCKOUT_ORDER
--------------------------------------------------------

  CREATE TABLE "STORE_STOCKOUT_ORDER" 
   (	"ORDER_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"STORE_ID" NUMBER, 
	"ORDER_DATE" TIMESTAMP (6), 
	"REF_ID" NUMBER, 
	"ACCOUNT_ID" NUMBER, 
	"COST_CTR_ID" NUMBER, 
	"ACCOUNTABLE" NUMBER, 
	"NOTES" VARCHAR2(2000 BYTE), 
	"COMPANY_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"TOTAL_AMOUNT" NUMBER, 
	"ACC_JOURNAL_ID" NUMBER, 
	"ORDER_NO" NUMBER, 
	"BRANCH_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table STORE_STOCKOUT_ORDER_DTL
--------------------------------------------------------

  CREATE TABLE "STORE_STOCKOUT_ORDER_DTL" 
   (	"DTL_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"ORDER_ID" NUMBER, 
	"PRODUCT_ID" NUMBER, 
	"PRODUCT_UNIT_ID" NUMBER, 
	"QUANTITY" NUMBER, 
	"PRICE" NUMBER, 
	"TOTAL" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table STORE_TRANSFER
--------------------------------------------------------

  CREATE TABLE "STORE_TRANSFER" 
   (	"TRANSFER_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"FROM_STORE_ID" NUMBER, 
	"TO_STORE_ID" NUMBER, 
	"TRANSFER_DATE" TIMESTAMP (6), 
	"TRANSFER_BY" NUMBER, 
	"HAS_RECEIVED" NUMBER, 
	"RECEIVE_DATE" TIMESTAMP (6), 
	"RECEIVED_BY" NUMBER, 
	"COMPANY_ID" NUMBER, 
	"TRANSFER_NO" NUMBER, 
	"BRANCH_ID" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table STORE_TRANSFER_DTL
--------------------------------------------------------

  CREATE TABLE "STORE_TRANSFER_DTL" 
   (	"DTL_ID" NUMBER GENERATED BY DEFAULT AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"TRANSFER_ID" NUMBER, 
	"PRODUCT_ID" NUMBER, 
	"PRODUCT_UNIT_ID" NUMBER, 
	"QUANTITY" NUMBER, 
	"PRICE" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for View ADMIN_COMPANY_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "ADMIN_COMPANY_R" ("COMPANY_ID", "NAME_AR", "NAME_EN", "TAX_NO", "COMERCIAL_REC_NO", "TEL_NO", "MOBILE_NO", "SREET", "LOGO") AS 
  SELECT 
com.COMPANY_ID,
com.NAME_AR,
com.NAME_EN,
	com.TAX_NO,
	com.COMERCIAL_REC_NO,
	com.TEL_NO,
	com.MOBILE_NO,
	com.SREET,
	--'http://localhost:8080/ords/accounting/trade_v1/get_file?p_mime_type=image/png=Logo-saudi-vision-2030-download-free-PNG.png'  as logo
   'https://h.top4top.io/p_2104tstpj1.png' AS logo
FROM ADMIN_COMPANY com
;
--------------------------------------------------------
--  DDL for View SALES_INV_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "SALES_INV_R" ("INVOICE_NO", "INV_TYPE_AR", "INV_TYPE_EN", "C_NAME", "C_TAX_NO", "STORE_DATE", "C_MOBILE_NO", "C_STREET", "U_NAME", "PRE_TAX_AMOUNT", "TOTAL_DIS", "POST_DIS_AMOUNT", "TOTAL_VAT", "INV_AMOUNT", "INVOICE_DATE", "INVOICE_TIME", "INVOICE_ID", "QR_CODE", "TRANS_TYPE_AR", "TRANS_TYPE_EN", "INVOICE_TYPE", "PAYMENT_TYPE") AS 
  SELECT
    INVOICE_NO,
    (
SELECT
    'فاتورة ' ||  ITEM_NOTE_AR  INV_TYPE
FROM
    ADMIN_LIST_ITEM
WHERE LIST_ID = 5 AND ITEM_NO = INVOICE_TYPE)
||' '||
(
SELECT
      'الدفع ' ||    ITEM_NOTE_AR INV_TYPE
FROM
    ADMIN_LIST_ITEM
WHERE LIST_ID = 4 AND ITEM_NO = PAYMENT_TYPE) INV_TYPE_AR ,

(
SELECT
     'Invoice '  ||   ITEM_NOTE_EN  INV_TYPE
FROM
    ADMIN_LIST_ITEM
WHERE LIST_ID = 5 AND ITEM_NO = INVOICE_TYPE)
||' '||
(
SELECT
    'Paied ' ||  ITEM_NOTE_EN  INV_TYPE
FROM
    ADMIN_LIST_ITEM
WHERE LIST_ID = 4 AND ITEM_NO = PAYMENT_TYPE)INV_TYPE_EN ,
    C.NAME_AR C_NAME,
	 NVL(C.TAX_NO,'') C_TAX_NO,
    to_char(INV.STORE_DATE,'dd-MM-yyyy') STORE_DATE,
    NVL(C.MOBILE_NO,'') C_MOBILE_NO,
    NVL(C.SREET,'') C_STREET,
    U.USER_NAME U_NAME,
    PRE_TAX_TOTAL_AMOUNT PRE_TAX_AMOUNT,
    TOTAL_DISCOUNT TOTAL_DIS,
    POST_DISCOUNT_TOTAL_AMOUNT POST_DIS_AMOUNT,
    TOTAL_VAT,
    INVOICE_TOTAL_AMOUNT INV_AMOUNT,
    to_char(INV.INVOICE_DATE,'dd-MM-yyyy') INVOICE_DATE,
    TO_CHAR(INVOICE_DATE,'HH24:MI:SS') INVOICE_TIME,
    INVOICE_ID,
GET_QR_CODE(
    P_COMPANY_ID          => INV.COMPANY_ID,
    P_INVOICE_DATE        => INV.INVOICE_DATE,
    P_INV_TOTAL_WITH_VAT  => INV.INVOICE_TOTAL_AMOUNT,
    P_VAT_TOTAL           => INV.TOTAL_VAT
) QR_CODE,
'بيع' TRANS_TYPE_AR,
'Sale' TRANS_TYPE_EN,
INVOICE_TYPE,
PAYMENT_TYPE
FROM
    SALES_INV INV left JOIN SALES_CLIENT C ON INV.CLIENT_ID = C.CLIENT_ID
    LEFT JOIN SETUP_APP_USER U ON U.USER_ID = INV.USER_ID
;
--------------------------------------------------------
--  DDL for View SALES_PURCHASE_INV_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "SALES_PURCHASE_INV_R" ("INVOICE_NO", "INV_TYPE_AR", "INV_TYPE_EN", "P_NAME", "P_TAX_NO", "P_INV_DATE", "P_INV_ID", "STORE_DATE", "P_MOBILE_NO", "P_STREET", "U_NAME", "PRE_TAX_AMOUNT", "TOTAL_DIS", "POST_DIS_AMOUNT", "TOTAL_VAT", "INV_AMOUNT", "INVOICE_DATE", "INVOICE_TIME", "INVOICE_ID", "QR_CODE", "INVOICE_TYPE", "PAYMENT_TYPE") AS 
  SELECT
    INVOICE_NO,
    (
SELECT
    'فاتورة ' ||  ITEM_NOTE_AR  INV_TYPE
FROM
    ADMIN_LIST_ITEM
WHERE LIST_ID = 5 AND ITEM_NO = INVOICE_TYPE)
||' '||
(
SELECT
      'الدفع ' ||    ITEM_NOTE_AR INV_TYPE
FROM
    ADMIN_LIST_ITEM
WHERE LIST_ID = 4 AND ITEM_NO = PAYMENT_TYPE) INV_TYPE_AR ,
(
SELECT
     'Invoice '  ||   ITEM_NOTE_EN  INV_TYPE
FROM
    ADMIN_LIST_ITEM
WHERE LIST_ID = 5 AND ITEM_NO = INVOICE_TYPE)
||' '||
(
SELECT
    'Paied ' ||  ITEM_NOTE_EN  INV_TYPE
FROM
    ADMIN_LIST_ITEM
WHERE LIST_ID = 4 AND ITEM_NO = PAYMENT_TYPE) INV_TYPE_EN ,
    C.NAME_AR P_NAME,
    NVL(C.TAX_NO,'') P_TAX_NO,
    to_char(INV.PROVIDER_INV_DATE,'dd-MM-yyyy') P_INV_DATE,
    NVL(PROVIDER_INV_ID,'') P_INV_ID,
    to_char(INV.STORE_DATE,'dd-MM-yyyy') STORE_DATE,
    NVL(C.MOBILE_NO,'') P_MOBILE_NO,
    NVL(C.SREET,'') P_STREET,
    U.USER_NAME U_NAME,
    PRE_TAX_TOTAL_AMOUNT PRE_TAX_AMOUNT,
    TOTAL_DISCOUNT TOTAL_DIS,
    POST_DISCOUNT_TOTAL_AMOUNT POST_DIS_AMOUNT,
    TOTAL_VAT,
    INVOICE_TOTAL_AMOUNT INV_AMOUNT,
    to_char(INV.INVOICE_DATE,'dd-MM-yyyy') INVOICE_DATE,
    TO_CHAR(INVOICE_DATE,'HH24:MI:SS') INVOICE_TIME,
    INVOICE_ID,
GET_QR_CODE(
    P_COMPANY_ID          => INV.COMPANY_ID,
    P_INVOICE_DATE        => INV.INVOICE_DATE,
    P_INV_TOTAL_WITH_VAT  => INV.INVOICE_TOTAL_AMOUNT,
    P_VAT_TOTAL           => INV.TOTAL_VAT
) QR_CODE,
INVOICE_TYPE,
PAYMENT_TYPE
FROM
    SALES_PURCHASE_INV INV JOIN SALES_PROVIDER C ON INV.PROVIDER_ID = C.PROVIDER_ID
    LEFT JOIN SETUP_APP_USER U ON U.USER_ID = INV.USER_ID
;
--------------------------------------------------------
--  DDL for View SALES_PUR_RETURN_INV_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "SALES_PUR_RETURN_INV_R" ("INVOICE_NO", "INV_TYPE_AR", "INV_TYPE_EN", "P_NAME", "P_TAX_NO", "P_INV_DATE", "P_INV_ID", "STORE_DATE", "P_MOBILE_NO", "P_STREET", "U_NAME", "PRE_TAX_AMOUNT", "TOTAL_DIS", "POST_DIS_AMOUNT", "TOTAL_VAT", "INV_AMOUNT", "INVOICE_DATE", "INVOICE_TIME", "INVOICE_ID", "QR_CODE", "INVOICE_TYPE", "PAYMENT_TYPE") AS 
  SELECT
    INVOICE_NO,
    (
SELECT
    'فاتورة ' ||  ITEM_NOTE_AR  INV_TYPE
FROM
    ADMIN_LIST_ITEM
WHERE LIST_ID = 5 AND ITEM_NO = INVOICE_TYPE)
||' '||
(
SELECT
      'الدفع ' ||    ITEM_NOTE_AR INV_TYPE
FROM
    ADMIN_LIST_ITEM
WHERE LIST_ID = 4 AND ITEM_NO = PAYMENT_TYPE) INV_TYPE_AR ,
(
SELECT
     'Invoice '  ||   ITEM_NOTE_EN  INV_TYPE
FROM
    ADMIN_LIST_ITEM
WHERE LIST_ID = 5 AND ITEM_NO = INVOICE_TYPE)
||' '||
(
SELECT
    'Paied ' ||  ITEM_NOTE_EN  INV_TYPE
FROM
    ADMIN_LIST_ITEM
WHERE LIST_ID = 4 AND ITEM_NO = PAYMENT_TYPE) INV_TYPE_EN ,
    C.NAME_AR P_NAME,
    NVL(C.TAX_NO,'') P_TAX_NO,
    to_char(INV.PROVIDER_INV_DATE,'dd-MM-yyyy') P_INV_DATE,
    NVL(PROVIDER_INV_ID,'') P_INV_ID,
    to_char(INV.STORE_DATE,'dd-MM-yyyy') STORE_DATE,
    NVL(C.MOBILE_NO,'') P_MOBILE_NO,
    NVL(C.SREET,'') P_STREET,
    U.USER_NAME U_NAME,
    PRE_TAX_TOTAL_AMOUNT PRE_TAX_AMOUNT,
    TOTAL_DISCOUNT TOTAL_DIS,
    POST_DISCOUNT_TOTAL_AMOUNT POST_DIS_AMOUNT,
    TOTAL_VAT,
    INVOICE_TOTAL_AMOUNT INV_AMOUNT,
    to_char(INV.INVOICE_DATE,'dd-MM-yyyy') INVOICE_DATE,
    TO_CHAR(INVOICE_DATE,'HH24:MI:SS') INVOICE_TIME,
    INVOICE_ID,
GET_QR_CODE(
    P_COMPANY_ID          => INV.COMPANY_ID,
    P_INVOICE_DATE        => INV.INVOICE_DATE,
    P_INV_TOTAL_WITH_VAT  => INV.INVOICE_TOTAL_AMOUNT,
    P_VAT_TOTAL           => INV.TOTAL_VAT
) QR_CODE,
INVOICE_TYPE,
PAYMENT_TYPE
FROM
    SALES_PUR_RETURN_INV INV JOIN SALES_PROVIDER C ON INV.PROVIDER_ID = C.PROVIDER_ID
    LEFT JOIN SETUP_APP_USER U ON U.USER_ID = INV.USER_ID
;
--------------------------------------------------------
--  DDL for View SALES_RETURN_INV_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "SALES_RETURN_INV_R" ("INVOICE_NO", "INV_TYPE_AR", "INV_TYPE_EN", "C_NAME", "C_TAX_NO", "SALES_INV_ID", "STORE_DATE", "C_MOBILE_NO", "C_STREET", "U_NAME", "PRE_TAX_AMOUNT", "TOTAL_DIS", "POST_DIS_AMOUNT", "TOTAL_VAT", "INV_AMOUNT", "INVOICE_DATE", "INVOICE_TIME", "INVOICE_ID", "QR_CODE", "TRANS_TYPE_AR", "TRANS_TYPE_EN", "INVOICE_TYPE", "PAYMENT_TYPE") AS 
  SELECT
    INVOICE_NO,
    (
SELECT
    'فاتورة ' ||  ITEM_NOTE_AR  INV_TYPE
FROM
    ADMIN_LIST_ITEM
WHERE LIST_ID = 5 AND ITEM_NO = INVOICE_TYPE)
||' '||
(
SELECT
      'الدفع ' ||    ITEM_NOTE_AR INV_TYPE
FROM
    ADMIN_LIST_ITEM
WHERE LIST_ID = 4 AND ITEM_NO = PAYMENT_TYPE) INV_TYPE_AR ,

(
SELECT
     'Invoice '  ||   ITEM_NOTE_EN  INV_TYPE
FROM
    ADMIN_LIST_ITEM
WHERE LIST_ID = 5 AND ITEM_NO = INVOICE_TYPE)
||' '||
(
SELECT
    'Paied ' ||  ITEM_NOTE_EN  INV_TYPE
FROM
    ADMIN_LIST_ITEM
WHERE LIST_ID = 4 AND ITEM_NO = PAYMENT_TYPE)INV_TYPE_EN ,
    C.NAME_AR C_NAME,
    NVL(C.TAX_NO,'') C_TAX_NO,
    SALES_INV_ID,
    to_char(INV.STORE_DATE,'dd-MM-yyyy') STORE_DATE,
    NVL(C.MOBILE_NO,'') C_MOBILE_NO,
    NVL(C.SREET,'') C_STREET,
    U.USER_NAME U_NAME,
    PRE_TAX_TOTAL_AMOUNT PRE_TAX_AMOUNT,
    TOTAL_DISCOUNT TOTAL_DIS,
    POST_DISCOUNT_TOTAL_AMOUNT POST_DIS_AMOUNT,
    TOTAL_VAT,
    INVOICE_TOTAL_AMOUNT INV_AMOUNT,
    TO_CHAR(INVOICE_DATE,'HH24:MI:SS')INVOICE_DATE,
    TO_CHAR(INVOICE_DATE,'HH24:MI:SS') INVOICE_TIME,
    INVOICE_ID,
GET_QR_CODE(
    P_COMPANY_ID          => INV.COMPANY_ID,
    P_INVOICE_DATE        => INV.INVOICE_DATE,
    P_INV_TOTAL_WITH_VAT  => INV.INVOICE_TOTAL_AMOUNT,
    P_VAT_TOTAL           => INV.TOTAL_VAT
) QR_CODE,
'مردود بيع' TRANS_TYPE_AR,
'Sales Return' TRANS_TYPE_en,
INVOICE_TYPE,
PAYMENT_TYPE
FROM
    SALES_RETURN_INV INV left JOIN SALES_CLIENT C ON INV.CLIENT_ID = C.CLIENT_ID
    LEFT JOIN SETUP_APP_USER U ON U.USER_ID = INV.USER_ID
;
--------------------------------------------------------
--  DDL for View SALES_RPT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "SALES_RPT" ("C_NAME", "INV_TYPE_AR", "INV_TYPE_EN", "INVOICE_DATE", "INVOICE_NO", "POST_DIS_AMOUNT", "TOTAL_VAT", "INV_AMOUNT") AS 
  SELECT
    C_NAME,
    INV_TYPE_AR,
    INV_TYPE_EN,
    INVOICE_DATE,
    INVOICE_NO,
    POST_DIS_AMOUNT,
    TOTAL_VAT,
    INV_AMOUNT
FROM
    SALES_INV_R
;
--------------------------------------------------------
--  DDL for View STORE_FIRST_PERIOD_STOCK_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "STORE_FIRST_PERIOD_STOCK_R" ("INVOICE_NO", "INV_TYPE_AR", "INV_TYPE_EN", "P_NAME", "P_TAX_NO", "P_INV_DATE", "P_INV_ID", "STORE_DATE", "P_MOBILE_NO", "P_STREET", "U_NAME", "PRE_TAX_AMOUNT", "TOTAL_DIS", "TOTAL_VAT", "POST_DIS_AMOUNT", "INV_AMOUNT", "INVOICE_DATE", "INVOICE_TIME", "INVOICE_ID", "QR_CODE", "INVOICE_TYPE") AS 
  SELECT
    INVOICE_NO,
    (
SELECT
    'فاتورة ' ||  ITEM_NOTE_AR  INV_TYPE
FROM
    ADMIN_LIST_ITEM
WHERE LIST_ID = 5 AND ITEM_NO = INVOICE_TYPE) INV_TYPE_AR ,
(
SELECT
     'Invoice '  ||   ITEM_NOTE_EN  INV_TYPE
FROM
    ADMIN_LIST_ITEM
WHERE LIST_ID = 5 AND ITEM_NO = INVOICE_TYPE) INV_TYPE_EN ,
    C.NAME_AR P_NAME,
    NVL(C.TAX_NO,'') P_TAX_NO,
    to_char(INV.PROVIDER_INV_DATE,'dd-MM-yyyy') P_INV_DATE,
    NVL(PROVIDER_INV_ID,'') P_INV_ID,
    to_char(INV.STORE_DATE,'dd-MM-yyyy') STORE_DATE,
    NVL(C.MOBILE_NO,'') P_MOBILE_NO,
    NVL(C.SREET,'') P_STREET,
    U.USER_NAME U_NAME,
    INVOICE_TOTAL_AMOUNT PRE_TAX_AMOUNT,
    0 TOTAL_DIS,
    0 TOTAL_VAT,
    INVOICE_TOTAL_AMOUNT POST_DIS_AMOUNT,
    INVOICE_TOTAL_AMOUNT INV_AMOUNT,
    to_char(INV.INVOICE_DATE,'dd-MM-yyyy') INVOICE_DATE,
    TO_CHAR(INVOICE_DATE,'HH24:MI:SS') INVOICE_TIME,
    INVOICE_ID,
GET_QR_CODE(
    P_COMPANY_ID          => INV.COMPANY_ID,
    P_INVOICE_DATE        => INV.INVOICE_DATE,
    P_INV_TOTAL_WITH_VAT  => INV.INVOICE_TOTAL_AMOUNT,
    P_VAT_TOTAL           => 0
) QR_CODE,
INVOICE_TYPE
FROM
    STORE_FIRST_PERIOD_STOCK INV JOIN SALES_PROVIDER C ON INV.PROVIDER_ID = C.PROVIDER_ID
    LEFT JOIN SETUP_APP_USER U ON U.USER_ID = INV.USER_ID
;
--------------------------------------------------------
--  DDL for Index ACC_ACCOUNTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACC_ACCOUNTS_PK" ON "ACC_ACCOUNTS" ("ACCOUNT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ACC_CASH_ACCOUNTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACC_CASH_ACCOUNTS_PK" ON "ACC_CASH_ACCOUNTS" ("ACCOUNT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ACC_COST_CENTER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACC_COST_CENTER_PK" ON "ACC_COST_CENTER" ("COST_CTR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ACC_JOURNAL_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACC_JOURNAL_DTL_PK" ON "ACC_VOUCHER_DTL" ("ACC_VOUCHER_DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ACC_JOURNAL_DTL_PK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACC_JOURNAL_DTL_PK1" ON "ACC_JOURNAL_DTL" ("JOURNAL_DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ACC_JOURNAL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACC_JOURNAL_PK" ON "ACC_VOUCHER" ("ACC_VOUCHER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ACC_JOURNAL_PK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACC_JOURNAL_PK1" ON "ACC_JOURNAL" ("ACC_JOURNAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ACC_LEDGER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACC_LEDGER_PK" ON "ACC_LEDGER" ("LEDGER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ACC_SETUP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACC_SETUP_PK" ON "ACC_SETUP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ACL_SAFE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACL_SAFE_PK" ON "ACL_SAFE" ("ACL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ADMIN_APP_INTERFACE_PAGE_UQ
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN_APP_INTERFACE_PAGE_UQ" ON "ADMIN_APP_INTERFACE" ("PAGE_NO") 
  ;
--------------------------------------------------------
--  DDL for Index ADMIN_COMPANY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN_COMPANY_PK" ON "ADMIN_COMPANY" ("COMPANY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ADMIN_ERROR_MSG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN_ERROR_MSG_PK" ON "ADMIN_ERROR_MSG" ("MSG_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ADMIN_LIST_ITEM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN_LIST_ITEM_PK" ON "ADMIN_LIST_ITEM" ("ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ADMIN_LIST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN_LIST_PK" ON "ADMIN_LIST" ("LIST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ADMIN_USER_SESSION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN_USER_SESSION_PK" ON "ADMIN_USER_SESSION" ("SESSION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CURRENCY_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CURRENCY_ID_PK" ON "SETUP_CURRENCY" ("CURRENCY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index FILE_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FILE_ID_PK" ON "SALES_PRODUCT_FILES" ("FILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index INTERFACE_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "INTERFACE_ID_PK" ON "ADMIN_APP_INTERFACEE" ("INTERFACE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index OPERATION_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "OPERATION_ID_PK" ON "ADMIN_APP_OPERATION" ("OPERATION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index OPERATION_IF_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "OPERATION_IF_ID_PK" ON "ADMIN_INTERFACE_OPR" ("OPERATION_IF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PRIV_IF_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PRIV_IF_ID_PK" ON "ACL_APP_INTERFACE" ("PRIV_IF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PRIV_OP_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PRIV_OP_ID_PK" ON "ACL_INTERFACE_OPR" ("ACL_INTERFACE_OPR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ROLE_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROLE_ID_PK" ON "SETUP_APP_ROLE" ("ROLE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_CLIENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_CLIENT_PK" ON "SALES_CLIENT" ("CLIENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_INV_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_INV_DTL_PK" ON "SALES_INV_DTL" ("INVOICE_DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_INV_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_INV_PK" ON "SALES_INV" ("INVOICE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PRODUCT_BARCODES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PRODUCT_BARCODES_PK" ON "SALES_PRODUCT_BARCODES" ("PRODUCT_BARCODE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PRODUCT_INDEX1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PRODUCT_INDEX1" ON "SALES_PRODUCT" ("PRODUCT_NO", "COMPANY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PRODUCT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PRODUCT_PK" ON "SALES_PRODUCT" ("PRODUCT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PRODUCT_UNIT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PRODUCT_UNIT_PK" ON "SALES_PRODUCT_UNIT" ("PRODUCT_UNIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PROVIDER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PROVIDER_PK" ON "SALES_PROVIDER" ("PROVIDER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PURCHASE_INV_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PURCHASE_INV_DTL_PK" ON "SALES_PURCHASE_INV_DTL" ("DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PURCHASE_INV_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PURCHASE_INV_PK" ON "SALES_PURCHASE_INV" ("INVOICE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PURCHASE_ORDER_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PURCHASE_ORDER_DTL_PK" ON "SALES_PURCHASE_ORDER_DTL" ("DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PURCHASE_ORDER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PURCHASE_ORDER_PK" ON "SALES_PURCHASE_ORDER" ("ORDER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PUR_RETURN_INV_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PUR_RETURN_INV_DTL_PK" ON "SALES_PUR_RETURN_INV_DTL" ("DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PUR_RETURN_INV_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PUR_RETURN_INV_PK" ON "SALES_PUR_RETURN_INV" ("INVOICE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_RENT_INV_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_RENT_INV_DTL_PK" ON "SALES_RENT_INV_DTL" ("DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_RENT_INV_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_RENT_INV_PK" ON "SALES_RENT_INV" ("INVOICE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_RETURN_INV_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_RETURN_INV_DTL_PK" ON "SALES_RETURN_INV_DTL" ("DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_RETURN_INV_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_RETURN_INV_PK" ON "SALES_RETURN_INV" ("INVOICE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_APP_USER_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_APP_USER_UK1" ON "SETUP_APP_USER" ("USER_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_BANK_ACC_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_BANK_ACC_PK" ON "SETUP_BANK_EXT_ACC" ("BANK_ACC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_BRANCH_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_BRANCH_PK" ON "SETUP_BRANCH" ("BRANCH_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_CITY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_CITY_PK" ON "SETUP_CITY" ("CITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_COUNTRY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_COUNTRY_PK" ON "SETUP_COUNTRY" ("COUNTRY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_PROD_GROUP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_PROD_GROUP_PK" ON "SETUP_PROD_GROUP" ("GROUP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_REGION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_REGION_PK" ON "SETUP_REGION" ("REGION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_STORE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_STORE_PK" ON "SETUP_STORE" ("STORE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_TAX_GROUP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_TAX_GROUP_PK" ON "SETUP_TAX_GROUP" ("GROUP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_TREASURY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_TREASURY_PK" ON "SETUP_SAFE" ("SAFE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_UNIT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_UNIT_PK" ON "SETUP_UNIT" ("UNIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STORE_FIRST_PERIOD_STOCK_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORE_FIRST_PERIOD_STOCK_DTL_PK" ON "STORE_FIRST_PERIOD_STOCK_DTL" ("DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STORE_FIRST_PERIOD_STOCK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORE_FIRST_PERIOD_STOCK_PK" ON "STORE_FIRST_PERIOD_STOCK" ("INVOICE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STORE_STOCKIN_ORDER_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORE_STOCKIN_ORDER_DTL_PK" ON "STORE_STOCKIN_ORDER_DTL" ("DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STORE_STOCKIN_ORDER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORE_STOCKIN_ORDER_PK" ON "STORE_STOCKIN_ORDER" ("ORDER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STORE_STOCKOUT_ORDER_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORE_STOCKOUT_ORDER_DTL_PK" ON "STORE_STOCKOUT_ORDER_DTL" ("DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STORE_STOCKOUT_ORDER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORE_STOCKOUT_ORDER_PK" ON "STORE_STOCKOUT_ORDER" ("ORDER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STORE_TRANSFER_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORE_TRANSFER_DTL_PK" ON "STORE_TRANSFER_DTL" ("DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STORE_TRANSFER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORE_TRANSFER_PK" ON "STORE_TRANSFER" ("TRANSFER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index USER_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USER_ID_PK" ON "SETUP_APP_USER" ("USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index USER_ROLE_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USER_ROLE_ID_PK" ON "ACL_APP_ROLE" ("ACL_APP_ROLE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ACC_ACCOUNTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACC_ACCOUNTS_PK" ON "ACC_ACCOUNTS" ("ACCOUNT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ACC_CASH_ACCOUNTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACC_CASH_ACCOUNTS_PK" ON "ACC_CASH_ACCOUNTS" ("ACCOUNT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ACC_COST_CENTER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACC_COST_CENTER_PK" ON "ACC_COST_CENTER" ("COST_CTR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ACC_JOURNAL_PK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACC_JOURNAL_PK1" ON "ACC_JOURNAL" ("ACC_JOURNAL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ACC_JOURNAL_DTL_PK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACC_JOURNAL_DTL_PK1" ON "ACC_JOURNAL_DTL" ("JOURNAL_DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ACC_LEDGER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACC_LEDGER_PK" ON "ACC_LEDGER" ("LEDGER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ACC_SETUP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACC_SETUP_PK" ON "ACC_SETUP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ACC_JOURNAL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACC_JOURNAL_PK" ON "ACC_VOUCHER" ("ACC_VOUCHER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ACC_JOURNAL_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACC_JOURNAL_DTL_PK" ON "ACC_VOUCHER_DTL" ("ACC_VOUCHER_DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PRIV_IF_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PRIV_IF_ID_PK" ON "ACL_APP_INTERFACE" ("PRIV_IF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index USER_ROLE_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USER_ROLE_ID_PK" ON "ACL_APP_ROLE" ("ACL_APP_ROLE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index PRIV_OP_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PRIV_OP_ID_PK" ON "ACL_INTERFACE_OPR" ("ACL_INTERFACE_OPR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ACL_SAFE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACL_SAFE_PK" ON "ACL_SAFE" ("ACL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ADMIN_APP_INTERFACE_PAGE_UQ
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN_APP_INTERFACE_PAGE_UQ" ON "ADMIN_APP_INTERFACE" ("PAGE_NO") 
  ;
--------------------------------------------------------
--  DDL for Index INTERFACE_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "INTERFACE_ID_PK" ON "ADMIN_APP_INTERFACEE" ("INTERFACE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index OPERATION_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "OPERATION_ID_PK" ON "ADMIN_APP_OPERATION" ("OPERATION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ADMIN_COMPANY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN_COMPANY_PK" ON "ADMIN_COMPANY" ("COMPANY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ADMIN_ERROR_MSG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN_ERROR_MSG_PK" ON "ADMIN_ERROR_MSG" ("MSG_ID") 
  ;
--------------------------------------------------------
--  DDL for Index OPERATION_IF_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "OPERATION_IF_ID_PK" ON "ADMIN_INTERFACE_OPR" ("OPERATION_IF_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ADMIN_LIST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN_LIST_PK" ON "ADMIN_LIST" ("LIST_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ADMIN_LIST_ITEM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN_LIST_ITEM_PK" ON "ADMIN_LIST_ITEM" ("ITEM_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ADMIN_USER_SESSION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN_USER_SESSION_PK" ON "ADMIN_USER_SESSION" ("SESSION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_CLIENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_CLIENT_PK" ON "SALES_CLIENT" ("CLIENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_INV_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_INV_PK" ON "SALES_INV" ("INVOICE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_INV_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_INV_DTL_PK" ON "SALES_INV_DTL" ("INVOICE_DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PRODUCT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PRODUCT_PK" ON "SALES_PRODUCT" ("PRODUCT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PRODUCT_INDEX1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PRODUCT_INDEX1" ON "SALES_PRODUCT" ("PRODUCT_NO", "COMPANY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PRODUCT_BARCODES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PRODUCT_BARCODES_PK" ON "SALES_PRODUCT_BARCODES" ("PRODUCT_BARCODE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index FILE_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FILE_ID_PK" ON "SALES_PRODUCT_FILES" ("FILE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PRODUCT_UNIT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PRODUCT_UNIT_PK" ON "SALES_PRODUCT_UNIT" ("PRODUCT_UNIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PROVIDER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PROVIDER_PK" ON "SALES_PROVIDER" ("PROVIDER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PURCHASE_INV_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PURCHASE_INV_PK" ON "SALES_PURCHASE_INV" ("INVOICE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PURCHASE_INV_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PURCHASE_INV_DTL_PK" ON "SALES_PURCHASE_INV_DTL" ("DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PURCHASE_ORDER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PURCHASE_ORDER_PK" ON "SALES_PURCHASE_ORDER" ("ORDER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PURCHASE_ORDER_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PURCHASE_ORDER_DTL_PK" ON "SALES_PURCHASE_ORDER_DTL" ("DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PUR_RETURN_INV_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PUR_RETURN_INV_PK" ON "SALES_PUR_RETURN_INV" ("INVOICE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_PUR_RETURN_INV_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_PUR_RETURN_INV_DTL_PK" ON "SALES_PUR_RETURN_INV_DTL" ("DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_RENT_INV_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_RENT_INV_PK" ON "SALES_RENT_INV" ("INVOICE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_RENT_INV_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_RENT_INV_DTL_PK" ON "SALES_RENT_INV_DTL" ("DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_RETURN_INV_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_RETURN_INV_PK" ON "SALES_RETURN_INV" ("INVOICE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SALES_RETURN_INV_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SALES_RETURN_INV_DTL_PK" ON "SALES_RETURN_INV_DTL" ("DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index ROLE_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROLE_ID_PK" ON "SETUP_APP_ROLE" ("ROLE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index USER_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USER_ID_PK" ON "SETUP_APP_USER" ("USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_APP_USER_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_APP_USER_UK1" ON "SETUP_APP_USER" ("USER_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_BANK_ACC_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_BANK_ACC_PK" ON "SETUP_BANK_EXT_ACC" ("BANK_ACC_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_BRANCH_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_BRANCH_PK" ON "SETUP_BRANCH" ("BRANCH_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_CITY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_CITY_PK" ON "SETUP_CITY" ("CITY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_COUNTRY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_COUNTRY_PK" ON "SETUP_COUNTRY" ("COUNTRY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index CURRENCY_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CURRENCY_ID_PK" ON "SETUP_CURRENCY" ("CURRENCY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_PROD_GROUP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_PROD_GROUP_PK" ON "SETUP_PROD_GROUP" ("GROUP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_REGION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_REGION_PK" ON "SETUP_REGION" ("REGION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_TREASURY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_TREASURY_PK" ON "SETUP_SAFE" ("SAFE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_STORE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_STORE_PK" ON "SETUP_STORE" ("STORE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_TAX_GROUP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_TAX_GROUP_PK" ON "SETUP_TAX_GROUP" ("GROUP_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SETUP_UNIT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SETUP_UNIT_PK" ON "SETUP_UNIT" ("UNIT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STORE_FIRST_PERIOD_STOCK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORE_FIRST_PERIOD_STOCK_PK" ON "STORE_FIRST_PERIOD_STOCK" ("INVOICE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STORE_FIRST_PERIOD_STOCK_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORE_FIRST_PERIOD_STOCK_DTL_PK" ON "STORE_FIRST_PERIOD_STOCK_DTL" ("DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STORE_STOCKIN_ORDER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORE_STOCKIN_ORDER_PK" ON "STORE_STOCKIN_ORDER" ("ORDER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STORE_STOCKIN_ORDER_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORE_STOCKIN_ORDER_DTL_PK" ON "STORE_STOCKIN_ORDER_DTL" ("DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STORE_STOCKOUT_ORDER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORE_STOCKOUT_ORDER_PK" ON "STORE_STOCKOUT_ORDER" ("ORDER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STORE_STOCKOUT_ORDER_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORE_STOCKOUT_ORDER_DTL_PK" ON "STORE_STOCKOUT_ORDER_DTL" ("DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STORE_TRANSFER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORE_TRANSFER_PK" ON "STORE_TRANSFER" ("TRANSFER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index STORE_TRANSFER_DTL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STORE_TRANSFER_DTL_PK" ON "STORE_TRANSFER_DTL" ("DTL_ID") 
  ;
--------------------------------------------------------
--  DDL for Trigger BI_ACC_JOURNAL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BI_ACC_JOURNAL" 
  before insert on "ACC_VOUCHER"               
  for each row  
begin   
  if :NEW."ACC_VOUCHER_ID" is null then 
    select "ACC_JOURNAL_SEQ1".nextval into :NEW."ACC_VOUCHER_ID" from sys.dual; 
  end if; 
end;
/
ALTER TRIGGER "BI_ACC_JOURNAL" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BI_ACC_JOURNAL_DTL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BI_ACC_JOURNAL_DTL" 
  before insert on "ACC_VOUCHER_DTL"               
  for each row  
begin   
  if :NEW."ACC_VOUCHER_DTL_ID" is null then 
    select "ACC_JOURNAL_SEQ".nextval into :NEW."ACC_VOUCHER_DTL_ID" from sys.dual; 
  end if; 
end;
/
ALTER TRIGGER "BI_ACC_JOURNAL_DTL" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SETUP_BRANCH_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "SETUP_BRANCH_TRG" 
BEFORE INSERT ON SETUP_BRANCH 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SETUP_BRANCH_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SETUP_BRANCH_TRG1
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "SETUP_BRANCH_TRG1" 
BEFORE INSERT ON SETUP_BRANCH 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.BRANCH_ID IS NULL THEN
      SELECT SETUP_BRANCH_SEQ1.NEXTVAL INTO :NEW.BRANCH_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SETUP_BRANCH_TRG1" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BI_ACC_JOURNAL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BI_ACC_JOURNAL" 
  before insert on "ACC_VOUCHER"               
  for each row  
begin   
  if :NEW."ACC_VOUCHER_ID" is null then 
    select "ACC_JOURNAL_SEQ1".nextval into :NEW."ACC_VOUCHER_ID" from sys.dual; 
  end if; 
end;
/
ALTER TRIGGER "BI_ACC_JOURNAL" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BI_ACC_JOURNAL_DTL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "BI_ACC_JOURNAL_DTL" 
  before insert on "ACC_VOUCHER_DTL"               
  for each row  
begin   
  if :NEW."ACC_VOUCHER_DTL_ID" is null then 
    select "ACC_JOURNAL_SEQ".nextval into :NEW."ACC_VOUCHER_DTL_ID" from sys.dual; 
  end if; 
end;
/
ALTER TRIGGER "BI_ACC_JOURNAL_DTL" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SETUP_BRANCH_TRG1
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "SETUP_BRANCH_TRG1" 
BEFORE INSERT ON SETUP_BRANCH 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.BRANCH_ID IS NULL THEN
      SELECT SETUP_BRANCH_SEQ1.NEXTVAL INTO :NEW.BRANCH_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SETUP_BRANCH_TRG1" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SETUP_BRANCH_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "SETUP_BRANCH_TRG" 
BEFORE INSERT ON SETUP_BRANCH 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SETUP_BRANCH_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Procedure GET_USER_INFO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "GET_USER_INFO" (
    p_user_id    OUT  NUMBER,
    p_user_name  IN   VARCHAR2
) AS
BEGIN
    SELECT
        user_id
    INTO p_user_id
    FROM
        SETUP_app_user
    WHERE
        UPPER(user_name) = UPPER(p_user_name);
EXCEPTION
WHEN OTHERS THEN
NULL;

END get_user_info;

/
--------------------------------------------------------
--  DDL for Procedure SAVEFILE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "SAVEFILE" (
     FileContent IN OUT NOCOPY BLOB
   , FolderName IN VARCHAR2
   , FileName IN VARCHAR2)
IS
    BUFFER RAW(1024);
    OFFSET PLS_INTEGER := 1;
    FileLength PLS_INTEGER;
    amount PLS_INTEGER := 1024;
    fhandle UTL_FILE.FILE_TYPE;
BEGIN
    FileLength := DBMS_LOB.GETLENGTH(FileContent);
    fhandle := UTL_FILE.FOPEN(FolderName, FileName, 'wb');         
    LOOP
        EXIT WHEN OFFSET > FileLength;
        DBMS_LOB.READ(FileContent, amount, OFFSET, BUFFER);
        UTL_FILE.PUT_RAW(fhandle, BUFFER, TRUE);
        OFFSET := OFFSET + amount;
    END LOOP;
    UTL_FILE.FCLOSE (fhandle);
EXCEPTION
    WHEN OTHERS THEN
        IF UTL_FILE.IS_OPEN(fhandle) THEN
            UTL_FILE.FCLOSE(fhandle);
        END IF;
    RAISE;
END SaveFile;

/
--------------------------------------------------------
--  DDL for Procedure VALID_USER_NAME
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "VALID_USER_NAME" (
        p_mssg_warning    OUT  VARCHAR2,
        p_user_name  IN   VARCHAR2
    ) AS
    BEGIN
        SELECT
            user_name
        INTO p_mssg_warning
        FROM
            SETUP_app_user
        WHERE
            UPPER(user_name) = UPPER(p_user_name);
    EXCEPTION
    WHEN OTHERS THEN

    NULL;

END valid_user_name;

/
--------------------------------------------------------
--  DDL for Package ACC_ACCOUNTS_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ACC_ACCOUNTS_TAPI" IS
    PROCEDURE ADD_RECORD (
        P_ACCOUNT_NAME_AR  IN  ACC_ACCOUNTS.ACCOUNT_NAME_AR%TYPE DEFAULT NULL,
        P_ACCOUNT_NAME_EN  IN  ACC_ACCOUNTS.ACCOUNT_NAME_EN%TYPE DEFAULT NULL,
        P_ACCOUNT_TYPE     IN  ACC_ACCOUNTS.ACCOUNT_TYPE%TYPE DEFAULT NULL,
        P_ACCOUNT_ID       IN  ACC_ACCOUNTS.ACCOUNT_ID%TYPE,
        P_ACCOUNT_PARENT   IN  ACC_ACCOUNTS.ACCOUNT_PARENT%TYPE DEFAULT NULL,
        P_SUB_ACCOUNT      IN  ACC_ACCOUNTS.SUB_ACCOUNT%TYPE DEFAULT 0,
        P_COMPANY_ID       IN  ACC_ACCOUNTS.COMPANY_ID%TYPE,
        P_ACCOUNT_NATURE   IN  ACC_ACCOUNTS.ACCOUNT_NATURE%TYPE DEFAULT NULL
    );

    PROCEDURE UPDATE_RECORD (
        P_ACCOUNT_NAME_AR  IN  ACC_ACCOUNTS.ACCOUNT_NAME_AR%TYPE DEFAULT NULL,
        P_ACCOUNT_NAME_EN  IN  ACC_ACCOUNTS.ACCOUNT_NAME_EN%TYPE DEFAULT NULL,
        P_ACCOUNT_TYPE     IN  ACC_ACCOUNTS.ACCOUNT_TYPE%TYPE DEFAULT NULL,
        P_ACCOUNT_ID       IN  ACC_ACCOUNTS.ACCOUNT_ID%TYPE,
        P_ACCOUNT_PARENT   IN  ACC_ACCOUNTS.ACCOUNT_PARENT%TYPE DEFAULT NULL,
        P_SUB_ACCOUNT      IN  ACC_ACCOUNTS.SUB_ACCOUNT%TYPE DEFAULT 0,
        P_COMPANY_ID       IN  ACC_ACCOUNTS.COMPANY_ID%TYPE,
        P_ACCOUNT_NATURE   IN  ACC_ACCOUNTS.ACCOUNT_NATURE%TYPE DEFAULT NULL
    );

END ACC_ACCOUNTS_TAPI;

/
--------------------------------------------------------
--  DDL for Package ACC_ACCOUNTS_XAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ACC_ACCOUNTS_XAPI" IS
   FUNCTION GET_ACCOUNT_NO(
      P_COMPANY_ID   IN NUMBER,
      P_PARENT_ID  IN NUMBER
       )RETURN NUMBER;

 PROCEDURE ADD_CLIENT_ACCOUNT(
     P_CLIENT_ID  NUMBER
   );

 PROCEDURE ADD_PROVIDER_ACCOUNT(
     P_PROVIDER_ID  NUMBER
   );
END ACC_ACCOUNTS_XAPI;

/
--------------------------------------------------------
--  DDL for Package ACC_JOURNAL_DTL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ACC_JOURNAL_DTL_TAPI" IS
    PROCEDURE INSERT_JOURNAL_DTL (
        P_ACCOUNT_ID      IN      ACC_JOURNAL_DTL.ACCOUNT_ID%TYPE DEFAULT NULL,
        P_CREDIT          IN      ACC_JOURNAL_DTL.CREDIT%TYPE DEFAULT NULL,
        P_DEBIT           IN      ACC_JOURNAL_DTL.DEBIT%TYPE DEFAULT NULL,
        P_NOTE            IN      ACC_JOURNAL_DTL.NOTE%TYPE DEFAULT NULL,
        P_COST_CNTR_ID    IN      ACC_JOURNAL_DTL.COST_CNTR_ID%TYPE DEFAULT NULL,
        P_REF_NO          IN      ACC_JOURNAL_DTL.REF_NO%TYPE DEFAULT NULL,
        P_JOURNAL_ID      IN      ACC_JOURNAL_DTL.JOURNAL_ID%TYPE DEFAULT NULL,
        P_JOURNAL_DTL_ID  IN OUT  ACC_JOURNAL_DTL.JOURNAL_DTL_ID%TYPE
    );

    PROCEDURE UPDATE_JOURNAL_DTL (
        P_ACCOUNT_ID      IN  ACC_JOURNAL_DTL.ACCOUNT_ID%TYPE DEFAULT NULL,
        P_CREDIT          IN  ACC_JOURNAL_DTL.CREDIT%TYPE DEFAULT NULL,
        P_DEBIT           IN  ACC_JOURNAL_DTL.DEBIT%TYPE DEFAULT NULL,
        P_NOTE            IN  ACC_JOURNAL_DTL.NOTE%TYPE DEFAULT NULL,
        P_COST_CNTR_ID    IN  ACC_JOURNAL_DTL.COST_CNTR_ID%TYPE DEFAULT NULL,
        P_REF_NO          IN  ACC_JOURNAL_DTL.REF_NO%TYPE DEFAULT NULL,
        P_JOURNAL_DTL_ID  IN  ACC_JOURNAL_DTL.JOURNAL_DTL_ID%TYPE,
        P_JOURNAL_ID      IN  ACC_JOURNAL_DTL.JOURNAL_ID%TYPE DEFAULT NULL
    );

    PROCEDURE DELETE_JOURNAL_DTL (
        P_JOURNAL_DTL_ID IN ACC_JOURNAL_DTL.JOURNAL_DTL_ID%TYPE
    );

END ACC_JOURNAL_DTL_TAPI;

/
--------------------------------------------------------
--  DDL for Package ACC_JOURNAL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ACC_JOURNAL_TAPI" IS
    PROCEDURE INSERT_JOURNAL (
        P_JOURNAL_DATE    IN      ACC_JOURNAL.JOURNAL_DATE%TYPE DEFAULT NULL,
        P_NOTE            IN      ACC_JOURNAL.NOTE%TYPE DEFAULT NULL,
        P_COMPANY_ID      IN      NUMBER,
        P_JOURNAL_TYPE    IN      NUMBER DEFAULT 1,
        P_ACC_JOURNAL_ID  IN OUT  ACC_JOURNAL.ACC_JOURNAL_ID%TYPE
    );

    PROCEDURE UPDATE_JOURNAL (
        P_ACC_JOURNAL_ID  IN  ACC_JOURNAL.ACC_JOURNAL_ID%TYPE,
        P_JOURNAL_DATE    IN  ACC_JOURNAL.JOURNAL_DATE%TYPE DEFAULT NULL,
        P_COMPANY_ID      IN  NUMBER,
        P_NOTE            IN  ACC_JOURNAL.NOTE%TYPE DEFAULT NULL
    );

    PROCEDURE POST_JOURNAL (
        P_ACC_JOURNAL_ID IN ACC_JOURNAL.ACC_JOURNAL_ID%TYPE
    );

    PROCEDURE MAKE_JOURNAL (
        P_JOURNAL_TABLE   IN   JOURNAL_TABLE,
        P_JOURNAL_DATE    IN   ACC_JOURNAL.JOURNAL_DATE%TYPE DEFAULT SYSDATE,
        P_COMPANY_ID      IN   NUMBER,
        P_JOURNAL_TYPE    IN   NUMBER DEFAULT 1,
        P_JOURNAL_NOTE    IN   NVARCHAR2,
        P_ACC_JOURNAL_ID  OUT  NUMBER
    );

END ACC_JOURNAL_TAPI;

/
--------------------------------------------------------
--  DDL for Package ACC_LEDGER_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ACC_LEDGER_TAPI" IS
    PROCEDURE ADD_RECORD (
        P_CREDIT        IN      ACC_LEDGER.CREDIT%TYPE,
        P_DEBIT         IN      ACC_LEDGER.DEBIT%TYPE,
        P_ACCOUNT_ID    IN      ACC_LEDGER.ACCOUNT_ID%TYPE,
        P_JOURNAL_TYPE  IN      ACC_LEDGER.JOURNAL_TYPE%TYPE,
        P_JOURNAL_ID    IN      ACC_LEDGER.JOURNAL_ID%TYPE,
        P_JOURNAL_DATE  IN      ACC_LEDGER.JOURNAL_DATE%TYPE,
        P_COMPANY_ID    IN      NUMBER,
        P_NOTE          IN      ACC_LEDGER.NOTE%TYPE DEFAULT NULL,
        P_COST_CNTR_ID  IN      ACC_LEDGER.COST_CNTR_ID%TYPE DEFAULT NULL,
        P_LEDGER_ID     IN OUT  ACC_LEDGER.LEDGER_ID%TYPE
    );

END ACC_LEDGER_TAPI;

/
--------------------------------------------------------
--  DDL for Package ACC_VOUCHER_DTL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ACC_VOUCHER_DTL_TAPI" IS
    PROCEDURE INSERT_DTL (
        P_ACCOUNT_ID      IN  ACC_VOUCHER_DTL.ACCOUNT_ID%TYPE DEFAULT NULL,
        P_AMOUNT          IN  ACC_VOUCHER_DTL.AMOUNT%TYPE DEFAULT NULL,
        P_ACC_VOUCHER_ID  IN  ACC_VOUCHER_DTL.ACC_VOUCHER_ID%TYPE DEFAULT NULL,
        P_NOTE            IN  ACC_VOUCHER_DTL.NOTE%TYPE DEFAULT NULL,
        P_TAX_RATE        IN  ACC_VOUCHER_DTL.TAX_RATE%TYPE DEFAULT NULL,
        P_TAX_AMOUNT      IN  ACC_VOUCHER_DTL.TAX_AMOUNT%TYPE DEFAULT NULL,
        P_REF_ID          IN  ACC_VOUCHER_DTL.REF_ID%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT    IN  ACC_VOUCHER_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CNTR_ID    IN  ACC_VOUCHER_DTL.COST_CNTR_ID%TYPE DEFAULT NULL
    );

    PROCEDURE UPDATE_DTL (
        P_ACCOUNT_ID          IN  ACC_VOUCHER_DTL.ACCOUNT_ID%TYPE DEFAULT NULL,
        P_AMOUNT              IN  ACC_VOUCHER_DTL.AMOUNT%TYPE DEFAULT NULL,
        P_ACC_VOUCHER_DTL_ID  IN  ACC_VOUCHER_DTL.ACC_VOUCHER_DTL_ID%TYPE,
        P_ACC_VOUCHER_ID      IN  ACC_VOUCHER_DTL.ACC_VOUCHER_ID%TYPE DEFAULT NULL,
        P_NOTE                IN  ACC_VOUCHER_DTL.NOTE%TYPE DEFAULT NULL,
        P_TAX_RATE            IN  ACC_VOUCHER_DTL.TAX_RATE%TYPE DEFAULT NULL,
        P_TAX_AMOUNT          IN  ACC_VOUCHER_DTL.TAX_AMOUNT%TYPE DEFAULT NULL,
        P_REF_ID              IN  ACC_VOUCHER_DTL.REF_ID%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT        IN  ACC_VOUCHER_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CNTR_ID        IN  ACC_VOUCHER_DTL.COST_CNTR_ID%TYPE DEFAULT NULL
    );

    PROCEDURE DELETE_DTL (
        P_ACC_VOUCHER_DTL_ID IN ACC_VOUCHER_DTL.ACC_VOUCHER_DTL_ID%TYPE
    );

    PROCEDURE UPDATE_DTL_BY_VOUCHER_ID (
        P_ACCOUNT_ID      IN  ACC_VOUCHER_DTL.ACCOUNT_ID%TYPE DEFAULT NULL,
        P_AMOUNT          IN  ACC_VOUCHER_DTL.AMOUNT%TYPE DEFAULT NULL,
        P_ACC_VOUCHER_ID  IN  ACC_VOUCHER_DTL.ACC_VOUCHER_ID%TYPE DEFAULT NULL
    );

END ACC_VOUCHER_DTL_TAPI;

/
--------------------------------------------------------
--  DDL for Package ACC_VOUCHER_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ACC_VOUCHER_TAPI" IS
    PROCEDURE INSERT_VOUCHER (
        P_AMOUNT          IN      ACC_VOUCHER.AMOUNT%TYPE DEFAULT NULL,
        P_ACCOUNT_ID      IN      ACC_VOUCHER.ACCOUNT_ID%TYPE DEFAULT NULL,
        P_PAID_TO         IN      ACC_VOUCHER.PAID_TO%TYPE DEFAULT NULL,
        P_REF_ID          IN      ACC_VOUCHER.REF_ID%TYPE DEFAULT NULL,
        P_PAYMENT_METHOD  IN      ACC_VOUCHER.PAYMENT_METHOD%TYPE DEFAULT NULL,
        P_VOUCHER_DATE    IN      ACC_VOUCHER.VOUCHER_DATE%TYPE DEFAULT NULL,
        P_VOUCHER_TYPE    IN      ACC_VOUCHER.VOUCHER_TYPE%TYPE DEFAULT NULL,
        P_NOTE            IN      ACC_VOUCHER.NOTE%TYPE DEFAULT NULL,
        P_COST_CNTR_ID    IN      ACC_VOUCHER.COST_CNTR_ID%TYPE DEFAULT NULL,
        P_CHECK_DATE      IN      ACC_VOUCHER.CHECK_DATE%TYPE DEFAULT NULL,
        P_CHECK_NO        IN      ACC_VOUCHER.CHECK_NO%TYPE DEFAULT NULL,
        P_TOTAL_VAT       IN      ACC_VOUCHER.TOTAL_VAT%TYPE DEFAULT NULL,
        P_COMPANY_ID      IN      ACC_VOUCHER.COMPANY_ID%TYPE,
        P_ACC_VOUCHER_ID  IN OUT  ACC_VOUCHER.ACC_VOUCHER_ID%TYPE
    );

    PROCEDURE UPDATE_VOUCHER (
        P_AMOUNT          IN  ACC_VOUCHER.AMOUNT%TYPE DEFAULT NULL,
        P_ACCOUNT_ID      IN  ACC_VOUCHER.ACCOUNT_ID%TYPE DEFAULT NULL,
        P_PAID_TO         IN  ACC_VOUCHER.PAID_TO%TYPE DEFAULT NULL,
        P_ACC_VOUCHER_ID  IN  ACC_VOUCHER.ACC_VOUCHER_ID%TYPE,
        P_REF_ID          IN  ACC_VOUCHER.REF_ID%TYPE DEFAULT NULL,
        P_VOUCHER_DATE    IN  ACC_VOUCHER.VOUCHER_DATE%TYPE DEFAULT NULL,
        P_VOUCHER_TYPE    IN  ACC_VOUCHER.VOUCHER_TYPE%TYPE DEFAULT NULL,
        P_NOTE            IN  ACC_VOUCHER.NOTE%TYPE DEFAULT NULL,
        P_PAYMENT_METHOD  IN  ACC_VOUCHER.PAYMENT_METHOD%TYPE DEFAULT NULL,
        P_COST_CNTR_ID    IN  ACC_VOUCHER.COST_CNTR_ID%TYPE DEFAULT NULL,
        P_CHECK_DATE      IN  ACC_VOUCHER.CHECK_DATE%TYPE DEFAULT NULL,
        P_CHECK_NO        IN  ACC_VOUCHER.CHECK_NO%TYPE DEFAULT NULL,
        P_TOTAL_VAT       IN      ACC_VOUCHER.TOTAL_VAT%TYPE DEFAULT NULL,
        P_COMPANY_ID      IN  ACC_VOUCHER.COMPANY_ID%TYPE
    );

    PROCEDURE POST_CASH_OUT_VOUCHER (
        P_ACC_VOUCHER_ID IN ACC_VOUCHER.ACC_VOUCHER_ID%TYPE
    );

    PROCEDURE POST_CASH_IN_VOUCHER (
        P_ACC_VOUCHER_ID IN ACC_VOUCHER.ACC_VOUCHER_ID%TYPE
    );

END ACC_VOUCHER_TAPI;

/
--------------------------------------------------------
--  DDL for Package ADMIN_COMPANY_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ADMIN_COMPANY_TAPI" is
--------------------------------------------------------------
-- create procedure for table ADMIN_COMPANY
--------------------------------------------------------------
   procedure INSERT_ADMIN_COMPANY (
      P_COMPANY_ID  in OUT ADMIN_COMPANY.COMPANY_ID %TYPE                    ,
      P_NAME_AR     in ADMIN_COMPANY.NAME_AR    %TYPE                    default null,
      P_NAME_EN     in ADMIN_COMPANY.NAME_EN    %TYPE                    default null,
      P_MOBILE_NO   in ADMIN_COMPANY.MOBILE_NO  %TYPE                    default null,
      P_TEL_NO      in ADMIN_COMPANY.TEL_NO     %TYPE                    default null,
      P_FAX         in ADMIN_COMPANY.FAX        %TYPE                    default null,
      P_EMAIL       in ADMIN_COMPANY.EMAIL      %TYPE                    default null,
      P_TAX_NO      in ADMIN_COMPANY.TAX_NO     %TYPE                    default null,
      P_COUNTRY_ID  in ADMIN_COMPANY.COUNTRY_ID %TYPE                    default null,
      P_CITY_ID     in ADMIN_COMPANY.CITY_ID    %TYPE                    default null,
      P_REGION_ID   in ADMIN_COMPANY.REGION_ID  %TYPE                    default null,
      P_BUILDING_NO in ADMIN_COMPANY.BUILDING_NO%TYPE                    default null,
      P_SREET       in ADMIN_COMPANY.SREET      %TYPE                    default null,
      P_POST_CODE   in ADMIN_COMPANY.POST_CODE  %TYPE                    default null,
      P_NOTE        in ADMIN_COMPANY.NOTE       %TYPE                    default null,
      P_STATUS      in ADMIN_COMPANY.STATUS     %TYPE                    default null
   );
--------------------------------------------------------------
-- update procedure for table ADMIN_COMPANY
--------------------------------------------------------------
   procedure UPDATE_ADMIN_COMPANY (
      P_COMPANY_ID  in ADMIN_COMPANY.COMPANY_ID %TYPE  ,
      P_NAME_AR     in ADMIN_COMPANY.NAME_AR    %TYPE                     default null,
      P_NAME_EN     in ADMIN_COMPANY.NAME_EN    %TYPE                     default null,
      P_MOBILE_NO   in ADMIN_COMPANY.MOBILE_NO  %TYPE                     default null,
      P_TEL_NO      in ADMIN_COMPANY.TEL_NO     %TYPE                     default null,
      P_FAX         in ADMIN_COMPANY.FAX        %TYPE                     default null,
      P_EMAIL       in ADMIN_COMPANY.EMAIL      %TYPE                     default null,
      P_TAX_NO      in ADMIN_COMPANY.TAX_NO     %TYPE                     default null,
      P_COUNTRY_ID  in ADMIN_COMPANY.COUNTRY_ID %TYPE                     default null,
      P_CITY_ID     in ADMIN_COMPANY.CITY_ID    %TYPE                     default null,
      P_REGION_ID   in ADMIN_COMPANY.REGION_ID  %TYPE                     default null,
      P_BUILDING_NO in ADMIN_COMPANY.BUILDING_NO%TYPE                     default null,
      P_SREET       in ADMIN_COMPANY.SREET      %TYPE                     default null,
      P_POST_CODE   in ADMIN_COMPANY.POST_CODE  %TYPE                     default null,
      P_NOTE        in ADMIN_COMPANY.NOTE       %TYPE                     default null,
      P_STATUS      in ADMIN_COMPANY.STATUS     %TYPE                     default null
   );
--------------------------------------------------------------
-- delete procedure for table ADMIN_COMPANY
--------------------------------------------------------------
   procedure DELELTE_ADMIN_COMPANY (
      P_COMPANY_ID   in ADMIN_COMPANY.COMPANY_ID %TYPE 
   );

end ADMIN_COMPANY_TAPI;

/
--------------------------------------------------------
--  DDL for Package ADMIN_USER_SESSION_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ADMIN_USER_SESSION_TAPI" IS
    PROCEDURE INS (
        P_USER_ID                IN   ADMIN_USER_SESSION.USER_ID%TYPE,
        P_COMPANY_ID             IN   ADMIN_USER_SESSION.COMPANY_ID%TYPE,
        P_USERNAME               IN   NVARCHAR2,
        P_USER_PREFERED_LANG     IN  VARCHAR2,
        P_USER_PREFERED_LANG_ID  IN  NUMBER,
        P_TOKEN                  OUT  ADMIN_USER_SESSION.TOKEN%TYPE,
        P_SESSION_ID             OUT  ADMIN_USER_SESSION.SESSION_ID%TYPE
    );

    PROCEDURE UPD (
        P_CREATED_AT  IN  ADMIN_USER_SESSION.CREATED_AT%TYPE DEFAULT NULL,
        P_EXPIRES     IN  ADMIN_USER_SESSION.EXPIRES%TYPE DEFAULT NULL,
        P_USER_ID     IN  ADMIN_USER_SESSION.USER_ID%TYPE DEFAULT NULL,
        P_SESSION_ID  IN  ADMIN_USER_SESSION.SESSION_ID%TYPE,
        P_TOKEN       IN  ADMIN_USER_SESSION.TOKEN%TYPE DEFAULT NULL,
        P_COMPANY_ID  IN  ADMIN_USER_SESSION.COMPANY_ID%TYPE DEFAULT NULL
    );

    PROCEDURE DEL (
        P_SESSION_ID IN ADMIN_USER_SESSION.SESSION_ID%TYPE
    );

END ADMIN_USER_SESSION_TAPI;

/
--------------------------------------------------------
--  DDL for Package AUTH
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "AUTH" AS
    FUNCTION HAS_PAGE_ACCESS (
        P_USER_ID  NUMBER,
        P_PAGE_ID  NUMBER
    ) RETURN BOOLEAN;

    FUNCTION HAS_ITEM_ACCESS (
        P_USER_ID       NUMBER,
        P_PAGE_ID       NUMBER,
        P_COMPONENT_ID  NUMBER
    ) RETURN BOOLEAN;

    FUNCTION LOGIN (
        P_USERNAME  NVARCHAR2,
        P_PASSWORD  NVARCHAR2
    ) RETURN BOOLEAN;

    PROCEDURE SET_USER_INFO (
        P_USERNAME               IN   NVARCHAR2,
        P_USER_PREFERED_LANG     OUT  VARCHAR2,
        P_USER_PREFERED_LANG_ID  OUT  NUMBER,
        P_COMPANY_ID             OUT  NUMBER,
        P_USER_ID                OUT  NUMBER
    );

END AUTH;

/
--------------------------------------------------------
--  DDL for Package COMPUTE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "COMPUTE" AS
    FUNCTION CALC_INV (
        P_QUANTITY             NUMBER,
        P_BASE_PRICE           NUMBER,
        P_PRICE_WITH_VAT       NUMBER,
        P_TOTAL_PRICE          NUMBER,
        P_VAT_PERCENTAGE       NUMBER,
        P_DISCOUNT_PERCENTAGE  NUMBER
    ) RETURN INV_DTL_TBL;

    FUNCTION CALC_VAT (
        P_BASE_AMOUNT      NUMBER,
        P_AMOUNT_WITH_VAT  NUMBER,
        P_VAT_PERCENTAGE   NUMBER
    ) RETURN AMOUNT_VAT_TBL;

END COMPUTE;

/
--------------------------------------------------------
--  DDL for Package DATA_VALIDATION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "DATA_VALIDATION" AS
    PROCEDURE BRANCH_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE BANK_ACCOUNT_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE CURRENCY_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE UNIT_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE PRODUCT_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE PRODUCT_UNIT_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE PRODUCT_BARCODE_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE COUNTRY_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE CITY_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE REGION_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE PURCHASE_INV_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE PUR_RETURN_INV_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE FIRST_PERIOD_STOCK_INV_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE STOCKOUT_ORDER_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE CUSTOMER_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE USER_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE ROLE_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE COMPANY_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE SETUP_SAFE_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE SETUP_STORE_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE SETUP_TAX_GROUP_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE PROVIDER_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE RECEIPT_VOUCHER_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    FUNCTION GET_ERROR_MSG (
        P_MSG_ID  IN  NUMBER,
        P_LANG    IN  NUMBER
    ) RETURN VARCHAR2;

    PROCEDURE TRANSFER_ORDER_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE SALES_RETURN_INV_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE STOCKIN_ORDER_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE SETUP_PROD_GROUP_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE SALES_INV_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

    PROCEDURE SALES_RENT_INV_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

  PROCEDURE PURCHASE_ORDER_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    );

END;

/
--------------------------------------------------------
--  DDL for Package FILE_UTILE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "FILE_UTILE" AS
    PROCEDURE SAVE_FILE (
        P_FILE_CONTENT  IN OUT NOCOPY BLOB,
        P_FOLDER_NAME   IN  VARCHAR2,
        P_FILE_NAME     IN  VARCHAR2
    );

    PROCEDURE DELETE_FILE (
        P_FOLDER_NAME  IN  VARCHAR2,
        P_FILE_NAME    IN  VARCHAR2
    );

END FILE_UTILE;

/
--------------------------------------------------------
--  DDL for Package INV_JOURNAL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "INV_JOURNAL" AS
    PROCEDURE SALE_INV_JOURNAL (
        P_INVOICE_ID IN NUMBER
    );

    PROCEDURE SALE_RETURN_INV_JOURNAL (
        P_INVOICE_ID IN NUMBER
    );

    PROCEDURE PUR_INV_JOURNAL (
        P_INVOICE_ID IN NUMBER
    );

    PROCEDURE PUR_RETURN_INV_JOURNAL (
        P_INVOICE_ID IN NUMBER
    );

    PROCEDURE STOCKIN_ORDER_JOURNAL (
        P_ORDER_ID IN NUMBER
    );

    PROCEDURE STOCKOUT_ORDER_JOURNAL (
        P_ORDER_ID IN NUMBER
    );

    PROCEDURE FIRST_PERIOD_STOCK_INV_JOURNAL (
        P_INVOICE_ID IN NUMBER
    );

END INV_JOURNAL;

/
--------------------------------------------------------
--  DDL for Package MAKE_ID
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "MAKE_ID" AS
    FUNCTION GET_PURCHASE_INV_ID (
        P_COMPANY_ID  NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER;

    FUNCTION GET_RENT_INV_ID (
        P_COMPANY_ID  NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER;

    FUNCTION GET_PUR_RETURN_INV_ID (
        P_COMPANY_ID  NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER;

    FUNCTION GET_FIRST_PERIOD_STOCK_INV_ID (
        P_COMPANY_ID  NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER;

    FUNCTION GET_PURCHASE_ORDER_ID (
        P_COMPANY_ID  NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER;

    FUNCTION GET_STOCKOUT_ORDER_ID (
        P_COMPANY_ID  NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER;

    FUNCTION GET_SALES_INV_ID (
        P_COMPANY_ID  NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER;

    FUNCTION GET_SALES_RETURN_INV_ID (
        P_COMPANY_ID  NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER;

    FUNCTION GET_STOCKIN_ORDER_ID (
        P_COMPANY_ID  NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER;

    FUNCTION GET_STORE_TRANSFER_ID (
        P_COMPANY_ID  NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER;

END MAKE_ID;

/
--------------------------------------------------------
--  DDL for Package MAKE_NO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "MAKE_NO" AS
    FUNCTION GET_PURCHASE_INV_NO (
        P_COMPANY_ID  NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER;

    FUNCTION GET_RENT_INV_NO (
        P_COMPANY_ID  NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER;

    FUNCTION GET_PUR_RETURN_INV_NO (
        P_COMPANY_ID  NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER;

    FUNCTION GET_FIRST_PERIOD_STOCK_INV_NO (
        P_COMPANY_ID  NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER;

    FUNCTION GET_PURCHASE_ORDER_NO (
        P_COMPANY_ID  NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER;

    FUNCTION GET_STOCKOUT_ORDER_NO (
        P_COMPANY_ID  NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER;

    FUNCTION GET_SALES_INV_NO (
        P_COMPANY_ID  NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER;

    FUNCTION GET_SALES_RETURN_INV_NO (
        P_COMPANY_ID  NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER;

    FUNCTION GET_STOCKIN_ORDER_NO (
        P_COMPANY_ID  NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER;

    FUNCTION GET_STORE_TRANSFER_NO (
        P_COMPANY_ID  NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER;

END MAKE_NO;

/
--------------------------------------------------------
--  DDL for Package MAKE_NOTE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "MAKE_NOTE" AS
    FUNCTION GET_JOURNAL_NOTE (
        P_LANG_ID       NUMBER,
        P_JOURNAL_TYPE  NUMBER,
        P_INVOICE_TYPE  NUMBER,
        P_REF_NO        NUMBER,
        P_FOR_VAT       NUMBER DEFAULT 0,
        P_CLIENT        VARCHAR2
    ) RETURN VARCHAR2;

    FUNCTION GET_STOCK_JOURNAL_NOTE (
        P_LANG_ID       NUMBER,
        P_JOURNAL_TYPE  NUMBER,
        P_REF_NO        NUMBER
    ) RETURN VARCHAR2;

END MAKE_NOTE;

/
--------------------------------------------------------
--  DDL for Package PWD_SECURITY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PWD_SECURITY" 
AUTHID DEFINER 
AS
   --توليد HASH لكلمة المرور
   FUNCTION GET_PWD_HMAC(P_PWD_PLN   NVARCHAR2)
        RETURN RAW;

   --التحقق من سلامة كلمة المرور
   FUNCTION VRFY_PWD_HMAC(
               P_PWD_PLN     NVARCHAR2,
               P_PWD_HMAC    RAW
               )RETURN NUMBER;

END PWD_SECURITY;

/
--------------------------------------------------------
--  DDL for Package SALES_INV_DTL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SALES_INV_DTL_TAPI" IS
    PROCEDURE INSERT_SALES_INV_DTL (
        P_PRICE                      IN  SALES_INV_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY                   IN  SALES_INV_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_DISCOUNT_VALUE             IN  SALES_INV_DTL.DISCOUNT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_ID                 IN  SALES_INV_DTL.PRODUCT_ID%TYPE DEFAULT NULL,
        P_PRE_DISCOUNT_VAT_VALUE     IN  SALES_INV_DTL.PRE_DISCOUNT_VAT_VALUE%TYPE DEFAULT NULL,
        P_INVOICE_ID                 IN  SALES_INV_DTL.INVOICE_ID%TYPE DEFAULT NULL,
        P_VAT_PERCENTAGE             IN  SALES_INV_DTL.VAT_PERCENTAGE%TYPE DEFAULT NULL,
        P_TOTAL_PRICE                IN  SALES_INV_DTL.TOTAL_PRICE%TYPE DEFAULT NULL,
        P_VAT_VALUE                  IN  SALES_INV_DTL.VAT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID            IN  SALES_INV_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_DISCOUNT_PERCENTAGE        IN  SALES_INV_DTL.DISCOUNT_PERCENTAGE%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_PRICE  IN  SALES_INV_DTL.POST_DISCOUNT_TOTAL_PRICE%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT               IN  SALES_INV_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL
    );

    PROCEDURE UPDATE_SALES_INV_DTL (
        P_INVOICE_DTL_ID             IN  SALES_INV_DTL.INVOICE_DTL_ID%TYPE,
        P_PRICE                      IN  SALES_INV_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY                   IN  SALES_INV_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_DISCOUNT_VALUE             IN  SALES_INV_DTL.DISCOUNT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_ID                 IN  SALES_INV_DTL.PRODUCT_ID%TYPE DEFAULT NULL,
        P_PRE_DISCOUNT_VAT_VALUE     IN  SALES_INV_DTL.PRE_DISCOUNT_VAT_VALUE%TYPE DEFAULT NULL,
        P_INVOICE_ID                 IN  SALES_INV_DTL.INVOICE_ID%TYPE DEFAULT NULL,
        P_VAT_PERCENTAGE             IN  SALES_INV_DTL.VAT_PERCENTAGE%TYPE DEFAULT NULL,
        P_TOTAL_PRICE                IN  SALES_INV_DTL.TOTAL_PRICE%TYPE DEFAULT NULL,
        P_VAT_VALUE                  IN  SALES_INV_DTL.VAT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID            IN  SALES_INV_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_DISCOUNT_PERCENTAGE        IN  SALES_INV_DTL.DISCOUNT_PERCENTAGE%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_PRICE  IN  SALES_INV_DTL.POST_DISCOUNT_TOTAL_PRICE%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT               IN  SALES_INV_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL
    );

    PROCEDURE DELETE_SALES_INV_DTL (
        P_INVOICE_DTL_ID IN SALES_INV_DTL.INVOICE_DTL_ID%TYPE
    );

    PROCEDURE DEL_DTL (
        P_INVOICE_ID  IN  SALES_INV_DTL.INVOICE_ID%TYPE DEFAULT NULL,
        P_ID_LIST     IN  JSON_ARRAY_T
    );

END SALES_INV_DTL_TAPI;

/
--------------------------------------------------------
--  DDL for Package SALES_INV_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SALES_INV_TAPI" IS
    TYPE SALES_INV_TAPI_REC IS RECORD (
        BANK_ACC_ID                SALES_INV.BANK_ACC_ID%TYPE,
        ACC_JOURNAL_ID             SALES_INV.ACC_JOURNAL_ID%TYPE,
        PAID_AMOUNT                SALES_INV.PAID_AMOUNT%TYPE,
        SAFE_ID                    SALES_INV.SAFE_ID%TYPE,
        POST_DISCOUNT_TOTAL_AMOUNT SALES_INV.POST_DISCOUNT_TOTAL_AMOUNT%TYPE,
        USER_ID                    SALES_INV.USER_ID%TYPE,
        TOTAL_DISCOUNT             SALES_INV.TOTAL_DISCOUNT%TYPE,
        INVOICE_DATE               SALES_INV.INVOICE_DATE%TYPE,
        NOTES                      SALES_INV.NOTES%TYPE,
        INVOICE_ID                 SALES_INV.INVOICE_ID%TYPE,
        INVOICE_TOTAL_AMOUNT       SALES_INV.INVOICE_TOTAL_AMOUNT%TYPE,
        INVOICE_TYPE               SALES_INV.INVOICE_TYPE%TYPE,
        CLIENT_ID                  SALES_INV.CLIENT_ID%TYPE,
        TOTAL_QUANTITY             SALES_INV.TOTAL_QUANTITY%TYPE,
        STORE_ID                   SALES_INV.STORE_ID%TYPE,
        PRE_TAX_TOTAL_AMOUNT       SALES_INV.PRE_TAX_TOTAL_AMOUNT%TYPE,
        COMPANY_ID                 SALES_INV.COMPANY_ID%TYPE,
        PAID_BANK_AMOUNT           SALES_INV.PAID_BANK_AMOUNT%TYPE,
        COST_CTR_ID                SALES_INV.COST_CTR_ID%TYPE,
        CLIENT_DISCOUNT            SALES_INV.CLIENT_DISCOUNT%TYPE,
        TOTAL_VAT                  SALES_INV.TOTAL_VAT%TYPE,
        PAYMENT_TYPE               SALES_INV.PAYMENT_TYPE%TYPE,
        DEFERRED_AMOUNT            SALES_INV.DEFERRED_AMOUNT%TYPE,
        STORE_DATE                 SALES_INV.STORE_DATE%TYPE,
        PAID_CASH_AMOUNT           SALES_INV.PAID_CASH_AMOUNT%TYPE
        
    );
    TYPE SALES_INV_TAPI_TAB IS
        TABLE OF SALES_INV_TAPI_REC;

-- INSERT
    PROCEDURE INSERT_SALES_INV (
        P_INVOICE_ID                 IN  OUT SALES_INV.INVOICE_ID%TYPE,
        P_BRANCH_ID                   IN      SALES_INV.BRANCH_ID%TYPE DEFAULT NULL,
        P_BANK_ACC_ID                IN SALES_INV.BANK_ACC_ID%TYPE DEFAULT NULL,
        P_ACC_JOURNAL_ID             IN SALES_INV.ACC_JOURNAL_ID%TYPE DEFAULT NULL,
        P_PAID_AMOUNT                IN SALES_INV.PAID_AMOUNT%TYPE DEFAULT NULL,
        P_SAFE_ID                    IN SALES_INV.SAFE_ID%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_AMOUNT IN SALES_INV.POST_DISCOUNT_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_USER_ID                    IN SALES_INV.USER_ID%TYPE DEFAULT NULL,
        P_TOTAL_DISCOUNT             IN SALES_INV.TOTAL_DISCOUNT%TYPE DEFAULT NULL,
        P_INVOICE_DATE               IN SALES_INV.INVOICE_DATE%TYPE DEFAULT NULL,
        P_NOTES                      IN SALES_INV.NOTES%TYPE DEFAULT NULL,
        P_INVOICE_TOTAL_AMOUNT       IN SALES_INV.INVOICE_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_TYPE               IN SALES_INV.INVOICE_TYPE%TYPE DEFAULT NULL,
        P_CLIENT_ID                  IN SALES_INV.CLIENT_ID%TYPE DEFAULT NULL,
        P_TOTAL_QUANTITY             IN SALES_INV.TOTAL_QUANTITY%TYPE DEFAULT NULL,
        P_STORE_ID                   IN SALES_INV.STORE_ID%TYPE DEFAULT NULL,
        P_PRE_TAX_TOTAL_AMOUNT       IN SALES_INV.PRE_TAX_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COMPANY_ID                 IN SALES_INV.COMPANY_ID%TYPE,
        P_PAID_BANK_AMOUNT           IN SALES_INV.PAID_BANK_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CTR_ID                IN SALES_INV.COST_CTR_ID%TYPE DEFAULT NULL,
        P_CLIENT_DISCOUNT            IN SALES_INV.CLIENT_DISCOUNT%TYPE DEFAULT NULL,
        P_TOTAL_VAT                  IN SALES_INV.TOTAL_VAT%TYPE DEFAULT NULL,
        P_PAYMENT_TYPE               IN SALES_INV.PAYMENT_TYPE%TYPE DEFAULT NULL,
        P_DEFERRED_AMOUNT            IN SALES_INV.DEFERRED_AMOUNT%TYPE DEFAULT NULL,
        P_STORE_DATE                 IN SALES_INV.STORE_DATE%TYPE DEFAULT NULL,
        P_PAID_CASH_AMOUNT           IN SALES_INV.PAID_CASH_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_NO                 IN OUT SALES_INV.INVOICE_NO%TYPE
    );
-- UPDATE
    PROCEDURE UPDATE_SALES_INV (
        P_INVOICE_ID                 IN SALES_INV.INVOICE_ID%TYPE,
        P_BRANCH_ID                   IN      SALES_INV.BRANCH_ID%TYPE DEFAULT NULL,
        P_BANK_ACC_ID                IN SALES_INV.BANK_ACC_ID%TYPE DEFAULT NULL,
        P_ACC_JOURNAL_ID             IN SALES_INV.ACC_JOURNAL_ID%TYPE DEFAULT NULL,
        P_PAID_AMOUNT                IN SALES_INV.PAID_AMOUNT%TYPE DEFAULT NULL,
        P_SAFE_ID                    IN SALES_INV.SAFE_ID%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_AMOUNT IN SALES_INV.POST_DISCOUNT_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_USER_ID                    IN SALES_INV.USER_ID%TYPE DEFAULT NULL,
        P_TOTAL_DISCOUNT             IN SALES_INV.TOTAL_DISCOUNT%TYPE DEFAULT NULL,
        P_INVOICE_DATE               IN SALES_INV.INVOICE_DATE%TYPE DEFAULT NULL,
        P_NOTES                      IN SALES_INV.NOTES%TYPE DEFAULT NULL,
        P_INVOICE_TOTAL_AMOUNT       IN SALES_INV.INVOICE_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_TYPE               IN SALES_INV.INVOICE_TYPE%TYPE DEFAULT NULL,
        P_CLIENT_ID                  IN SALES_INV.CLIENT_ID%TYPE DEFAULT NULL,
        P_TOTAL_QUANTITY             IN SALES_INV.TOTAL_QUANTITY%TYPE DEFAULT NULL,
        P_STORE_ID                   IN SALES_INV.STORE_ID%TYPE DEFAULT NULL,
        P_PRE_TAX_TOTAL_AMOUNT       IN SALES_INV.PRE_TAX_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COMPANY_ID                 IN SALES_INV.COMPANY_ID%TYPE,
        P_PAID_BANK_AMOUNT           IN SALES_INV.PAID_BANK_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CTR_ID                IN SALES_INV.COST_CTR_ID%TYPE DEFAULT NULL,
        P_CLIENT_DISCOUNT            IN SALES_INV.CLIENT_DISCOUNT%TYPE DEFAULT NULL,
        P_TOTAL_VAT                  IN SALES_INV.TOTAL_VAT%TYPE DEFAULT NULL,
        P_PAYMENT_TYPE               IN SALES_INV.PAYMENT_TYPE%TYPE DEFAULT NULL,
        P_DEFERRED_AMOUNT            IN SALES_INV.DEFERRED_AMOUNT%TYPE DEFAULT NULL,
        P_STORE_DATE                 IN SALES_INV.STORE_DATE%TYPE DEFAULT NULL,
        P_PAID_CASH_AMOUNT           IN SALES_INV.PAID_CASH_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_NO                 IN SALES_INV.INVOICE_NO%TYPE
    );
-- DELETE
    PROCEDURE DELETE_SALES_INV (
        P_INVOICE_ID IN SALES_INV.INVOICE_ID%TYPE
    );

END SALES_INV_TAPI;

/
--------------------------------------------------------
--  DDL for Package SALES_PRODUCT_FILES_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SALES_PRODUCT_FILES_TAPI" IS

    PROCEDURE INS (
        P_PRODUCT_ID      IN  SALES_PRODUCT_FILES.PRODUCT_ID%TYPE DEFAULT NULL,
        P_FILE_SIZE       IN  SALES_PRODUCT_FILES.FILE_SIZE%TYPE DEFAULT NULL,
        P_FILE_MIME_TYPE  IN  SALES_PRODUCT_FILES.FILE_MIME_TYPE%TYPE DEFAULT NULL,
        P_FILE_PATH       IN  SALES_PRODUCT_FILES.FILE_PATH%TYPE DEFAULT NULL,
        P_IS_THUMBNAIL    IN  SALES_PRODUCT_FILES.IS_THUMBNAIL%TYPE DEFAULT NULL,
        P_FILE_ID         OUT  SALES_PRODUCT_FILES.FILE_ID%TYPE
    );

    PROCEDURE UPD (
        P_FILE_ID         IN  SALES_PRODUCT_FILES.FILE_ID%TYPE,
        P_PRODUCT_ID      IN  SALES_PRODUCT_FILES.PRODUCT_ID%TYPE DEFAULT NULL,
        P_FILE_SIZE       IN  SALES_PRODUCT_FILES.FILE_SIZE%TYPE DEFAULT NULL,
        P_FILE_PATH       IN  SALES_PRODUCT_FILES.FILE_PATH%TYPE DEFAULT NULL,
        P_FILE_MIME_TYPE  IN  SALES_PRODUCT_FILES.FILE_MIME_TYPE%TYPE DEFAULT NULL,
        P_IS_THUMBNAIL    IN  SALES_PRODUCT_FILES.IS_THUMBNAIL%TYPE DEFAULT NULL
    );

    PROCEDURE DEL (
        P_FILE_ID IN SALES_PRODUCT_FILES.FILE_ID%TYPE
    );

END SALES_PRODUCT_FILES_TAPI;

/
--------------------------------------------------------
--  DDL for Package SALES_PURCHASE_INV_DTL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SALES_PURCHASE_INV_DTL_TAPI" IS

    PROCEDURE INS (
        P_PRICE                      IN  SALES_PURCHASE_INV_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY                   IN  SALES_PURCHASE_INV_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_DISCOUNT_VALUE             IN  SALES_PURCHASE_INV_DTL.DISCOUNT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_ID                 IN  SALES_PURCHASE_INV_DTL.PRODUCT_ID%TYPE DEFAULT NULL,
        P_PRE_DISCOUNT_VAT_VALUE     IN  SALES_PURCHASE_INV_DTL.PRE_DISCOUNT_VAT_VALUE%TYPE DEFAULT NULL,
        P_INVOICE_ID                 IN  SALES_PURCHASE_INV_DTL.INVOICE_ID%TYPE DEFAULT NULL,
        P_VAT_PERCENTAGE             IN  SALES_PURCHASE_INV_DTL.VAT_PERCENTAGE%TYPE DEFAULT NULL,
        P_TOTAL_PRICE                IN  SALES_PURCHASE_INV_DTL.TOTAL_PRICE%TYPE DEFAULT NULL,
        P_VAT_VALUE                  IN  SALES_PURCHASE_INV_DTL.VAT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID            IN  SALES_PURCHASE_INV_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_DISCOUNT_PERCENTAGE        IN  SALES_PURCHASE_INV_DTL.DISCOUNT_PERCENTAGE%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_PRICE  IN  SALES_PURCHASE_INV_DTL.POST_DISCOUNT_TOTAL_PRICE%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT               IN  SALES_PURCHASE_INV_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL
    );
    PROCEDURE UPD (
        P_PRICE                      IN  SALES_PURCHASE_INV_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY                   IN  SALES_PURCHASE_INV_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_DISCOUNT_VALUE             IN  SALES_PURCHASE_INV_DTL.DISCOUNT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_ID                 IN  SALES_PURCHASE_INV_DTL.PRODUCT_ID%TYPE DEFAULT NULL,
        P_PRE_DISCOUNT_VAT_VALUE     IN  SALES_PURCHASE_INV_DTL.PRE_DISCOUNT_VAT_VALUE%TYPE DEFAULT NULL,
        P_INVOICE_ID                 IN  SALES_PURCHASE_INV_DTL.INVOICE_ID%TYPE DEFAULT NULL,
        P_DTL_ID                     IN  SALES_PURCHASE_INV_DTL.DTL_ID%TYPE,
        P_VAT_PERCENTAGE             IN  SALES_PURCHASE_INV_DTL.VAT_PERCENTAGE%TYPE DEFAULT NULL,
        P_TOTAL_PRICE                IN  SALES_PURCHASE_INV_DTL.TOTAL_PRICE%TYPE DEFAULT NULL,
        P_VAT_VALUE                  IN  SALES_PURCHASE_INV_DTL.VAT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID            IN  SALES_PURCHASE_INV_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_DISCOUNT_PERCENTAGE        IN  SALES_PURCHASE_INV_DTL.DISCOUNT_PERCENTAGE%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_PRICE  IN  SALES_PURCHASE_INV_DTL.POST_DISCOUNT_TOTAL_PRICE%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT               IN  SALES_PURCHASE_INV_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL
    );
    PROCEDURE DEL (
        P_DTL_ID IN SALES_PURCHASE_INV_DTL.DTL_ID%TYPE
    );

  PROCEDURE DEL_DTL (
        P_INVOICE_ID  IN  NUMBER,
        P_ID_LIST     IN  JSON_ARRAY_T
    );

END SALES_PURCHASE_INV_DTL_TAPI;

/
--------------------------------------------------------
--  DDL for Package SALES_PURCHASE_INV_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SALES_PURCHASE_INV_TAPI" IS
    PROCEDURE INS (
        P_BANK_ACC_ID                 IN      SALES_PURCHASE_INV.BANK_ACC_ID%TYPE DEFAULT NULL,
        P_ACC_JOURNAL_ID              IN      SALES_PURCHASE_INV.ACC_JOURNAL_ID%TYPE DEFAULT NULL,
        P_PAID_AMOUNT                 IN      SALES_PURCHASE_INV.PAID_AMOUNT%TYPE DEFAULT NULL,
        P_SAFE_ID                     IN      SALES_PURCHASE_INV.SAFE_ID%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_AMOUNT  IN      SALES_PURCHASE_INV.POST_DISCOUNT_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_USER_ID                     IN      SALES_PURCHASE_INV.USER_ID%TYPE DEFAULT NULL,
        P_PROVIDER_ID                 IN      SALES_PURCHASE_INV.PROVIDER_ID%TYPE DEFAULT NULL,
        P_TOTAL_DISCOUNT              IN      SALES_PURCHASE_INV.TOTAL_DISCOUNT%TYPE DEFAULT NULL,
        P_INVOICE_DATE                IN      SALES_PURCHASE_INV.INVOICE_DATE%TYPE DEFAULT NULL,
        P_NOTES                       IN      SALES_PURCHASE_INV.NOTES%TYPE DEFAULT NULL,
        P_INVOICE_TOTAL_AMOUNT        IN      SALES_PURCHASE_INV.INVOICE_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_TYPE                IN      SALES_PURCHASE_INV.INVOICE_TYPE%TYPE DEFAULT NULL,
        P_TOTAL_QUANTITY              IN      SALES_PURCHASE_INV.TOTAL_QUANTITY%TYPE DEFAULT NULL,
        P_STORE_ID                    IN      SALES_PURCHASE_INV.STORE_ID%TYPE DEFAULT NULL,
        P_PRE_TAX_TOTAL_AMOUNT        IN      SALES_PURCHASE_INV.PRE_TAX_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COMPANY_ID                  IN      SALES_PURCHASE_INV.COMPANY_ID%TYPE,
        P_PAID_BANK_AMOUNT            IN      SALES_PURCHASE_INV.PAID_BANK_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CTR_ID                 IN      SALES_PURCHASE_INV.COST_CTR_ID%TYPE DEFAULT NULL,
        P_CLIENT_DISCOUNT             IN      SALES_PURCHASE_INV.CLIENT_DISCOUNT%TYPE DEFAULT NULL,
        P_TOTAL_VAT                   IN      SALES_PURCHASE_INV.TOTAL_VAT%TYPE DEFAULT NULL,
        P_PROVIDER_INV_ID             IN      SALES_PURCHASE_INV.PROVIDER_INV_ID%TYPE DEFAULT NULL,
        P_PAYMENT_TYPE                IN      SALES_PURCHASE_INV.PAYMENT_TYPE%TYPE DEFAULT NULL,
        P_DEFERRED_AMOUNT             IN      SALES_PURCHASE_INV.DEFERRED_AMOUNT%TYPE DEFAULT NULL,
        P_PROVIDER_INV_DATE           IN      SALES_PURCHASE_INV.PROVIDER_INV_DATE%TYPE DEFAULT NULL,
        P_STORE_DATE                  IN      SALES_PURCHASE_INV.STORE_DATE%TYPE DEFAULT NULL,
        P_PAID_CASH_AMOUNT            IN      SALES_PURCHASE_INV.PAID_CASH_AMOUNT%TYPE DEFAULT NULL,
        P_BRANCH_ID                   IN      SALES_PURCHASE_INV.BRANCH_ID%TYPE DEFAULT NULL,
        P_INVOICE_NO                  OUT     SALES_PURCHASE_INV.INVOICE_NO%TYPE,
        P_INVOICE_ID                  OUT     SALES_PURCHASE_INV.INVOICE_ID%TYPE
    );

    PROCEDURE UPD (
        P_BANK_ACC_ID                 IN  SALES_PURCHASE_INV.BANK_ACC_ID%TYPE DEFAULT NULL,
        P_ACC_JOURNAL_ID              IN  SALES_PURCHASE_INV.ACC_JOURNAL_ID%TYPE DEFAULT NULL,
        P_PAID_AMOUNT                 IN  SALES_PURCHASE_INV.PAID_AMOUNT%TYPE DEFAULT NULL,
        P_SAFE_ID                     IN  SALES_PURCHASE_INV.SAFE_ID%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_AMOUNT  IN  SALES_PURCHASE_INV.POST_DISCOUNT_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_USER_ID                     IN  SALES_PURCHASE_INV.USER_ID%TYPE DEFAULT NULL,
        P_PROVIDER_ID                 IN  SALES_PURCHASE_INV.PROVIDER_ID%TYPE DEFAULT NULL,
        P_TOTAL_DISCOUNT              IN  SALES_PURCHASE_INV.TOTAL_DISCOUNT%TYPE DEFAULT NULL,
        P_INVOICE_DATE                IN  SALES_PURCHASE_INV.INVOICE_DATE%TYPE DEFAULT NULL,
        P_NOTES                       IN  SALES_PURCHASE_INV.NOTES%TYPE DEFAULT NULL,
        P_INVOICE_ID                  IN  SALES_PURCHASE_INV.INVOICE_ID%TYPE,
        P_INVOICE_TOTAL_AMOUNT        IN  SALES_PURCHASE_INV.INVOICE_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_TYPE                IN  SALES_PURCHASE_INV.INVOICE_TYPE%TYPE DEFAULT NULL,
        P_TOTAL_QUANTITY              IN  SALES_PURCHASE_INV.TOTAL_QUANTITY%TYPE DEFAULT NULL,
        P_STORE_ID                    IN  SALES_PURCHASE_INV.STORE_ID%TYPE DEFAULT NULL,
        P_PRE_TAX_TOTAL_AMOUNT        IN  SALES_PURCHASE_INV.PRE_TAX_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COMPANY_ID                  IN  SALES_PURCHASE_INV.COMPANY_ID%TYPE,
        P_PAID_BANK_AMOUNT            IN  SALES_PURCHASE_INV.PAID_BANK_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CTR_ID                 IN  SALES_PURCHASE_INV.COST_CTR_ID%TYPE DEFAULT NULL,
        P_CLIENT_DISCOUNT             IN  SALES_PURCHASE_INV.CLIENT_DISCOUNT%TYPE DEFAULT NULL,
        P_INVOICE_NO                  IN OUT  SALES_PURCHASE_INV.INVOICE_NO%TYPE,
        P_TOTAL_VAT                   IN  SALES_PURCHASE_INV.TOTAL_VAT%TYPE DEFAULT NULL,
        P_PROVIDER_INV_ID             IN  SALES_PURCHASE_INV.PROVIDER_INV_ID%TYPE DEFAULT NULL,
        P_PAYMENT_TYPE                IN  SALES_PURCHASE_INV.PAYMENT_TYPE%TYPE DEFAULT NULL,
        P_DEFERRED_AMOUNT             IN  SALES_PURCHASE_INV.DEFERRED_AMOUNT%TYPE DEFAULT NULL,
        P_PROVIDER_INV_DATE           IN  SALES_PURCHASE_INV.PROVIDER_INV_DATE%TYPE DEFAULT NULL,
        P_STORE_DATE                  IN  SALES_PURCHASE_INV.STORE_DATE%TYPE DEFAULT NULL,
        P_PAID_CASH_AMOUNT            IN  SALES_PURCHASE_INV.PAID_CASH_AMOUNT%TYPE DEFAULT NULL,
        P_BRANCH_ID                   IN  SALES_PURCHASE_INV.BRANCH_ID%TYPE DEFAULT NULL
    );

    PROCEDURE DEL (
        P_INVOICE_ID IN SALES_PURCHASE_INV.INVOICE_ID%TYPE
    );

END SALES_PURCHASE_INV_TAPI;

/
--------------------------------------------------------
--  DDL for Package SALES_PURCHASE_ORDER_DTL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SALES_PURCHASE_ORDER_DTL_TAPI" IS

    PROCEDURE INS (
        P_PRICE                      IN  SALES_PURCHASE_ORDER_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY                   IN  SALES_PURCHASE_ORDER_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_DISCOUNT_VALUE             IN  SALES_PURCHASE_ORDER_DTL.DISCOUNT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_ID                 IN  SALES_PURCHASE_ORDER_DTL.PRODUCT_ID%TYPE DEFAULT NULL,
        P_PRE_DISCOUNT_VAT_VALUE     IN  SALES_PURCHASE_ORDER_DTL.PRE_DISCOUNT_VAT_VALUE%TYPE DEFAULT NULL,
        P_ORDER_ID                 IN  SALES_PURCHASE_ORDER_DTL.ORDER_ID%TYPE DEFAULT NULL,
        P_VAT_PERCENTAGE             IN  SALES_PURCHASE_ORDER_DTL.VAT_PERCENTAGE%TYPE DEFAULT NULL,
        P_TOTAL_PRICE                IN  SALES_PURCHASE_ORDER_DTL.TOTAL_PRICE%TYPE DEFAULT NULL,
        P_VAT_VALUE                  IN  SALES_PURCHASE_ORDER_DTL.VAT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID            IN  SALES_PURCHASE_ORDER_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_DISCOUNT_PERCENTAGE        IN  SALES_PURCHASE_ORDER_DTL.DISCOUNT_PERCENTAGE%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_PRICE  IN  SALES_PURCHASE_ORDER_DTL.POST_DISCOUNT_TOTAL_PRICE%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT               IN  SALES_PURCHASE_ORDER_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL
    );
    PROCEDURE UPD (
        P_PRICE                      IN  SALES_PURCHASE_ORDER_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY                   IN  SALES_PURCHASE_ORDER_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_DISCOUNT_VALUE             IN  SALES_PURCHASE_ORDER_DTL.DISCOUNT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_ID                 IN  SALES_PURCHASE_ORDER_DTL.PRODUCT_ID%TYPE DEFAULT NULL,
        P_PRE_DISCOUNT_VAT_VALUE     IN  SALES_PURCHASE_ORDER_DTL.PRE_DISCOUNT_VAT_VALUE%TYPE DEFAULT NULL,
        P_ORDER_ID                 IN  SALES_PURCHASE_ORDER_DTL.ORDER_ID%TYPE DEFAULT NULL,
        P_DTL_ID                     IN  SALES_PURCHASE_ORDER_DTL.DTL_ID%TYPE,
        P_VAT_PERCENTAGE             IN  SALES_PURCHASE_ORDER_DTL.VAT_PERCENTAGE%TYPE DEFAULT NULL,
        P_TOTAL_PRICE                IN  SALES_PURCHASE_ORDER_DTL.TOTAL_PRICE%TYPE DEFAULT NULL,
        P_VAT_VALUE                  IN  SALES_PURCHASE_ORDER_DTL.VAT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID            IN  SALES_PURCHASE_ORDER_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_DISCOUNT_PERCENTAGE        IN  SALES_PURCHASE_ORDER_DTL.DISCOUNT_PERCENTAGE%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_PRICE  IN  SALES_PURCHASE_ORDER_DTL.POST_DISCOUNT_TOTAL_PRICE%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT               IN  SALES_PURCHASE_ORDER_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL
    );
    PROCEDURE DEL (
        P_DTL_ID IN SALES_PURCHASE_ORDER_DTL.DTL_ID%TYPE
    );

  PROCEDURE DEL_DTL (
        P_ORDER_ID    IN  NUMBER,
        P_ID_LIST     IN  JSON_ARRAY_T
    );

END SALES_PURCHASE_ORDER_DTL_TAPI;

/
--------------------------------------------------------
--  DDL for Package SALES_PURCHASE_ORDER_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SALES_PURCHASE_ORDER_TAPI" IS
    PROCEDURE INS (
        P_BANK_ACC_ID                 IN   SALES_PURCHASE_ORDER.BANK_ACC_ID%TYPE DEFAULT NULL,
        P_PAID_AMOUNT                 IN   SALES_PURCHASE_ORDER.PAID_AMOUNT%TYPE DEFAULT NULL,
        P_SAFE_ID                     IN   SALES_PURCHASE_ORDER.SAFE_ID%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_AMOUNT  IN   SALES_PURCHASE_ORDER.POST_DISCOUNT_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_USER_ID                     IN   SALES_PURCHASE_ORDER.USER_ID%TYPE DEFAULT NULL,
        P_PROVIDER_ID                 IN   SALES_PURCHASE_ORDER.PROVIDER_ID%TYPE DEFAULT NULL,
        P_TOTAL_DISCOUNT              IN   SALES_PURCHASE_ORDER.TOTAL_DISCOUNT%TYPE DEFAULT NULL,
        P_NOTES                       IN   SALES_PURCHASE_ORDER.NOTES%TYPE DEFAULT NULL,
        P_INVOICE_TOTAL_AMOUNT        IN   SALES_PURCHASE_ORDER.INVOICE_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_TYPE                IN   SALES_PURCHASE_ORDER.INVOICE_TYPE%TYPE DEFAULT NULL,
        P_TOTAL_QUANTITY              IN   SALES_PURCHASE_ORDER.TOTAL_QUANTITY%TYPE DEFAULT NULL,
        P_STORE_ID                    IN   SALES_PURCHASE_ORDER.STORE_ID%TYPE DEFAULT NULL,
        P_PRE_TAX_TOTAL_AMOUNT        IN   SALES_PURCHASE_ORDER.PRE_TAX_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COMPANY_ID                  IN   SALES_PURCHASE_ORDER.COMPANY_ID%TYPE,
        P_ORDER_DATE                  IN   SALES_PURCHASE_ORDER.ORDER_DATE%TYPE DEFAULT NULL,
        P_PAID_BANK_AMOUNT            IN   SALES_PURCHASE_ORDER.PAID_BANK_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CTR_ID                 IN   SALES_PURCHASE_ORDER.COST_CTR_ID%TYPE DEFAULT NULL,
        P_CLIENT_DISCOUNT             IN   SALES_PURCHASE_ORDER.CLIENT_DISCOUNT%TYPE DEFAULT NULL,
        P_TOTAL_VAT                   IN   SALES_PURCHASE_ORDER.TOTAL_VAT%TYPE DEFAULT NULL,
        P_PROVIDER_INV_ID             IN   SALES_PURCHASE_ORDER.PROVIDER_INV_ID%TYPE DEFAULT NULL,
        P_PAYMENT_TYPE                IN   SALES_PURCHASE_ORDER.PAYMENT_TYPE%TYPE DEFAULT NULL,
        P_PROVIDER_INV_DATE           IN   SALES_PURCHASE_ORDER.PROVIDER_INV_DATE%TYPE DEFAULT NULL,
        P_DEFERRED_AMOUNT             IN   SALES_PURCHASE_ORDER.DEFERRED_AMOUNT%TYPE DEFAULT NULL,
        P_STORE_DATE                  IN   SALES_PURCHASE_ORDER.STORE_DATE%TYPE DEFAULT NULL,
        P_PAID_CASH_AMOUNT            IN   SALES_PURCHASE_ORDER.PAID_CASH_AMOUNT%TYPE DEFAULT NULL,
        P_BRANCH_ID                   IN      SALES_PURCHASE_ORDER.BRANCH_ID%TYPE DEFAULT NULL,
        P_ORDER_ID                    OUT  SALES_PURCHASE_ORDER.ORDER_ID%TYPE,
        P_ORDER_NO                    OUT  SALES_PURCHASE_ORDER.ORDER_NO%TYPE
    );

    PROCEDURE UPD (
        P_BANK_ACC_ID                 IN      SALES_PURCHASE_ORDER.BANK_ACC_ID%TYPE DEFAULT NULL,
        P_ACC_JOURNAL_ID              IN      SALES_PURCHASE_ORDER.ACC_JOURNAL_ID%TYPE DEFAULT NULL,
        P_PAID_AMOUNT                 IN      SALES_PURCHASE_ORDER.PAID_AMOUNT%TYPE DEFAULT NULL,
        P_SAFE_ID                     IN      SALES_PURCHASE_ORDER.SAFE_ID%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_AMOUNT  IN      SALES_PURCHASE_ORDER.POST_DISCOUNT_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_USER_ID                     IN      SALES_PURCHASE_ORDER.USER_ID%TYPE DEFAULT NULL,
        P_PROVIDER_ID                 IN      SALES_PURCHASE_ORDER.PROVIDER_ID%TYPE DEFAULT NULL,
        P_TOTAL_DISCOUNT              IN      SALES_PURCHASE_ORDER.TOTAL_DISCOUNT%TYPE DEFAULT NULL,
        P_NOTES                       IN      SALES_PURCHASE_ORDER.NOTES%TYPE DEFAULT NULL,
        P_INVOICE_TOTAL_AMOUNT        IN      SALES_PURCHASE_ORDER.INVOICE_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_TYPE                IN      SALES_PURCHASE_ORDER.INVOICE_TYPE%TYPE DEFAULT NULL,
        P_TOTAL_QUANTITY              IN      SALES_PURCHASE_ORDER.TOTAL_QUANTITY%TYPE DEFAULT NULL,
        P_STORE_ID                    IN      SALES_PURCHASE_ORDER.STORE_ID%TYPE DEFAULT NULL,
        P_PRE_TAX_TOTAL_AMOUNT        IN      SALES_PURCHASE_ORDER.PRE_TAX_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COMPANY_ID                  IN      SALES_PURCHASE_ORDER.COMPANY_ID%TYPE,
        P_ORDER_DATE                  IN      SALES_PURCHASE_ORDER.ORDER_DATE%TYPE DEFAULT NULL,
        P_PAID_BANK_AMOUNT            IN      SALES_PURCHASE_ORDER.PAID_BANK_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CTR_ID                 IN      SALES_PURCHASE_ORDER.COST_CTR_ID%TYPE DEFAULT NULL,
        P_CLIENT_DISCOUNT             IN      SALES_PURCHASE_ORDER.CLIENT_DISCOUNT%TYPE DEFAULT NULL,
        P_TOTAL_VAT                   IN      SALES_PURCHASE_ORDER.TOTAL_VAT%TYPE DEFAULT NULL,
        P_PROVIDER_INV_ID             IN      SALES_PURCHASE_ORDER.PROVIDER_INV_ID%TYPE DEFAULT NULL,
        P_PAYMENT_TYPE                IN      SALES_PURCHASE_ORDER.PAYMENT_TYPE%TYPE DEFAULT NULL,
        P_PROVIDER_INV_DATE           IN      SALES_PURCHASE_ORDER.PROVIDER_INV_DATE%TYPE DEFAULT NULL,
        P_DEFERRED_AMOUNT             IN      SALES_PURCHASE_ORDER.DEFERRED_AMOUNT%TYPE DEFAULT NULL,
        P_STORE_DATE                  IN      SALES_PURCHASE_ORDER.STORE_DATE%TYPE DEFAULT NULL,
        P_PAID_CASH_AMOUNT            IN      SALES_PURCHASE_ORDER.PAID_CASH_AMOUNT%TYPE DEFAULT NULL,
        P_ORDER_ID                    IN      SALES_PURCHASE_ORDER.ORDER_ID%TYPE,
        P_BRANCH_ID                   IN      SALES_PURCHASE_ORDER.BRANCH_ID%TYPE DEFAULT NULL,
        P_ORDER_NO                    IN OUT  SALES_PURCHASE_ORDER.ORDER_NO%TYPE
    );

    PROCEDURE DEL (
        P_ORDER_ID IN SALES_PURCHASE_ORDER.ORDER_ID%TYPE
    );

END SALES_PURCHASE_ORDER_TAPI;

/
--------------------------------------------------------
--  DDL for Package SALES_PUR_RETURN_INV_DTL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SALES_PUR_RETURN_INV_DTL_TAPI" IS

    PROCEDURE INS (
        P_PRICE                      IN  SALES_PUR_RETURN_INV_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY                   IN  SALES_PUR_RETURN_INV_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_DISCOUNT_VALUE             IN  SALES_PUR_RETURN_INV_DTL.DISCOUNT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_ID                 IN  SALES_PUR_RETURN_INV_DTL.PRODUCT_ID%TYPE DEFAULT NULL,
        P_PRE_DISCOUNT_VAT_VALUE     IN  SALES_PUR_RETURN_INV_DTL.PRE_DISCOUNT_VAT_VALUE%TYPE DEFAULT NULL,
        P_INVOICE_ID                 IN  SALES_PUR_RETURN_INV_DTL.INVOICE_ID%TYPE DEFAULT NULL,
        P_VAT_PERCENTAGE             IN  SALES_PUR_RETURN_INV_DTL.VAT_PERCENTAGE%TYPE DEFAULT NULL,
        P_TOTAL_PRICE                IN  SALES_PUR_RETURN_INV_DTL.TOTAL_PRICE%TYPE DEFAULT NULL,
        P_VAT_VALUE                  IN  SALES_PUR_RETURN_INV_DTL.VAT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID            IN  SALES_PUR_RETURN_INV_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_DISCOUNT_PERCENTAGE        IN  SALES_PUR_RETURN_INV_DTL.DISCOUNT_PERCENTAGE%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_PRICE  IN  SALES_PUR_RETURN_INV_DTL.POST_DISCOUNT_TOTAL_PRICE%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT               IN  SALES_PUR_RETURN_INV_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL
    );
    PROCEDURE UPD (
        P_PRICE                      IN  SALES_PUR_RETURN_INV_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY                   IN  SALES_PUR_RETURN_INV_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_DISCOUNT_VALUE             IN  SALES_PUR_RETURN_INV_DTL.DISCOUNT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_ID                 IN  SALES_PUR_RETURN_INV_DTL.PRODUCT_ID%TYPE DEFAULT NULL,
        P_PRE_DISCOUNT_VAT_VALUE     IN  SALES_PUR_RETURN_INV_DTL.PRE_DISCOUNT_VAT_VALUE%TYPE DEFAULT NULL,
        P_INVOICE_ID                 IN  SALES_PUR_RETURN_INV_DTL.INVOICE_ID%TYPE DEFAULT NULL,
        P_DTL_ID                     IN  SALES_PUR_RETURN_INV_DTL.DTL_ID%TYPE,
        P_VAT_PERCENTAGE             IN  SALES_PUR_RETURN_INV_DTL.VAT_PERCENTAGE%TYPE DEFAULT NULL,
        P_TOTAL_PRICE                IN  SALES_PUR_RETURN_INV_DTL.TOTAL_PRICE%TYPE DEFAULT NULL,
        P_VAT_VALUE                  IN  SALES_PUR_RETURN_INV_DTL.VAT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID            IN  SALES_PUR_RETURN_INV_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_DISCOUNT_PERCENTAGE        IN  SALES_PUR_RETURN_INV_DTL.DISCOUNT_PERCENTAGE%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_PRICE  IN  SALES_PUR_RETURN_INV_DTL.POST_DISCOUNT_TOTAL_PRICE%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT               IN  SALES_PUR_RETURN_INV_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL
    );
    PROCEDURE DEL (
        P_DTL_ID IN SALES_PUR_RETURN_INV_DTL.DTL_ID%TYPE
    );

  PROCEDURE DEL_DTL (
        P_INVOICE_ID  IN  NUMBER,
        P_ID_LIST     IN  JSON_ARRAY_T
    );

END SALES_PUR_RETURN_INV_DTL_TAPI;

/
--------------------------------------------------------
--  DDL for Package SALES_PUR_RETURN_INV_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SALES_PUR_RETURN_INV_TAPI" IS
    PROCEDURE INS (
        P_BANK_ACC_ID                 IN   SALES_PUR_RETURN_INV.BANK_ACC_ID%TYPE DEFAULT NULL,
        P_PAID_AMOUNT                 IN   SALES_PUR_RETURN_INV.PAID_AMOUNT%TYPE DEFAULT NULL,
        P_SAFE_ID                     IN   SALES_PUR_RETURN_INV.SAFE_ID%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_AMOUNT  IN   SALES_PUR_RETURN_INV.POST_DISCOUNT_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_USER_ID                     IN   SALES_PUR_RETURN_INV.USER_ID%TYPE DEFAULT NULL,
        P_PROVIDER_ID                 IN   SALES_PUR_RETURN_INV.PROVIDER_ID%TYPE DEFAULT NULL,
        P_TOTAL_DISCOUNT              IN   SALES_PUR_RETURN_INV.TOTAL_DISCOUNT%TYPE DEFAULT NULL,
        P_INVOICE_DATE                IN   SALES_PUR_RETURN_INV.INVOICE_DATE%TYPE DEFAULT NULL,
        P_NOTES                       IN   SALES_PUR_RETURN_INV.NOTES%TYPE DEFAULT NULL,
        P_INVOICE_TOTAL_AMOUNT        IN   SALES_PUR_RETURN_INV.INVOICE_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_TYPE                IN   SALES_PUR_RETURN_INV.INVOICE_TYPE%TYPE DEFAULT NULL,
        P_TOTAL_QUANTITY              IN   SALES_PUR_RETURN_INV.TOTAL_QUANTITY%TYPE DEFAULT NULL,
        P_STORE_ID                    IN   SALES_PUR_RETURN_INV.STORE_ID%TYPE DEFAULT NULL,
        P_PRE_TAX_TOTAL_AMOUNT        IN   SALES_PUR_RETURN_INV.PRE_TAX_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COMPANY_ID                  IN   SALES_PUR_RETURN_INV.COMPANY_ID%TYPE,
        P_PAID_BANK_AMOUNT            IN   SALES_PUR_RETURN_INV.PAID_BANK_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CTR_ID                 IN   SALES_PUR_RETURN_INV.COST_CTR_ID%TYPE DEFAULT NULL,
        P_CLIENT_DISCOUNT             IN   SALES_PUR_RETURN_INV.CLIENT_DISCOUNT%TYPE DEFAULT NULL,
        P_TOTAL_VAT                   IN   SALES_PUR_RETURN_INV.TOTAL_VAT%TYPE DEFAULT NULL,
        P_PROVIDER_INV_ID             IN   SALES_PUR_RETURN_INV.PROVIDER_INV_ID%TYPE DEFAULT NULL,
        P_PAYMENT_TYPE                IN   SALES_PUR_RETURN_INV.PAYMENT_TYPE%TYPE DEFAULT NULL,
        P_DEFERRED_AMOUNT             IN   SALES_PUR_RETURN_INV.DEFERRED_AMOUNT%TYPE DEFAULT NULL,
        P_PROVIDER_INV_DATE           IN   SALES_PUR_RETURN_INV.PROVIDER_INV_DATE%TYPE DEFAULT NULL,
        P_STORE_DATE                  IN   SALES_PUR_RETURN_INV.STORE_DATE%TYPE DEFAULT NULL,
        P_PAID_CASH_AMOUNT            IN   SALES_PUR_RETURN_INV.PAID_CASH_AMOUNT%TYPE DEFAULT NULL,
        P_PURCHASE_INV_ID             IN   SALES_PUR_RETURN_INV.PURCHASE_INV_ID%TYPE DEFAULT NULL,
        P_BRANCH_ID                   IN      SALES_PUR_RETURN_INV.BRANCH_ID%TYPE DEFAULT NULL,
        P_INVOICE_ID                  OUT  SALES_PUR_RETURN_INV.INVOICE_ID%TYPE,
        P_INVOICE_NO                  OUT  SALES_PUR_RETURN_INV.INVOICE_NO%TYPE
    );

    PROCEDURE UPD (
        P_BANK_ACC_ID                 IN      SALES_PUR_RETURN_INV.BANK_ACC_ID%TYPE DEFAULT NULL,
        P_PAID_AMOUNT                 IN      SALES_PUR_RETURN_INV.PAID_AMOUNT%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_AMOUNT  IN      SALES_PUR_RETURN_INV.POST_DISCOUNT_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_SAFE_ID                     IN      SALES_PUR_RETURN_INV.SAFE_ID%TYPE DEFAULT NULL,
        P_USER_ID                     IN      SALES_PUR_RETURN_INV.USER_ID%TYPE DEFAULT NULL,
        P_PROVIDER_ID                 IN      SALES_PUR_RETURN_INV.PROVIDER_ID%TYPE DEFAULT NULL,
        P_TOTAL_DISCOUNT              IN      SALES_PUR_RETURN_INV.TOTAL_DISCOUNT%TYPE DEFAULT NULL,
        P_NOTES                       IN      SALES_PUR_RETURN_INV.NOTES%TYPE DEFAULT NULL,
        P_INVOICE_DATE                IN      SALES_PUR_RETURN_INV.INVOICE_DATE%TYPE DEFAULT NULL,
        P_INVOICE_ID                  IN      SALES_PUR_RETURN_INV.INVOICE_ID%TYPE,
        P_INVOICE_TOTAL_AMOUNT        IN      SALES_PUR_RETURN_INV.INVOICE_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_TYPE                IN      SALES_PUR_RETURN_INV.INVOICE_TYPE%TYPE DEFAULT NULL,
        P_TOTAL_QUANTITY              IN      SALES_PUR_RETURN_INV.TOTAL_QUANTITY%TYPE DEFAULT NULL,
        P_STORE_ID                    IN      SALES_PUR_RETURN_INV.STORE_ID%TYPE DEFAULT NULL,
        P_PRE_TAX_TOTAL_AMOUNT        IN      SALES_PUR_RETURN_INV.PRE_TAX_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COMPANY_ID                  IN      SALES_PUR_RETURN_INV.COMPANY_ID%TYPE,
        P_PAID_BANK_AMOUNT            IN      SALES_PUR_RETURN_INV.PAID_BANK_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CTR_ID                 IN      SALES_PUR_RETURN_INV.COST_CTR_ID%TYPE DEFAULT NULL,
        P_CLIENT_DISCOUNT             IN      SALES_PUR_RETURN_INV.CLIENT_DISCOUNT%TYPE DEFAULT NULL,
        P_INVOICE_NO                  IN OUT  SALES_PUR_RETURN_INV.INVOICE_NO%TYPE,
        P_TOTAL_VAT                   IN      SALES_PUR_RETURN_INV.TOTAL_VAT%TYPE DEFAULT NULL,
        P_PROVIDER_INV_ID             IN      SALES_PUR_RETURN_INV.PROVIDER_INV_ID%TYPE DEFAULT NULL,
        P_PAYMENT_TYPE                IN      SALES_PUR_RETURN_INV.PAYMENT_TYPE%TYPE DEFAULT NULL,
        P_DEFERRED_AMOUNT             IN      SALES_PUR_RETURN_INV.DEFERRED_AMOUNT%TYPE DEFAULT NULL,
        P_PROVIDER_INV_DATE           IN      SALES_PUR_RETURN_INV.PROVIDER_INV_DATE%TYPE DEFAULT NULL,
        P_STORE_DATE                  IN      SALES_PUR_RETURN_INV.STORE_DATE%TYPE DEFAULT NULL,
        P_PAID_CASH_AMOUNT            IN      SALES_PUR_RETURN_INV.PAID_CASH_AMOUNT%TYPE DEFAULT NULL,
        P_BRANCH_ID                   IN      SALES_PUR_RETURN_INV.BRANCH_ID%TYPE DEFAULT NULL,
        P_PURCHASE_INV_ID             IN      SALES_PUR_RETURN_INV.PURCHASE_INV_ID%TYPE DEFAULT NULL
    );

    PROCEDURE DEL (
        P_INVOICE_ID IN SALES_PUR_RETURN_INV.INVOICE_ID%TYPE
    );

END SALES_PUR_RETURN_INV_TAPI;

/
--------------------------------------------------------
--  DDL for Package SALES_RENT_INV_DTL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SALES_RENT_INV_DTL_TAPI" IS
    PROCEDURE INS (
        P_INVOICE_ID                 IN   SALES_RENT_INV_DTL.INVOICE_ID%TYPE DEFAULT NULL,
        P_PRODUCT_ID                 IN   SALES_RENT_INV_DTL.PRODUCT_ID%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID            IN   SALES_RENT_INV_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_PRICE                      IN   SALES_RENT_INV_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY                   IN   SALES_RENT_INV_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_DISCOUNT_VALUE             IN   SALES_RENT_INV_DTL.DISCOUNT_VALUE%TYPE DEFAULT NULL,
        P_PRE_DISCOUNT_VAT_VALUE     IN   SALES_RENT_INV_DTL.PRE_DISCOUNT_VAT_VALUE%TYPE DEFAULT NULL,
        P_VAT_PERCENTAGE             IN   SALES_RENT_INV_DTL.VAT_PERCENTAGE%TYPE DEFAULT NULL,
        P_TOTAL_PRICE                IN   SALES_RENT_INV_DTL.TOTAL_PRICE%TYPE DEFAULT NULL,
        P_VAT_VALUE                  IN   SALES_RENT_INV_DTL.VAT_VALUE%TYPE DEFAULT NULL,
        P_DISCOUNT_PERCENTAGE        IN   SALES_RENT_INV_DTL.DISCOUNT_PERCENTAGE%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_PRICE  IN   SALES_RENT_INV_DTL.POST_DISCOUNT_TOTAL_PRICE%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT               IN   SALES_RENT_INV_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL
    );

    PROCEDURE UPD (
        P_DTL_ID                     IN  SALES_RENT_INV_DTL.DTL_ID%TYPE,
        P_INVOICE_ID                 IN  SALES_RENT_INV_DTL.INVOICE_ID%TYPE DEFAULT NULL,
        P_PRODUCT_ID                 IN  SALES_RENT_INV_DTL.PRODUCT_ID%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID            IN  SALES_RENT_INV_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_PRICE                      IN  SALES_RENT_INV_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY                   IN  SALES_RENT_INV_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_DISCOUNT_VALUE             IN  SALES_RENT_INV_DTL.DISCOUNT_VALUE%TYPE DEFAULT NULL,
        P_PRE_DISCOUNT_VAT_VALUE     IN  SALES_RENT_INV_DTL.PRE_DISCOUNT_VAT_VALUE%TYPE DEFAULT NULL,
        P_VAT_PERCENTAGE             IN  SALES_RENT_INV_DTL.VAT_PERCENTAGE%TYPE DEFAULT NULL,
        P_TOTAL_PRICE                IN  SALES_RENT_INV_DTL.TOTAL_PRICE%TYPE DEFAULT NULL,
        P_VAT_VALUE                  IN  SALES_RENT_INV_DTL.VAT_VALUE%TYPE DEFAULT NULL,
        P_DISCOUNT_PERCENTAGE        IN  SALES_RENT_INV_DTL.DISCOUNT_PERCENTAGE%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_PRICE  IN  SALES_RENT_INV_DTL.POST_DISCOUNT_TOTAL_PRICE%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT               IN  SALES_RENT_INV_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL
    );

    PROCEDURE DEL (
        P_DTL_ID IN SALES_RENT_INV_DTL.DTL_ID%TYPE
    );

  PROCEDURE DEL_DTL (
        P_INVOICE_ID  IN  NUMBER,
        P_ID_LIST     IN  JSON_ARRAY_T
    );

END SALES_RENT_INV_DTL_TAPI;

/
--------------------------------------------------------
--  DDL for Package SALES_RENT_INV_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SALES_RENT_INV_TAPI" IS
    PROCEDURE INS (
        P_BANK_ACC_ID                 IN   SALES_RENT_INV.BANK_ACC_ID%TYPE DEFAULT NULL,
        P_ACC_JOURNAL_ID              IN   SALES_RENT_INV.ACC_JOURNAL_ID%TYPE DEFAULT NULL,
        P_PAID_AMOUNT                 IN   SALES_RENT_INV.PAID_AMOUNT%TYPE DEFAULT NULL,
        P_SAFE_ID                     IN   SALES_RENT_INV.SAFE_ID%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_AMOUNT  IN   SALES_RENT_INV.POST_DISCOUNT_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_USER_ID                     IN   SALES_RENT_INV.USER_ID%TYPE DEFAULT NULL,
        P_TOTAL_DISCOUNT              IN   SALES_RENT_INV.TOTAL_DISCOUNT%TYPE DEFAULT NULL,
        P_INVOICE_DATE                IN   SALES_RENT_INV.INVOICE_DATE%TYPE DEFAULT NULL,
        P_NOTES                       IN   SALES_RENT_INV.NOTES%TYPE DEFAULT NULL,
        P_INVOICE_TOTAL_AMOUNT        IN   SALES_RENT_INV.INVOICE_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_TYPE                IN   SALES_RENT_INV.INVOICE_TYPE%TYPE DEFAULT NULL,
        P_CLIENT_ID                   IN   SALES_RENT_INV.CLIENT_ID%TYPE DEFAULT NULL,
        P_TOTAL_QUANTITY              IN   SALES_RENT_INV.TOTAL_QUANTITY%TYPE DEFAULT NULL,
        P_STORE_ID                    IN   SALES_RENT_INV.STORE_ID%TYPE DEFAULT NULL,
        P_PRE_TAX_TOTAL_AMOUNT        IN   SALES_RENT_INV.PRE_TAX_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COMPANY_ID                  IN   SALES_RENT_INV.COMPANY_ID%TYPE,
        P_RETURN_DATE                 IN   SALES_RENT_INV.RETURN_DATE%TYPE DEFAULT NULL,
        P_PAID_BANK_AMOUNT            IN   SALES_RENT_INV.PAID_BANK_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CTR_ID                 IN   SALES_RENT_INV.COST_CTR_ID%TYPE DEFAULT NULL,
        P_CLIENT_DISCOUNT             IN   SALES_RENT_INV.CLIENT_DISCOUNT%TYPE DEFAULT NULL,
        P_TOTAL_VAT                   IN   SALES_RENT_INV.TOTAL_VAT%TYPE DEFAULT NULL,
        P_PAYMENT_TYPE                IN   SALES_RENT_INV.PAYMENT_TYPE%TYPE DEFAULT NULL,
        P_DEFERRED_AMOUNT             IN   SALES_RENT_INV.DEFERRED_AMOUNT%TYPE DEFAULT NULL,
        P_STORE_DATE                  IN   SALES_RENT_INV.STORE_DATE%TYPE DEFAULT NULL,
        P_DELIVERY_DATE               IN   SALES_RENT_INV.DELIVERY_DATE%TYPE DEFAULT NULL,
        P_PAID_CASH_AMOUNT            IN   SALES_RENT_INV.PAID_CASH_AMOUNT%TYPE DEFAULT NULL,
        P_BRANCH_ID                   IN      SALES_RENT_INV.BRANCH_ID%TYPE DEFAULT NULL,
        P_INVOICE_NO                  OUT  SALES_RENT_INV.INVOICE_NO%TYPE,
        P_INVOICE_ID                  OUT  SALES_RENT_INV.INVOICE_ID%TYPE
    );

    PROCEDURE UPD (
        P_BANK_ACC_ID                 IN      SALES_RENT_INV.BANK_ACC_ID%TYPE DEFAULT NULL,
        P_ACC_JOURNAL_ID              IN      SALES_RENT_INV.ACC_JOURNAL_ID%TYPE DEFAULT NULL,
        P_PAID_AMOUNT                 IN      SALES_RENT_INV.PAID_AMOUNT%TYPE DEFAULT NULL,
        P_SAFE_ID                     IN      SALES_RENT_INV.SAFE_ID%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_AMOUNT  IN      SALES_RENT_INV.POST_DISCOUNT_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_USER_ID                     IN      SALES_RENT_INV.USER_ID%TYPE DEFAULT NULL,
        P_TOTAL_DISCOUNT              IN      SALES_RENT_INV.TOTAL_DISCOUNT%TYPE DEFAULT NULL,
        P_INVOICE_DATE                IN      SALES_RENT_INV.INVOICE_DATE%TYPE DEFAULT NULL,
        P_NOTES                       IN      SALES_RENT_INV.NOTES%TYPE DEFAULT NULL,
        P_INVOICE_ID                  IN      SALES_RENT_INV.INVOICE_ID%TYPE,
        P_INVOICE_TOTAL_AMOUNT        IN      SALES_RENT_INV.INVOICE_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_TYPE                IN      SALES_RENT_INV.INVOICE_TYPE%TYPE DEFAULT NULL,
        P_CLIENT_ID                   IN      SALES_RENT_INV.CLIENT_ID%TYPE DEFAULT NULL,
        P_TOTAL_QUANTITY              IN      SALES_RENT_INV.TOTAL_QUANTITY%TYPE DEFAULT NULL,
        P_STORE_ID                    IN      SALES_RENT_INV.STORE_ID%TYPE DEFAULT NULL,
        P_PRE_TAX_TOTAL_AMOUNT        IN      SALES_RENT_INV.PRE_TAX_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COMPANY_ID                  IN      SALES_RENT_INV.COMPANY_ID%TYPE,
        P_RETURN_DATE                 IN      SALES_RENT_INV.RETURN_DATE%TYPE DEFAULT NULL,
        P_PAID_BANK_AMOUNT            IN      SALES_RENT_INV.PAID_BANK_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CTR_ID                 IN      SALES_RENT_INV.COST_CTR_ID%TYPE DEFAULT NULL,
        P_CLIENT_DISCOUNT             IN      SALES_RENT_INV.CLIENT_DISCOUNT%TYPE DEFAULT NULL,
        P_INVOICE_NO                  IN OUT  SALES_RENT_INV.INVOICE_NO%TYPE,
        P_TOTAL_VAT                   IN      SALES_RENT_INV.TOTAL_VAT%TYPE DEFAULT NULL,
        P_PAYMENT_TYPE                IN      SALES_RENT_INV.PAYMENT_TYPE%TYPE DEFAULT NULL,
        P_DEFERRED_AMOUNT             IN      SALES_RENT_INV.DEFERRED_AMOUNT%TYPE DEFAULT NULL,
        P_STORE_DATE                  IN      SALES_RENT_INV.STORE_DATE%TYPE DEFAULT NULL,
        P_DELIVERY_DATE               IN      SALES_RENT_INV.DELIVERY_DATE%TYPE DEFAULT NULL,
        P_BRANCH_ID                   IN      SALES_RENT_INV.BRANCH_ID%TYPE DEFAULT NULL,
        P_PAID_CASH_AMOUNT            IN      SALES_RENT_INV.PAID_CASH_AMOUNT%TYPE DEFAULT NULL
    );

    PROCEDURE DEL (
        P_INVOICE_ID IN SALES_RENT_INV.INVOICE_ID%TYPE
    );

END SALES_RENT_INV_TAPI;

/
--------------------------------------------------------
--  DDL for Package SALES_RETURN_INV_DTL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SALES_RETURN_INV_DTL_TAPI" is
    type SALES_RETURN_INV_DTL_TAPI_REC is record (
        PRICE                     SALES_RETURN_INV_DTL.PRICE%type,
        QUANTITY                  SALES_RETURN_INV_DTL.QUANTITY%type,
        DISCOUNT_VALUE            SALES_RETURN_INV_DTL.DISCOUNT_VALUE%type,
        PRODUCT_ID                SALES_RETURN_INV_DTL.PRODUCT_ID%type,
        PRE_DISCOUNT_VAT_VALUE    SALES_RETURN_INV_DTL.PRE_DISCOUNT_VAT_VALUE%type,
        INVOICE_ID                SALES_RETURN_INV_DTL.INVOICE_ID%type,
        DTL_ID                    SALES_RETURN_INV_DTL.DTL_ID%type,
        VAT_PERCENTAGE            SALES_RETURN_INV_DTL.VAT_PERCENTAGE%type,
        TOTAL_PRICE               SALES_RETURN_INV_DTL.TOTAL_PRICE%type,
        VAT_VALUE                 SALES_RETURN_INV_DTL.VAT_VALUE%type,
        PRODUCT_UNIT_ID           SALES_RETURN_INV_DTL.PRODUCT_UNIT_ID%type,
        DISCOUNT_PERCENTAGE       SALES_RETURN_INV_DTL.DISCOUNT_PERCENTAGE%type,
        POST_DISCOUNT_TOTAL_PRICE SALES_RETURN_INV_DTL.POST_DISCOUNT_TOTAL_PRICE%type,
        TOTAL_AMOUNT              SALES_RETURN_INV_DTL.TOTAL_AMOUNT%type
    );
    type SALES_RETURN_INV_DTL_TAPI_TAB is
        table of SALES_RETURN_INV_DTL_TAPI_REC;

-- insert
    procedure INSERT_SALES_RETURN_INV_DTL (
        P_DTL_ID                    in OUT SALES_RETURN_INV_DTL.DTL_ID%type,
        P_PRICE                     in SALES_RETURN_INV_DTL.PRICE%type default null,
        P_QUANTITY                  in SALES_RETURN_INV_DTL.QUANTITY%type default null,
        P_DISCOUNT_VALUE            in SALES_RETURN_INV_DTL.DISCOUNT_VALUE%type default null,
        P_PRODUCT_ID                in SALES_RETURN_INV_DTL.PRODUCT_ID%type default null,
        P_PRE_DISCOUNT_VAT_VALUE    in SALES_RETURN_INV_DTL.PRE_DISCOUNT_VAT_VALUE%type default null,
        P_INVOICE_ID                in SALES_RETURN_INV_DTL.INVOICE_ID%type default null,
        P_VAT_PERCENTAGE            in SALES_RETURN_INV_DTL.VAT_PERCENTAGE%type default null,
        P_TOTAL_PRICE               in SALES_RETURN_INV_DTL.TOTAL_PRICE%type default null,
        P_VAT_VALUE                 in SALES_RETURN_INV_DTL.VAT_VALUE%type default null,
        P_PRODUCT_UNIT_ID           in SALES_RETURN_INV_DTL.PRODUCT_UNIT_ID%type default null,
        P_DISCOUNT_PERCENTAGE       in SALES_RETURN_INV_DTL.DISCOUNT_PERCENTAGE%type default null,
        P_POST_DISCOUNT_TOTAL_PRICE in SALES_RETURN_INV_DTL.POST_DISCOUNT_TOTAL_PRICE%type default null,
        P_TOTAL_AMOUNT              in SALES_RETURN_INV_DTL.TOTAL_AMOUNT%type default null
    );
-- update
    procedure UPDATE_SALES_RETURN_INV_DTL (
        P_DTL_ID                    in SALES_RETURN_INV_DTL.DTL_ID%type,
        P_PRICE                     in SALES_RETURN_INV_DTL.PRICE%type default null,
        P_QUANTITY                  in SALES_RETURN_INV_DTL.QUANTITY%type default null,
        P_DISCOUNT_VALUE            in SALES_RETURN_INV_DTL.DISCOUNT_VALUE%type default null,
        P_PRODUCT_ID                in SALES_RETURN_INV_DTL.PRODUCT_ID%type default null,
        P_PRE_DISCOUNT_VAT_VALUE    in SALES_RETURN_INV_DTL.PRE_DISCOUNT_VAT_VALUE%type default null,
        P_INVOICE_ID                in SALES_RETURN_INV_DTL.INVOICE_ID%type default null,
        P_VAT_PERCENTAGE            in SALES_RETURN_INV_DTL.VAT_PERCENTAGE%type default null,
        P_TOTAL_PRICE               in SALES_RETURN_INV_DTL.TOTAL_PRICE%type default null,
        P_VAT_VALUE                 in SALES_RETURN_INV_DTL.VAT_VALUE%type default null,
        P_PRODUCT_UNIT_ID           in SALES_RETURN_INV_DTL.PRODUCT_UNIT_ID%type default null,
        P_DISCOUNT_PERCENTAGE       in SALES_RETURN_INV_DTL.DISCOUNT_PERCENTAGE%type default null,
        P_POST_DISCOUNT_TOTAL_PRICE in SALES_RETURN_INV_DTL.POST_DISCOUNT_TOTAL_PRICE%type default null,
        P_TOTAL_AMOUNT              in SALES_RETURN_INV_DTL.TOTAL_AMOUNT%type default null
    );
-- delete
    procedure DELETE_SALES_RETURN_INV_DTL (
        P_DTL_ID in SALES_RETURN_INV_DTL.DTL_ID%type
    );

  PROCEDURE DEL_DTL (
        P_INVOICE_ID  IN  NUMBER,
        P_ID_LIST     IN  JSON_ARRAY_T
    );

end SALES_RETURN_INV_DTL_TAPI;

/
--------------------------------------------------------
--  DDL for Package SALES_RETURN_INV_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SALES_RETURN_INV_TAPI" IS
    PROCEDURE INSERT_SALES_RETURN_INV (
        P_INVOICE_ID                 IN OUT SALES_RETURN_INV.INVOICE_ID%TYPE,
        P_INVOICE_NO                 IN OUT SALES_RETURN_INV.INVOICE_NO%TYPE,
        P_BRANCH_ID                   IN      SALES_RETURN_INV.BRANCH_ID%TYPE DEFAULT NULL,
        P_BANK_ACC_ID                IN SALES_RETURN_INV.BANK_ACC_ID%TYPE DEFAULT NULL,
        P_ACC_JOURNAL_ID             IN SALES_RETURN_INV.ACC_JOURNAL_ID%TYPE DEFAULT NULL,
        P_PAID_AMOUNT                IN SALES_RETURN_INV.PAID_AMOUNT%TYPE DEFAULT NULL,
        P_SAFE_ID                    IN SALES_RETURN_INV.SAFE_ID%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_AMOUNT IN SALES_RETURN_INV.POST_DISCOUNT_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_USER_ID                    IN SALES_RETURN_INV.USER_ID%TYPE DEFAULT NULL,
        P_TOTAL_DISCOUNT             IN SALES_RETURN_INV.TOTAL_DISCOUNT%TYPE DEFAULT NULL,
        P_INVOICE_DATE               IN SALES_RETURN_INV.INVOICE_DATE%TYPE DEFAULT NULL,
        P_NOTES                      IN SALES_RETURN_INV.NOTES%TYPE DEFAULT NULL,
        P_INVOICE_TOTAL_AMOUNT       IN SALES_RETURN_INV.INVOICE_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_TYPE               IN SALES_RETURN_INV.INVOICE_TYPE%TYPE DEFAULT NULL,
        P_CLIENT_ID                  IN SALES_RETURN_INV.CLIENT_ID%TYPE DEFAULT NULL,
        P_TOTAL_QUANTITY             IN SALES_RETURN_INV.TOTAL_QUANTITY%TYPE DEFAULT NULL,
        P_STORE_ID                   IN SALES_RETURN_INV.STORE_ID%TYPE DEFAULT NULL,
        P_SALES_INV_ID               IN SALES_RETURN_INV.SALES_INV_ID%TYPE DEFAULT NULL,
        P_PRE_TAX_TOTAL_AMOUNT       IN SALES_RETURN_INV.PRE_TAX_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COMPANY_ID                 IN SALES_RETURN_INV.COMPANY_ID%TYPE,
        P_PAID_BANK_AMOUNT           IN SALES_RETURN_INV.PAID_BANK_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CTR_ID                IN SALES_RETURN_INV.COST_CTR_ID%TYPE DEFAULT NULL,
        P_CLIENT_DISCOUNT            IN SALES_RETURN_INV.CLIENT_DISCOUNT%TYPE DEFAULT NULL,
        P_TOTAL_VAT                  IN SALES_RETURN_INV.TOTAL_VAT%TYPE DEFAULT NULL,
        P_PAYMENT_TYPE               IN SALES_RETURN_INV.PAYMENT_TYPE%TYPE DEFAULT NULL,
        P_DEFERRED_AMOUNT            IN SALES_RETURN_INV.DEFERRED_AMOUNT%TYPE DEFAULT NULL,
        P_STORE_DATE                 IN SALES_RETURN_INV.STORE_DATE%TYPE DEFAULT NULL,
        P_PAID_CASH_AMOUNT           IN SALES_RETURN_INV.PAID_CASH_AMOUNT%TYPE DEFAULT NULL
    );
-- update
    PROCEDURE UPDATE_SALES_RETURN_INV (
        P_INVOICE_ID                 IN SALES_RETURN_INV.INVOICE_ID%TYPE,
        P_INVOICE_NO                 IN  SALES_RETURN_INV.INVOICE_NO%TYPE,
        P_BRANCH_ID                   IN      SALES_RETURN_INV.BRANCH_ID%TYPE DEFAULT NULL,
        P_BANK_ACC_ID                IN SALES_RETURN_INV.BANK_ACC_ID%TYPE DEFAULT NULL,
        P_ACC_JOURNAL_ID             IN SALES_RETURN_INV.ACC_JOURNAL_ID%TYPE DEFAULT NULL,
        P_PAID_AMOUNT                IN SALES_RETURN_INV.PAID_AMOUNT%TYPE DEFAULT NULL,
        P_SAFE_ID                    IN SALES_RETURN_INV.SAFE_ID%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_AMOUNT IN SALES_RETURN_INV.POST_DISCOUNT_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_USER_ID                    IN SALES_RETURN_INV.USER_ID%TYPE DEFAULT NULL,
        P_TOTAL_DISCOUNT             IN SALES_RETURN_INV.TOTAL_DISCOUNT%TYPE DEFAULT NULL,
        P_INVOICE_DATE               IN SALES_RETURN_INV.INVOICE_DATE%TYPE DEFAULT NULL,
        P_NOTES                      IN SALES_RETURN_INV.NOTES%TYPE DEFAULT NULL,
        P_INVOICE_TOTAL_AMOUNT       IN SALES_RETURN_INV.INVOICE_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_TYPE               IN SALES_RETURN_INV.INVOICE_TYPE%TYPE DEFAULT NULL,
        P_CLIENT_ID                  IN SALES_RETURN_INV.CLIENT_ID%TYPE DEFAULT NULL,
        P_TOTAL_QUANTITY             IN SALES_RETURN_INV.TOTAL_QUANTITY%TYPE DEFAULT NULL,
        P_STORE_ID                   IN SALES_RETURN_INV.STORE_ID%TYPE DEFAULT NULL,
        P_SALES_INV_ID               IN SALES_RETURN_INV.SALES_INV_ID%TYPE DEFAULT NULL,
        P_PRE_TAX_TOTAL_AMOUNT       IN SALES_RETURN_INV.PRE_TAX_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COMPANY_ID                 IN SALES_RETURN_INV.COMPANY_ID%TYPE,
        P_PAID_BANK_AMOUNT           IN SALES_RETURN_INV.PAID_BANK_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CTR_ID                IN SALES_RETURN_INV.COST_CTR_ID%TYPE DEFAULT NULL,
        P_CLIENT_DISCOUNT            IN SALES_RETURN_INV.CLIENT_DISCOUNT%TYPE DEFAULT NULL,
        P_TOTAL_VAT                  IN SALES_RETURN_INV.TOTAL_VAT%TYPE DEFAULT NULL,
        P_PAYMENT_TYPE               IN SALES_RETURN_INV.PAYMENT_TYPE%TYPE DEFAULT NULL,
        P_DEFERRED_AMOUNT            IN SALES_RETURN_INV.DEFERRED_AMOUNT%TYPE DEFAULT NULL,
        P_STORE_DATE                 IN SALES_RETURN_INV.STORE_DATE%TYPE DEFAULT NULL,
        P_PAID_CASH_AMOUNT           IN SALES_RETURN_INV.PAID_CASH_AMOUNT%TYPE DEFAULT NULL
    );
-- delete
    PROCEDURE DELETE_SALES_RETURN_INV (
        P_INVOICE_ID IN SALES_RETURN_INV.INVOICE_ID%TYPE
    );

END SALES_RETURN_INV_TAPI;

/
--------------------------------------------------------
--  DDL for Package SETUP_APP_ROLE_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SETUP_APP_ROLE_TAPI" is
--------------------------------------------------------------
-- create procedure for table SETUP_APP_ROLE
--------------------------------------------------------------
   procedure INSERT_SETUP_APP_ROLE (
      P_ROLE_ID      in OUT SETUP_APP_ROLE.ROLE_ID%TYPE                           ,
      P_ROLE_NAME    in SETUP_APP_ROLE.ROLE_NAME%TYPE                         default null,
      P_CREATED_BY   in SETUP_APP_ROLE.CREATED_BY%TYPE                        default null,
      P_CREATED_AT   in SETUP_APP_ROLE.CREATED_AT%TYPE                        default null,
      P_COMPANY_ID   in SETUP_APP_ROLE.COMPANY_ID%TYPE                        default null,
      P_ROLE_NAME_EN in SETUP_APP_ROLE.ROLE_NAME_EN%TYPE                      default null
   );
--------------------------------------------------------------
-- update procedure for table SETUP_APP_ROLE
--------------------------------------------------------------
   procedure UPDATE_SETUP_APP_ROLE (
      P_ROLE_ID      in SETUP_APP_ROLE.ROLE_ID%TYPE         ,
      P_ROLE_NAME    in SETUP_APP_ROLE.ROLE_NAME%TYPE                          default null,
      P_MODIFIED_BY  in SETUP_APP_ROLE.MODIFIED_BY%TYPE                        default null,
      P_MODIFIED_AT  in SETUP_APP_ROLE.MODIFIED_AT%TYPE                       default null,
      P_COMPANY_ID   in SETUP_APP_ROLE.COMPANY_ID%TYPE                         default null,
      P_ROLE_NAME_EN in SETUP_APP_ROLE.ROLE_NAME_EN%TYPE                       default null
   );
--------------------------------------------------------------
-- delete procedure for table SETUP_APP_ROLE
--------------------------------------------------------------
   procedure DELETE_SETUP_APP_ROLE (
      P_ROLE_ID    IN  SETUP_APP_ROLE.ROLE_ID%TYPE  
   );

end SETUP_APP_ROLE_TAPI;


/
--------------------------------------------------------
--  DDL for Package SETUP_APP_USER_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SETUP_APP_USER_TAPI" is
--------------------------------------------------------------
-- create procedure for table SETUP_APP_USER
--------------------------------------------------------------
   procedure INSERT_SETUP_APP_USER (
      P_USER_ID     in OUT SETUP_APP_USER.USER_ID%TYPE                            ,
      P_USER_NAME   in SETUP_APP_USER.USER_NAME%TYPE                          default null,
      P_PASS        in SETUP_APP_USER.PASS%TYPE                               default null,
      P_CREATED_BY  in SETUP_APP_USER.CREATED_BY%TYPE                         default null,
      P_CREATED_AT  in SETUP_APP_USER.CREATED_AT%TYPE                        default null,
      P_STATUS      in SETUP_APP_USER.STATUS%TYPE                             default null,
      P_USER_TYPE   in SETUP_APP_USER.USER_TYPE%TYPE                          default null,
      P_COMPANY_ID  in SETUP_APP_USER.COMPANY_ID%TYPE                         default null
   );
--------------------------------------------------------------
-- update procedure for table SETUP_APP_USER
--------------------------------------------------------------
   procedure UPDATE_SETUP_APP_USER (
      P_USER_ID     in SETUP_APP_USER.USER_ID%TYPE    ,     
      P_USER_NAME   in SETUP_APP_USER.USER_NAME%TYPE                           default null,
      P_PASS        in SETUP_APP_USER.PASS%TYPE                                default null,
      P_MODIFIED_BY in SETUP_APP_USER.MODIFIED_BY%TYPE                         default null,
      P_MODIFIED_AT in SETUP_APP_USER.MODIFIED_AT%TYPE                         default null,
      P_STATUS      in SETUP_APP_USER.STATUS%TYPE                              default null,
      P_USER_TYPE   in SETUP_APP_USER.USER_TYPE%TYPE                           default null,
      P_COMPANY_ID  in SETUP_APP_USER.COMPANY_ID%TYPE                          default null
   );
--------------------------------------------------------------
-- delete procedure for table SETUP_APP_USER
--------------------------------------------------------------
   procedure DELETE_SETUP_APP_USER (
      P_USER_ID     in SETUP_APP_USER.USER_ID%TYPE 
   );


end SETUP_APP_USER_TAPI;


/
--------------------------------------------------------
--  DDL for Package SETUP_PROD_GROUP_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SETUP_PROD_GROUP_TAPI" is
--------------------------------------------------------------
-- create procedure for table SETUP_PROD_GROUP
--------------------------------------------------------------
   procedure INSERT_SETUP_PROD_GROUP (
      P_GROUP_ID   in OUT SETUP_PROD_GROUP.GROUP_ID  %TYPE                       ,
      P_NAME_AR    in SETUP_PROD_GROUP.NAME_AR   %TYPE                        default null,
      P_NAME_EN    in SETUP_PROD_GROUP.NAME_EN   %TYPE                        default null,
      P_STATUS     in SETUP_PROD_GROUP.STATUS    %TYPE                        default null,
      P_COMPANY_ID in SETUP_PROD_GROUP.COMPANY_ID%TYPE
   );
--------------------------------------------------------------
-- update procedure for table SETUP_PROD_GROUP
--------------------------------------------------------------
   procedure UPDATE_SETUP_PROD_GROUP (
      P_GROUP_ID   in SETUP_PROD_GROUP.GROUP_ID%TYPE  ,
      P_NAME_AR    in SETUP_PROD_GROUP.NAME_AR%TYPE                       default null,
      P_NAME_EN    in SETUP_PROD_GROUP.NAME_EN%TYPE                       default null,
      P_STATUS     in SETUP_PROD_GROUP.STATUS%TYPE                       default null,
      P_COMPANY_ID in SETUP_PROD_GROUP.COMPANY_ID%TYPE
   );
--------------------------------------------------------------
-- delete procedure for table SETUP_PROD_GROUP
--------------------------------------------------------------
   procedure DELETE_SETUP_PROD_GROUP (
      P_GROUP_ID   in SETUP_PROD_GROUP.GROUP_ID  %TYPE 
   );

end SETUP_PROD_GROUP_TAPI;


/
--------------------------------------------------------
--  DDL for Package SETUP_SAFE_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SETUP_SAFE_TAPI" IS
--------------------------------------------------------------
-- CREATE PROCEDURE FOR TABLE SETUP_SAFE
--------------------------------------------------------------
   PROCEDURE INSERT_SETUP_SAFE (
      P_SAFE_ID          IN OUT SETUP_SAFE.SAFE_ID%TYPE                      ,
      P_SAFE_NAME_AR        IN SETUP_SAFE.SAFE_NAME_AR%TYPE                       DEFAULT NULL,
      P_SAFE_NAME_EN        IN SETUP_SAFE.SAFE_NAME_EN%TYPE                       DEFAULT NULL,
      P_BRANCH_ID        IN SETUP_SAFE.BRANCH_ID       %TYPE                       DEFAULT NULL,
      P_ACCOUNT_ID       IN SETUP_SAFE.ACCOUNT_ID      %TYPE                       DEFAULT NULL,
      P_NOTE             IN SETUP_SAFE.NOTE            %TYPE                       DEFAULT NULL,
      P_IS_DEFAULT       IN SETUP_SAFE.IS_DEFAULT      %TYPE                       DEFAULT NULL,
      P_FOR_ALL_BRANCHES IN SETUP_SAFE.FOR_ALL_BRANCHES%TYPE                       DEFAULT NULL,
      P_STATUS           IN SETUP_SAFE.STATUS          %TYPE                       DEFAULT NULL,
      P_COMPANY_ID       IN SETUP_SAFE.COMPANY_ID      %TYPE
   );
--------------------------------------------------------------
-- UPDATE PROCEDURE FOR TABLE SETUP_SAFE
--------------------------------------------------------------
   PROCEDURE UPDATE_SETUP_SAFE (
      P_SAFE_ID          IN SETUP_SAFE.SAFE_ID         %TYPE                      ,
      P_SAFE_NAME_AR        IN SETUP_SAFE.SAFE_NAME_AR%TYPE                       DEFAULT NULL,
      P_SAFE_NAME_EN        IN SETUP_SAFE.SAFE_NAME_EN%TYPE                       DEFAULT NULL,
      P_BRANCH_ID        IN SETUP_SAFE.BRANCH_ID       %TYPE                       DEFAULT NULL,
      P_ACCOUNT_ID       IN SETUP_SAFE.ACCOUNT_ID      %TYPE                       DEFAULT NULL,
      P_NOTE             IN SETUP_SAFE.NOTE            %TYPE                       DEFAULT NULL,
      P_IS_DEFAULT       IN SETUP_SAFE.IS_DEFAULT      %TYPE                       DEFAULT NULL,
      P_FOR_ALL_BRANCHES IN SETUP_SAFE.FOR_ALL_BRANCHES%TYPE                       DEFAULT NULL,
      P_STATUS           IN SETUP_SAFE.STATUS          %TYPE                       DEFAULT NULL,
      P_COMPANY_ID       IN SETUP_SAFE.COMPANY_ID      %TYPE
   );
--------------------------------------------------------------
-- DELETE PROCEDURE FOR TABLE SETUP_SAFE
--------------------------------------------------------------
   PROCEDURE DELETE_SETUP_SAFE (
      P_SAFE_ID          IN SETUP_SAFE.SAFE_ID%TYPE 
   );


END SETUP_SAFE_TAPI;

/
--------------------------------------------------------
--  DDL for Package SETUP_STORE_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SETUP_STORE_TAPI" is
--------------------------------------------------------------
-- create procedure for table SETUP_STORE
--------------------------------------------------------------
   procedure INSERT_SETUP_STORE (
      P_STORE_ID      in OUT SETUP_STORE.STORE_ID%TYPE                       ,
      P_STORE_NAME    in SETUP_STORE.STORE_NAME_ar%TYPE                       default null,
      P_BRANCH_ID     in SETUP_STORE.BRANCH_ID%TYPE                       default null,
      P_NOTE          in SETUP_STORE.NOTE%TYPE                       default null,
      P_STATUS        in SETUP_STORE.STATUS%TYPE                       default null,
      P_COMPANY_ID    in SETUP_STORE.COMPANY_ID%TYPE,
      P_STORE_NAME_EN in SETUP_STORE.STORE_NAME_EN%TYPE                       default null
   );
--------------------------------------------------------------
-- update procedure for table SETUP_STORE
--------------------------------------------------------------
   procedure UPDATE_SETUP_STORE (
       P_STORE_ID      in SETUP_STORE.STORE_ID%TYPE                       ,
      P_STORE_NAME    in SETUP_STORE.STORE_NAME_ar%TYPE                       default null,
      P_BRANCH_ID     in SETUP_STORE.BRANCH_ID%TYPE                       default null,
      P_NOTE          in SETUP_STORE.NOTE%TYPE                       default null,
      P_STATUS        in SETUP_STORE.STATUS%TYPE                       default null,
      P_COMPANY_ID    in SETUP_STORE.COMPANY_ID%TYPE,
      P_STORE_NAME_EN in SETUP_STORE.STORE_NAME_EN%TYPE                       default null
   );
--------------------------------------------------------------
-- delete procedure for table SETUP_STORE
--------------------------------------------------------------
   procedure DELETE_SETUP_STORE (
      P_STORE_ID      in SETUP_STORE.STORE_ID%TYPE  
   );

end SETUP_STORE_TAPI;

/
--------------------------------------------------------
--  DDL for Package SETUP_TAX_GROUP_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "SETUP_TAX_GROUP_TAPI" is
--------------------------------------------------------------
-- create procedure for table SETUP_TAX_GROUP
--------------------------------------------------------------
   procedure INSERT_SETUP_TAX_GROUP (
      P_GROUP_ID    in OUT SETUP_TAX_GROUP.GROUP_ID   %TYPE                     ,
      P_NAME_AR     in SETUP_TAX_GROUP.NAME_AR    %TYPE                      default null,
      P_NAME_EN     in SETUP_TAX_GROUP.NAME_EN    %TYPE                      default null,
      P_GROUP_VALUE in SETUP_TAX_GROUP.GROUP_VALUE%TYPE                      default null,
      P_STATUS      in SETUP_TAX_GROUP.STATUS     %TYPE                      default null,
      P_COMPANY_ID  in SETUP_TAX_GROUP.COMPANY_ID %TYPE
   );
--------------------------------------------------------------
-- update procedure for table SETUP_TAX_GROUP
--------------------------------------------------------------
   procedure UPDATE_SETUP_TAX_GROUP (
      P_GROUP_ID    in SETUP_TAX_GROUP.GROUP_ID   %TYPE                     ,
      P_NAME_AR     in SETUP_TAX_GROUP.NAME_AR    %TYPE                      default null,
      P_NAME_EN     in SETUP_TAX_GROUP.NAME_EN    %TYPE                      default null,
      P_GROUP_VALUE in SETUP_TAX_GROUP.GROUP_VALUE%TYPE                      default null,
      P_STATUS      in SETUP_TAX_GROUP.STATUS     %TYPE                      default null,
      P_COMPANY_ID  in SETUP_TAX_GROUP.COMPANY_ID %TYPE
   );
--------------------------------------------------------------
-- delete procedure for table SETUP_TAX_GROUP
--------------------------------------------------------------
   procedure DELETE_SETUP_TAX_GROUP (
      P_GROUP_ID    in SETUP_TAX_GROUP.GROUP_ID   %TYPE  
   );


end SETUP_TAX_GROUP_TAPI;


/
--------------------------------------------------------
--  DDL for Package STORE_FIRST_PERIOD_STOCK_DTL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "STORE_FIRST_PERIOD_STOCK_DTL_TAPI" IS
    PROCEDURE INS (
        P_INVOICE_ID       IN  STORE_FIRST_PERIOD_STOCK_DTL.INVOICE_ID%TYPE DEFAULT NULL,
        P_PRICE            IN  STORE_FIRST_PERIOD_STOCK_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY         IN  STORE_FIRST_PERIOD_STOCK_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID  IN  STORE_FIRST_PERIOD_STOCK_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_PRODUCT_ID       IN  STORE_FIRST_PERIOD_STOCK_DTL.PRODUCT_ID%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT     IN  STORE_FIRST_PERIOD_STOCK_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL
    );

    PROCEDURE UPD (
        P_INVOICE_ID       IN  STORE_FIRST_PERIOD_STOCK_DTL.INVOICE_ID%TYPE DEFAULT NULL,
        P_DTL_ID           IN  STORE_FIRST_PERIOD_STOCK_DTL.DTL_ID%TYPE,
        P_PRICE            IN  STORE_FIRST_PERIOD_STOCK_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY         IN  STORE_FIRST_PERIOD_STOCK_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID  IN  STORE_FIRST_PERIOD_STOCK_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_PRODUCT_ID       IN  STORE_FIRST_PERIOD_STOCK_DTL.PRODUCT_ID%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT     IN  STORE_FIRST_PERIOD_STOCK_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL
    );

    PROCEDURE DEL (
        P_DTL_ID IN STORE_FIRST_PERIOD_STOCK_DTL.DTL_ID%TYPE
    );

  PROCEDURE DEL_DTL (
        P_INVOICE_ID  IN  NUMBER,
        P_ID_LIST     IN  JSON_ARRAY_T
    );

END STORE_FIRST_PERIOD_STOCK_DTL_TAPI;

/
--------------------------------------------------------
--  DDL for Package STORE_FIRST_PERIOD_STOCK_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "STORE_FIRST_PERIOD_STOCK_TAPI" IS
    PROCEDURE INS (
        P_SAFE_ID               IN   STORE_FIRST_PERIOD_STOCK.SAFE_ID%TYPE DEFAULT NULL,
        P_USER_ID               IN   STORE_FIRST_PERIOD_STOCK.USER_ID%TYPE DEFAULT NULL,
        P_COST_CTR_ID           IN   STORE_FIRST_PERIOD_STOCK.COST_CTR_ID%TYPE DEFAULT NULL,
        P_PROVIDER_ID           IN   STORE_FIRST_PERIOD_STOCK.PROVIDER_ID%TYPE DEFAULT NULL,
        P_PROVIDER_INV_ID       IN   STORE_FIRST_PERIOD_STOCK.PROVIDER_INV_ID%TYPE DEFAULT NULL,
        P_NOTES                 IN   STORE_FIRST_PERIOD_STOCK.NOTES%TYPE DEFAULT NULL,
        P_INVOICE_DATE          IN   STORE_FIRST_PERIOD_STOCK.INVOICE_DATE%TYPE DEFAULT NULL,
        P_INVOICE_TOTAL_AMOUNT  IN   STORE_FIRST_PERIOD_STOCK.INVOICE_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_PROVIDER_INV_DATE     IN   STORE_FIRST_PERIOD_STOCK.PROVIDER_INV_DATE%TYPE DEFAULT NULL,
        P_STORE_DATE            IN   STORE_FIRST_PERIOD_STOCK.STORE_DATE%TYPE DEFAULT NULL,
        P_INVOICE_TYPE          IN   STORE_FIRST_PERIOD_STOCK.INVOICE_TYPE%TYPE DEFAULT NULL,
        P_TOTAL_QUANTITY        IN   STORE_FIRST_PERIOD_STOCK.TOTAL_QUANTITY%TYPE DEFAULT NULL,
        P_STORE_ID              IN   STORE_FIRST_PERIOD_STOCK.STORE_ID%TYPE DEFAULT NULL,
        P_COMPANY_ID            IN   STORE_FIRST_PERIOD_STOCK.COMPANY_ID%TYPE,
        P_BRANCH_ID             IN   STORE_FIRST_PERIOD_STOCK.BRANCH_ID%TYPE DEFAULT NULL,
        P_INVOICE_NO            OUT  STORE_FIRST_PERIOD_STOCK.INVOICE_NO%TYPE,
        P_INVOICE_ID            OUT  STORE_FIRST_PERIOD_STOCK.INVOICE_ID%TYPE
    );

    PROCEDURE UPD (
        P_SAFE_ID               IN      STORE_FIRST_PERIOD_STOCK.SAFE_ID%TYPE DEFAULT NULL,
        P_USER_ID               IN      STORE_FIRST_PERIOD_STOCK.USER_ID%TYPE DEFAULT NULL,
        P_COST_CTR_ID           IN      STORE_FIRST_PERIOD_STOCK.COST_CTR_ID%TYPE DEFAULT NULL,
        P_PROVIDER_ID           IN      STORE_FIRST_PERIOD_STOCK.PROVIDER_ID%TYPE DEFAULT NULL,
        P_PROVIDER_INV_ID       IN      STORE_FIRST_PERIOD_STOCK.PROVIDER_INV_ID%TYPE DEFAULT NULL,
        P_NOTES                 IN      STORE_FIRST_PERIOD_STOCK.NOTES%TYPE DEFAULT NULL,
        P_INVOICE_DATE          IN      STORE_FIRST_PERIOD_STOCK.INVOICE_DATE%TYPE DEFAULT NULL,
        P_INVOICE_TOTAL_AMOUNT  IN      STORE_FIRST_PERIOD_STOCK.INVOICE_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_PROVIDER_INV_DATE     IN      STORE_FIRST_PERIOD_STOCK.PROVIDER_INV_DATE%TYPE DEFAULT NULL,
        P_STORE_DATE            IN      STORE_FIRST_PERIOD_STOCK.STORE_DATE%TYPE DEFAULT NULL,
        P_INVOICE_TYPE          IN      STORE_FIRST_PERIOD_STOCK.INVOICE_TYPE%TYPE DEFAULT NULL,
        P_TOTAL_QUANTITY        IN      STORE_FIRST_PERIOD_STOCK.TOTAL_QUANTITY%TYPE DEFAULT NULL,
        P_STORE_ID              IN      STORE_FIRST_PERIOD_STOCK.STORE_ID%TYPE DEFAULT NULL,
        P_COMPANY_ID            IN      STORE_FIRST_PERIOD_STOCK.COMPANY_ID%TYPE,
        P_INVOICE_NO            IN OUT  STORE_FIRST_PERIOD_STOCK.INVOICE_NO%TYPE,
        P_BRANCH_ID                   IN      STORE_FIRST_PERIOD_STOCK.BRANCH_ID%TYPE DEFAULT NULL,
        P_INVOICE_ID            IN      STORE_FIRST_PERIOD_STOCK.INVOICE_ID%TYPE
    );

    PROCEDURE DEL (
        P_INVOICE_ID IN STORE_FIRST_PERIOD_STOCK.INVOICE_ID%TYPE
    );

END STORE_FIRST_PERIOD_STOCK_TAPI;

/
--------------------------------------------------------
--  DDL for Package STORE_STOCKIN_ORDER_DTL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "STORE_STOCKIN_ORDER_DTL_TAPI" IS
    
    PROCEDURE INSERT_STORE_STOCKIN_ORDER_DTL (
        P_DTL_ID          IN OUT STORE_STOCKIN_ORDER_DTL.DTL_ID%TYPE,
        P_TOTAL           IN STORE_STOCKIN_ORDER_DTL.TOTAL%TYPE DEFAULT NULL,
        P_ORDER_ID        IN STORE_STOCKIN_ORDER_DTL.ORDER_ID%TYPE DEFAULT NULL,
        P_PRICE           IN STORE_STOCKIN_ORDER_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY        IN STORE_STOCKIN_ORDER_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID IN STORE_STOCKIN_ORDER_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_PRODUCT_ID      IN STORE_STOCKIN_ORDER_DTL.PRODUCT_ID%TYPE DEFAULT NULL
    );
    
    PROCEDURE UPDATE_STORE_STOCKIN_ORDER_DTL (
        P_DTL_ID          IN STORE_STOCKIN_ORDER_DTL.DTL_ID%TYPE,
        P_TOTAL           IN STORE_STOCKIN_ORDER_DTL.TOTAL%TYPE DEFAULT NULL,
        P_ORDER_ID        IN STORE_STOCKIN_ORDER_DTL.ORDER_ID%TYPE DEFAULT NULL,
        P_PRICE           IN STORE_STOCKIN_ORDER_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY        IN STORE_STOCKIN_ORDER_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID IN STORE_STOCKIN_ORDER_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_PRODUCT_ID      IN STORE_STOCKIN_ORDER_DTL.PRODUCT_ID%TYPE DEFAULT NULL
    );
    PROCEDURE DELETE_STORE_STOCKIN_ORDER_DTL (
        P_DTL_ID IN STORE_STOCKIN_ORDER_DTL.DTL_ID%TYPE
    );

  PROCEDURE DEL_DTL (
        P_ORDER_ID    IN  NUMBER,
        P_ID_LIST     IN  JSON_ARRAY_T
    );

END STORE_STOCKIN_ORDER_DTL_TAPI;

/
--------------------------------------------------------
--  DDL for Package STORE_STOCKIN_ORDER_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "STORE_STOCKIN_ORDER_TAPI" IS
    PROCEDURE INSERT_STORE_STOCKIN_ORDER (
        P_ORDER_ID         IN OUT STORE_STOCKIN_ORDER.ORDER_ID%TYPE,
        P_ORDER_NO          IN OUT STORE_STOCKIN_ORDER.ORDER_NO%TYPE,
        P_ACC_JOURNAL_ID   IN STORE_STOCKIN_ORDER.ACC_JOURNAL_ID%TYPE DEFAULT NULL,
        P_ORDER_DATE       IN STORE_STOCKIN_ORDER.ORDER_DATE%TYPE DEFAULT NULL,
        P_ACCOUNT_ID       IN STORE_STOCKIN_ORDER.ACCOUNT_ID%TYPE DEFAULT NULL,
        P_USER_ID          IN STORE_STOCKIN_ORDER.USER_ID%TYPE DEFAULT NULL,
        P_COST_CTR_ID      IN STORE_STOCKIN_ORDER.COST_CTR_ID%TYPE DEFAULT NULL,
        P_NOTES            IN STORE_STOCKIN_ORDER.NOTES%TYPE DEFAULT NULL,
        P_STORE_ID         IN STORE_STOCKIN_ORDER.STORE_ID%TYPE DEFAULT NULL,
        P_REF_ID           IN STORE_STOCKIN_ORDER.REF_ID%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT     IN STORE_STOCKIN_ORDER.TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_ACCOUNTABLE      IN STORE_STOCKIN_ORDER.ACCOUNTABLE%TYPE DEFAULT NULL,
        P_BRANCH_ID                   IN      STORE_STOCKIN_ORDER.BRANCH_ID%TYPE DEFAULT NULL,
        P_COMPANY_ID       IN STORE_STOCKIN_ORDER.COMPANY_ID%TYPE
    );
-- update
    PROCEDURE UPDATE_STORE_STOCKIN_ORDER (
        P_ORDER_ID         IN STORE_STOCKIN_ORDER.ORDER_ID%TYPE,
        P_ORDER_NO          IN  STORE_STOCKIN_ORDER.ORDER_NO%TYPE,
        P_ACC_JOURNAL_ID   IN STORE_STOCKIN_ORDER.ACC_JOURNAL_ID%TYPE DEFAULT NULL,
        P_ORDER_DATE       IN STORE_STOCKIN_ORDER.ORDER_DATE%TYPE DEFAULT NULL,
        P_ACCOUNT_ID       IN STORE_STOCKIN_ORDER.ACCOUNT_ID%TYPE DEFAULT NULL,
        P_USER_ID          IN STORE_STOCKIN_ORDER.USER_ID%TYPE DEFAULT NULL,
        P_COST_CTR_ID      IN STORE_STOCKIN_ORDER.COST_CTR_ID%TYPE DEFAULT NULL,
        P_NOTES            IN STORE_STOCKIN_ORDER.NOTES%TYPE DEFAULT NULL,
        P_STORE_ID         IN STORE_STOCKIN_ORDER.STORE_ID%TYPE DEFAULT NULL,
        P_REF_ID           IN STORE_STOCKIN_ORDER.REF_ID%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT     IN STORE_STOCKIN_ORDER.TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_ACCOUNTABLE      IN STORE_STOCKIN_ORDER.ACCOUNTABLE%TYPE DEFAULT NULL,
        P_BRANCH_ID                   IN      STORE_STOCKIN_ORDER.BRANCH_ID%TYPE DEFAULT NULL,
        P_COMPANY_ID       IN STORE_STOCKIN_ORDER.COMPANY_ID%TYPE
    );
-- delete
    PROCEDURE DELETE_STORE_STOCKIN_ORDER (
        P_ORDER_ID IN STORE_STOCKIN_ORDER.ORDER_ID%TYPE
    );

END STORE_STOCKIN_ORDER_TAPI;

/
--------------------------------------------------------
--  DDL for Package STORE_STOCKOUT_ORDER_DTL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "STORE_STOCKOUT_ORDER_DTL_TAPI" IS

    PROCEDURE INS (
        P_TOTAL            IN  STORE_STOCKOUT_ORDER_DTL.TOTAL%TYPE DEFAULT NULL,
        P_ORDER_ID         IN  STORE_STOCKOUT_ORDER_DTL.ORDER_ID%TYPE DEFAULT NULL,
        P_PRICE            IN  STORE_STOCKOUT_ORDER_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY         IN  STORE_STOCKOUT_ORDER_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID  IN  STORE_STOCKOUT_ORDER_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_PRODUCT_ID       IN  STORE_STOCKOUT_ORDER_DTL.PRODUCT_ID%TYPE DEFAULT NULL
    );
    
    PROCEDURE UPD (
        P_TOTAL            IN  STORE_STOCKOUT_ORDER_DTL.TOTAL%TYPE DEFAULT NULL,
        P_DTL_ID           IN  STORE_STOCKOUT_ORDER_DTL.DTL_ID%TYPE,
        P_ORDER_ID         IN  STORE_STOCKOUT_ORDER_DTL.ORDER_ID%TYPE DEFAULT NULL,
        P_PRICE            IN  STORE_STOCKOUT_ORDER_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY         IN  STORE_STOCKOUT_ORDER_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID  IN  STORE_STOCKOUT_ORDER_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_PRODUCT_ID       IN  STORE_STOCKOUT_ORDER_DTL.PRODUCT_ID%TYPE DEFAULT NULL
    );
    
    PROCEDURE DEL (
        P_DTL_ID IN STORE_STOCKOUT_ORDER_DTL.DTL_ID%TYPE
    );

  PROCEDURE DEL_DTL (
        P_ORDER_ID    IN  NUMBER,
        P_ID_LIST     IN  JSON_ARRAY_T
    );

END STORE_STOCKOUT_ORDER_DTL_TAPI;

/
--------------------------------------------------------
--  DDL for Package STORE_STOCKOUT_ORDER_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "STORE_STOCKOUT_ORDER_TAPI" IS
    PROCEDURE INS (
        P_NOTES           IN   STORE_STOCKOUT_ORDER.NOTES%TYPE DEFAULT NULL,
        P_ORDER_DATE      IN   STORE_STOCKOUT_ORDER.ORDER_DATE%TYPE DEFAULT NULL,
        P_ACCOUNT_ID      IN   STORE_STOCKOUT_ORDER.ACCOUNT_ID%TYPE DEFAULT NULL,
        P_USER_ID         IN   STORE_STOCKOUT_ORDER.USER_ID%TYPE DEFAULT NULL,
        P_STORE_ID        IN   STORE_STOCKOUT_ORDER.STORE_ID%TYPE DEFAULT NULL,
        P_COST_CTR_ID     IN   STORE_STOCKOUT_ORDER.COST_CTR_ID%TYPE DEFAULT NULL,
        P_REF_ID          IN   STORE_STOCKOUT_ORDER.REF_ID%TYPE DEFAULT NULL,
        P_COMPANY_ID      IN   STORE_STOCKOUT_ORDER.COMPANY_ID%TYPE,
        P_TOTAL_AMOUNT    IN   STORE_STOCKOUT_ORDER.TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_ACCOUNTABLE     IN   STORE_STOCKOUT_ORDER.ACCOUNTABLE%TYPE DEFAULT NULL,
        P_ORDER_NO        OUT  STORE_STOCKOUT_ORDER.ORDER_NO%TYPE,
        P_BRANCH_ID                   IN      STORE_STOCKOUT_ORDER.BRANCH_ID%TYPE DEFAULT NULL,
        P_ORDER_ID        OUT  STORE_STOCKOUT_ORDER.ORDER_ID%TYPE
    );

    PROCEDURE UPD (
        P_NOTES           IN      STORE_STOCKOUT_ORDER.NOTES%TYPE DEFAULT NULL,
        P_ORDER_ID        IN      STORE_STOCKOUT_ORDER.ORDER_ID%TYPE,
        P_ORDER_NO        IN OUT  STORE_STOCKOUT_ORDER.ORDER_NO%TYPE,
        P_ORDER_DATE      IN      STORE_STOCKOUT_ORDER.ORDER_DATE%TYPE DEFAULT NULL,
        P_ACCOUNT_ID      IN      STORE_STOCKOUT_ORDER.ACCOUNT_ID%TYPE DEFAULT NULL,
        P_USER_ID         IN      STORE_STOCKOUT_ORDER.USER_ID%TYPE DEFAULT NULL,
        P_STORE_ID        IN      STORE_STOCKOUT_ORDER.STORE_ID%TYPE DEFAULT NULL,
        P_COST_CTR_ID     IN      STORE_STOCKOUT_ORDER.COST_CTR_ID%TYPE DEFAULT NULL,
        P_REF_ID          IN      STORE_STOCKOUT_ORDER.REF_ID%TYPE DEFAULT NULL,
        P_COMPANY_ID      IN      STORE_STOCKOUT_ORDER.COMPANY_ID%TYPE,
        P_TOTAL_AMOUNT    IN      STORE_STOCKOUT_ORDER.TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_BRANCH_ID                   IN      STORE_STOCKOUT_ORDER.BRANCH_ID%TYPE DEFAULT NULL,
        P_ACCOUNTABLE     IN      STORE_STOCKOUT_ORDER.ACCOUNTABLE%TYPE DEFAULT NULL
    );

    PROCEDURE DEL (
        P_ORDER_ID IN STORE_STOCKOUT_ORDER.ORDER_ID%TYPE
    );

END STORE_STOCKOUT_ORDER_TAPI;

/
--------------------------------------------------------
--  DDL for Package STORE_TRANSFER_DTL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "STORE_TRANSFER_DTL_TAPI" IS

    PROCEDURE INSERT_STORE_TRANSFER_DTL (
        P_DTL_ID          IN OUT STORE_TRANSFER_DTL.DTL_ID%TYPE,
        P_PRICE           IN STORE_TRANSFER_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY        IN STORE_TRANSFER_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_TRANSFER_ID     IN STORE_TRANSFER_DTL.TRANSFER_ID%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID IN STORE_TRANSFER_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_PRODUCT_ID      IN STORE_TRANSFER_DTL.PRODUCT_ID%TYPE DEFAULT NULL
    );
    
    PROCEDURE UPDATE_STORE_TRANSFER_DTL (
        P_DTL_ID          IN STORE_TRANSFER_DTL.DTL_ID%TYPE,
        P_PRICE           IN STORE_TRANSFER_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY        IN STORE_TRANSFER_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_TRANSFER_ID     IN STORE_TRANSFER_DTL.TRANSFER_ID%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID IN STORE_TRANSFER_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_PRODUCT_ID      IN STORE_TRANSFER_DTL.PRODUCT_ID%TYPE DEFAULT NULL
    );
    
    PROCEDURE DELETE_STORE_TRANSFER_DTL (
        P_DTL_ID IN STORE_TRANSFER_DTL.DTL_ID%TYPE
    );

  PROCEDURE DEL_DTL (
        P_TRANSFER_ID IN  NUMBER,
        P_ID_LIST     IN  JSON_ARRAY_T
    );

END STORE_TRANSFER_DTL_TAPI;

/
--------------------------------------------------------
--  DDL for Package STORE_TRANSFER_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "STORE_TRANSFER_TAPI" IS
    PROCEDURE INSERT_STORE_TRANSFER (
        P_TRANSFER_ID   IN OUT STORE_TRANSFER.TRANSFER_ID%TYPE,
        P_TRANSFER_NO   IN OUT STORE_TRANSFER.TRANSFER_NO%TYPE,
        P_TRANSFER_BY   IN STORE_TRANSFER.TRANSFER_BY%TYPE DEFAULT NULL,
        P_FROM_STORE_ID IN STORE_TRANSFER.FROM_STORE_ID%TYPE DEFAULT NULL,
        P_TO_STORE_ID   IN STORE_TRANSFER.TO_STORE_ID%TYPE DEFAULT NULL,
        P_RECEIVE_DATE  IN STORE_TRANSFER.RECEIVE_DATE%TYPE DEFAULT NULL,
        P_HAS_RECEIVED  IN STORE_TRANSFER.HAS_RECEIVED%TYPE DEFAULT NULL,
        P_TRANSFER_DATE IN STORE_TRANSFER.TRANSFER_DATE%TYPE DEFAULT NULL,
        P_RECEIVED_BY   IN STORE_TRANSFER.RECEIVED_BY%TYPE DEFAULT NULL,
        P_BRANCH_ID                   IN      STORE_TRANSFER.BRANCH_ID%TYPE DEFAULT NULL,
        P_COMPANY_ID    IN STORE_TRANSFER.COMPANY_ID%TYPE
    );
-- update
    PROCEDURE UPDATE_STORE_TRANSFER (
        P_TRANSFER_ID   IN STORE_TRANSFER.TRANSFER_ID%TYPE,
        P_TRANSFER_NO   IN STORE_TRANSFER.TRANSFER_NO%TYPE,
        P_TRANSFER_BY   IN STORE_TRANSFER.TRANSFER_BY%TYPE DEFAULT NULL,
        P_FROM_STORE_ID IN STORE_TRANSFER.FROM_STORE_ID%TYPE DEFAULT NULL,
        P_TO_STORE_ID   IN STORE_TRANSFER.TO_STORE_ID%TYPE DEFAULT NULL,
        P_RECEIVE_DATE  IN STORE_TRANSFER.RECEIVE_DATE%TYPE DEFAULT NULL,
        P_HAS_RECEIVED  IN STORE_TRANSFER.HAS_RECEIVED%TYPE DEFAULT NULL,
        P_TRANSFER_DATE IN STORE_TRANSFER.TRANSFER_DATE%TYPE DEFAULT NULL,
        P_RECEIVED_BY   IN STORE_TRANSFER.RECEIVED_BY%TYPE DEFAULT NULL,
        P_BRANCH_ID                   IN      STORE_TRANSFER.BRANCH_ID%TYPE DEFAULT NULL,
        P_COMPANY_ID    IN STORE_TRANSFER.COMPANY_ID%TYPE
    );
-- delete
    PROCEDURE DELETE_STORE_TRANSFER (
        P_TRANSFER_ID IN STORE_TRANSFER.TRANSFER_ID%TYPE
    );

END STORE_TRANSFER_TAPI;

/
--------------------------------------------------------
--  DDL for Package ZT_QR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ZT_QR" AUTHID DEFINER AS
/******************************************************************************
    Author:     Zoran Tica
                ZT-TECH, racunalni�ke storitve s.p.
                http://www.zt-tech.eu

    PURPOSE:    A package for QR code data and image generation 

    REVISIONS:
    Ver        Date        Author           Description
    ---------  ----------  ---------------  ------------------------------------
    1.0        18/08/2018  Zoran Tica       First version of package.
    1.1        26/05/2019  Zoran Tica       Added UTF-8 support, fixed minor BUGs for debug display
    1.2        15/12/2019  Zoran Tica       Fixed "_" and "%" BUG
    1.3        13/03/2020  Zoran Tica       Added function f_qr_as_long_raw
    1.4        07/01/2021  Zoran Tica       Terminator BUG
    1.5        05/02/2021  Zoran Tica       older databases compatibility (10g)
                                            f_integer_2_binary - LISTAGG replaced with pure PL SQL
                                            f_get_version - XMLTABLE replaced with local function f_explode
    2.0        09/02/2021  Zoran Tica       SVG files support


    ----------------------------------------------------------------------------
    Copyright (C) 2018 - Zoran Tica

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
    ----------------------------------------------------------------------------
*/


/*
Error correction modes:
L - Low       Recovers 7% of data
M - Medium    Recovers 15% of data
Q - Quartile  Recovers 25% of data
H - High      Recovers 30% of data
*/


/*
Procedure generates QR code data as varchar2 variable filled with 0 and 1
0 is white module, 1 is black
Lines are separated with chr(10)

IN parameters:
p_data - data that is going to be encoded into QR code
p_error_correction - error correction level (values L, M, Q or H)

OUT parameters:
p_qr - generated QR code data in format "row (1110100010100...) || newline (chr 10) || row || newline..."
p_matrix_size - matrix size in modules (21, 25, 29...)
*/
PROCEDURE p_generate_qr_data(
    p_data varchar2,
    p_error_correction varchar2, 
    p_qr OUT NOCOPY varchar2,
    p_matrix_size OUT pls_integer
);


/*
Procedure generates QR code data as varchar2 variable filled with 0 and 1
0 is white module, 1 is black
Lines are separated with chr(10)
Debug is printed as DBMS_OUTPUT
There are 3 levels of debug (1, 2 or 3 - low, medium, high)

IN parameters:
p_data - data that is going to be encoded into QR code
p_error_correction - error correction level (values L, M, Q or H)
p_debug - should DBMS OUTPUT be printed
p_debug_level - debug level (1, 2, 3...) - details to be printed in debug output
p_masking_out - which masking (values 0-7) should be displayed; null -> the best masking will be calculated and selected automatically 

OUT parameters:
p_qr - generated QR code data in format "row (1110100010100) || newline (chr 10) || row || newline..."
p_matrix_size - matrix size in modules (21, 25, 29...)


Testing code (enable DBMS OUTPUT for debug!):
DECLARE
    lcQR varchar2(32727);
    lnMatrixSize pls_integer;
BEGIN
    ZT_QR.p_qr_debug(
        p_data => 'http://www.zt-tech.eu',
        p_error_correction => 'Q', 
        p_debug => true,
        p_debug_level => 2,
        p_qr => lcQR,
        p_matrix_size => lnMatrixSize
    );*/
END;

/
--------------------------------------------------------
--  DDL for Package Body ACC_ACCOUNTS_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ACC_ACCOUNTS_TAPI" IS

    PROCEDURE ADD_RECORD (
        P_ACCOUNT_NAME_AR  IN  ACC_ACCOUNTS.ACCOUNT_NAME_AR%TYPE DEFAULT NULL,
        P_ACCOUNT_NAME_EN  IN  ACC_ACCOUNTS.ACCOUNT_NAME_EN%TYPE DEFAULT NULL,
        P_ACCOUNT_TYPE     IN  ACC_ACCOUNTS.ACCOUNT_TYPE%TYPE DEFAULT NULL,
        P_ACCOUNT_ID       IN  ACC_ACCOUNTS.ACCOUNT_ID%TYPE,
        P_ACCOUNT_PARENT   IN  ACC_ACCOUNTS.ACCOUNT_PARENT%TYPE DEFAULT NULL,
        P_SUB_ACCOUNT      IN  ACC_ACCOUNTS.SUB_ACCOUNT%TYPE DEFAULT 0,
        P_COMPANY_ID       IN  ACC_ACCOUNTS.COMPANY_ID%TYPE,
        P_ACCOUNT_NATURE   IN  ACC_ACCOUNTS.ACCOUNT_NATURE%TYPE DEFAULT NULL
    ) IS
    BEGIN
        INSERT INTO ACC_ACCOUNTS (
            ACCOUNT_NAME_AR,
            ACCOUNT_NAME_EN,
            ACCOUNT_TYPE,
            ACCOUNT_ID,
            ACCOUNT_PARENT,
            SUB_ACCOUNT,
            COMPANY_ID,
            ACCOUNT_NATURE
        ) VALUES (
            P_ACCOUNT_NAME_AR,
            P_ACCOUNT_NAME_EN,
            P_ACCOUNT_TYPE,
            P_ACCOUNT_ID,
            P_ACCOUNT_PARENT,
            P_SUB_ACCOUNT,
            P_COMPANY_ID,
            P_ACCOUNT_NATURE
        );

    END;

    PROCEDURE UPDATE_RECORD (
        P_ACCOUNT_NAME_AR  IN  ACC_ACCOUNTS.ACCOUNT_NAME_AR%TYPE DEFAULT NULL,
        P_ACCOUNT_NAME_EN  IN  ACC_ACCOUNTS.ACCOUNT_NAME_EN%TYPE DEFAULT NULL,
        P_ACCOUNT_TYPE     IN  ACC_ACCOUNTS.ACCOUNT_TYPE%TYPE DEFAULT NULL,
        P_ACCOUNT_ID       IN  ACC_ACCOUNTS.ACCOUNT_ID%TYPE,
        P_ACCOUNT_PARENT   IN  ACC_ACCOUNTS.ACCOUNT_PARENT%TYPE DEFAULT NULL,
        P_SUB_ACCOUNT      IN  ACC_ACCOUNTS.SUB_ACCOUNT%TYPE DEFAULT 0,
        P_COMPANY_ID       IN  ACC_ACCOUNTS.COMPANY_ID%TYPE,
        P_ACCOUNT_NATURE   IN  ACC_ACCOUNTS.ACCOUNT_NATURE%TYPE DEFAULT NULL
    ) IS
    BEGIN
        UPDATE ACC_ACCOUNTS
        SET
            ACCOUNT_NAME_AR = P_ACCOUNT_NAME_AR,
            ACCOUNT_NAME_EN = P_ACCOUNT_NAME_EN,
            ACCOUNT_TYPE = P_ACCOUNT_TYPE,
            ACCOUNT_PARENT = P_ACCOUNT_PARENT,
            SUB_ACCOUNT = P_SUB_ACCOUNT,
            COMPANY_ID = P_COMPANY_ID,
            ACCOUNT_NATURE = P_ACCOUNT_NATURE
        WHERE
            ACCOUNT_ID = P_ACCOUNT_ID;

    END;

END ACC_ACCOUNTS_TAPI;

/
--------------------------------------------------------
--  DDL for Package Body ACC_ACCOUNTS_XAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ACC_ACCOUNTS_XAPI" IS
   FUNCTION GET_ACCOUNT_NO(
      P_COMPANY_ID   IN NUMBER,
      P_PARENT_ID  IN NUMBER
       )RETURN NUMBER AS
       
       v_acc_no number;
  BEGIN
if length(P_PARENT_ID)<3 then
    SELECT NVL(MAX(ACCOUNT_ID),P_PARENT_ID * 100)+1 
        into v_acc_no 
    FROM ACC_ACCOUNTS
        WHERE  COMPANY_ID=P_COMPANY_ID
        AND    ACCOUNT_PARENT=P_PARENT_ID;
else

            if length(P_PARENT_ID)<=6 then
                    SELECT NVL(MAX(ACCOUNT_ID),P_PARENT_ID * 1000)+1 into v_acc_no 
                    FROM ACC_ACCOUNTS
                    WHERE  COMPANY_ID=P_COMPANY_ID
                    AND    ACCOUNT_PARENT=P_PARENT_ID;
            else

                SELECT NVL(MAX(ACCOUNT_ID),P_PARENT_ID * 1000)+1 into v_acc_no 
                FROM ACC_ACCOUNTS
                WHERE  COMPANY_ID=P_COMPANY_ID
                AND    ACCOUNT_PARENT=P_PARENT_ID;

            end if;



end if; 
    RETURN v_acc_no;
END GET_ACCOUNT_NO;


  PROCEDURE ADD_CLIENT_ACCOUNT(
     P_CLIENT_ID  NUMBER
   ) AS
   V_ACCOUNT_ID  NUMBER;
   V_COMPANY_ID NUMBER;
   V_PARENT_ACCOUNT  NUMBER;
   V_ACCOUNT_NO   NUMBER;
   V_ACCOUNT_REC   ACC_ACCOUNTS%ROWTYPE;
   V_CLIENT_REC   SALES_CLIENT%ROWTYPE;
  BEGIN
    SELECT 
      *
     INTO 
      V_CLIENT_REC
     FROM SALES_CLIENT
     WHERE
     CLIENT_ID=P_CLIENT_ID;

     IF V_CLIENT_REC.ACCOUNT_ID IS NULL THEN 


              SELECT ACC_CLIENT
                INTO V_PARENT_ACCOUNT
              FROM ACC_SETUP
              WHERE COMPANY_ID =V_CLIENT_REC.COMPANY_ID ;

              SELECT * 
               INTO 
                 V_ACCOUNT_REC
                FROM ACC_ACCOUNTS
                WHERE
                ACCOUNT_ID =V_PARENT_ACCOUNT
                AND COMPANY_ID=V_CLIENT_REC.COMPANY_ID
                ;
            V_ACCOUNT_NO:=GET_ACCOUNT_NO(
                      P_COMPANY_ID   =>V_CLIENT_REC.COMPANY_ID,
                      P_PARENT_ID    =>V_PARENT_ACCOUNT
                       );

              ACC_ACCOUNTS_TAPI.ADD_RECORD(
                    P_ACCOUNT_NAME_AR   => V_CLIENT_REC.NAME_AR,
                    P_ACCOUNT_NAME_EN   => V_CLIENT_REC.NAME_EN,
                    P_ACCOUNT_TYPE      => V_ACCOUNT_REC.ACCOUNT_TYPE,
                    P_ACCOUNT_ID        => V_ACCOUNT_NO,
                    P_ACCOUNT_PARENT    => V_PARENT_ACCOUNT,
                    P_SUB_ACCOUNT       => 0,
                    P_COMPANY_ID        => V_CLIENT_REC.COMPANY_ID,
                    P_ACCOUNT_NATURE    => V_ACCOUNT_REC.ACCOUNT_NATURE
                );

                UPDATE   SALES_CLIENT
                SET 
                  ACCOUNT_ID=V_ACCOUNT_NO
                WHERE
                CLIENT_ID=P_CLIENT_ID;


     ELSE

      UPDATE ACC_ACCOUNTS
        SET 
          ACCOUNT_NAME_AR=V_CLIENT_REC.NAME_AR,
          ACCOUNT_NAME_EN=V_CLIENT_REC.NAME_EN
        WHERE 
         ACCOUNT_ID=V_CLIENT_REC.ACCOUNT_ID
         AND COMPANY_ID=V_CLIENT_REC.COMPANY_ID;
     END IF;

  END ADD_CLIENT_ACCOUNT;

  PROCEDURE ADD_PROVIDER_ACCOUNT(
     P_PROVIDER_ID  NUMBER
   ) AS
   V_ACCOUNT_ID  NUMBER;
   V_COMPANY_ID NUMBER;
   V_PARENT_ACCOUNT  NUMBER;
   V_ACCOUNT_NO   NUMBER;
   V_ACCOUNT_REC   ACC_ACCOUNTS%ROWTYPE;
   V_PROVIDER_REC   SALES_PROVIDER%ROWTYPE;
  BEGIN
   SELECT 
      *
     INTO 
      V_PROVIDER_REC
     FROM SALES_PROVIDER
     WHERE
     PROVIDER_ID=P_PROVIDER_ID;

     IF V_PROVIDER_REC.ACCOUNT_ID IS NULL THEN 


              SELECT ACC_PROVIDER
                INTO V_PARENT_ACCOUNT
              FROM ACC_SETUP
              WHERE COMPANY_ID =V_PROVIDER_REC.COMPANY_ID ;

              SELECT * 
               INTO 
                 V_ACCOUNT_REC
                FROM ACC_ACCOUNTS
                WHERE
                ACCOUNT_ID =V_PARENT_ACCOUNT
                AND COMPANY_ID=V_PROVIDER_REC.COMPANY_ID
                ;
            V_ACCOUNT_NO:=GET_ACCOUNT_NO(
                      P_COMPANY_ID   =>V_PROVIDER_REC.COMPANY_ID,
                      P_PARENT_ID    =>V_PARENT_ACCOUNT
                       );

              ACC_ACCOUNTS_TAPI.ADD_RECORD(
                    P_ACCOUNT_NAME_AR   => V_PROVIDER_REC.NAME_AR,
                    P_ACCOUNT_NAME_EN   => V_PROVIDER_REC.NAME_EN,
                    P_ACCOUNT_TYPE      => V_ACCOUNT_REC.ACCOUNT_TYPE,
                    P_ACCOUNT_ID        => V_ACCOUNT_NO,
                    P_ACCOUNT_PARENT    => V_PARENT_ACCOUNT,
                    P_SUB_ACCOUNT       => 0,
                    P_COMPANY_ID        => V_PROVIDER_REC.COMPANY_ID,
                    P_ACCOUNT_NATURE    => V_ACCOUNT_REC.ACCOUNT_NATURE
                );

                UPDATE   SALES_PROVIDER
                SET 
                  ACCOUNT_ID=V_ACCOUNT_NO
                WHERE
                PROVIDER_ID=P_PROVIDER_ID;


     ELSE

      UPDATE ACC_ACCOUNTS
        SET 
          ACCOUNT_NAME_AR=V_PROVIDER_REC.NAME_AR,
          ACCOUNT_NAME_EN=V_PROVIDER_REC.NAME_EN
        WHERE 
         ACCOUNT_ID=V_PROVIDER_REC.ACCOUNT_ID
         AND COMPANY_ID=V_PROVIDER_REC.COMPANY_ID;
     END IF;

  END ADD_PROVIDER_ACCOUNT;

END ACC_ACCOUNTS_XAPI;

/
--------------------------------------------------------
--  DDL for Package Body ACC_JOURNAL_DTL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ACC_JOURNAL_DTL_TAPI" IS

    PROCEDURE INSERT_JOURNAL_DTL (
        P_ACCOUNT_ID      IN      ACC_JOURNAL_DTL.ACCOUNT_ID%TYPE DEFAULT NULL,
        P_CREDIT          IN      ACC_JOURNAL_DTL.CREDIT%TYPE DEFAULT NULL,
        P_DEBIT           IN      ACC_JOURNAL_DTL.DEBIT%TYPE DEFAULT NULL,
        P_NOTE            IN      ACC_JOURNAL_DTL.NOTE%TYPE DEFAULT NULL,
        P_COST_CNTR_ID    IN      ACC_JOURNAL_DTL.COST_CNTR_ID%TYPE DEFAULT NULL,
        P_REF_NO          IN      ACC_JOURNAL_DTL.REF_NO%TYPE DEFAULT NULL,
        P_JOURNAL_ID      IN      ACC_JOURNAL_DTL.JOURNAL_ID%TYPE DEFAULT NULL,
        P_JOURNAL_DTL_ID  IN OUT  ACC_JOURNAL_DTL.JOURNAL_DTL_ID%TYPE
    ) IS
    BEGIN
        INSERT INTO ACC_JOURNAL_DTL (
            CREDIT,
            DEBIT,
            ACCOUNT_ID,
            COST_CNTR_ID,
            REF_NO,
            NOTE,
            JOURNAL_ID
        ) VALUES (
            P_CREDIT,
            P_DEBIT,
            P_ACCOUNT_ID,
            P_COST_CNTR_ID,
            P_REF_NO,
            P_NOTE,
            P_JOURNAL_ID
        ) RETURNING JOURNAL_DTL_ID INTO P_JOURNAL_DTL_ID;

    END;

    PROCEDURE UPDATE_JOURNAL_DTL (
        P_ACCOUNT_ID      IN  ACC_JOURNAL_DTL.ACCOUNT_ID%TYPE DEFAULT NULL,
        P_CREDIT          IN  ACC_JOURNAL_DTL.CREDIT%TYPE DEFAULT NULL,
        P_DEBIT           IN  ACC_JOURNAL_DTL.DEBIT%TYPE DEFAULT NULL,
        P_NOTE            IN  ACC_JOURNAL_DTL.NOTE%TYPE DEFAULT NULL,
        P_COST_CNTR_ID    IN  ACC_JOURNAL_DTL.COST_CNTR_ID%TYPE DEFAULT NULL,
        P_REF_NO          IN  ACC_JOURNAL_DTL.REF_NO%TYPE DEFAULT NULL,
        P_JOURNAL_DTL_ID  IN  ACC_JOURNAL_DTL.JOURNAL_DTL_ID%TYPE,
        P_JOURNAL_ID      IN  ACC_JOURNAL_DTL.JOURNAL_ID%TYPE DEFAULT NULL
    ) IS
    BEGIN
        UPDATE ACC_JOURNAL_DTL
        SET
            CREDIT = P_CREDIT,
            DEBIT = P_DEBIT,
            ACCOUNT_ID = P_ACCOUNT_ID,
            COST_CNTR_ID = P_COST_CNTR_ID,
            REF_NO = P_REF_NO,
            NOTE = P_NOTE,
            JOURNAL_ID = P_JOURNAL_ID
        WHERE
            JOURNAL_DTL_ID = P_JOURNAL_DTL_ID;

    END;

    PROCEDURE DELETE_JOURNAL_DTL (
        P_JOURNAL_DTL_ID IN ACC_JOURNAL_DTL.JOURNAL_DTL_ID%TYPE
    ) IS
    BEGIN
        DELETE FROM ACC_JOURNAL_DTL
        WHERE
            JOURNAL_DTL_ID = P_JOURNAL_DTL_ID;

    END;

END ACC_JOURNAL_DTL_TAPI;

/
--------------------------------------------------------
--  DDL for Package Body ACC_JOURNAL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ACC_JOURNAL_TAPI" IS

    PROCEDURE INSERT_JOURNAL (
        P_JOURNAL_DATE    IN      ACC_JOURNAL.JOURNAL_DATE%TYPE DEFAULT NULL,
        P_NOTE            IN      ACC_JOURNAL.NOTE%TYPE DEFAULT NULL,
        P_COMPANY_ID      IN      NUMBER,
        P_JOURNAL_TYPE   IN  NUMBER DEFAULT 1,
        P_ACC_JOURNAL_ID  IN OUT  ACC_JOURNAL.ACC_JOURNAL_ID%TYPE
    ) IS
        V_ACC_JOURNAL_ID NUMBER;
    BEGIN
        SELECT NVL(MAX(ACC_JOURNAL_ID),0)+1 INTO V_ACC_JOURNAL_ID FROM ACC_JOURNAL;
        INSERT INTO ACC_JOURNAL (
            ACC_JOURNAL_ID,
            JOURNAL_DATE,
            COMPANY_ID,
            JOURNAL_TYPE,
            NOTE
        ) VALUES (
            V_ACC_JOURNAL_ID,
            P_JOURNAL_DATE,
            P_COMPANY_ID,
            P_JOURNAL_TYPE,
            P_NOTE
        ) RETURNING ACC_JOURNAL_ID INTO P_ACC_JOURNAL_ID;

    END;

    PROCEDURE UPDATE_JOURNAL (
        P_ACC_JOURNAL_ID  IN  ACC_JOURNAL.ACC_JOURNAL_ID%TYPE,
        P_JOURNAL_DATE    IN  ACC_JOURNAL.JOURNAL_DATE%TYPE DEFAULT NULL,
        P_COMPANY_ID      IN      NUMBER,
        P_NOTE            IN  ACC_JOURNAL.NOTE%TYPE DEFAULT NULL
    ) IS
    BEGIN
        UPDATE ACC_JOURNAL
        SET
            JOURNAL_DATE = P_JOURNAL_DATE,
            NOTE = P_NOTE,
            COMPANY_ID = P_COMPANY_ID
            
        WHERE
            ACC_JOURNAL_ID = P_ACC_JOURNAL_ID;

    END;

    PROCEDURE POST_JOURNAL (
        P_ACC_JOURNAL_ID IN ACC_JOURNAL.ACC_JOURNAL_ID%TYPE
    ) IS
        P_LEDGER_ID     NUMBER;
        V_COMPANY_ID     NUMBER;
        V_JOURNAL_TYPE NUMBER;
        V_JOURNAL_DATE DATE;
        V_IS_POSTED NUMBER;
    BEGIN
        SELECT COUNT(*) 
        INTO V_IS_POSTED
        FROM ACC_JOURNAL
        WHERE ACC_JOURNAL_ID  = P_ACC_JOURNAL_ID AND POSTED = 1;
            
        SELECT COMPANY_ID,JOURNAL_DATE,JOURNAL_TYPE
        INTO V_COMPANY_ID,V_JOURNAL_DATE,V_JOURNAL_TYPE
        FROM ACC_JOURNAL
        WHERE ACC_JOURNAL_ID  = P_ACC_JOURNAL_ID;
        
        IF V_IS_POSTED = 0 THEN
            FOR REC IN (
                SELECT
                    JOURNAL_DTL_ID,
                    JOURNAL_ID,
                    DEBIT,
                    CREDIT,
                    ACCOUNT_ID,
                    NOTE,
                    COST_CNTR_ID
                FROM
                    ACC_JOURNAL_DTL
                WHERE JOURNAL_ID  = P_ACC_JOURNAL_ID
            )
            LOOP
                ACC_LEDGER_TAPI.ADD_RECORD (  
                    P_JOURNAL_ID        => REC.JOURNAL_ID,
                    P_ACCOUNT_ID        => REC.ACCOUNT_ID,
                    P_CREDIT            => REC.CREDIT,
                    P_DEBIT             => REC.DEBIT,
                    P_NOTE              => REC.NOTE,
                    P_COST_CNTR_ID      => REC.COST_CNTR_ID,
                    P_JOURNAL_DATE      => V_JOURNAL_DATE,
                    P_JOURNAL_TYPE      => V_JOURNAL_TYPE,
                    P_COMPANY_ID        => V_COMPANY_ID,
                    P_LEDGER_ID         => P_LEDGER_ID
                );
            END LOOP;

            UPDATE ACC_JOURNAL
            SET POSTED = 1
            WHERE ACC_JOURNAL_ID  = P_ACC_JOURNAL_ID;
        END IF;
    END;


    PROCEDURE MAKE_JOURNAL (
        P_JOURNAL_TABLE  IN  JOURNAL_TABLE,
        P_JOURNAL_DATE   IN  ACC_JOURNAL.JOURNAL_DATE%TYPE DEFAULT SYSDATE,
        P_COMPANY_ID     IN  NUMBER,
        P_JOURNAL_TYPE   IN  NUMBER DEFAULT 1,
        P_JOURNAL_NOTE   IN  NVARCHAR2,
        P_ACC_JOURNAL_ID OUT  NUMBER
    ) IS
        P_LEDGER_ID     NUMBER;
        V_ACC_JOURNAL_ID NUMBER;
        V_JOURNAL_DTL_ID NUMBER;
    BEGIN

        INSERT_JOURNAL (
            P_JOURNAL_DATE    => P_JOURNAL_DATE,
            P_NOTE            => P_JOURNAL_NOTE,
            P_COMPANY_ID      => P_COMPANY_ID,
            P_JOURNAL_TYPE    => P_JOURNAL_TYPE,
            P_ACC_JOURNAL_ID  => V_ACC_JOURNAL_ID
        );
        FOR REC IN (
            SELECT ACCOUNT_ID,CREDIT,DEBIT,COST_CNTR_ID,REF_NO,NOTE FROM TABLE(P_JOURNAL_TABLE)
        )LOOP
            ACC_JOURNAL_DTL_TAPI.INSERT_JOURNAL_DTL(
                P_ACCOUNT_ID        => REC.ACCOUNT_ID,
                P_CREDIT            => REC.CREDIT,
                P_DEBIT             => REC.DEBIT,
                P_COST_CNTR_ID      => REC.COST_CNTR_ID,
                P_REF_NO            => REC.REF_NO,
                P_NOTE              => REC.NOTE,
                P_JOURNAL_ID        => V_ACC_JOURNAL_ID,
                P_JOURNAL_DTL_ID    => V_JOURNAL_DTL_ID
            );
        END LOOP;
        POST_JOURNAL(
            P_ACC_JOURNAL_ID => V_ACC_JOURNAL_ID
        );
        P_ACC_JOURNAL_ID := V_ACC_JOURNAL_ID;
        COMMIT;
    END;

END ACC_JOURNAL_TAPI;

/
--------------------------------------------------------
--  DDL for Package Body ACC_LEDGER_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ACC_LEDGER_TAPI" IS

    PROCEDURE ADD_RECORD (
        P_CREDIT        IN      ACC_LEDGER.CREDIT%TYPE,
        P_DEBIT         IN      ACC_LEDGER.DEBIT%TYPE,
        P_ACCOUNT_ID    IN      ACC_LEDGER.ACCOUNT_ID%TYPE,
        P_JOURNAL_TYPE  IN      ACC_LEDGER.JOURNAL_TYPE%TYPE,
        P_JOURNAL_ID    IN      ACC_LEDGER.JOURNAL_ID%TYPE,
        P_JOURNAL_DATE  IN      ACC_LEDGER.JOURNAL_DATE%TYPE,
        P_COMPANY_ID    IN      NUMBER,
        P_NOTE          IN      ACC_LEDGER.NOTE%TYPE DEFAULT NULL,
        P_COST_CNTR_ID  IN      ACC_LEDGER.COST_CNTR_ID%TYPE DEFAULT NULL,
        P_LEDGER_ID     IN OUT  ACC_LEDGER.LEDGER_ID%TYPE
    ) IS
    BEGIN
        INSERT INTO ACC_LEDGER (
            CREDIT,
            DEBIT,
            ACCOUNT_ID,
            JOURNAL_TYPE,
            JOURNAL_ID,
            JOURNAL_DATE,
            NOTE,
            COST_CNTR_ID,
            COMPANY_ID
        ) VALUES (
            P_CREDIT,
            P_DEBIT,
            P_ACCOUNT_ID,
            P_JOURNAL_TYPE,
            P_JOURNAL_ID,
            P_JOURNAL_DATE,
            P_NOTE,
            P_COST_CNTR_ID,
            P_COMPANY_ID
        ) RETURNING LEDGER_ID INTO P_LEDGER_ID;

    END;

END ACC_LEDGER_TAPI;

/
--------------------------------------------------------
--  DDL for Package Body ACC_VOUCHER_DTL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ACC_VOUCHER_DTL_TAPI" IS

    PROCEDURE INSERT_DTL (
        P_ACCOUNT_ID      IN  ACC_VOUCHER_DTL.ACCOUNT_ID%TYPE DEFAULT NULL,
        P_AMOUNT          IN  ACC_VOUCHER_DTL.AMOUNT%TYPE DEFAULT NULL,
        P_ACC_VOUCHER_ID  IN  ACC_VOUCHER_DTL.ACC_VOUCHER_ID%TYPE DEFAULT NULL,
        P_NOTE            IN  ACC_VOUCHER_DTL.NOTE%TYPE DEFAULT NULL,
        P_TAX_RATE        IN  ACC_VOUCHER_DTL.TAX_RATE%TYPE DEFAULT NULL,
        P_TAX_AMOUNT      IN  ACC_VOUCHER_DTL.TAX_AMOUNT%TYPE DEFAULT NULL,
        P_REF_ID          IN  ACC_VOUCHER_DTL.REF_ID%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT    IN  ACC_VOUCHER_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CNTR_ID    IN  ACC_VOUCHER_DTL.COST_CNTR_ID%TYPE DEFAULT NULL
    ) IS
        V_ACC_VOUCHER_DTL_ID NUMBER;
    BEGIN
        SELECT NVL(MAX(ACC_VOUCHER_DTL_ID),0)+1 INTO V_ACC_VOUCHER_DTL_ID FROM ACC_VOUCHER_DTL;
        INSERT INTO ACC_VOUCHER_DTL (
            ACCOUNT_ID,
            AMOUNT,
            ACC_VOUCHER_ID,
            NOTE,
            TAX_RATE,
            TAX_AMOUNT,
            COST_CNTR_ID,
            TOTAL_AMOUNT,
            REF_ID
        ) VALUES (
            P_ACCOUNT_ID,
            P_AMOUNT,
            P_ACC_VOUCHER_ID,
            P_NOTE,
            P_TAX_RATE,
            P_TAX_AMOUNT,
            P_COST_CNTR_ID,
            P_TOTAL_AMOUNT,
            P_REF_ID
        );

    END;

    PROCEDURE UPDATE_DTL (
        P_ACCOUNT_ID          IN  ACC_VOUCHER_DTL.ACCOUNT_ID%TYPE DEFAULT NULL,
        P_AMOUNT              IN  ACC_VOUCHER_DTL.AMOUNT%TYPE DEFAULT NULL,
        P_ACC_VOUCHER_DTL_ID  IN  ACC_VOUCHER_DTL.ACC_VOUCHER_DTL_ID%TYPE,
        P_ACC_VOUCHER_ID      IN  ACC_VOUCHER_DTL.ACC_VOUCHER_ID%TYPE DEFAULT NULL,
        P_NOTE                IN  ACC_VOUCHER_DTL.NOTE%TYPE DEFAULT NULL,
        P_TAX_RATE            IN  ACC_VOUCHER_DTL.TAX_RATE%TYPE DEFAULT NULL,
        P_TAX_AMOUNT          IN  ACC_VOUCHER_DTL.TAX_AMOUNT%TYPE DEFAULT NULL,
        P_REF_ID              IN  ACC_VOUCHER_DTL.REF_ID%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT        IN  ACC_VOUCHER_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CNTR_ID        IN  ACC_VOUCHER_DTL.COST_CNTR_ID%TYPE DEFAULT NULL
    ) IS
    BEGIN
        UPDATE ACC_VOUCHER_DTL
        SET
            ACCOUNT_ID = P_ACCOUNT_ID,
            AMOUNT = P_AMOUNT,
            ACC_VOUCHER_ID = P_ACC_VOUCHER_ID,
            NOTE = P_NOTE,
            TAX_RATE = P_TAX_RATE,
            TAX_AMOUNT = P_TAX_AMOUNT,
            COST_CNTR_ID = P_COST_CNTR_ID,
            TOTAL_AMOUNT = P_TOTAL_AMOUNT,
            REF_ID = P_REF_ID
        WHERE
            ACC_VOUCHER_DTL_ID = P_ACC_VOUCHER_DTL_ID;

    END;

    PROCEDURE UPDATE_DTL_BY_VOUCHER_ID (
        P_ACCOUNT_ID          IN  ACC_VOUCHER_DTL.ACCOUNT_ID%TYPE DEFAULT NULL,
        P_AMOUNT              IN  ACC_VOUCHER_DTL.AMOUNT%TYPE DEFAULT NULL,
        P_ACC_VOUCHER_ID      IN  ACC_VOUCHER_DTL.ACC_VOUCHER_ID%TYPE DEFAULT NULL
    ) IS
    BEGIN
        UPDATE ACC_VOUCHER_DTL
        SET
            ACCOUNT_ID = P_ACCOUNT_ID,
            AMOUNT = P_AMOUNT
        WHERE
            ACC_VOUCHER_ID = P_ACC_VOUCHER_ID;

    END;

    PROCEDURE DELETE_DTL (
        P_ACC_VOUCHER_DTL_ID IN ACC_VOUCHER_DTL.ACC_VOUCHER_DTL_ID%TYPE
    ) IS
    BEGIN
        DELETE FROM ACC_VOUCHER_DTL
        WHERE
            ACC_VOUCHER_DTL_ID = P_ACC_VOUCHER_DTL_ID;

    END;

END ACC_VOUCHER_DTL_TAPI;

/
--------------------------------------------------------
--  DDL for Package Body ACC_VOUCHER_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ACC_VOUCHER_TAPI" IS

    PROCEDURE INSERT_VOUCHER (
        P_AMOUNT          IN      ACC_VOUCHER.AMOUNT%TYPE DEFAULT NULL,
        P_ACCOUNT_ID      IN      ACC_VOUCHER.ACCOUNT_ID%TYPE DEFAULT NULL,
        P_PAID_TO         IN      ACC_VOUCHER.PAID_TO%TYPE DEFAULT NULL,
        P_REF_ID          IN      ACC_VOUCHER.REF_ID%TYPE DEFAULT NULL,
        P_PAYMENT_METHOD  IN      ACC_VOUCHER.PAYMENT_METHOD%TYPE DEFAULT NULL,
        P_VOUCHER_DATE    IN      ACC_VOUCHER.VOUCHER_DATE%TYPE DEFAULT NULL,
        P_VOUCHER_TYPE    IN      ACC_VOUCHER.VOUCHER_TYPE%TYPE DEFAULT NULL,
        P_NOTE            IN      ACC_VOUCHER.NOTE%TYPE DEFAULT NULL,
        P_COST_CNTR_ID    IN      ACC_VOUCHER.COST_CNTR_ID%TYPE DEFAULT NULL,
        P_CHECK_DATE      IN      ACC_VOUCHER.CHECK_DATE%TYPE DEFAULT NULL,
        P_CHECK_NO        IN      ACC_VOUCHER.CHECK_NO%TYPE DEFAULT NULL,
        P_TOTAL_VAT       IN      ACC_VOUCHER.TOTAL_VAT%TYPE DEFAULT NULL,
        P_COMPANY_ID      IN      ACC_VOUCHER.COMPANY_ID%TYPE,
        P_ACC_VOUCHER_ID  IN OUT  ACC_VOUCHER.ACC_VOUCHER_ID%TYPE
    ) IS
        V_ACC_VOUCHER_ID NUMBER;
    BEGIN
        SELECT NVL(MAX(ACC_VOUCHER_ID),0)+1 INTO V_ACC_VOUCHER_ID FROM ACC_VOUCHER;
        INSERT INTO ACC_VOUCHER (
            ACC_VOUCHER_ID,
            AMOUNT,
            ACCOUNT_ID,
            PAID_TO,
            REF_ID,
            PAYMENT_METHOD,
            VOUCHER_DATE,
            VOUCHER_TYPE,
            NOTE,
            CHECK_NO,
            CHECK_DATE,
            COST_CNTR_ID,
            TOTAL_VAT,
            COMPANY_ID
        ) VALUES (
            V_ACC_VOUCHER_ID,
            P_AMOUNT,
            P_ACCOUNT_ID,
            P_PAID_TO,
            P_REF_ID,
            P_PAYMENT_METHOD,
            P_VOUCHER_DATE,
            P_VOUCHER_TYPE,
            P_NOTE,
            P_CHECK_NO,
            P_CHECK_DATE,
            P_COST_CNTR_ID,
            P_TOTAL_VAT,
            P_COMPANY_ID
        ) RETURNING ACC_VOUCHER_ID INTO P_ACC_VOUCHER_ID;

    END;

    PROCEDURE UPDATE_VOUCHER (
        P_AMOUNT          IN  ACC_VOUCHER.AMOUNT%TYPE DEFAULT NULL,
        P_ACCOUNT_ID      IN  ACC_VOUCHER.ACCOUNT_ID%TYPE DEFAULT NULL,
        P_PAID_TO         IN  ACC_VOUCHER.PAID_TO%TYPE DEFAULT NULL,
        P_ACC_VOUCHER_ID  IN  ACC_VOUCHER.ACC_VOUCHER_ID%TYPE,
        P_REF_ID          IN  ACC_VOUCHER.REF_ID%TYPE DEFAULT NULL,
        P_VOUCHER_DATE    IN  ACC_VOUCHER.VOUCHER_DATE%TYPE DEFAULT NULL,
        P_VOUCHER_TYPE    IN      ACC_VOUCHER.VOUCHER_TYPE%TYPE DEFAULT NULL,
        P_NOTE            IN      ACC_VOUCHER.NOTE%TYPE DEFAULT NULL,
        P_PAYMENT_METHOD  IN  ACC_VOUCHER.PAYMENT_METHOD%TYPE DEFAULT NULL,
        P_COST_CNTR_ID    IN      ACC_VOUCHER.COST_CNTR_ID%TYPE DEFAULT NULL,
        P_CHECK_DATE      IN      ACC_VOUCHER.CHECK_DATE%TYPE DEFAULT NULL,
        P_CHECK_NO        IN      ACC_VOUCHER.CHECK_NO%TYPE DEFAULT NULL,
        P_TOTAL_VAT       IN      ACC_VOUCHER.TOTAL_VAT%TYPE DEFAULT NULL,
        P_COMPANY_ID      IN      ACC_VOUCHER.COMPANY_ID%TYPE
    ) IS
    BEGIN
        UPDATE ACC_VOUCHER
        SET
            AMOUNT = P_AMOUNT,
            ACCOUNT_ID = P_ACCOUNT_ID,
            PAID_TO = P_PAID_TO,
            REF_ID = P_REF_ID,
            VOUCHER_DATE = P_VOUCHER_DATE,
            VOUCHER_TYPE = P_VOUCHER_TYPE,
            PAYMENT_METHOD = P_PAYMENT_METHOD,
            NOTE = P_NOTE,
            CHECK_NO = P_CHECK_NO,
            CHECK_DATE = P_CHECK_DATE,
            COST_CNTR_ID = P_COST_CNTR_ID,
            TOTAL_VAT = P_TOTAL_VAT,
            COMPANY_ID = P_COMPANY_ID
        WHERE
            ACC_VOUCHER_ID = P_ACC_VOUCHER_ID;

    END;

    PROCEDURE POST_CASH_OUT_VOUCHER (
        P_ACC_VOUCHER_ID IN ACC_VOUCHER.ACC_VOUCHER_ID%TYPE
    ) AS
        P_CREDIT        NUMBER:= 0;
        P_DEBIT         NUMBER:= 0;
        P_ACCOUNT_ID    NUMBER;
        P_JOURNAL_TYPE  NUMBER;
        P_JOURNAL_ID    NUMBER;
        P_LEDGER_ID     NUMBER;
        V_COMPANY_ID    NUMBER;
        P_CASE_ID       NUMBER;
        P_JOURNAL_DATE  ACC_LEDGER.JOURNAL_DATE%TYPE;
        P_NOTE          ACC_LEDGER.NOTE%TYPE;
        P_COST_CNTR_ID  ACC_LEDGER.COST_CNTR_ID%TYPE;
        P_MSG           NVARCHAR2(200);
    BEGIN


        SELECT
            ACC_VOUCHER_ID,
            AMOUNT,
            ACCOUNT_ID,
            VOUCHER_TYPE,
            VOUCHER_DATE,
            NOTE,
            COST_CNTR_ID,
            COMPANY_ID
        INTO 
            P_JOURNAL_ID,
            P_CREDIT,
            P_ACCOUNT_ID,
            P_JOURNAL_TYPE,
            P_JOURNAL_DATE,
            P_NOTE,
            P_COST_CNTR_ID,
            V_COMPANY_ID
        FROM
            ACC_VOUCHER
        WHERE ACC_VOUCHER_ID = P_ACC_VOUCHER_ID;

        ACC_LEDGER_TAPI.ADD_RECORD (  
            P_JOURNAL_ID    => P_JOURNAL_ID,
            P_ACCOUNT_ID    => P_ACCOUNT_ID,
            P_CREDIT        => P_CREDIT,
            P_DEBIT         => 0,
            P_JOURNAL_TYPE  => P_JOURNAL_TYPE,
            P_COMPANY_ID    => V_COMPANY_ID,
            P_JOURNAL_DATE  => P_JOURNAL_DATE,
            P_NOTE          => P_NOTE,
            P_COST_CNTR_ID  => P_COST_CNTR_ID,
            P_LEDGER_ID     => P_LEDGER_ID
        );

        FOR REC IN (
            SELECT
                ACC_VOUCHER_ID,
                ACCOUNT_ID,
                AMOUNT,
                NOTE,
                COST_CNTR_ID
            FROM
                ACC_VOUCHER_DTL
            WHERE ACC_VOUCHER_ID = P_ACC_VOUCHER_ID
        )
        LOOP
            ACC_LEDGER_TAPI.ADD_RECORD (  
                P_JOURNAL_ID    => REC.ACC_VOUCHER_ID,
                P_ACCOUNT_ID    => REC.ACCOUNT_ID,
                P_CREDIT        => 0,
                P_DEBIT         => REC.AMOUNT,
                P_JOURNAL_TYPE  => P_JOURNAL_TYPE,
                P_COMPANY_ID    => V_COMPANY_ID,
                P_JOURNAL_DATE  => P_JOURNAL_DATE,
                P_NOTE          => REC.NOTE,
                P_COST_CNTR_ID  => REC.COST_CNTR_ID,
                P_LEDGER_ID     => P_LEDGER_ID
            );
        END LOOP;

        UPDATE ACC_VOUCHER
        SET POSTED = 1
        WHERE ACC_VOUCHER_ID = P_ACC_VOUCHER_ID;

    END POST_CASH_OUT_VOUCHER;


    PROCEDURE POST_CASH_IN_VOUCHER (
        P_ACC_VOUCHER_ID IN ACC_VOUCHER.ACC_VOUCHER_ID%TYPE
    ) AS
        P_CREDIT        NUMBER:= 0;
        P_DEBIT         NUMBER:= 0;
        P_ACCOUNT_ID    NUMBER;
        P_JOURNAL_TYPE  NUMBER;
        P_JOURNAL_ID    NUMBER;
        P_LEDGER_ID     NUMBER;
        V_COMPANY_ID    NUMBER;
        P_CASE_ID       NUMBER;
        P_JOURNAL_DATE  ACC_LEDGER.JOURNAL_DATE%TYPE;
        P_NOTE          ACC_LEDGER.NOTE%TYPE;
        P_COST_CNTR_ID  ACC_LEDGER.COST_CNTR_ID%TYPE;
        P_MSG           NVARCHAR2(200);
    BEGIN


        SELECT
            ACC_VOUCHER_ID,
            AMOUNT,
            ACCOUNT_ID,
            VOUCHER_TYPE,
            VOUCHER_DATE,
            NOTE,
            COST_CNTR_ID,
            COMPANY_ID
        INTO 
            P_JOURNAL_ID,
            P_DEBIT,
            P_ACCOUNT_ID,
            P_JOURNAL_TYPE,
            P_JOURNAL_DATE,
            P_NOTE,
            P_COST_CNTR_ID,
            V_COMPANY_ID 
        FROM
            ACC_VOUCHER
        WHERE ACC_VOUCHER_ID = P_ACC_VOUCHER_ID;

        P_CREDIT := 0;


        ACC_LEDGER_TAPI.ADD_RECORD (  
            P_JOURNAL_ID    => P_JOURNAL_ID,
            P_ACCOUNT_ID    => P_ACCOUNT_ID,
            P_CREDIT        => 0,
            P_DEBIT         => P_DEBIT,
            P_JOURNAL_TYPE  => P_JOURNAL_TYPE,
            P_COMPANY_ID    => V_COMPANY_ID,
            P_JOURNAL_DATE  => P_JOURNAL_DATE,
            P_NOTE          => P_NOTE,
            P_COST_CNTR_ID  => P_COST_CNTR_ID,
            P_LEDGER_ID     => P_LEDGER_ID
        );

        FOR REC IN (
            SELECT
                ACC_VOUCHER_ID,
                ACCOUNT_ID,
                AMOUNT,
                NOTE,
                COST_CNTR_ID
            FROM
                ACC_VOUCHER_DTL
            WHERE ACC_VOUCHER_ID = P_ACC_VOUCHER_ID
        )
        LOOP
            ACC_LEDGER_TAPI.ADD_RECORD (  
                P_JOURNAL_ID    => REC.ACC_VOUCHER_ID,
                P_ACCOUNT_ID    => REC.ACCOUNT_ID,
                P_CREDIT        => REC.AMOUNT,
                P_DEBIT         => 0,
                P_JOURNAL_TYPE  => P_JOURNAL_TYPE,
                P_COMPANY_ID    => V_COMPANY_ID,
                P_JOURNAL_DATE  => P_JOURNAL_DATE,
                P_NOTE          => REC.NOTE,
                P_COST_CNTR_ID  => REC.COST_CNTR_ID,
                P_LEDGER_ID     => P_LEDGER_ID
            );
        END LOOP;

        UPDATE ACC_VOUCHER
        SET POSTED = 1
        WHERE ACC_VOUCHER_ID = P_ACC_VOUCHER_ID;

    END POST_CASH_IN_VOUCHER;

END ACC_VOUCHER_TAPI;

/
--------------------------------------------------------
--  DDL for Package Body ADMIN_COMPANY_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ADMIN_COMPANY_TAPI" is
--------------------------------------------------------------
-- create procedure for table ADMIN_COMPANY
--------------------------------------------------------------
   procedure INSERT_ADMIN_COMPANY (
      P_COMPANY_ID  in OUT ADMIN_COMPANY.COMPANY_ID %TYPE                    ,
      P_NAME_AR     in ADMIN_COMPANY.NAME_AR    %TYPE                    default null,
      P_NAME_EN     in ADMIN_COMPANY.NAME_EN    %TYPE                    default null,
      P_MOBILE_NO   in ADMIN_COMPANY.MOBILE_NO  %TYPE                    default null,
      P_TEL_NO      in ADMIN_COMPANY.TEL_NO     %TYPE                    default null,
      P_FAX         in ADMIN_COMPANY.FAX        %TYPE                    default null,
      P_EMAIL       in ADMIN_COMPANY.EMAIL      %TYPE                    default null,
      P_TAX_NO      in ADMIN_COMPANY.TAX_NO     %TYPE                    default null,
      P_COUNTRY_ID  in ADMIN_COMPANY.COUNTRY_ID %TYPE                    default null,
      P_CITY_ID     in ADMIN_COMPANY.CITY_ID    %TYPE                    default null,
      P_REGION_ID   in ADMIN_COMPANY.REGION_ID  %TYPE                    default null,
      P_BUILDING_NO in ADMIN_COMPANY.BUILDING_NO%TYPE                    default null,
      P_SREET       in ADMIN_COMPANY.SREET      %TYPE                    default null,
      P_POST_CODE   in ADMIN_COMPANY.POST_CODE  %TYPE                    default null,
      P_NOTE        in ADMIN_COMPANY.NOTE       %TYPE                    default null,
      P_STATUS      in ADMIN_COMPANY.STATUS     %TYPE                    default null
   ) is 
 
   begin

      insert into ADMIN_COMPANY (
         NAME_AR,
         NAME_EN,
         MOBILE_NO,
         TEL_NO,
         FAX,
         EMAIL,
         TAX_NO,
         COUNTRY_ID,
         CITY_ID,
         REGION_ID,
         BUILDING_NO,
         SREET,
         POST_CODE,
         NOTE,
         STATUS
      ) values ( 
         P_NAME_AR,
         P_NAME_EN,
         P_MOBILE_NO,
         P_TEL_NO,
         P_FAX,
         P_EMAIL,
         P_TAX_NO,
         P_COUNTRY_ID,
         P_CITY_ID,
         P_REGION_ID,
         P_BUILDING_NO,
         P_SREET,
         P_POST_CODE,
         P_NOTE,
         P_STATUS
      )RETURNING COMPANY_ID INTO P_COMPANY_ID;

   end INSERT_ADMIN_COMPANY;
--------------------------------------------------------------
-- update procedure for table ADMIN_COMPANY
--------------------------------------------------------------
   procedure UPDATE_ADMIN_COMPANY (
      P_COMPANY_ID  in ADMIN_COMPANY.COMPANY_ID %TYPE  ,
      P_NAME_AR     in ADMIN_COMPANY.NAME_AR    %TYPE                     default null,
      P_NAME_EN     in ADMIN_COMPANY.NAME_EN    %TYPE                     default null,
      P_MOBILE_NO   in ADMIN_COMPANY.MOBILE_NO  %TYPE                     default null,
      P_TEL_NO      in ADMIN_COMPANY.TEL_NO     %TYPE                     default null,
      P_FAX         in ADMIN_COMPANY.FAX        %TYPE                     default null,
      P_EMAIL       in ADMIN_COMPANY.EMAIL      %TYPE                     default null,
      P_TAX_NO      in ADMIN_COMPANY.TAX_NO     %TYPE                     default null,
      P_COUNTRY_ID  in ADMIN_COMPANY.COUNTRY_ID %TYPE                     default null,
      P_CITY_ID     in ADMIN_COMPANY.CITY_ID    %TYPE                     default null,
      P_REGION_ID   in ADMIN_COMPANY.REGION_ID  %TYPE                     default null,
      P_BUILDING_NO in ADMIN_COMPANY.BUILDING_NO%TYPE                     default null,
      P_SREET       in ADMIN_COMPANY.SREET      %TYPE                     default null,
      P_POST_CODE   in ADMIN_COMPANY.POST_CODE  %TYPE                     default null,
      P_NOTE        in ADMIN_COMPANY.NOTE       %TYPE                     default null,
      P_STATUS      in ADMIN_COMPANY.STATUS     %TYPE                     default null
   ) is 

      L_MD5 varchar2(32767) := null;

   begin


         update ADMIN_COMPANY set
            COMPANY_ID    = P_COMPANY_ID,
            NAME_AR       = P_NAME_AR,
            NAME_EN       = P_NAME_EN,
            MOBILE_NO     = P_MOBILE_NO,
            TEL_NO        = P_TEL_NO,
            FAX           = P_FAX,
            EMAIL         = P_EMAIL,
            TAX_NO        = P_TAX_NO,
            COUNTRY_ID    = P_COUNTRY_ID,
            CITY_ID       = P_CITY_ID,
            REGION_ID     = P_REGION_ID,
            BUILDING_NO   = P_BUILDING_NO,
            SREET         = P_SREET,
            POST_CODE     = P_POST_CODE,
            NOTE          = P_NOTE,
            STATUS        = P_STATUS
         where COMPANY_ID = P_COMPANY_ID;


   end UPDATE_ADMIN_COMPANY;
--------------------------------------------------------------
-- delete procedure for table ADMIN_COMPANY
--------------------------------------------------------------
   procedure DELELTE_ADMIN_COMPANY (
      P_COMPANY_ID   in ADMIN_COMPANY.COMPANY_ID %TYPE 
   ) is 

   begin

      delete from ADMIN_COMPANY 
      where COMPANY_ID = P_COMPANY_ID;

   end DELELTE_ADMIN_COMPANY;

end ADMIN_COMPANY_TAPI;

/
--------------------------------------------------------
--  DDL for Package Body ADMIN_USER_SESSION_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ADMIN_USER_SESSION_TAPI" IS

    PROCEDURE INS (
        P_USER_ID                IN   ADMIN_USER_SESSION.USER_ID%TYPE,
        P_COMPANY_ID             IN   ADMIN_USER_SESSION.COMPANY_ID%TYPE,
        P_USERNAME               IN   NVARCHAR2,
        P_USER_PREFERED_LANG     IN  VARCHAR2,
        P_USER_PREFERED_LANG_ID  IN  NUMBER,
        P_TOKEN                  OUT  ADMIN_USER_SESSION.TOKEN%TYPE,
        P_SESSION_ID             OUT  ADMIN_USER_SESSION.SESSION_ID%TYPE
    ) IS
    BEGIN
        P_TOKEN := 'GDGFDGFDGYET243434FDGFDGFD';
        INSERT INTO ADMIN_USER_SESSION (
            TOKEN,
            CREATED_AT,
            EXPIRES,
            USER_ID,
            COMPANY_ID,
            USERNAME,
            USER_PREFERED_LANG_ID,
            USER_PREFERED_LANG
        ) VALUES (
            P_TOKEN,
            SYSTIMESTAMP,
            3600,
            P_USER_ID,
            P_COMPANY_ID,
            P_USERNAME,
            P_USER_PREFERED_LANG_ID,
            P_USER_PREFERED_LANG
        ) RETURNING SESSION_ID,TOKEN INTO P_SESSION_ID, P_TOKEN;

    END;

    PROCEDURE UPD (
        P_CREATED_AT  IN  ADMIN_USER_SESSION.CREATED_AT%TYPE DEFAULT NULL,
        P_EXPIRES     IN  ADMIN_USER_SESSION.EXPIRES%TYPE DEFAULT NULL,
        P_USER_ID     IN  ADMIN_USER_SESSION.USER_ID%TYPE DEFAULT NULL,
        P_SESSION_ID  IN  ADMIN_USER_SESSION.SESSION_ID%TYPE,
        P_TOKEN       IN  ADMIN_USER_SESSION.TOKEN%TYPE DEFAULT NULL,
        P_COMPANY_ID  IN  ADMIN_USER_SESSION.COMPANY_ID%TYPE DEFAULT NULL
    ) IS
    BEGIN
        UPDATE ADMIN_USER_SESSION
        SET
            CREATED_AT = P_CREATED_AT,
            EXPIRES = P_EXPIRES,
            USER_ID = P_USER_ID,
            TOKEN = P_TOKEN,
            COMPANY_ID = P_COMPANY_ID
        WHERE
            SESSION_ID = P_SESSION_ID;

    END;

    PROCEDURE DEL (
        P_SESSION_ID IN ADMIN_USER_SESSION.SESSION_ID%TYPE
    ) IS
    BEGIN
        DELETE FROM ADMIN_USER_SESSION
        WHERE
            SESSION_ID = P_SESSION_ID;

    END;

END ADMIN_USER_SESSION_TAPI;

/
--------------------------------------------------------
--  DDL for Package Body AUTH
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "AUTH" AS

    FUNCTION HAS_PAGE_ACCESS (
        P_USER_ID  NUMBER,
        P_PAGE_ID  NUMBER
    ) RETURN BOOLEAN AS
        V_CNT NUMBER;
    BEGIN
        SELECT
            COUNT(*)
        INTO V_CNT
        FROM
                 ACL_APP_ROLE RL
            JOIN ACL_APP_INTERFACE  PRIV ON PRIV.ROLE_ID = RL.ROLE_ID
            JOIN ADMIN_APP_INTERFACE   INF ON PRIV.INTERFACE_ID = INF.INTERFACE_ID
        WHERE
                RL.USER_ID = P_USER_ID
            AND INF.INTERFACE_ID = P_PAGE_ID
            AND PRIV.STATUS = 1;

        RETURN(V_CNT > 0);
    END HAS_PAGE_ACCESS;


    FUNCTION HAS_ITEM_ACCESS (
        P_USER_ID  NUMBER,
        P_PAGE_ID  NUMBER,
        P_COMPONENT_ID  NUMBER
    ) RETURN BOOLEAN AS
        V_CNT NUMBER;
    BEGIN
        SELECT
            COUNT(*)
        INTO V_CNT
        FROM
                 ACL_APP_ROLE RL
            JOIN ACL_INTERFACE_OPR  PRIV ON PRIV.ROLE_ID = RL.ROLE_ID
            JOIN ADMIN_APP_INTERFACE   INF ON PRIV.INTERFACE_ID = INF.INTERFACE_ID
        WHERE
                upper(RL.USER_ID) = upper(P_USER_ID)
            AND INF.INTERFACE_ID = P_PAGE_ID
            AND priv.operation_id = P_COMPONENT_ID
            AND PRIV.STATUS = 1;
        --RAISE_APPLICATION_ERROR(-20000, 'P_COMPONENT_ID:'||P_COMPONENT_ID);
        RETURN(V_CNT > 0);
    END HAS_ITEM_ACCESS;
    FUNCTION LOGIN (
        P_USERNAME  NVARCHAR2,
        P_PASSWORD  NVARCHAR2
    ) RETURN BOOLEAN AS
        V_COUNT NUMBER;
    BEGIN
        SELECT
            COUNT(*)
        INTO V_COUNT
        FROM
            SETUP_APP_USER
        WHERE
                PASS = P_PASSWORD
            AND UPPER(USER_NAME) = UPPER(P_USERNAME);
    
        IF V_COUNT > 0 THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;    
    PROCEDURE SET_USER_INFO (
        P_USERNAME               IN   NVARCHAR2,
        P_USER_PREFERED_LANG     OUT  VARCHAR2,
        P_USER_PREFERED_LANG_ID  OUT  NUMBER,
        P_COMPANY_ID             OUT  NUMBER,
        P_USER_ID                OUT  NUMBER
    ) AS
    BEGIN
        SELECT
            COMPANY_ID,
            DECODE(PREFERED_LANG_ID,1,'en','ar'),
            PREFERED_LANG_ID,
            USER_ID
        INTO 
            P_COMPANY_ID,
            P_USER_PREFERED_LANG,
            P_USER_PREFERED_LANG_ID,
            P_USER_ID
        FROM
            SETUP_APP_USER
        WHERE
            UPPER(USER_NAME) = UPPER(P_USERNAME);

    EXCEPTION
        WHEN OTHERS THEN
            NULL;
    END;
END auth;

/
--------------------------------------------------------
--  DDL for Package Body COMPUTE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "COMPUTE" AS
    FUNCTION CALC_INV (
        P_QUANTITY             NUMBER,
        P_BASE_PRICE           NUMBER,
        P_PRICE_WITH_VAT       NUMBER,
        P_TOTAL_PRICE          NUMBER,
        P_VAT_PERCENTAGE       NUMBER,
        P_DISCOUNT_PERCENTAGE  NUMBER
    ) RETURN INV_DTL_TBL AS
        V_INV_DTL_REC  INV_DTL_REC;
        V_INV_DTL_TBL  INV_DTL_TBL := INV_DTL_TBL();
    BEGIN
        V_INV_DTL_REC := INV_DTL_REC(
            QUANTITY                   => 0,
            BASE_PRICE                 => 0,
            TOTAL_PRICE                => 0,
            DISCOUNT_VALUE             => 0,
            POST_DISCOUNT_TOTAL_PRICE  => 0,
            VAT_VALUE                  => 0,
            TOTAL_AMOUNT               => 0,
            PRE_DISCOUNT_VAT_VALUE     => 0
        );
        
        V_INV_DTL_REC.QUANTITY := P_QUANTITY;
        IF NVL(V_INV_DTL_REC.QUANTITY,0) = 0 THEN
            V_INV_DTL_REC.QUANTITY                  := 1;
        END IF;
        IF NVL(P_BASE_PRICE,0) > 0 THEN
            V_INV_DTL_REC.BASE_PRICE            := ROUND(P_BASE_PRICE,9);
        ELSIF NVL(P_PRICE_WITH_VAT,0) > 0 THEN
            V_INV_DTL_REC.BASE_PRICE            := ROUND((P_PRICE_WITH_VAT*100)/(NVL(P_VAT_PERCENTAGE,0)+100),9);
        ELSIF NVL(P_TOTAL_PRICE,0) > 0 THEN
            V_INV_DTL_REC.BASE_PRICE            := ROUND((P_TOTAL_PRICE/V_INV_DTL_REC.QUANTITY*100)/(NVL(P_VAT_PERCENTAGE,0)+100),9);
        END IF;
        V_INV_DTL_REC.TOTAL_PRICE               := ROUND(V_INV_DTL_REC.BASE_PRICE*V_INV_DTL_REC.QUANTITY,9);
        V_INV_DTL_REC.DISCOUNT_VALUE            := ROUND(V_INV_DTL_REC.TOTAL_PRICE*NVL(P_DISCOUNT_PERCENTAGE,0)/100,9);
        V_INV_DTL_REC.POST_DISCOUNT_TOTAL_PRICE := ROUND(V_INV_DTL_REC.TOTAL_PRICE - V_INV_DTL_REC.TOTAL_PRICE*NVL(P_DISCOUNT_PERCENTAGE,0)/100,9);
        V_INV_DTL_REC.VAT_VALUE                 := ROUND(V_INV_DTL_REC.POST_DISCOUNT_TOTAL_PRICE*NVL(P_VAT_PERCENTAGE,0)/100,9);
        V_INV_DTL_REC.PRE_DISCOUNT_VAT_VALUE    := ROUND(V_INV_DTL_REC.TOTAL_PRICE * NVL(P_VAT_PERCENTAGE,0)/100,9);
        V_INV_DTL_REC.TOTAL_AMOUNT              := ROUND(NVL(V_INV_DTL_REC.POST_DISCOUNT_TOTAL_PRICE + V_INV_DTL_REC.VAT_VALUE,0),2);
        V_INV_DTL_TBL.EXTEND;
        V_INV_DTL_TBL(1) := V_INV_DTL_REC;
        RETURN V_INV_DTL_TBL;
        
    END;
    
    FUNCTION CALC_VAT (
        P_BASE_AMOUNT           NUMBER,
        P_AMOUNT_WITH_VAT       NUMBER,
        P_VAT_PERCENTAGE       NUMBER
    ) RETURN AMOUNT_VAT_TBL AS
        V_DEF  NUMBER;
        V_AMOUNT_VAT_REC  AMOUNT_VAT_REC;
        V_AMOUNT_VAT_TBL  AMOUNT_VAT_TBL := AMOUNT_VAT_TBL();
    BEGIN
        V_AMOUNT_VAT_REC := AMOUNT_VAT_REC(
            AMOUNT          => 0,
            VAT             => 0,
            AMOUNT_WITH_VAT => 0
        );
        
        IF NVL(P_BASE_AMOUNT,0) > 0 THEN
            V_AMOUNT_VAT_REC.AMOUNT            := ROUND(P_BASE_AMOUNT,9);
        ELSIF NVL(P_AMOUNT_WITH_VAT,0) > 0 THEN
            V_AMOUNT_VAT_REC.AMOUNT            := ROUND((P_AMOUNT_WITH_VAT*100)/(NVL(P_VAT_PERCENTAGE,0)+100),9);
        END IF;
        V_AMOUNT_VAT_REC.VAT                := ROUND(V_AMOUNT_VAT_REC.AMOUNT*NVL(P_VAT_PERCENTAGE,0)/100,9);
        V_AMOUNT_VAT_REC.AMOUNT_WITH_VAT    := ROUND(V_AMOUNT_VAT_REC.AMOUNT+V_AMOUNT_VAT_REC.VAT,9);        
        
        IF NVL(P_AMOUNT_WITH_VAT,0) > 0 THEN
            V_DEF := P_AMOUNT_WITH_VAT-V_AMOUNT_VAT_REC.AMOUNT_WITH_VAT;
            V_AMOUNT_VAT_REC.AMOUNT := V_AMOUNT_VAT_REC.AMOUNT+V_DEF;
            V_AMOUNT_VAT_REC.AMOUNT_WITH_VAT    := ROUND(V_AMOUNT_VAT_REC.AMOUNT+V_AMOUNT_VAT_REC.VAT,9);        
        END IF;
        
        V_AMOUNT_VAT_TBL.EXTEND;
        V_AMOUNT_VAT_TBL(1) := V_AMOUNT_VAT_REC;
        RETURN V_AMOUNT_VAT_TBL;
        
    END;
END COMPUTE;

/
--------------------------------------------------------
--  DDL for Package Body DATA_VALIDATION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DATA_VALIDATION" AS
    
    FUNCTION GET_ERROR_MSG(
        P_MSG_ID IN NUMBER,
        P_LANG    IN   NUMBER
    ) RETURN VARCHAR2 AS
        V_MSG VARCHAR2(2000);
    BEGIN
        SELECT DECODE(P_LANG, 1, MSG_TEXT_EN,MSG_TEXT_AR)
        INTO V_MSG
        FROM ADMIN_ERROR_MSG
        WHERE MSG_ID = P_MSG_ID;
        RETURN V_MSG;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 'NO MESSAGE.';
    END;

    PROCEDURE BRANCH_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        IF P_DATA.GET_STRING('name_ar') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"name_ar",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 3,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('name_en') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"name_en",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 4,P_LANG => P_LANG)||'"}
            '));
        END IF;
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END BRANCH_VALIDATE;
    PROCEDURE BANK_ACCOUNT_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        IF P_DATA.GET_STRING('acc_name_ar') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"acc_name_ar",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 5,P_LANG => P_LANG)||'"
            }'));
        END IF;        
        
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END BANK_ACCOUNT_VALIDATE;
    PROCEDURE CURRENCY_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        IF P_DATA.GET_STRING('name_ar') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"name_ar",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 3,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('code_ar') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"code_ar",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 6,P_LANG => P_LANG)||'"
            }'));
        END IF;
        
        
        
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END CURRENCY_VALIDATE;
    PROCEDURE UNIT_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        IF P_DATA.GET_STRING('unit_name_ar') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"unit_name_ar",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 7,P_LANG => P_LANG)||'"
            }'));
        END IF;
        
        
        
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END UNIT_VALIDATE;
    PROCEDURE PRODUCT_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        IF P_DATA.GET_STRING('product_name_ar') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"product_name_ar",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 8,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('barcode') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"barcode",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 9,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('tax_group_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"tax_group_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 10,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('default_unit_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"default_unit_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 12,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('tax_value') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"tax_value",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 11,P_LANG => P_LANG)||'"
            }'));
        END IF;
        
        
        
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END PRODUCT_VALIDATE;
    PROCEDURE PRODUCT_UNIT_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        IF P_DATA.GET_STRING('product_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"product_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 19,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('unit_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"unit_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 20,P_LANG => P_LANG)||'"
            }'));
        END IF;
        
        
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END PRODUCT_UNIT_VALIDATE;
    PROCEDURE PRODUCT_BARCODE_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        IF P_DATA.GET_STRING('product_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"product_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 19,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('barcode') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"barcode",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 9,P_LANG => P_LANG)||'"
            }'));
        END IF;
        
        
        
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END PRODUCT_BARCODE_VALIDATE;
    PROCEDURE COUNTRY_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        IF P_DATA.GET_STRING('name_ar') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"name_ar",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 3,P_LANG => P_LANG)||'"
            }'));
        END IF;
        
        
        
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END COUNTRY_VALIDATE;
    PROCEDURE CITY_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        IF P_DATA.GET_STRING('country_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"country_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 21,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('city_name_ar') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"city_name_ar",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 13,P_LANG => P_LANG)||'"
            }'));
        END IF;
        
        
        
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END CITY_VALIDATE;
    PROCEDURE REGION_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        
        IF P_DATA.GET_STRING('country_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"country_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 21,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('city_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"city_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 22,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('region_name_ar') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"region_name_ar",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 14,P_LANG => P_LANG)||'"
            }'));
        END IF;
        
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END REGION_VALIDATE;
    PROCEDURE PURCHASE_INV_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        
        IF P_DATA.GET_STRING('invoice_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"invoice_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 15,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('invoice_type') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"invoice_type",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 23,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('provider_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"provider_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 24,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('provider_inv_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"provider_inv_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 16,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('store_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"store_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 25,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('store_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"store_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 17,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('safe_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"safe_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 26,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('cost_ctr_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"cost_ctr_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 27,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('payment_type') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"payment_type",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 28,P_LANG => P_LANG)||'"
            }'));
        END IF;
        
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END PURCHASE_INV_VALIDATE;        
    
    PROCEDURE PURCHASE_ORDER_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        
        IF P_DATA.GET_STRING('order_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"order_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 15,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('invoice_type') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"invoice_type",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 23,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('provider_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"provider_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 24,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('provider_inv_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"provider_inv_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 16,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('store_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"store_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 25,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('store_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"store_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 17,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('safe_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"safe_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 26,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('cost_ctr_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"cost_ctr_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 27,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('payment_type') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"payment_type",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 28,P_LANG => P_LANG)||'"
            }'));
        END IF;
        
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END PURCHASE_ORDER_VALIDATE;        
    PROCEDURE PUR_RETURN_INV_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        
        IF P_DATA.GET_STRING('invoice_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"invoice_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 15,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('invoice_type') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"invoice_type",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 23,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('provider_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"provider_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 24,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('provider_inv_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"provider_inv_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 16,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('store_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"store_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 25,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('store_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"store_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 17,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('safe_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"safe_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 26,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('cost_ctr_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"cost_ctr_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 27,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('payment_type') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"payment_type",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 28,P_LANG => P_LANG)||'"
            }'));
        END IF;
        
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END PUR_RETURN_INV_VALIDATE;
    PROCEDURE FIRST_PERIOD_STOCK_INV_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        
        
        IF P_DATA.GET_STRING('invoice_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"invoice_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 15,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('invoice_type') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"invoice_type",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 23,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('provider_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"provider_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 24,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('provider_inv_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"provider_inv_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 16,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('store_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"store_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 25,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('store_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"store_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 17,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('safe_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"safe_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 26,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('cost_ctr_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"cost_ctr_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 27,P_LANG => P_LANG)||'"
            }'));
        END IF;
        
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END FIRST_PERIOD_STOCK_INV_VALIDATE;
    PROCEDURE STOCKOUT_ORDER_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        
        IF P_DATA.GET_STRING('order_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"order_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 18,P_LANG => P_LANG)||'"
            }'));
        END IF;
        
        IF P_DATA.GET_STRING('store_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"store_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 25,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('cost_ctr_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"cost_ctr_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 27,P_LANG => P_LANG)||'"
            }'));
        END IF;
        
        
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END STOCKOUT_ORDER_VALIDATE;
    
    PROCEDURE CUSTOMER_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        IF P_DATA.GET_STRING('name_ar') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"name_ar",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 3,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('name_en') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"name_en",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 4,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('status') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"status",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 50,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('country_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"country_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 21,P_LANG => P_LANG)||'"
            }'));
        END IF;



        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END CUSTOMER_VALIDATE;

    PROCEDURE USER_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        IF P_DATA.GET_STRING('user_type') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"user_type",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 58,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('status') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"status",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 50,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('user_name') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"user_name",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 59,P_LANG => P_LANG)||'"
            }'));
        END IF;



        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END USER_VALIDATE;
    PROCEDURE ROLE_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        IF P_DATA.GET_STRING('role_name') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"role_name",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 52,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('role_name_en') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"role_name_en",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 53,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END ROLE_VALIDATE;
    PROCEDURE COMPANY_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        IF P_DATA.GET_STRING('name_ar') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"name_ar",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 3,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('name_en') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"name_en",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 4,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('status') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"status",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 50,P_LANG => P_LANG)||'"
            }'));
        END IF;
		IF P_DATA.GET_STRING('mobile_no') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"mobile_no",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 51,P_LANG => P_LANG)||'"
            }'));
        END IF;
		IF P_DATA.GET_STRING('country_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"country_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 21,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END COMPANY_VALIDATE;
    PROCEDURE SETUP_SAFE_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();

    
        IF P_DATA.GET_STRING('status') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"status",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 50,P_LANG => P_LANG)||'"
            }'));
        END IF;
		IF P_DATA.GET_STRING('account_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"account_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 31,P_LANG => P_LANG)||'"
            }'));
        END IF;
		IF P_DATA.GET_STRING('for_all_branches') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"for_all_branches",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 56,P_LANG => P_LANG)||'"
            }'));
        END IF;
		IF P_DATA.GET_STRING('safe_name_ar') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"safe_name_ar",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 57,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END SETUP_SAFE_VALIDATE;
    PROCEDURE SETUP_STORE_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        IF P_DATA.GET_STRING('branch_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"branch_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 54,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('Status') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"status",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 50,P_LANG => P_LANG)||'"
            }'));
        END IF;
		IF P_DATA.GET_STRING('store_name') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"store_name",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 55,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END SETUP_STORE_VALIDATE;

PROCEDURE SETUP_TAX_GROUP_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();


        IF P_DATA.GET_STRING('status') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"status",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 50,P_LANG => P_LANG)||'"
            }'));
        END IF;
         IF P_DATA.GET_STRING('name_ar') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"name_ar",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 3,P_LANG => P_LANG)||'"
            }'));
        END IF;
         IF P_DATA.GET_STRING('group_value') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"group_value",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 60,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END SETUP_TAX_GROUP_VALIDATE;

    PROCEDURE PROVIDER_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        IF P_DATA.GET_STRING('name_ar') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"name_ar",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 3,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('Name_En') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"name_en",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 4,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('status') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"status",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 50,P_LANG => P_LANG)||'"
            }'));
        END IF;
         IF P_DATA.GET_STRING('mobile_no') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"mobile_no",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 51,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('country_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"country_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 21,P_LANG => P_LANG)||'"
            }'));
        END IF;



        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END PROVIDER_VALIDATE;

   PROCEDURE SALES_INV_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();

        IF P_DATA.GET_STRING('invoice_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"invoice_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 15,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('invoice_type') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"invoice_type",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 23,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('client_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"client_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 24,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('store_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"store_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 25,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('store_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"store_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 17,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('safe_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"safe_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 26,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('cost_ctr_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"cost_ctr_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 27,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('payment_type') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"payment_type",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 28,P_LANG => P_LANG)||'"
            }'));
        END IF;

        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END SALES_INV_VALIDATE;

    PROCEDURE RECEIPT_VOUCHER_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();
        IF P_DATA.GET_STRING('voucher_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"voucher_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 35,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('amount') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"amount",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 30,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('account_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"account_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 31,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF (P_DATA.GET_STRING('credit_total') - P_DATA.GET_STRING('debit_total')) <> 0 THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"amount",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 33,P_LANG => P_LANG)||'"
            }'));
        END IF;
        
        
        
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END RECEIPT_VOUCHER_VALIDATE;

    PROCEDURE TRANSFER_ORDER_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();

        IF P_DATA.GET_STRING('from_store_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"from_store_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 25,P_LANG => P_LANG)||'"
            }'));
        END IF;

        IF P_DATA.GET_STRING('to_store_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"to_store_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 25,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('transfer_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"transfer_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 27,P_LANG => P_LANG)||'"
            }'));
        END IF;


        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END TRANSFER_ORDER_VALIDATE;
   PROCEDURE SALES_RETURN_INV_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();

        IF P_DATA.GET_STRING('invoice_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"invoice_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 15,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('invoice_type') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"invoice_type",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 23,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('client_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"client_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 24,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('store_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"store_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 25,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('store_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"store_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 17,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('safe_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"safe_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 26,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('cost_ctr_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"cost_ctr_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 27,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('payment_type') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"payment_type",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 28,P_LANG => P_LANG)||'"
            }'));
        END IF;

        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END SALES_RETURN_INV_VALIDATE;
    PROCEDURE STOCKIN_ORDER_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();

        IF P_DATA.GET_STRING('order_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"order_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 18,P_LANG => P_LANG)||'"
            }'));
        END IF;

        IF P_DATA.GET_STRING('store_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"store_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 25,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('cost_ctr_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"cost_ctr_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 27,P_LANG => P_LANG)||'"
            }'));
        END IF;


        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END STOCKIN_ORDER_VALIDATE;
PROCEDURE SETUP_PROD_GROUP_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();


        
        IF P_DATA.GET_STRING('status') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"status",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 50,P_LANG => P_LANG)||'"
            }'));
        END IF;
         IF P_DATA.GET_STRING('name_ar') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"name_ar",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 3,P_LANG => P_LANG)||'"
            }'));
        END IF;
         
        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END SETUP_PROD_GROUP_VALIDATE;
    
   PROCEDURE SALES_RENT_INV_VALIDATE (
        P_DATA    IN   JSON_OBJECT_T,
        P_LANG    IN   NUMBER,
        P_RESULT  OUT  JSON_OBJECT_T
    ) AS
        P_ERROR_ARR JSON_ARRAY_T;
    BEGIN
        P_ERROR_ARR := JSON_ARRAY_T();
        P_RESULT := JSON_OBJECT_T();

        IF P_DATA.GET_STRING('invoice_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"invoice_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 15,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('invoice_type') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"invoice_type",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 23,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('client_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"client_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 24,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('store_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"store_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 25,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('store_date') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"store_date",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 17,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('safe_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"safe_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 26,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('cost_ctr_id') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"cost_ctr_id",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 27,P_LANG => P_LANG)||'"
            }'));
        END IF;
        IF P_DATA.GET_STRING('payment_type') IS NULL THEN
            P_ERROR_ARR.APPEND(JSON_OBJECT_T('
            {
                "field_name":"payment_type",
                "message":"'||GET_ERROR_MSG(P_MSG_ID => 28,P_LANG => P_LANG)||'"
            }'));
        END IF;

        IF P_ERROR_ARR.get_size > 0 THEN
            P_RESULT.PUT('status','failed');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 2,P_LANG => P_LANG));
            P_RESULT.PUT('errors',P_ERROR_ARR);
        ELSE
            P_RESULT.PUT('status','succeeded');
            P_RESULT.PUT('message',GET_ERROR_MSG(P_MSG_ID => 1,P_LANG => P_LANG));
        END IF;
    END SALES_RENT_INV_VALIDATE;

END DATA_VALIDATION;

/
--------------------------------------------------------
--  DDL for Package Body FILE_UTILE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "FILE_UTILE" AS
    PROCEDURE SAVE_FILE(
        P_FILE_CONTENT  IN OUT NOCOPY BLOB,
        P_FOLDER_NAME   IN  VARCHAR2,
        P_FILE_NAME     IN  VARCHAR2
    )
    IS
        BUFFER RAW(1024);
        OFFSET PLS_INTEGER := 1;
        FileLength PLS_INTEGER;
        amount PLS_INTEGER := 1024;
        fhandle UTL_FILE.FILE_TYPE;
    BEGIN
        FileLength := DBMS_LOB.GETLENGTH(P_FILE_CONTENT);
        fhandle := UTL_FILE.FOPEN(P_FOLDER_NAME, P_FILE_NAME, 'wb');         
        LOOP
            EXIT WHEN OFFSET > FileLength;
            DBMS_LOB.READ(P_FILE_CONTENT, amount, OFFSET, BUFFER);
            UTL_FILE.PUT_RAW(fhandle, BUFFER, TRUE);
            OFFSET := OFFSET + amount;
        END LOOP;
        UTL_FILE.FCLOSE (fhandle);
    EXCEPTION
        WHEN OTHERS THEN
            IF UTL_FILE.IS_OPEN(fhandle) THEN
                UTL_FILE.FCLOSE(fhandle);
            END IF;
        RAISE;
    END SAVE_FILE;
    PROCEDURE DELETE_FILE(
        P_FOLDER_NAME   IN  VARCHAR2,
        P_FILE_NAME     IN  VARCHAR2
    )
    IS
    BEGIN
        UTL_FILE.FREMOVE (P_FOLDER_NAME, P_FILE_NAME );
    END DELETE_FILE;
END FILE_UTILE;

/
--------------------------------------------------------
--  DDL for Package Body INV_JOURNAL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "INV_JOURNAL" AS

    PROCEDURE SALE_INV_JOURNAL (
        P_INVOICE_ID      IN  NUMBER
    ) AS
        V_JOURNAL_TABLE JOURNAL_TABLE;
        V_JOURNAL_REC JOURNAL_REC;
        V_INDEX NUMBER := 0;
        V_ACC_JOURNAL_ID NUMBER;
        V_NOTE              VARCHAR2(4000);
        V_CLIENT            VARCHAR2(4000);
        P_LANG_ID           NUMBER;
    BEGIN
        V_JOURNAL_TABLE := JOURNAL_TABLE();
        FOR INV IN (
            SELECT
                INVOICE_DATE,
                INVOICE_TYPE,
                PAYMENT_TYPE,
                SAFE_ID,
                BANK_ACC_ID,
                COST_CTR_ID,
                CLIENT_ID,
                TOTAL_VAT,
                INVOICE_TOTAL_AMOUNT,
                PAID_CASH_AMOUNT,
                PAID_BANK_AMOUNT,
                NOTES,
                COMPANY_ID,
                DEFERRED_AMOUNT,
                PAID_AMOUNT,
                PRE_TAX_TOTAL_AMOUNT,
                USER_ID,
                INVOICE_NO
            FROM
                SALES_INV
            WHERE
                ACC_JOURNAL_ID IS NULL AND
                INVOICE_ID = P_INVOICE_ID
        ) LOOP
            SELECT PREFERED_LANG_ID
            INTO P_LANG_ID
            FROM SETUP_APP_USER
            WHERE USER_ID = INV.USER_ID;
            SELECT DECODE(P_LANG_ID,1,NAME_EN,NAME_AR)
            INTO V_CLIENT
            FROM SALES_CLIENT
            WHERE CLIENT_ID = INV.CLIENT_ID;
            SELECT MAKE_NOTE.GET_JOURNAL_NOTE(
                P_LANG_ID       => P_LANG_ID,
                P_JOURNAL_TYPE  => 4,
                P_INVOICE_TYPE  => INV.INVOICE_TYPE,
                P_REF_NO        => INV.INVOICE_NO,
                P_CLIENT        => V_CLIENT
            ) INTO V_NOTE FROM DUAL;
            V_JOURNAL_REC := JOURNAL_REC(
                DEBIT         => 0,
                CREDIT        => 0,
                ACCOUNT_ID    => 0,
                NOTE          => V_NOTE,
                COST_CNTR_ID  => INV.COST_CTR_ID,
                REF_NO        => NULL
            );
            IF INV.INVOICE_TYPE = 1 THEN
                IF INV.PAYMENT_TYPE = 1 THEN
                    V_JOURNAL_REC.CREDIT := 0;
                    V_JOURNAL_REC.DEBIT := INV.INVOICE_TOTAL_AMOUNT;
                    SELECT ACCOUNT_ID 
                    INTO V_JOURNAL_REC.ACCOUNT_ID 
                    FROM SETUP_SAFE 
                    WHERE SAFE_ID = INV.SAFE_ID;
                    V_INDEX := V_INDEX+1;
                    V_JOURNAL_TABLE.EXTEND;
                    V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
                ELSE
                    V_JOURNAL_REC.CREDIT := 0;
                    V_JOURNAL_REC.DEBIT := INV.PAID_BANK_AMOUNT;
                    SELECT ACCOUNT_ID 
                    INTO V_JOURNAL_REC.ACCOUNT_ID 
                    FROM SETUP_BANK_EXT_ACC
                    WHERE BANK_ACC_ID = INV.BANK_ACC_ID;
                    V_INDEX := V_INDEX+1;
                    V_JOURNAL_TABLE.EXTEND;
                    V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
                    IF INV.PAID_CASH_AMOUNT > 0 THEN
                        V_JOURNAL_REC.CREDIT := 0;
                        V_JOURNAL_REC.DEBIT := INV.PAID_CASH_AMOUNT;
                        SELECT ACCOUNT_ID 
                        INTO V_JOURNAL_REC.ACCOUNT_ID 
                        FROM SETUP_SAFE 
                        WHERE SAFE_ID = INV.SAFE_ID;
                        V_INDEX := V_INDEX+1;
                        V_JOURNAL_TABLE.EXTEND;
                        V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;                    
                    END IF;
                END IF;
            ELSE
                IF NVL(INV.DEFERRED_AMOUNT,0) > 0  THEN
                    V_JOURNAL_REC.CREDIT := 0;
                    V_JOURNAL_REC.DEBIT := INV.DEFERRED_AMOUNT;
                    SELECT ACCOUNT_ID 
                    INTO V_JOURNAL_REC.ACCOUNT_ID 
                    FROM SALES_CLIENT 
                    WHERE CLIENT_ID = INV.CLIENT_ID;
                    V_INDEX := V_INDEX+1;
                    V_JOURNAL_TABLE.EXTEND;
                    V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
                END IF;
                IF INV.INVOICE_TOTAL_AMOUNT - NVL(INV.DEFERRED_AMOUNT,0) > 0  THEN
                    IF INV.PAYMENT_TYPE = 1 THEN
                        V_JOURNAL_REC.CREDIT := 0;
                        V_JOURNAL_REC.DEBIT := INV.INVOICE_TOTAL_AMOUNT - NVL(INV.DEFERRED_AMOUNT,0);
                        SELECT ACCOUNT_ID 
                        INTO V_JOURNAL_REC.ACCOUNT_ID 
                        FROM SETUP_SAFE 
                        WHERE SAFE_ID = INV.SAFE_ID;
                        V_INDEX := V_INDEX+1;
                        V_JOURNAL_TABLE.EXTEND;
                        V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
                    ELSE
                        V_JOURNAL_REC.CREDIT := 0;
                        V_JOURNAL_REC.DEBIT := INV.PAID_BANK_AMOUNT;
                        SELECT ACCOUNT_ID 
                        INTO V_JOURNAL_REC.ACCOUNT_ID 
                        FROM SETUP_BANK_EXT_ACC
                        WHERE BANK_ACC_ID = INV.BANK_ACC_ID;
                        V_INDEX := V_INDEX+1;
                        V_JOURNAL_TABLE.EXTEND;
                        V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
                        IF INV.PAID_CASH_AMOUNT > 0 THEN
                            V_JOURNAL_REC.CREDIT := 0;
                            V_JOURNAL_REC.DEBIT := INV.PAID_CASH_AMOUNT;
                            SELECT ACCOUNT_ID 
                            INTO V_JOURNAL_REC.ACCOUNT_ID 
                            FROM SETUP_SAFE 
                            WHERE SAFE_ID = INV.SAFE_ID;
                            V_INDEX := V_INDEX+1;
                            V_JOURNAL_TABLE.EXTEND;
                            V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;                    
                        END IF;
                    END IF;
                END IF;
            END IF;
            IF INV.TOTAL_VAT > 0 THEN
                SELECT MAKE_NOTE.GET_JOURNAL_NOTE(
                    P_LANG_ID       => P_LANG_ID,
                    P_JOURNAL_TYPE  => 4,
                    P_INVOICE_TYPE  => INV.INVOICE_TYPE,
                    P_REF_NO        => INV.INVOICE_NO,
                    P_FOR_VAT       => 1,
                    P_CLIENT        => V_CLIENT
                ) INTO V_NOTE FROM DUAL;
                V_JOURNAL_REC.NOTE := V_NOTE;
                V_JOURNAL_REC.DEBIT := 0;
                V_JOURNAL_REC.CREDIT := INV.TOTAL_VAT;
                SELECT PARAM_VALUE
                INTO V_JOURNAL_REC.ACCOUNT_ID 
                FROM SETUP_PARAMS
                WHERE PARAM_ID = 4;
                V_INDEX := V_INDEX+1;
                V_JOURNAL_TABLE.EXTEND;
                V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;                    
            END IF; 
            V_JOURNAL_REC.DEBIT := 0;
            V_JOURNAL_REC.CREDIT := INV.PRE_TAX_TOTAL_AMOUNT;
            SELECT PARAM_VALUE
            INTO V_JOURNAL_REC.ACCOUNT_ID 
            FROM SETUP_PARAMS
            WHERE PARAM_ID = 5;
            V_INDEX := V_INDEX+1;
            V_JOURNAL_TABLE.EXTEND;
            V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
            BEGIN
                 ACC_JOURNAL_TAPI.MAKE_JOURNAL(
                    P_JOURNAL_TABLE     => V_JOURNAL_TABLE,
                    P_COMPANY_ID        => INV.COMPANY_ID,
                    P_JOURNAL_DATE      => INV.INVOICE_DATE,
                    P_JOURNAL_NOTE      => V_NOTE,
                    P_JOURNAL_TYPE      => 4,
                    P_ACC_JOURNAL_ID    => V_ACC_JOURNAL_ID
                );  
            END;
            UPDATE SALES_INV
            SET ACC_JOURNAL_ID = V_ACC_JOURNAL_ID
            WHERE INVOICE_ID = P_INVOICE_ID;
        END LOOP;
    END SALE_INV_JOURNAL;
    
    
    PROCEDURE SALE_RETURN_INV_JOURNAL (
        P_INVOICE_ID      IN  NUMBER
    ) AS
        V_JOURNAL_TABLE JOURNAL_TABLE;
        V_JOURNAL_REC JOURNAL_REC;
        V_INDEX NUMBER := 0;
        V_ACC_JOURNAL_ID NUMBER;
        V_NOTE              VARCHAR2(4000);
        V_CLIENT            VARCHAR2(4000);
        P_LANG_ID           NUMBER;
    BEGIN
        V_JOURNAL_TABLE := JOURNAL_TABLE();
        FOR INV IN (
            SELECT
                INVOICE_DATE,
                INVOICE_TYPE,
                PAYMENT_TYPE,
                SAFE_ID,
                BANK_ACC_ID,
                COST_CTR_ID,
                CLIENT_ID,
                TOTAL_VAT,
                INVOICE_TOTAL_AMOUNT,
                PAID_CASH_AMOUNT,
                PAID_BANK_AMOUNT,
                NOTES,
                COMPANY_ID,
                DEFERRED_AMOUNT,
                PAID_AMOUNT,
                PRE_TAX_TOTAL_AMOUNT,
                INVOICE_NO,
                USER_ID
            FROM
                SALES_RETURN_INV
            WHERE
                ACC_JOURNAL_ID IS NULL AND
                INVOICE_ID = P_INVOICE_ID
        ) LOOP
            SELECT PREFERED_LANG_ID
            INTO P_LANG_ID
            FROM SETUP_APP_USER
            WHERE USER_ID = INV.USER_ID;
            SELECT DECODE(P_LANG_ID,1,NAME_EN,NAME_AR)
            INTO V_CLIENT
            FROM SALES_CLIENT
            WHERE CLIENT_ID = INV.CLIENT_ID;
            SELECT MAKE_NOTE.GET_JOURNAL_NOTE(
                P_LANG_ID       => P_LANG_ID,
                P_JOURNAL_TYPE  => 5,
                P_INVOICE_TYPE  => INV.INVOICE_TYPE,
                P_REF_NO        => INV.INVOICE_NO,
                P_CLIENT        => V_CLIENT
            ) INTO V_NOTE FROM DUAL;
            V_JOURNAL_REC := JOURNAL_REC(
                DEBIT         => 0,
                CREDIT        => 0,
                ACCOUNT_ID    => 0,
                NOTE          => V_NOTE,
                COST_CNTR_ID  => INV.COST_CTR_ID,
                REF_NO        => NULL
            );
            IF INV.INVOICE_TYPE = 1 THEN
                IF INV.PAYMENT_TYPE = 1 THEN
                    V_JOURNAL_REC.CREDIT := INV.INVOICE_TOTAL_AMOUNT;
                    V_JOURNAL_REC.DEBIT := 0;
                    SELECT ACCOUNT_ID 
                    INTO V_JOURNAL_REC.ACCOUNT_ID 
                    FROM SETUP_SAFE 
                    WHERE SAFE_ID = INV.SAFE_ID;
                    V_INDEX := V_INDEX+1;
                    V_JOURNAL_TABLE.EXTEND;
                    V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
                ELSE
                    V_JOURNAL_REC.CREDIT := INV.PAID_BANK_AMOUNT;
                    V_JOURNAL_REC.DEBIT := 0;
                    SELECT ACCOUNT_ID 
                    INTO V_JOURNAL_REC.ACCOUNT_ID 
                    FROM SETUP_BANK_EXT_ACC
                    WHERE BANK_ACC_ID = INV.BANK_ACC_ID;
                    V_INDEX := V_INDEX+1;
                    V_JOURNAL_TABLE.EXTEND;
                    V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
                    IF INV.PAID_CASH_AMOUNT > 0 THEN
                        V_JOURNAL_REC.CREDIT := INV.PAID_CASH_AMOUNT;
                        V_JOURNAL_REC.DEBIT := 0;
                        SELECT ACCOUNT_ID 
                        INTO V_JOURNAL_REC.ACCOUNT_ID 
                        FROM SETUP_SAFE 
                        WHERE SAFE_ID = INV.SAFE_ID;
                        V_INDEX := V_INDEX+1;
                        V_JOURNAL_TABLE.EXTEND;
                        V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;                    
                    END IF;
                END IF;
            ELSE
                IF NVL(INV.DEFERRED_AMOUNT,0) > 0  THEN
                    V_JOURNAL_REC.CREDIT := INV.DEFERRED_AMOUNT;
                    V_JOURNAL_REC.DEBIT := 0;
                    SELECT ACCOUNT_ID 
                    INTO V_JOURNAL_REC.ACCOUNT_ID 
                    FROM SALES_CLIENT 
                    WHERE CLIENT_ID = INV.CLIENT_ID;
                    V_INDEX := V_INDEX+1;
                    V_JOURNAL_TABLE.EXTEND;
                    V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
                END IF;
                IF INV.INVOICE_TOTAL_AMOUNT - NVL(INV.DEFERRED_AMOUNT,0) > 0  THEN
                    IF INV.PAYMENT_TYPE = 1 THEN
                        V_JOURNAL_REC.CREDIT := INV.INVOICE_TOTAL_AMOUNT - NVL(INV.DEFERRED_AMOUNT,0);
                        V_JOURNAL_REC.DEBIT := 0;
                        SELECT ACCOUNT_ID 
                        INTO V_JOURNAL_REC.ACCOUNT_ID 
                        FROM SETUP_SAFE 
                        WHERE SAFE_ID = INV.SAFE_ID;
                        V_INDEX := V_INDEX+1;
                        V_JOURNAL_TABLE.EXTEND;
                        V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
                    ELSE
                        V_JOURNAL_REC.CREDIT := INV.PAID_BANK_AMOUNT;
                        V_JOURNAL_REC.DEBIT := 0;
                        SELECT ACCOUNT_ID 
                        INTO V_JOURNAL_REC.ACCOUNT_ID 
                        FROM SETUP_BANK_EXT_ACC
                        WHERE BANK_ACC_ID = INV.BANK_ACC_ID;
                        V_INDEX := V_INDEX+1;
                        V_JOURNAL_TABLE.EXTEND;
                        V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
                        IF INV.PAID_CASH_AMOUNT > 0 THEN
                            V_JOURNAL_REC.CREDIT := INV.PAID_CASH_AMOUNT;
                            V_JOURNAL_REC.DEBIT := 0;
                            SELECT ACCOUNT_ID 
                            INTO V_JOURNAL_REC.ACCOUNT_ID 
                            FROM SETUP_SAFE 
                            WHERE SAFE_ID = INV.SAFE_ID;
                            V_INDEX := V_INDEX+1;
                            V_JOURNAL_TABLE.EXTEND;
                            V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;                    
                        END IF;
                    END IF;
                END IF;
            END IF;
            IF INV.TOTAL_VAT > 0 THEN
                SELECT MAKE_NOTE.GET_JOURNAL_NOTE(
                    P_LANG_ID       => P_LANG_ID,
                    P_JOURNAL_TYPE  => 5,
                    P_INVOICE_TYPE  => INV.INVOICE_TYPE,
                    P_REF_NO        => INV.INVOICE_NO,
                    P_FOR_VAT       => 1,
                    P_CLIENT        => V_CLIENT
                ) INTO V_NOTE FROM DUAL;
                V_JOURNAL_REC.NOTE := V_NOTE;
                V_JOURNAL_REC.DEBIT := INV.TOTAL_VAT;
                V_JOURNAL_REC.CREDIT := 0;
                SELECT PARAM_VALUE
                INTO V_JOURNAL_REC.ACCOUNT_ID 
                FROM SETUP_PARAMS
                WHERE PARAM_ID = 4;
                V_INDEX := V_INDEX+1;
                V_JOURNAL_TABLE.EXTEND;
                V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;                    
            END IF; 
            V_JOURNAL_REC.DEBIT := INV.PRE_TAX_TOTAL_AMOUNT;
            V_JOURNAL_REC.CREDIT := 0;
            SELECT PARAM_VALUE
            INTO V_JOURNAL_REC.ACCOUNT_ID 
            FROM SETUP_PARAMS
            WHERE PARAM_ID = 5;
            V_INDEX := V_INDEX+1;
            V_JOURNAL_TABLE.EXTEND;
            V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
            BEGIN
                 ACC_JOURNAL_TAPI.MAKE_JOURNAL(
                    P_JOURNAL_TABLE     => V_JOURNAL_TABLE,
                    P_COMPANY_ID        => INV.COMPANY_ID,
                    P_JOURNAL_DATE      => INV.INVOICE_DATE,
                    P_JOURNAL_NOTE      => V_NOTE,
                    P_JOURNAL_TYPE      => 5,
                    P_ACC_JOURNAL_ID    => V_ACC_JOURNAL_ID
                );  
            END;
            UPDATE SALES_RETURN_INV
            SET ACC_JOURNAL_ID = V_ACC_JOURNAL_ID
            WHERE INVOICE_ID = P_INVOICE_ID;
        END LOOP;
    END SALE_RETURN_INV_JOURNAL;
    
    PROCEDURE PUR_INV_JOURNAL (
        P_INVOICE_ID      IN  NUMBER
    ) AS
        V_JOURNAL_TABLE     JOURNAL_TABLE;
        V_JOURNAL_REC       JOURNAL_REC;
        V_INDEX             NUMBER := 0;
        V_ACC_JOURNAL_ID    NUMBER;
        V_NOTE              VARCHAR2(4000);
        V_CLIENT            VARCHAR2(4000);
        P_LANG_ID           NUMBER;
    BEGIN
        V_JOURNAL_TABLE := JOURNAL_TABLE();
        FOR INV IN (
            SELECT
                INVOICE_DATE,
                INVOICE_TYPE,
                PAYMENT_TYPE,
                SAFE_ID,
                BANK_ACC_ID,
                COST_CTR_ID,
                PROVIDER_ID,
                TOTAL_VAT,
                INVOICE_TOTAL_AMOUNT,
                PAID_CASH_AMOUNT,
                PAID_BANK_AMOUNT,
                NOTES,
                COMPANY_ID,
                DEFERRED_AMOUNT,
                PAID_AMOUNT,
                PRE_TAX_TOTAL_AMOUNT,
                INVOICE_NO,
                USER_ID
            FROM
                SALES_PURCHASE_INV
            WHERE
                ACC_JOURNAL_ID IS NULL AND
                INVOICE_ID = P_INVOICE_ID
        ) LOOP
            SELECT PREFERED_LANG_ID
            INTO P_LANG_ID
            FROM SETUP_APP_USER
            WHERE USER_ID = INV.USER_ID;
            SELECT DECODE(P_LANG_ID,1,NAME_EN,NAME_AR)
            INTO V_CLIENT
            FROM SALES_PROVIDER
            WHERE PROVIDER_ID = INV.PROVIDER_ID;
            SELECT MAKE_NOTE.GET_JOURNAL_NOTE(
                P_LANG_ID       => P_LANG_ID,
                P_JOURNAL_TYPE  => 6,
                P_INVOICE_TYPE  => INV.INVOICE_TYPE,
                P_REF_NO        => INV.INVOICE_NO,
                P_CLIENT        => V_CLIENT
            ) INTO V_NOTE FROM DUAL;
            V_JOURNAL_REC := JOURNAL_REC(
                DEBIT         => 0,
                CREDIT        => 0,
                ACCOUNT_ID    => 0,
                NOTE          => V_NOTE,
                COST_CNTR_ID  => INV.COST_CTR_ID,
                REF_NO        => NULL
            );
            IF INV.INVOICE_TYPE = 1 THEN
                IF INV.PAYMENT_TYPE = 1 THEN
                    V_JOURNAL_REC.CREDIT := INV.INVOICE_TOTAL_AMOUNT;
                    V_JOURNAL_REC.DEBIT := 0;
                    SELECT ACCOUNT_ID 
                    INTO V_JOURNAL_REC.ACCOUNT_ID 
                    FROM SETUP_SAFE 
                    WHERE SAFE_ID = INV.SAFE_ID;
                    V_INDEX := V_INDEX+1;
                    V_JOURNAL_TABLE.EXTEND;
                    V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
                ELSE
                    V_JOURNAL_REC.CREDIT := INV.PAID_BANK_AMOUNT;
                    V_JOURNAL_REC.DEBIT := 0;
                    SELECT ACCOUNT_ID 
                    INTO V_JOURNAL_REC.ACCOUNT_ID 
                    FROM SETUP_BANK_EXT_ACC
                    WHERE BANK_ACC_ID = INV.BANK_ACC_ID;
                    V_INDEX := V_INDEX+1;
                    V_JOURNAL_TABLE.EXTEND;
                    V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
                    IF INV.PAID_CASH_AMOUNT > 0 THEN
                        V_JOURNAL_REC.CREDIT := INV.PAID_CASH_AMOUNT;
                        V_JOURNAL_REC.DEBIT := 0;
                        SELECT ACCOUNT_ID 
                        INTO V_JOURNAL_REC.ACCOUNT_ID 
                        FROM SETUP_SAFE 
                        WHERE SAFE_ID = INV.SAFE_ID;
                        V_INDEX := V_INDEX+1;
                        V_JOURNAL_TABLE.EXTEND;
                        V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;                    
                    END IF;
                END IF;
            ELSE
                IF NVL(INV.DEFERRED_AMOUNT,0) > 0  THEN
                    V_JOURNAL_REC.CREDIT := INV.DEFERRED_AMOUNT;
                    V_JOURNAL_REC.DEBIT := 0;
                    SELECT ACCOUNT_ID 
                    INTO V_JOURNAL_REC.ACCOUNT_ID 
                    FROM SALES_PROVIDER 
                    WHERE PROVIDER_ID = INV.PROVIDER_ID;
                    V_INDEX := V_INDEX+1;
                    V_JOURNAL_TABLE.EXTEND;
                    V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
                END IF;
                IF INV.INVOICE_TOTAL_AMOUNT - NVL(INV.DEFERRED_AMOUNT,0) > 0  THEN
                    IF INV.PAYMENT_TYPE = 1 THEN
                        V_JOURNAL_REC.CREDIT := INV.INVOICE_TOTAL_AMOUNT - NVL(INV.DEFERRED_AMOUNT,0);
                        V_JOURNAL_REC.DEBIT := 0;
                        SELECT ACCOUNT_ID 
                        INTO V_JOURNAL_REC.ACCOUNT_ID 
                        FROM SETUP_SAFE 
                        WHERE SAFE_ID = INV.SAFE_ID;
                        V_INDEX := V_INDEX+1;
                        V_JOURNAL_TABLE.EXTEND;
                        V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
                    ELSE
                        V_JOURNAL_REC.CREDIT := INV.PAID_BANK_AMOUNT;
                        V_JOURNAL_REC.DEBIT := 0;
                        SELECT ACCOUNT_ID 
                        INTO V_JOURNAL_REC.ACCOUNT_ID 
                        FROM SETUP_BANK_EXT_ACC
                        WHERE BANK_ACC_ID = INV.BANK_ACC_ID;
                        V_INDEX := V_INDEX+1;
                        V_JOURNAL_TABLE.EXTEND;
                        V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
                        IF INV.PAID_CASH_AMOUNT > 0 THEN
                            V_JOURNAL_REC.CREDIT := INV.PAID_CASH_AMOUNT;
                            V_JOURNAL_REC.DEBIT := 0;
                            SELECT ACCOUNT_ID 
                            INTO V_JOURNAL_REC.ACCOUNT_ID 
                            FROM SETUP_SAFE 
                            WHERE SAFE_ID = INV.SAFE_ID;
                            V_INDEX := V_INDEX+1;
                            V_JOURNAL_TABLE.EXTEND;
                            V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;                    
                        END IF;
                    END IF;
                END IF;
            END IF;
            IF INV.TOTAL_VAT > 0 THEN
                SELECT MAKE_NOTE.GET_JOURNAL_NOTE(
                    P_LANG_ID       => P_LANG_ID,
                    P_JOURNAL_TYPE  => 6,
                    P_INVOICE_TYPE  => INV.INVOICE_TYPE,
                    P_REF_NO        => INV.INVOICE_NO,
                    P_FOR_VAT       => 1,
                    P_CLIENT        => V_CLIENT
                ) INTO V_NOTE FROM DUAL;
                V_JOURNAL_REC.NOTE := V_NOTE;
                V_JOURNAL_REC.DEBIT := INV.TOTAL_VAT;
                V_JOURNAL_REC.CREDIT := 0;
                SELECT PARAM_VALUE
                INTO V_JOURNAL_REC.ACCOUNT_ID 
                FROM SETUP_PARAMS
                WHERE PARAM_ID = 2;
                V_INDEX := V_INDEX+1;
                V_JOURNAL_TABLE.EXTEND;
                V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;                    
            END IF;
            V_JOURNAL_REC.DEBIT := INV.PRE_TAX_TOTAL_AMOUNT;
            V_JOURNAL_REC.CREDIT := 0;
            SELECT PARAM_VALUE
            INTO V_JOURNAL_REC.ACCOUNT_ID 
            FROM SETUP_PARAMS
            WHERE PARAM_ID = 1;
            V_INDEX := V_INDEX+1;
            V_JOURNAL_TABLE.EXTEND;
            V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
            BEGIN
                 ACC_JOURNAL_TAPI.MAKE_JOURNAL(
                    P_JOURNAL_TABLE     => V_JOURNAL_TABLE,
                    P_COMPANY_ID        => INV.COMPANY_ID,
                    P_JOURNAL_DATE      => INV.INVOICE_DATE,
                    P_JOURNAL_NOTE      => V_NOTE,
                    P_JOURNAL_TYPE      => 6,
                    P_ACC_JOURNAL_ID    => V_ACC_JOURNAL_ID
                );  
            END;
            UPDATE SALES_PURCHASE_INV
            SET ACC_JOURNAL_ID = V_ACC_JOURNAL_ID
            WHERE INVOICE_ID = P_INVOICE_ID;
        END LOOP;
    END PUR_INV_JOURNAL;
    
    PROCEDURE PUR_RETURN_INV_JOURNAL (
        P_INVOICE_ID      IN  NUMBER
    ) AS
        V_JOURNAL_TABLE JOURNAL_TABLE;
        V_JOURNAL_REC JOURNAL_REC;
        V_INDEX NUMBER := 0;
        V_ACC_JOURNAL_ID NUMBER;
        V_NOTE              VARCHAR2(4000);
        V_CLIENT            VARCHAR2(4000);
        P_LANG_ID           NUMBER;
    BEGIN
        V_JOURNAL_TABLE := JOURNAL_TABLE();
        FOR INV IN (
            SELECT
                INVOICE_DATE,
                INVOICE_TYPE,
                PAYMENT_TYPE,
                SAFE_ID,
                BANK_ACC_ID,
                COST_CTR_ID,
                PROVIDER_ID,
                TOTAL_VAT,
                INVOICE_TOTAL_AMOUNT,
                PAID_CASH_AMOUNT,
                PAID_BANK_AMOUNT,
                NOTES,
                COMPANY_ID,
                DEFERRED_AMOUNT,
                PAID_AMOUNT,
                PRE_TAX_TOTAL_AMOUNT,
                INVOICE_NO,
                USER_ID
            FROM
                SALES_PUR_RETURN_INV
            WHERE
                ACC_JOURNAL_ID IS NULL AND
                INVOICE_ID = P_INVOICE_ID
        ) LOOP
            SELECT PREFERED_LANG_ID
            INTO P_LANG_ID
            FROM SETUP_APP_USER
            WHERE USER_ID = INV.USER_ID;
            SELECT DECODE(P_LANG_ID,1,NAME_EN,NAME_AR)
            INTO V_CLIENT
            FROM SALES_PROVIDER
            WHERE PROVIDER_ID = INV.PROVIDER_ID;
            SELECT MAKE_NOTE.GET_JOURNAL_NOTE(
                P_LANG_ID       => P_LANG_ID,
                P_JOURNAL_TYPE  => 7,
                P_INVOICE_TYPE  => INV.INVOICE_TYPE,
                P_REF_NO        => INV.INVOICE_NO,
                P_CLIENT        => V_CLIENT
            ) INTO V_NOTE FROM DUAL;
            V_JOURNAL_REC := JOURNAL_REC(
                DEBIT         => 0,
                CREDIT        => 0,
                ACCOUNT_ID    => 0,
                NOTE          => V_NOTE,
                COST_CNTR_ID  => INV.COST_CTR_ID,
                REF_NO        => NULL
            );
            IF INV.INVOICE_TYPE = 1 THEN
                IF INV.PAYMENT_TYPE = 1 THEN
                    V_JOURNAL_REC.CREDIT := 0;
                    V_JOURNAL_REC.DEBIT := INV.INVOICE_TOTAL_AMOUNT;
                    SELECT ACCOUNT_ID 
                    INTO V_JOURNAL_REC.ACCOUNT_ID 
                    FROM SETUP_SAFE 
                    WHERE SAFE_ID = INV.SAFE_ID;
                    V_INDEX := V_INDEX+1;
                    V_JOURNAL_TABLE.EXTEND;
                    V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
                ELSE
                    V_JOURNAL_REC.CREDIT := 0;
                    V_JOURNAL_REC.DEBIT := INV.PAID_BANK_AMOUNT;
                    SELECT ACCOUNT_ID 
                    INTO V_JOURNAL_REC.ACCOUNT_ID 
                    FROM SETUP_BANK_EXT_ACC
                    WHERE BANK_ACC_ID = INV.BANK_ACC_ID;
                    V_INDEX := V_INDEX+1;
                    V_JOURNAL_TABLE.EXTEND;
                    V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
                    IF INV.PAID_CASH_AMOUNT > 0 THEN
                        V_JOURNAL_REC.CREDIT := 0;
                        V_JOURNAL_REC.DEBIT := INV.PAID_CASH_AMOUNT;
                        SELECT ACCOUNT_ID 
                        INTO V_JOURNAL_REC.ACCOUNT_ID 
                        FROM SETUP_SAFE 
                        WHERE SAFE_ID = INV.SAFE_ID;
                        V_INDEX := V_INDEX+1;
                        V_JOURNAL_TABLE.EXTEND;
                        V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;                    
                    END IF;
                END IF;
            ELSE
                IF NVL(INV.DEFERRED_AMOUNT,0) > 0  THEN
                    V_JOURNAL_REC.CREDIT := 0;
                    V_JOURNAL_REC.DEBIT := INV.DEFERRED_AMOUNT;
                    SELECT ACCOUNT_ID 
                    INTO V_JOURNAL_REC.ACCOUNT_ID 
                    FROM SALES_PROVIDER 
                    WHERE PROVIDER_ID = INV.PROVIDER_ID;
                    V_INDEX := V_INDEX+1;
                    V_JOURNAL_TABLE.EXTEND;
                    V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
                END IF;
                IF INV.INVOICE_TOTAL_AMOUNT - NVL(INV.DEFERRED_AMOUNT,0) > 0  THEN
                    IF INV.PAYMENT_TYPE = 1 THEN
                        V_JOURNAL_REC.CREDIT := 0;
                        V_JOURNAL_REC.DEBIT := INV.INVOICE_TOTAL_AMOUNT - NVL(INV.DEFERRED_AMOUNT,0);
                        SELECT ACCOUNT_ID 
                        INTO V_JOURNAL_REC.ACCOUNT_ID 
                        FROM SETUP_SAFE 
                        WHERE SAFE_ID = INV.SAFE_ID;
                        V_INDEX := V_INDEX+1;
                        V_JOURNAL_TABLE.EXTEND;
                        V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
                    ELSE
                        V_JOURNAL_REC.CREDIT := 0;
                        V_JOURNAL_REC.DEBIT := INV.PAID_BANK_AMOUNT;
                        SELECT ACCOUNT_ID 
                        INTO V_JOURNAL_REC.ACCOUNT_ID 
                        FROM SETUP_BANK_EXT_ACC
                        WHERE BANK_ACC_ID = INV.BANK_ACC_ID;
                        V_INDEX := V_INDEX+1;
                        V_JOURNAL_TABLE.EXTEND;
                        V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
                        IF INV.PAID_CASH_AMOUNT > 0 THEN
                            V_JOURNAL_REC.CREDIT := 0;
                            V_JOURNAL_REC.DEBIT := INV.PAID_CASH_AMOUNT;
                            SELECT ACCOUNT_ID 
                            INTO V_JOURNAL_REC.ACCOUNT_ID 
                            FROM SETUP_SAFE 
                            WHERE SAFE_ID = INV.SAFE_ID;
                            V_INDEX := V_INDEX+1;
                            V_JOURNAL_TABLE.EXTEND;
                            V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;                    
                        END IF;
                    END IF;
                END IF;
            END IF;
            IF INV.TOTAL_VAT > 0 THEN
                SELECT MAKE_NOTE.GET_JOURNAL_NOTE(
                    P_LANG_ID       => P_LANG_ID,
                    P_JOURNAL_TYPE  => 7,
                    P_INVOICE_TYPE  => INV.INVOICE_TYPE,
                    P_REF_NO        => INV.INVOICE_NO,
                    P_FOR_VAT       => 1,
                    P_CLIENT        => V_CLIENT
                ) INTO V_NOTE FROM DUAL;
                V_JOURNAL_REC.NOTE := V_NOTE;
                V_JOURNAL_REC.DEBIT := 0;
                V_JOURNAL_REC.CREDIT := INV.TOTAL_VAT;
                SELECT PARAM_VALUE
                INTO V_JOURNAL_REC.ACCOUNT_ID 
                FROM SETUP_PARAMS
                WHERE PARAM_ID = 2;
                V_INDEX := V_INDEX+1;
                V_JOURNAL_TABLE.EXTEND;
                V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;                    
            END IF;
            V_JOURNAL_REC.DEBIT := 0;
            V_JOURNAL_REC.CREDIT := INV.PRE_TAX_TOTAL_AMOUNT;
            SELECT PARAM_VALUE
            INTO V_JOURNAL_REC.ACCOUNT_ID 
            FROM SETUP_PARAMS
            WHERE PARAM_ID = 1;
            V_INDEX := V_INDEX+1;
            V_JOURNAL_TABLE.EXTEND;
            V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
            BEGIN
                 ACC_JOURNAL_TAPI.MAKE_JOURNAL(
                    P_JOURNAL_TABLE     => V_JOURNAL_TABLE,
                    P_COMPANY_ID        => INV.COMPANY_ID,
                    P_JOURNAL_DATE      => INV.INVOICE_DATE,
                    P_JOURNAL_NOTE      => V_NOTE,
                    P_JOURNAL_TYPE      => 7,
                    P_ACC_JOURNAL_ID    => V_ACC_JOURNAL_ID
                );  
            END;
            UPDATE SALES_PUR_RETURN_INV
            SET ACC_JOURNAL_ID = V_ACC_JOURNAL_ID
            WHERE INVOICE_ID = P_INVOICE_ID;
        END LOOP;
    END PUR_RETURN_INV_JOURNAL;
    PROCEDURE FIRST_PERIOD_STOCK_INV_JOURNAL (
        P_INVOICE_ID IN NUMBER
    ) AS
    BEGIN
        NULL;
    END FIRST_PERIOD_STOCK_INV_JOURNAL;
    PROCEDURE STOCKOUT_ORDER_JOURNAL (
        P_ORDER_ID IN NUMBER
    ) AS
        V_JOURNAL_TABLE JOURNAL_TABLE;
        V_JOURNAL_REC JOURNAL_REC;
        V_INDEX NUMBER := 0;
        V_ACC_JOURNAL_ID NUMBER;
        V_NOTE              VARCHAR2(4000);
        V_CLIENT            VARCHAR2(4000);
        P_LANG_ID           NUMBER;
    BEGIN
        V_JOURNAL_TABLE := JOURNAL_TABLE();
        FOR INV IN (
            SELECT
                ORDER_DATE,
                ACCOUNT_ID,
                COST_CTR_ID,
                TOTAL_AMOUNT,
                NOTES,
                COMPANY_ID,
                ORDER_NO,
                USER_ID
            FROM
                STORE_STOCKOUT_ORDER
            WHERE
                ACC_JOURNAL_ID IS NULL AND
                NVL(ACCOUNTABLE,0) =1 AND
                ORDER_ID = P_ORDER_ID
        ) LOOP
            SELECT PREFERED_LANG_ID
            INTO P_LANG_ID
            FROM SETUP_APP_USER
            WHERE USER_ID = INV.USER_ID;
            
            SELECT MAKE_NOTE.GET_STOCK_JOURNAL_NOTE(
                P_LANG_ID       => P_LANG_ID,
                P_JOURNAL_TYPE  => 10,
                P_REF_NO        => INV.ORDER_NO
            ) INTO V_NOTE FROM DUAL;
            V_JOURNAL_REC := JOURNAL_REC(
                DEBIT         => 0,
                CREDIT        => 0,
                ACCOUNT_ID    => 0,
                NOTE          => V_NOTE,
                COST_CNTR_ID  => INV.COST_CTR_ID,
                REF_NO        => NULL
            );
            V_JOURNAL_REC.DEBIT := 0;
            V_JOURNAL_REC.CREDIT := INV.TOTAL_AMOUNT;
            SELECT PARAM_VALUE
            INTO V_JOURNAL_REC.ACCOUNT_ID 
            FROM SETUP_PARAMS
            WHERE PARAM_ID = 3;
            V_INDEX := V_INDEX+1;
            V_JOURNAL_TABLE.EXTEND;
            V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
            
            
            V_JOURNAL_REC.DEBIT := INV.TOTAL_AMOUNT;
            V_JOURNAL_REC.CREDIT := 0;
            V_JOURNAL_REC.ACCOUNT_ID := INV.ACCOUNT_ID;
            V_INDEX := V_INDEX+1;
            V_JOURNAL_TABLE.EXTEND;
            V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
            BEGIN
                 ACC_JOURNAL_TAPI.MAKE_JOURNAL(
                    P_JOURNAL_TABLE     => V_JOURNAL_TABLE,
                    P_COMPANY_ID        => INV.COMPANY_ID,
                    P_JOURNAL_DATE      => INV.ORDER_DATE,
                    P_JOURNAL_NOTE      => V_NOTE,
                    P_JOURNAL_TYPE      => 10,
                    P_ACC_JOURNAL_ID    => V_ACC_JOURNAL_ID
                );  
            END;
            UPDATE STORE_STOCKOUT_ORDER
            SET ACC_JOURNAL_ID = V_ACC_JOURNAL_ID
            WHERE ORDER_ID = P_ORDER_ID;
        END LOOP;
    END STOCKOUT_ORDER_JOURNAL;
    PROCEDURE STOCKIN_ORDER_JOURNAL (
        P_ORDER_ID IN NUMBER
    ) AS
        V_JOURNAL_TABLE JOURNAL_TABLE;
        V_JOURNAL_REC JOURNAL_REC;
        V_INDEX NUMBER := 0;
        V_ACC_JOURNAL_ID NUMBER;
        V_NOTE              VARCHAR2(4000);
        V_CLIENT            VARCHAR2(4000);
        P_LANG_ID           NUMBER;
    BEGIN
        V_JOURNAL_TABLE := JOURNAL_TABLE();
        FOR INV IN (
            SELECT
                ORDER_DATE,
                ACCOUNT_ID,
                COST_CTR_ID,
                TOTAL_AMOUNT,
                NOTES,
                COMPANY_ID,
                ORDER_NO,
                USER_ID
            FROM
                STORE_STOCKIN_ORDER
            WHERE
                ACC_JOURNAL_ID IS NULL AND
                NVL(ACCOUNTABLE,0) =1 AND
                ORDER_ID = P_ORDER_ID
        ) LOOP
            SELECT PREFERED_LANG_ID
            INTO P_LANG_ID
            FROM SETUP_APP_USER
            WHERE USER_ID = INV.USER_ID;
            
            SELECT MAKE_NOTE.GET_STOCK_JOURNAL_NOTE(
                P_LANG_ID       => P_LANG_ID,
                P_JOURNAL_TYPE  => 12,
                P_REF_NO        => INV.ORDER_NO
            ) INTO V_NOTE FROM DUAL;
            V_JOURNAL_REC := JOURNAL_REC(
                DEBIT         => 0,
                CREDIT        => 0,
                ACCOUNT_ID    => 0,
                NOTE          => V_NOTE,
                COST_CNTR_ID  => INV.COST_CTR_ID,
                REF_NO        => NULL
            );
            V_JOURNAL_REC.DEBIT := INV.TOTAL_AMOUNT;
            V_JOURNAL_REC.CREDIT := 0;
            SELECT PARAM_VALUE
            INTO V_JOURNAL_REC.ACCOUNT_ID 
            FROM SETUP_PARAMS
            WHERE PARAM_ID = 3;
            V_INDEX := V_INDEX+1;
            V_JOURNAL_TABLE.EXTEND;
            V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
            
            
            V_JOURNAL_REC.DEBIT := 0;
            V_JOURNAL_REC.CREDIT := INV.TOTAL_AMOUNT;
            V_JOURNAL_REC.ACCOUNT_ID := INV.ACCOUNT_ID;
            V_INDEX := V_INDEX+1;
            V_JOURNAL_TABLE.EXTEND;
            V_JOURNAL_TABLE(V_INDEX) := V_JOURNAL_REC;
            BEGIN
                 ACC_JOURNAL_TAPI.MAKE_JOURNAL(
                    P_JOURNAL_TABLE     => V_JOURNAL_TABLE,
                    P_COMPANY_ID        => INV.COMPANY_ID,
                    P_JOURNAL_DATE      => INV.ORDER_DATE,
                    P_JOURNAL_NOTE      => V_NOTE,
                    P_JOURNAL_TYPE      => 12,
                    P_ACC_JOURNAL_ID    => V_ACC_JOURNAL_ID
                );  
            END;
            UPDATE STORE_STOCKIN_ORDER
            SET ACC_JOURNAL_ID = V_ACC_JOURNAL_ID
            WHERE ORDER_ID = P_ORDER_ID;
        END LOOP;
    END STOCKIN_ORDER_JOURNAL;

END INV_JOURNAL;

/
--------------------------------------------------------
--  DDL for Package Body MAKE_ID
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "MAKE_ID" AS

    FUNCTION GET_PURCHASE_INV_ID (
        P_COMPANY_ID NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER AS
        V_INV_ID NUMBER;
    BEGIN
        SELECT NVL(MAX(INVOICE_ID),0)
        INTO V_INV_ID
        FROM SALES_PURCHASE_INV
        WHERE COMPANY_ID = P_COMPANY_ID AND BRANCH_ID = P_BRANCH_ID;
        SELECT NVL(SUBSTR(V_INV_ID,LENGTH(P_COMPANY_ID||P_BRANCH_ID)+1),0)+1
        INTO V_INV_ID
        FROM DUAL;
        V_INV_ID := P_COMPANY_ID||P_BRANCH_ID||V_INV_ID;
        RETURN V_INV_ID;
    END GET_PURCHASE_INV_ID;    

    FUNCTION GET_RENT_INV_ID (
        P_COMPANY_ID NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER AS
        V_INV_ID NUMBER;
    BEGIN
        SELECT NVL(MAX(INVOICE_ID),0)
        INTO V_INV_ID
        FROM SALES_RENT_INV
        WHERE COMPANY_ID = P_COMPANY_ID AND BRANCH_ID = P_BRANCH_ID;
        SELECT NVL(SUBSTR(V_INV_ID,LENGTH(P_COMPANY_ID||P_BRANCH_ID)+1),0)+1
        INTO V_INV_ID
        FROM DUAL;
        V_INV_ID := P_COMPANY_ID||P_BRANCH_ID||V_INV_ID;
        RETURN V_INV_ID;
    END GET_RENT_INV_ID;

    FUNCTION GET_PUR_RETURN_INV_ID (
        P_COMPANY_ID NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER AS
        V_INV_ID NUMBER;
    BEGIN
        SELECT NVL(MAX(INVOICE_ID),0)
        INTO V_INV_ID
        FROM SALES_PUR_RETURN_INV
        WHERE COMPANY_ID = P_COMPANY_ID AND BRANCH_ID = P_BRANCH_ID;
        SELECT NVL(SUBSTR(V_INV_ID,LENGTH(P_COMPANY_ID||P_BRANCH_ID)+1),0)+1
        INTO V_INV_ID
        FROM DUAL;
        V_INV_ID := P_COMPANY_ID||P_BRANCH_ID||V_INV_ID;
        RETURN V_INV_ID;
    END GET_PUR_RETURN_INV_ID;

    FUNCTION GET_SALES_INV_ID (
        P_COMPANY_ID NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER AS
        V_INV_ID NUMBER;
    BEGIN
        SELECT NVL(MAX(INVOICE_ID),0)
        INTO V_INV_ID
        FROM SALES_INV
        WHERE COMPANY_ID = P_COMPANY_ID AND BRANCH_ID = P_BRANCH_ID;
        SELECT NVL(SUBSTR(V_INV_ID,LENGTH(P_COMPANY_ID||P_BRANCH_ID)+1),0)+1
        INTO V_INV_ID
        FROM DUAL;
        V_INV_ID := P_COMPANY_ID||P_BRANCH_ID||V_INV_ID;
        RETURN V_INV_ID;
    END GET_SALES_INV_ID;

    FUNCTION GET_SALES_RETURN_INV_ID (
        P_COMPANY_ID NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER AS
        V_INV_ID NUMBER;
    BEGIN
        SELECT NVL(MAX(INVOICE_ID),0)
        INTO V_INV_ID
        FROM SALES_RETURN_INV
        WHERE COMPANY_ID = P_COMPANY_ID AND BRANCH_ID = P_BRANCH_ID;
        SELECT NVL(SUBSTR(V_INV_ID,LENGTH(P_COMPANY_ID||P_BRANCH_ID)+1),0)+1
        INTO V_INV_ID
        FROM DUAL;
        V_INV_ID := P_COMPANY_ID||P_BRANCH_ID||V_INV_ID;
        RETURN V_INV_ID;
    END GET_SALES_RETURN_INV_ID;

    FUNCTION GET_FIRST_PERIOD_STOCK_INV_ID (
        P_COMPANY_ID NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER AS
        V_INV_ID NUMBER;
    BEGIN
        SELECT NVL(MAX(INVOICE_ID),0)
        INTO V_INV_ID
        FROM STORE_FIRST_PERIOD_STOCK
        WHERE COMPANY_ID = P_COMPANY_ID AND BRANCH_ID = P_BRANCH_ID;
        SELECT NVL(SUBSTR(V_INV_ID,LENGTH(P_COMPANY_ID||P_BRANCH_ID)+1),0)+1
        INTO V_INV_ID
        FROM DUAL;
        V_INV_ID := P_COMPANY_ID||P_BRANCH_ID||V_INV_ID;
        RETURN V_INV_ID;
    END GET_FIRST_PERIOD_STOCK_INV_ID;

    FUNCTION GET_PURCHASE_ORDER_ID (
        P_COMPANY_ID NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER AS
        V_ORDER_ID NUMBER;
    BEGIN
        SELECT NVL(MAX(ORDER_ID),0)
        INTO V_ORDER_ID
        FROM SALES_PURCHASE_ORDER
        WHERE COMPANY_ID = P_COMPANY_ID AND BRANCH_ID = P_BRANCH_ID;
        SELECT NVL(SUBSTR(V_ORDER_ID,LENGTH(P_COMPANY_ID||P_BRANCH_ID)+1),0)+1
        INTO V_ORDER_ID
        FROM DUAL;
        V_ORDER_ID := P_COMPANY_ID||P_BRANCH_ID||V_ORDER_ID;
        RETURN V_ORDER_ID;
    END GET_PURCHASE_ORDER_ID;

    FUNCTION GET_STOCKIN_ORDER_ID (
        P_COMPANY_ID NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER AS
        V_ORDER_ID NUMBER;
    BEGIN
        SELECT NVL(MAX(ORDER_ID),0)
        INTO V_ORDER_ID
        FROM STORE_STOCKIN_ORDER
        WHERE COMPANY_ID = P_COMPANY_ID AND BRANCH_ID = P_BRANCH_ID;
        SELECT NVL(SUBSTR(V_ORDER_ID,LENGTH(P_COMPANY_ID||P_BRANCH_ID)+1),0)+1
        INTO V_ORDER_ID
        FROM DUAL;
        V_ORDER_ID := P_COMPANY_ID||P_BRANCH_ID||V_ORDER_ID;
        RETURN V_ORDER_ID;
    END GET_STOCKIN_ORDER_ID;

    FUNCTION GET_STOCKOUT_ORDER_ID (
        P_COMPANY_ID NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER AS
        V_ORDER_ID NUMBER;
    BEGIN
        SELECT NVL(MAX(ORDER_ID),0)
        INTO V_ORDER_ID
        FROM STORE_STOCKOUT_ORDER
        WHERE COMPANY_ID = P_COMPANY_ID AND BRANCH_ID = P_BRANCH_ID;
        SELECT NVL(SUBSTR(V_ORDER_ID,LENGTH(P_COMPANY_ID||P_BRANCH_ID)+1),0)+1
        INTO V_ORDER_ID
        FROM DUAL;
        V_ORDER_ID := P_COMPANY_ID||P_BRANCH_ID||V_ORDER_ID;
        RETURN V_ORDER_ID;
    END GET_STOCKOUT_ORDER_ID;

    FUNCTION GET_STORE_TRANSFER_ID (
        P_COMPANY_ID NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER AS
        V_TRANSFER_ID NUMBER;
    BEGIN
        SELECT NVL(MAX(TRANSFER_ID),0)
        INTO V_TRANSFER_ID
        FROM STORE_TRANSFER
        WHERE COMPANY_ID = P_COMPANY_ID AND BRANCH_ID = P_BRANCH_ID;
        SELECT NVL(SUBSTR(V_TRANSFER_ID,LENGTH(P_COMPANY_ID||P_BRANCH_ID)+1),0)+1
        INTO V_TRANSFER_ID
        FROM DUAL;
        V_TRANSFER_ID := P_COMPANY_ID||P_BRANCH_ID||V_TRANSFER_ID;
        RETURN V_TRANSFER_ID;
    END GET_STORE_TRANSFER_ID;
END MAKE_ID;

/
--------------------------------------------------------
--  DDL for Package Body MAKE_NO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "MAKE_NO" AS

    FUNCTION GET_PURCHASE_INV_NO (
        P_COMPANY_ID NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER AS
        V_INV_NO NUMBER;
    BEGIN
        SELECT NVL(MAX(INVOICE_NO),0)
        INTO V_INV_NO
        FROM SALES_PURCHASE_INV
        WHERE COMPANY_ID = P_COMPANY_ID AND BRANCH_ID = P_BRANCH_ID;
        SELECT NVL(SUBSTR(V_INV_NO,LENGTH(P_COMPANY_ID||P_BRANCH_ID)+1),0)+1
        INTO V_INV_NO
        FROM DUAL;
        V_INV_NO := P_COMPANY_ID||P_BRANCH_ID||V_INV_NO;
        RETURN V_INV_NO;
    END GET_PURCHASE_INV_NO;    
    
    FUNCTION GET_RENT_INV_NO (
        P_COMPANY_ID NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER AS
        V_INV_NO NUMBER;
    BEGIN
        SELECT NVL(MAX(INVOICE_NO),0)
        INTO V_INV_NO
        FROM SALES_RENT_INV
        WHERE COMPANY_ID = P_COMPANY_ID AND BRANCH_ID = P_BRANCH_ID;
        SELECT NVL(SUBSTR(V_INV_NO,LENGTH(P_COMPANY_ID||P_BRANCH_ID)+1),0)+1
        INTO V_INV_NO
        FROM DUAL;
        V_INV_NO := P_COMPANY_ID||P_BRANCH_ID||V_INV_NO;
        RETURN V_INV_NO;
    END GET_RENT_INV_NO;

    FUNCTION GET_PUR_RETURN_INV_NO (
        P_COMPANY_ID NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER AS
        V_INV_NO NUMBER;
    BEGIN
        SELECT NVL(MAX(INVOICE_NO),0)
        INTO V_INV_NO
        FROM SALES_PUR_RETURN_INV
        WHERE COMPANY_ID = P_COMPANY_ID AND BRANCH_ID = P_BRANCH_ID;
        SELECT NVL(SUBSTR(V_INV_NO,LENGTH(P_COMPANY_ID||P_BRANCH_ID)+1),0)+1
        INTO V_INV_NO
        FROM DUAL;
        V_INV_NO := P_COMPANY_ID||P_BRANCH_ID||V_INV_NO;
        RETURN V_INV_NO;
    END GET_PUR_RETURN_INV_NO;

    FUNCTION GET_SALES_INV_NO (
        P_COMPANY_ID NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER AS
        V_INV_NO NUMBER;
    BEGIN
        SELECT NVL(MAX(INVOICE_NO),0)
        INTO V_INV_NO
        FROM SALES_INV
        WHERE COMPANY_ID = P_COMPANY_ID AND BRANCH_ID = P_BRANCH_ID;
        SELECT NVL(SUBSTR(V_INV_NO,LENGTH(P_COMPANY_ID||P_BRANCH_ID)+1),0)+1
        INTO V_INV_NO
        FROM DUAL;
        V_INV_NO := P_COMPANY_ID||P_BRANCH_ID||V_INV_NO;
        RETURN V_INV_NO;
    END GET_SALES_INV_NO;

    FUNCTION GET_SALES_RETURN_INV_NO (
        P_COMPANY_ID NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER AS
        V_INV_NO NUMBER;
    BEGIN
        SELECT NVL(MAX(INVOICE_NO),0)
        INTO V_INV_NO
        FROM SALES_RETURN_INV
        WHERE COMPANY_ID = P_COMPANY_ID AND BRANCH_ID = P_BRANCH_ID;
        SELECT NVL(SUBSTR(V_INV_NO,LENGTH(P_COMPANY_ID||P_BRANCH_ID)+1),0)+1
        INTO V_INV_NO
        FROM DUAL;
        V_INV_NO := P_COMPANY_ID||P_BRANCH_ID||V_INV_NO;
        RETURN V_INV_NO;
    END GET_SALES_RETURN_INV_NO;

    FUNCTION GET_FIRST_PERIOD_STOCK_INV_NO (
        P_COMPANY_ID NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER AS
        V_INV_NO NUMBER;
    BEGIN
        SELECT NVL(MAX(INVOICE_NO),0)
        INTO V_INV_NO
        FROM STORE_FIRST_PERIOD_STOCK
        WHERE COMPANY_ID = P_COMPANY_ID AND BRANCH_ID = P_BRANCH_ID;
        SELECT NVL(SUBSTR(V_INV_NO,LENGTH(P_COMPANY_ID||P_BRANCH_ID)+1),0)+1
        INTO V_INV_NO
        FROM DUAL;
        V_INV_NO := P_COMPANY_ID||P_BRANCH_ID||V_INV_NO;
        RETURN V_INV_NO;
    END GET_FIRST_PERIOD_STOCK_INV_NO;

    FUNCTION GET_PURCHASE_ORDER_NO (
        P_COMPANY_ID NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER AS
        V_ORDER_NO NUMBER;
    BEGIN
        SELECT NVL(MAX(ORDER_NO),0)
        INTO V_ORDER_NO
        FROM SALES_PURCHASE_ORDER
        WHERE COMPANY_ID = P_COMPANY_ID AND BRANCH_ID = P_BRANCH_ID;
        SELECT NVL(SUBSTR(V_ORDER_NO,LENGTH(P_COMPANY_ID||P_BRANCH_ID)+1),0)+1
        INTO V_ORDER_NO
        FROM DUAL;
        V_ORDER_NO := P_COMPANY_ID||P_BRANCH_ID||V_ORDER_NO;
        RETURN V_ORDER_NO;
    END GET_PURCHASE_ORDER_NO;

    FUNCTION GET_STOCKIN_ORDER_NO (
        P_COMPANY_ID NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER AS
        V_ORDER_NO NUMBER;
    BEGIN
        SELECT NVL(MAX(ORDER_NO),0)
        INTO V_ORDER_NO
        FROM STORE_STOCKIN_ORDER
        WHERE COMPANY_ID = P_COMPANY_ID AND BRANCH_ID = P_BRANCH_ID;
        SELECT NVL(SUBSTR(V_ORDER_NO,LENGTH(P_COMPANY_ID||P_BRANCH_ID)+1),0)+1
        INTO V_ORDER_NO
        FROM DUAL;
        V_ORDER_NO := P_COMPANY_ID||P_BRANCH_ID||V_ORDER_NO;
        RETURN V_ORDER_NO;
    END GET_STOCKIN_ORDER_NO;

    FUNCTION GET_STOCKOUT_ORDER_NO (
        P_COMPANY_ID NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER AS
        V_ORDER_NO NUMBER;
    BEGIN
        SELECT NVL(MAX(ORDER_NO),0)
        INTO V_ORDER_NO
        FROM STORE_STOCKOUT_ORDER
        WHERE COMPANY_ID = P_COMPANY_ID AND BRANCH_ID = P_BRANCH_ID;
        SELECT NVL(SUBSTR(V_ORDER_NO,LENGTH(P_COMPANY_ID||P_BRANCH_ID)+1),0)+1
        INTO V_ORDER_NO
        FROM DUAL;
        V_ORDER_NO := P_COMPANY_ID||P_BRANCH_ID||V_ORDER_NO;
        RETURN V_ORDER_NO;
    END GET_STOCKOUT_ORDER_NO;

    FUNCTION GET_STORE_TRANSFER_NO (
        P_COMPANY_ID NUMBER,
        P_BRANCH_ID   NUMBER
    ) RETURN NUMBER AS
        V_TRANSFER_NO NUMBER;
    BEGIN
        SELECT NVL(MAX(TRANSFER_NO),0)
        INTO V_TRANSFER_NO
        FROM STORE_TRANSFER
        WHERE COMPANY_ID = P_COMPANY_ID AND BRANCH_ID = P_BRANCH_ID;
        SELECT NVL(SUBSTR(V_TRANSFER_NO,LENGTH(P_COMPANY_ID||P_BRANCH_ID)+1),0)+1
        INTO V_TRANSFER_NO
        FROM DUAL;
        V_TRANSFER_NO := P_COMPANY_ID||P_BRANCH_ID||V_TRANSFER_NO;
        RETURN V_TRANSFER_NO;
    END GET_STORE_TRANSFER_NO;

END MAKE_NO;

/
--------------------------------------------------------
--  DDL for Package Body MAKE_NOTE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "MAKE_NOTE" AS

    FUNCTION GET_JOURNAL_NOTE (
        P_LANG_ID       NUMBER,
        P_JOURNAL_TYPE  NUMBER,
        P_INVOICE_TYPE  NUMBER,
        P_REF_NO        NUMBER,
        P_FOR_VAT       NUMBER DEFAULT 0,
        P_CLIENT        VARCHAR2
    ) RETURN VARCHAR2 AS
        V_JOURNAL_NOTE  VARCHAR2(2000);
        P_INV_TYPE_NOTE VARCHAR2(2000);
    BEGIN
        SELECT DECODE(P_LANG_ID,1,ITEM_NOTE_EN,ITEM_NOTE_AR) 
        INTO V_JOURNAL_NOTE
        FROM ADMIN_LIST_ITEM 
        WHERE LIST_ID = 7 AND ITEM_NO = P_JOURNAL_TYPE;
        
        SELECT DECODE(P_LANG_ID,1,ITEM_NOTE_EN,ITEM_NOTE_AR) 
        INTO P_INV_TYPE_NOTE
        FROM ADMIN_LIST_ITEM 
        WHERE LIST_ID = 5 AND ITEM_NO = P_INVOICE_TYPE;
        
        SELECT  
                DECODE(P_FOR_VAT,1,DECODE(P_LANG_ID,1,'VAT of ','ض. القيمة المضافة '),'')  
                || V_JOURNAL_NOTE || ' ' 
                || P_INV_TYPE_NOTE 
                || DECODE(P_LANG_ID,1,' of Id:',' رقم:')  
                || ' ' || P_REF_NO
                || DECODE(P_LANG_ID,1,' of client:',' العميل:')  
                || ' ' || P_CLIENT
        INTO V_JOURNAL_NOTE
        FROM DUAL;
        RETURN V_JOURNAL_NOTE;
    END GET_JOURNAL_NOTE;

    FUNCTION GET_STOCK_JOURNAL_NOTE (
        P_LANG_ID       NUMBER,
        P_JOURNAL_TYPE  NUMBER,
        P_REF_NO        NUMBER
    ) RETURN VARCHAR2 AS
        V_JOURNAL_NOTE  VARCHAR2(2000);
        P_INV_TYPE_NOTE VARCHAR2(2000);
    BEGIN
        SELECT DECODE(P_LANG_ID,1,ITEM_NOTE_EN,ITEM_NOTE_AR) 
        INTO V_JOURNAL_NOTE
        FROM ADMIN_LIST_ITEM 
        WHERE LIST_ID = 7 AND ITEM_NO = P_JOURNAL_TYPE;
        
        SELECT  
                V_JOURNAL_NOTE
                || DECODE(P_LANG_ID,1,' of Id:',' رقم:')  
                || ' ' || P_REF_NO
        INTO V_JOURNAL_NOTE
        FROM DUAL;
        RETURN V_JOURNAL_NOTE;
    END GET_STOCK_JOURNAL_NOTE;

END MAKE_NOTE;

/
--------------------------------------------------------
--  DDL for Package Body PWD_SECURITY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PWD_SECURITY" 
AS
  G_KEY  RAW(128) := NULL;


FUNCTION GET_KEY
     RETURN RAW
AS
BEGIN
  IF G_KEY IS NULL
  THEN
     SELECT H_KEY INTO G_KEY FROM ADMIN_PWD_HMAC_KEY;
  END IF;
  RETURN G_KEY;
END GET_KEY;


--توليد HASH لكلمة المرور
FUNCTION GET_PWD_HMAC(P_PWD_PLN NVARCHAR2)
      RETURN RAW
AS
     L_PWD_MAC   RAW(2000);
BEGIN
  L_PWD_MAC :=
         DBMS_CRYPTO.MAC(
            SRC    => UTL_I18N.STRING_TO_RAW(P_PWD_PLN,'AL32UTF8'),
            TYP    => DBMS_CRYPTO.HMAC_SH1,
            KEY    => GET_KEY);
   RETURN L_PWD_MAC;
END GET_PWD_HMAC;

--التحقق من سلامة كلمة المرور
FUNCTION VRFY_PWD_HMAC(P_PWD_PLN NVARCHAR2,P_PWD_HMAC  RAW)
   RETURN NUMBER
AS 
BEGIN
  IF UTL_RAW.COMPARE(GET_PWD_HMAC(P_PWD_PLN => P_PWD_PLN),P_PWD_HMAC)=
       0
  THEN
     RETURN 1;
  ELSE
     RETURN 0;
  END IF;
 END VRFY_PWD_HMAC;

END PWD_SECURITY;

/
--------------------------------------------------------
--  DDL for Package Body SALES_INV_DTL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SALES_INV_DTL_TAPI" IS

    PROCEDURE INSERT_SALES_INV_DTL (
        P_PRICE                      IN  SALES_INV_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY                   IN  SALES_INV_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_DISCOUNT_VALUE             IN  SALES_INV_DTL.DISCOUNT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_ID                 IN  SALES_INV_DTL.PRODUCT_ID%TYPE DEFAULT NULL,
        P_PRE_DISCOUNT_VAT_VALUE     IN  SALES_INV_DTL.PRE_DISCOUNT_VAT_VALUE%TYPE DEFAULT NULL,
        P_INVOICE_ID                 IN  SALES_INV_DTL.INVOICE_ID%TYPE DEFAULT NULL,
        P_VAT_PERCENTAGE             IN  SALES_INV_DTL.VAT_PERCENTAGE%TYPE DEFAULT NULL,
        P_TOTAL_PRICE                IN  SALES_INV_DTL.TOTAL_PRICE%TYPE DEFAULT NULL,
        P_VAT_VALUE                  IN  SALES_INV_DTL.VAT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID            IN  SALES_INV_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_DISCOUNT_PERCENTAGE        IN  SALES_INV_DTL.DISCOUNT_PERCENTAGE%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_PRICE  IN  SALES_INV_DTL.POST_DISCOUNT_TOTAL_PRICE%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT               IN  SALES_INV_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL
    ) IS
    BEGIN
        INSERT INTO SALES_INV_DTL (
            INVOICE_ID,
            PRICE,
            QUANTITY,
            DISCOUNT_VALUE,
            PRODUCT_ID,
            PRE_DISCOUNT_VAT_VALUE,
            VAT_PERCENTAGE,
            TOTAL_PRICE,
            VAT_VALUE,
            PRODUCT_UNIT_ID,
            DISCOUNT_PERCENTAGE,
            POST_DISCOUNT_TOTAL_PRICE,
            TOTAL_AMOUNT
        ) VALUES (
            P_INVOICE_ID,
            P_PRICE,
            P_QUANTITY,
            P_DISCOUNT_VALUE,
            P_PRODUCT_ID,
            P_PRE_DISCOUNT_VAT_VALUE,
            P_VAT_PERCENTAGE,
            P_TOTAL_PRICE,
            P_VAT_VALUE,
            P_PRODUCT_UNIT_ID,
            P_DISCOUNT_PERCENTAGE,
            P_POST_DISCOUNT_TOTAL_PRICE,
            P_TOTAL_AMOUNT
        );

    END INSERT_SALES_INV_DTL;
    PROCEDURE UPDATE_SALES_INV_DTL (
        P_INVOICE_DTL_ID             IN  SALES_INV_DTL.INVOICE_DTL_ID%TYPE,
        P_PRICE                      IN  SALES_INV_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY                   IN  SALES_INV_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_DISCOUNT_VALUE             IN  SALES_INV_DTL.DISCOUNT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_ID                 IN  SALES_INV_DTL.PRODUCT_ID%TYPE DEFAULT NULL,
        P_PRE_DISCOUNT_VAT_VALUE     IN  SALES_INV_DTL.PRE_DISCOUNT_VAT_VALUE%TYPE DEFAULT NULL,
        P_INVOICE_ID                 IN  SALES_INV_DTL.INVOICE_ID%TYPE DEFAULT NULL,
        P_VAT_PERCENTAGE             IN  SALES_INV_DTL.VAT_PERCENTAGE%TYPE DEFAULT NULL,
        P_TOTAL_PRICE                IN  SALES_INV_DTL.TOTAL_PRICE%TYPE DEFAULT NULL,
        P_VAT_VALUE                  IN  SALES_INV_DTL.VAT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID            IN  SALES_INV_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_DISCOUNT_PERCENTAGE        IN  SALES_INV_DTL.DISCOUNT_PERCENTAGE%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_PRICE  IN  SALES_INV_DTL.POST_DISCOUNT_TOTAL_PRICE%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT               IN  SALES_INV_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL
    ) IS
    BEGIN
        UPDATE SALES_INV_DTL
        SET
            PRICE = P_PRICE,
            QUANTITY = P_QUANTITY,
            DISCOUNT_VALUE = P_DISCOUNT_VALUE,
            PRODUCT_ID = P_PRODUCT_ID,
            PRE_DISCOUNT_VAT_VALUE = P_PRE_DISCOUNT_VAT_VALUE,
            INVOICE_ID = P_INVOICE_ID,
            VAT_PERCENTAGE = P_VAT_PERCENTAGE,
            TOTAL_PRICE = P_TOTAL_PRICE,
            VAT_VALUE = P_VAT_VALUE,
            PRODUCT_UNIT_ID = P_PRODUCT_UNIT_ID,
            DISCOUNT_PERCENTAGE = P_DISCOUNT_PERCENTAGE,
            POST_DISCOUNT_TOTAL_PRICE = P_POST_DISCOUNT_TOTAL_PRICE,
            TOTAL_AMOUNT = P_TOTAL_AMOUNT
        WHERE
            INVOICE_DTL_ID = P_INVOICE_DTL_ID;

    END UPDATE_SALES_INV_DTL;

    PROCEDURE DELETE_SALES_INV_DTL (
        P_INVOICE_DTL_ID IN SALES_INV_DTL.INVOICE_DTL_ID%TYPE
    ) IS
    BEGIN
        DELETE FROM SALES_INV_DTL
        WHERE
            INVOICE_DTL_ID = P_INVOICE_DTL_ID;

    END DELETE_SALES_INV_DTL;

    PROCEDURE DEL_DTL (
        P_INVOICE_ID  IN  SALES_INV_DTL.INVOICE_ID%TYPE DEFAULT NULL,
        P_ID_LIST     IN  JSON_ARRAY_T
    ) IS
        V_ID_TBL    ID_TBL := ID_TBL();
    BEGIN
        V_ID_TBL := ARRAY_TO_TABLE(P_JSON_ARRAY => P_ID_LIST, P_ID_INDEX => 'dtl_id');
        DELETE FROM SALES_INV_DTL 
        WHERE INVOICE_ID = P_INVOICE_ID AND  INVOICE_DTL_ID NOT IN (SELECT ID FROM TABLE(V_ID_TBL));

    END DEL_DTL;

END SALES_INV_DTL_TAPI;

/
--------------------------------------------------------
--  DDL for Package Body SALES_INV_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SALES_INV_TAPI" IS
-- insert
    PROCEDURE INSERT_SALES_INV (
        P_INVOICE_ID                 IN OUT SALES_INV.INVOICE_ID%TYPE,
        P_BRANCH_ID                   IN      SALES_INV.BRANCH_ID%TYPE DEFAULT NULL,
        P_BANK_ACC_ID                IN SALES_INV.BANK_ACC_ID%TYPE DEFAULT NULL,
        P_ACC_JOURNAL_ID             IN SALES_INV.ACC_JOURNAL_ID%TYPE DEFAULT NULL,
        P_PAID_AMOUNT                IN SALES_INV.PAID_AMOUNT%TYPE DEFAULT NULL,
        P_SAFE_ID                    IN SALES_INV.SAFE_ID%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_AMOUNT IN SALES_INV.POST_DISCOUNT_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_USER_ID                    IN SALES_INV.USER_ID%TYPE DEFAULT NULL,
        P_TOTAL_DISCOUNT             IN SALES_INV.TOTAL_DISCOUNT%TYPE DEFAULT NULL,
        P_INVOICE_DATE               IN SALES_INV.INVOICE_DATE%TYPE DEFAULT NULL,
        P_NOTES                      IN SALES_INV.NOTES%TYPE DEFAULT NULL,
        P_INVOICE_TOTAL_AMOUNT       IN SALES_INV.INVOICE_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_TYPE               IN SALES_INV.INVOICE_TYPE%TYPE DEFAULT NULL,
        P_CLIENT_ID                  IN SALES_INV.CLIENT_ID%TYPE DEFAULT NULL,
        P_TOTAL_QUANTITY             IN SALES_INV.TOTAL_QUANTITY%TYPE DEFAULT NULL,
        P_STORE_ID                   IN SALES_INV.STORE_ID%TYPE DEFAULT NULL,
        P_PRE_TAX_TOTAL_AMOUNT       IN SALES_INV.PRE_TAX_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COMPANY_ID                 IN SALES_INV.COMPANY_ID%TYPE,
        P_PAID_BANK_AMOUNT           IN SALES_INV.PAID_BANK_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CTR_ID                IN SALES_INV.COST_CTR_ID%TYPE DEFAULT NULL,
        P_CLIENT_DISCOUNT            IN SALES_INV.CLIENT_DISCOUNT%TYPE DEFAULT NULL,
        P_TOTAL_VAT                  IN SALES_INV.TOTAL_VAT%TYPE DEFAULT NULL,
        P_PAYMENT_TYPE               IN SALES_INV.PAYMENT_TYPE%TYPE DEFAULT NULL,
        P_DEFERRED_AMOUNT            IN SALES_INV.DEFERRED_AMOUNT%TYPE DEFAULT NULL,
        P_STORE_DATE                 IN SALES_INV.STORE_DATE%TYPE DEFAULT NULL,
        P_PAID_CASH_AMOUNT           IN SALES_INV.PAID_CASH_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_NO                 IN OUT SALES_INV.INVOICE_NO%TYPE
    ) IS
    V_INVOICE_NO      NUMBER;
    BEGIN
       P_INVOICE_NO :=MAKE_NO.GET_SALES_INV_NO(P_COMPANY_ID,P_BRANCH_ID => P_BRANCH_ID);
        P_INVOICE_ID := MAKE_ID.GET_SALES_INV_ID(P_COMPANY_ID => P_COMPANY_ID,P_BRANCH_ID => P_BRANCH_ID);
        INSERT INTO SALES_INV (
            BANK_ACC_ID,
            INVOICE_ID,
            ACC_JOURNAL_ID,
            PAID_AMOUNT,
            SAFE_ID,
            POST_DISCOUNT_TOTAL_AMOUNT,
            USER_ID,
            TOTAL_DISCOUNT,
            INVOICE_DATE,
            NOTES,
            INVOICE_TOTAL_AMOUNT,
            INVOICE_TYPE,
            CLIENT_ID,
            TOTAL_QUANTITY,
            STORE_ID,
            PRE_TAX_TOTAL_AMOUNT,
            COMPANY_ID,
            PAID_BANK_AMOUNT,
            COST_CTR_ID,
            CLIENT_DISCOUNT,
            TOTAL_VAT,
            PAYMENT_TYPE,
            DEFERRED_AMOUNT,
            STORE_DATE,
            PAID_CASH_AMOUNT,
            INVOICE_NO,
            BRANCH_ID
        ) VALUES (
            P_BANK_ACC_ID,
            P_INVOICE_ID,
            P_ACC_JOURNAL_ID,
            P_PAID_AMOUNT,
            P_SAFE_ID,
            P_POST_DISCOUNT_TOTAL_AMOUNT,
            P_USER_ID,
            P_TOTAL_DISCOUNT,
            P_INVOICE_DATE,
            P_NOTES,
            P_INVOICE_TOTAL_AMOUNT,
            P_INVOICE_TYPE,
            P_CLIENT_ID,
            P_TOTAL_QUANTITY,
            P_STORE_ID,
            P_PRE_TAX_TOTAL_AMOUNT,
            P_COMPANY_ID,
            P_PAID_BANK_AMOUNT,
            P_COST_CTR_ID,
            P_CLIENT_DISCOUNT,
            P_TOTAL_VAT,
            P_PAYMENT_TYPE,
            P_DEFERRED_AMOUNT,
            P_STORE_DATE,
            P_PAID_CASH_AMOUNT,
            P_INVOICE_NO,
            P_BRANCH_ID
        ) RETURNING INVOICE_ID INTO P_INVOICE_ID;
    END INSERT_SALES_INV;
-- update
    PROCEDURE UPDATE_SALES_INV (
        P_INVOICE_ID                 IN SALES_INV.INVOICE_ID%TYPE,
        P_BRANCH_ID                   IN      SALES_INV.BRANCH_ID%TYPE DEFAULT NULL,
        P_BANK_ACC_ID                IN SALES_INV.BANK_ACC_ID%TYPE DEFAULT NULL,
        P_ACC_JOURNAL_ID             IN SALES_INV.ACC_JOURNAL_ID%TYPE DEFAULT NULL,
        P_PAID_AMOUNT                IN SALES_INV.PAID_AMOUNT%TYPE DEFAULT NULL,
        P_SAFE_ID                    IN SALES_INV.SAFE_ID%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_AMOUNT IN SALES_INV.POST_DISCOUNT_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_USER_ID                    IN SALES_INV.USER_ID%TYPE DEFAULT NULL,
        P_TOTAL_DISCOUNT             IN SALES_INV.TOTAL_DISCOUNT%TYPE DEFAULT NULL,
        P_INVOICE_DATE               IN SALES_INV.INVOICE_DATE%TYPE DEFAULT NULL,
        P_NOTES                      IN SALES_INV.NOTES%TYPE DEFAULT NULL,
        P_INVOICE_TOTAL_AMOUNT       IN SALES_INV.INVOICE_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_TYPE               IN SALES_INV.INVOICE_TYPE%TYPE DEFAULT NULL,
        P_CLIENT_ID                  IN SALES_INV.CLIENT_ID%TYPE DEFAULT NULL,
        P_TOTAL_QUANTITY             IN SALES_INV.TOTAL_QUANTITY%TYPE DEFAULT NULL,
        P_STORE_ID                   IN SALES_INV.STORE_ID%TYPE DEFAULT NULL,
        P_PRE_TAX_TOTAL_AMOUNT       IN SALES_INV.PRE_TAX_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COMPANY_ID                 IN SALES_INV.COMPANY_ID%TYPE,
        P_PAID_BANK_AMOUNT           IN SALES_INV.PAID_BANK_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CTR_ID                IN SALES_INV.COST_CTR_ID%TYPE DEFAULT NULL,
        P_CLIENT_DISCOUNT            IN SALES_INV.CLIENT_DISCOUNT%TYPE DEFAULT NULL,
        P_TOTAL_VAT                  IN SALES_INV.TOTAL_VAT%TYPE DEFAULT NULL,
        P_PAYMENT_TYPE               IN SALES_INV.PAYMENT_TYPE%TYPE DEFAULT NULL,
        P_DEFERRED_AMOUNT            IN SALES_INV.DEFERRED_AMOUNT%TYPE DEFAULT NULL,
        P_STORE_DATE                 IN SALES_INV.STORE_DATE%TYPE DEFAULT NULL,
        P_PAID_CASH_AMOUNT           IN SALES_INV.PAID_CASH_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_NO                 IN SALES_INV.INVOICE_NO%TYPE
    ) IS
    BEGIN
        UPDATE SALES_INV
        SET
            BRANCH_ID = P_BRANCH_ID,
            BANK_ACC_ID = P_BANK_ACC_ID,
            ACC_JOURNAL_ID = P_ACC_JOURNAL_ID,
            PAID_AMOUNT = P_PAID_AMOUNT,
            SAFE_ID = P_SAFE_ID,
            POST_DISCOUNT_TOTAL_AMOUNT = P_POST_DISCOUNT_TOTAL_AMOUNT,
            USER_ID = P_USER_ID,
            TOTAL_DISCOUNT = P_TOTAL_DISCOUNT,
            INVOICE_DATE = P_INVOICE_DATE,
            NOTES = P_NOTES,
            INVOICE_TOTAL_AMOUNT = P_INVOICE_TOTAL_AMOUNT,
            INVOICE_TYPE = P_INVOICE_TYPE,
            CLIENT_ID = P_CLIENT_ID,
            TOTAL_QUANTITY = P_TOTAL_QUANTITY,
            STORE_ID = P_STORE_ID,
            PRE_TAX_TOTAL_AMOUNT = P_PRE_TAX_TOTAL_AMOUNT,
            COMPANY_ID = P_COMPANY_ID,
            PAID_BANK_AMOUNT = P_PAID_BANK_AMOUNT,
            COST_CTR_ID = P_COST_CTR_ID,
            CLIENT_DISCOUNT = P_CLIENT_DISCOUNT,
            TOTAL_VAT = P_TOTAL_VAT,
            PAYMENT_TYPE = P_PAYMENT_TYPE,
            DEFERRED_AMOUNT = P_DEFERRED_AMOUNT,
            STORE_DATE = P_STORE_DATE,
            PAID_CASH_AMOUNT = P_PAID_CASH_AMOUNT
        WHERE
            INVOICE_ID = P_INVOICE_ID;

    END UPDATE_SALES_INV;
-- del
    PROCEDURE DELETE_SALES_INV (
        P_INVOICE_ID IN SALES_INV.INVOICE_ID%TYPE
    ) IS
    BEGIN
        DELETE FROM SALES_INV
        WHERE
            INVOICE_ID = P_INVOICE_ID;

    END DELETE_SALES_INV;

END SALES_INV_TAPI;

/
--------------------------------------------------------
--  DDL for Package Body SALES_PRODUCT_FILES_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SALES_PRODUCT_FILES_TAPI" IS

    PROCEDURE INS (
        P_PRODUCT_ID      IN   SALES_PRODUCT_FILES.PRODUCT_ID%TYPE DEFAULT NULL,
        P_FILE_SIZE       IN   SALES_PRODUCT_FILES.FILE_SIZE%TYPE DEFAULT NULL,
        P_FILE_MIME_TYPE  IN   SALES_PRODUCT_FILES.FILE_MIME_TYPE%TYPE DEFAULT NULL,
        P_FILE_PATH       IN   SALES_PRODUCT_FILES.FILE_PATH%TYPE DEFAULT NULL,
        P_IS_THUMBNAIL    IN   SALES_PRODUCT_FILES.IS_THUMBNAIL%TYPE DEFAULT NULL,
        P_FILE_ID         OUT  SALES_PRODUCT_FILES.FILE_ID%TYPE
    ) IS
    BEGIN
        INSERT INTO SALES_PRODUCT_FILES (
            FILE_SIZE,
            IS_THUMBNAIL,
            FILE_PATH,
            PRODUCT_ID,
            FILE_MIME_TYPE
        ) VALUES (
            P_FILE_SIZE,
            P_IS_THUMBNAIL,
            P_FILE_PATH,
            P_PRODUCT_ID,
            P_FILE_MIME_TYPE
        ) RETURNING FILE_ID INTO P_FILE_ID;

    END;

    PROCEDURE UPD (
        P_FILE_ID         IN  SALES_PRODUCT_FILES.FILE_ID%TYPE,
        P_PRODUCT_ID      IN  SALES_PRODUCT_FILES.PRODUCT_ID%TYPE DEFAULT NULL,
        P_FILE_SIZE       IN  SALES_PRODUCT_FILES.FILE_SIZE%TYPE DEFAULT NULL,
        P_FILE_PATH       IN  SALES_PRODUCT_FILES.FILE_PATH%TYPE DEFAULT NULL,
        P_FILE_MIME_TYPE  IN  SALES_PRODUCT_FILES.FILE_MIME_TYPE%TYPE DEFAULT NULL,
        P_IS_THUMBNAIL    IN  SALES_PRODUCT_FILES.IS_THUMBNAIL%TYPE DEFAULT NULL
    ) IS
    BEGIN
        UPDATE SALES_PRODUCT_FILES
        SET
            FILE_SIZE = P_FILE_SIZE,
            IS_THUMBNAIL = P_IS_THUMBNAIL,
            FILE_PATH = P_FILE_PATH,
            PRODUCT_ID = P_PRODUCT_ID,
            FILE_MIME_TYPE = P_FILE_MIME_TYPE
        WHERE
            FILE_ID = P_FILE_ID;

    END;

    PROCEDURE DEL (
        P_FILE_ID IN SALES_PRODUCT_FILES.FILE_ID%TYPE
    ) IS
        P_FILE_NAME VARCHAR2(200);
    BEGIN
        SELECT FILE_PATH
        INTO P_FILE_NAME 
        FROM SALES_PRODUCT_FILES
        WHERE FILE_ID = P_FILE_ID;
        FILE_UTILE.DELETE_FILE(
            P_FOLDER_NAME  =>  'PRODUCT_FILES_DIR',
            P_FILE_NAME    =>  P_FILE_NAME
        );
        DELETE FROM SALES_PRODUCT_FILES
        WHERE
            FILE_ID = P_FILE_ID;

    END;

END SALES_PRODUCT_FILES_TAPI;

/
--------------------------------------------------------
--  DDL for Package Body SALES_PURCHASE_INV_DTL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SALES_PURCHASE_INV_DTL_TAPI" IS

    PROCEDURE INS (
        P_PRICE                      IN  SALES_PURCHASE_INV_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY                   IN  SALES_PURCHASE_INV_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_DISCOUNT_VALUE             IN  SALES_PURCHASE_INV_DTL.DISCOUNT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_ID                 IN  SALES_PURCHASE_INV_DTL.PRODUCT_ID%TYPE DEFAULT NULL,
        P_PRE_DISCOUNT_VAT_VALUE     IN  SALES_PURCHASE_INV_DTL.PRE_DISCOUNT_VAT_VALUE%TYPE DEFAULT NULL,
        P_INVOICE_ID                 IN  SALES_PURCHASE_INV_DTL.INVOICE_ID%TYPE DEFAULT NULL,
        P_VAT_PERCENTAGE             IN  SALES_PURCHASE_INV_DTL.VAT_PERCENTAGE%TYPE DEFAULT NULL,
        P_TOTAL_PRICE                IN  SALES_PURCHASE_INV_DTL.TOTAL_PRICE%TYPE DEFAULT NULL,
        P_VAT_VALUE                  IN  SALES_PURCHASE_INV_DTL.VAT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID            IN  SALES_PURCHASE_INV_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_DISCOUNT_PERCENTAGE        IN  SALES_PURCHASE_INV_DTL.DISCOUNT_PERCENTAGE%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_PRICE  IN  SALES_PURCHASE_INV_DTL.POST_DISCOUNT_TOTAL_PRICE%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT               IN  SALES_PURCHASE_INV_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL
    ) IS
    BEGIN
        INSERT INTO SALES_PURCHASE_INV_DTL (
            PRICE,
            QUANTITY,
            DISCOUNT_VALUE,
            PRODUCT_ID,
            PRE_DISCOUNT_VAT_VALUE,
            INVOICE_ID,
            VAT_PERCENTAGE,
            TOTAL_PRICE,
            VAT_VALUE,
            PRODUCT_UNIT_ID,
            DISCOUNT_PERCENTAGE,
            POST_DISCOUNT_TOTAL_PRICE,
            TOTAL_AMOUNT
        ) VALUES (
            P_PRICE,
            P_QUANTITY,
            P_DISCOUNT_VALUE,
            P_PRODUCT_ID,
            P_PRE_DISCOUNT_VAT_VALUE,
            P_INVOICE_ID,
            P_VAT_PERCENTAGE,
            P_TOTAL_PRICE,
            P_VAT_VALUE,
            P_PRODUCT_UNIT_ID,
            P_DISCOUNT_PERCENTAGE,
            P_POST_DISCOUNT_TOTAL_PRICE,
            P_TOTAL_AMOUNT
        );

    END;

    PROCEDURE UPD (
        P_PRICE                      IN  SALES_PURCHASE_INV_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY                   IN  SALES_PURCHASE_INV_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_DISCOUNT_VALUE             IN  SALES_PURCHASE_INV_DTL.DISCOUNT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_ID                 IN  SALES_PURCHASE_INV_DTL.PRODUCT_ID%TYPE DEFAULT NULL,
        P_PRE_DISCOUNT_VAT_VALUE     IN  SALES_PURCHASE_INV_DTL.PRE_DISCOUNT_VAT_VALUE%TYPE DEFAULT NULL,
        P_INVOICE_ID                 IN  SALES_PURCHASE_INV_DTL.INVOICE_ID%TYPE DEFAULT NULL,
        P_DTL_ID                     IN  SALES_PURCHASE_INV_DTL.DTL_ID%TYPE,
        P_VAT_PERCENTAGE             IN  SALES_PURCHASE_INV_DTL.VAT_PERCENTAGE%TYPE DEFAULT NULL,
        P_TOTAL_PRICE                IN  SALES_PURCHASE_INV_DTL.TOTAL_PRICE%TYPE DEFAULT NULL,
        P_VAT_VALUE                  IN  SALES_PURCHASE_INV_DTL.VAT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID            IN  SALES_PURCHASE_INV_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_DISCOUNT_PERCENTAGE        IN  SALES_PURCHASE_INV_DTL.DISCOUNT_PERCENTAGE%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_PRICE  IN  SALES_PURCHASE_INV_DTL.POST_DISCOUNT_TOTAL_PRICE%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT               IN  SALES_PURCHASE_INV_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL
    ) IS
    BEGIN
        UPDATE SALES_PURCHASE_INV_DTL
        SET
            PRICE = P_PRICE,
            QUANTITY = P_QUANTITY,
            DISCOUNT_VALUE = P_DISCOUNT_VALUE,
            PRODUCT_ID = P_PRODUCT_ID,
            PRE_DISCOUNT_VAT_VALUE = P_PRE_DISCOUNT_VAT_VALUE,
            INVOICE_ID = P_INVOICE_ID,
            VAT_PERCENTAGE = P_VAT_PERCENTAGE,
            TOTAL_PRICE = P_TOTAL_PRICE,
            VAT_VALUE = P_VAT_VALUE,
            PRODUCT_UNIT_ID = P_PRODUCT_UNIT_ID,
            DISCOUNT_PERCENTAGE = P_DISCOUNT_PERCENTAGE,
            POST_DISCOUNT_TOTAL_PRICE = P_POST_DISCOUNT_TOTAL_PRICE,
            TOTAL_AMOUNT = P_TOTAL_AMOUNT
        WHERE
            DTL_ID = P_DTL_ID;

    END;

    PROCEDURE DEL (
        P_DTL_ID IN SALES_PURCHASE_INV_DTL.DTL_ID%TYPE
    ) IS
    BEGIN
        DELETE FROM SALES_PURCHASE_INV_DTL
        WHERE
            DTL_ID = P_DTL_ID;

    END;

    PROCEDURE DEL_DTL (
        P_INVOICE_ID  IN  NUMBER,
        P_ID_LIST     IN  JSON_ARRAY_T
    ) IS
        V_ID_TBL    ID_TBL := ID_TBL();
    BEGIN
        V_ID_TBL := ARRAY_TO_TABLE(P_JSON_ARRAY => P_ID_LIST, P_ID_INDEX => 'dtl_id');
        DELETE FROM SALES_PURCHASE_INV_DTL 
        WHERE INVOICE_ID = P_INVOICE_ID AND  DTL_ID NOT IN (SELECT ID FROM TABLE(V_ID_TBL));

    END DEL_DTL;
END SALES_PURCHASE_INV_DTL_TAPI;

/
--------------------------------------------------------
--  DDL for Package Body SALES_PURCHASE_INV_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SALES_PURCHASE_INV_TAPI" IS

    PROCEDURE INS (
        P_BANK_ACC_ID                 IN      SALES_PURCHASE_INV.BANK_ACC_ID%TYPE DEFAULT NULL,
        P_ACC_JOURNAL_ID              IN      SALES_PURCHASE_INV.ACC_JOURNAL_ID%TYPE DEFAULT NULL,
        P_PAID_AMOUNT                 IN      SALES_PURCHASE_INV.PAID_AMOUNT%TYPE DEFAULT NULL,
        P_SAFE_ID                     IN      SALES_PURCHASE_INV.SAFE_ID%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_AMOUNT  IN      SALES_PURCHASE_INV.POST_DISCOUNT_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_USER_ID                     IN      SALES_PURCHASE_INV.USER_ID%TYPE DEFAULT NULL,
        P_PROVIDER_ID                 IN      SALES_PURCHASE_INV.PROVIDER_ID%TYPE DEFAULT NULL,
        P_TOTAL_DISCOUNT              IN      SALES_PURCHASE_INV.TOTAL_DISCOUNT%TYPE DEFAULT NULL,
        P_INVOICE_DATE                IN      SALES_PURCHASE_INV.INVOICE_DATE%TYPE DEFAULT NULL,
        P_NOTES                       IN      SALES_PURCHASE_INV.NOTES%TYPE DEFAULT NULL,
        P_INVOICE_TOTAL_AMOUNT        IN      SALES_PURCHASE_INV.INVOICE_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_TYPE                IN      SALES_PURCHASE_INV.INVOICE_TYPE%TYPE DEFAULT NULL,
        P_TOTAL_QUANTITY              IN      SALES_PURCHASE_INV.TOTAL_QUANTITY%TYPE DEFAULT NULL,
        P_STORE_ID                    IN      SALES_PURCHASE_INV.STORE_ID%TYPE DEFAULT NULL,
        P_PRE_TAX_TOTAL_AMOUNT        IN      SALES_PURCHASE_INV.PRE_TAX_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COMPANY_ID                  IN      SALES_PURCHASE_INV.COMPANY_ID%TYPE,
        P_PAID_BANK_AMOUNT            IN      SALES_PURCHASE_INV.PAID_BANK_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CTR_ID                 IN      SALES_PURCHASE_INV.COST_CTR_ID%TYPE DEFAULT NULL,
        P_CLIENT_DISCOUNT             IN      SALES_PURCHASE_INV.CLIENT_DISCOUNT%TYPE DEFAULT NULL,
        P_TOTAL_VAT                   IN      SALES_PURCHASE_INV.TOTAL_VAT%TYPE DEFAULT NULL,
        P_PROVIDER_INV_ID             IN      SALES_PURCHASE_INV.PROVIDER_INV_ID%TYPE DEFAULT NULL,
        P_PAYMENT_TYPE                IN      SALES_PURCHASE_INV.PAYMENT_TYPE%TYPE DEFAULT NULL,
        P_DEFERRED_AMOUNT             IN      SALES_PURCHASE_INV.DEFERRED_AMOUNT%TYPE DEFAULT NULL,
        P_PROVIDER_INV_DATE           IN      SALES_PURCHASE_INV.PROVIDER_INV_DATE%TYPE DEFAULT NULL,
        P_STORE_DATE                  IN      SALES_PURCHASE_INV.STORE_DATE%TYPE DEFAULT NULL,
        P_PAID_CASH_AMOUNT            IN      SALES_PURCHASE_INV.PAID_CASH_AMOUNT%TYPE DEFAULT NULL,
        P_BRANCH_ID                   IN      SALES_PURCHASE_INV.BRANCH_ID%TYPE DEFAULT NULL,
        P_INVOICE_NO                  OUT  SALES_PURCHASE_INV.INVOICE_NO%TYPE,
        P_INVOICE_ID                  OUT     SALES_PURCHASE_INV.INVOICE_ID%TYPE
    ) IS
    BEGIN
        P_INVOICE_NO := MAKE_NO.GET_PURCHASE_INV_NO(P_COMPANY_ID => P_COMPANY_ID,P_BRANCH_ID => P_BRANCH_ID);
        P_INVOICE_ID := MAKE_ID.GET_PURCHASE_INV_ID(P_COMPANY_ID => P_COMPANY_ID,P_BRANCH_ID => P_BRANCH_ID);
        --RAISE_APPLICATION_ERROR(-20001, 'Account past due.'||P_INVOICE_ID);
        INSERT INTO SALES_PURCHASE_INV (
            INVOICE_ID,
            BANK_ACC_ID,
            ACC_JOURNAL_ID,
            PAID_AMOUNT,
            SAFE_ID,
            POST_DISCOUNT_TOTAL_AMOUNT,
            USER_ID,
            PROVIDER_ID,
            TOTAL_DISCOUNT,
            INVOICE_DATE,
            NOTES,
            INVOICE_TOTAL_AMOUNT,
            INVOICE_TYPE,
            TOTAL_QUANTITY,
            STORE_ID,
            PRE_TAX_TOTAL_AMOUNT,
            COMPANY_ID,
            PAID_BANK_AMOUNT,
            COST_CTR_ID,
            CLIENT_DISCOUNT,
            INVOICE_NO,
            TOTAL_VAT,
            PROVIDER_INV_ID,
            PAYMENT_TYPE,
            DEFERRED_AMOUNT,
            PROVIDER_INV_DATE,
            STORE_DATE,
            PAID_CASH_AMOUNT,
            BRANCH_ID
        ) VALUES (
            P_INVOICE_ID,
            P_BANK_ACC_ID,
            P_ACC_JOURNAL_ID,
            P_PAID_AMOUNT,
            P_SAFE_ID,
            P_POST_DISCOUNT_TOTAL_AMOUNT,
            P_USER_ID,
            P_PROVIDER_ID,
            P_TOTAL_DISCOUNT,
            P_INVOICE_DATE,
            P_NOTES,
            P_INVOICE_TOTAL_AMOUNT,
            P_INVOICE_TYPE,
            P_TOTAL_QUANTITY,
            P_STORE_ID,
            P_PRE_TAX_TOTAL_AMOUNT,
            P_COMPANY_ID,
            P_PAID_BANK_AMOUNT,
            P_COST_CTR_ID,
            P_CLIENT_DISCOUNT,
            P_INVOICE_NO,
            P_TOTAL_VAT,
            P_PROVIDER_INV_ID,
            P_PAYMENT_TYPE,
            P_DEFERRED_AMOUNT,
            P_PROVIDER_INV_DATE,
            P_STORE_DATE,
            P_PAID_CASH_AMOUNT,
            P_BRANCH_ID
        )RETURNING INVOICE_ID INTO P_INVOICE_ID;

    END;

    PROCEDURE UPD (
        P_BANK_ACC_ID                 IN  SALES_PURCHASE_INV.BANK_ACC_ID%TYPE DEFAULT NULL,
        P_ACC_JOURNAL_ID              IN  SALES_PURCHASE_INV.ACC_JOURNAL_ID%TYPE DEFAULT NULL,
        P_PAID_AMOUNT                 IN  SALES_PURCHASE_INV.PAID_AMOUNT%TYPE DEFAULT NULL,
        P_SAFE_ID                     IN  SALES_PURCHASE_INV.SAFE_ID%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_AMOUNT  IN  SALES_PURCHASE_INV.POST_DISCOUNT_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_USER_ID                     IN  SALES_PURCHASE_INV.USER_ID%TYPE DEFAULT NULL,
        P_PROVIDER_ID                 IN  SALES_PURCHASE_INV.PROVIDER_ID%TYPE DEFAULT NULL,
        P_TOTAL_DISCOUNT              IN  SALES_PURCHASE_INV.TOTAL_DISCOUNT%TYPE DEFAULT NULL,
        P_INVOICE_DATE                IN  SALES_PURCHASE_INV.INVOICE_DATE%TYPE DEFAULT NULL,
        P_NOTES                       IN  SALES_PURCHASE_INV.NOTES%TYPE DEFAULT NULL,
        P_INVOICE_ID                  IN  SALES_PURCHASE_INV.INVOICE_ID%TYPE,
        P_INVOICE_TOTAL_AMOUNT        IN  SALES_PURCHASE_INV.INVOICE_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_TYPE                IN  SALES_PURCHASE_INV.INVOICE_TYPE%TYPE DEFAULT NULL,
        P_TOTAL_QUANTITY              IN  SALES_PURCHASE_INV.TOTAL_QUANTITY%TYPE DEFAULT NULL,
        P_STORE_ID                    IN  SALES_PURCHASE_INV.STORE_ID%TYPE DEFAULT NULL,
        P_PRE_TAX_TOTAL_AMOUNT        IN  SALES_PURCHASE_INV.PRE_TAX_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COMPANY_ID                  IN  SALES_PURCHASE_INV.COMPANY_ID%TYPE,
        P_PAID_BANK_AMOUNT            IN  SALES_PURCHASE_INV.PAID_BANK_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CTR_ID                 IN  SALES_PURCHASE_INV.COST_CTR_ID%TYPE DEFAULT NULL,
        P_CLIENT_DISCOUNT             IN  SALES_PURCHASE_INV.CLIENT_DISCOUNT%TYPE DEFAULT NULL,
        P_INVOICE_NO                  IN OUT  SALES_PURCHASE_INV.INVOICE_NO%TYPE,
        P_TOTAL_VAT                   IN  SALES_PURCHASE_INV.TOTAL_VAT%TYPE DEFAULT NULL,
        P_PROVIDER_INV_ID             IN  SALES_PURCHASE_INV.PROVIDER_INV_ID%TYPE DEFAULT NULL,
        P_PAYMENT_TYPE                IN  SALES_PURCHASE_INV.PAYMENT_TYPE%TYPE DEFAULT NULL,
        P_DEFERRED_AMOUNT             IN  SALES_PURCHASE_INV.DEFERRED_AMOUNT%TYPE DEFAULT NULL,
        P_PROVIDER_INV_DATE           IN  SALES_PURCHASE_INV.PROVIDER_INV_DATE%TYPE DEFAULT NULL,
        P_STORE_DATE                  IN  SALES_PURCHASE_INV.STORE_DATE%TYPE DEFAULT NULL,
        P_PAID_CASH_AMOUNT            IN  SALES_PURCHASE_INV.PAID_CASH_AMOUNT%TYPE DEFAULT NULL,
        P_BRANCH_ID                   IN  SALES_PURCHASE_INV.BRANCH_ID%TYPE DEFAULT NULL
    ) IS
    BEGIN
        UPDATE SALES_PURCHASE_INV
        SET
            BANK_ACC_ID = P_BANK_ACC_ID,
            ACC_JOURNAL_ID = P_ACC_JOURNAL_ID,
            PAID_AMOUNT = P_PAID_AMOUNT,
            SAFE_ID = P_SAFE_ID,
            POST_DISCOUNT_TOTAL_AMOUNT = P_POST_DISCOUNT_TOTAL_AMOUNT,
            USER_ID = P_USER_ID,
            PROVIDER_ID = P_PROVIDER_ID,
            TOTAL_DISCOUNT = P_TOTAL_DISCOUNT,
            INVOICE_DATE = P_INVOICE_DATE,
            NOTES = P_NOTES,
            INVOICE_TOTAL_AMOUNT = P_INVOICE_TOTAL_AMOUNT,
            INVOICE_TYPE = P_INVOICE_TYPE,
            TOTAL_QUANTITY = P_TOTAL_QUANTITY,
            STORE_ID = P_STORE_ID,
            PRE_TAX_TOTAL_AMOUNT = P_PRE_TAX_TOTAL_AMOUNT,
            COMPANY_ID = P_COMPANY_ID,
            PAID_BANK_AMOUNT = P_PAID_BANK_AMOUNT,
            COST_CTR_ID = P_COST_CTR_ID,
            CLIENT_DISCOUNT = P_CLIENT_DISCOUNT,
            TOTAL_VAT = P_TOTAL_VAT,
            PROVIDER_INV_ID = P_PROVIDER_INV_ID,
            PAYMENT_TYPE = P_PAYMENT_TYPE,
            DEFERRED_AMOUNT = P_DEFERRED_AMOUNT,
            PROVIDER_INV_DATE = P_PROVIDER_INV_DATE,
            STORE_DATE = P_STORE_DATE,
            BRANCH_ID = P_BRANCH_ID,
            PAID_CASH_AMOUNT = P_PAID_CASH_AMOUNT
        WHERE
            INVOICE_ID = P_INVOICE_ID;

    END;

    PROCEDURE DEL (
        P_INVOICE_ID IN SALES_PURCHASE_INV.INVOICE_ID%TYPE
    ) IS
    BEGIN
        DELETE FROM SALES_PURCHASE_INV
        WHERE
            INVOICE_ID = P_INVOICE_ID;

    END;

END SALES_PURCHASE_INV_TAPI;

/
--------------------------------------------------------
--  DDL for Package Body SALES_PURCHASE_ORDER_DTL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SALES_PURCHASE_ORDER_DTL_TAPI" IS

    PROCEDURE INS (
        P_PRICE                      IN  SALES_PURCHASE_ORDER_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY                   IN  SALES_PURCHASE_ORDER_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_DISCOUNT_VALUE             IN  SALES_PURCHASE_ORDER_DTL.DISCOUNT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_ID                 IN  SALES_PURCHASE_ORDER_DTL.PRODUCT_ID%TYPE DEFAULT NULL,
        P_PRE_DISCOUNT_VAT_VALUE     IN  SALES_PURCHASE_ORDER_DTL.PRE_DISCOUNT_VAT_VALUE%TYPE DEFAULT NULL,
        P_ORDER_ID                 IN  SALES_PURCHASE_ORDER_DTL.ORDER_ID%TYPE DEFAULT NULL,
        P_VAT_PERCENTAGE             IN  SALES_PURCHASE_ORDER_DTL.VAT_PERCENTAGE%TYPE DEFAULT NULL,
        P_TOTAL_PRICE                IN  SALES_PURCHASE_ORDER_DTL.TOTAL_PRICE%TYPE DEFAULT NULL,
        P_VAT_VALUE                  IN  SALES_PURCHASE_ORDER_DTL.VAT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID            IN  SALES_PURCHASE_ORDER_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_DISCOUNT_PERCENTAGE        IN  SALES_PURCHASE_ORDER_DTL.DISCOUNT_PERCENTAGE%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_PRICE  IN  SALES_PURCHASE_ORDER_DTL.POST_DISCOUNT_TOTAL_PRICE%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT               IN  SALES_PURCHASE_ORDER_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL
    ) IS
    BEGIN
        INSERT INTO SALES_PURCHASE_ORDER_DTL (
            PRICE,
            QUANTITY,
            DISCOUNT_VALUE,
            PRODUCT_ID,
            PRE_DISCOUNT_VAT_VALUE,
            ORDER_ID,
            VAT_PERCENTAGE,
            TOTAL_PRICE,
            VAT_VALUE,
            PRODUCT_UNIT_ID,
            DISCOUNT_PERCENTAGE,
            POST_DISCOUNT_TOTAL_PRICE,
            TOTAL_AMOUNT
        ) VALUES (
            P_PRICE,
            P_QUANTITY,
            P_DISCOUNT_VALUE,
            P_PRODUCT_ID,
            P_PRE_DISCOUNT_VAT_VALUE,
            P_ORDER_ID,
            P_VAT_PERCENTAGE,
            P_TOTAL_PRICE,
            P_VAT_VALUE,
            P_PRODUCT_UNIT_ID,
            P_DISCOUNT_PERCENTAGE,
            P_POST_DISCOUNT_TOTAL_PRICE,
            P_TOTAL_AMOUNT
        );

    END;

    PROCEDURE UPD (
        P_PRICE                      IN  SALES_PURCHASE_ORDER_DTL.PRICE%TYPE DEFAULT NULL,
        P_QUANTITY                   IN  SALES_PURCHASE_ORDER_DTL.QUANTITY%TYPE DEFAULT NULL,
        P_DISCOUNT_VALUE             IN  SALES_PURCHASE_ORDER_DTL.DISCOUNT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_ID                 IN  SALES_PURCHASE_ORDER_DTL.PRODUCT_ID%TYPE DEFAULT NULL,
        P_PRE_DISCOUNT_VAT_VALUE     IN  SALES_PURCHASE_ORDER_DTL.PRE_DISCOUNT_VAT_VALUE%TYPE DEFAULT NULL,
        P_ORDER_ID                 IN  SALES_PURCHASE_ORDER_DTL.ORDER_ID%TYPE DEFAULT NULL,
        P_DTL_ID                     IN  SALES_PURCHASE_ORDER_DTL.DTL_ID%TYPE,
        P_VAT_PERCENTAGE             IN  SALES_PURCHASE_ORDER_DTL.VAT_PERCENTAGE%TYPE DEFAULT NULL,
        P_TOTAL_PRICE                IN  SALES_PURCHASE_ORDER_DTL.TOTAL_PRICE%TYPE DEFAULT NULL,
        P_VAT_VALUE                  IN  SALES_PURCHASE_ORDER_DTL.VAT_VALUE%TYPE DEFAULT NULL,
        P_PRODUCT_UNIT_ID            IN  SALES_PURCHASE_ORDER_DTL.PRODUCT_UNIT_ID%TYPE DEFAULT NULL,
        P_DISCOUNT_PERCENTAGE        IN  SALES_PURCHASE_ORDER_DTL.DISCOUNT_PERCENTAGE%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_PRICE  IN  SALES_PURCHASE_ORDER_DTL.POST_DISCOUNT_TOTAL_PRICE%TYPE DEFAULT NULL,
        P_TOTAL_AMOUNT               IN  SALES_PURCHASE_ORDER_DTL.TOTAL_AMOUNT%TYPE DEFAULT NULL
    ) IS
    BEGIN
        UPDATE SALES_PURCHASE_ORDER_DTL
        SET
            PRICE = P_PRICE,
            QUANTITY = P_QUANTITY,
            DISCOUNT_VALUE = P_DISCOUNT_VALUE,
            PRODUCT_ID = P_PRODUCT_ID,
            PRE_DISCOUNT_VAT_VALUE = P_PRE_DISCOUNT_VAT_VALUE,
            ORDER_ID = P_ORDER_ID,
            VAT_PERCENTAGE = P_VAT_PERCENTAGE,
            TOTAL_PRICE = P_TOTAL_PRICE,
            VAT_VALUE = P_VAT_VALUE,
            PRODUCT_UNIT_ID = P_PRODUCT_UNIT_ID,
            DISCOUNT_PERCENTAGE = P_DISCOUNT_PERCENTAGE,
            POST_DISCOUNT_TOTAL_PRICE = P_POST_DISCOUNT_TOTAL_PRICE,
            TOTAL_AMOUNT = P_TOTAL_AMOUNT
        WHERE
            DTL_ID = P_DTL_ID;

    END;

    PROCEDURE DEL (
        P_DTL_ID IN SALES_PURCHASE_ORDER_DTL.DTL_ID%TYPE
    ) IS
    BEGIN
        DELETE FROM SALES_PURCHASE_ORDER_DTL
        WHERE
            DTL_ID = P_DTL_ID;

    END;

    PROCEDURE DEL_DTL (
        P_ORDER_ID    IN  NUMBER,
        P_ID_LIST     IN  JSON_ARRAY_T
    ) IS
        V_ID_TBL    ID_TBL := ID_TBL();
    BEGIN
        V_ID_TBL := ARRAY_TO_TABLE(P_JSON_ARRAY => P_ID_LIST, P_ID_INDEX => 'dtl_id');
        DELETE FROM SALES_PURCHASE_ORDER_DTL 
        WHERE ORDER_ID = P_ORDER_ID AND  DTL_ID NOT IN (SELECT ID FROM TABLE(V_ID_TBL));

    END DEL_DTL;
END SALES_PURCHASE_ORDER_DTL_TAPI;

/
--------------------------------------------------------
--  DDL for Package Body SALES_PURCHASE_ORDER_TAPI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SALES_PURCHASE_ORDER_TAPI" IS
    PROCEDURE INS (
        P_BANK_ACC_ID                 IN   SALES_PURCHASE_ORDER.BANK_ACC_ID%TYPE DEFAULT NULL,
        P_PAID_AMOUNT                 IN   SALES_PURCHASE_ORDER.PAID_AMOUNT%TYPE DEFAULT NULL,
        P_SAFE_ID                     IN   SALES_PURCHASE_ORDER.SAFE_ID%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_AMOUNT  IN   SALES_PURCHASE_ORDER.POST_DISCOUNT_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_USER_ID                     IN   SALES_PURCHASE_ORDER.USER_ID%TYPE DEFAULT NULL,
        P_PROVIDER_ID                 IN   SALES_PURCHASE_ORDER.PROVIDER_ID%TYPE DEFAULT NULL,
        P_TOTAL_DISCOUNT              IN   SALES_PURCHASE_ORDER.TOTAL_DISCOUNT%TYPE DEFAULT NULL,
        P_NOTES                       IN   SALES_PURCHASE_ORDER.NOTES%TYPE DEFAULT NULL,
        P_INVOICE_TOTAL_AMOUNT        IN   SALES_PURCHASE_ORDER.INVOICE_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_TYPE                IN   SALES_PURCHASE_ORDER.INVOICE_TYPE%TYPE DEFAULT NULL,
        P_TOTAL_QUANTITY              IN   SALES_PURCHASE_ORDER.TOTAL_QUANTITY%TYPE DEFAULT NULL,
        P_STORE_ID                    IN   SALES_PURCHASE_ORDER.STORE_ID%TYPE DEFAULT NULL,
        P_PRE_TAX_TOTAL_AMOUNT        IN   SALES_PURCHASE_ORDER.PRE_TAX_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COMPANY_ID                  IN   SALES_PURCHASE_ORDER.COMPANY_ID%TYPE,
        P_ORDER_DATE                  IN   SALES_PURCHASE_ORDER.ORDER_DATE%TYPE DEFAULT NULL,
        P_PAID_BANK_AMOUNT            IN   SALES_PURCHASE_ORDER.PAID_BANK_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CTR_ID                 IN   SALES_PURCHASE_ORDER.COST_CTR_ID%TYPE DEFAULT NULL,
        P_CLIENT_DISCOUNT             IN   SALES_PURCHASE_ORDER.CLIENT_DISCOUNT%TYPE DEFAULT NULL,
        P_TOTAL_VAT                   IN   SALES_PURCHASE_ORDER.TOTAL_VAT%TYPE DEFAULT NULL,
        P_PROVIDER_INV_ID             IN   SALES_PURCHASE_ORDER.PROVIDER_INV_ID%TYPE DEFAULT NULL,
        P_PAYMENT_TYPE                IN   SALES_PURCHASE_ORDER.PAYMENT_TYPE%TYPE DEFAULT NULL,
        P_PROVIDER_INV_DATE           IN   SALES_PURCHASE_ORDER.PROVIDER_INV_DATE%TYPE DEFAULT NULL,
        P_DEFERRED_AMOUNT             IN   SALES_PURCHASE_ORDER.DEFERRED_AMOUNT%TYPE DEFAULT NULL,
        P_STORE_DATE                  IN   SALES_PURCHASE_ORDER.STORE_DATE%TYPE DEFAULT NULL,
        P_PAID_CASH_AMOUNT            IN   SALES_PURCHASE_ORDER.PAID_CASH_AMOUNT%TYPE DEFAULT NULL,
        P_BRANCH_ID                   IN      SALES_PURCHASE_ORDER.BRANCH_ID%TYPE DEFAULT NULL,
        P_ORDER_ID                    OUT  SALES_PURCHASE_ORDER.ORDER_ID%TYPE,
        P_ORDER_NO                    OUT  SALES_PURCHASE_ORDER.ORDER_NO%TYPE
    ) IS
    BEGIN
        P_ORDER_NO := MAKE_NO.GET_PURCHASE_ORDER_NO(P_COMPANY_ID => P_COMPANY_ID,P_BRANCH_ID => P_BRANCH_ID);
        P_ORDER_ID := MAKE_ID.GET_PURCHASE_ORDER_ID(P_COMPANY_ID => P_COMPANY_ID,P_BRANCH_ID => P_BRANCH_ID);
        INSERT INTO SALES_PURCHASE_ORDER (
            ORDER_ID,
            BANK_ACC_ID,
            PAID_AMOUNT,
            SAFE_ID,
            POST_DISCOUNT_TOTAL_AMOUNT,
            USER_ID,
            PROVIDER_ID,
            TOTAL_DISCOUNT,
            NOTES,
            INVOICE_TOTAL_AMOUNT,
            INVOICE_TYPE,
            TOTAL_QUANTITY,
            STORE_ID,
            PRE_TAX_TOTAL_AMOUNT,
            COMPANY_ID,
            ORDER_DATE,
            PAID_BANK_AMOUNT,
            COST_CTR_ID,
            CLIENT_DISCOUNT,
            TOTAL_VAT,
            PROVIDER_INV_ID,
            PAYMENT_TYPE,
            PROVIDER_INV_DATE,
            DEFERRED_AMOUNT,
            ORDER_NO,
            STORE_DATE,
            PAID_CASH_AMOUNT,
            BRANCH_ID
        ) VALUES (
            P_ORDER_ID,
            P_BANK_ACC_ID,
            P_PAID_AMOUNT,
            P_SAFE_ID,
            P_POST_DISCOUNT_TOTAL_AMOUNT,
            P_USER_ID,
            P_PROVIDER_ID,
            P_TOTAL_DISCOUNT,
            P_NOTES,
            P_INVOICE_TOTAL_AMOUNT,
            P_INVOICE_TYPE,
            P_TOTAL_QUANTITY,
            P_STORE_ID,
            P_PRE_TAX_TOTAL_AMOUNT,
            P_COMPANY_ID,
            P_ORDER_DATE,
            P_PAID_BANK_AMOUNT,
            P_COST_CTR_ID,
            P_CLIENT_DISCOUNT,
            P_TOTAL_VAT,
            P_PROVIDER_INV_ID,
            P_PAYMENT_TYPE,
            P_PROVIDER_INV_DATE,
            P_DEFERRED_AMOUNT,
            P_ORDER_NO,
            P_STORE_DATE,
            P_PAID_CASH_AMOUNT,
            P_BRANCH_ID
        )RETURNING ORDER_ID INTO P_ORDER_ID;

    END;

    PROCEDURE UPD (
        P_BANK_ACC_ID                 IN      SALES_PURCHASE_ORDER.BANK_ACC_ID%TYPE DEFAULT NULL,
        P_ACC_JOURNAL_ID              IN      SALES_PURCHASE_ORDER.ACC_JOURNAL_ID%TYPE DEFAULT NULL,
        P_PAID_AMOUNT                 IN      SALES_PURCHASE_ORDER.PAID_AMOUNT%TYPE DEFAULT NULL,
        P_SAFE_ID                     IN      SALES_PURCHASE_ORDER.SAFE_ID%TYPE DEFAULT NULL,
        P_POST_DISCOUNT_TOTAL_AMOUNT  IN      SALES_PURCHASE_ORDER.POST_DISCOUNT_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_USER_ID                     IN      SALES_PURCHASE_ORDER.USER_ID%TYPE DEFAULT NULL,
        P_PROVIDER_ID                 IN      SALES_PURCHASE_ORDER.PROVIDER_ID%TYPE DEFAULT NULL,
        P_TOTAL_DISCOUNT              IN      SALES_PURCHASE_ORDER.TOTAL_DISCOUNT%TYPE DEFAULT NULL,
        P_NOTES                       IN      SALES_PURCHASE_ORDER.NOTES%TYPE DEFAULT NULL,
        P_INVOICE_TOTAL_AMOUNT        IN      SALES_PURCHASE_ORDER.INVOICE_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_INVOICE_TYPE                IN      SALES_PURCHASE_ORDER.INVOICE_TYPE%TYPE DEFAULT NULL,
        P_TOTAL_QUANTITY              IN      SALES_PURCHASE_ORDER.TOTAL_QUANTITY%TYPE DEFAULT NULL,
        P_STORE_ID                    IN      SALES_PURCHASE_ORDER.STORE_ID%TYPE DEFAULT NULL,
        P_PRE_TAX_TOTAL_AMOUNT        IN      SALES_PURCHASE_ORDER.PRE_TAX_TOTAL_AMOUNT%TYPE DEFAULT NULL,
        P_COMPANY_ID                  IN      SALES_PURCHASE_ORDER.COMPANY_ID%TYPE,
        P_ORDER_DATE                  IN      SALES_PURCHASE_ORDER.ORDER_DATE%TYPE DEFAULT NULL,
        P_PAID_BANK_AMOUNT            IN      SALES_PURCHASE_ORDER.PAID_BANK_AMOUNT%TYPE DEFAULT NULL,
        P_COST_CTR_ID                 IN      SALES_PURCHASE_ORDER.COST_CTR_ID%TYPE DEFAULT NULL,
        P_CLIENT_DISCOUNT             IN      SALES_PURCHASE_ORDER.CLIENT_DISCOUNT%TYPE DEFAULT NULL,
        P_TOTAL_VAT                   IN      SALES_PURCHASE_ORDER.TOTAL_VAT%TYPE DEFAULT NULL,
        P_PROVIDER_INV_ID             IN      SALES_PURCHASE_ORDER.PROVIDER_INV_ID%TYPE DEFAULT NULL,
        P_PAYMENT_TYPE                IN      SALES_PURCHASE_ORDER.PAYMENT_TYPE%TYPE DEFAULT NULL,
        P_PROVIDER_INV_DATE           IN      SALES_PURCHASE_ORDER.PROVIDER_INV_DATE%TYPE DEFAULT NULL,
        P_DEFERRED_AMOUNT             IN      SALES_PURCHASE_ORDER.DEFERRED_AMOUNT%TYPE DEFAULT NULL,
        P_STORE_DATE                  IN      SALES_PURCHASE_ORDER.STORE_DATE%TYPE DEFAULT NULL,
        P_PAID_CASH_AMOUNT            IN      SALES_PURCHASE_ORDER.PAID_CASH_AMOUNT%TYPE DEFAULT NULL,
        P_ORDER_ID                    IN      SALES_PURCHASE_ORDER.ORDER_ID%TYPE,
        P_BRANCH_ID                   IN      SALES_PURCHASE_ORDER.BRANCH_ID%TYPE DEFAULT NULL,
        P_ORDER_NO                    IN OUT  SALES_PURCHASE_ORDER.ORDER_NO%TYPE
    ) IS
    BEGIN
        P_ORDER_NO := NVL(P_ORDER_NO,MAKE_NO.GET_PURCHASE_ORDER_NO(P_COMPANY_ID => P_COMPANY_ID,P_BRANCH_ID => P_BRANCH_ID));
        UPDATE SALES_PURCHASE_ORDER
        SET
            BRANCH_ID = P_BRANCH_ID,
            BANK_ACC_ID = P_BANK_ACC_ID,
            ORDER_NO = P_ORDER_NO,
            ACC_JOURNAL_ID = P_ACC_JOURNAL_ID,
            PAID_AMOUNT = P_PAID_AMOUNT,
            SAFE_ID = P_SAFE_ID,
            POST_DISCOUNT_TOTAL_AMOUNT = P_POST_DISCOUNT_TOTAL_AMOUNT,
            USER_ID = P_USER_ID,
            PROVIDER_ID = P_PROVIDER_ID,
            TOTAL_DISCOUNT = P_TOTAL_DISCOUNT,
            NOTES = P_NOTES,
            INVOICE_TOTAL_AMOUNT = P_INVOICE_TOTAL_AMOUNT,
            INVOICE_TYPE = P_INVOICE_TYPE,
            TOTAL_QUANTITY = P_TOTAL_QUANTITY,
            STORE_ID = P_STORE_ID,
            PRE_TAX_TOTAL_AMOUNT = P_PRE_TAX_TOTAL_AMOUNT,
            COMPANY_ID = P_COMPANY_ID,
            ORDER_DATE = P_ORDER_DATE,
            PAID_BANK_AMOUNT = P_PAID_BANK_AMOUNT,
            COST_CTR_ID = P_COST_CTR_ID,
            CLIENT_DISCOUNT = P_CLIENT_DISCOUNT,
            TOTAL_VAT = P_TOTAL_VAT,
            PROVIDER_INV_ID = P_PROVIDER_INV_ID,
            PAYMENT_TYPE = P_PAYMENT_TYPE,
            PROVIDER_INV_DATE = P_PROVIDER_INV_DATE,
            DEFERRED_AMOUNT = P_DEFERRED_AMOUNT,
            STORE_DATE = P_STORE_DATE,
            PAID_CASH_AMOUNT = P_PAID_CASH_AMOUNT
        WHERE
            ORDER_ID = P_ORDER_ID;

    END;

    PROCEDURE DEL (
        P_ORDER_ID IN SALES_PURCHASE_ORDER.ORDER_ID%TYPE
    ) IS
    BEGIN
        DELETE FROM SALES_PURCHASE_ORDER
        WHERE
            ORDER_ID = P_ORDER_ID;

    END;

END SALES_PURCHASE_ORDER_TAPI;

/
--------------------------------------------------------
--  DDL for Package Body SALES_PUR_RETURN_INV_DTL_TAPI
--------------------------------------------------------
