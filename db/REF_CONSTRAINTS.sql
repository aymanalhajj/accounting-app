--------------------------------------------------------
--  Ref Constraints for Table ACC_ACCOUNTS
--------------------------------------------------------

  ALTER TABLE "ACC_ACCOUNTS" ADD CONSTRAINT "ACC_ACCOUNTS_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACC_CASH_ACCOUNTS
--------------------------------------------------------

  ALTER TABLE "ACC_CASH_ACCOUNTS" ADD CONSTRAINT "ACC_CASH_ACCOUNTS_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACC_COST_CENTER
--------------------------------------------------------

  ALTER TABLE "ACC_COST_CENTER" ADD CONSTRAINT "ACC_COST_CENTER_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACC_JOURNAL
--------------------------------------------------------

  ALTER TABLE "ACC_JOURNAL" ADD CONSTRAINT "ACC_JOURNAL_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACC_JOURNAL_DTL
--------------------------------------------------------

  ALTER TABLE "ACC_JOURNAL_DTL" ADD CONSTRAINT "ACC_JOURNAL_DTL_FK1" FOREIGN KEY ("JOURNAL_ID")
	  REFERENCES "ACC_JOURNAL" ("ACC_JOURNAL_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACC_LEDGER
--------------------------------------------------------

  ALTER TABLE "ACC_LEDGER" ADD CONSTRAINT "ACC_LEDGER_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACC_SETUP
--------------------------------------------------------

  ALTER TABLE "ACC_SETUP" ADD CONSTRAINT "ACC_SETUP_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACC_VOUCHER
--------------------------------------------------------

  ALTER TABLE "ACC_VOUCHER" ADD CONSTRAINT "ACC_VOUCHER_FK1" FOREIGN KEY ("ACCOUNT_ID")
	  REFERENCES "ACC_ACCOUNTS" ("ACCOUNT_ID") ENABLE;
  ALTER TABLE "ACC_VOUCHER" ADD CONSTRAINT "ACC_VOUCHER_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACC_VOUCHER_DTL
--------------------------------------------------------

  ALTER TABLE "ACC_VOUCHER_DTL" ADD CONSTRAINT "ACC_VOUCHER_DTL_FK1" FOREIGN KEY ("ACC_VOUCHER_ID")
	  REFERENCES "ACC_VOUCHER" ("ACC_VOUCHER_ID") ENABLE;
  ALTER TABLE "ACC_VOUCHER_DTL" ADD CONSTRAINT "ACC_VOUCHER_DTL_FK2" FOREIGN KEY ("ACCOUNT_ID")
	  REFERENCES "ACC_ACCOUNTS" ("ACCOUNT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACL_APP_INTERFACE
--------------------------------------------------------

  ALTER TABLE "ACL_APP_INTERFACE" ADD CONSTRAINT "PRIV_IF_INTERFACE_ID_FK" FOREIGN KEY ("INTERFACE_ID")
	  REFERENCES "ADMIN_APP_INTERFACEE" ("INTERFACE_ID") ENABLE;
  ALTER TABLE "ACL_APP_INTERFACE" ADD CONSTRAINT "PRIV_IF_USER_ID_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "ACL_APP_INTERFACE" ADD CONSTRAINT "PRIV_IF_ROLE_ID_FK" FOREIGN KEY ("ROLE_ID")
	  REFERENCES "SETUP_APP_ROLE" ("ROLE_ID") ENABLE;
  ALTER TABLE "ACL_APP_INTERFACE" ADD CONSTRAINT "PRIV_IF_CREATED_BY_FK" FOREIGN KEY ("CREATED_BY")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "ACL_APP_INTERFACE" ADD CONSTRAINT "PRIV_IF_MODIFIED_BY_FK" FOREIGN KEY ("MODIFIED_BY")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "ACL_APP_INTERFACE" ADD CONSTRAINT "ACL_APP_INTERFACE_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACL_APP_ROLE
--------------------------------------------------------

  ALTER TABLE "ACL_APP_ROLE" ADD CONSTRAINT "ACL_APP_ROLE_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
  ALTER TABLE "ACL_APP_ROLE" ADD CONSTRAINT "USER_ROLE_USER_ID_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "ACL_APP_ROLE" ADD CONSTRAINT "USER_ROLE_ROLE_ID_FK" FOREIGN KEY ("ROLE_ID")
	  REFERENCES "SETUP_APP_ROLE" ("ROLE_ID") ENABLE;
  ALTER TABLE "ACL_APP_ROLE" ADD CONSTRAINT "USER_ROLE_CREATED_BY_FK" FOREIGN KEY ("CREATED_BY")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "ACL_APP_ROLE" ADD CONSTRAINT "USER_ROLE_MODIFIED_BY_FK" FOREIGN KEY ("MODIFIED_BY")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACL_INTERFACE_OPR
--------------------------------------------------------

  ALTER TABLE "ACL_INTERFACE_OPR" ADD CONSTRAINT "PRIV_OP_USER_ID_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "ACL_INTERFACE_OPR" ADD CONSTRAINT "PRIV_OP_ROLE_ID_FK" FOREIGN KEY ("ROLE_ID")
	  REFERENCES "SETUP_APP_ROLE" ("ROLE_ID") ENABLE;
  ALTER TABLE "ACL_INTERFACE_OPR" ADD CONSTRAINT "PRIV_OP_CREATED_BY_FK" FOREIGN KEY ("CREATED_BY")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "ACL_INTERFACE_OPR" ADD CONSTRAINT "PRIV_OP_MODIFIED_BY_FK" FOREIGN KEY ("MODIFIED_BY")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "ACL_INTERFACE_OPR" ADD CONSTRAINT "ACL_INTERFACE_OPR_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACL_SAFE
--------------------------------------------------------

  ALTER TABLE "ACL_SAFE" ADD CONSTRAINT "ACL_SAFE_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACL_STORE
--------------------------------------------------------

  ALTER TABLE "ACL_STORE" ADD CONSTRAINT "ACL_STORE_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ADMIN_APP_OPERATION
--------------------------------------------------------

  ALTER TABLE "ADMIN_APP_OPERATION" ADD CONSTRAINT "OPERATION_CREATED_BY_FK" FOREIGN KEY ("CREATED_BY")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "ADMIN_APP_OPERATION" ADD CONSTRAINT "OPERATION_MODIFIED_BY_FK" FOREIGN KEY ("MODIFIED_BY")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ADMIN_COMPANY
--------------------------------------------------------

  ALTER TABLE "ADMIN_COMPANY" ADD CONSTRAINT "ADMIN_COMPANY_COUNTRY_FK" FOREIGN KEY ("COUNTRY_ID")
	  REFERENCES "SETUP_COUNTRY" ("COUNTRY_ID") ENABLE;
  ALTER TABLE "ADMIN_COMPANY" ADD CONSTRAINT "ADMIN_COMPANY_CITY_FK" FOREIGN KEY ("CITY_ID")
	  REFERENCES "SETUP_CITY" ("CITY_ID") ENABLE;
  ALTER TABLE "ADMIN_COMPANY" ADD CONSTRAINT "ADMIN_COMPANY_REGION_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "SETUP_REGION" ("REGION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ADMIN_INTERFACE_OPR
--------------------------------------------------------

  ALTER TABLE "ADMIN_INTERFACE_OPR" ADD CONSTRAINT "OP_IF_INTERFACE_ID_FK" FOREIGN KEY ("INTERFACE_ID")
	  REFERENCES "ADMIN_APP_INTERFACEE" ("INTERFACE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ADMIN_LIST_ITEM
--------------------------------------------------------

  ALTER TABLE "ADMIN_LIST_ITEM" ADD CONSTRAINT "ADMIN_LIST_ITEM_FK1" FOREIGN KEY ("LIST_ID")
	  REFERENCES "ADMIN_LIST" ("LIST_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ADMIN_PWD_HMAC_KEY
--------------------------------------------------------

  ALTER TABLE "ADMIN_PWD_HMAC_KEY" ADD CONSTRAINT "ADMIN_PWD_HMAC_KEY_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_CLIENT
--------------------------------------------------------

  ALTER TABLE "SALES_CLIENT" ADD CONSTRAINT "SALES_CLIENT_FK1" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
  ALTER TABLE "SALES_CLIENT" ADD CONSTRAINT "SALES_CLIENT_COUNTRY_FK" FOREIGN KEY ("COUNTRY_ID")
	  REFERENCES "SETUP_COUNTRY" ("COUNTRY_ID") ENABLE;
  ALTER TABLE "SALES_CLIENT" ADD CONSTRAINT "SALES_CLIENT_CITY_FK" FOREIGN KEY ("CITY_ID")
	  REFERENCES "SETUP_CITY" ("CITY_ID") ENABLE;
  ALTER TABLE "SALES_CLIENT" ADD CONSTRAINT "SALES_CLIENT_REGION_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "SETUP_REGION" ("REGION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_INV
--------------------------------------------------------

  ALTER TABLE "SALES_INV" ADD CONSTRAINT "SALES_INV_FK1" FOREIGN KEY ("COST_CTR_ID")
	  REFERENCES "ACC_COST_CENTER" ("COST_CTR_ID") ENABLE;
  ALTER TABLE "SALES_INV" ADD CONSTRAINT "SALES_INV_FK2" FOREIGN KEY ("STORE_ID")
	  REFERENCES "SETUP_STORE" ("STORE_ID") ENABLE;
  ALTER TABLE "SALES_INV" ADD CONSTRAINT "SALES_INV_FK3" FOREIGN KEY ("SAFE_ID")
	  REFERENCES "SETUP_SAFE" ("SAFE_ID") ENABLE;
  ALTER TABLE "SALES_INV" ADD CONSTRAINT "SALES_INV_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
  ALTER TABLE "SALES_INV" ADD CONSTRAINT "SALES_INV_CLIENT_FK" FOREIGN KEY ("CLIENT_ID")
	  REFERENCES "SALES_CLIENT" ("CLIENT_ID") ENABLE;
  ALTER TABLE "SALES_INV" ADD CONSTRAINT "SALES_INV_USER_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "SALES_INV" ADD CONSTRAINT "SALES_INV_BANK_FK" FOREIGN KEY ("BANK_ACC_ID")
	  REFERENCES "SETUP_BANK_EXT_ACC" ("BANK_ACC_ID") ENABLE;
  ALTER TABLE "SALES_INV" ADD CONSTRAINT "SALES_INV_JRNL_FK" FOREIGN KEY ("ACC_JOURNAL_ID")
	  REFERENCES "ACC_JOURNAL" ("ACC_JOURNAL_ID") ENABLE;
  ALTER TABLE "SALES_INV" ADD CONSTRAINT "SALES_INV_BRANCH_FK" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_INV_DTL
--------------------------------------------------------

  ALTER TABLE "SALES_INV_DTL" ADD CONSTRAINT "SALES_INV_DTL_FK1" FOREIGN KEY ("INVOICE_ID")
	  REFERENCES "SALES_INV" ("INVOICE_ID") ENABLE;
  ALTER TABLE "SALES_INV_DTL" ADD CONSTRAINT "SALES_INV_DTL_FK2" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "SALES_PRODUCT" ("PRODUCT_ID") ENABLE;
  ALTER TABLE "SALES_INV_DTL" ADD CONSTRAINT "SALES_INV_DTL_FK3" FOREIGN KEY ("PRODUCT_UNIT_ID")
	  REFERENCES "SALES_PRODUCT_UNIT" ("PRODUCT_UNIT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_PRODUCT
--------------------------------------------------------

  ALTER TABLE "SALES_PRODUCT" ADD CONSTRAINT "SALES_PRODUCT_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
  ALTER TABLE "SALES_PRODUCT" ADD CONSTRAINT "SALES_PRODUCT_FK1" FOREIGN KEY ("TAX_GROUP_ID")
	  REFERENCES "SETUP_TAX_GROUP" ("GROUP_ID") ENABLE;
  ALTER TABLE "SALES_PRODUCT" ADD CONSTRAINT "SALES_PRODUCT_FK2" FOREIGN KEY ("PRODUCT_GROUP_ID")
	  REFERENCES "SETUP_PROD_GROUP" ("GROUP_ID") ENABLE;
  ALTER TABLE "SALES_PRODUCT" ADD CONSTRAINT "SALES_PRODUCT_FK3" FOREIGN KEY ("DEFAULT_UNIT_ID")
	  REFERENCES "SETUP_UNIT" ("UNIT_ID") ENABLE;
  ALTER TABLE "SALES_PRODUCT" ADD CONSTRAINT "SALES_PRODUCT_FK4" FOREIGN KEY ("PROVIDER_ID")
	  REFERENCES "SALES_PROVIDER" ("PROVIDER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_PRODUCT_BARCODES
--------------------------------------------------------

  ALTER TABLE "SALES_PRODUCT_BARCODES" ADD CONSTRAINT "SALES_PRODUCT_BARCODES_FK1" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "SALES_PRODUCT" ("PRODUCT_ID") ENABLE;
  ALTER TABLE "SALES_PRODUCT_BARCODES" ADD CONSTRAINT "SALES_PRODUCT_BARCODES_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_PRODUCT_FILES
--------------------------------------------------------

  ALTER TABLE "SALES_PRODUCT_FILES" ADD CONSTRAINT "SALES_PRODUCT_FILES_PRODUCT_ID_FK" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "SALES_PRODUCT" ("PRODUCT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_PRODUCT_UNIT
--------------------------------------------------------

  ALTER TABLE "SALES_PRODUCT_UNIT" ADD CONSTRAINT "SALES_PRODUCT_UNIT_FK1" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "SALES_PRODUCT" ("PRODUCT_ID") ENABLE;
  ALTER TABLE "SALES_PRODUCT_UNIT" ADD CONSTRAINT "SALES_PRODUCT_UNIT_FK2" FOREIGN KEY ("UNIT_ID")
	  REFERENCES "SETUP_UNIT" ("UNIT_ID") ENABLE;
  ALTER TABLE "SALES_PRODUCT_UNIT" ADD CONSTRAINT "SALES_PRODUCT_UNIT_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_PROVIDER
--------------------------------------------------------

  ALTER TABLE "SALES_PROVIDER" ADD CONSTRAINT "SALES_PROVIDER_FK1" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
  ALTER TABLE "SALES_PROVIDER" ADD CONSTRAINT "SALES_PROVIDER_COUNTRY_FK" FOREIGN KEY ("COUNTRY_ID")
	  REFERENCES "SETUP_COUNTRY" ("COUNTRY_ID") ENABLE;
  ALTER TABLE "SALES_PROVIDER" ADD CONSTRAINT "SALES_PROVIDER_CITY_FK" FOREIGN KEY ("CITY_ID")
	  REFERENCES "SETUP_CITY" ("CITY_ID") ENABLE;
  ALTER TABLE "SALES_PROVIDER" ADD CONSTRAINT "SALES_PROVIDER_REGION_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "SETUP_REGION" ("REGION_ID") ENABLE;
  ALTER TABLE "SALES_PROVIDER" ADD CONSTRAINT "SALES_PROVIDER_FK2" FOREIGN KEY ("ACCOUNT_ID")
	  REFERENCES "ACC_ACCOUNTS" ("ACCOUNT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_PURCHASE_INV
--------------------------------------------------------

  ALTER TABLE "SALES_PURCHASE_INV" ADD CONSTRAINT "SALES_PURCHASE_INV_FK1" FOREIGN KEY ("STORE_ID")
	  REFERENCES "SETUP_STORE" ("STORE_ID") ENABLE;
  ALTER TABLE "SALES_PURCHASE_INV" ADD CONSTRAINT "SALES_PURCHASE_INV_FK2" FOREIGN KEY ("SAFE_ID")
	  REFERENCES "SETUP_SAFE" ("SAFE_ID") ENABLE;
  ALTER TABLE "SALES_PURCHASE_INV" ADD CONSTRAINT "SALES_PURCHASE_INV_FK3" FOREIGN KEY ("COST_CTR_ID")
	  REFERENCES "ACC_COST_CENTER" ("COST_CTR_ID") ENABLE;
  ALTER TABLE "SALES_PURCHASE_INV" ADD CONSTRAINT "SALES_PURCHASE_INV_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
  ALTER TABLE "SALES_PURCHASE_INV" ADD CONSTRAINT "SALES_PURCHASE_INV_PROV_FK" FOREIGN KEY ("PROVIDER_ID")
	  REFERENCES "SALES_PROVIDER" ("PROVIDER_ID") ENABLE;
  ALTER TABLE "SALES_PURCHASE_INV" ADD CONSTRAINT "SALES_PURCHASE_INV_USER_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "SALES_PURCHASE_INV" ADD CONSTRAINT "SALES_PURCHASE_INV_BANK_FK" FOREIGN KEY ("BANK_ACC_ID")
	  REFERENCES "SETUP_BANK_EXT_ACC" ("BANK_ACC_ID") ENABLE;
  ALTER TABLE "SALES_PURCHASE_INV" ADD CONSTRAINT "SALES_PURCHASE_INV_JRNL_FK" FOREIGN KEY ("ACC_JOURNAL_ID")
	  REFERENCES "ACC_JOURNAL" ("ACC_JOURNAL_ID") ENABLE;
  ALTER TABLE "SALES_PURCHASE_INV" ADD CONSTRAINT "SALES_PURCHASE_INV_BRANCH_FK" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_PURCHASE_INV_DTL
--------------------------------------------------------

  ALTER TABLE "SALES_PURCHASE_INV_DTL" ADD CONSTRAINT "SALES_PURCHASE_INV_DTL_FK1" FOREIGN KEY ("INVOICE_ID")
	  REFERENCES "SALES_PURCHASE_INV" ("INVOICE_ID") ENABLE;
  ALTER TABLE "SALES_PURCHASE_INV_DTL" ADD CONSTRAINT "SALES_PURCHASE_INV_DTL_FK2" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "SALES_PRODUCT" ("PRODUCT_ID") ENABLE;
  ALTER TABLE "SALES_PURCHASE_INV_DTL" ADD CONSTRAINT "SALES_PURCHASE_INV_DTL_FK3" FOREIGN KEY ("PRODUCT_UNIT_ID")
	  REFERENCES "SALES_PRODUCT_UNIT" ("PRODUCT_UNIT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_PURCHASE_ORDER
--------------------------------------------------------

  ALTER TABLE "SALES_PURCHASE_ORDER" ADD CONSTRAINT "SALES_PURCHASE_ORDER_FK1" FOREIGN KEY ("STORE_ID")
	  REFERENCES "SETUP_STORE" ("STORE_ID") ENABLE;
  ALTER TABLE "SALES_PURCHASE_ORDER" ADD CONSTRAINT "SALES_PURCHASE_ORDER_FK2" FOREIGN KEY ("SAFE_ID")
	  REFERENCES "SETUP_SAFE" ("SAFE_ID") ENABLE;
  ALTER TABLE "SALES_PURCHASE_ORDER" ADD CONSTRAINT "SALES_PURCHASE_ORDER_FK3" FOREIGN KEY ("COST_CTR_ID")
	  REFERENCES "ACC_COST_CENTER" ("COST_CTR_ID") ENABLE;
  ALTER TABLE "SALES_PURCHASE_ORDER" ADD CONSTRAINT "SALES_PURCHASE_ORDER_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
  ALTER TABLE "SALES_PURCHASE_ORDER" ADD CONSTRAINT "SALES_PURCHASE_ORDER_PROV_FK" FOREIGN KEY ("PROVIDER_ID")
	  REFERENCES "SALES_PROVIDER" ("PROVIDER_ID") ENABLE;
  ALTER TABLE "SALES_PURCHASE_ORDER" ADD CONSTRAINT "SALES_PURCHASE_ORDER_USER_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "SALES_PURCHASE_ORDER" ADD CONSTRAINT "SALES_PURCHASE_ORDER_BANK_FK" FOREIGN KEY ("BANK_ACC_ID")
	  REFERENCES "SETUP_BANK_EXT_ACC" ("BANK_ACC_ID") ENABLE;
  ALTER TABLE "SALES_PURCHASE_ORDER" ADD CONSTRAINT "SALES_PURCHASE_ORDER_JRNL_FK" FOREIGN KEY ("ACC_JOURNAL_ID")
	  REFERENCES "ACC_JOURNAL" ("ACC_JOURNAL_ID") ENABLE;
  ALTER TABLE "SALES_PURCHASE_ORDER" ADD CONSTRAINT "SALES_PURCHASE_ORDER_BRANCH_FK" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_PURCHASE_ORDER_DTL
--------------------------------------------------------

  ALTER TABLE "SALES_PURCHASE_ORDER_DTL" ADD CONSTRAINT "SALES_PURCHASE_ORDER_DTL_FK1" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "SALES_PURCHASE_ORDER" ("ORDER_ID") ENABLE;
  ALTER TABLE "SALES_PURCHASE_ORDER_DTL" ADD CONSTRAINT "SALES_PURCHASE_ORDER_DTL_FK2" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "SALES_PRODUCT" ("PRODUCT_ID") ENABLE;
  ALTER TABLE "SALES_PURCHASE_ORDER_DTL" ADD CONSTRAINT "SALES_PURCHASE_ORDER_DTL_FK3" FOREIGN KEY ("PRODUCT_UNIT_ID")
	  REFERENCES "SALES_PRODUCT_UNIT" ("PRODUCT_UNIT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_PUR_RETURN_INV
--------------------------------------------------------

  ALTER TABLE "SALES_PUR_RETURN_INV" ADD CONSTRAINT "SALES_PUR_RETURN_INV_FK1" FOREIGN KEY ("STORE_ID")
	  REFERENCES "SETUP_STORE" ("STORE_ID") ENABLE;
  ALTER TABLE "SALES_PUR_RETURN_INV" ADD CONSTRAINT "SALES_PUR_RETURN_INV_FK2" FOREIGN KEY ("SAFE_ID")
	  REFERENCES "SETUP_SAFE" ("SAFE_ID") ENABLE;
  ALTER TABLE "SALES_PUR_RETURN_INV" ADD CONSTRAINT "SALES_PUR_RETURN_INV_FK3" FOREIGN KEY ("COST_CTR_ID")
	  REFERENCES "ACC_COST_CENTER" ("COST_CTR_ID") ENABLE;
  ALTER TABLE "SALES_PUR_RETURN_INV" ADD CONSTRAINT "SALES_PUR_RETURN_INV_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
  ALTER TABLE "SALES_PUR_RETURN_INV" ADD CONSTRAINT "SALES_PUR_RETURN_INV_PROV_FK" FOREIGN KEY ("PROVIDER_ID")
	  REFERENCES "SALES_PROVIDER" ("PROVIDER_ID") ENABLE;
  ALTER TABLE "SALES_PUR_RETURN_INV" ADD CONSTRAINT "SALES_PUR_RETURN_INV_USER_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "SALES_PUR_RETURN_INV" ADD CONSTRAINT "SALES_PUR_RETURN_INV_BANK_FK" FOREIGN KEY ("BANK_ACC_ID")
	  REFERENCES "SETUP_BANK_EXT_ACC" ("BANK_ACC_ID") ENABLE;
  ALTER TABLE "SALES_PUR_RETURN_INV" ADD CONSTRAINT "SALES_PUR_RETURN_INV_JRNL_FK" FOREIGN KEY ("ACC_JOURNAL_ID")
	  REFERENCES "ACC_JOURNAL" ("ACC_JOURNAL_ID") ENABLE;
  ALTER TABLE "SALES_PUR_RETURN_INV" ADD CONSTRAINT "SALES_PUR_RETURN_INV_BRANCH_FK" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_PUR_RETURN_INV_DTL
--------------------------------------------------------

  ALTER TABLE "SALES_PUR_RETURN_INV_DTL" ADD CONSTRAINT "SALES_PUR_RETURN_INV_DTL_FK1" FOREIGN KEY ("INVOICE_ID")
	  REFERENCES "SALES_PUR_RETURN_INV" ("INVOICE_ID") ENABLE;
  ALTER TABLE "SALES_PUR_RETURN_INV_DTL" ADD CONSTRAINT "SALES_PUR_RETURN_INV_DTL_FK2" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "SALES_PRODUCT" ("PRODUCT_ID") ENABLE;
  ALTER TABLE "SALES_PUR_RETURN_INV_DTL" ADD CONSTRAINT "SALES_PUR_RETURN_INV_DTL_FK3" FOREIGN KEY ("PRODUCT_UNIT_ID")
	  REFERENCES "SALES_PRODUCT_UNIT" ("PRODUCT_UNIT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_RENT_INV
--------------------------------------------------------

  ALTER TABLE "SALES_RENT_INV" ADD CONSTRAINT "SALES_RENT_INV_FK1" FOREIGN KEY ("COST_CTR_ID")
	  REFERENCES "ACC_COST_CENTER" ("COST_CTR_ID") ENABLE;
  ALTER TABLE "SALES_RENT_INV" ADD CONSTRAINT "SALES_RENT_INV_FK2" FOREIGN KEY ("STORE_ID")
	  REFERENCES "SETUP_STORE" ("STORE_ID") ENABLE;
  ALTER TABLE "SALES_RENT_INV" ADD CONSTRAINT "SALES_RENT_INV_FK3" FOREIGN KEY ("SAFE_ID")
	  REFERENCES "SETUP_SAFE" ("SAFE_ID") ENABLE;
  ALTER TABLE "SALES_RENT_INV" ADD CONSTRAINT "SALES_RENT_INV_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
  ALTER TABLE "SALES_RENT_INV" ADD CONSTRAINT "SALES_RENT_INV_CLIENT_FK" FOREIGN KEY ("CLIENT_ID")
	  REFERENCES "SALES_CLIENT" ("CLIENT_ID") ENABLE;
  ALTER TABLE "SALES_RENT_INV" ADD CONSTRAINT "SALES_RENT_INV_USER_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "SALES_RENT_INV" ADD CONSTRAINT "SALES_RENT_INV_BANK_FK" FOREIGN KEY ("BANK_ACC_ID")
	  REFERENCES "SETUP_BANK_EXT_ACC" ("BANK_ACC_ID") ENABLE;
  ALTER TABLE "SALES_RENT_INV" ADD CONSTRAINT "SALES_RENT_INV_JRNL_FK" FOREIGN KEY ("ACC_JOURNAL_ID")
	  REFERENCES "ACC_JOURNAL" ("ACC_JOURNAL_ID") ENABLE;
  ALTER TABLE "SALES_RENT_INV" ADD CONSTRAINT "SALES_RENT_INV_BRANCH_FK" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_RENT_INV_DTL
--------------------------------------------------------

  ALTER TABLE "SALES_RENT_INV_DTL" ADD CONSTRAINT "SALES_RENT_INV_DTL_FK1" FOREIGN KEY ("INVOICE_ID")
	  REFERENCES "SALES_RENT_INV" ("INVOICE_ID") ENABLE;
  ALTER TABLE "SALES_RENT_INV_DTL" ADD CONSTRAINT "SALES_RENT_INV_DTL_FK2" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "SALES_PRODUCT" ("PRODUCT_ID") ENABLE;
  ALTER TABLE "SALES_RENT_INV_DTL" ADD CONSTRAINT "SALES_RENT_INV_DTL_FK3" FOREIGN KEY ("PRODUCT_UNIT_ID")
	  REFERENCES "SETUP_UNIT" ("UNIT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_RETURN_INV
--------------------------------------------------------

  ALTER TABLE "SALES_RETURN_INV" ADD CONSTRAINT "SALES_RETURN_INV_FK1" FOREIGN KEY ("STORE_ID")
	  REFERENCES "SETUP_STORE" ("STORE_ID") ENABLE;
  ALTER TABLE "SALES_RETURN_INV" ADD CONSTRAINT "SALES_RETURN_INV_FK2" FOREIGN KEY ("SAFE_ID")
	  REFERENCES "SETUP_SAFE" ("SAFE_ID") ENABLE;
  ALTER TABLE "SALES_RETURN_INV" ADD CONSTRAINT "SALES_RETURN_INV_FK3" FOREIGN KEY ("COST_CTR_ID")
	  REFERENCES "ACC_COST_CENTER" ("COST_CTR_ID") ENABLE;
  ALTER TABLE "SALES_RETURN_INV" ADD CONSTRAINT "SALES_RETURN_INV_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
  ALTER TABLE "SALES_RETURN_INV" ADD CONSTRAINT "SALES_RETURN_INV_CLIENT_FK" FOREIGN KEY ("CLIENT_ID")
	  REFERENCES "SALES_CLIENT" ("CLIENT_ID") ENABLE;
  ALTER TABLE "SALES_RETURN_INV" ADD CONSTRAINT "SALES_RETURN_INV_BANK_FK" FOREIGN KEY ("BANK_ACC_ID")
	  REFERENCES "SETUP_BANK_EXT_ACC" ("BANK_ACC_ID") ENABLE;
  ALTER TABLE "SALES_RETURN_INV" ADD CONSTRAINT "SALES_RETURN_INV_USER_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "SALES_RETURN_INV" ADD CONSTRAINT "SALES_RETURN_INV_JRNL_FK" FOREIGN KEY ("ACC_JOURNAL_ID")
	  REFERENCES "ACC_JOURNAL" ("ACC_JOURNAL_ID") ENABLE;
  ALTER TABLE "SALES_RETURN_INV" ADD CONSTRAINT "SALES_RETURN_INV_BRANCH_FK" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_RETURN_INV_DTL
--------------------------------------------------------

  ALTER TABLE "SALES_RETURN_INV_DTL" ADD CONSTRAINT "SALES_RETURN_INV_DTL_FK1" FOREIGN KEY ("INVOICE_ID")
	  REFERENCES "SALES_RETURN_INV" ("INVOICE_ID") ENABLE;
  ALTER TABLE "SALES_RETURN_INV_DTL" ADD CONSTRAINT "SALES_RETURN_INV_DTL_FK2" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "SALES_PRODUCT" ("PRODUCT_ID") ENABLE;
  ALTER TABLE "SALES_RETURN_INV_DTL" ADD CONSTRAINT "SALES_RETURN_INV_DTL_FK3" FOREIGN KEY ("PRODUCT_UNIT_ID")
	  REFERENCES "SALES_PRODUCT_UNIT" ("PRODUCT_UNIT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SETUP_APP_ROLE
--------------------------------------------------------

  ALTER TABLE "SETUP_APP_ROLE" ADD CONSTRAINT "ROLE_CREATED_BY_FK" FOREIGN KEY ("CREATED_BY")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "SETUP_APP_ROLE" ADD CONSTRAINT "ROLE_MODIFIED_BY_FK" FOREIGN KEY ("MODIFIED_BY")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "SETUP_APP_ROLE" ADD CONSTRAINT "SETUP_APP_ROLE_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SETUP_APP_USER
--------------------------------------------------------

  ALTER TABLE "SETUP_APP_USER" ADD CONSTRAINT "USER_CREATED_BY_FK" FOREIGN KEY ("CREATED_BY")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "SETUP_APP_USER" ADD CONSTRAINT "USER_MODIFIED_BY_FK" FOREIGN KEY ("MODIFIED_BY")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "SETUP_APP_USER" ADD CONSTRAINT "SETUP_APP_USER_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SETUP_BANK_EXT_ACC
--------------------------------------------------------

  ALTER TABLE "SETUP_BANK_EXT_ACC" ADD CONSTRAINT "SETUP_BANK_ACC_FK1" FOREIGN KEY ("ACCOUNT_ID")
	  REFERENCES "ACC_ACCOUNTS" ("ACCOUNT_ID") ENABLE;
  ALTER TABLE "SETUP_BANK_EXT_ACC" ADD CONSTRAINT "SETUP_BANK_EXT_ACC_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
  ALTER TABLE "SETUP_BANK_EXT_ACC" ADD CONSTRAINT "SETUP_BANK_EXT_ACC_COUNTRY_FK" FOREIGN KEY ("COUNTRY_ID")
	  REFERENCES "SETUP_COUNTRY" ("COUNTRY_ID") ENABLE;
  ALTER TABLE "SETUP_BANK_EXT_ACC" ADD CONSTRAINT "SETUP_BANK_EXT_ACC_CITY_FK" FOREIGN KEY ("CITY_ID")
	  REFERENCES "SETUP_CITY" ("CITY_ID") ENABLE;
  ALTER TABLE "SETUP_BANK_EXT_ACC" ADD CONSTRAINT "SETUP_BANK_EXT_ACC_REGION_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "SETUP_REGION" ("REGION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SETUP_BRANCH
--------------------------------------------------------

  ALTER TABLE "SETUP_BRANCH" ADD CONSTRAINT "SETUP_BRANCH_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
  ALTER TABLE "SETUP_BRANCH" ADD CONSTRAINT "SETUP_BRANCH_COUNTRY_FK" FOREIGN KEY ("COUNTRY_ID")
	  REFERENCES "SETUP_COUNTRY" ("COUNTRY_ID") ENABLE;
  ALTER TABLE "SETUP_BRANCH" ADD CONSTRAINT "SETUP_BRANCH_CITY_FK" FOREIGN KEY ("CITY_ID")
	  REFERENCES "SETUP_CITY" ("CITY_ID") ENABLE;
  ALTER TABLE "SETUP_BRANCH" ADD CONSTRAINT "SETUP_BRANCH_REGION_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "SETUP_REGION" ("REGION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SETUP_CITY
--------------------------------------------------------

  ALTER TABLE "SETUP_CITY" ADD CONSTRAINT "SETUP_CITY_FK1" FOREIGN KEY ("COUNTRY_ID")
	  REFERENCES "SETUP_COUNTRY" ("COUNTRY_ID") ENABLE;
  ALTER TABLE "SETUP_CITY" ADD CONSTRAINT "SETUP_CITY_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SETUP_COUNTRY
--------------------------------------------------------

  ALTER TABLE "SETUP_COUNTRY" ADD CONSTRAINT "SETUP_COUNTRY_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SETUP_CURRENCY
--------------------------------------------------------

  ALTER TABLE "SETUP_CURRENCY" ADD CONSTRAINT "CURRENCY_CREATED_BY_FK" FOREIGN KEY ("CREATED_BY")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "SETUP_CURRENCY" ADD CONSTRAINT "CURRENCY_MODIFIED_BY_FK" FOREIGN KEY ("MODIFIED_BY")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "SETUP_CURRENCY" ADD CONSTRAINT "SETUP_CURRENCY_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SETUP_PROD_GROUP
--------------------------------------------------------

  ALTER TABLE "SETUP_PROD_GROUP" ADD CONSTRAINT "SETUP_PROD_GROUP_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SETUP_REGION
--------------------------------------------------------

  ALTER TABLE "SETUP_REGION" ADD CONSTRAINT "SETUP_REGION_FK1" FOREIGN KEY ("COUNTRY_ID")
	  REFERENCES "SETUP_COUNTRY" ("COUNTRY_ID") ENABLE;
  ALTER TABLE "SETUP_REGION" ADD CONSTRAINT "SETUP_REGION_FK2" FOREIGN KEY ("CITY_ID")
	  REFERENCES "SETUP_CITY" ("CITY_ID") ENABLE;
  ALTER TABLE "SETUP_REGION" ADD CONSTRAINT "SETUP_REGION_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SETUP_SAFE
--------------------------------------------------------

  ALTER TABLE "SETUP_SAFE" ADD CONSTRAINT "SETUP_SAFE_FK1" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
  ALTER TABLE "SETUP_SAFE" ADD CONSTRAINT "SETUP_SAFE_FK2" FOREIGN KEY ("ACCOUNT_ID")
	  REFERENCES "ACC_ACCOUNTS" ("ACCOUNT_ID") ENABLE;
  ALTER TABLE "SETUP_SAFE" ADD CONSTRAINT "SETUP_SAFE_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SETUP_STORE
--------------------------------------------------------

  ALTER TABLE "SETUP_STORE" ADD CONSTRAINT "SETUP_STORE_FK1" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
  ALTER TABLE "SETUP_STORE" ADD CONSTRAINT "SETUP_STORE_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SETUP_TAX_GROUP
--------------------------------------------------------

  ALTER TABLE "SETUP_TAX_GROUP" ADD CONSTRAINT "SETUP_TAX_GROUP_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SETUP_UNIT
--------------------------------------------------------

  ALTER TABLE "SETUP_UNIT" ADD CONSTRAINT "SETUP_UNIT_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STORE_FIRST_PERIOD_STOCK
--------------------------------------------------------

  ALTER TABLE "STORE_FIRST_PERIOD_STOCK" ADD CONSTRAINT "STORE_FIRST_PERIOD_STOCK_FK1" FOREIGN KEY ("STORE_ID")
	  REFERENCES "SETUP_STORE" ("STORE_ID") ENABLE;
  ALTER TABLE "STORE_FIRST_PERIOD_STOCK" ADD CONSTRAINT "STORE_FIRST_PERIOD_STOCK_FK2" FOREIGN KEY ("SAFE_ID")
	  REFERENCES "SETUP_SAFE" ("SAFE_ID") ENABLE;
  ALTER TABLE "STORE_FIRST_PERIOD_STOCK" ADD CONSTRAINT "STORE_FIRST_PERIOD_STOCK_FK3" FOREIGN KEY ("COST_CTR_ID")
	  REFERENCES "ACC_COST_CENTER" ("COST_CTR_ID") ENABLE;
  ALTER TABLE "STORE_FIRST_PERIOD_STOCK" ADD CONSTRAINT "STORE_FIRST_PERIOD_STOCK_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
  ALTER TABLE "STORE_FIRST_PERIOD_STOCK" ADD CONSTRAINT "STORE_FIRST_PERIOD_STOCK_PROV_FK" FOREIGN KEY ("PROVIDER_ID")
	  REFERENCES "SALES_PROVIDER" ("PROVIDER_ID") ENABLE;
  ALTER TABLE "STORE_FIRST_PERIOD_STOCK" ADD CONSTRAINT "STORE_FIRST_PERIOD_STOCK_USER_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "STORE_FIRST_PERIOD_STOCK" ADD CONSTRAINT "STORE_FIRST_PERIOD_STOCK_BRANCH_FK" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STORE_FIRST_PERIOD_STOCK_DTL
--------------------------------------------------------

  ALTER TABLE "STORE_FIRST_PERIOD_STOCK_DTL" ADD CONSTRAINT "STORE_FIRST_PERIOD_STOCK_DTL_FK1" FOREIGN KEY ("INVOICE_ID")
	  REFERENCES "STORE_FIRST_PERIOD_STOCK" ("INVOICE_ID") ENABLE;
  ALTER TABLE "STORE_FIRST_PERIOD_STOCK_DTL" ADD CONSTRAINT "STORE_FIRST_PERIOD_STOCK_DTL_FK2" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "SALES_PRODUCT" ("PRODUCT_ID") ENABLE;
  ALTER TABLE "STORE_FIRST_PERIOD_STOCK_DTL" ADD CONSTRAINT "STORE_FIRST_PERIOD_STOCK_DTL_FK3" FOREIGN KEY ("PRODUCT_UNIT_ID")
	  REFERENCES "SALES_PRODUCT_UNIT" ("PRODUCT_UNIT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STORE_STOCKIN_ORDER
--------------------------------------------------------

  ALTER TABLE "STORE_STOCKIN_ORDER" ADD CONSTRAINT "STORE_STOCKIN_ORDER_FK1" FOREIGN KEY ("STORE_ID")
	  REFERENCES "SETUP_STORE" ("STORE_ID") ENABLE;
  ALTER TABLE "STORE_STOCKIN_ORDER" ADD CONSTRAINT "STORE_STOCKIN_ORDER_FK2" FOREIGN KEY ("ACCOUNT_ID")
	  REFERENCES "ACC_ACCOUNTS" ("ACCOUNT_ID") ENABLE;
  ALTER TABLE "STORE_STOCKIN_ORDER" ADD CONSTRAINT "STORE_STOCKIN_ORDER_FK3" FOREIGN KEY ("COST_CTR_ID")
	  REFERENCES "ACC_COST_CENTER" ("COST_CTR_ID") ENABLE;
  ALTER TABLE "STORE_STOCKIN_ORDER" ADD CONSTRAINT "STORE_STOCKIN_ORDER_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
  ALTER TABLE "STORE_STOCKIN_ORDER" ADD CONSTRAINT "STORE_STOCKIN_ORDER_USER_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "STORE_STOCKIN_ORDER" ADD CONSTRAINT "STORE_STOCKIN_ORDER_BRANCH_FK" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STORE_STOCKIN_ORDER_DTL
--------------------------------------------------------

  ALTER TABLE "STORE_STOCKIN_ORDER_DTL" ADD CONSTRAINT "STORE_STOCKIN_ORDER_DTL_FK1" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "STORE_STOCKIN_ORDER" ("ORDER_ID") ENABLE;
  ALTER TABLE "STORE_STOCKIN_ORDER_DTL" ADD CONSTRAINT "STORE_STOCKIN_ORDER_DTL_FK2" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "SALES_PRODUCT" ("PRODUCT_ID") ENABLE;
  ALTER TABLE "STORE_STOCKIN_ORDER_DTL" ADD CONSTRAINT "STORE_STOCKIN_ORDER_DTL_FK3" FOREIGN KEY ("PRODUCT_UNIT_ID")
	  REFERENCES "SALES_PRODUCT_UNIT" ("PRODUCT_UNIT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STORE_STOCKOUT_ORDER
--------------------------------------------------------

  ALTER TABLE "STORE_STOCKOUT_ORDER" ADD CONSTRAINT "STORE_STOCKOUT_ORDER_FK1" FOREIGN KEY ("STORE_ID")
	  REFERENCES "SETUP_STORE" ("STORE_ID") ENABLE;
  ALTER TABLE "STORE_STOCKOUT_ORDER" ADD CONSTRAINT "STORE_STOCKOUT_ORDER_FK2" FOREIGN KEY ("ACCOUNT_ID")
	  REFERENCES "ACC_ACCOUNTS" ("ACCOUNT_ID") ENABLE;
  ALTER TABLE "STORE_STOCKOUT_ORDER" ADD CONSTRAINT "STORE_STOCKOUT_ORDER_FK3" FOREIGN KEY ("COST_CTR_ID")
	  REFERENCES "ACC_COST_CENTER" ("COST_CTR_ID") ENABLE;
  ALTER TABLE "STORE_STOCKOUT_ORDER" ADD CONSTRAINT "STORE_STOCKOUT_ORDER_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
  ALTER TABLE "STORE_STOCKOUT_ORDER" ADD CONSTRAINT "STORE_STOCKOUT_ORDER_USER_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES "SETUP_APP_USER" ("USER_ID") ENABLE;
  ALTER TABLE "STORE_STOCKOUT_ORDER" ADD CONSTRAINT "STORE_STOCKOUT_ORDER_BRANCH_FK" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STORE_STOCKOUT_ORDER_DTL
--------------------------------------------------------

  ALTER TABLE "STORE_STOCKOUT_ORDER_DTL" ADD CONSTRAINT "STORE_STOCKOUT_ORDER_DTL_FK1" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "STORE_STOCKOUT_ORDER" ("ORDER_ID") ENABLE;
  ALTER TABLE "STORE_STOCKOUT_ORDER_DTL" ADD CONSTRAINT "STORE_STOCKOUT_ORDER_DTL_FK2" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "SALES_PRODUCT" ("PRODUCT_ID") ENABLE;
  ALTER TABLE "STORE_STOCKOUT_ORDER_DTL" ADD CONSTRAINT "STORE_STOCKOUT_ORDER_DTL_FK3" FOREIGN KEY ("PRODUCT_UNIT_ID")
	  REFERENCES "SALES_PRODUCT_UNIT" ("PRODUCT_UNIT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STORE_TRANSFER
--------------------------------------------------------

  ALTER TABLE "STORE_TRANSFER" ADD CONSTRAINT "STORE_TRANSFER_FK1" FOREIGN KEY ("FROM_STORE_ID")
	  REFERENCES "SETUP_STORE" ("STORE_ID") ENABLE;
  ALTER TABLE "STORE_TRANSFER" ADD CONSTRAINT "STORE_TRANSFER_FK2" FOREIGN KEY ("TO_STORE_ID")
	  REFERENCES "SETUP_STORE" ("STORE_ID") ENABLE;
  ALTER TABLE "STORE_TRANSFER" ADD CONSTRAINT "STORE_TRANSFER_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
  ALTER TABLE "STORE_TRANSFER" ADD CONSTRAINT "STORE_TRANSFER_BRANCH_FK" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STORE_TRANSFER_DTL
--------------------------------------------------------

  ALTER TABLE "STORE_TRANSFER_DTL" ADD CONSTRAINT "STORE_TRANSFER_DTL_FK1" FOREIGN KEY ("TRANSFER_ID")
	  REFERENCES "STORE_TRANSFER" ("TRANSFER_ID") ENABLE;
  ALTER TABLE "STORE_TRANSFER_DTL" ADD CONSTRAINT "STORE_TRANSFER_DTL_FK2" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "SALES_PRODUCT" ("PRODUCT_ID") ENABLE;
  ALTER TABLE "STORE_TRANSFER_DTL" ADD CONSTRAINT "STORE_TRANSFER_DTL_FK3" FOREIGN KEY ("PRODUCT_UNIT_ID")
	  REFERENCES "SALES_PRODUCT_UNIT" ("PRODUCT_UNIT_ID") ENABLE;
