--------------------------------------------------------
--  Constraints for Table ACC_ACCOUNTS
--------------------------------------------------------

  ALTER TABLE "ACC_ACCOUNTS" MODIFY ("ACCOUNT_ID" NOT NULL ENABLE);
  ALTER TABLE "ACC_ACCOUNTS" ADD CONSTRAINT "ACC_ACCOUNTS_PK" PRIMARY KEY ("ACCOUNT_ID")
  USING INDEX "ACC_ACCOUNTS_PK"  ENABLE;
  ALTER TABLE "ACC_ACCOUNTS" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ACC_CASH_ACCOUNTS
--------------------------------------------------------

  ALTER TABLE "ACC_CASH_ACCOUNTS" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "ACC_CASH_ACCOUNTS" MODIFY ("ACCOUNT_ID" NOT NULL ENABLE);
  ALTER TABLE "ACC_CASH_ACCOUNTS" ADD CONSTRAINT "ACC_CASH_ACCOUNTS_PK" PRIMARY KEY ("ACCOUNT_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table ACC_COST_CENTER
--------------------------------------------------------

  ALTER TABLE "ACC_COST_CENTER" MODIFY ("COST_CTR_ID" NOT NULL ENABLE);
  ALTER TABLE "ACC_COST_CENTER" ADD CONSTRAINT "ACC_COST_CENTER_PK" PRIMARY KEY ("COST_CTR_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "ACC_COST_CENTER" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ACC_JOURNAL
--------------------------------------------------------

  ALTER TABLE "ACC_JOURNAL" MODIFY ("ACC_JOURNAL_ID" NOT NULL ENABLE);
  ALTER TABLE "ACC_JOURNAL" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "ACC_JOURNAL" ADD CONSTRAINT "ACC_JOURNAL_PK" PRIMARY KEY ("ACC_JOURNAL_ID")
  USING INDEX "ACC_JOURNAL_PK1"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ACC_JOURNAL_DTL
--------------------------------------------------------

  ALTER TABLE "ACC_JOURNAL_DTL" MODIFY ("JOURNAL_DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "ACC_JOURNAL_DTL" ADD CONSTRAINT "ACC_JOURNAL_DTL_PK" PRIMARY KEY ("JOURNAL_DTL_ID")
  USING INDEX "ACC_JOURNAL_DTL_PK1"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ACC_LEDGER
--------------------------------------------------------

  ALTER TABLE "ACC_LEDGER" MODIFY ("LEDGER_ID" NOT NULL ENABLE);
  ALTER TABLE "ACC_LEDGER" ADD CONSTRAINT "ACC_LEDGER_PK" PRIMARY KEY ("LEDGER_ID")
  USING INDEX "ACC_LEDGER_PK"  ENABLE;
  ALTER TABLE "ACC_LEDGER" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ACC_VOUCHER
--------------------------------------------------------

  ALTER TABLE "ACC_VOUCHER" MODIFY ("ACC_VOUCHER_ID" NOT NULL ENABLE);
  ALTER TABLE "ACC_VOUCHER" ADD CONSTRAINT "ACC_VOUCHER_PK" PRIMARY KEY ("ACC_VOUCHER_ID")
  USING INDEX "ACC_JOURNAL_PK"  ENABLE;
  ALTER TABLE "ACC_VOUCHER" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ACC_VOUCHER_DTL
--------------------------------------------------------

  ALTER TABLE "ACC_VOUCHER_DTL" MODIFY ("ACC_VOUCHER_DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "ACC_VOUCHER_DTL" ADD CONSTRAINT "ACC_VOUCHER_DTL_PK" PRIMARY KEY ("ACC_VOUCHER_DTL_ID")
  USING INDEX "ACC_JOURNAL_DTL_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ACC_YEAR
--------------------------------------------------------

  ALTER TABLE "ACC_YEAR" MODIFY ("YEAR_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ACL_APP_INTERFACE
--------------------------------------------------------

  ALTER TABLE "ACL_APP_INTERFACE" MODIFY ("PRIV_IF_ID" NOT NULL ENABLE);
  ALTER TABLE "ACL_APP_INTERFACE" ADD CONSTRAINT "PRIV_IF_ID_PK" PRIMARY KEY ("PRIV_IF_ID")
  USING INDEX "PRIV_IF_ID_PK"  ENABLE;
  ALTER TABLE "ACL_APP_INTERFACE" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ACL_APP_ROLE
--------------------------------------------------------

  ALTER TABLE "ACL_APP_ROLE" MODIFY ("ACL_APP_ROLE_ID" NOT NULL ENABLE);
  ALTER TABLE "ACL_APP_ROLE" ADD CONSTRAINT "USER_ROLE_ID_PK" PRIMARY KEY ("ACL_APP_ROLE_ID")
  USING INDEX "USER_ROLE_ID_PK"  ENABLE;
  ALTER TABLE "ACL_APP_ROLE" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ACL_INTERFACE_OPR
--------------------------------------------------------

  ALTER TABLE "ACL_INTERFACE_OPR" MODIFY ("ACL_INTERFACE_OPR_ID" NOT NULL ENABLE);
  ALTER TABLE "ACL_INTERFACE_OPR" ADD CONSTRAINT "PRIV_OP_ID_PK" PRIMARY KEY ("ACL_INTERFACE_OPR_ID")
  USING INDEX "PRIV_OP_ID_PK"  ENABLE;
  ALTER TABLE "ACL_INTERFACE_OPR" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ACL_SAFE
--------------------------------------------------------

  ALTER TABLE "ACL_SAFE" MODIFY ("ACL_ID" NOT NULL ENABLE);
  ALTER TABLE "ACL_SAFE" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "ACL_SAFE" ADD CONSTRAINT "ACL_SAFE_PK" PRIMARY KEY ("ACL_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table ACL_STORE
--------------------------------------------------------

  ALTER TABLE "ACL_STORE" MODIFY ("ACL_ID" NOT NULL ENABLE);
  ALTER TABLE "ACL_STORE" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ADMIN_APP_INTERFACE
--------------------------------------------------------

  ALTER TABLE "ADMIN_APP_INTERFACE" MODIFY ("INTERFACE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ADMIN_APP_INTERFACEE
--------------------------------------------------------

  ALTER TABLE "ADMIN_APP_INTERFACEE" MODIFY ("INTERFACE_ID" NOT NULL ENABLE);
  ALTER TABLE "ADMIN_APP_INTERFACEE" ADD CONSTRAINT "INTERFACE_ID_PK" PRIMARY KEY ("INTERFACE_ID")
  USING INDEX "INTERFACE_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ADMIN_APP_OPERATION
--------------------------------------------------------

  ALTER TABLE "ADMIN_APP_OPERATION" MODIFY ("OPERATION_ID" NOT NULL ENABLE);
  ALTER TABLE "ADMIN_APP_OPERATION" ADD CONSTRAINT "OPERATION_ID_PK" PRIMARY KEY ("OPERATION_ID")
  USING INDEX "OPERATION_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ADMIN_COMPANY
--------------------------------------------------------

  ALTER TABLE "ADMIN_COMPANY" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "ADMIN_COMPANY" ADD CONSTRAINT "ADMIN_COMPANY_PK" PRIMARY KEY ("COMPANY_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table ADMIN_ERROR_MSG
--------------------------------------------------------

  ALTER TABLE "ADMIN_ERROR_MSG" MODIFY ("MSG_ID" NOT NULL ENABLE);
  ALTER TABLE "ADMIN_ERROR_MSG" ADD CONSTRAINT "ADMIN_ERROR_MSG_PK" PRIMARY KEY ("MSG_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table ADMIN_INTERFACE_OPR
--------------------------------------------------------

  ALTER TABLE "ADMIN_INTERFACE_OPR" MODIFY ("OPERATION_IF_ID" NOT NULL ENABLE);
  ALTER TABLE "ADMIN_INTERFACE_OPR" ADD CONSTRAINT "OPERATION_IF_ID_PK" PRIMARY KEY ("OPERATION_IF_ID")
  USING INDEX "OPERATION_IF_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ADMIN_LIST
--------------------------------------------------------

  ALTER TABLE "ADMIN_LIST" MODIFY ("LIST_ID" NOT NULL ENABLE);
  ALTER TABLE "ADMIN_LIST" ADD CONSTRAINT "ADMIN_LIST_PK" PRIMARY KEY ("LIST_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table ADMIN_LIST_ITEM
--------------------------------------------------------

  ALTER TABLE "ADMIN_LIST_ITEM" MODIFY ("ITEM_ID" NOT NULL ENABLE);
  ALTER TABLE "ADMIN_LIST_ITEM" ADD CONSTRAINT "ADMIN_LIST_ITEM_PK" PRIMARY KEY ("ITEM_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table ADMIN_PWD_HMAC_KEY
--------------------------------------------------------

  ALTER TABLE "ADMIN_PWD_HMAC_KEY" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ADMIN_USER_SESSION
--------------------------------------------------------

  ALTER TABLE "ADMIN_USER_SESSION" MODIFY ("SESSION_ID" NOT NULL ENABLE);
  ALTER TABLE "ADMIN_USER_SESSION" ADD CONSTRAINT "ADMIN_USER_SESSION_PK" PRIMARY KEY ("SESSION_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table API_LOG
--------------------------------------------------------

  ALTER TABLE "API_LOG" MODIFY ("LOG_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SALES_CLIENT
--------------------------------------------------------

  ALTER TABLE "SALES_CLIENT" MODIFY ("CLIENT_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_CLIENT" ADD CONSTRAINT "SALES_CLIENT_PK" PRIMARY KEY ("CLIENT_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SALES_INV
--------------------------------------------------------

  ALTER TABLE "SALES_INV" MODIFY ("INVOICE_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_INV" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_INV" ADD CONSTRAINT "SALES_INV_PK" PRIMARY KEY ("INVOICE_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SALES_INV_DTL
--------------------------------------------------------

  ALTER TABLE "SALES_INV_DTL" MODIFY ("INVOICE_DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_INV_DTL" ADD CONSTRAINT "SALES_INV_DTL_PK" PRIMARY KEY ("INVOICE_DTL_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SALES_PRODUCT
--------------------------------------------------------

  ALTER TABLE "SALES_PRODUCT" MODIFY ("PRODUCT_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_PRODUCT" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_PRODUCT" ADD CONSTRAINT "SALES_PRODUCT_PK" PRIMARY KEY ("PRODUCT_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SALES_PRODUCT_BARCODES
--------------------------------------------------------

  ALTER TABLE "SALES_PRODUCT_BARCODES" MODIFY ("PRODUCT_BARCODE_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_PRODUCT_BARCODES" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_PRODUCT_BARCODES" ADD CONSTRAINT "SALES_PRODUCT_BARCODES_PK" PRIMARY KEY ("PRODUCT_BARCODE_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SALES_PRODUCT_FILES
--------------------------------------------------------

  ALTER TABLE "SALES_PRODUCT_FILES" MODIFY ("FILE_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_PRODUCT_FILES" ADD CONSTRAINT "FILE_ID_PK" PRIMARY KEY ("FILE_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SALES_PRODUCT_UNIT
--------------------------------------------------------

  ALTER TABLE "SALES_PRODUCT_UNIT" MODIFY ("PRODUCT_UNIT_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_PRODUCT_UNIT" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_PRODUCT_UNIT" ADD CONSTRAINT "SALES_PRODUCT_UNIT_PK" PRIMARY KEY ("PRODUCT_UNIT_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SALES_PROVIDER
--------------------------------------------------------

  ALTER TABLE "SALES_PROVIDER" MODIFY ("PROVIDER_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_PROVIDER" ADD CONSTRAINT "SALES_PROVIDER_PK" PRIMARY KEY ("PROVIDER_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SALES_PURCHASE_INV
--------------------------------------------------------

  ALTER TABLE "SALES_PURCHASE_INV" MODIFY ("INVOICE_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_PURCHASE_INV" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_PURCHASE_INV" ADD CONSTRAINT "SALES_PURCHASE_INV_PK" PRIMARY KEY ("INVOICE_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SALES_PURCHASE_INV_DTL
--------------------------------------------------------

  ALTER TABLE "SALES_PURCHASE_INV_DTL" MODIFY ("DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_PURCHASE_INV_DTL" ADD CONSTRAINT "SALES_PURCHASE_INV_DTL_PK" PRIMARY KEY ("DTL_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SALES_PURCHASE_ORDER
--------------------------------------------------------

  ALTER TABLE "SALES_PURCHASE_ORDER" MODIFY ("ORDER_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_PURCHASE_ORDER" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_PURCHASE_ORDER" ADD CONSTRAINT "SALES_PURCHASE_ORDER_PK" PRIMARY KEY ("ORDER_ID")
  USING INDEX "SALES_PURCHASE_ORDER_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SALES_PURCHASE_ORDER_DTL
--------------------------------------------------------

  ALTER TABLE "SALES_PURCHASE_ORDER_DTL" MODIFY ("DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_PURCHASE_ORDER_DTL" ADD CONSTRAINT "SALES_PURCHASE_ORDER_DTL_PK" PRIMARY KEY ("DTL_ID")
  USING INDEX "SALES_PURCHASE_ORDER_DTL_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SALES_PUR_RETURN_INV
--------------------------------------------------------

  ALTER TABLE "SALES_PUR_RETURN_INV" MODIFY ("INVOICE_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_PUR_RETURN_INV" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_PUR_RETURN_INV" ADD CONSTRAINT "SALES_PUR_RETURN_INV_PK" PRIMARY KEY ("INVOICE_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SALES_PUR_RETURN_INV_DTL
--------------------------------------------------------

  ALTER TABLE "SALES_PUR_RETURN_INV_DTL" MODIFY ("DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_PUR_RETURN_INV_DTL" ADD CONSTRAINT "SALES_PUR_RETURN_INV_DTL_PK" PRIMARY KEY ("DTL_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SALES_RENT_INV
--------------------------------------------------------

  ALTER TABLE "SALES_RENT_INV" MODIFY ("INVOICE_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_RENT_INV" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_RENT_INV" ADD CONSTRAINT "SALES_RENT_INV_PK" PRIMARY KEY ("INVOICE_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SALES_RENT_INV_DTL
--------------------------------------------------------

  ALTER TABLE "SALES_RENT_INV_DTL" MODIFY ("DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_RENT_INV_DTL" ADD CONSTRAINT "SALES_RENT_INV_DTL_PK" PRIMARY KEY ("DTL_ID")
  USING INDEX "SALES_RENT_INV_DTL_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SALES_RETURN_INV
--------------------------------------------------------

  ALTER TABLE "SALES_RETURN_INV" MODIFY ("INVOICE_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_RETURN_INV" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_RETURN_INV" ADD CONSTRAINT "SALES_RETURN_INV_PK" PRIMARY KEY ("INVOICE_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SALES_RETURN_INV_DTL
--------------------------------------------------------

  ALTER TABLE "SALES_RETURN_INV_DTL" MODIFY ("DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "SALES_RETURN_INV_DTL" ADD CONSTRAINT "SALES_RETURN_INV_DTL_PK" PRIMARY KEY ("DTL_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SETUP_APP_ROLE
--------------------------------------------------------

  ALTER TABLE "SETUP_APP_ROLE" MODIFY ("ROLE_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_APP_ROLE" ADD CONSTRAINT "ROLE_ID_PK" PRIMARY KEY ("ROLE_ID")
  USING INDEX "ROLE_ID_PK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SETUP_APP_USER
--------------------------------------------------------

  ALTER TABLE "SETUP_APP_USER" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_APP_USER" ADD CONSTRAINT "USER_ID_PK" PRIMARY KEY ("USER_ID")
  USING INDEX "USER_ID_PK"  ENABLE;
  ALTER TABLE "SETUP_APP_USER" ADD CONSTRAINT "SETUP_APP_USER_UK1" UNIQUE ("USER_NAME")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SETUP_BANK_EXT_ACC
--------------------------------------------------------

  ALTER TABLE "SETUP_BANK_EXT_ACC" MODIFY ("BANK_ACC_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_BANK_EXT_ACC" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_BANK_EXT_ACC" ADD CONSTRAINT "SETUP_BANK_ACC_PK" PRIMARY KEY ("BANK_ACC_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SETUP_BRANCH
--------------------------------------------------------

  ALTER TABLE "SETUP_BRANCH" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_BRANCH" MODIFY ("BRANCH_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_BRANCH" ADD CONSTRAINT "SETUP_BRANCH_PK" PRIMARY KEY ("BRANCH_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SETUP_CITY
--------------------------------------------------------

  ALTER TABLE "SETUP_CITY" MODIFY ("CITY_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_CITY" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_CITY" ADD CONSTRAINT "SETUP_CITY_PK" PRIMARY KEY ("CITY_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SETUP_COUNTRY
--------------------------------------------------------

  ALTER TABLE "SETUP_COUNTRY" MODIFY ("COUNTRY_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_COUNTRY" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_COUNTRY" ADD CONSTRAINT "SETUP_COUNTRY_PK" PRIMARY KEY ("COUNTRY_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SETUP_CURRENCY
--------------------------------------------------------

  ALTER TABLE "SETUP_CURRENCY" MODIFY ("CURRENCY_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_CURRENCY" ADD CONSTRAINT "CURRENCY_ID_PK" PRIMARY KEY ("CURRENCY_ID")
  USING INDEX "CURRENCY_ID_PK"  ENABLE;
  ALTER TABLE "SETUP_CURRENCY" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SETUP_PARAMS
--------------------------------------------------------

  ALTER TABLE "SETUP_PARAMS" MODIFY ("PARAM_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SETUP_PROD_GROUP
--------------------------------------------------------

  ALTER TABLE "SETUP_PROD_GROUP" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_PROD_GROUP" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_PROD_GROUP" ADD CONSTRAINT "SETUP_PROD_GROUP_PK" PRIMARY KEY ("GROUP_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SETUP_REGION
--------------------------------------------------------

  ALTER TABLE "SETUP_REGION" MODIFY ("REGION_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_REGION" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_REGION" ADD CONSTRAINT "SETUP_REGION_PK" PRIMARY KEY ("REGION_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SETUP_SAFE
--------------------------------------------------------

  ALTER TABLE "SETUP_SAFE" MODIFY ("SAFE_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_SAFE" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_SAFE" ADD CONSTRAINT "SETUP_SAFE_PK" PRIMARY KEY ("SAFE_ID")
  USING INDEX (CREATE UNIQUE INDEX "SETUP_TREASURY_PK" ON "SETUP_SAFE" ("SAFE_ID") 
  )  ENABLE;
--------------------------------------------------------
--  Constraints for Table SETUP_STORE
--------------------------------------------------------

  ALTER TABLE "SETUP_STORE" MODIFY ("STORE_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_STORE" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_STORE" ADD CONSTRAINT "SETUP_STORE_PK" PRIMARY KEY ("STORE_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SETUP_TAX_GROUP
--------------------------------------------------------

  ALTER TABLE "SETUP_TAX_GROUP" MODIFY ("GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_TAX_GROUP" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_TAX_GROUP" ADD CONSTRAINT "SETUP_TAX_GROUP_PK" PRIMARY KEY ("GROUP_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SETUP_UNIT
--------------------------------------------------------

  ALTER TABLE "SETUP_UNIT" MODIFY ("UNIT_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_UNIT" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "SETUP_UNIT" ADD CONSTRAINT "SETUP_UNIT_PK" PRIMARY KEY ("UNIT_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table STORE_FIRST_PERIOD_STOCK
--------------------------------------------------------

  ALTER TABLE "STORE_FIRST_PERIOD_STOCK" MODIFY ("INVOICE_ID" NOT NULL ENABLE);
  ALTER TABLE "STORE_FIRST_PERIOD_STOCK" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "STORE_FIRST_PERIOD_STOCK" ADD CONSTRAINT "STORE_FIRST_PERIOD_STOCK_PK" PRIMARY KEY ("INVOICE_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table STORE_FIRST_PERIOD_STOCK_DTL
--------------------------------------------------------

  ALTER TABLE "STORE_FIRST_PERIOD_STOCK_DTL" MODIFY ("DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "STORE_FIRST_PERIOD_STOCK_DTL" ADD CONSTRAINT "STORE_FIRST_PERIOD_STOCK_DTL_PK" PRIMARY KEY ("DTL_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table STORE_STOCKIN_ORDER
--------------------------------------------------------

  ALTER TABLE "STORE_STOCKIN_ORDER" MODIFY ("ORDER_ID" NOT NULL ENABLE);
  ALTER TABLE "STORE_STOCKIN_ORDER" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "STORE_STOCKIN_ORDER" ADD CONSTRAINT "STORE_STOCKIN_ORDER_PK" PRIMARY KEY ("ORDER_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table STORE_STOCKIN_ORDER_DTL
--------------------------------------------------------

  ALTER TABLE "STORE_STOCKIN_ORDER_DTL" MODIFY ("DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "STORE_STOCKIN_ORDER_DTL" ADD CONSTRAINT "STORE_STOCKIN_ORDER_DTL_PK" PRIMARY KEY ("DTL_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table STORE_STOCKOUT_ORDER
--------------------------------------------------------

  ALTER TABLE "STORE_STOCKOUT_ORDER" MODIFY ("ORDER_ID" NOT NULL ENABLE);
  ALTER TABLE "STORE_STOCKOUT_ORDER" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "STORE_STOCKOUT_ORDER" ADD CONSTRAINT "STORE_STOCKOUT_ORDER_PK" PRIMARY KEY ("ORDER_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table STORE_STOCKOUT_ORDER_DTL
--------------------------------------------------------

  ALTER TABLE "STORE_STOCKOUT_ORDER_DTL" MODIFY ("DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "STORE_STOCKOUT_ORDER_DTL" ADD CONSTRAINT "STORE_STOCKOUT_ORDER_DTL_PK" PRIMARY KEY ("DTL_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table STORE_TRANSFER
--------------------------------------------------------

  ALTER TABLE "STORE_TRANSFER" MODIFY ("TRANSFER_ID" NOT NULL ENABLE);
  ALTER TABLE "STORE_TRANSFER" MODIFY ("COMPANY_ID" NOT NULL ENABLE);
  ALTER TABLE "STORE_TRANSFER" ADD CONSTRAINT "STORE_TRANSFER_PK" PRIMARY KEY ("TRANSFER_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table STORE_TRANSFER_DTL
--------------------------------------------------------

  ALTER TABLE "STORE_TRANSFER_DTL" MODIFY ("DTL_ID" NOT NULL ENABLE);
  ALTER TABLE "STORE_TRANSFER_DTL" ADD CONSTRAINT "STORE_TRANSFER_DTL_PK" PRIMARY KEY ("DTL_ID")
  USING INDEX  ENABLE;
