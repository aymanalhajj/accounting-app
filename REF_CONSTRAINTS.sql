--------------------------------------------------------
--  File created - الجمعة-أكتوبر-11-2024   
--------------------------------------------------------
--------------------------------------------------------
--  Ref Constraints for Table ACC_SETUP
--------------------------------------------------------

  ALTER TABLE "ACC_SETUP" ADD CONSTRAINT "ACC_SETUP_COMPANY_FK" FOREIGN KEY ("COMPANY_ID")
	  REFERENCES "ADMIN_COMPANY" ("COMPANY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_INV
--------------------------------------------------------

  ALTER TABLE "SALES_INV" ADD CONSTRAINT "SALES_INV_BRANCH_FK" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_PURCHASE_INV
--------------------------------------------------------

  ALTER TABLE "SALES_PURCHASE_INV" ADD CONSTRAINT "SALES_PURCHASE_INV_BRANCH_FK" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_PURCHASE_ORDER
--------------------------------------------------------

  ALTER TABLE "SALES_PURCHASE_ORDER" ADD CONSTRAINT "SALES_PURCHASE_ORDER_BRANCH_FK" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_PUR_RETURN_INV
--------------------------------------------------------

  ALTER TABLE "SALES_PUR_RETURN_INV" ADD CONSTRAINT "SALES_PUR_RETURN_INV_BRANCH_FK" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_RENT_INV
--------------------------------------------------------

  ALTER TABLE "SALES_RENT_INV" ADD CONSTRAINT "SALES_RENT_INV_BRANCH_FK" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SALES_RETURN_INV
--------------------------------------------------------

  ALTER TABLE "SALES_RETURN_INV" ADD CONSTRAINT "SALES_RETURN_INV_BRANCH_FK" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STORE_FIRST_PERIOD_STOCK
--------------------------------------------------------

  ALTER TABLE "STORE_FIRST_PERIOD_STOCK" ADD CONSTRAINT "STORE_FIRST_PERIOD_STOCK_BRANCH_FK" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STORE_STOCKIN_ORDER
--------------------------------------------------------

  ALTER TABLE "STORE_STOCKIN_ORDER" ADD CONSTRAINT "STORE_STOCKIN_ORDER_BRANCH_FK" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STORE_STOCKOUT_ORDER
--------------------------------------------------------

  ALTER TABLE "STORE_STOCKOUT_ORDER" ADD CONSTRAINT "STORE_STOCKOUT_ORDER_BRANCH_FK" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STORE_TRANSFER
--------------------------------------------------------

  ALTER TABLE "STORE_TRANSFER" ADD CONSTRAINT "STORE_TRANSFER_BRANCH_FK" FOREIGN KEY ("BRANCH_ID")
	  REFERENCES "SETUP_BRANCH" ("BRANCH_ID") ENABLE;
