--------------------------------------------------------
--  DDL for Function ACC_BALS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ACC_BALS" (
    P_COMPANY_ID   NUMBER,
    P_FROM_DATE       NVARCHAR2,
    P_TO_DATE         NVARCHAR2,
    P_WITH_MAIN_ACCS  NUMBER DEFAULT 0
) RETURN BAL_TABLE AS 

    V_BAL_REC BAL_REC;
    V_BAL_TABLE BAL_TABLE := BAL_TABLE();
    V_BAL_TABLE_PERENT BAL_TABLE := BAL_TABLE();
    V_BAL_TABLE_TEMP BAL_TABLE := BAL_TABLE();
    V_INDEX NUMBER:= 0;
    V_INDEX_TEMP NUMBER:= 0;
    V_LEVEL_NO NUMBER:= 5;
BEGIN
    FOR REC IN (
        WITH in_period as (
        select 
        ACCOUNT_ID,
        SUM(nvl(DEBIT,0)) DEBIT_BAL,
        SUM(nvl(CREDIT,0)) CREDIT_BAL,
        DECODE(SIGN(SUM(NVL(L.DEBIT,0)) -SUM(NVL(L.CREDIT,0))),1,SUM(NVL(L.DEBIT,0)) -SUM(NVL(L.CREDIT,0)),SUM(NVL(L.CREDIT,0)) -SUM(NVL(L.DEBIT,0))) BAL,
        DECODE(SIGN(SUM(NVL(L.DEBIT,0)) -SUM(NVL(L.CREDIT,0))),1,1,2) BAL_NATURE
         from acc_ledger l
         WHERE l.COMPANY_ID = P_COMPANY_ID AND  JOURNAL_DATE >= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND JOURNAL_DATE <= TO_DATE(P_TO_DATE,'DD-MM-YYYY') 
         GROUP BY ACCOUNT_ID
        )
        select 
            ACC.ACCOUNT_ID,
            account_name_ar,
            ACCOUNT_NAME_EN,
            ACCOUNT_PARENT,
            NVL(DEBIT_BAL,0) DEBIT_BAL,
            NVL(CREDIT_BAL,0) CREDIT_BAL,
            NVL(BAL,0) BAL,
            NVL(BAL_NATURE,ACC.ACCOUNT_NATURE) BAL_NATURE
        from acc_accounts acc full outer JOIN in_period ON 
        acc.ACCOUNT_ID = in_period.ACCOUNT_ID
        WHERE acc.COMPANY_ID = P_COMPANY_ID AND  ACC.SUB_ACCOUNT = 1
        order by acc.ACCOUNT_ID
    )
    LOOP
        V_INDEX := V_INDEX+1;
        V_BAL_TABLE.EXTEND;
        V_BAL_TABLE(V_INDEX) :=  BAL_REC(
            ACCOUNT_ID          => REC.ACCOUNT_ID,
            ACCOUNT_PARENT      => REC.ACCOUNT_PARENT,
            ACCOUNT_NAME_AR     => REC.account_name_ar,
            ACCOUNT_NAME_EN     => REC.ACCOUNT_NAME_EN,
            DEBIT_BAL           => REC.DEBIT_BAL,
            CREDIT_BAL          => REC.CREDIT_BAL,
            BAL                 => REC.BAL,
            BAL_NATURE          => REC.BAL_NATURE
        );
    END LOOP;
    V_BAL_TABLE_PERENT := V_BAL_TABLE;
    WHILE NVL(P_WITH_MAIN_ACCS,0) = 1 AND V_LEVEL_NO > 0 LOOP

        V_INDEX_TEMP := 0;
        FOR REC IN (
            select 
                ACC.ACCOUNT_ID,
                ACC.account_name_ar,
                ACC.account_name_EN,
                ACC.ACCOUNT_PARENT,
                NVL(DEBIT_BAL,0) DEBIT_BAL,
                NVL(CREDIT_BAL,0) CREDIT_BAL,
                NVL(BAL,0) BAL,
                NVL(BAL_NATURE,ACC.ACCOUNT_NATURE) BAL_NATURE
            FROM (
            select 
                ACCOUNT_PARENT ACCOUNT_ID,
                sum(DEBIT_BAL) DEBIT_BAL,
                sum(CREDIT_BAL) CREDIT_BAL,
                DECODE(SIGN(SUM(NVL(DEBIT_BAL,0)) -SUM(NVL(CREDIT_BAL,0))),1,SUM(NVL(DEBIT_BAL,0)) -SUM(NVL(CREDIT_BAL,0)),SUM(NVL(CREDIT_BAL,0)) -SUM(NVL(DEBIT_BAL,0))) BAL,
                DECODE(SIGN(SUM(NVL(DEBIT_BAL,0)) -SUM(NVL(CREDIT_BAL,0))),1,1,-1,2,NULL) BAL_NATURE
            from table( V_BAL_TABLE_PERENT) 
            group by ACCOUNT_PARENT) TB 
            JOIN ACC_ACCOUNTS ACC
            ON TB.ACCOUNT_ID  = ACC.ACCOUNT_ID
            WHERE acc.COMPANY_ID = P_COMPANY_ID
        )LOOP
            V_BAL_REC := BAL_REC(
                ACCOUNT_ID          => REC.ACCOUNT_ID,
                ACCOUNT_PARENT      => REC.ACCOUNT_PARENT,
                ACCOUNT_NAME_AR     => REC.account_name_ar,
                ACCOUNT_NAME_EN     => REC.ACCOUNT_NAME_EN,
                DEBIT_BAL           => REC.DEBIT_BAL,
                CREDIT_BAL          => REC.CREDIT_BAL,
                BAL                 => REC.BAL,
                BAL_NATURE          => REC.BAL_NATURE
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
END ACC_BALS;


/
--------------------------------------------------------
--  DDL for Function ACC_BALS_BANK
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ACC_BALS_BANK" (
    P_COMPANY_ID   NUMBER,
    P_FROM_DATE       NVARCHAR2,
    P_TO_DATE         NVARCHAR2,
    P_BANK_ID  NUMBER DEFAULT 0
) RETURN BAL_BANK_TBL AS 
 V_BAL_BANK_REC BAL_BANK_REC := BAL_BANK_REC(
        ACCOUNT_ID          => NULL,
        ACCOUNT_NAME_AR     => NULL,
        ACCOUNT_NAME_EN     => NULL,
		MAIN_BANK_NAME_AR   => NULL,
		MAIN_BANK_NAME_EN   => NULL,
        BANK_NAME_AR        => NULL,
		BANK_NAME_EN        => NULL,
		DEBIT_BAL           => NULL,
        CREDIT_BAL          => NULL,
        BAL                 => NULL,
        BAL_NATURE          => NULL
    );
	V_MAIN_BANK_NAME_AR NVARCHAR2(200);
	V_MAIN_BANK_NAME_EN NVARCHAR2(200);
    V_BAL_BANK_TBL BAL_BANK_TBL:= BAL_BANK_TBL();
    V_INDEX NUMBER:= 0;
    V_INDEX_TEMP NUMBER:= 0;
    V_LEVEL_NO NUMBER:= 5;
BEGIN

IF P_BANK_ID= 0 THEN 
  V_MAIN_BANK_NAME_AR   :='الكل';
  V_MAIN_BANK_NAME_EN    :='All';
  else  
    select 
	  ACC_NAME_AR,
	  ACC_NAME_EN
	 into 
	  V_MAIN_BANK_NAME_AR,
	  V_MAIN_BANK_NAME_EN
	 from SETUP_BANK_EXT_ACC
	 where COMPANY_ID=P_COMPANY_ID
	 and BANK_ACC_ID=P_BANK_ID;

  end if;
    FOR REC IN (
        WITH in_period as (
        select 
        ACCOUNT_ID,
        SUM(nvl(DEBIT,0)) DEBIT_BAL,
        SUM(nvl(CREDIT,0)) CREDIT_BAL,
        DECODE(SIGN(SUM(NVL(L.DEBIT,0)) -SUM(NVL(L.CREDIT,0))),1,SUM(NVL(L.DEBIT,0)) -SUM(NVL(L.CREDIT,0)),SUM(NVL(L.CREDIT,0)) -SUM(NVL(L.DEBIT,0))) BAL,
		DECODE(SIGN(SUM(NVL(L.DEBIT,0)) -SUM(NVL(L.CREDIT,0))),1,1,-1,2,NULL) BAL_NATURE
         from acc_ledger l
         WHERE l.COMPANY_ID = P_COMPANY_ID AND  JOURNAL_DATE >= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND JOURNAL_DATE <= TO_DATE(P_TO_DATE,'DD-MM-YYYY') 
         GROUP BY ACCOUNT_ID
        )
        select 
            ACC.ACCOUNT_ID,
            account_name_ar,
            ACCOUNT_NAME_EN,
			ACC_NAME_AR,
			ACC_NAME_EN,
            ACCOUNT_PARENT,
            NVL(DEBIT_BAL,0) DEBIT_BAL,
            NVL(CREDIT_BAL,0) CREDIT_BAL,
            NVL(BAL,0) BAL,
            NVL(BAL_NATURE,ACC.ACCOUNT_NATURE) BAL_NATURE
        from acc_accounts acc full outer JOIN in_period ON 
        acc.ACCOUNT_ID = in_period.ACCOUNT_ID
		JOIN SETUP_BANK_EXT_ACC SA ON SA.ACCOUNT_ID=ACC.ACCOUNT_ID
        WHERE SA.COMPANY_ID = P_COMPANY_ID AND (SA.BANK_ACC_ID =P_BANK_ID OR P_BANK_ID=0)
        order by acc.ACCOUNT_ID
    )
    LOOP

            V_BAL_BANK_REC.ACCOUNT_ID        := REC.ACCOUNT_ID;
            V_BAL_BANK_REC.ACCOUNT_NAME_AR     := REC.ACCOUNT_NAME_AR;
            V_BAL_BANK_REC.ACCOUNT_NAME_EN     := REC.ACCOUNT_NAME_EN;
            V_BAL_BANK_REC.MAIN_BANK_NAME_AR   := V_MAIN_BANK_NAME_AR;
            V_BAL_BANK_REC.MAIN_BANK_NAME_EN   := V_MAIN_BANK_NAME_EN;
            V_BAL_BANK_REC.BANK_NAME_AR        := REC.ACC_NAME_AR;
            V_BAL_BANK_REC.BANK_NAME_EN        := REC.ACC_NAME_EN;
			V_BAL_BANK_REC.DEBIT_BAL           := REC.DEBIT_BAL;
			V_BAL_BANK_REC.CREDIT_BAL          := REC.CREDIT_BAL;
			V_BAL_BANK_REC.BAL                 := REC.BAL;
			V_BAL_BANK_REC.BAL_NATURE          := REC.BAL_NATURE;


        V_BAL_BANK_TBL.EXTEND;
        V_INDEX := V_INDEX+1;
        V_BAL_BANK_TBL(V_INDEX) := V_BAL_BANK_REC;

 END LOOP;

    RETURN V_BAL_BANK_TBL;
END ACC_BALS_BANK;


