--------------------------------------------------------
--  DDL for Function BALANCE_SHEET
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "BALANCE_SHEET" (P_TO_DATE NVARCHAR2) RETURN BAL_TABLE AS 

    V_BAL_REC BAL_REC;
    V_BAL_TABLE BAL_TABLE := BAL_TABLE();
    V_BAL_TABLE_PERENT BAL_TABLE := BAL_TABLE();
    V_BAL_TABLE_TEMP BAL_TABLE := BAL_TABLE();
    V_INDEX NUMBER:= 0;
    V_INDEX_TEMP NUMBER:= 0;
    V_LEVEL_NO NUMBER:= 3;
BEGIN
    FOR REC IN (
        WITH GL AS (
        SELECT 
        ACCOUNT_ID,
        SUM(nvl(DEBIT,0)) DEBIT_BAL,
        SUM(nvl(CREDIT,0)) CREDIT_BAL
        from acc_ledger
        WHERE JOURNAL_DATE < to_date(P_TO_DATE)
        GROUP BY ACCOUNT_ID
        )
        select 
        ACC.ACCOUNT_ID,
        account_name_ar,
        ACCOUNT_PARENT,
        nvl(DEBIT_BAL,0) DEBIT_BAL,
        nvl(CREDIT_BAL,0) CREDIT_BAL
        from GL full outer join   acc_accounts acc
        on acc.ACCOUNT_ID = GL.ACCOUNT_ID
        where ACC.SUB_ACCOUNT = 1 AND ACC.ACCOUNT_TYPE = 1
        order by acc.ACCOUNT_ID
    )
    LOOP
        V_INDEX := V_INDEX+1;
        V_BAL_TABLE.EXTEND;
        V_BAL_TABLE(V_INDEX) :=  BAL_REC(
            ACCOUNT_ID => REC.ACCOUNT_ID,
            ACCOUNT_PARENT => REC.ACCOUNT_PARENT,
            ACCOUNT_NAME => REC.account_name_ar,
            DEBIT_BAL => REC.DEBIT_BAL,
            CREDIT_BAL => REC.CREDIT_BAL
        );
    END LOOP;
    V_BAL_TABLE_PERENT := V_BAL_TABLE;
    WHILE V_LEVEL_NO > 0 LOOP

        V_INDEX_TEMP := 0;
        FOR REC IN (
            select 
            ACC.ACCOUNT_ID,
            ACC.account_name_ar,
            ACC.ACCOUNT_PARENT,
             DEBIT_BAL,
             CREDIT_BAL
            FROM (
            select 
                    ACCOUNT_PARENT ACCOUNT_ID,

            sum(DEBIT_BAL) DEBIT_BAL,
            sum(CREDIT_BAL) CREDIT_BAL
            from table( V_BAL_TABLE_PERENT) 
            group by ACCOUNT_PARENT) BAL 
            JOIN ACC_ACCOUNTS ACC
            ON BAL.ACCOUNT_ID  = ACC.ACCOUNT_ID
        )LOOP
            V_BAL_REC := BAL_REC(
                ACCOUNT_ID => REC.ACCOUNT_ID,
                ACCOUNT_PARENT => REC.ACCOUNT_PARENT,
                ACCOUNT_NAME => REC.account_name_ar,
                DEBIT_BAL => REC.DEBIT_BAL,
                CREDIT_BAL => REC.CREDIT_BAL
            );

            V_INDEX_TEMP := V_INDEX_TEMP+1;
            V_BAL_TABLE_TEMP.EXTEND;
            V_BAL_TABLE_TEMP(V_INDEX_TEMP) := V_BAL_REC;

            V_INDEX := V_INDEX+1;
            V_BAL_TABLE.EXTEND;
            V_BAL_TABLE(V_INDEX) :=  V_BAL_REC;
        END LOOP;
        V_LEVEL_NO := V_LEVEL_NO-1;
        V_BAL_TABLE_PERENT := V_BAL_TABLE_TEMP;
        V_BAL_TABLE_TEMP := BAL_TABLE();
    END LOOP;


    RETURN V_BAL_TABLE;
END BALANCE_SHEET;

/
--------------------------------------------------------
--  DDL for Function BLOB_LOAD
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "BLOB_LOAD" (p_file_name varchar2) RETURN BLOB
AS
    FILECONTENT  BLOB;
    SRC_FILE  BFILE := BFILENAME('PRODUCT_FILES_DIR', p_file_name);
    OFFSET            NUMBER := 1;
