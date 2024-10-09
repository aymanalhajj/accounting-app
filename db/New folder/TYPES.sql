--------------------------------------------------------
--  File created - الاثنين-سبتمبر-23-2024   
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
--  DDL for Type BAL_TABLE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "BAL_TABLE" AS TABLE OF BAL_REC;


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