/
--------------------------------------------------------
--  DDL for Function BALANCE_SHEET
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "BALANCE_SHEET" (
    P_COMPANY_ID   NUMBER,
    P_TO_DATE        NVARCHAR2,
    P_FOR_MAIN_ACCS  NUMBER DEFAULT 0
) RETURN BAL_TABLE AS 

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
        from acc_ledger L
        WHERE l.COMPANY_ID = P_COMPANY_ID AND JOURNAL_DATE < to_date(P_TO_DATE,'DD-MM-YYYY')
        GROUP BY ACCOUNT_ID
        )
        select 
        ACC.ACCOUNT_ID,
        account_name_ar,
        account_name_EN,
        ACCOUNT_PARENT,
        nvl(DEBIT_BAL,0) DEBIT_BAL,
        nvl(CREDIT_BAL,0) CREDIT_BAL
        from GL RIGHT join   acc_accounts acc
        on acc.ACCOUNT_ID = GL.ACCOUNT_ID
        WHERE acc.COMPANY_ID = P_COMPANY_ID AND ACC.SUB_ACCOUNT = 1 AND ACC.ACCOUNT_TYPE = 1
        order by acc.ACCOUNT_ID
    )
    LOOP
        V_INDEX := V_INDEX+1;
        V_BAL_TABLE.EXTEND;
        V_BAL_TABLE(V_INDEX) :=  BAL_REC(
            ACCOUNT_ID          => REC.ACCOUNT_ID,
            ACCOUNT_PARENT      => REC.ACCOUNT_PARENT,
            ACCOUNT_NAME_AR     => REC.account_name_ar,
            ACCOUNT_NAME_EN     => REC.ACCOUNT_NAME_EN,
            DEBIT_BAL           => REC.DEBIT_BAL,
            CREDIT_BAL          => REC.CREDIT_BAL,
            BAL                 => null,
            BAL_NATURE          => null
        );
    END LOOP;
    V_BAL_TABLE_PERENT := V_BAL_TABLE;
    WHILE NVL(P_FOR_MAIN_ACCS,0) = 1 AND V_LEVEL_NO > 0 LOOP

        V_INDEX_TEMP := 0;
        FOR REC IN (
            select 
            ACC.ACCOUNT_ID,
            ACC.account_name_ar,
            ACC.account_name_EN,
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
            WHERE acc.COMPANY_ID = P_COMPANY_ID 
        )LOOP
            V_BAL_REC := BAL_REC(
                ACCOUNT_ID          => REC.ACCOUNT_ID,
                ACCOUNT_PARENT      => REC.ACCOUNT_PARENT,
                ACCOUNT_NAME_AR     => REC.account_name_ar,
                ACCOUNT_NAME_EN     => REC.ACCOUNT_NAME_EN,
                DEBIT_BAL           => REC.DEBIT_BAL,
                CREDIT_BAL          => REC.CREDIT_BAL,
                BAL                 => null,
                BAL_NATURE          => null
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
--  DDL for Function BASE64ENCODEBLOB_PLSQL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "BASE64ENCODEBLOB_PLSQL" (i_bl BLOB) 
return clob is
  v_out_cl     CLOB;
  file_len     PLS_INTEGER;
  modulo       PLS_INTEGER;
  pieces       PLS_INTEGER;
  amt          BINARY_INTEGER      := 23808;
  buf          RAW (32767);
  buf_tx       varchar2(32767);
  pos          PLS_INTEGER         := 1;
  filepos      PLS_INTEGER         := 1;
  counter      PLS_INTEGER         := 1;
BEGIN
  DBMS_LOB.createtemporary 
     (v_out_cl, TRUE, dbms_lob.call);
  file_len := DBMS_LOB.getlength (i_bl);
  modulo := MOD (file_len, amt);
  pieces := TRUNC (file_len / amt);

  WHILE (counter <= pieces) LOOP
    DBMS_LOB.READ (i_bl, amt, filepos, buf);
    buf_tx:=utl_raw.cast_to_varchar2
       (UTL_ENCODE.base64_encode (buf));
    dbms_lob.writeappend
       (v_out_cl,length(buf_tx),buf_tx);
    filepos := counter * amt + 1;
    counter := counter + 1;
  END LOOP;

  IF (modulo <> 0) THEN
    DBMS_LOB.READ
      (i_bl, modulo, filepos, buf);
    buf_tx:=utl_raw.cast_to_varchar2
      (UTL_ENCODE.base64_encode (buf));
    dbms_lob.writeappend
      (v_out_cl,length(buf_tx),buf_tx);
  END IF;
  return v_out_cl;
END;


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
--  DDL for Function GET_PURCHASE_INVOICE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "GET_PURCHASE_INVOICE" (
    P_FIRST       VARCHAR2,
    P_LAST        VARCHAR2,
    P_NEXT        VARCHAR2,
    P_PREV        VARCHAR2,
    P_INVOICE_ID  VARCHAR2
) RETURN CLOB AS
    V_INVOICE_ID    NUMBER;
    V_RESPONSE      CLOB;
BEGIN
    BEGIN
        IF p_first = '1' THEN
            SELECT MIN(INVOICE_ID)
            INTO V_INVOICE_ID
            FROM SALES_PURCHASE_INV;
        ELSIF p_last = '1' THEN
            SELECT MAX(INVOICE_ID)
            INTO V_INVOICE_ID
            FROM SALES_PURCHASE_INV;
        ELSIF p_next = '1' THEN
            SELECT INVOICE_ID
            INTO V_INVOICE_ID
            FROM SALES_PURCHASE_INV
            WHERE INVOICE_ID > p_invoice_id
            ORDER BY INVOICE_ID ASC
            FETCH NEXT 1 ROWS ONLY;
        ELSIF p_prev = '1' THEN
            SELECT INVOICE_ID
            INTO V_INVOICE_ID
            FROM SALES_PURCHASE_INV
            WHERE INVOICE_ID < p_invoice_id
            ORDER BY INVOICE_ID DESC
            FETCH NEXT 1 ROWS ONLY;
        ELSE
            V_INVOICE_ID := p_invoice_id;
        END IF;
        SELECT
                JSON_OBJECT(
                    'invoice_id' IS INVOICE_ID,
                            'bank_acc_id' IS BANK_ACC_ID,
                            'paid_amount' IS PAID_AMOUNT,
                            'safe_id' IS SAFE_ID,
                            'post_discount_total_amount' IS POST_DISCOUNT_TOTAL_AMOUNT,
                            'user_id' IS USER_ID,
                            'provider_id' IS PROVIDER_ID,
                            'total_discount' IS TOTAL_DISCOUNT,
                            'invoice_date' IS INVOICE_DATE,
                            'notes' IS NOTES,
                            'invoice_total_amount' IS INVOICE_TOTAL_AMOUNT,
                            'invoice_type' IS INVOICE_TYPE,
                            'total_quantity' IS TOTAL_QUANTITY,
                            'store_id' IS STORE_ID,
                            'pre_tax_total_amount' IS PRE_TAX_TOTAL_AMOUNT,
                            'company_id' IS COMPANY_ID,
                            'paid_bank_amount' IS PAID_BANK_AMOUNT,
                            'cost_ctr_id' IS COST_CTR_ID,
                            'client_discount' IS CLIENT_DISCOUNT,
                            'invoice_no' IS INVOICE_NO,
                            'total_vat' IS TOTAL_VAT,
                            'provider_inv_id' IS PROVIDER_INV_ID,
                            'payment_type' IS PAYMENT_TYPE,
                            'deferred_amount' IS DEFERRED_AMOUNT,
                            'provider_inv_date' IS PROVIDER_INV_DATE,
                            'store_date' IS STORE_DATE,
                            'paid_cash_amount' IS PAID_CASH_AMOUNT,
                            'branch_id' IS BRANCH_ID,
                            'items' IS (
                                            SELECT JSON_ARRAYAGG
                                                       ( JSON_OBJECT( 
                                                            KEY 'dtl_id' VALUE dtl_id,
                                                            KEY 'product_id' VALUE product_id,
                                                            KEY 'barcode' VALUE
                                                            (
                                                                SELECT BARCODE FROM SALES_PRODUCT 
                                                                where PRODUCT_ID  = dtl.product_id
                                                            ),
                                                            KEY 'unit_id' VALUE product_unit_id,
                                                            KEY 'quantity' VALUE quantity,
                                                            KEY 'base_price' VALUE price,
                                                            KEY 'total_price' VALUE total_price,
                                                            KEY 'discount_percentage' VALUE discount_percentage,
                                                            KEY 'discount_value' VALUE discount_value,
                                                            KEY 'post_discount_total_price' VALUE post_discount_total_price,
                                                            KEY 'vat_percentage' VALUE vat_percentage,
                                                            KEY 'vat_value' VALUE vat_value,
                                                            KEY 'total_amount' VALUE total_amount,
                                                            KEY 'pre_discount_vat_value' VALUE pre_discount_vat_value
                                                                    RETURNING CLOB
                                                                    )
                                                                    RETURNING CLOB
                                                      )
                                            FROM sales_purchase_inv_dtl dtl WHERE invoice_id = INV.invoice_id
                                        )
                RETURNING CLOB) JSON_DATA

        INTO V_RESPONSE
        FROM SALES_PURCHASE_INV INV
        WHERE INVOICE_ID = V_INVOICE_ID;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            return NULL;
    END;
    RETURN V_RESPONSE;

END;

/
--------------------------------------------------------
--  DDL for Function GET_PUR_RETURN_INVOICE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "GET_PUR_RETURN_INVOICE" (
    P_FIRST       VARCHAR2,
    P_LAST        VARCHAR2,
    P_NEXT        VARCHAR2,
    P_PREV        VARCHAR2,
    P_INVOICE_ID  VARCHAR2
) RETURN CLOB AS
    V_INVOICE_ID    NUMBER;
    V_RESPONSE      CLOB;
BEGIN
    BEGIN
        IF p_first = '1' THEN
            SELECT MIN(INVOICE_ID)
            INTO V_INVOICE_ID
            FROM SALES_PUR_RETURN_INV;
        ELSIF p_last = '1' THEN
            SELECT MAX(INVOICE_ID)
            INTO V_INVOICE_ID
            FROM SALES_PUR_RETURN_INV;
        ELSIF p_next = '1' THEN
            SELECT INVOICE_ID
            INTO V_INVOICE_ID
            FROM SALES_PUR_RETURN_INV
            WHERE INVOICE_ID > p_invoice_id
            ORDER BY INVOICE_ID ASC
            FETCH NEXT 1 ROWS ONLY;
        ELSIF p_prev = '1' THEN
            SELECT INVOICE_ID
            INTO V_INVOICE_ID
            FROM SALES_PUR_RETURN_INV
            WHERE INVOICE_ID < p_invoice_id
            ORDER BY INVOICE_ID DESC
            FETCH NEXT 1 ROWS ONLY;
        ELSE
            V_INVOICE_ID := p_invoice_id;
        END IF;
        SELECT
                JSON_OBJECT(
                    'invoice_id' IS INVOICE_ID,
                            'bank_acc_id' IS BANK_ACC_ID,
                            'paid_amount' IS PAID_AMOUNT,
                            'safe_id' IS SAFE_ID,
                            'post_discount_total_amount' IS POST_DISCOUNT_TOTAL_AMOUNT,
                            'user_id' IS USER_ID,
                            'provider_id' IS PROVIDER_ID,
                            'total_discount' IS TOTAL_DISCOUNT,
                            'invoice_date' IS INVOICE_DATE,
                            'notes' IS NOTES,
                            'invoice_total_amount' IS INVOICE_TOTAL_AMOUNT,
                            'invoice_type' IS INVOICE_TYPE,
                            'total_quantity' IS TOTAL_QUANTITY,
                            'store_id' IS STORE_ID,
                            'pre_tax_total_amount' IS PRE_TAX_TOTAL_AMOUNT,
                            'company_id' IS COMPANY_ID,
                            'paid_bank_amount' IS PAID_BANK_AMOUNT,
                            'cost_ctr_id' IS COST_CTR_ID,
                            'client_discount' IS CLIENT_DISCOUNT,
                            'invoice_no' IS INVOICE_NO,
                            'total_vat' IS TOTAL_VAT,
                            'provider_inv_id' IS PROVIDER_INV_ID,
                            'payment_type' IS PAYMENT_TYPE,
                            'deferred_amount' IS DEFERRED_AMOUNT,
                            'provider_inv_date' IS PROVIDER_INV_DATE,
                            'store_date' IS STORE_DATE,
                            'paid_cash_amount' IS PAID_CASH_AMOUNT,
                            'branch_id' IS BRANCH_ID,
                            'items' IS (
                                            SELECT JSON_ARRAYAGG
                                                       ( JSON_OBJECT( 
                                                            KEY 'dtl_id' VALUE dtl_id,
                                                            KEY 'product_id' VALUE product_id,
                                                            KEY 'barcode' VALUE
                                                            (
                                                                SELECT BARCODE FROM SALES_PRODUCT 
                                                                where PRODUCT_ID  = dtl.product_id
                                                            ),
                                                            KEY 'unit_id' VALUE product_unit_id,
                                                            KEY 'quantity' VALUE quantity,
                                                            KEY 'base_price' VALUE price,
                                                            KEY 'total_price' VALUE total_price,
                                                            KEY 'discount_percentage' VALUE discount_percentage,
                                                            KEY 'discount_value' VALUE discount_value,
                                                            KEY 'post_discount_total_price' VALUE post_discount_total_price,
                                                            KEY 'vat_percentage' VALUE vat_percentage,
                                                            KEY 'vat_value' VALUE vat_value,
                                                            KEY 'total_amount' VALUE total_amount,
                                                            KEY 'pre_discount_vat_value' VALUE pre_discount_vat_value
                                                                    RETURNING CLOB
                                                                    )
                                                                    RETURNING CLOB
                                                      )
                                            FROM SALES_PUR_RETURN_INV_dtl dtl WHERE invoice_id = INV.invoice_id
                                        )
                RETURNING CLOB) JSON_DATA

        INTO V_RESPONSE
        FROM SALES_PUR_RETURN_INV INV
        WHERE INVOICE_ID = V_INVOICE_ID;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            return NULL;
    END;
    RETURN V_RESPONSE;

END;

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
    select to_char(P_INVOICE_DATE ,'yyyy-mm-dd"T"hh24:mi:ss"Z"')
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
--  DDL for Function GET_SALE_INVOICE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "GET_SALE_INVOICE" (
    P_FIRST       VARCHAR2,
    P_LAST        VARCHAR2,
    P_NEXT        VARCHAR2,
    P_PREV        VARCHAR2,
    P_INVOICE_ID  VARCHAR2
) RETURN CLOB AS
    V_INVOICE_ID    NUMBER;
    V_RESPONSE      CLOB;
BEGIN
    BEGIN
        IF p_first = '1' THEN
            SELECT MIN(INVOICE_ID)
            INTO V_INVOICE_ID
            FROM SALES_INV;
        ELSIF p_last = '1' THEN
            SELECT MAX(INVOICE_ID)
            INTO V_INVOICE_ID
            FROM SALES_INV;
        ELSIF p_next = '1' THEN
            SELECT INVOICE_ID
            INTO V_INVOICE_ID
            FROM SALES_INV
            WHERE INVOICE_ID > p_invoice_id
            ORDER BY INVOICE_ID ASC
            FETCH NEXT 1 ROWS ONLY;
        ELSIF p_prev = '1' THEN
            SELECT INVOICE_ID
            INTO V_INVOICE_ID
            FROM SALES_INV
            WHERE INVOICE_ID < p_invoice_id
            ORDER BY INVOICE_ID DESC
            FETCH NEXT 1 ROWS ONLY;
        ELSE
            V_INVOICE_ID := p_invoice_id;
        END IF;
        SELECT
                JSON_OBJECT(
                    'invoice_id' IS INVOICE_ID,
                            'bank_acc_id' IS BANK_ACC_ID,
                            'paid_amount' IS PAID_AMOUNT,
                            'safe_id' IS SAFE_ID,
                            'post_discount_total_amount' IS POST_DISCOUNT_TOTAL_AMOUNT,
                            'user_id' IS USER_ID,
                            'client_id' IS CLIENT_ID,
                            'total_discount' IS TOTAL_DISCOUNT,
                            'invoice_date' IS INVOICE_DATE,
                            'notes' IS NOTES,
                            'invoice_total_amount' IS INVOICE_TOTAL_AMOUNT,
                            'invoice_type' IS INVOICE_TYPE,
                            'total_quantity' IS TOTAL_QUANTITY,
                            'store_id' IS STORE_ID,
                            'pre_tax_total_amount' IS PRE_TAX_TOTAL_AMOUNT,
                            'company_id' IS COMPANY_ID,
                            'paid_bank_amount' IS PAID_BANK_AMOUNT,
                            'cost_ctr_id' IS COST_CTR_ID,
                            'client_discount' IS CLIENT_DISCOUNT,
                            'invoice_no' IS INVOICE_NO,
                            'total_vat' IS TOTAL_VAT,
                            'payment_type' IS PAYMENT_TYPE,
                            'deferred_amount' IS DEFERRED_AMOUNT,
                            'store_date' IS STORE_DATE,
                            'paid_cash_amount' IS PAID_CASH_AMOUNT,
                            'branch_id' IS BRANCH_ID,
                            'items' IS (
                                            SELECT JSON_ARRAYAGG
                                                       ( JSON_OBJECT( 
                                                            KEY 'dtl_id' VALUE invoice_dtl_id,
                                                            KEY 'product_id' VALUE product_id,
                                                            KEY 'barcode' VALUE
                                                            (
                                                                SELECT BARCODE FROM SALES_PRODUCT 
                                                                where PRODUCT_ID  = dtl.product_id
                                                            ),
                                                            KEY 'unit_id' VALUE product_unit_id,
                                                            KEY 'quantity' VALUE quantity,
                                                            KEY 'base_price' VALUE price,
                                                            KEY 'total_price' VALUE total_price,
                                                            KEY 'discount_percentage' VALUE discount_percentage,
                                                            KEY 'discount_value' VALUE discount_value,
                                                            KEY 'post_discount_total_price' VALUE post_discount_total_price,
                                                            KEY 'vat_percentage' VALUE vat_percentage,
                                                            KEY 'vat_value' VALUE vat_value,
                                                            KEY 'total_amount' VALUE total_amount,
                                                            KEY 'pre_discount_vat_value' VALUE pre_discount_vat_value
                                                                    RETURNING CLOB
                                                                    )
                                                                    RETURNING CLOB
                                                      )
                                            FROM sales_inv_dtl dtl WHERE invoice_id = INV.invoice_id
                                        )
                RETURNING CLOB) JSON_DATA

        INTO V_RESPONSE
        FROM SALES_INV INV
        WHERE INVOICE_ID = V_INVOICE_ID;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            return NULL;
    END;
    RETURN V_RESPONSE;

END;

/
--------------------------------------------------------
--  DDL for Function GET_SALE_RETURN_INVOICE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "GET_SALE_RETURN_INVOICE" (
    P_FIRST       VARCHAR2,
    P_LAST        VARCHAR2,
    P_NEXT        VARCHAR2,
    P_PREV        VARCHAR2,
    P_INVOICE_ID  VARCHAR2
) RETURN CLOB AS
    V_INVOICE_ID    NUMBER;
    V_RESPONSE      CLOB;
BEGIN
    BEGIN
        IF p_first = '1' THEN
            SELECT MIN(INVOICE_ID)
            INTO V_INVOICE_ID
            FROM SALES_RETURN_INV;
        ELSIF p_last = '1' THEN
            SELECT MAX(INVOICE_ID)
            INTO V_INVOICE_ID
            FROM SALES_RETURN_INV;
        ELSIF p_next = '1' THEN
            SELECT INVOICE_ID
            INTO V_INVOICE_ID
            FROM SALES_RETURN_INV
            WHERE INVOICE_ID > p_invoice_id
            ORDER BY INVOICE_ID ASC
            FETCH NEXT 1 ROWS ONLY;
        ELSIF p_prev = '1' THEN
            SELECT INVOICE_ID
            INTO V_INVOICE_ID
            FROM SALES_RETURN_INV
            WHERE INVOICE_ID < p_invoice_id
            ORDER BY INVOICE_ID DESC
            FETCH NEXT 1 ROWS ONLY;
        ELSE
            V_INVOICE_ID := p_invoice_id;
        END IF;
        SELECT
                JSON_OBJECT(
                    'invoice_id' IS INVOICE_ID,
                            'bank_acc_id' IS BANK_ACC_ID,
                            'paid_amount' IS PAID_AMOUNT,
                            'safe_id' IS SAFE_ID,
                            'post_discount_total_amount' IS POST_DISCOUNT_TOTAL_AMOUNT,
                            'user_id' IS USER_ID,
                            'client_id' IS CLIENT_ID,
                            'total_discount' IS TOTAL_DISCOUNT,
                            'invoice_date' IS INVOICE_DATE,
                            'notes' IS NOTES,
                            'invoice_total_amount' IS INVOICE_TOTAL_AMOUNT,
                            'invoice_type' IS INVOICE_TYPE,
                            'total_quantity' IS TOTAL_QUANTITY,
                            'store_id' IS STORE_ID,
                            'pre_tax_total_amount' IS PRE_TAX_TOTAL_AMOUNT,
                            'company_id' IS COMPANY_ID,
                            'paid_bank_amount' IS PAID_BANK_AMOUNT,
                            'cost_ctr_id' IS COST_CTR_ID,
                            'client_discount' IS CLIENT_DISCOUNT,
                            'invoice_no' IS INVOICE_NO,
                            'total_vat' IS TOTAL_VAT,
                            'payment_type' IS PAYMENT_TYPE,
                            'deferred_amount' IS DEFERRED_AMOUNT,
                            'store_date' IS STORE_DATE,
                            'paid_cash_amount' IS PAID_CASH_AMOUNT,
                            'branch_id' IS BRANCH_ID,
                            'items' IS (
                                            SELECT JSON_ARRAYAGG
                                                       ( JSON_OBJECT( 
                                                            KEY 'dtl_id' VALUE dtl_id,
                                                            KEY 'product_id' VALUE product_id,
                                                            KEY 'barcode' VALUE
                                                            (
                                                                SELECT BARCODE FROM SALES_PRODUCT 
                                                                where PRODUCT_ID  = dtl.product_id
                                                            ),
                                                            KEY 'unit_id' VALUE product_unit_id,
                                                            KEY 'quantity' VALUE quantity,
                                                            KEY 'base_price' VALUE price,
                                                            KEY 'total_price' VALUE total_price,
                                                            KEY 'discount_percentage' VALUE discount_percentage,
                                                            KEY 'discount_value' VALUE discount_value,
                                                            KEY 'post_discount_total_price' VALUE post_discount_total_price,
                                                            KEY 'vat_percentage' VALUE vat_percentage,
                                                            KEY 'vat_value' VALUE vat_value,
                                                            KEY 'total_amount' VALUE total_amount,
                                                            KEY 'pre_discount_vat_value' VALUE pre_discount_vat_value
                                                                    RETURNING CLOB
                                                                    )
                                                                    RETURNING CLOB
                                                      )
                                            FROM SALES_RETURN_INV_dtl dtl WHERE invoice_id = INV.invoice_id
                                        )
                RETURNING CLOB) JSON_DATA

        INTO V_RESPONSE
        FROM SALES_RETURN_INV INV
        WHERE INVOICE_ID = V_INVOICE_ID;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            return NULL;
    END;
    RETURN V_RESPONSE;

END;

/
--------------------------------------------------------
--  DDL for Function INCOME_STATEMENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "INCOME_STATEMENT" (
    P_COMPANY_ID   NUMBER,
    P_TO_DATE NVARCHAR2 ,
    P_FOR_MAIN_ACCS  NUMBER DEFAULT 0,
    P_COST_CNTR_ID   NUMBER DEFAULT 0
    )RETURN BAL_TABLE AS 

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
        WHERE COMPANY_ID = P_COMPANY_ID AND (COST_CNTR_ID=P_COST_CNTR_ID or P_COST_CNTR_ID=0)and JOURNAL_DATE < TO_DATE(P_TO_DATE,'DD-MM-YYYY')
        GROUP BY ACCOUNT_ID
        )
        select 
        ACC.ACCOUNT_ID,
        account_name_ar,
        ACCOUNT_NAME_en,
        ACCOUNT_PARENT,
        nvl(DEBIT_BAL,0) DEBIT_BAL,
        nvl(CREDIT_BAL,0) CREDIT_BAL
        from GL full outer join   acc_accounts acc
        on acc.ACCOUNT_ID = GL.ACCOUNT_ID
        where ACC.COMPANY_ID = P_COMPANY_ID AND ACC.SUB_ACCOUNT = 1 AND ACC.ACCOUNT_TYPE = 2
        order by acc.ACCOUNT_ID
    )
    LOOP
        V_INDEX := V_INDEX+1;
        V_BAL_TABLE.EXTEND;
        V_BAL_TABLE(V_INDEX) :=  BAL_REC(
            ACCOUNT_ID      => REC.ACCOUNT_ID,
            ACCOUNT_PARENT  => REC.ACCOUNT_PARENT,
            ACCOUNT_NAME_ar => REC.account_name_ar,
            ACCOUNT_NAME_en => REC.ACCOUNT_NAME_en,
            DEBIT_BAL       => REC.DEBIT_BAL,
            CREDIT_BAL      => REC.CREDIT_BAL,
            BAL             => null,
            BAL_NATURE      => null
        );
    END LOOP;
    V_BAL_TABLE_PERENT := V_BAL_TABLE;
    WHILE NVL(P_FOR_MAIN_ACCS,0) = 1 AND V_LEVEL_NO > 0 LOOP

        V_INDEX_TEMP := 0;
        FOR REC IN (
            select 
            ACC.ACCOUNT_ID,
            ACC.account_name_ar,
            ACC.account_name_en,
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
            WHERE acc.COMPANY_ID = P_COMPANY_ID
        )LOOP
            V_BAL_REC := BAL_REC(
                ACCOUNT_ID      => REC.ACCOUNT_ID,
                ACCOUNT_PARENT  => REC.ACCOUNT_PARENT,
                ACCOUNT_NAME_ar => REC.account_name_ar,
                ACCOUNT_NAME_en => REC.ACCOUNT_NAME_en,
                DEBIT_BAL       => REC.DEBIT_BAL,
                CREDIT_BAL      => REC.CREDIT_BAL,
                BAL             => null,
                BAL_NATURE      => null
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
--  DDL for Function INVOICE_TOTAL_BY_CLIENT_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "INVOICE_TOTAL_BY_CLIENT_R" (
    P_FROM_DATE    VARCHAR2,
    P_TO_DATE      VARCHAR2,
	p_COMPANY_ID   NUMBER,
	P_CLIENT_ID    NUMBER
) RETURN INVOICE_TOTAL_BY_CLIENT_TBL AS 
  
    V_INVOICE_TOTAL_BY_CLIENT_REC INVOICE_TOTAL_BY_CLIENT_REC := INVOICE_TOTAL_BY_CLIENT_REC(
        INVOICE_NO                  => NULL,
        INVOICE_DATE                => NULL,
        INVOICE_TYPE_AR            => NULL,
		INVOICE_TYPE_EN          =>NULL,
		CLIENT_NAME_AR            => NULL,
		CLIENT_NAME_EN          =>NULL,
		INVOICE_TYPE             =>NULL,
		PURCHASE_TOTAL           =>NULL,
		SALES_TOTAL              =>NULL
    );
    V_INVOICE_TOTAL_BY_CLIENT_TBL INVOICE_TOTAL_BY_CLIENT_TBL := INVOICE_TOTAL_BY_CLIENT_TBL();
    V_INDEX NUMBER := 0;
BEGIN

        FOR REC IN (
            SELECT
                I.INVOICE_NO,
				to_char(I.INVOICE_DATE,'dd-MM-yyyy')  AS INVOICE_DATE,
				INVOICE_TOTAL_AMOUNT,
				INVOICE_TYPE,
				C.NAME_AR,
				C.NAME_EN
            FROM SALES_INV I ,SALES_CLIENT C
            WHERE I.CLIENT_ID=C.CLIENT_ID 
			AND I.CLIENT_ID=P_CLIENT_ID
			AND I.COMPANY_ID=P_COMPANY_ID   AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
            )

        LOOP
		V_INVOICE_TOTAL_BY_CLIENT_REC.INVOICE_NO                  :=REC.INVOICE_NO ;
        V_INVOICE_TOTAL_BY_CLIENT_REC.INVOICE_DATE                :=REC.INVOICE_DATE ;
        V_INVOICE_TOTAL_BY_CLIENT_REC.PURCHASE_TOTAL              :=0 ;
        V_INVOICE_TOTAL_BY_CLIENT_REC.SALES_TOTAL                 :=REC.INVOICE_TOTAL_AMOUNT ;
        V_INVOICE_TOTAL_BY_CLIENT_REC.INVOICE_TYPE                :=REC.INVOICE_TYPE ;
		V_INVOICE_TOTAL_BY_CLIENT_REC.CLIENT_NAME_AR                 :=REC.NAME_AR ;
        V_INVOICE_TOTAL_BY_CLIENT_REC.CLIENT_NAME_EN                :=REC.NAME_EN ;

		SELECT
			  ITEM_NOTE_AR  INV_TYPE_AR,
			  ITEM_NOTE_EN  INV_TYPE_EN
		INTO 
		      V_INVOICE_TOTAL_BY_CLIENT_REC.INVOICE_TYPE_AR        ,
              V_INVOICE_TOTAL_BY_CLIENT_REC.INVOICE_TYPE_EN 
		FROM
			ADMIN_LIST_ITEM
		WHERE LIST_ID = 5 AND ITEM_NO = REC.INVOICE_TYPE;

            V_INVOICE_TOTAL_BY_CLIENT_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_INVOICE_TOTAL_BY_CLIENT_TBL(V_INDEX) := V_INVOICE_TOTAL_BY_CLIENT_REC;
        END LOOP;


    RETURN V_INVOICE_TOTAL_BY_CLIENT_TBL;
END INVOICE_TOTAL_BY_CLIENT_R;


/
--------------------------------------------------------
--  DDL for Function INVOICE_TOTAL_BY_TYPE_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "INVOICE_TOTAL_BY_TYPE_R" (
    P_FROM_DATE    VARCHAR2,
    P_TO_DATE      VARCHAR2,
	p_COMPANY_ID   NUMBER
) RETURN INVOICE_TOTAL_BY_TYPE_TBL AS 
  
    V_INVOICE_TOTAL_BY_TYPE_REC INVOICE_TOTAL_BY_TYPE_REC := INVOICE_TOTAL_BY_TYPE_REC(
        INVOICE_NO                  => NULL,
        INVOICE_DATE                => NULL,
        INVOICE_TYPE_AR            => NULL,
		INVOICE_TYPE_EN          =>NULL,
		INVOICE_TYPE             =>NULL,
		PURCHASE_TOTAL           =>NULL,
		SALES_TOTAL              =>NULL
    );
    V_INVOICE_TOTAL_BY_TYPE_TBL INVOICE_TOTAL_BY_TYPE_TBL := INVOICE_TOTAL_BY_TYPE_TBL();
    V_INDEX NUMBER := 0;
BEGIN

        FOR REC IN (
            SELECT
                I.INVOICE_NO,
				to_char(I.INVOICE_DATE,'dd-MM-yyyy')  AS INVOICE_DATE,
				INVOICE_TOTAL_AMOUNT,
				INVOICE_TYPE
            FROM SALES_INV I 
            WHERE I.COMPANY_ID=P_COMPANY_ID   AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')

            )

        LOOP
		V_INVOICE_TOTAL_BY_TYPE_REC.INVOICE_NO                  :=REC.INVOICE_NO ;
        V_INVOICE_TOTAL_BY_TYPE_REC.INVOICE_DATE                :=REC.INVOICE_DATE ;
        V_INVOICE_TOTAL_BY_TYPE_REC.PURCHASE_TOTAL              :=0 ;
        V_INVOICE_TOTAL_BY_TYPE_REC.SALES_TOTAL                 :=REC.INVOICE_TOTAL_AMOUNT ;
        V_INVOICE_TOTAL_BY_TYPE_REC.INVOICE_TYPE                :=REC.INVOICE_TYPE ;

		SELECT
			  ITEM_NOTE_AR  INV_TYPE_AR,
			  ITEM_NOTE_EN  INV_TYPE_EN
		INTO 
		      V_INVOICE_TOTAL_BY_TYPE_REC.INVOICE_TYPE_AR        ,
              V_INVOICE_TOTAL_BY_TYPE_REC.INVOICE_TYPE_EN 
		FROM
			ADMIN_LIST_ITEM
		WHERE LIST_ID = 5 AND ITEM_NO = REC.INVOICE_TYPE;

            V_INVOICE_TOTAL_BY_TYPE_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_INVOICE_TOTAL_BY_TYPE_TBL(V_INDEX) := V_INVOICE_TOTAL_BY_TYPE_REC;
        END LOOP;

		FOR REC IN (
            SELECT
                I.INVOICE_NO,
				to_char(I.INVOICE_DATE,'dd-MM-yyyy')  AS INVOICE_DATE,
				INVOICE_TOTAL_AMOUNT,
				INVOICE_TYPE
            FROM SALES_PURCHASE_INV I 
            WHERE I.COMPANY_ID=P_COMPANY_ID   AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')

            )

        LOOP
		V_INVOICE_TOTAL_BY_TYPE_REC.INVOICE_NO                  :=REC.INVOICE_NO ;
        V_INVOICE_TOTAL_BY_TYPE_REC.INVOICE_DATE                :=REC.INVOICE_DATE ;
        V_INVOICE_TOTAL_BY_TYPE_REC.PURCHASE_TOTAL              :=REC.INVOICE_TOTAL_AMOUNT;
        V_INVOICE_TOTAL_BY_TYPE_REC.SALES_TOTAL                 :=0;
        V_INVOICE_TOTAL_BY_TYPE_REC.INVOICE_TYPE                :=REC.INVOICE_TYPE ;

		SELECT
			  ITEM_NOTE_AR  INV_TYPE_AR,
			  ITEM_NOTE_EN  INV_TYPE_EN
		INTO 
		      V_INVOICE_TOTAL_BY_TYPE_REC.INVOICE_TYPE_AR        ,
              V_INVOICE_TOTAL_BY_TYPE_REC.INVOICE_TYPE_EN 
		FROM
			ADMIN_LIST_ITEM
		WHERE LIST_ID = 5 AND ITEM_NO = REC.INVOICE_TYPE;

            V_INVOICE_TOTAL_BY_TYPE_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_INVOICE_TOTAL_BY_TYPE_TBL(V_INDEX) := V_INVOICE_TOTAL_BY_TYPE_REC;
        END LOOP;

    RETURN V_INVOICE_TOTAL_BY_TYPE_TBL;
END INVOICE_TOTAL_BY_TYPE_R;


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
--  DDL for Function PRODUCT_TRANS_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRODUCT_TRANS_R" (
    P_COMPANY_ID   NUMBER,
    P_FROM_DATE   VARCHAR2,
    P_TO_DATE     VARCHAR2,
    P_STORE_ID    NUMBER DEFAULT 0,
    P_PRODUCT_ID  NUMBER DEFAULT 0
) RETURN SALES_PURCHASES_DETAILS_TBL AS 
    V_SALES_PURCHASES_DETAILS_REC SALES_PURCHASES_DETAILS_REC := SALES_PURCHASES_DETAILS_REC(
        TRANS_TYPE_AR    => NULL,
        TRANS_TYPE_EN    => NULL,
        PRODUCT_NAME_AR  => NULL,
        PRODUCT_NAME_EN  => NULL,
        STORE_NAME_AR    => NULL,
        STORE_NAME_EN    => NULL,
        PRO_NAME_AR      => NULL,
        PRO_NAME_EN      => NULL,
        INVOICE_NO       => NULL,
        INVOICE_DATE     => NULL,
        QUANTITY         => NULL,
        PRICE            => NULL,
        VAT_VALUE        => NULL,
        TOTAL_AMOUNT     => NULL
    );
    V_SALES_PURCHASES_DETAILS_TBL SALES_PURCHASES_DETAILS_TBL := SALES_PURCHASES_DETAILS_TBL();
    V_INDEX NUMBER := 0;