BEGIN


        DBMS_LOB.CREATETEMPORARY(
            FILECONTENT,
            TRUE,
            DBMS_LOB.SESSION
        );
        DBMS_LOB.FILEOPEN(
            SRC_FILE,
            DBMS_LOB.FILE_READONLY
        );
        DBMS_LOB.LOADBLOBFROMFILE(
            FILECONTENT,
            SRC_FILE,
            DBMS_LOB.GETLENGTH(SRC_FILE),
            OFFSET,
            OFFSET
        );
        --DBMS_LOB.FILECLOSE(SRC_FILE);
        DBMS_LOB.FILECLOSEALL;

RETURN FILECONTENT;
END;

/
--------------------------------------------------------
--  DDL for Function GET_ACC_BALANCE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "GET_ACC_BALANCE" (P_ACCOUNT_ID NUMBER) RETURN NUMBER AS 
    V_ACC_BAL NUMBER:= 0;
BEGIN
     WITH GL AS (SELECT 
        ACCOUNT_ID,
        SUM(nvl(DEBIT,0)) DEBIT_BAL,
        SUM(nvl(CREDIT,0)) CREDIT_BAL
        from acc_ledger
        WHERE ACCOUNT_ID = P_ACCOUNT_ID
        GROUP BY ACCOUNT_ID
        )
        select 
        DECODE(ACCOUNT_NATURE,1,nvl(DEBIT_BAL,0)-nvl(CREDIT_BAL,0),2,nvl(CREDIT_BAL,0)-nvl(DEBIT_BAL,0)) BAL
        INTO
            V_ACC_BAL
        from GL join   acc_accounts acc
        on acc.ACCOUNT_ID = GL.ACCOUNT_ID
        where ACC.SUB_ACCOUNT = 1 
        order by acc.ACCOUNT_ID;

        RETURN V_ACC_BAL;
END GET_ACC_BALANCE;

/
--------------------------------------------------------
--  DDL for Function GET_QR_CODE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "GET_QR_CODE" (
    P_COMPANY_ID          IN NUMBER,
    P_INVOICE_DATE        IN timestamp,
    P_INV_TOTAL_WITH_VAT  IN NUMBER,
    P_VAT_TOTAL           IN NUMBER
) RETURN VARCHAR2 AS
    P_SELLER_NAME  VARCHAR2(2000);
    P_INV_TOTAL  VARCHAR2(2000);
    P_VAT  VARCHAR2(2000);
    P_VAT_NO       VARCHAR2(30);
    P_INV_DATE     VARCHAR2(2000);
    P_QR           VARCHAR2(2000);
BEGIN
    P_INV_TOTAL := TO_CHAR (ROUND (P_INV_TOTAL_WITH_VAT, 2));
    P_VAT := TO_CHAR (ROUND (P_VAT_TOTAL, 2));
    SELECT NAME_EN, TAX_NO
    INTO P_SELLER_NAME,P_VAT_NO
    FROM ADMIN_COMPANY
    WHERE COMPANY_ID = P_COMPANY_ID;

    SELECT CONVERT (P_SELLER_NAME, 'utf8', 'AR8MSWIN1256')
    INTO P_SELLER_NAME
    FROM DUAL;

--    select to_char(cast(P_INVOICE_DATE as timestamp) at time zone 'UTC','yyyy-mm-dd"T"hh24:mi:ss"Z"')
    select to_char(sysdate ,'yyyy-mm-dd"T"hh24:mi:ss"Z"')
    INTO P_INV_DATE
    from dual;



