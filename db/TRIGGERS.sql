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