BEGIN
    FOR REC IN (
        SELECT
            'فاتورة بيع'                           TRANS_TYPE_AR,
            'Sales Invoice'                        TRANS_TYPE_EN,
            NVL(S.STORE_NAME_AR,S.STORE_NAME_EN)                        STORE_NAME_AR,
            NVL(S.STORE_NAME_EN,S.STORE_NAME_AR)                        STORE_NAME_EN,
            I.INVOICE_NO                           INVOICE_NO,
            TO_CHAR(I.INVOICE_DATE,'dd-MM-yyyy')   INVOICE_DATE,
            D.QUANTITY                             QUANTITY,
            D.PRICE                                PRICE,
            D.TOTAL_PRICE                          TOTAL_PRICE
        FROM
            SALES_INV_DTL D JOIN SALES_INV I ON D.INVOICE_ID= I.INVOICE_ID 
            JOIN SETUP_STORE S ON I.STORE_ID = S.STORE_ID
            WHERE I.COMPANY_ID = P_COMPANY_ID AND  (S.STORE_ID= P_STORE_ID OR P_STORE_ID = 0) 
                AND (D.PRODUCT_ID = P_PRODUCT_ID OR P_PRODUCT_ID = 0) 
                AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') 
                AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
        UNION ALL        
        SELECT
            'فاتورة مردود بيع'                           TRANS_TYPE_AR,
            'Sales Return Invoice'                        TRANS_TYPE_EN,
            NVL(S.STORE_NAME_AR,S.STORE_NAME_EN)                        STORE_NAME_AR,
            NVL(S.STORE_NAME_EN,S.STORE_NAME_AR)                        STORE_NAME_EN,
            I.INVOICE_NO                           INVOICE_NO,
            TO_CHAR(I.INVOICE_DATE,'dd-MM-yyyy')   INVOICE_DATE,
            D.QUANTITY                             QUANTITY,
            D.PRICE                                PRICE,
            D.TOTAL_PRICE                          TOTAL_PRICE
        FROM
            SALES_RETURN_INV_DTL D JOIN SALES_RETURN_INV I ON D.INVOICE_ID= I.INVOICE_ID 
            JOIN SETUP_STORE S ON I.STORE_ID = S.STORE_ID
            WHERE I.COMPANY_ID = P_COMPANY_ID AND  (S.STORE_ID= P_STORE_ID OR P_STORE_ID = 0) 
                AND (D.PRODUCT_ID = P_PRODUCT_ID OR P_PRODUCT_ID = 0) 
                AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') 
                AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
        UNION ALL        

        SELECT
            'فاتورة شراء'                           TRANS_TYPE_AR,
            'Purchase Invoice'                        TRANS_TYPE_EN,
            NVL(S.STORE_NAME_AR,S.STORE_NAME_EN)                        STORE_NAME_AR,
            NVL(S.STORE_NAME_EN,S.STORE_NAME_AR)                        STORE_NAME_EN,
            I.INVOICE_NO                           INVOICE_NO,
            TO_CHAR(I.INVOICE_DATE,'dd-MM-yyyy')   INVOICE_DATE,
            D.QUANTITY                             QUANTITY,
            D.PRICE                                PRICE,
            D.TOTAL_PRICE                          TOTAL_PRICE
        FROM
            SALES_PURCHASE_INV_DTL D JOIN SALES_PURCHASE_INV I ON D.INVOICE_ID= I.INVOICE_ID 
            JOIN SETUP_STORE S ON I.STORE_ID = S.STORE_ID
            WHERE I.COMPANY_ID = P_COMPANY_ID AND  (S.STORE_ID= P_STORE_ID OR P_STORE_ID = 0) 
                AND (D.PRODUCT_ID = P_PRODUCT_ID OR P_PRODUCT_ID = 0) 
                AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') 
                AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
        UNION ALL        
        SELECT
            'فاتورة مردود شراء'                           TRANS_TYPE_AR,
            'Purchase Return Invoice'                        TRANS_TYPE_EN,
            NVL(S.STORE_NAME_AR,S.STORE_NAME_EN)                        STORE_NAME_AR,
            NVL(S.STORE_NAME_EN,S.STORE_NAME_AR)                        STORE_NAME_EN,
            I.INVOICE_NO                           INVOICE_NO,
            TO_CHAR(I.INVOICE_DATE,'dd-MM-yyyy')   INVOICE_DATE,
            D.QUANTITY                             QUANTITY,
            D.PRICE                                PRICE,
            D.TOTAL_PRICE                          TOTAL_PRICE
        FROM
            SALES_PUR_RETURN_INV_DTL D JOIN SALES_PUR_RETURN_INV I ON D.INVOICE_ID= I.INVOICE_ID 
            JOIN SETUP_STORE S ON I.STORE_ID = S.STORE_ID
            WHERE I.COMPANY_ID = P_COMPANY_ID AND  (S.STORE_ID= P_STORE_ID OR P_STORE_ID = 0) 
                AND (D.PRODUCT_ID = P_PRODUCT_ID OR P_PRODUCT_ID = 0) 
                AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') 
                AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
        UNION ALL        
        SELECT
            'توريد مخزني'                           TRANS_TYPE_AR,
            'Stock In'                        TRANS_TYPE_EN,
            NVL(S.STORE_NAME_AR,S.STORE_NAME_EN)                        STORE_NAME_AR,
            NVL(S.STORE_NAME_EN,S.STORE_NAME_AR)                        STORE_NAME_EN,
            I.ORDER_NO                           INVOICE_NO,
            TO_CHAR(I.ORDER_DATE,'dd-MM-yyyy')   INVOICE_DATE,
            D.QUANTITY                             QUANTITY,
            D.PRICE                                PRICE,
            D.TOTAL                          TOTAL_PRICE
        FROM
            STORE_STOCKIN_ORDER_DTL D JOIN STORE_STOCKIN_ORDER I ON D.ORDER_ID= I.ORDER_ID 
            JOIN SETUP_STORE S ON I.STORE_ID = S.STORE_ID
            WHERE I.COMPANY_ID = P_COMPANY_ID AND  (S.STORE_ID= P_STORE_ID OR P_STORE_ID = 0) 
                AND (D.PRODUCT_ID = P_PRODUCT_ID OR P_PRODUCT_ID = 0) 
                AND ORDER_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') 
                AND ORDER_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
        UNION ALL        
        SELECT
            'صرف مخزني'                           TRANS_TYPE_AR,
            'Stock Out'                        TRANS_TYPE_EN,
            NVL(S.STORE_NAME_AR,S.STORE_NAME_EN)                        STORE_NAME_AR,
            NVL(S.STORE_NAME_EN,S.STORE_NAME_AR)                        STORE_NAME_EN,
            I.ORDER_NO                           INVOICE_NO,
            TO_CHAR(I.ORDER_DATE,'dd-MM-yyyy')   INVOICE_DATE,
            D.QUANTITY                             QUANTITY,
            D.PRICE                                PRICE,
            D.TOTAL                          TOTAL_PRICE
        FROM
            STORE_STOCKOUT_ORDER_DTL D JOIN STORE_STOCKOUT_ORDER I ON D.ORDER_ID= I.ORDER_ID 
            JOIN SETUP_STORE S ON I.STORE_ID = S.STORE_ID
            WHERE I.COMPANY_ID = P_COMPANY_ID AND  (S.STORE_ID= P_STORE_ID OR P_STORE_ID = 0) 
                AND (D.PRODUCT_ID = P_PRODUCT_ID OR P_PRODUCT_ID = 0) 
                AND ORDER_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') 
                AND ORDER_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
        UNION ALL        
        SELECT
            'مخزون اول المدة'                           TRANS_TYPE_AR,
            'First Period Stock'                        TRANS_TYPE_EN,
            NVL(S.STORE_NAME_AR,S.STORE_NAME_EN)                        STORE_NAME_AR,
            NVL(S.STORE_NAME_EN,S.STORE_NAME_AR)                        STORE_NAME_EN,
            I.INVOICE_NO                           INVOICE_NO,
            TO_CHAR(I.INVOICE_DATE,'dd-MM-yyyy')   INVOICE_DATE,
            D.QUANTITY                             QUANTITY,
            D.PRICE                                PRICE,
            D.TOTAL_AMOUNT                          TOTAL_PRICE
        FROM
            STORE_FIRST_PERIOD_STOCK_DTL D JOIN STORE_FIRST_PERIOD_STOCK I ON D.INVOICE_ID= I.INVOICE_ID 
            JOIN SETUP_STORE S ON I.STORE_ID = S.STORE_ID
            WHERE I.COMPANY_ID = P_COMPANY_ID AND  (S.STORE_ID= P_STORE_ID OR P_STORE_ID = 0) 
                AND (D.PRODUCT_ID = P_PRODUCT_ID OR P_PRODUCT_ID = 0) 
                AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') 
                AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
        UNION ALL        
        SELECT
            'محول منه'                           TRANS_TYPE_AR,
            'Transfered From'                        TRANS_TYPE_EN,
            NVL(S.STORE_NAME_AR,S.STORE_NAME_EN)                        STORE_NAME_AR,
            NVL(S.STORE_NAME_EN,S.STORE_NAME_AR)                        STORE_NAME_EN,
            I.TRANSFER_NO                           INVOICE_NO,
            TO_CHAR(I.TRANSFER_DATE,'dd-MM-yyyy')   INVOICE_DATE,
            D.QUANTITY                             QUANTITY,
            D.PRICE                                PRICE,
            D.QUANTITY*D.PRICE                          TOTAL_PRICE
        FROM
            STORE_TRANSFER_DTL D JOIN STORE_TRANSFER I ON D.TRANSFER_ID= I.TRANSFER_ID 
            JOIN SETUP_STORE S ON I.FROM_STORE_ID = S.STORE_ID
            WHERE I.COMPANY_ID = P_COMPANY_ID AND  (S.STORE_ID= P_STORE_ID OR P_STORE_ID = 0) 
                AND (D.PRODUCT_ID = P_PRODUCT_ID OR P_PRODUCT_ID = 0) 
                AND TRANSFER_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') 
                AND TRANSFER_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
        UNION ALL        
        SELECT
            'محول اليه'                           TRANS_TYPE_AR,
            'Transfered To'                        TRANS_TYPE_EN,
            NVL(S.STORE_NAME_AR,S.STORE_NAME_EN)                        STORE_NAME_AR,
            NVL(S.STORE_NAME_EN,S.STORE_NAME_AR)                        STORE_NAME_EN,
            I.TRANSFER_NO                           INVOICE_NO,
            TO_CHAR(I.TRANSFER_DATE,'dd-MM-yyyy')   INVOICE_DATE,
            D.QUANTITY                             QUANTITY,
            D.PRICE                                PRICE,
            D.QUANTITY*D.PRICE                          TOTAL_PRICE
        FROM
            STORE_TRANSFER_DTL D JOIN STORE_TRANSFER I ON D.TRANSFER_ID= I.TRANSFER_ID 
            JOIN SETUP_STORE S ON I.TO_STORE_ID = S.STORE_ID
            WHERE I.COMPANY_ID = P_COMPANY_ID AND  (S.STORE_ID= P_STORE_ID OR P_STORE_ID = 0) 
                AND (D.PRODUCT_ID = P_PRODUCT_ID OR P_PRODUCT_ID = 0) 
                AND TRANSFER_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') 
                AND TRANSFER_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
        )
    LOOP
        V_SALES_PURCHASES_DETAILS_REC.TRANS_TYPE_AR		:= REC.TRANS_TYPE_AR   ;
        V_SALES_PURCHASES_DETAILS_REC.TRANS_TYPE_EN		:= REC.TRANS_TYPE_EN   ;
        V_SALES_PURCHASES_DETAILS_REC.STORE_NAME_AR  	:= REC.STORE_NAME_AR   ;
        V_SALES_PURCHASES_DETAILS_REC.STORE_NAME_EN  	:= REC.STORE_NAME_EN   ;
        V_SALES_PURCHASES_DETAILS_REC.INVOICE_NO     	:= REC.INVOICE_NO      ;
        V_SALES_PURCHASES_DETAILS_REC.INVOICE_DATE   	:= REC.INVOICE_DATE    ;
        V_SALES_PURCHASES_DETAILS_REC.QUANTITY       	:= REC.QUANTITY        ;
        V_SALES_PURCHASES_DETAILS_REC.PRICE          	:= ROUND(REC.PRICE,2)           ;
        V_SALES_PURCHASES_DETAILS_REC.TOTAL_AMOUNT     	:= ROUND(REC.TOTAL_PRICE,2)     ;
        V_SALES_PURCHASES_DETAILS_TBL.EXTEND;
        V_INDEX := V_INDEX+1;
        V_SALES_PURCHASES_DETAILS_TBL(V_INDEX) := V_SALES_PURCHASES_DETAILS_REC;
    END LOOP;

    RETURN V_SALES_PURCHASES_DETAILS_TBL;
END PRODUCT_TRANS_R;


/
--------------------------------------------------------
--  DDL for Function PURCHASES_PRODUCT_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PURCHASES_PRODUCT_R" (
    P_FROM_DATE    VARCHAR2,
    P_TO_DATE      VARCHAR2,
	p_COMPANY_ID   NUMBER
) RETURN PURCHASES_PRODUCT_TBL AS 
  
    V_PURCHASES_PRODUCT_REC PURCHASES_PRODUCT_REC := PURCHASES_PRODUCT_REC(
        PRODUCT_ID                  => NULL,
		PRODUCT_NO                  => NULL,
        PRODUCT_NAME_AR             => NULL,
		PRODUCT_NAME_EN             =>NULL,
		BARCODE                     => NULL,
		PURCHASE_QUANTITY_TOTAL     =>NULL,
		PURCHASE_AMOUNT_TOTAL       =>NULL
    );
    V_PURCHASES_PRODUCT_TBL PURCHASES_PRODUCT_TBL := PURCHASES_PRODUCT_TBL();
    V_INDEX NUMBER := 0;
BEGIN

        FOR REC IN (
            SELECT
			P.PRODUCT_ID,
			P.PRODUCT_NO,
			P.BARCODE,
            P.PRODUCT_NAME_AR PRODUCT_NAME_AR,
            P.PRODUCT_NAME_EN PRODUCT_NAME_EN,
            NVL(SUM(D.QUANTITY),0) QUANTITY,
            NVL(SUM(D.TOTAL_AMOUNT),0) TOTAL_AMOUNT
        FROM
            SALES_PURCHASE_INV_DTL D JOIN SALES_PURCHASE_INV I ON D.INVOICE_ID= I.INVOICE_ID 
            JOIN SALES_PRODUCT P ON D.PRODUCT_ID = P.PRODUCT_ID 
            WHERE I.COMPANY_ID= p_COMPANY_ID  AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
            GROUP BY P.PRODUCT_ID,P.PRODUCT_NO,P.BARCODE,P.PRODUCT_NAME_AR,P.PRODUCT_NAME_EN)
        LOOP
		V_PURCHASES_PRODUCT_REC.PRODUCT_ID                  :=REC.PRODUCT_ID ;
        V_PURCHASES_PRODUCT_REC.PRODUCT_NO                  :=REC.PRODUCT_NO ;
        V_PURCHASES_PRODUCT_REC.PRODUCT_NAME_AR             :=REC.PRODUCT_NAME_AR ;
        V_PURCHASES_PRODUCT_REC.PRODUCT_NAME_EN             :=REC.PRODUCT_NAME_EN ;
        V_PURCHASES_PRODUCT_REC.BARCODE                     :=REC.BARCODE ;
		V_PURCHASES_PRODUCT_REC.PURCHASE_QUANTITY_TOTAL        :=REC.QUANTITY ;
        V_PURCHASES_PRODUCT_REC.PURCHASE_AMOUNT_TOTAL          :=REC.TOTAL_AMOUNT ;

            V_PURCHASES_PRODUCT_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_PURCHASES_PRODUCT_TBL(V_INDEX) := V_PURCHASES_PRODUCT_REC;
        END LOOP;


    RETURN V_PURCHASES_PRODUCT_TBL;
END PURCHASES_PRODUCT_R;


/
--------------------------------------------------------
--  DDL for Function PURCHASES_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PURCHASES_R" (
    P_COMPANY_ID   NUMBER,
    P_FROM_DATE    VARCHAR2,
    P_TO_DATE      VARCHAR2,
    P_BRANCH_ID    NUMBER DEFAULT 0
) RETURN SALES_PURCHASE_TBL AS 
    V_SALES_PURCHASE_REC SALES_PURCHASE_REC := SALES_PURCHASE_REC(
        TRANS_TYPE_AR       => NULL,
        TRANS_TYPE_EN       => NULL,
        C_NAME_AR           => NULL,
        C_NAME_EN           => NULL,
        INVOICE_DATE        => NULL,
        INVOICE_NO          => NULL,
        PRE_TAX_AMOUNT      => NULL,
        VAT_VALUE           => NULL,
        TOTAL_AMOUNT        => NULL,
        C_TAX_NO            => NULL,
        PROVIDER_INV_ID     => NULL,
        PRE_DISCOUNT_AMOUNT => NULL,
        TOTAL_DISCOUNT      => NULL
    );
    V_SALES_PURCHASE_TBL SALES_PURCHASE_TBL := SALES_PURCHASE_TBL();
    V_INDEX NUMBER := 0;
BEGIN
    FOR REC IN (
        SELECT
            'شراء'                              TRANS_TYPE_AR,
            'Purchase'                          TRANS_TYPE_EN,
            TO_CHAR(INVOICE_DATE,'dd-mm-yyyy')  INVOICE_DATE,
            INVOICE_NO                          INVOICE_NO,
            POST_DISCOUNT_TOTAL_AMOUNT          PRE_TAX_AMOUNT,
            TOTAL_VAT                           VAT_VALUE,
            INVOICE_TOTAL_AMOUNT                TOTAL_AMOUNT,
            C.NAME_AR                           C_NAME_AR,
            C.NAME_EN                           C_NAME_EN,
            PRE_TAX_TOTAL_AMOUNT                PRE_DISCOUNT_AMOUNT,
            TOTAL_DISCOUNT                      TOTAL_DISCOUNT,
            C.TAX_NO                            C_TAX_NO,
            INV.PROVIDER_INV_ID                 PROVIDER_INV_ID
        FROM
            SALES_PURCHASE_INV INV left JOIN SALES_PROVIDER C ON INV.PROVIDER_ID = C.PROVIDER_ID
            WHERE INV.COMPANY_ID = P_COMPANY_ID AND (BRANCH_ID = NVL(P_BRANCH_ID,0) OR NVL(P_BRANCH_ID,0) = 0) AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
    )
    LOOP
        V_SALES_PURCHASE_REC.TRANS_TYPE_AR          := REC.TRANS_TYPE_AR;
        V_SALES_PURCHASE_REC.TRANS_TYPE_EN          := REC.TRANS_TYPE_EN;
        V_SALES_PURCHASE_REC.INVOICE_NO             := REC.INVOICE_NO;
        V_SALES_PURCHASE_REC.INVOICE_DATE           := REC.INVOICE_DATE;
        V_SALES_PURCHASE_REC.PRE_TAX_AMOUNT         := REC.PRE_TAX_AMOUNT;
        V_SALES_PURCHASE_REC.VAT_VALUE              := REC.VAT_VALUE;
        V_SALES_PURCHASE_REC.TOTAL_AMOUNT           := REC.TOTAL_AMOUNT;
        V_SALES_PURCHASE_REC.C_NAME_AR              := REC.C_NAME_AR;
        V_SALES_PURCHASE_REC.C_NAME_EN              := REC.C_NAME_EN;
        V_SALES_PURCHASE_REC.PRE_DISCOUNT_AMOUNT    := REC.PRE_DISCOUNT_AMOUNT;
        V_SALES_PURCHASE_REC.TOTAL_DISCOUNT         := REC.TOTAL_DISCOUNT;
        V_SALES_PURCHASE_REC.C_TAX_NO               := REC.C_TAX_NO;
        V_SALES_PURCHASE_REC.PROVIDER_INV_ID        := REC.PROVIDER_INV_ID;
        V_SALES_PURCHASE_TBL.EXTEND;
        V_INDEX := V_INDEX+1;
        V_SALES_PURCHASE_TBL(V_INDEX) := V_SALES_PURCHASE_REC;
    END LOOP;

    FOR REC IN (
        SELECT
            'مردود شراء'                    TRANS_TYPE_AR,
            'Purchase Return'                   TRANS_TYPE_EN,
            TO_CHAR(INVOICE_DATE,'dd-mm-yyyy')  INVOICE_DATE,
            INVOICE_NO                          INVOICE_NO,
            POST_DISCOUNT_TOTAL_AMOUNT          PRE_TAX_AMOUNT,
            TOTAL_VAT                           VAT_VALUE,
            INVOICE_TOTAL_AMOUNT                TOTAL_AMOUNT,
            C.NAME_AR                           C_NAME_AR,
            C.NAME_EN                           C_NAME_EN,
            PRE_TAX_TOTAL_AMOUNT                PRE_DISCOUNT_AMOUNT,
            TOTAL_DISCOUNT                      TOTAL_DISCOUNT,
            C.TAX_NO                            C_TAX_NO,
            I.PROVIDER_INV_ID                   PROVIDER_INV_ID
        FROM SALES_PUR_RETURN_INV I left JOIN SALES_PROVIDER C ON I.PROVIDER_ID = C.PROVIDER_ID
        WHERE I.COMPANY_ID = P_COMPANY_ID AND (BRANCH_ID = NVL(P_BRANCH_ID,0) OR NVL(P_BRANCH_ID,0) = 0) AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
    )
    LOOP
        V_SALES_PURCHASE_REC.TRANS_TYPE_AR          := REC.TRANS_TYPE_AR;
        V_SALES_PURCHASE_REC.TRANS_TYPE_EN          := REC.TRANS_TYPE_EN;
        V_SALES_PURCHASE_REC.INVOICE_NO             := REC.INVOICE_NO;
        V_SALES_PURCHASE_REC.INVOICE_DATE           := REC.INVOICE_DATE;
        V_SALES_PURCHASE_REC.PRE_TAX_AMOUNT         := REC.PRE_TAX_AMOUNT;
        V_SALES_PURCHASE_REC.VAT_VALUE              := REC.VAT_VALUE;
        V_SALES_PURCHASE_REC.TOTAL_AMOUNT           := REC.TOTAL_AMOUNT;
        V_SALES_PURCHASE_REC.C_NAME_AR              := REC.C_NAME_AR;
        V_SALES_PURCHASE_REC.C_NAME_EN              := REC.C_NAME_EN;
        V_SALES_PURCHASE_REC.PRE_DISCOUNT_AMOUNT    := REC.PRE_DISCOUNT_AMOUNT;
        V_SALES_PURCHASE_REC.TOTAL_DISCOUNT         := REC.TOTAL_DISCOUNT;
        V_SALES_PURCHASE_REC.C_TAX_NO               := REC.C_TAX_NO;
        V_SALES_PURCHASE_REC.PROVIDER_INV_ID        := REC.PROVIDER_INV_ID;
        V_SALES_PURCHASE_TBL.EXTEND;
        V_INDEX := V_INDEX+1;
        V_SALES_PURCHASE_TBL(V_INDEX) := V_SALES_PURCHASE_REC;
    END LOOP;
    RETURN V_SALES_PURCHASE_TBL;
END PURCHASES_R;


/
--------------------------------------------------------
--  DDL for Function SALES_EMP_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "SALES_EMP_R" (
    P_FROM_DATE    VARCHAR2,
    P_TO_DATE      VARCHAR2,
	p_COMPANY_ID   NUMBER,
	P_USER_ID    NUMBER
) RETURN SALES_EMP_TBL AS 
  
    V_SALES_EMP_REC SALES_EMP_REC := SALES_EMP_REC(
	    TRANS_TYPE_AR                      => NULL,
        TRANS_TYPE_EN                      => NULL,
		INVOICE_DATE                       => NULL,
		INVOICE_NO                         => NULL,
		USER_ID                            => NULL,
		USER_NAME                          => NULL,
        PRODUCT_ID                         => NULL,
		PRODUCT_NO                         => NULL,
        PRODUCT_NAME_AR                    => NULL,
		PRODUCT_NAME_EN                    => NULL,
		BARCODE                            => NULL,
		QUANTITY                           => NULL,
		PRICE                              => NULL,
		TOTAL_AMOUNT                       => NULL,
		SALES_TOTAL                     => NULL,
		CASH_SALES_SUM                     => NULL,
		BANK_SALES_SUM                     => NULL,
		DEFERRED_SALES_SUM                 => NULL,
		TAX_SALES_SUM                      => NULL,
		SALES_RETURN_TOTAL                     => NULL,
		CASH_SALES_RETURN_SUM              => NULL,
		BANK_SALES_RETURN_SUM              => NULL,
		DEFERRED_SALES_RETURN_SUM          => NULL,
		TAX_SALES_RETURN_SUM               => NULL
    );
    V_SALES_EMP_TBL SALES_EMP_TBL := SALES_EMP_TBL();
    V_INDEX NUMBER := 0;
    v_sales number;
	V_SALES_TOTAL               NUMBER; 
	V_CASH_SALES_SUM                NUMBER;     
	V_BANK_SALES_SUM                NUMBER;
	V_DEFERRED_SALES_SUM            NUMBER;
	V_TAX_SALES_SUM                 NUMBER;
	V_SALES_RETURN_TOTAL         NUMBER;
	V_CASH_SALES_RETURN_SUM         NUMBER;
	V_BANK_SALES_RETURN_SUM         NUMBER;
	V_DEFERRED_SALES_RETURN_SUM     NUMBER;
	V_TAX_SALES_RETURN_SUM          NUMBER;

