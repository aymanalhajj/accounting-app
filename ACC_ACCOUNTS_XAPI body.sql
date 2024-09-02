create or replace PACKAGE BODY ACC_ACCOUNTS_XAPI IS
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