--    SELECT TO_CHAR (P_INVOICE_DATE, 'yyyy-mm-dd hh24:mi:ss') 
--    INTO P_INV_DATE
--    FROM DUAL;

    P_QR := UTL_RAW.CAST_TO_VARCHAR2 (HEXTORAW (LPAD (LTRIM (TO_CHAR (1, 'xxxx')), 2, '0')))||
            UTL_RAW.CAST_TO_VARCHAR2 (HEXTORAW (LPAD (LTRIM (TO_CHAR (LENGTH(P_SELLER_NAME), 'xxxx')), 2, '0')))||
            P_SELLER_NAME;
    P_QR := P_QR ||
            UTL_RAW.CAST_TO_VARCHAR2 (HEXTORAW (LPAD (LTRIM (TO_CHAR (2, 'xxxx')), 2, '0')))||
            UTL_RAW.CAST_TO_VARCHAR2 (HEXTORAW (LPAD (LTRIM (TO_CHAR (LENGTH(P_VAT_NO), 'xxxx')), 2, '0')))||
            P_VAT_NO;
    P_QR := P_QR ||
            UTL_RAW.CAST_TO_VARCHAR2 (HEXTORAW (LPAD (LTRIM (TO_CHAR (3, 'xxxx')), 2, '0')))||
            UTL_RAW.CAST_TO_VARCHAR2 (HEXTORAW (LPAD (LTRIM (TO_CHAR (LENGTH(P_INV_DATE), 'xxxx')), 2, '0')))||
            P_INV_DATE;
    P_QR := P_QR ||
            UTL_RAW.CAST_TO_VARCHAR2 (HEXTORAW (LPAD (LTRIM (TO_CHAR (4, 'xxxx')), 2, '0')))||
            UTL_RAW.CAST_TO_VARCHAR2 (HEXTORAW (LPAD (LTRIM (TO_CHAR (LENGTH(P_INV_TOTAL), 'xxxx')), 2, '0')))||
            P_INV_TOTAL;
    P_QR := P_QR ||
            UTL_RAW.CAST_TO_VARCHAR2 (HEXTORAW (LPAD (LTRIM (TO_CHAR (5, 'xxxx')), 2, '0')))||
            UTL_RAW.CAST_TO_VARCHAR2 (HEXTORAW (LPAD (LTRIM (TO_CHAR (LENGTH(P_VAT), 'xxxx')), 2, '0')))||
            P_VAT;

    SELECT 
    REPLACE (
                   REPLACE (
                       UTL_RAW.cast_to_varchar2 (
                           UTL_ENCODE.base64_encode (
                               UTL_RAW.cast_to_raw (P_QR)))
                               ,CHR (10))
                               ,CHR (13))
                               QR
    INTO P_QR
    FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('P_QR: '||P_QR);
    RETURN P_QR;    
END;

/
--------------------------------------------------------
--  DDL for Function INCOME_STATEMENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "INCOME_STATEMENT" (P_TO_DATE NVARCHAR2) RETURN BAL_TABLE AS 

    V_BAL_REC BAL_REC;
    V_BAL_TABLE BAL_TABLE := BAL_TABLE();
    V_BAL_TABLE_PERENT BAL_TABLE := BAL_TABLE();
    V_BAL_TABLE_TEMP BAL_TABLE := BAL_TABLE();
    V_INDEX NUMBER:= 0;
    V_INDEX_TEMP NUMBER:= 0;
    V_LEVEL_NO NUMBER:= 3;