BEGIN


            SELECT
		        NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_INV WHERE COMPANY_ID = p_COMPANY_ID AND (USER_ID= P_USER_ID OR P_USER_ID = 0)  AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0) SALES_TOTAL,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_INV WHERE COMPANY_ID = p_COMPANY_ID AND (USER_ID= P_USER_ID OR P_USER_ID = 0) AND INVOICE_TYPE = 1 AND PAYMENT_TYPE=1 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)CASH_SALES_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_INV WHERE COMPANY_ID = p_COMPANY_ID AND (USER_ID= P_USER_ID OR P_USER_ID = 0) AND INVOICE_TYPE = 1 AND PAYMENT_TYPE=2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)BANK_SALES_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_INV WHERE COMPANY_ID = p_COMPANY_ID AND (USER_ID= P_USER_ID OR P_USER_ID = 0) AND INVOICE_TYPE = 2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)DEFERRED_SALES_SUM,
				NVL((SELECT SUM(TOTAL_VAT) FROM SALES_INV WHERE COMPANY_ID = p_COMPANY_ID AND (USER_ID= P_USER_ID OR P_USER_ID = 0)  AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)TAX_SALES_SUM
            INTO V_SALES_TOTAL,
                V_CASH_SALES_SUM,
                V_BANK_SALES_SUM,
				V_DEFERRED_SALES_SUM,
				V_TAX_SALES_SUM

            FROM DUAL;

			SELECT
		        NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_RETURN_INV WHERE COMPANY_ID = p_COMPANY_ID AND (USER_ID= P_USER_ID OR P_USER_ID = 0)  AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0) AS SALES_RETURN_TOTAL,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_RETURN_INV WHERE COMPANY_ID = p_COMPANY_ID AND (USER_ID= P_USER_ID OR P_USER_ID = 0) AND INVOICE_TYPE = 1 AND PAYMENT_TYPE=1 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0) AS CASH_SALES_RETURN_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_RETURN_INV WHERE COMPANY_ID = p_COMPANY_ID AND (USER_ID= P_USER_ID OR P_USER_ID = 0) AND INVOICE_TYPE = 1 AND PAYMENT_TYPE=2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0) AS BANK_SALES_RETURN_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_RETURN_INV WHERE COMPANY_ID = p_COMPANY_ID AND (USER_ID= P_USER_ID OR P_USER_ID = 0) AND INVOICE_TYPE = 2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0) AS DEFERRED_SALES_RETURN_SUM,
				NVL((SELECT SUM(TOTAL_VAT) FROM SALES_RETURN_INV WHERE COMPANY_ID = p_COMPANY_ID AND (USER_ID= P_USER_ID OR P_USER_ID = 0)  AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)AS TAX_SALES_RETURN_SUM
            INTO V_SALES_RETURN_TOTAL,
                V_CASH_SALES_RETURN_SUM,
                V_BANK_SALES_RETURN_SUM,
				V_DEFERRED_SALES_RETURN_SUM,
				V_TAX_SALES_RETURN_SUM
            FROM DUAL;
        FOR REC IN (
            SELECT
			P.PRODUCT_ID,
			P.PRODUCT_NO,
			P.BARCODE,
            P.PRODUCT_NAME_AR PRODUCT_NAME_AR,
            P.PRODUCT_NAME_EN PRODUCT_NAME_EN,
            D.QUANTITY QUANTITY,
            D.TOTAL_AMOUNT TOTAL_AMOUNT,
			D.PRICE,
			to_char(I.INVOICE_DATE,'dd-MM-yyyy')  AS INVOICE_DATE,
			I.INVOICE_NO,
			I.USER_ID,
            U.USER_NAME USER_NAME
        FROM
            SALES_INV_DTL D JOIN SALES_INV I ON D.INVOICE_ID= I.INVOICE_ID 
            JOIN SALES_PRODUCT P ON D.PRODUCT_ID = P.PRODUCT_ID 
			JOIN SETUP_APP_USER U ON I.USER_ID = U.USER_ID
            WHERE I.COMPANY_ID= p_COMPANY_ID  
			AND (I.USER_ID= P_USER_ID OR P_USER_ID = 0)
			AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY'))

        LOOP
		V_SALES_EMP_REC.PRODUCT_ID                  :=REC.PRODUCT_ID ;
        V_SALES_EMP_REC.PRODUCT_NO                  :=REC.PRODUCT_NO ;
        V_SALES_EMP_REC.PRODUCT_NAME_AR             :=REC.PRODUCT_NAME_AR ;
        V_SALES_EMP_REC.PRODUCT_NAME_EN             :=REC.PRODUCT_NAME_EN ;
        V_SALES_EMP_REC.BARCODE                     :=REC.BARCODE ;
		V_SALES_EMP_REC.QUANTITY                    :=REC.QUANTITY ;
        V_SALES_EMP_REC.PRICE                       :=REC.PRICE ;
		V_SALES_EMP_REC.TOTAL_AMOUNT                :=REC.TOTAL_AMOUNT ;
		V_SALES_EMP_REC.USER_ID                     :=REC.USER_ID ;
		V_SALES_EMP_REC.USER_NAME                   :=REC.USER_NAME ;

		        SELECT
					  ITEM_NOTE_AR  INV_TYPE_AR,
					  ITEM_NOTE_EN  INV_TYPE_EN
				INTO 
					  V_SALES_EMP_REC.TRANS_TYPE_AR        ,
					  V_SALES_EMP_REC.TRANS_TYPE_EN 
				FROM
					ADMIN_LIST_ITEM
				WHERE LIST_ID = 7 AND ITEM_NO = 4;
		V_SALES_EMP_REC.SALES_TOTAL                      :=V_SALES_TOTAL ;
        V_SALES_EMP_REC.CASH_SALES_SUM                   :=V_CASH_SALES_SUM ;
		V_SALES_EMP_REC.BANK_SALES_SUM                   :=V_BANK_SALES_SUM ;
		V_SALES_EMP_REC.DEFERRED_SALES_SUM               :=V_DEFERRED_SALES_SUM ;
        V_SALES_EMP_REC.TAX_SALES_SUM                    :=V_TAX_SALES_SUM;

		V_SALES_EMP_REC.SALES_RETURN_TOTAL                :=V_SALES_RETURN_TOTAL ;
        V_SALES_EMP_REC.CASH_SALES_RETURN_SUM             :=V_CASH_SALES_RETURN_SUM ;
		V_SALES_EMP_REC.BANK_SALES_RETURN_SUM             :=V_BANK_SALES_RETURN_SUM ;
		V_SALES_EMP_REC.DEFERRED_SALES_RETURN_SUM         :=V_DEFERRED_SALES_RETURN_SUM ;
        V_SALES_EMP_REC.TAX_SALES_RETURN_SUM              :=V_TAX_SALES_RETURN_SUM;



            V_SALES_EMP_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_SALES_EMP_TBL(V_INDEX) := V_SALES_EMP_REC;
        END LOOP;

		FOR REC IN (
            SELECT
			P.PRODUCT_ID,
			P.PRODUCT_NO,
			P.BARCODE,
            P.PRODUCT_NAME_AR PRODUCT_NAME_AR,
            P.PRODUCT_NAME_EN PRODUCT_NAME_EN,
            D.QUANTITY QUANTITY,
            D.TOTAL_AMOUNT TOTAL_AMOUNT,
			D.PRICE,
			to_char(I.INVOICE_DATE,'dd-MM-yyyy')  AS INVOICE_DATE,
			I.INVOICE_NO,
			I.USER_ID,
            U.USER_NAME USER_NAME
        FROM
            SALES_RETURN_INV_DTL D JOIN SALES_RETURN_INV I ON D.INVOICE_ID= I.INVOICE_ID 
            JOIN SALES_PRODUCT P ON D.PRODUCT_ID = P.PRODUCT_ID 
			JOIN SETUP_APP_USER U ON I.USER_ID = U.USER_ID
            WHERE I.COMPANY_ID= p_COMPANY_ID  
			AND (I.USER_ID= P_USER_ID OR P_USER_ID = 0)
			AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY'))

        LOOP
		V_SALES_EMP_REC.PRODUCT_ID                  :=REC.PRODUCT_ID ;
        V_SALES_EMP_REC.PRODUCT_NO                  :=REC.PRODUCT_NO ;
        V_SALES_EMP_REC.PRODUCT_NAME_AR             :=REC.PRODUCT_NAME_AR ;
        V_SALES_EMP_REC.PRODUCT_NAME_EN             :=REC.PRODUCT_NAME_EN ;
        V_SALES_EMP_REC.BARCODE                     :=REC.BARCODE ;
		V_SALES_EMP_REC.QUANTITY                    :=REC.QUANTITY ;
        V_SALES_EMP_REC.PRICE                       :=REC.PRICE ;
		V_SALES_EMP_REC.TOTAL_AMOUNT                :=REC.TOTAL_AMOUNT ;
		V_SALES_EMP_REC.USER_ID                     :=REC.USER_ID ;
		V_SALES_EMP_REC.USER_NAME                   :=REC.USER_NAME ;

		        SELECT
					  ITEM_NOTE_AR  INV_TYPE_AR,
					  ITEM_NOTE_EN  INV_TYPE_EN
				INTO 
					  V_SALES_EMP_REC.TRANS_TYPE_AR        ,
					  V_SALES_EMP_REC.TRANS_TYPE_EN 
				FROM
					ADMIN_LIST_ITEM
				WHERE LIST_ID = 7 AND ITEM_NO = 5;
		V_SALES_EMP_REC.SALES_TOTAL                      :=V_SALES_TOTAL ;
        V_SALES_EMP_REC.CASH_SALES_SUM                   :=V_CASH_SALES_SUM ;
		V_SALES_EMP_REC.BANK_SALES_SUM                   :=V_BANK_SALES_SUM ;
		V_SALES_EMP_REC.DEFERRED_SALES_SUM               :=V_DEFERRED_SALES_SUM ;
        V_SALES_EMP_REC.TAX_SALES_SUM                    :=V_TAX_SALES_SUM;

		V_SALES_EMP_REC.SALES_RETURN_TOTAL                :=V_SALES_RETURN_TOTAL ;
        V_SALES_EMP_REC.CASH_SALES_RETURN_SUM             :=V_CASH_SALES_RETURN_SUM ;
		V_SALES_EMP_REC.BANK_SALES_RETURN_SUM             :=V_BANK_SALES_RETURN_SUM ;
		V_SALES_EMP_REC.DEFERRED_SALES_RETURN_SUM         :=V_DEFERRED_SALES_RETURN_SUM ;
        V_SALES_EMP_REC.TAX_SALES_RETURN_SUM              :=V_TAX_SALES_RETURN_SUM;



            V_SALES_EMP_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_SALES_EMP_TBL(V_INDEX) := V_SALES_EMP_REC;
        END LOOP;

		RETURN V_SALES_EMP_TBL;

	END	SALES_EMP_R;

/
--------------------------------------------------------
--  DDL for Function SALES_PURCHASES_BRANCHES_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "SALES_PURCHASES_BRANCHES_R" (
    P_COMPANY_ID   NUMBER,
    P_FROM_DATE    VARCHAR2,
    P_TO_DATE      VARCHAR2,
    P_BRANCH_ID    NUMBER DEFAULT 0,
    P_REPORT_TYPE  NUMBER DEFAULT 1
) RETURN SALES_SUMMARY_TBL AS 
    V_SALES_SUMMARY_REC SALES_SUMMARY_REC := SALES_SUMMARY_REC(
        TRANS_TYPE_AR     => NULL,
        TRANS_TYPE_EN     => NULL,
        BRANCH_NAME_AR    => NULL,
        BRANCH_NAME_EN    => NULL,
        BRANCH_ID         => NULL,
        USER_NAME       => NULL,
        USER_ID            => NULL,
        CASH_INV_SUM      => NULL,
        BANK_INV_SUM      => NULL,
        DEFERRED_INV_SUM  => NULL,
        PRE_TAX_INV_SUM   => NULL,
        VAT_SUM           => NULL,
        POST_TAX_INV_SUM  => NULL,
        CNT               => NULL
    );
    V_SALES_SUMMARY_TBL SALES_SUMMARY_TBL := SALES_SUMMARY_TBL();
    V_INDEX NUMBER := 0;
BEGIN
    IF P_REPORT_TYPE = 1 THEN
        FOR REC IN (
            SELECT
                'بيع' TRANS_TYPE_AR,
                'Sale' TRANS_TYPE_EN,
                I.BRANCH_ID,
                B.NAME_AR BRANCH_NAME_AR,
                B.NAME_EN BRANCH_NAME_EN,
                SUM(POST_DISCOUNT_TOTAL_AMOUNT) PRE_TAX_INV_SUM,
                SUM(TOTAL_VAT)VAT_SUM,
                SUM(INVOICE_TOTAL_AMOUNT)POST_TAX_INV_SUM,
                COUNT(*) CNT
            FROM SALES_INV I JOIN SETUP_BRANCH B ON I.BRANCH_ID = B.BRANCH_ID
            WHERE I.COMPANY_ID = P_COMPANY_ID AND (I.BRANCH_ID= NVL(P_BRANCH_ID,0) OR NVL(P_BRANCH_ID,0) = 0) AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
            GROUP BY I.BRANCH_ID,B.NAME_AR,B.NAME_EN)
        LOOP
            V_SALES_SUMMARY_REC.TRANS_TYPE_AR := REC.TRANS_TYPE_AR;
            V_SALES_SUMMARY_REC.TRANS_TYPE_EN := REC.TRANS_TYPE_EN;
            V_SALES_SUMMARY_REC.BRANCH_ID := REC.BRANCH_ID;
            V_SALES_SUMMARY_REC.BRANCH_NAME_AR := REC.BRANCH_NAME_AR;
            V_SALES_SUMMARY_REC.BRANCH_NAME_EN := REC.BRANCH_NAME_EN;
            V_SALES_SUMMARY_REC.PRE_TAX_INV_SUM := REC.PRE_TAX_INV_SUM;
            V_SALES_SUMMARY_REC.VAT_SUM := REC.VAT_SUM;
            V_SALES_SUMMARY_REC.POST_TAX_INV_SUM := REC.POST_TAX_INV_SUM;
            V_SALES_SUMMARY_REC.CNT := REC.CNT;
            SELECT
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_INV WHERE BRANCH_ID = REC.BRANCH_ID AND INVOICE_TYPE = 1 AND PAYMENT_TYPE=1 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)CASH_INV_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_INV WHERE BRANCH_ID = REC.BRANCH_ID AND INVOICE_TYPE = 1 AND PAYMENT_TYPE=2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)BANK_INV_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_INV WHERE BRANCH_ID = REC.BRANCH_ID AND INVOICE_TYPE = 2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)DEFERRED_INV_SUM
            INTO V_SALES_SUMMARY_REC.CASH_INV_SUM,
                V_SALES_SUMMARY_REC.BANK_INV_SUM,
                V_SALES_SUMMARY_REC.DEFERRED_INV_SUM
            FROM DUAL;
            V_SALES_SUMMARY_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_SALES_SUMMARY_TBL(V_INDEX) := V_SALES_SUMMARY_REC;
        END LOOP;


        FOR REC IN (
            SELECT
                'مردود بيع' TRANS_TYPE_AR,
                'Sales Return' TRANS_TYPE_EN,
                I.BRANCH_ID,
                B.NAME_AR BRANCH_NAME_AR,
                B.NAME_EN BRANCH_NAME_EN,
                SUM(POST_DISCOUNT_TOTAL_AMOUNT) PRE_TAX_INV_SUM,
                SUM(TOTAL_VAT)VAT_SUM,
                SUM(INVOICE_TOTAL_AMOUNT)POST_TAX_INV_SUM,
                COUNT(*) CNT
            FROM SALES_RETURN_INV I JOIN SETUP_BRANCH B ON I.BRANCH_ID = B.BRANCH_ID
            WHERE I.COMPANY_ID = P_COMPANY_ID AND (I.BRANCH_ID= NVL(P_BRANCH_ID,0) OR NVL(P_BRANCH_ID,0) = 0) AND  INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
            GROUP BY I.BRANCH_ID,B.NAME_AR,B.NAME_EN)
        LOOP
            V_SALES_SUMMARY_REC.TRANS_TYPE_AR := REC.TRANS_TYPE_AR;
            V_SALES_SUMMARY_REC.TRANS_TYPE_EN := REC.TRANS_TYPE_EN;
            V_SALES_SUMMARY_REC.BRANCH_ID := REC.BRANCH_ID;
            V_SALES_SUMMARY_REC.BRANCH_NAME_AR := REC.BRANCH_NAME_AR;
            V_SALES_SUMMARY_REC.BRANCH_NAME_EN := REC.BRANCH_NAME_EN;
            V_SALES_SUMMARY_REC.PRE_TAX_INV_SUM := REC.PRE_TAX_INV_SUM;
            V_SALES_SUMMARY_REC.VAT_SUM := REC.VAT_SUM;
            V_SALES_SUMMARY_REC.POST_TAX_INV_SUM := REC.POST_TAX_INV_SUM;
            V_SALES_SUMMARY_REC.CNT := REC.CNT;
            SELECT
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_RETURN_INV WHERE BRANCH_ID = REC.BRANCH_ID AND  INVOICE_TYPE = 1 AND PAYMENT_TYPE=1 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)CASH_INV_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_RETURN_INV WHERE BRANCH_ID = REC.BRANCH_ID AND  INVOICE_TYPE = 1 AND PAYMENT_TYPE=2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)BANK_INV_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_RETURN_INV WHERE BRANCH_ID = REC.BRANCH_ID AND  INVOICE_TYPE = 2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)DEFERRED_INV_SUM
            INTO V_SALES_SUMMARY_REC.CASH_INV_SUM,
                V_SALES_SUMMARY_REC.BANK_INV_SUM,
                V_SALES_SUMMARY_REC.DEFERRED_INV_SUM
            FROM DUAL;
            V_SALES_SUMMARY_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_SALES_SUMMARY_TBL(V_INDEX) := V_SALES_SUMMARY_REC;
        END LOOP;
    ELSE
        FOR REC IN (
            SELECT
                'شراء' TRANS_TYPE_AR,
                'Purchase' TRANS_TYPE_EN,
                I.BRANCH_ID,
                B.NAME_AR BRANCH_NAME_AR,
                B.NAME_EN BRANCH_NAME_EN,
                SUM(POST_DISCOUNT_TOTAL_AMOUNT) PRE_TAX_INV_SUM,
                SUM(TOTAL_VAT)VAT_SUM,
                SUM(INVOICE_TOTAL_AMOUNT)POST_TAX_INV_SUM,
                COUNT(*) CNT
            FROM SALES_PURCHASE_INV I JOIN SETUP_BRANCH B ON I.BRANCH_ID = B.BRANCH_ID
            WHERE I.COMPANY_ID = P_COMPANY_ID AND (I.BRANCH_ID= NVL(P_BRANCH_ID,0) OR NVL(P_BRANCH_ID,0) = 0) AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
            GROUP BY I.BRANCH_ID,B.NAME_AR,B.NAME_EN)
        LOOP
            V_SALES_SUMMARY_REC.TRANS_TYPE_AR := REC.TRANS_TYPE_AR;
            V_SALES_SUMMARY_REC.TRANS_TYPE_EN := REC.TRANS_TYPE_EN;
            V_SALES_SUMMARY_REC.BRANCH_ID := REC.BRANCH_ID;
            V_SALES_SUMMARY_REC.BRANCH_NAME_AR := REC.BRANCH_NAME_AR;
            V_SALES_SUMMARY_REC.BRANCH_NAME_EN := REC.BRANCH_NAME_EN;
            V_SALES_SUMMARY_REC.PRE_TAX_INV_SUM := REC.PRE_TAX_INV_SUM;
            V_SALES_SUMMARY_REC.VAT_SUM := REC.VAT_SUM;
            V_SALES_SUMMARY_REC.POST_TAX_INV_SUM := REC.POST_TAX_INV_SUM;
            V_SALES_SUMMARY_REC.CNT := REC.CNT;
            SELECT
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_PURCHASE_INV WHERE BRANCH_ID = REC.BRANCH_ID AND INVOICE_TYPE = 1 AND PAYMENT_TYPE=1 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)CASH_INV_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_PURCHASE_INV WHERE BRANCH_ID = REC.BRANCH_ID AND INVOICE_TYPE = 1 AND PAYMENT_TYPE=2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)BANK_INV_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_PURCHASE_INV WHERE BRANCH_ID = REC.BRANCH_ID AND INVOICE_TYPE = 2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)DEFERRED_INV_SUM
            INTO V_SALES_SUMMARY_REC.CASH_INV_SUM,
                V_SALES_SUMMARY_REC.BANK_INV_SUM,
                V_SALES_SUMMARY_REC.DEFERRED_INV_SUM
            FROM DUAL;
            V_SALES_SUMMARY_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_SALES_SUMMARY_TBL(V_INDEX) := V_SALES_SUMMARY_REC;
        END LOOP;
        FOR REC IN (
            SELECT
                'مردود شراء' TRANS_TYPE_AR,
                'Purchase Return' TRANS_TYPE_EN,
                I.BRANCH_ID,
                B.NAME_AR BRANCH_NAME_AR,
                B.NAME_EN BRANCH_NAME_EN,
                SUM(POST_DISCOUNT_TOTAL_AMOUNT) PRE_TAX_INV_SUM,
                SUM(TOTAL_VAT)VAT_SUM,
                SUM(INVOICE_TOTAL_AMOUNT)POST_TAX_INV_SUM,
                COUNT(*) CNT
            FROM SALES_PUR_RETURN_INV I JOIN SETUP_BRANCH B ON I.BRANCH_ID = B.BRANCH_ID
            WHERE I.COMPANY_ID = P_COMPANY_ID AND (I.BRANCH_ID= NVL(P_BRANCH_ID,0) OR NVL(P_BRANCH_ID,0) = 0) AND  INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
            GROUP BY I.BRANCH_ID,B.NAME_AR,B.NAME_EN)
        LOOP
            V_SALES_SUMMARY_REC.TRANS_TYPE_AR := REC.TRANS_TYPE_AR;
            V_SALES_SUMMARY_REC.TRANS_TYPE_EN := REC.TRANS_TYPE_EN;
            V_SALES_SUMMARY_REC.BRANCH_ID := REC.BRANCH_ID;
            V_SALES_SUMMARY_REC.BRANCH_NAME_AR := REC.BRANCH_NAME_AR;
            V_SALES_SUMMARY_REC.BRANCH_NAME_EN := REC.BRANCH_NAME_EN;
            V_SALES_SUMMARY_REC.PRE_TAX_INV_SUM := REC.PRE_TAX_INV_SUM;
            V_SALES_SUMMARY_REC.VAT_SUM := REC.VAT_SUM;
            V_SALES_SUMMARY_REC.POST_TAX_INV_SUM := REC.POST_TAX_INV_SUM;
            V_SALES_SUMMARY_REC.CNT := REC.CNT;
            SELECT
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_PUR_RETURN_INV WHERE BRANCH_ID = REC.BRANCH_ID AND  INVOICE_TYPE = 1 AND PAYMENT_TYPE=1 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)CASH_INV_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_PUR_RETURN_INV WHERE BRANCH_ID = REC.BRANCH_ID AND  INVOICE_TYPE = 1 AND PAYMENT_TYPE=2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)BANK_INV_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_PUR_RETURN_INV WHERE BRANCH_ID = REC.BRANCH_ID AND  INVOICE_TYPE = 2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)DEFERRED_INV_SUM
            INTO V_SALES_SUMMARY_REC.CASH_INV_SUM,
                V_SALES_SUMMARY_REC.BANK_INV_SUM,
                V_SALES_SUMMARY_REC.DEFERRED_INV_SUM
            FROM DUAL;
            V_SALES_SUMMARY_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_SALES_SUMMARY_TBL(V_INDEX) := V_SALES_SUMMARY_REC;
        END LOOP;
    END IF;
    RETURN V_SALES_SUMMARY_TBL;
END SALES_PURCHASES_BRANCHES_R;


/
--------------------------------------------------------
--  DDL for Function SALES_PURCHASES_CLIENT_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "SALES_PURCHASES_CLIENT_R" (
    P_FROM_DATE    VARCHAR2,
    P_TO_DATE      VARCHAR2,
	p_COMPANY_ID   NUMBER,
	P_CLIENT_ID    NUMBER
) RETURN SALES_PURCHASES_CLIENT_TBL AS 
  
    V_SALES_PURCHASES_CLIENT_REC SALES_PURCHASES_CLIENT_REC := SALES_PURCHASES_CLIENT_REC(
	    TRANS_TYPE_AR                      => NULL,
        TRANS_TYPE_EN                      => NULL,
		INVOICE_DATE                       => NULL,
		INVOICE_NO                         => NULL,
		CLIENT_NAME_AR                     => NULL,
		CLIENT_NAME_EN                     => NULL,
        PRODUCT_ID                         => NULL,
		PRODUCT_NO                         => NULL,
        PRODUCT_NAME_AR                    => NULL,
		PRODUCT_NAME_EN                    => NULL,
		BARCODE                            => NULL,
		QUANTITY                           => NULL,
		PRICE                              => NULL,
		TOTAL_AMOUNT                       => NULL,
		SALES_TOTAL                     => NULL,
		CASH_SALES_SUM                     => NULL,
		BANK_SALES_SUM                     => NULL,
		DEFERRED_SALES_SUM                 => NULL,
		TAX_SALES_SUM                      => NULL,
		SALES_RETURN_TOTAL                     => NULL,
		CASH_SALES_RETURN_SUM              => NULL,
		BANK_SALES_RETURN_SUM              => NULL,
		DEFERRED_SALES_RETURN_SUM          => NULL,
		TAX_SALES_RETURN_SUM               => NULL
    );
    V_SALES_PURCHASES_CLIENT_TBL SALES_PURCHASES_CLIENT_TBL := SALES_PURCHASES_CLIENT_TBL();
    V_INDEX NUMBER := 0;
    v_sales number;
	V_SALES_TOTAL               NUMBER; 
	V_CASH_SALES_SUM                NUMBER;     
	V_BANK_SALES_SUM                NUMBER;
	V_DEFERRED_SALES_SUM            NUMBER;
	V_TAX_SALES_SUM                 NUMBER;
	V_SALES_RETURN_TOTAL         NUMBER;
	V_CASH_SALES_RETURN_SUM         NUMBER;
	V_BANK_SALES_RETURN_SUM         NUMBER;
	V_DEFERRED_SALES_RETURN_SUM     NUMBER;
	V_TAX_SALES_RETURN_SUM          NUMBER;

