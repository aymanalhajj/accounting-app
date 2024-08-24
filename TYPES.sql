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
    ACCOUNT_ID      NUMBER,
    ACCOUNT_PARENT  NUMBER,
    ACCOUNT_NAME    NVARCHAR2(200),
    DEBIT_BAL       NUMBER,
    CREDIT_BAL      NUMBER
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
--  DDL for Type TB_REC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "TB_REC" AS OBJECT (
ACCOUNT_ID NUMBER,
ACCOUNT_PARENT NUMBER,
account_name NVARCHAR2(200),
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