BEGIN
    FOR REC IN (
        WITH GL AS (
        SELECT 
        ACCOUNT_ID,
        SUM(nvl(DEBIT,0)) DEBIT_BAL,
        SUM(nvl(CREDIT,0)) CREDIT_BAL
        from acc_ledger
        WHERE JOURNAL_DATE < to_date(P_TO_DATE)
        GROUP BY ACCOUNT_ID
        )
        select 
        ACC.ACCOUNT_ID,
        account_name_ar,
        ACCOUNT_PARENT,
        nvl(DEBIT_BAL,0) DEBIT_BAL,
        nvl(CREDIT_BAL,0) CREDIT_BAL
        from GL full outer join   acc_accounts acc
        on acc.ACCOUNT_ID = GL.ACCOUNT_ID
        where ACC.SUB_ACCOUNT = 1 AND ACC.ACCOUNT_TYPE = 2
        order by acc.ACCOUNT_ID
    )
    LOOP
        V_INDEX := V_INDEX+1;
        V_BAL_TABLE.EXTEND;
        V_BAL_TABLE(V_INDEX) :=  BAL_REC(
            ACCOUNT_ID => REC.ACCOUNT_ID,
            ACCOUNT_PARENT => REC.ACCOUNT_PARENT,
            ACCOUNT_NAME => REC.account_name_ar,
            DEBIT_BAL => REC.DEBIT_BAL,
            CREDIT_BAL => REC.CREDIT_BAL
        );
    END LOOP;
    V_BAL_TABLE_PERENT := V_BAL_TABLE;
    WHILE V_LEVEL_NO > 0 LOOP

        V_INDEX_TEMP := 0;
        FOR REC IN (
            select 
            ACC.ACCOUNT_ID,
            ACC.account_name_ar,
            ACC.ACCOUNT_PARENT,
             DEBIT_BAL,
             CREDIT_BAL
            FROM (
            select 
                    ACCOUNT_PARENT ACCOUNT_ID,

            sum(DEBIT_BAL) DEBIT_BAL,
            sum(CREDIT_BAL) CREDIT_BAL
            from table( V_BAL_TABLE_PERENT) 
            group by ACCOUNT_PARENT) BAL 
            JOIN ACC_ACCOUNTS ACC
            ON BAL.ACCOUNT_ID  = ACC.ACCOUNT_ID
        )LOOP
            V_BAL_REC := BAL_REC(
                ACCOUNT_ID => REC.ACCOUNT_ID,
                ACCOUNT_PARENT => REC.ACCOUNT_PARENT,
                ACCOUNT_NAME => REC.account_name_ar,
                DEBIT_BAL => REC.DEBIT_BAL,
                CREDIT_BAL => REC.CREDIT_BAL
            );

            V_INDEX_TEMP := V_INDEX_TEMP+1;
            V_BAL_TABLE_TEMP.EXTEND;
            V_BAL_TABLE_TEMP(V_INDEX_TEMP) := V_BAL_REC;

            V_INDEX := V_INDEX+1;
            V_BAL_TABLE.EXTEND;
            V_BAL_TABLE(V_INDEX) :=  V_BAL_REC;
        END LOOP;
        V_LEVEL_NO := V_LEVEL_NO-1;
        V_BAL_TABLE_PERENT := V_BAL_TABLE_TEMP;
        V_BAL_TABLE_TEMP := BAL_TABLE();
    END LOOP;


    RETURN V_BAL_TABLE;
END INCOME_STATEMENT;

/
--------------------------------------------------------
--  DDL for Function IS_NUMERIC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "IS_NUMERIC" ( P_STR IN VARCHAR2 )
  RETURN NUMBER
IS
  L_NUM NUMBER;
BEGIN
  L_NUM := TO_NUMBER( P_STR );
  RETURN 1;
EXCEPTION
  WHEN VALUE_ERROR
  THEN
    RETURN 0;
END;

/
--------------------------------------------------------
--  DDL for Function TRAIL_BALANCE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "TRAIL_BALANCE" (P_FROM_DATE NVARCHAR2, P_TO_DATE NVARCHAR2) RETURN TB_TABLE AS 

    V_TB_REC TB_REC;
    V_TB_TABLE TB_TABLE := TB_TABLE();
    V_TB_TABLE_PERENT TB_TABLE := TB_TABLE();
    V_TB_TABLE_TEMP TB_TABLE := TB_TABLE();
    V_INDEX NUMBER:= 0;
    V_INDEX_TEMP NUMBER:= 0;
    V_LEVEL_NO NUMBER:= 3;