BEGIN


            SELECT
		        NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_INV WHERE COMPANY_ID = p_COMPANY_ID AND CLIENT_ID=P_CLIENT_ID ),0), --AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0) SALES_TOTAL,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_INV WHERE COMPANY_ID = p_COMPANY_ID AND CLIENT_ID=P_CLIENT_ID AND INVOICE_TYPE = 1 AND PAYMENT_TYPE=1 ),0), --AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)CASH_SALES_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_INV WHERE COMPANY_ID = p_COMPANY_ID AND CLIENT_ID=P_CLIENT_ID AND INVOICE_TYPE = 1 AND PAYMENT_TYPE=2 ),0), --AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)BANK_SALES_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_INV WHERE COMPANY_ID = p_COMPANY_ID AND CLIENT_ID=P_CLIENT_ID AND INVOICE_TYPE = 2 ),0), --AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)DEFERRED_SALES_SUM,
				NVL((SELECT SUM(TOTAL_VAT) FROM SALES_INV WHERE COMPANY_ID = p_COMPANY_ID AND CLIENT_ID=P_CLIENT_ID ),0) --AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)TAX_SALES_SUM
            INTO V_SALES_TOTAL,
                V_CASH_SALES_SUM,
                V_BANK_SALES_SUM,
				V_DEFERRED_SALES_SUM,
				V_TAX_SALES_SUM

            FROM DUAL;

			SELECT
		        NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_RETURN_INV WHERE COMPANY_ID = p_COMPANY_ID AND CLIENT_ID=P_CLIENT_ID),0), -- AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0) AS SALES_RETURN_TOTAL,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_RETURN_INV WHERE COMPANY_ID = p_COMPANY_ID AND CLIENT_ID=P_CLIENT_ID),0), --AND INVOICE_TYPE = 1 AND PAYMENT_TYPE=1 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0) AS CASH_SALES_RETURN_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_RETURN_INV WHERE COMPANY_ID = p_COMPANY_ID AND CLIENT_ID=P_CLIENT_ID),0), --AND INVOICE_TYPE = 1 AND PAYMENT_TYPE=2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0) AS BANK_SALES_RETURN_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_RETURN_INV WHERE COMPANY_ID = p_COMPANY_ID AND CLIENT_ID=P_CLIENT_ID),0), --AND INVOICE_TYPE = 2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0) AS DEFERRED_SALES_RETURN_SUM,
				NVL((SELECT SUM(TOTAL_VAT) FROM SALES_RETURN_INV WHERE COMPANY_ID = p_COMPANY_ID AND CLIENT_ID=P_CLIENT_ID ),0) --AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)AS TAX_SALES_RETURN_SUM
            INTO V_SALES_RETURN_TOTAL,
                V_CASH_SALES_RETURN_SUM,
                V_BANK_SALES_RETURN_SUM,
				V_DEFERRED_SALES_RETURN_SUM,
				V_TAX_SALES_RETURN_SUM
            FROM DUAL;
        FOR REC IN (
            SELECT
			P.PRODUCT_ID,
			P.PRODUCT_NO,
			P.BARCODE,
            P.PRODUCT_NAME_AR PRODUCT_NAME_AR,
            P.PRODUCT_NAME_EN PRODUCT_NAME_EN,
            D.QUANTITY QUANTITY,
            D.TOTAL_AMOUNT TOTAL_AMOUNT,
			D.PRICE,
			to_char(I.INVOICE_DATE,'dd-MM-yyyy')  AS INVOICE_DATE,
			I.INVOICE_NO,
			C.NAME_AR  CLIENT_NAME_AR,
			C.NAME_EN  CLIENT_NAME_EN
        FROM
            SALES_INV_DTL D JOIN SALES_INV I ON D.INVOICE_ID= I.INVOICE_ID 
            JOIN SALES_PRODUCT P ON D.PRODUCT_ID = P.PRODUCT_ID 
			JOIN SALES_CLIENT C ON C.CLIENT_ID = I.CLIENT_ID
            WHERE I.COMPANY_ID= p_COMPANY_ID  
			AND   I.CLIENT_ID=P_CLIENT_ID
			--AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY'))
)
        LOOP
		V_SALES_PURCHASES_CLIENT_REC.PRODUCT_ID                  :=REC.PRODUCT_ID ;
        V_SALES_PURCHASES_CLIENT_REC.PRODUCT_NO                  :=REC.PRODUCT_NO ;
        V_SALES_PURCHASES_CLIENT_REC.PRODUCT_NAME_AR             :=REC.PRODUCT_NAME_AR ;
        V_SALES_PURCHASES_CLIENT_REC.PRODUCT_NAME_EN             :=REC.PRODUCT_NAME_EN ;
        V_SALES_PURCHASES_CLIENT_REC.BARCODE                     :=REC.BARCODE ;
		V_SALES_PURCHASES_CLIENT_REC.QUANTITY                    :=REC.QUANTITY ;
        V_SALES_PURCHASES_CLIENT_REC.PRICE                       :=REC.PRICE ;
		V_SALES_PURCHASES_CLIENT_REC.TOTAL_AMOUNT                :=REC.TOTAL_AMOUNT ;
		V_SALES_PURCHASES_CLIENT_REC.CLIENT_NAME_AR              :=REC.CLIENT_NAME_AR ;
		V_SALES_PURCHASES_CLIENT_REC.CLIENT_NAME_EN              :=REC.CLIENT_NAME_EN ;

		        SELECT
					  ITEM_NOTE_AR  INV_TYPE_AR,
					  ITEM_NOTE_EN  INV_TYPE_EN
				INTO 
					  V_SALES_PURCHASES_CLIENT_REC.TRANS_TYPE_AR        ,
					  V_SALES_PURCHASES_CLIENT_REC.TRANS_TYPE_EN 
				FROM
					ADMIN_LIST_ITEM
				WHERE LIST_ID = 7 AND ITEM_NO = 4;
		V_SALES_PURCHASES_CLIENT_REC.SALES_TOTAL                      :=V_SALES_TOTAL ;
        V_SALES_PURCHASES_CLIENT_REC.CASH_SALES_SUM                   :=V_CASH_SALES_SUM ;
		V_SALES_PURCHASES_CLIENT_REC.BANK_SALES_SUM                   :=V_BANK_SALES_SUM ;
		V_SALES_PURCHASES_CLIENT_REC.DEFERRED_SALES_SUM               :=V_DEFERRED_SALES_SUM ;
        V_SALES_PURCHASES_CLIENT_REC.TAX_SALES_SUM                    :=V_TAX_SALES_SUM;

		V_SALES_PURCHASES_CLIENT_REC.SALES_RETURN_TOTAL                :=V_SALES_RETURN_TOTAL ;
        V_SALES_PURCHASES_CLIENT_REC.CASH_SALES_RETURN_SUM             :=V_CASH_SALES_RETURN_SUM ;
		V_SALES_PURCHASES_CLIENT_REC.BANK_SALES_RETURN_SUM             :=V_BANK_SALES_RETURN_SUM ;
		V_SALES_PURCHASES_CLIENT_REC.DEFERRED_SALES_RETURN_SUM         :=V_DEFERRED_SALES_RETURN_SUM ;
        V_SALES_PURCHASES_CLIENT_REC.TAX_SALES_RETURN_SUM              :=V_TAX_SALES_RETURN_SUM;



            V_SALES_PURCHASES_CLIENT_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_SALES_PURCHASES_CLIENT_TBL(V_INDEX) := V_SALES_PURCHASES_CLIENT_REC;
        END LOOP;

		FOR REC IN (
            SELECT
			P.PRODUCT_ID,
			P.PRODUCT_NO,
			P.BARCODE,
            P.PRODUCT_NAME_AR PRODUCT_NAME_AR,
            P.PRODUCT_NAME_EN PRODUCT_NAME_EN,
            D.QUANTITY QUANTITY,
            D.TOTAL_AMOUNT TOTAL_AMOUNT,
			D.PRICE,
			to_char(I.INVOICE_DATE,'dd-MM-yyyy')  AS INVOICE_DATE,
			I.INVOICE_NO,
			C.NAME_AR  CLIENT_NAME_AR,
			C.NAME_EN  CLIENT_NAME_EN
        FROM
            SALES_RETURN_INV_DTL D JOIN SALES_RETURN_INV I ON D.INVOICE_ID= I.INVOICE_ID 
            JOIN SALES_PRODUCT P ON D.PRODUCT_ID = P.PRODUCT_ID 
			JOIN SALES_CLIENT C ON C.CLIENT_ID = I.CLIENT_ID
            WHERE I.COMPANY_ID= p_COMPANY_ID  
			AND   I.CLIENT_ID=P_CLIENT_ID
			--AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY'))
)
        LOOP
		V_SALES_PURCHASES_CLIENT_REC.PRODUCT_ID                  :=REC.PRODUCT_ID ;
        V_SALES_PURCHASES_CLIENT_REC.PRODUCT_NO                  :=REC.PRODUCT_NO ;
        V_SALES_PURCHASES_CLIENT_REC.PRODUCT_NAME_AR             :=REC.PRODUCT_NAME_AR ;
        V_SALES_PURCHASES_CLIENT_REC.PRODUCT_NAME_EN             :=REC.PRODUCT_NAME_EN ;
        V_SALES_PURCHASES_CLIENT_REC.BARCODE                     :=REC.BARCODE ;
		V_SALES_PURCHASES_CLIENT_REC.QUANTITY                    :=REC.QUANTITY ;
        V_SALES_PURCHASES_CLIENT_REC.PRICE                       :=REC.PRICE ;
		V_SALES_PURCHASES_CLIENT_REC.TOTAL_AMOUNT                :=REC.TOTAL_AMOUNT ;
		V_SALES_PURCHASES_CLIENT_REC.CLIENT_NAME_AR              :=REC.CLIENT_NAME_AR ;
		V_SALES_PURCHASES_CLIENT_REC.CLIENT_NAME_EN              :=REC.CLIENT_NAME_EN ;

		        SELECT
					  ITEM_NOTE_AR  INV_TYPE_AR,
					  ITEM_NOTE_EN  INV_TYPE_EN
				INTO 
					  V_SALES_PURCHASES_CLIENT_REC.TRANS_TYPE_AR        ,
					  V_SALES_PURCHASES_CLIENT_REC.TRANS_TYPE_EN 
				FROM
					ADMIN_LIST_ITEM
				WHERE LIST_ID = 7 AND ITEM_NO = 5;
		V_SALES_PURCHASES_CLIENT_REC.SALES_TOTAL                      :=V_SALES_TOTAL ;
        V_SALES_PURCHASES_CLIENT_REC.CASH_SALES_SUM                   :=V_CASH_SALES_SUM ;
		V_SALES_PURCHASES_CLIENT_REC.BANK_SALES_SUM                   :=V_BANK_SALES_SUM ;
		V_SALES_PURCHASES_CLIENT_REC.DEFERRED_SALES_SUM               :=V_DEFERRED_SALES_SUM ;
        V_SALES_PURCHASES_CLIENT_REC.TAX_SALES_SUM                    :=V_TAX_SALES_SUM;

		V_SALES_PURCHASES_CLIENT_REC.SALES_RETURN_TOTAL                :=V_SALES_RETURN_TOTAL ;
        V_SALES_PURCHASES_CLIENT_REC.CASH_SALES_RETURN_SUM             :=V_CASH_SALES_RETURN_SUM ;
		V_SALES_PURCHASES_CLIENT_REC.BANK_SALES_RETURN_SUM             :=V_BANK_SALES_RETURN_SUM ;
		V_SALES_PURCHASES_CLIENT_REC.DEFERRED_SALES_RETURN_SUM         :=V_DEFERRED_SALES_RETURN_SUM ;
        V_SALES_PURCHASES_CLIENT_REC.TAX_SALES_RETURN_SUM              :=V_TAX_SALES_RETURN_SUM;



            V_SALES_PURCHASES_CLIENT_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_SALES_PURCHASES_CLIENT_TBL(V_INDEX) := V_SALES_PURCHASES_CLIENT_REC;
        END LOOP;

		RETURN V_SALES_PURCHASES_CLIENT_TBL;

	END	SALES_PURCHASES_CLIENT_R;

/
--------------------------------------------------------
--  DDL for Function SALES_PURCHASES_DETAILS_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "SALES_PURCHASES_DETAILS_R" (
    P_COMPANY_ID   NUMBER,
    P_FROM_DATE   VARCHAR2,
    P_TO_DATE     VARCHAR2,
    P_STORE_ID    NUMBER DEFAULT 0,
    P_PRODUCT_ID  NUMBER DEFAULT 0,
    P_REPORT_TYPE NUMBER DEFAULT 1
) RETURN SALES_PURCHASES_DETAILS_TBL AS 
    V_SALES_PURCHASES_DETAILS_REC SALES_PURCHASES_DETAILS_REC := SALES_PURCHASES_DETAILS_REC(
        TRANS_TYPE_AR    => NULL,
        TRANS_TYPE_EN    => NULL,
        PRODUCT_NAME_AR  => NULL,
        PRODUCT_NAME_EN  => NULL,
        STORE_NAME_AR    => NULL,
        STORE_NAME_EN    => NULL,
        PRO_NAME_AR      => NULL,
        PRO_NAME_EN      => NULL,
        INVOICE_NO       => NULL,
        INVOICE_DATE     => NULL,
        QUANTITY         => NULL,
        PRICE            => NULL,
        VAT_VALUE        => NULL,
        TOTAL_AMOUNT     => NULL
    );
    V_SALES_PURCHASES_DETAILS_TBL SALES_PURCHASES_DETAILS_TBL := SALES_PURCHASES_DETAILS_TBL();
    V_INDEX NUMBER := 0;
BEGIN
    IF P_REPORT_TYPE = 1 THEN
        FOR REC IN (
            SELECT
            'فاتورة بيع'     TRANS_TYPE_AR,
            'Sales Invoice'  TRANS_TYPE_EN,
            P.PRODUCT_NAME_AR PRODUCT_NAME_AR,
            P.PRODUCT_NAME_EN PRODUCT_NAME_EN,
            S.STORE_NAME_AR STORE_NAME_AR,
            S.STORE_NAME_EN STORE_NAME_EN,
            PRO.NAME_AR PRO_NAME_AR,
            PRO.NAME_EN PRO_NAME_EN,
            I.INVOICE_NO INVOICE_NO,
            to_char(I.INVOICE_DATE,'dd-MM-yyyy') INVOICE_DATE,
            D.QUANTITY QUANTITY,
            D.PRICE PRICE,
            D.VAT_VALUE VAT_VALUE,
            D.TOTAL_AMOUNT TOTAL_AMOUNT
        FROM
            SALES_INV_DTL D JOIN SALES_INV I ON D.INVOICE_ID= I.INVOICE_ID 
            JOIN SALES_PRODUCT P ON D.PRODUCT_ID = P.PRODUCT_ID 
            JOIN SETUP_STORE S ON I.STORE_ID = S.STORE_ID
            JOIN SALES_CLIENT PRO ON I.CLIENT_ID = PRO.CLIENT_ID
            WHERE I.COMPANY_ID = P_COMPANY_ID AND (S.STORE_ID= NVL(P_STORE_ID,0) OR NVL(P_STORE_ID,0) = 0) AND (P.PRODUCT_ID = NVL(P_PRODUCT_ID,0) OR NVL(P_PRODUCT_ID,0) = 0) AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
            )
        LOOP
            V_SALES_PURCHASES_DETAILS_REC.TRANS_TYPE_AR		:= REC.TRANS_TYPE_AR   ;
            V_SALES_PURCHASES_DETAILS_REC.TRANS_TYPE_EN		:= REC.TRANS_TYPE_EN   ;
            V_SALES_PURCHASES_DETAILS_REC.PRODUCT_NAME_AR	:= REC.PRODUCT_NAME_AR ;
            V_SALES_PURCHASES_DETAILS_REC.PRODUCT_NAME_EN	:= REC.PRODUCT_NAME_EN ;
            V_SALES_PURCHASES_DETAILS_REC.STORE_NAME_AR  	:= REC.STORE_NAME_AR   ;
            V_SALES_PURCHASES_DETAILS_REC.STORE_NAME_EN  	:= REC.STORE_NAME_EN   ;
            V_SALES_PURCHASES_DETAILS_REC.PRO_NAME_AR    	:= REC.PRO_NAME_AR     ;
            V_SALES_PURCHASES_DETAILS_REC.PRO_NAME_EN    	:= REC.PRO_NAME_EN     ;
            V_SALES_PURCHASES_DETAILS_REC.INVOICE_NO     	:= REC.INVOICE_NO      ;
            V_SALES_PURCHASES_DETAILS_REC.INVOICE_DATE   	:= REC.INVOICE_DATE    ;
            V_SALES_PURCHASES_DETAILS_REC.QUANTITY       	:= REC.QUANTITY        ;
            V_SALES_PURCHASES_DETAILS_REC.PRICE          	:= REC.PRICE           ;
            V_SALES_PURCHASES_DETAILS_REC.VAT_VALUE      	:= REC.VAT_VALUE       ;
            V_SALES_PURCHASES_DETAILS_REC.TOTAL_AMOUNT   	:= REC.TOTAL_AMOUNT    ;
            V_SALES_PURCHASES_DETAILS_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_SALES_PURCHASES_DETAILS_TBL(V_INDEX) := V_SALES_PURCHASES_DETAILS_REC;
        END LOOP;


        FOR REC IN (
            SELECT
                'فاتورة مردود بيع' TRANS_TYPE_AR,
                'Sales Return Invoice' TRANS_TYPE_EN,
            P.PRODUCT_NAME_AR PRODUCT_NAME_AR,
            P.PRODUCT_NAME_EN PRODUCT_NAME_EN,
            S.STORE_NAME_AR STORE_NAME_AR,
            S.STORE_NAME_EN STORE_NAME_EN,
            PRO.NAME_AR PRO_NAME_AR,
            PRO.NAME_EN PRO_NAME_EN,
            I.INVOICE_NO INVOICE_NO,
            I.INVOICE_DATE INVOICE_DATE,
            D.QUANTITY QUANTITY,
            D.PRICE PRICE,
            D.VAT_VALUE VAT_VALUE,
            D.TOTAL_AMOUNT TOTAL_AMOUNT
        FROM
            SALES_RETURN_INV_DTL D JOIN SALES_RETURN_INV I ON D.INVOICE_ID= I.INVOICE_ID 
            JOIN SALES_PRODUCT P ON D.PRODUCT_ID = P.PRODUCT_ID 
            JOIN SETUP_STORE S ON I.STORE_ID = S.STORE_ID
            JOIN SALES_CLIENT PRO ON I.CLIENT_ID = PRO.CLIENT_ID
            WHERE I.COMPANY_ID = P_COMPANY_ID AND (S.STORE_ID= NVL(P_STORE_ID,0) OR NVL(P_STORE_ID,0) = 0) AND (P.PRODUCT_ID = NVL(P_PRODUCT_ID,0) OR NVL(P_PRODUCT_ID,0) = 0) AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
            )
        LOOP
            V_SALES_PURCHASES_DETAILS_REC.TRANS_TYPE_AR		:= REC.TRANS_TYPE_AR   ;
            V_SALES_PURCHASES_DETAILS_REC.TRANS_TYPE_EN		:= REC.TRANS_TYPE_EN   ;
            V_SALES_PURCHASES_DETAILS_REC.PRODUCT_NAME_AR	:= REC.PRODUCT_NAME_AR ;
            V_SALES_PURCHASES_DETAILS_REC.PRODUCT_NAME_EN	:= REC.PRODUCT_NAME_EN ;
            V_SALES_PURCHASES_DETAILS_REC.STORE_NAME_AR  	:= REC.STORE_NAME_AR   ;
            V_SALES_PURCHASES_DETAILS_REC.STORE_NAME_EN  	:= REC.STORE_NAME_EN   ;
            V_SALES_PURCHASES_DETAILS_REC.PRO_NAME_AR    	:= REC.PRO_NAME_AR     ;
            V_SALES_PURCHASES_DETAILS_REC.PRO_NAME_EN    	:= REC.PRO_NAME_EN     ;
            V_SALES_PURCHASES_DETAILS_REC.INVOICE_NO     	:= REC.INVOICE_NO      ;
            V_SALES_PURCHASES_DETAILS_REC.INVOICE_DATE   	:= REC.INVOICE_DATE    ;
            V_SALES_PURCHASES_DETAILS_REC.QUANTITY       	:= REC.QUANTITY        ;
            V_SALES_PURCHASES_DETAILS_REC.PRICE          	:= REC.PRICE           ;
            V_SALES_PURCHASES_DETAILS_REC.VAT_VALUE      	:= REC.VAT_VALUE       ;
            V_SALES_PURCHASES_DETAILS_REC.TOTAL_AMOUNT   	:= REC.TOTAL_AMOUNT    ;
            V_SALES_PURCHASES_DETAILS_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_SALES_PURCHASES_DETAILS_TBL(V_INDEX) := V_SALES_PURCHASES_DETAILS_REC;
        END LOOP;
    ELSE
        FOR REC IN (
            SELECT
                'فاتورة شراء'     TRANS_TYPE_AR,
                'Purchase Invoice'  TRANS_TYPE_EN,
                P.PRODUCT_NAME_AR PRODUCT_NAME_AR,
                P.PRODUCT_NAME_EN PRODUCT_NAME_EN,
                S.STORE_NAME_AR STORE_NAME_AR,
                S.STORE_NAME_EN STORE_NAME_EN,
                PRO.NAME_AR PRO_NAME_AR,
                PRO.NAME_EN PRO_NAME_EN,
                I.INVOICE_NO INVOICE_NO,
                I.INVOICE_DATE INVOICE_DATE,
                D.QUANTITY QUANTITY,
                D.PRICE PRICE,
                D.VAT_VALUE VAT_VALUE,
                D.TOTAL_AMOUNT TOTAL_AMOUNT
            FROM
                SALES_PURCHASE_INV_DTL D JOIN SALES_PURCHASE_INV I ON D.INVOICE_ID= I.INVOICE_ID 
                JOIN SALES_PRODUCT P ON D.PRODUCT_ID = P.PRODUCT_ID 
                JOIN SETUP_STORE S ON I.STORE_ID = S.STORE_ID
                JOIN SALES_PROVIDER PRO ON I.PROVIDER_ID = PRO.PROVIDER_ID
                WHERE I.COMPANY_ID = P_COMPANY_ID AND (S.STORE_ID= NVL(P_STORE_ID,0) OR NVL(P_STORE_ID,0) = 0) AND (P.PRODUCT_ID = NVL(P_PRODUCT_ID,0) OR NVL(P_PRODUCT_ID,0) = 0) AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
            )
        LOOP
            V_SALES_PURCHASES_DETAILS_REC.TRANS_TYPE_AR		:= REC.TRANS_TYPE_AR   ;
            V_SALES_PURCHASES_DETAILS_REC.TRANS_TYPE_EN		:= REC.TRANS_TYPE_EN   ;
            V_SALES_PURCHASES_DETAILS_REC.PRODUCT_NAME_AR	:= REC.PRODUCT_NAME_AR ;
            V_SALES_PURCHASES_DETAILS_REC.PRODUCT_NAME_EN	:= REC.PRODUCT_NAME_EN ;
            V_SALES_PURCHASES_DETAILS_REC.STORE_NAME_AR  	:= REC.STORE_NAME_AR   ;
            V_SALES_PURCHASES_DETAILS_REC.STORE_NAME_EN  	:= REC.STORE_NAME_EN   ;
            V_SALES_PURCHASES_DETAILS_REC.PRO_NAME_AR    	:= REC.PRO_NAME_AR     ;
            V_SALES_PURCHASES_DETAILS_REC.PRO_NAME_EN    	:= REC.PRO_NAME_EN     ;
            V_SALES_PURCHASES_DETAILS_REC.INVOICE_NO     	:= REC.INVOICE_NO      ;
            V_SALES_PURCHASES_DETAILS_REC.INVOICE_DATE   	:= REC.INVOICE_DATE    ;
            V_SALES_PURCHASES_DETAILS_REC.QUANTITY       	:= REC.QUANTITY        ;
            V_SALES_PURCHASES_DETAILS_REC.PRICE          	:= REC.PRICE           ;
            V_SALES_PURCHASES_DETAILS_REC.VAT_VALUE      	:= REC.VAT_VALUE       ;
            V_SALES_PURCHASES_DETAILS_REC.TOTAL_AMOUNT   	:= REC.TOTAL_AMOUNT    ;
            V_SALES_PURCHASES_DETAILS_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_SALES_PURCHASES_DETAILS_TBL(V_INDEX) := V_SALES_PURCHASES_DETAILS_REC;
        END LOOP;
        FOR REC IN (
            SELECT
                'فاتورة مردود شراء' TRANS_TYPE_AR,
                'Purchase Return Invoice' TRANS_TYPE_EN,
                P.PRODUCT_NAME_AR PRODUCT_NAME_AR,
                P.PRODUCT_NAME_EN PRODUCT_NAME_EN,
                S.STORE_NAME_AR STORE_NAME_AR,
                S.STORE_NAME_EN STORE_NAME_EN,
                PRO.NAME_AR PRO_NAME_AR,
                PRO.NAME_EN PRO_NAME_EN,
                I.INVOICE_NO INVOICE_NO,
                I.INVOICE_DATE INVOICE_DATE,
                D.QUANTITY QUANTITY,
                D.PRICE PRICE,
                D.VAT_VALUE VAT_VALUE,
                D.TOTAL_AMOUNT TOTAL_AMOUNT
            FROM
                SALES_PUR_RETURN_INV_DTL D JOIN SALES_PUR_RETURN_INV I ON D.INVOICE_ID= I.INVOICE_ID 
                JOIN SALES_PRODUCT P ON D.PRODUCT_ID = P.PRODUCT_ID 
                JOIN SETUP_STORE S ON I.STORE_ID = S.STORE_ID
                JOIN SALES_PROVIDER PRO ON I.PROVIDER_ID = PRO.PROVIDER_ID
                WHERE I.COMPANY_ID = P_COMPANY_ID AND (S.STORE_ID= NVL(P_STORE_ID,0) OR NVL(P_STORE_ID,0) = 0) AND (P.PRODUCT_ID = NVL(P_PRODUCT_ID,0) OR NVL(P_PRODUCT_ID,0) = 0) AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
            )
        LOOP
            V_SALES_PURCHASES_DETAILS_REC.TRANS_TYPE_AR		:= REC.TRANS_TYPE_AR   ;
            V_SALES_PURCHASES_DETAILS_REC.TRANS_TYPE_EN		:= REC.TRANS_TYPE_EN   ;
            V_SALES_PURCHASES_DETAILS_REC.PRODUCT_NAME_AR	:= REC.PRODUCT_NAME_AR ;
            V_SALES_PURCHASES_DETAILS_REC.PRODUCT_NAME_EN	:= REC.PRODUCT_NAME_EN ;
            V_SALES_PURCHASES_DETAILS_REC.STORE_NAME_AR  	:= REC.STORE_NAME_AR   ;
            V_SALES_PURCHASES_DETAILS_REC.STORE_NAME_EN  	:= REC.STORE_NAME_EN   ;
            V_SALES_PURCHASES_DETAILS_REC.PRO_NAME_AR    	:= REC.PRO_NAME_AR     ;
            V_SALES_PURCHASES_DETAILS_REC.PRO_NAME_EN    	:= REC.PRO_NAME_EN     ;
            V_SALES_PURCHASES_DETAILS_REC.INVOICE_NO     	:= REC.INVOICE_NO      ;
            V_SALES_PURCHASES_DETAILS_REC.INVOICE_DATE   	:= REC.INVOICE_DATE    ;
            V_SALES_PURCHASES_DETAILS_REC.QUANTITY       	:= REC.QUANTITY        ;
            V_SALES_PURCHASES_DETAILS_REC.PRICE          	:= REC.PRICE           ;
            V_SALES_PURCHASES_DETAILS_REC.VAT_VALUE      	:= REC.VAT_VALUE       ;
            V_SALES_PURCHASES_DETAILS_REC.TOTAL_AMOUNT   	:= REC.TOTAL_AMOUNT    ;
            V_SALES_PURCHASES_DETAILS_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_SALES_PURCHASES_DETAILS_TBL(V_INDEX) := V_SALES_PURCHASES_DETAILS_REC;
        END LOOP;    
    END IF;
    RETURN V_SALES_PURCHASES_DETAILS_TBL;
