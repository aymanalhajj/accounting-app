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
