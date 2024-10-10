--------------------------------------------------------
--  File created - الجمعة-أكتوبر-11-2024   
--------------------------------------------------------
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