END SALES_PURCHASES_DETAILS_R;


/
--------------------------------------------------------
--  DDL for Function SALES_PURCHASES_EMP_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "SALES_PURCHASES_EMP_R" (
    P_COMPANY_ID   NUMBER,
    P_FROM_DATE    VARCHAR2,
    P_TO_DATE      VARCHAR2,
    P_USER_ID      NUMBER DEFAULT 0,
    P_REPORT_TYPE  NUMBER DEFAULT 1
) RETURN SALES_SUMMARY_TBL AS 
    V_SALES_SUMMARY_REC SALES_SUMMARY_REC := SALES_SUMMARY_REC(
        TRANS_TYPE_AR     => NULL,
        TRANS_TYPE_EN     => NULL,
        BRANCH_NAME_AR    => NULL,
        BRANCH_NAME_EN    => NULL,
        BRANCH_ID         => NULL,
        USER_NAME       => NULL,
        USER_ID            => NULL,
        CASH_INV_SUM      => NULL,
        BANK_INV_SUM      => NULL,
        DEFERRED_INV_SUM  => NULL,
        PRE_TAX_INV_SUM   => NULL,
        VAT_SUM           => NULL,
        POST_TAX_INV_SUM  => NULL,
        CNT               => NULL
    );
    V_SALES_SUMMARY_TBL SALES_SUMMARY_TBL := SALES_SUMMARY_TBL();
    V_INDEX NUMBER := 0;