BEGIN
    FOR REC IN (
        WITH PRE_PERIOD AS (
        SELECT 
        ACCOUNT_ID,
        SUM(nvl(DEBIT,0)) PRE_DEBIT,
        SUM(nvl(CREDIT,0)) PRE_CREDIT
        from acc_ledger
        WHERE JOURNAL_DATE < TO_DATE(P_FROM_DATE)
        GROUP BY ACCOUNT_ID
        ),
        in_period as (
        select 
        ACCOUNT_ID,
        SUM(nvl(DEBIT,0)) IN_DEBIT,
        SUM(nvl(CREDIT,0)) IN_CREDIT
         from acc_ledger
         WHERE JOURNAL_DATE >= TO_DATE(P_FROM_DATE) AND JOURNAL_DATE <= TO_DATE(P_TO_DATE) 
         GROUP BY ACCOUNT_ID
        )
        select 
        ACC.ACCOUNT_ID,
        account_name_ar,
        ACCOUNT_PARENT,
        nvl(PRE_DEBIT,0) PRE_DEBIT,
        nvl(PRE_CREDIT,0) PRE_CREDIT,
        nvl(IN_DEBIT,0) IN_DEBIT,
        nvl(IN_CREDIT,0) IN_CREDIT,
        decode(sign(nvl(PRE_DEBIT,0)+nvl(IN_DEBIT,0)-nvl(PRE_CREDIT,0)-nvl(IN_CREDIT,0)),-1,0,(nvl(PRE_DEBIT,0)+nvl(IN_DEBIT,0)-nvl(PRE_CREDIT,0)-nvl(IN_CREDIT,0))) POST_DEBIT,
        decode(sign(nvl(PRE_CREDIT,0)+nvl(IN_CREDIT,0)-nvl(PRE_DEBIT,0)-nvl(IN_DEBIT,0)),-1,0,(nvl(PRE_CREDIT,0)+nvl(IN_CREDIT,0)-nvl(PRE_DEBIT,0)-nvl(IN_DEBIT,0))) POST_CREDIT
        from pre_period full outer join   acc_accounts acc
        on acc.ACCOUNT_ID = pre_period.ACCOUNT_ID
        full outer JOIN in_period ON 
        acc.ACCOUNT_ID = in_period.ACCOUNT_ID
        where ACC.SUB_ACCOUNT = 1
        order by acc.ACCOUNT_ID
    )
    LOOP
        V_INDEX := V_INDEX+1;
        V_TB_TABLE.EXTEND;
        V_TB_TABLE(V_INDEX) :=  TB_REC(
            ACCOUNT_ID => REC.ACCOUNT_ID,
            ACCOUNT_PARENT => REC.ACCOUNT_PARENT,
            ACCOUNT_NAME => REC.account_name_ar,
            PRE_DEBIT => REC.PRE_DEBIT,
            PRE_CREDIT => REC.PRE_CREDIT,
            IN_DEBIT => REC.IN_DEBIT,
            IN_CREDIT => REC.IN_CREDIT,
            POST_DEBIT => REC.POST_DEBIT,
            POST_CREDIT  => REC.POST_CREDIT
        );
    END LOOP;
    V_TB_TABLE_PERENT := V_TB_TABLE;
    WHILE V_LEVEL_NO > 0 LOOP

        V_INDEX_TEMP := 0;
        FOR REC IN (
            select 
            ACC.ACCOUNT_ID,
            ACC.account_name_ar,
            ACC.ACCOUNT_PARENT,
             PRE_DEBIT,
             PRE_CREDIT,
             IN_DEBIT,
            IN_CREDIT,
             POST_DEBIT,
             POST_CREDIT
            FROM (
            select 
                    ACCOUNT_PARENT ACCOUNT_ID,

            sum(PRE_DEBIT) PRE_DEBIT,
            sum(PRE_CREDIT) PRE_CREDIT,
            sum(IN_DEBIT) IN_DEBIT,
            sum(IN_CREDIT) IN_CREDIT,
            sum(POST_DEBIT) POST_DEBIT,
            sum(POST_CREDIT) POST_CREDIT
            from table( V_TB_TABLE_PERENT) 
            group by ACCOUNT_PARENT) TB 
            JOIN ACC_ACCOUNTS ACC
            ON TB.ACCOUNT_ID  = ACC.ACCOUNT_ID
        )LOOP
            V_TB_REC := TB_REC(
                ACCOUNT_ID => REC.ACCOUNT_ID,
                ACCOUNT_PARENT => REC.ACCOUNT_PARENT,
                ACCOUNT_NAME => REC.account_name_ar,
                PRE_DEBIT => REC.PRE_DEBIT,
                PRE_CREDIT => REC.PRE_CREDIT,
                IN_DEBIT => REC.IN_DEBIT,
                IN_CREDIT => REC.IN_CREDIT,
                POST_DEBIT => REC.POST_DEBIT,
                POST_CREDIT  => REC.POST_CREDIT
            );

            V_INDEX_TEMP := V_INDEX_TEMP+1;
            V_TB_TABLE_TEMP.EXTEND;
            V_TB_TABLE_TEMP(V_INDEX_TEMP) := V_TB_REC;

            V_INDEX := V_INDEX+1;
            V_TB_TABLE.EXTEND;
            V_TB_TABLE(V_INDEX) :=  V_TB_REC;
        END LOOP;
        V_LEVEL_NO := V_LEVEL_NO-1;
        V_TB_TABLE_PERENT := V_TB_TABLE_TEMP;
        V_TB_TABLE_TEMP := TB_TABLE();
    END LOOP;


    RETURN V_TB_TABLE;
END TRAIL_BALANCE;

/