BEGIN
    IF P_REPORT_TYPE = 1 THEN
        FOR REC IN (
            SELECT
                'بيع' TRANS_TYPE_AR,
                'Sale' TRANS_TYPE_EN,
                U.USER_ID,
                U.USER_NAME USER_NAME,
                SUM(POST_DISCOUNT_TOTAL_AMOUNT) PRE_TAX_INV_SUM,
                SUM(TOTAL_VAT)VAT_SUM,
                SUM(INVOICE_TOTAL_AMOUNT)POST_TAX_INV_SUM,
                COUNT(*) CNT
            FROM SALES_INV I JOIN SETUP_APP_USER U ON I.USER_ID = U.USER_ID
            WHERE I.COMPANY_ID = P_COMPANY_ID AND (I.USER_ID= P_USER_ID OR P_USER_ID = 0) AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
            GROUP BY U.USER_ID,U.USER_NAME)
        LOOP
            V_SALES_SUMMARY_REC.TRANS_TYPE_AR := REC.TRANS_TYPE_AR;
            V_SALES_SUMMARY_REC.TRANS_TYPE_EN := REC.TRANS_TYPE_EN;
            V_SALES_SUMMARY_REC.USER_ID := REC.USER_ID;
            V_SALES_SUMMARY_REC.USER_NAME := REC.USER_NAME;
            V_SALES_SUMMARY_REC.PRE_TAX_INV_SUM := REC.PRE_TAX_INV_SUM;
            V_SALES_SUMMARY_REC.VAT_SUM := REC.VAT_SUM;
            V_SALES_SUMMARY_REC.POST_TAX_INV_SUM := REC.POST_TAX_INV_SUM;
            V_SALES_SUMMARY_REC.CNT := REC.CNT;
            SELECT
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_INV WHERE USER_ID = REC.USER_ID AND INVOICE_TYPE = 1 AND PAYMENT_TYPE=1 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)CASH_INV_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_INV WHERE USER_ID = REC.USER_ID AND INVOICE_TYPE = 1 AND PAYMENT_TYPE=2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)BANK_INV_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_INV WHERE USER_ID = REC.USER_ID AND INVOICE_TYPE = 2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)DEFERRED_INV_SUM
            INTO V_SALES_SUMMARY_REC.CASH_INV_SUM,
                V_SALES_SUMMARY_REC.BANK_INV_SUM,
                V_SALES_SUMMARY_REC.DEFERRED_INV_SUM
            FROM DUAL;
            V_SALES_SUMMARY_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_SALES_SUMMARY_TBL(V_INDEX) := V_SALES_SUMMARY_REC;
        END LOOP;


        FOR REC IN (
            SELECT
                'مردود بيع' TRANS_TYPE_AR,
                'Sales Return' TRANS_TYPE_EN,
                I.USER_ID,
                U.USER_NAME USER_NAME,
                SUM(POST_DISCOUNT_TOTAL_AMOUNT) PRE_TAX_INV_SUM,
                SUM(TOTAL_VAT)VAT_SUM,
                SUM(INVOICE_TOTAL_AMOUNT)POST_TAX_INV_SUM,
                COUNT(*) CNT
            FROM SALES_RETURN_INV I JOIN SETUP_APP_USER U ON I.USER_ID = U.USER_ID
            WHERE I.COMPANY_ID = P_COMPANY_ID AND (I.USER_ID= P_USER_ID OR P_USER_ID = 0) AND  INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
            GROUP BY I.USER_ID,U.USER_NAME)
        LOOP
            V_SALES_SUMMARY_REC.TRANS_TYPE_AR := REC.TRANS_TYPE_AR;
            V_SALES_SUMMARY_REC.TRANS_TYPE_EN := REC.TRANS_TYPE_EN;
            V_SALES_SUMMARY_REC.USER_ID := REC.USER_ID;
            V_SALES_SUMMARY_REC.USER_NAME := REC.USER_NAME;
            V_SALES_SUMMARY_REC.PRE_TAX_INV_SUM := REC.PRE_TAX_INV_SUM;
            V_SALES_SUMMARY_REC.VAT_SUM := REC.VAT_SUM;
            V_SALES_SUMMARY_REC.POST_TAX_INV_SUM := REC.POST_TAX_INV_SUM;
            V_SALES_SUMMARY_REC.CNT := REC.CNT;
            SELECT
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_RETURN_INV WHERE USER_ID = REC.USER_ID AND  INVOICE_TYPE = 1 AND PAYMENT_TYPE=1 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)CASH_INV_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_RETURN_INV WHERE USER_ID = REC.USER_ID AND  INVOICE_TYPE = 1 AND PAYMENT_TYPE=2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)BANK_INV_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_RETURN_INV WHERE USER_ID = REC.USER_ID AND  INVOICE_TYPE = 2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)DEFERRED_INV_SUM
            INTO V_SALES_SUMMARY_REC.CASH_INV_SUM,
                V_SALES_SUMMARY_REC.BANK_INV_SUM,
                V_SALES_SUMMARY_REC.DEFERRED_INV_SUM
            FROM DUAL;
            V_SALES_SUMMARY_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_SALES_SUMMARY_TBL(V_INDEX) := V_SALES_SUMMARY_REC;
        END LOOP;
    ELSE
        FOR REC IN (
            SELECT
                'شراء' TRANS_TYPE_AR,
                'Purchase' TRANS_TYPE_EN,
                U.USER_ID,
                U.USER_NAME USER_NAME,
                SUM(POST_DISCOUNT_TOTAL_AMOUNT) PRE_TAX_INV_SUM,
                SUM(TOTAL_VAT)VAT_SUM,
                SUM(INVOICE_TOTAL_AMOUNT)POST_TAX_INV_SUM,
                COUNT(*) CNT
            FROM SALES_PURCHASE_INV I JOIN SETUP_APP_USER U ON I.USER_ID = U.USER_ID
            WHERE I.COMPANY_ID = P_COMPANY_ID AND (I.USER_ID= P_USER_ID OR P_USER_ID = 0) AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
            GROUP BY U.USER_ID,U.USER_NAME)
        LOOP
            V_SALES_SUMMARY_REC.TRANS_TYPE_AR := REC.TRANS_TYPE_AR;
            V_SALES_SUMMARY_REC.TRANS_TYPE_EN := REC.TRANS_TYPE_EN;
            V_SALES_SUMMARY_REC.USER_ID := REC.USER_ID;
            V_SALES_SUMMARY_REC.USER_NAME := REC.USER_NAME;
            V_SALES_SUMMARY_REC.PRE_TAX_INV_SUM := REC.PRE_TAX_INV_SUM;
            V_SALES_SUMMARY_REC.VAT_SUM := REC.VAT_SUM;
            V_SALES_SUMMARY_REC.POST_TAX_INV_SUM := REC.POST_TAX_INV_SUM;
            V_SALES_SUMMARY_REC.CNT := REC.CNT;
            SELECT
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_PURCHASE_INV WHERE USER_ID = REC.USER_ID AND INVOICE_TYPE = 1 AND PAYMENT_TYPE=1 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)CASH_INV_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_PURCHASE_INV WHERE USER_ID = REC.USER_ID AND INVOICE_TYPE = 1 AND PAYMENT_TYPE=2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)BANK_INV_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_PURCHASE_INV WHERE USER_ID = REC.USER_ID AND INVOICE_TYPE = 2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)DEFERRED_INV_SUM
            INTO V_SALES_SUMMARY_REC.CASH_INV_SUM,
                V_SALES_SUMMARY_REC.BANK_INV_SUM,
                V_SALES_SUMMARY_REC.DEFERRED_INV_SUM
            FROM DUAL;
            V_SALES_SUMMARY_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_SALES_SUMMARY_TBL(V_INDEX) := V_SALES_SUMMARY_REC;
        END LOOP;


        FOR REC IN (
            SELECT
                'مردود شراء' TRANS_TYPE_AR,
                'Purchase Return' TRANS_TYPE_EN,
                I.USER_ID,
                U.USER_NAME USER_NAME,
                SUM(POST_DISCOUNT_TOTAL_AMOUNT) PRE_TAX_INV_SUM,
                SUM(TOTAL_VAT)VAT_SUM,
                SUM(INVOICE_TOTAL_AMOUNT)POST_TAX_INV_SUM,
                COUNT(*) CNT
            FROM SALES_PUR_RETURN_INV I JOIN SETUP_APP_USER U ON I.USER_ID = U.USER_ID
            WHERE I.COMPANY_ID = P_COMPANY_ID AND (I.USER_ID= P_USER_ID OR P_USER_ID = 0) AND  INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
            GROUP BY I.USER_ID,U.USER_NAME)
        LOOP
            V_SALES_SUMMARY_REC.TRANS_TYPE_AR := REC.TRANS_TYPE_AR;
            V_SALES_SUMMARY_REC.TRANS_TYPE_EN := REC.TRANS_TYPE_EN;
            V_SALES_SUMMARY_REC.USER_ID := REC.USER_ID;
            V_SALES_SUMMARY_REC.USER_NAME := REC.USER_NAME;
            V_SALES_SUMMARY_REC.PRE_TAX_INV_SUM := REC.PRE_TAX_INV_SUM;
            V_SALES_SUMMARY_REC.VAT_SUM := REC.VAT_SUM;
            V_SALES_SUMMARY_REC.POST_TAX_INV_SUM := REC.POST_TAX_INV_SUM;
            V_SALES_SUMMARY_REC.CNT := REC.CNT;
            SELECT
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_PUR_RETURN_INV WHERE USER_ID = REC.USER_ID AND  INVOICE_TYPE = 1 AND PAYMENT_TYPE=1 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)CASH_INV_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_PUR_RETURN_INV WHERE USER_ID = REC.USER_ID AND  INVOICE_TYPE = 1 AND PAYMENT_TYPE=2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)BANK_INV_SUM,
                NVL((SELECT SUM(INVOICE_TOTAL_AMOUNT) FROM SALES_PUR_RETURN_INV WHERE USER_ID = REC.USER_ID AND  INVOICE_TYPE = 2 AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')),0)DEFERRED_INV_SUM
            INTO V_SALES_SUMMARY_REC.CASH_INV_SUM,
                V_SALES_SUMMARY_REC.BANK_INV_SUM,
                V_SALES_SUMMARY_REC.DEFERRED_INV_SUM
            FROM DUAL;
            V_SALES_SUMMARY_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_SALES_SUMMARY_TBL(V_INDEX) := V_SALES_SUMMARY_REC;
        END LOOP;
    END IF;
    RETURN V_SALES_SUMMARY_TBL;
END SALES_PURCHASES_EMP_R;


/
--------------------------------------------------------
--  DDL for Function SALES_PURCHASES_PRODUCT_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "SALES_PURCHASES_PRODUCT_R" (
    P_FROM_DATE    VARCHAR2,
    P_TO_DATE      VARCHAR2,
	p_COMPANY_ID   NUMBER
) RETURN SALES_PURCHASES_PRODUCT_TBL AS 
  
    V_SALES_PURCHASES_PRODUCT_REC SALES_PURCHASES_PRODUCT_REC := SALES_PURCHASES_PRODUCT_REC(
        PRODUCT_ID                  => NULL,
		PRODUCT_NO                  => NULL,
        PRODUCT_NAME_AR             => NULL,
		PRODUCT_NAME_EN             =>NULL,
		BARCODE                     => NULL,
		PURCHASE_QUANTITY_TOTAL     =>NULL,
		PURCHASE_AMOUNT_TOTAL       =>NULL,
		SALES_QUANTITY_TOTAL        =>NULL,
		SALES_AMOUNT_TOTAL          =>NULL
    );
    V_SALES_PURCHASES_PRODUCT_TBL SALES_PURCHASES_PRODUCT_TBL := SALES_PURCHASES_PRODUCT_TBL();
    V_INDEX NUMBER := 0;
    v_sales number;
BEGIN

        FOR REC IN (
            SELECT
			P.PRODUCT_ID,
			P.PRODUCT_NO,
			P.BARCODE,
            P.PRODUCT_NAME_AR PRODUCT_NAME_AR,
            P.PRODUCT_NAME_EN PRODUCT_NAME_EN,
            NVL(SUM(D.QUANTITY),0) QUANTITY,
            NVL(SUM(D.TOTAL_AMOUNT),0) TOTAL_AMOUNT
        FROM
            SALES_INV_DTL D JOIN SALES_INV I ON D.INVOICE_ID= I.INVOICE_ID 
            JOIN SALES_PRODUCT P ON D.PRODUCT_ID = P.PRODUCT_ID 
            WHERE I.COMPANY_ID= p_COMPANY_ID  AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
            GROUP BY P.PRODUCT_ID,P.PRODUCT_NO,P.BARCODE,P.PRODUCT_NAME_AR,P.PRODUCT_NAME_EN)
        LOOP
		V_SALES_PURCHASES_PRODUCT_REC.PRODUCT_ID                  :=REC.PRODUCT_ID ;
        V_SALES_PURCHASES_PRODUCT_REC.PRODUCT_NO                  :=REC.PRODUCT_NO ;
        V_SALES_PURCHASES_PRODUCT_REC.PRODUCT_NAME_AR             :=REC.PRODUCT_NAME_AR ;
        V_SALES_PURCHASES_PRODUCT_REC.PRODUCT_NAME_EN             :=REC.PRODUCT_NAME_EN ;
        V_SALES_PURCHASES_PRODUCT_REC.BARCODE                     :=REC.BARCODE ;
		V_SALES_PURCHASES_PRODUCT_REC.SALES_QUANTITY_TOTAL        :=REC.QUANTITY ;
        V_SALES_PURCHASES_PRODUCT_REC.SALES_AMOUNT_TOTAL          :=REC.TOTAL_AMOUNT ;

		SELECT
            NVL(SUM(D.QUANTITY),0) QUANTITY,
            NVL(SUM(D.TOTAL_AMOUNT),0) TOTAL_AMOUNT
			INTO 
			 V_SALES_PURCHASES_PRODUCT_REC.PURCHASE_QUANTITY_TOTAL        ,
             V_SALES_PURCHASES_PRODUCT_REC.PURCHASE_AMOUNT_TOTAL         
        FROM
            SALES_PURCHASE_INV_DTL D JOIN SALES_PURCHASE_INV I ON D.INVOICE_ID= I.INVOICE_ID 
            JOIN SALES_PRODUCT P ON D.PRODUCT_ID = P.PRODUCT_ID 
            WHERE I.COMPANY_ID= p_COMPANY_ID 
            AND P.PRODUCT_ID=REC.PRODUCT_ID
			AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
           ;

            V_SALES_PURCHASES_PRODUCT_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_SALES_PURCHASES_PRODUCT_TBL(V_INDEX) := V_SALES_PURCHASES_PRODUCT_REC;
        END LOOP;

          FOR REC IN (
            SELECT
			P.PRODUCT_ID,
			P.PRODUCT_NO,
			P.BARCODE,
            P.PRODUCT_NAME_AR PRODUCT_NAME_AR,
            P.PRODUCT_NAME_EN PRODUCT_NAME_EN,
            NVL(SUM(D.QUANTITY),0) QUANTITY,
            NVL(SUM(D.TOTAL_AMOUNT),0) TOTAL_AMOUNT
        FROM
            SALES_PURCHASE_INV_DTL D JOIN SALES_PURCHASE_INV I ON D.INVOICE_ID= I.INVOICE_ID 
            JOIN SALES_PRODUCT P ON D.PRODUCT_ID = P.PRODUCT_ID 
            WHERE I.COMPANY_ID= p_COMPANY_ID  AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
            GROUP BY P.PRODUCT_ID,P.PRODUCT_NO,P.BARCODE,P.PRODUCT_NAME_AR,P.PRODUCT_NAME_EN)
        LOOP
        v_sales :=0;
        select count(*)
          into
            v_sales
         FROM
            SALES_INV_DTL D JOIN SALES_INV I ON D.INVOICE_ID= I.INVOICE_ID 
            JOIN SALES_PRODUCT P ON D.PRODUCT_ID = P.PRODUCT_ID 
            WHERE I.COMPANY_ID= p_COMPANY_ID 
            AND P.PRODUCT_ID=REC.PRODUCT_ID
			AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
           ;
         if v_sales =0 then
            V_SALES_PURCHASES_PRODUCT_REC.PRODUCT_ID                  :=REC.PRODUCT_ID ;
            V_SALES_PURCHASES_PRODUCT_REC.PRODUCT_NO                  :=REC.PRODUCT_NO ;
            V_SALES_PURCHASES_PRODUCT_REC.PRODUCT_NAME_AR             :=REC.PRODUCT_NAME_AR ;
            V_SALES_PURCHASES_PRODUCT_REC.PRODUCT_NAME_EN             :=REC.PRODUCT_NAME_EN ;
            V_SALES_PURCHASES_PRODUCT_REC.BARCODE                     :=REC.BARCODE ;
             V_SALES_PURCHASES_PRODUCT_REC.PURCHASE_QUANTITY_TOTAL     :=REC.QUANTITY ;   
            V_SALES_PURCHASES_PRODUCT_REC.PURCHASE_AMOUNT_TOTAL  :=REC.TOTAL_AMOUNT ;
            V_SALES_PURCHASES_PRODUCT_REC.SALES_QUANTITY_TOTAL        :=0 ;
            V_SALES_PURCHASES_PRODUCT_REC.SALES_AMOUNT_TOTAL          :=0 ;


                V_SALES_PURCHASES_PRODUCT_TBL.EXTEND;
                V_INDEX := V_INDEX+1;
                V_SALES_PURCHASES_PRODUCT_TBL(V_INDEX) := V_SALES_PURCHASES_PRODUCT_REC;
         end if;
        END LOOP;
    RETURN V_SALES_PURCHASES_PRODUCT_TBL;
END SALES_PURCHASES_PRODUCT_R;


/
--------------------------------------------------------
--  DDL for Function SALES_PUR_RETURN_INV_SUMMARY_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "SALES_PUR_RETURN_INV_SUMMARY_R" (
    P_FROM_DATE    VARCHAR2,
    P_TO_DATE      VARCHAR2,
    P_BRANCH_ID    NUMBER ,
	p_COMPANY_ID   NUMBER,
    P_PROVIDER_ID  NUMBER DEFAULT 0
) RETURN SALES_PUR_RETURN_INV_SUMMARY_TBL AS 
  
    V_SALES_PUR_RETURN_INV_SUMMARY_REC SALES_PUR_RETURN_INV_SUMMARY_REC := SALES_PUR_RETURN_INV_SUMMARY_REC(
        INVOICE_NO                  => NULL,
        INVOICE_DATE                => NULL,
        PRE_TAX_TOTAL_AMOUNT        => NULL,
        TOTAL_DISCOUNT              => NULL,
        POST_DISCOUNT_TOTAL_AMOUNT  => NULL,
        TOTAL_VAT                   => NULL,
        INVOICE_TOTAL_AMOUNT        => NULL,
        PROVIDER_NAME_AR            => NULL,
        PROVIDER_NAME_EN            => NULL,
        PROVIDER_TAX_NO             =>NULL,
        INVOICE_TYPE_AR              => NULL,
        INVOICE_TYPE_EN              => NULL,
        INVOICE_TYPE                => NULL,
        PROVIDER_ID                 => NULL,
        PURCHASE_INV_NO             => NULL,
		PURCHASE_INV_DATE           => NULL,
		BRANCH_NAME_AR              => NULL,
		BRANCH_NAME_EN              => NULL,
		BRANCH_ID                   => NULL,
		PROVIDER_MAIN_AR            => NULL,
		PROVIDER_MAIN_EN            => NULL
    );
    V_SALES_PUR_RETURN_INV_SUMMARY_TBL SALES_PUR_RETURN_INV_SUMMARY_TBL := SALES_PUR_RETURN_INV_SUMMARY_TBL();
    V_INDEX NUMBER := 0;
BEGIN

        FOR REC IN (
            SELECT
                I.INVOICE_NO,
				TO_CHAR(I.INVOICE_DATE,'DD-MM-YYYY') AS INVOICE_DATE,
                I.BRANCH_ID,
                B.NAME_AR BRANCH_NAME_AR,
                B.NAME_EN BRANCH_NAME_EN,
                PRE_TAX_TOTAL_AMOUNT,
                TOTAL_DISCOUNT,
                POST_DISCOUNT_TOTAL_AMOUNT,
                TOTAL_VAT,
				INVOICE_TOTAL_AMOUNT,
				PURCHASE_INV_ID,
				INVOICE_TYPE,
				P.NAME_AR  AS PROVIDER_NAME_AR,
				P.NAME_EN  AS PROVIDER_NAME_EN,
                P.TAX_NO,
				I.PROVIDER_ID
            FROM SALES_PUR_RETURN_INV I JOIN SETUP_BRANCH B ON I.BRANCH_ID = B.BRANCH_ID
			     JOIN SALES_PROVIDER P ON I.PROVIDER_ID = P.PROVIDER_ID
            WHERE I.COMPANY_ID=P_COMPANY_ID AND (I.BRANCH_ID= P_BRANCH_ID ) AND (I.PROVIDER_ID= P_PROVIDER_ID OR P_PROVIDER_ID = 0) AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY'))

        LOOP
		V_SALES_PUR_RETURN_INV_SUMMARY_REC.INVOICE_NO                  :=REC.INVOICE_NO ;
        V_SALES_PUR_RETURN_INV_SUMMARY_REC.INVOICE_DATE                :=REC.INVOICE_DATE ;
        V_SALES_PUR_RETURN_INV_SUMMARY_REC.PRE_TAX_TOTAL_AMOUNT        :=REC.PRE_TAX_TOTAL_AMOUNT ;
        V_SALES_PUR_RETURN_INV_SUMMARY_REC.TOTAL_DISCOUNT              :=REC.TOTAL_DISCOUNT ;
        V_SALES_PUR_RETURN_INV_SUMMARY_REC.POST_DISCOUNT_TOTAL_AMOUNT  :=REC.POST_DISCOUNT_TOTAL_AMOUNT ;
        V_SALES_PUR_RETURN_INV_SUMMARY_REC.TOTAL_VAT                   :=REC.TOTAL_VAT ;
        V_SALES_PUR_RETURN_INV_SUMMARY_REC.INVOICE_TOTAL_AMOUNT        :=REC.INVOICE_TOTAL_AMOUNT ;
        V_SALES_PUR_RETURN_INV_SUMMARY_REC.PROVIDER_NAME_AR            :=REC.PROVIDER_NAME_AR ;
        V_SALES_PUR_RETURN_INV_SUMMARY_REC.PROVIDER_NAME_EN            :=REC.PROVIDER_NAME_EN ;
        V_SALES_PUR_RETURN_INV_SUMMARY_REC.INVOICE_TYPE                :=REC.INVOICE_TYPE ;
        V_SALES_PUR_RETURN_INV_SUMMARY_REC.PROVIDER_ID                 :=REC.PROVIDER_ID ;
        V_SALES_PUR_RETURN_INV_SUMMARY_REC.PROVIDER_TAX_NO                 :=REC.TAX_NO ;
		V_SALES_PUR_RETURN_INV_SUMMARY_REC.BRANCH_NAME_AR              :=REC.BRANCH_NAME_AR ;
		V_SALES_PUR_RETURN_INV_SUMMARY_REC.BRANCH_NAME_EN              :=REC.BRANCH_NAME_EN ;
		V_SALES_PUR_RETURN_INV_SUMMARY_REC.BRANCH_ID                   :=REC.BRANCH_ID ;
		IF P_PROVIDER_ID =0 THEN
		  V_SALES_PUR_RETURN_INV_SUMMARY_REC.PROVIDER_MAIN_AR          :='الكل';
		  V_SALES_PUR_RETURN_INV_SUMMARY_REC.PROVIDER_MAIN_EN          :='All';
		 else
		  V_SALES_PUR_RETURN_INV_SUMMARY_REC.PROVIDER_MAIN_AR          :=REC.PROVIDER_NAME_AR;
		  V_SALES_PUR_RETURN_INV_SUMMARY_REC.PROVIDER_MAIN_EN          :=REC.PROVIDER_NAME_EN;
		end if;
		SELECT
			'مردود شراء ' ||  ITEM_NOTE_AR  INV_TYPE_AR,
			'Purchase Return ' ||ITEM_NOTE_EN  INV_TYPE_EN
		INTO 
		      V_SALES_PUR_RETURN_INV_SUMMARY_REC.INVOICE_TYPE_AR        ,
              V_SALES_PUR_RETURN_INV_SUMMARY_REC.INVOICE_TYPE_EN 
		FROM
			ADMIN_LIST_ITEM
		WHERE LIST_ID = 5 AND ITEM_NO = REC.INVOICE_TYPE;
            SELECT
               INVOICE_NO,
			   TO_CHAR(INVOICE_DATE,'DD-MM-YYYY') 
            INTO 
			  V_SALES_PUR_RETURN_INV_SUMMARY_REC.PURCHASE_INV_NO             ,
		      V_SALES_PUR_RETURN_INV_SUMMARY_REC.PURCHASE_INV_DATE          
            FROM SALES_PURCHASE_INV
			WHERE INVOICE_ID=REC.PURCHASE_INV_ID;
            V_SALES_PUR_RETURN_INV_SUMMARY_TBL.EXTEND;
            V_INDEX := V_INDEX+1;
            V_SALES_PUR_RETURN_INV_SUMMARY_TBL(V_INDEX) := V_SALES_PUR_RETURN_INV_SUMMARY_REC;
        END LOOP;

    RETURN V_SALES_PUR_RETURN_INV_SUMMARY_TBL;
END SALES_PUR_RETURN_INV_SUMMARY_R;


/
--------------------------------------------------------
--  DDL for Function SALES_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "SALES_R" (
    P_COMPANY_ID   NUMBER,
    P_FROM_DATE    VARCHAR2,
    P_TO_DATE      VARCHAR2,
    P_BRANCH_ID    NUMBER DEFAULT 0
) RETURN SALES_PURCHASE_TBL AS 
    V_SALES_PURCHASE_REC SALES_PURCHASE_REC := SALES_PURCHASE_REC(
        TRANS_TYPE_AR       => NULL,
        TRANS_TYPE_EN       => NULL,
        C_NAME_AR           => NULL,
        C_NAME_EN           => NULL,
        INVOICE_DATE        => NULL,
        INVOICE_NO          => NULL,
        PRE_TAX_AMOUNT      => NULL,
        VAT_VALUE           => NULL,
        TOTAL_AMOUNT        => NULL,
        C_TAX_NO            => NULL,
        PROVIDER_INV_ID     => NULL,
        PRE_DISCOUNT_AMOUNT => NULL,
        TOTAL_DISCOUNT      => NULL
    );
    V_SALES_PURCHASE_TBL SALES_PURCHASE_TBL := SALES_PURCHASE_TBL();
    V_INDEX NUMBER := 0;
BEGIN
    FOR REC IN (
        SELECT
            'بيع'                       TRANS_TYPE_AR,
            'Sale'                      TRANS_TYPE_EN,
            TO_CHAR(INVOICE_DATE,'dd-mm-yyyy')  INVOICE_DATE,
            INVOICE_NO                  INVOICE_NO,
            POST_DISCOUNT_TOTAL_AMOUNT  PRE_TAX_AMOUNT,
            TOTAL_VAT                   VAT_VALUE,
            INVOICE_TOTAL_AMOUNT        TOTAL_AMOUNT,
            C.NAME_AR                   C_NAME_AR,
            C.NAME_EN                   C_NAME_EN,
            PRE_TAX_TOTAL_AMOUNT        PRE_DISCOUNT_AMOUNT,
            TOTAL_DISCOUNT              TOTAL_DISCOUNT,
            C.TAX_NO                    C_TAX_NO
    FROM
        SALES_INV INV left JOIN SALES_CLIENT C ON INV.CLIENT_ID = C.CLIENT_ID
        WHERE INV.COMPANY_ID = P_COMPANY_ID AND (BRANCH_ID = NVL(P_BRANCH_ID,0) OR NVL(P_BRANCH_ID,0) = 0) AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
    )
    LOOP
        V_SALES_PURCHASE_REC.TRANS_TYPE_AR          := REC.TRANS_TYPE_AR;
        V_SALES_PURCHASE_REC.TRANS_TYPE_EN          := REC.TRANS_TYPE_EN;
        V_SALES_PURCHASE_REC.INVOICE_NO             := REC.INVOICE_NO;
        V_SALES_PURCHASE_REC.INVOICE_DATE           := REC.INVOICE_DATE;
        V_SALES_PURCHASE_REC.PRE_TAX_AMOUNT         := REC.PRE_TAX_AMOUNT;
        V_SALES_PURCHASE_REC.VAT_VALUE              := REC.VAT_VALUE;
        V_SALES_PURCHASE_REC.TOTAL_AMOUNT           := REC.TOTAL_AMOUNT;
        V_SALES_PURCHASE_REC.C_NAME_AR              := REC.C_NAME_AR;
        V_SALES_PURCHASE_REC.C_NAME_EN              := REC.C_NAME_EN;
        V_SALES_PURCHASE_REC.PRE_DISCOUNT_AMOUNT    := REC.PRE_DISCOUNT_AMOUNT;
        V_SALES_PURCHASE_REC.TOTAL_DISCOUNT         := REC.TOTAL_DISCOUNT;
        V_SALES_PURCHASE_REC.C_TAX_NO               := REC.C_TAX_NO;
        V_SALES_PURCHASE_TBL.EXTEND;
        V_INDEX := V_INDEX+1;
        V_SALES_PURCHASE_TBL(V_INDEX) := V_SALES_PURCHASE_REC;
    END LOOP;

    FOR REC IN (
        SELECT
            'مردود بيع'                 TRANS_TYPE_AR,
            'Sales Return'              TRANS_TYPE_EN,
            TO_CHAR(INVOICE_DATE,'dd-mm-yyyy')  INVOICE_DATE,
            INVOICE_NO                  INVOICE_NO,
            POST_DISCOUNT_TOTAL_AMOUNT  PRE_TAX_AMOUNT,
            TOTAL_VAT                   VAT_VALUE,
            INVOICE_TOTAL_AMOUNT        TOTAL_AMOUNT,
            C.NAME_AR                   C_NAME_AR,
            C.NAME_EN                   C_NAME_EN,
            PRE_TAX_TOTAL_AMOUNT        PRE_DISCOUNT_AMOUNT,
            TOTAL_DISCOUNT              TOTAL_DISCOUNT,
            C.TAX_NO                    C_TAX_NO
        FROM SALES_RETURN_INV I left JOIN SALES_CLIENT C ON I.CLIENT_ID = C.CLIENT_ID
        WHERE I.COMPANY_ID = P_COMPANY_ID AND (BRANCH_ID = NVL(P_BRANCH_ID,0) OR NVL(P_BRANCH_ID,0) = 0) AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
    )
    LOOP
        V_SALES_PURCHASE_REC.TRANS_TYPE_AR          := REC.TRANS_TYPE_AR;
        V_SALES_PURCHASE_REC.TRANS_TYPE_EN          := REC.TRANS_TYPE_EN;
        V_SALES_PURCHASE_REC.INVOICE_NO             := REC.INVOICE_NO;
        V_SALES_PURCHASE_REC.INVOICE_DATE           := REC.INVOICE_DATE;
        V_SALES_PURCHASE_REC.PRE_TAX_AMOUNT         := REC.PRE_TAX_AMOUNT;
        V_SALES_PURCHASE_REC.VAT_VALUE              := REC.VAT_VALUE;
        V_SALES_PURCHASE_REC.TOTAL_AMOUNT           := REC.TOTAL_AMOUNT;
        V_SALES_PURCHASE_REC.C_NAME_AR              := REC.C_NAME_AR;
        V_SALES_PURCHASE_REC.C_NAME_EN              := REC.C_NAME_EN;
        V_SALES_PURCHASE_REC.PRE_DISCOUNT_AMOUNT    := REC.PRE_DISCOUNT_AMOUNT;
        V_SALES_PURCHASE_REC.TOTAL_DISCOUNT         := REC.TOTAL_DISCOUNT;
        V_SALES_PURCHASE_REC.C_TAX_NO               := REC.C_TAX_NO;
        V_SALES_PURCHASE_TBL.EXTEND;
        V_INDEX := V_INDEX+1;
        V_SALES_PURCHASE_TBL(V_INDEX) := V_SALES_PURCHASE_REC;
    END LOOP;
    RETURN V_SALES_PURCHASE_TBL;
END SALES_R;


/
--------------------------------------------------------
--  DDL for Function SALES_WITH_NET_PROFITS_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "SALES_WITH_NET_PROFITS_R" (
    P_COMPANY_ID   NUMBER,
    P_FROM_DATE   VARCHAR2,
    P_TO_DATE     VARCHAR2,
    P_BRANCH_ID    NUMBER DEFAULT 0,
    P_PRODUCT_ID  NUMBER DEFAULT 0
) RETURN SALES_WITH_NET_PROFITS_TBL AS 
    V_SALES_WITH_NET_PROFITS_REC SALES_WITH_NET_PROFITS_REC := SALES_WITH_NET_PROFITS_REC(
        PRODUCT_NO    => NULL,
        PRODUCT_NAME_AR  => NULL,
        PRODUCT_NAME_EN  => NULL,
        QUANTITY         => NULL,
        DISCOUNT_VALUE   => NULL,
        VAT_VALUE        => NULL,
        TOTAL_AMOUNT     => NULL,
        PRODUCT_COST     => NULL,
        NET_PROFIT       => NULL
    );
    V_SALES_WITH_NET_PROFITS_TBL SALES_WITH_NET_PROFITS_TBL := SALES_WITH_NET_PROFITS_TBL();
    V_INDEX NUMBER := 0;
BEGIN
    FOR REC IN (
        SELECT
            P.PRODUCT_NO         PRODUCT_NO,
            P.PRODUCT_NAME_AR    PRODUCT_NAME_AR,
            P.PRODUCT_NAME_EN    PRODUCT_NAME_EN,
            D.QUANTITY           QUANTITY,
            D.DISCOUNT_VALUE     DISCOUNT_VALUE,
            D.VAT_VALUE          VAT_VALUE,
            D.TOTAL_AMOUNT       TOTAL_AMOUNT,
            P.PURCHASE_PRICE     PRODUCT_COST
        FROM
            SALES_INV_DTL D
            JOIN SALES_INV      I ON D.INVOICE_ID = I.INVOICE_ID
            JOIN SALES_PRODUCT  P ON D.PRODUCT_ID = P.PRODUCT_ID
            WHERE I.COMPANY_ID = P_COMPANY_ID AND (I.BRANCH_ID= NVL(P_BRANCH_ID,0) OR NVL(P_BRANCH_ID,0) = 0) AND (P.PRODUCT_ID = NVL(P_PRODUCT_ID,0) OR NVL(P_PRODUCT_ID,0) = 0) AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
            )
    LOOP
        V_SALES_WITH_NET_PROFITS_REC.PRODUCT_NO		:= REC.PRODUCT_NO   ;
        V_SALES_WITH_NET_PROFITS_REC.PRODUCT_NAME_AR	:= REC.PRODUCT_NAME_AR ;
        V_SALES_WITH_NET_PROFITS_REC.PRODUCT_NAME_EN	:= REC.PRODUCT_NAME_EN ;
        V_SALES_WITH_NET_PROFITS_REC.QUANTITY       	:= REC.QUANTITY        ;
        V_SALES_WITH_NET_PROFITS_REC.DISCOUNT_VALUE     := REC.DISCOUNT_VALUE           ;
        V_SALES_WITH_NET_PROFITS_REC.VAT_VALUE      	:= REC.VAT_VALUE       ;
        V_SALES_WITH_NET_PROFITS_REC.TOTAL_AMOUNT   	:= REC.TOTAL_AMOUNT    ;
        V_SALES_WITH_NET_PROFITS_REC.PRODUCT_COST   	:= REC.PRODUCT_COST    ;
        V_SALES_WITH_NET_PROFITS_REC.NET_PROFIT   	    := V_SALES_WITH_NET_PROFITS_REC.TOTAL_AMOUNT- V_SALES_WITH_NET_PROFITS_REC.PRODUCT_COST;
        V_SALES_WITH_NET_PROFITS_TBL.EXTEND;
        V_INDEX := V_INDEX+1;
        V_SALES_WITH_NET_PROFITS_TBL(V_INDEX) := V_SALES_WITH_NET_PROFITS_REC;
    END LOOP;
    RETURN V_SALES_WITH_NET_PROFITS_TBL;
END SALES_WITH_NET_PROFITS_R;


/
--------------------------------------------------------
--  DDL for Function STORES_STATISTICS_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "STORES_STATISTICS_R" (
    P_COM_ID    NUMBER,
    P_DATE      VARCHAR2 DEFAULT NULL,
    P_STORE_ID  NUMBER  DEFAULT 0
) RETURN STORES_STATISTICS_TBL AS 
    V_STORES_STATISTICS_REC STORES_STATISTICS_REC := STORES_STATISTICS_REC(
        PRODUCT_NO       => NULL,
        PRODUCT_BARCODE  => NULL,
        PRODUCT_NAME_AR  => NULL,
        PRODUCT_NAME_EN  => NULL,
		STORE_NAME_AR    => NULL,
		STORE_NAME_EN    => NULL,
        BAL              => NULL,
        COST_AVG         => NULL,
        COST_TOTAL       => NULL
    );
    V_STORES_STATISTICS_TBL STORES_STATISTICS_TBL := STORES_STATISTICS_TBL();
    V_INDEX NUMBER := 0;
    V_QUANTITY NUMBER := 0;
    V_COST NUMBER := 0;
    V_STORE_NAME_AR VARCHAR2(200);
    V_STORE_NAME_EN VARCHAR2(200);
BEGIN
IF P_STORE_ID= 0 THEN 
  V_STORE_NAME_AR   :='الكل';
  V_STORE_NAME_EN    :='All';
  else  
    select 
	  STORE_NAME_AR,
	  STORE_NAME_EN
	 into 
	  V_STORE_NAME_AR,
	  V_STORE_NAME_EN
	 from SETUP_STORE
	 where COMPANY_ID=P_COM_ID
	 and STORE_ID=P_STORE_ID;

  end if;
    FOR REC IN (
        SELECT
            P.PRODUCT_ID         PRODUCT_ID,
            P.PRODUCT_NO         PRODUCT_NO,
            P.BARCODE            PRODUCT_BARCODE,
            P.PRODUCT_NAME_AR    PRODUCT_NAME_AR,
            P.PRODUCT_NAME_EN    PRODUCT_NAME_EN
        FROM
            SALES_PRODUCT P
        WHERE COMPANY_ID = P_COM_ID
        )
    LOOP
        V_QUANTITY := 0;
        V_COST := 0;
        V_STORES_STATISTICS_REC.BAL :=0;
        V_STORES_STATISTICS_REC.PRODUCT_NO		:= REC.PRODUCT_NO   ;
        V_STORES_STATISTICS_REC.PRODUCT_BARCODE		:= REC.PRODUCT_BARCODE   ;
        V_STORES_STATISTICS_REC.PRODUCT_NAME_AR	:= REC.PRODUCT_NAME_AR ;
        V_STORES_STATISTICS_REC.PRODUCT_NAME_EN	:= REC.PRODUCT_NAME_EN ;
		V_STORES_STATISTICS_REC.STORE_NAME_AR	:= V_STORE_NAME_AR ;
        V_STORES_STATISTICS_REC.STORE_NAME_EN	:= V_STORE_NAME_EN ;
        SELECT V_STORES_STATISTICS_REC.BAL+NVL(SUM(QUANTITY),0),NVL(SUM(QUANTITY),0),NVL(SUM(TOTAL_AMOUNT),0)
        INTO V_STORES_STATISTICS_REC.BAL,V_QUANTITY,V_COST
        FROM SALES_PURCHASE_INV_DTL D JOIN SALES_PURCHASE_INV I ON I.INVOICE_ID  = D.INVOICE_ID
        WHERE I.COMPANY_ID = P_COM_ID AND (I.STORE_ID = P_STORE_ID OR P_STORE_ID=0) AND  D.PRODUCT_ID = REC.PRODUCT_ID AND  (P_DATE IS NULL OR (P_DATE IS NOT NULL AND INVOICE_DATE<= TO_DATE(P_DATE,'DD-MM-YYYY')));

        SELECT V_STORES_STATISTICS_REC.BAL+NVL(SUM(QUANTITY),0)
        INTO V_STORES_STATISTICS_REC.BAL
        FROM SALES_RETURN_INV_DTL D JOIN SALES_RETURN_INV I ON I.INVOICE_ID  = D.INVOICE_ID
        WHERE I.COMPANY_ID = P_COM_ID AND (I.STORE_ID = P_STORE_ID OR P_STORE_ID=0) AND  D.PRODUCT_ID = REC.PRODUCT_ID AND  (P_DATE IS NULL OR (P_DATE IS NOT NULL AND INVOICE_DATE<= TO_DATE(P_DATE,'DD-MM-YYYY')));

        SELECT V_STORES_STATISTICS_REC.BAL+NVL(SUM(QUANTITY),0)
        INTO V_STORES_STATISTICS_REC.BAL
        FROM STORE_STOCKIN_ORDER_DTL D JOIN STORE_STOCKIN_ORDER I ON I.ORDER_ID  = D.ORDER_ID
        WHERE I.COMPANY_ID = P_COM_ID AND (I.STORE_ID = P_STORE_ID  OR P_STORE_ID=0) AND  D.PRODUCT_ID = REC.PRODUCT_ID AND (P_DATE IS NULL OR (P_DATE IS NOT NULL AND ORDER_DATE<= TO_DATE(P_DATE,'DD-MM-YYYY')));

        SELECT V_STORES_STATISTICS_REC.BAL+NVL(SUM(QUANTITY),0)
        INTO V_STORES_STATISTICS_REC.BAL
        FROM STORE_FIRST_PERIOD_STOCK_DTL D JOIN STORE_FIRST_PERIOD_STOCK I ON I.INVOICE_ID  = D.INVOICE_ID
        WHERE I.COMPANY_ID = P_COM_ID AND (I.STORE_ID = P_STORE_ID OR P_STORE_ID=0) AND  D.PRODUCT_ID = REC.PRODUCT_ID AND  (P_DATE IS NULL OR (P_DATE IS NOT NULL AND INVOICE_DATE<= TO_DATE(P_DATE,'DD-MM-YYYY')));

        SELECT V_STORES_STATISTICS_REC.BAL+NVL(SUM(QUANTITY),0)
        INTO V_STORES_STATISTICS_REC.BAL
        FROM STORE_TRANSFER_DTL D JOIN STORE_TRANSFER I ON I.TRANSFER_ID  = D.TRANSFER_ID
        WHERE I.COMPANY_ID = P_COM_ID AND (I.TO_STORE_ID = P_STORE_ID OR P_STORE_ID=0) AND  HAS_RECEIVED = 1 AND D.PRODUCT_ID = REC.PRODUCT_ID AND (P_DATE IS NULL OR (P_DATE IS NOT NULL AND TRANSFER_DATE<= TO_DATE(P_DATE,'DD-MM-YYYY')));

        SELECT V_STORES_STATISTICS_REC.BAL-NVL(SUM(QUANTITY),0),V_QUANTITY-NVL(SUM(QUANTITY),0),V_COST-NVL(SUM(TOTAL_AMOUNT),0)
        INTO V_STORES_STATISTICS_REC.BAL,V_QUANTITY,V_COST
        FROM SALES_PUR_RETURN_INV_DTL D JOIN SALES_PUR_RETURN_INV I ON I.INVOICE_ID  = D.INVOICE_ID
        WHERE I.COMPANY_ID = P_COM_ID AND (I.STORE_ID = P_STORE_ID OR P_STORE_ID=0) AND D.PRODUCT_ID = REC.PRODUCT_ID AND  (P_DATE IS NULL OR (P_DATE IS NOT NULL AND INVOICE_DATE<= TO_DATE(P_DATE,'DD-MM-YYYY')));

        SELECT V_STORES_STATISTICS_REC.BAL-NVL(SUM(QUANTITY),0)
        INTO V_STORES_STATISTICS_REC.BAL
        FROM SALES_INV_DTL D JOIN SALES_INV I ON I.INVOICE_ID  = D.INVOICE_ID
        WHERE I.COMPANY_ID = P_COM_ID AND (I.STORE_ID = P_STORE_ID OR P_STORE_ID=0) AND  D.PRODUCT_ID = REC.PRODUCT_ID AND  (P_DATE IS NULL OR (P_DATE IS NOT NULL AND INVOICE_DATE<= TO_DATE(P_DATE,'DD-MM-YYYY')));

        SELECT V_STORES_STATISTICS_REC.BAL-NVL(SUM(QUANTITY),0)
        INTO V_STORES_STATISTICS_REC.BAL
        FROM STORE_STOCKOUT_ORDER_DTL D JOIN STORE_STOCKOUT_ORDER I ON I.ORDER_ID  = D.ORDER_ID
        WHERE I.COMPANY_ID = P_COM_ID AND (I.STORE_ID = P_STORE_ID OR P_STORE_ID=0) AND  D.PRODUCT_ID = REC.PRODUCT_ID AND  (P_DATE IS NULL OR (P_DATE IS NOT NULL AND ORDER_DATE<= TO_DATE(P_DATE,'DD-MM-YYYY')));

        SELECT V_STORES_STATISTICS_REC.BAL-NVL(SUM(QUANTITY),0)
        INTO V_STORES_STATISTICS_REC.BAL
        FROM STORE_TRANSFER_DTL D JOIN STORE_TRANSFER I ON I.TRANSFER_ID  = D.TRANSFER_ID
        WHERE I.COMPANY_ID = P_COM_ID AND (I.FROM_STORE_ID = P_STORE_ID OR P_STORE_ID=0) AND  HAS_RECEIVED = 1 AND D.PRODUCT_ID = REC.PRODUCT_ID AND  (P_DATE IS NULL OR (P_DATE IS NOT NULL AND TRANSFER_DATE<= TO_DATE(P_DATE,'DD-MM-YYYY')));

        SELECT ROUND(V_COST/DECODE(V_QUANTITY,0,1,V_QUANTITY),5)
        INTO V_STORES_STATISTICS_REC.COST_AVG
        FROM DUAL;
        V_STORES_STATISTICS_REC.COST_TOTAL:= ROUND(V_STORES_STATISTICS_REC.COST_AVG*V_STORES_STATISTICS_REC.BAL,5);

        V_STORES_STATISTICS_TBL.EXTEND;
        V_INDEX := V_INDEX+1;
        V_STORES_STATISTICS_TBL(V_INDEX) := V_STORES_STATISTICS_REC;
    END LOOP;
    RETURN V_STORES_STATISTICS_TBL;
END STORES_STATISTICS_R;

/
--------------------------------------------------------
--  DDL for Function STORE_PRODUCT_TOTAL_MOVEMENTS_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "STORE_PRODUCT_TOTAL_MOVEMENTS_R" (
    P_COM_ID    NUMBER,
    P_PRODUCT_ID  NUMBER DEFAULT 0
) RETURN PRODUCT_MOVEMENTS_TBL AS 
    V_PRODUCT_MOVEMENTS_REC PRODUCT_MOVEMENTS_REC := PRODUCT_MOVEMENTS_REC(
        PRODUCT_NO       => NULL,
        PRODUCT_BARCODE  => NULL,
        PRODUCT_NAME_AR  => NULL,
        PRODUCT_NAME_EN  => NULL,
		MAIN_PRODUCT_NAME_AR  => NULL,
        MAIN_PRODUCT_NAME_EN  => NULL,
        BAL              => NULL,
        COST_AVG         => NULL,
        COST_TOTAL       => NULL,
		FIRST_PERIOD     => NULL,
		PURCHASE   => NULL,
		PUR_RETURN => NULL,
		SALES            => NULL,
		SALES_RETURN     => NULL,
		STOCKIN          => NULL,
		STOCKOUT         => NULL,
		ADJUSTMENT       =>NULL
		                           
    );
    V_PRODUCT_MOVEMENTS_TBL PRODUCT_MOVEMENTS_TBL := PRODUCT_MOVEMENTS_TBL();
    V_INDEX NUMBER := 0;
    V_QUANTITY NUMBER := 0;
    V_COST NUMBER := 0;
	V_MAIN_PRODUCT_NAME_AR  VARCHAR2(100);
	V_MAIN_PRODUCT_NAME_EN  VARCHAR2(100);
BEGIN
   IF P_PRODUCT_ID=0 THEN  
   V_MAIN_PRODUCT_NAME_AR :='الكل';
   V_MAIN_PRODUCT_NAME_EN :='All';
   ELSE  
     select 
	 PRODUCT_NAME_AR,
	 PRODUCT_NAME_EN
	 into 
	 V_MAIN_PRODUCT_NAME_AR,
	 V_MAIN_PRODUCT_NAME_EN
	 from SALES_PRODUCT
	 where 
	 COMPANY_ID=P_COM_ID
	 and PRODUCT_ID=P_PRODUCT_ID
	 ;
   END IF;
    FOR REC IN (
        SELECT
            P.PRODUCT_ID         PRODUCT_ID,
            P.PRODUCT_NO         PRODUCT_NO,
            P.BARCODE            PRODUCT_BARCODE,
            P.PRODUCT_NAME_AR    PRODUCT_NAME_AR,
            P.PRODUCT_NAME_EN    PRODUCT_NAME_EN
        FROM
            SALES_PRODUCT P
        WHERE COMPANY_ID = P_COM_ID
		AND (PRODUCT_ID=P_PRODUCT_ID OR P_PRODUCT_ID=0)
        )
    LOOP
        V_QUANTITY := 0;
        V_COST := 0;
        V_PRODUCT_MOVEMENTS_REC.BAL :=0;
        V_PRODUCT_MOVEMENTS_REC.PRODUCT_NO		:= REC.PRODUCT_NO   ;
        V_PRODUCT_MOVEMENTS_REC.PRODUCT_BARCODE		:= REC.PRODUCT_BARCODE   ;
        V_PRODUCT_MOVEMENTS_REC.PRODUCT_NAME_AR	:= REC.PRODUCT_NAME_AR ;
        V_PRODUCT_MOVEMENTS_REC.PRODUCT_NAME_EN	:= REC.PRODUCT_NAME_EN ;
		V_PRODUCT_MOVEMENTS_REC.MAIN_PRODUCT_NAME_AR	:= V_MAIN_PRODUCT_NAME_AR ;
        V_PRODUCT_MOVEMENTS_REC.MAIN_PRODUCT_NAME_EN	:= V_MAIN_PRODUCT_NAME_EN ;
		 V_PRODUCT_MOVEMENTS_REC.ADJUSTMENT	:= 0 ;
        SELECT V_PRODUCT_MOVEMENTS_REC.BAL+NVL(SUM(QUANTITY),0),NVL(SUM(QUANTITY),0),NVL(SUM(TOTAL_AMOUNT),0),NVL(SUM(QUANTITY),0)
        INTO V_PRODUCT_MOVEMENTS_REC.BAL,V_QUANTITY,V_COST,V_PRODUCT_MOVEMENTS_REC.PURCHASE
        FROM SALES_PURCHASE_INV_DTL D JOIN SALES_PURCHASE_INV I ON I.INVOICE_ID  = D.INVOICE_ID
        WHERE I.COMPANY_ID = P_COM_ID  AND  D.PRODUCT_ID = REC.PRODUCT_ID ;

        SELECT V_PRODUCT_MOVEMENTS_REC.BAL+NVL(SUM(QUANTITY),0),NVL(SUM(QUANTITY),0)
        INTO V_PRODUCT_MOVEMENTS_REC.BAL,V_PRODUCT_MOVEMENTS_REC.SALES_RETURN
        FROM SALES_RETURN_INV_DTL D JOIN SALES_RETURN_INV I ON I.INVOICE_ID  = D.INVOICE_ID
        WHERE I.COMPANY_ID = P_COM_ID AND  D.PRODUCT_ID = REC.PRODUCT_ID ;

        SELECT V_PRODUCT_MOVEMENTS_REC.BAL+NVL(SUM(QUANTITY),0),NVL(SUM(QUANTITY),0)
        INTO V_PRODUCT_MOVEMENTS_REC.BAL,V_PRODUCT_MOVEMENTS_REC.STOCKIN
        FROM STORE_STOCKIN_ORDER_DTL D JOIN STORE_STOCKIN_ORDER I ON I.ORDER_ID  = D.ORDER_ID
        WHERE I.COMPANY_ID = P_COM_ID  AND  D.PRODUCT_ID = REC.PRODUCT_ID ;

        SELECT V_PRODUCT_MOVEMENTS_REC.BAL+NVL(SUM(QUANTITY),0),NVL(SUM(QUANTITY),0)
        INTO V_PRODUCT_MOVEMENTS_REC.BAL,V_PRODUCT_MOVEMENTS_REC.FIRST_PERIOD
        FROM STORE_FIRST_PERIOD_STOCK_DTL D JOIN STORE_FIRST_PERIOD_STOCK I ON I.INVOICE_ID  = D.INVOICE_ID
        WHERE I.COMPANY_ID = P_COM_ID  AND  D.PRODUCT_ID = REC.PRODUCT_ID ;


        SELECT V_PRODUCT_MOVEMENTS_REC.BAL-NVL(SUM(QUANTITY),0),V_QUANTITY-NVL(SUM(QUANTITY),0),V_COST-NVL(SUM(TOTAL_AMOUNT),0),NVL(SUM(QUANTITY),0)
        INTO V_PRODUCT_MOVEMENTS_REC.BAL,V_QUANTITY,V_COST,V_PRODUCT_MOVEMENTS_REC.PUR_RETURN
        FROM SALES_PUR_RETURN_INV_DTL D JOIN SALES_PUR_RETURN_INV I ON I.INVOICE_ID  = D.INVOICE_ID
        WHERE I.COMPANY_ID = P_COM_ID AND D.PRODUCT_ID = REC.PRODUCT_ID ;

        SELECT V_PRODUCT_MOVEMENTS_REC.BAL-NVL(SUM(QUANTITY),0),NVL(SUM(QUANTITY),0)
        INTO V_PRODUCT_MOVEMENTS_REC.BAL,V_PRODUCT_MOVEMENTS_REC.SALES
        FROM SALES_INV_DTL D JOIN SALES_INV I ON I.INVOICE_ID  = D.INVOICE_ID
        WHERE I.COMPANY_ID = P_COM_ID  AND  D.PRODUCT_ID = REC.PRODUCT_ID ;

        SELECT V_PRODUCT_MOVEMENTS_REC.BAL-NVL(SUM(QUANTITY),0),NVL(SUM(QUANTITY),0)
        INTO V_PRODUCT_MOVEMENTS_REC.BAL,V_PRODUCT_MOVEMENTS_REC.STOCKOUT
        FROM STORE_STOCKOUT_ORDER_DTL D JOIN STORE_STOCKOUT_ORDER I ON I.ORDER_ID  = D.ORDER_ID
        WHERE I.COMPANY_ID = P_COM_ID  AND  D.PRODUCT_ID = REC.PRODUCT_ID ;



        SELECT ROUND(V_COST/DECODE(V_QUANTITY,0,1,V_QUANTITY),5)
        INTO V_PRODUCT_MOVEMENTS_REC.COST_AVG
        FROM DUAL;
        V_PRODUCT_MOVEMENTS_REC.COST_TOTAL:= ROUND(V_PRODUCT_MOVEMENTS_REC.COST_AVG*V_PRODUCT_MOVEMENTS_REC.BAL,5);

        V_PRODUCT_MOVEMENTS_TBL.EXTEND;
        V_INDEX := V_INDEX+1;
        V_PRODUCT_MOVEMENTS_TBL(V_INDEX) := V_PRODUCT_MOVEMENTS_REC;
    END LOOP;
    RETURN V_PRODUCT_MOVEMENTS_TBL;
END STORE_PRODUCT_TOTAL_MOVEMENTS_R;

/
--------------------------------------------------------
--  DDL for Function TAX_RETURN_R
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "TAX_RETURN_R" (
    P_FROM_DATE    VARCHAR2,
    P_TO_DATE      VARCHAR2,
    P_COMPANY_ID   NUMBER,
    P_COST_CTR_ID  NUMBER DEFAULT 0,
    P_BRANCH_ID    NUMBER DEFAULT 0
) RETURN TAX_RETURN_TBL AS 
    V_TAX_RETURN_REC TAX_RETURN_REC := TAX_RETURN_REC (
    COST_CTR_NAME_AR                     => NULL,
    COST_CTR_NAME_EN                     => NULL,
    BRANCH_NAME_AR                       => NULL,
    BRANCH_NAME_EN                       => NULL,
    AMOUNT_OF_SALES_UNDER_VAT            => NULL,
    VAT_OF_SALES_UNDER_VAT               => NULL,
    AMOUNT_OF_SALES_WITH_ZERO_VAT        => NULL,
    AMOUNT_OF_SALES_WITH_VAT_EXEMPT      => NULL,
    AMOUNT_OF_PURCHASES_UNDER_VAT        => NULL,
    VAT_OF_PURCHASES_UNDER_VAT           => NULL,
    AMOUNT_OF_PURCHASES_WITH_ZERO_VAT    => NULL,
    AMOUNT_OF_PURCHASES_WITH_VAT_EXEMPT  => NULL,
    OPERATIONAL_EXPENSES                 => NULL,
    OPERATIONAL_EXPENSES_VAT             => NULL
    );
    V_TAX_RETURN_TBL TAX_RETURN_TBL := TAX_RETURN_TBL();
    V_INDEX NUMBER := 0;
BEGIN
    SELECT
        NVL(SUM(POST_DISCOUNT_TOTAL_PRICE),0)     PRE_TAX_INV_SUM,
        NVL(SUM(VAT_VALUE),0)                     VAT_SUM
    INTO
        V_TAX_RETURN_REC.AMOUNT_OF_SALES_UNDER_VAT,
        V_TAX_RETURN_REC.VAT_OF_SALES_UNDER_VAT
    FROM
        SALES_INV I JOIN SALES_INV_DTL DTL ON I.INVOICE_ID =  DTL.INVOICE_ID
    WHERE I.COMPANY_ID = P_COMPANY_ID AND (I.BRANCH_ID= P_BRANCH_ID OR P_BRANCH_ID = 0) 
    AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') 
    AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
    AND DTL.PRODUCT_ID IN 
        (
            SELECT PRODUCT_ID FROM SALES_PRODUCT 
            WHERE TAX_GROUP_ID IN 
            (
                SELECT PARAM_VALUE 
                FROM SETUP_PARAMS 
                WHERE PARAM_ID = 6 AND COMPANY_ID = P_COMPANY_ID
            )
        );
    SELECT
        NVL(SUM(POST_DISCOUNT_TOTAL_PRICE),0)     PRE_TAX_INV_SUM       
    INTO
        V_TAX_RETURN_REC.AMOUNT_OF_SALES_WITH_ZERO_VAT
    FROM
        SALES_INV I JOIN SALES_INV_DTL DTL ON I.INVOICE_ID =  DTL.INVOICE_ID
    WHERE I.COMPANY_ID = P_COMPANY_ID AND (I.BRANCH_ID= P_BRANCH_ID OR P_BRANCH_ID = 0) 
    AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') 
    AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
    AND DTL.PRODUCT_ID IN 
        (
            SELECT PRODUCT_ID FROM SALES_PRODUCT 
            WHERE TAX_GROUP_ID IN 
            (
                SELECT PARAM_VALUE 
                FROM SETUP_PARAMS 
                WHERE PARAM_ID = 7 AND COMPANY_ID = P_COMPANY_ID
            )
        );
    SELECT
        NVL(SUM(POST_DISCOUNT_TOTAL_PRICE),0)     PRE_TAX_INV_SUM      
    INTO
        V_TAX_RETURN_REC.AMOUNT_OF_SALES_WITH_VAT_EXEMPT
    FROM
        SALES_INV I JOIN SALES_INV_DTL DTL ON I.INVOICE_ID =  DTL.INVOICE_ID
    WHERE I.COMPANY_ID = P_COMPANY_ID AND (I.BRANCH_ID= P_BRANCH_ID OR P_BRANCH_ID = 0) 
    AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') 
    AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
    AND DTL.PRODUCT_ID IN 
        (
            SELECT PRODUCT_ID FROM SALES_PRODUCT 
            WHERE TAX_GROUP_ID IN 
            (
                SELECT PARAM_VALUE 
                FROM SETUP_PARAMS 
                WHERE PARAM_ID = 8 AND COMPANY_ID = P_COMPANY_ID
            )
        );

    --------------------------------------------------------
    SELECT
        NVL(SUM(POST_DISCOUNT_TOTAL_PRICE),0)     PRE_TAX_INV_SUM,
        NVL(SUM(VAT_VALUE),0)                     VAT_SUM
    INTO
        V_TAX_RETURN_REC.AMOUNT_OF_PURCHASES_UNDER_VAT,
        V_TAX_RETURN_REC.VAT_OF_PURCHASES_UNDER_VAT
    FROM
        SALES_PURCHASE_INV I JOIN SALES_PURCHASE_INV_DTL DTL ON I.INVOICE_ID =  DTL.INVOICE_ID
    WHERE I.COMPANY_ID = P_COMPANY_ID AND (I.BRANCH_ID= P_BRANCH_ID OR P_BRANCH_ID = 0) 
    AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') 
    AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
    AND DTL.PRODUCT_ID IN 
        (
            SELECT PRODUCT_ID FROM SALES_PRODUCT 
            WHERE TAX_GROUP_ID IN 
            (
                SELECT PARAM_VALUE 
                FROM SETUP_PARAMS 
                WHERE PARAM_ID = 6 AND COMPANY_ID = P_COMPANY_ID
            )
        );
    SELECT
        NVL(SUM(POST_DISCOUNT_TOTAL_PRICE),0)     PRE_TAX_INV_SUM       
    INTO
        V_TAX_RETURN_REC.AMOUNT_OF_PURCHASES_WITH_ZERO_VAT
    FROM
        SALES_PURCHASE_INV I JOIN SALES_PURCHASE_INV_DTL DTL ON I.INVOICE_ID =  DTL.INVOICE_ID
    WHERE I.COMPANY_ID = P_COMPANY_ID AND (I.BRANCH_ID= P_BRANCH_ID OR P_BRANCH_ID = 0) 
    AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') 
    AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
    AND DTL.PRODUCT_ID IN 
        (
            SELECT PRODUCT_ID FROM SALES_PRODUCT 
            WHERE TAX_GROUP_ID IN 
            (
                SELECT PARAM_VALUE 
                FROM SETUP_PARAMS 
                WHERE PARAM_ID = 7 AND COMPANY_ID = P_COMPANY_ID
            )
        );
    SELECT
        NVL(SUM(POST_DISCOUNT_TOTAL_PRICE),0)     PRE_TAX_INV_SUM      
    INTO
        V_TAX_RETURN_REC.AMOUNT_OF_PURCHASES_WITH_VAT_EXEMPT
    FROM
        SALES_PURCHASE_INV I JOIN SALES_PURCHASE_INV_DTL DTL ON I.INVOICE_ID =  DTL.INVOICE_ID
    WHERE I.COMPANY_ID = P_COMPANY_ID AND (I.BRANCH_ID= P_BRANCH_ID OR P_BRANCH_ID = 0) 
    AND INVOICE_DATE>= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') 
    AND INVOICE_DATE<= TO_DATE(P_TO_DATE,'DD-MM-YYYY')
    AND DTL.PRODUCT_ID IN 
        (
            SELECT PRODUCT_ID FROM SALES_PRODUCT 
            WHERE TAX_GROUP_ID IN 
            (
                SELECT PARAM_VALUE 
                FROM SETUP_PARAMS 
                WHERE PARAM_ID = 8 AND COMPANY_ID = P_COMPANY_ID
            )
        );

    SELECT 
        100,15
    INTO 
        V_TAX_RETURN_REC.OPERATIONAL_EXPENSES,
        V_TAX_RETURN_REC.OPERATIONAL_EXPENSES_VAT
    FROM DUAL;

    SELECT 
        NVL((SELECT NAME_EN  FROM SETUP_BRANCH WHERE BRANCH_ID = P_BRANCH_ID),'All') BRANCH_NAME_EN,
        NVL((SELECT NAME_AR  FROM SETUP_BRANCH WHERE BRANCH_ID = P_BRANCH_ID),'الكل') BRANCH_NAME_AR,
        NVL((SELECT COST_CTR_NAME_EN  FROM ACC_COST_CENTER  WHERE COST_CTR_ID = P_COST_CTR_ID),'All') COST_CTR_NAME_EN,
        NVL((SELECT COST_CTR_NAME_AR  FROM ACC_COST_CENTER WHERE COST_CTR_ID = P_COST_CTR_ID),'الكل') COST_CTR_NAME_AR
    INTO 
        V_TAX_RETURN_REC.BRANCH_NAME_EN,
        V_TAX_RETURN_REC.BRANCH_NAME_AR,
        V_TAX_RETURN_REC.COST_CTR_NAME_EN,
        V_TAX_RETURN_REC.COST_CTR_NAME_AR
    FROM DUAL;

    V_TAX_RETURN_TBL.EXTEND;
    V_TAX_RETURN_TBL(1) := V_TAX_RETURN_REC;
    RETURN V_TAX_RETURN_TBL;
END TAX_RETURN_R;


/
--------------------------------------------------------
--  DDL for Function TRAIL_BALANCE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "TRAIL_BALANCE" (
    P_COMPANY_ID   NUMBER,
    P_FROM_DATE       NVARCHAR2,
    P_TO_DATE         NVARCHAR2,
    P_WITH_MAIN_ACCS  NUMBER DEFAULT 0,
    P_COST_CNTR_ID   NUMBER DEFAULT 0
) RETURN TB_TABLE AS 

    V_TB_REC TB_REC;
    V_TB_TABLE TB_TABLE := TB_TABLE();
    V_TB_TABLE_PERENT TB_TABLE := TB_TABLE();
    V_TB_TABLE_TEMP TB_TABLE := TB_TABLE();
    V_INDEX NUMBER:= 0;
    V_INDEX_TEMP NUMBER:= 0;
    V_LEVEL_NO NUMBER:= 5;
BEGIN
    FOR REC IN (
        WITH PRE_PERIOD AS (
        SELECT 
        ACCOUNT_ID,
        SUM(nvl(DEBIT,0)) PRE_DEBIT,
        SUM(nvl(CREDIT,0)) PRE_CREDIT
        from acc_ledger
        WHERE COMPANY_ID = P_COMPANY_ID and (COST_CNTR_ID=P_COST_CNTR_ID or P_COST_CNTR_ID=0)and JOURNAL_DATE < TO_DATE(P_FROM_DATE,'DD-MM-YYYY')
        GROUP BY ACCOUNT_ID
        ),
        in_period as (
        select 
        ACCOUNT_ID,
        SUM(nvl(DEBIT,0)) IN_DEBIT,
        SUM(nvl(CREDIT,0)) IN_CREDIT
         from acc_ledger
         WHERE COMPANY_ID = P_COMPANY_ID and (COST_CNTR_ID=P_COST_CNTR_ID or P_COST_CNTR_ID=0) and JOURNAL_DATE >= TO_DATE(P_FROM_DATE,'DD-MM-YYYY') AND JOURNAL_DATE <= TO_DATE(P_TO_DATE,'DD-MM-YYYY') 
         GROUP BY ACCOUNT_ID
        )
        select 
        ACC.ACCOUNT_ID,
        account_name_ar,
        ACCOUNT_NAME_EN,
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
        and acc.COMPANY_ID = P_COMPANY_ID
        order by acc.ACCOUNT_ID
    )
    LOOP
        V_INDEX := V_INDEX+1;
        V_TB_TABLE.EXTEND;
        V_TB_TABLE(V_INDEX) :=  TB_REC(
            ACCOUNT_ID => REC.ACCOUNT_ID,
            ACCOUNT_PARENT => REC.ACCOUNT_PARENT,
                ACCOUNT_NAME_AR => REC.account_name_ar,
                ACCOUNT_NAME_EN => REC.ACCOUNT_NAME_EN,
            PRE_DEBIT => REC.PRE_DEBIT,
            PRE_CREDIT => REC.PRE_CREDIT,
            IN_DEBIT => REC.IN_DEBIT,
            IN_CREDIT => REC.IN_CREDIT,
            POST_DEBIT => REC.POST_DEBIT,
            POST_CREDIT  => REC.POST_CREDIT
        );
    END LOOP;
    V_TB_TABLE_PERENT := V_TB_TABLE;
    WHILE NVL(P_WITH_MAIN_ACCS,0) = 1 AND V_LEVEL_NO > 0 LOOP

        V_INDEX_TEMP := 0;
        FOR REC IN (
            select 
            ACC.ACCOUNT_ID,
            ACC.account_name_ar,
            ACC.account_name_EN,
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
                ACCOUNT_NAME_AR => REC.account_name_ar,
                ACCOUNT_NAME_EN => REC.ACCOUNT_NAME_EN,
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
