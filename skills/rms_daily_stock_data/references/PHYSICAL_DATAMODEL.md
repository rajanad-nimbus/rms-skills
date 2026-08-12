# RMS Daily & Weekly Stock Ledger Summaries Datamodel - Physical Data Model Reference

## Table: DAILY_DATA

**Description:** This table provides a history, bcomcocom

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P | F | Y | NUMERIC (4) | Contains the department number for the daily data that is being stored. |
| 2 | CLASS | P | F | Y | NUMERIC (4) | Contains the class number for the daily data that is being stored. |
| 3 | SUBCLASS | P | F | Y | NUMERIC (4) | Contains the subclass number for the daily data that is being stored. |
| 4 | LOC_TYPE | P |  | Y | VARCHAR (1) | This field contains Location Type. Valid Values are : S = Store, W = Warehouse, E = External Finisher |
| 5 | LOCATION | P |  | Y | NUMERIC (10) | This field contains the Store if Loc_type = S, the Warehouse or Internal Finisher if Loc_type = W, the External Finisher if Loc_type = E. |
| 6 | DATA_DATE | P |  | Y | Date | Contains the date for which the daily data is being stored. |
| 7 | CURRENCY_IND | P |  | Y | VARCHAR (1) | If the record is in the locations local currency the indicator will be L. Otherwise the indicator will be P for Primary currency. |
| 8 | SET_OF_BOOKS_ID | P |  | Y | NUMERIC (15) | Set Of Books Id |
| 9 | HALF_NO |  | F | Y | NUMERIC (5) | Contains the half number for the daily data that is being stored. |
| 10 | MONTH_NO |  |  | Y | NUMERIC (2) | Contains the month number for the daily data that is being stored. |
| 11 | EOW_DATE |  |  | Y | Date | This column contains the eow_date for the record. |
| 12 | WEEK_NO |  |  |  | NUMERIC (2) | Contains the week number for the daily data that is being stored. |
| 13 | DAY_NO |  |  |  | NUMERIC (2) | Contains the day of the week for which the daily data is being stored. |
| 14 | STOCK_ADJ_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of stock on hand adjustment for a subclass/location for the day. |
| 15 | STOCK_ADJ_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of stock on hand adjustment for a subclass/location for the day. |
| 16 | STOCK_ADJ_COGS_RETAIL |  |  |  | NUMERIC (20,4) | Amount at retail of Stock Adjustment that effects COGS for a subclass/location for the day. |
| 17 | STOCK_ADJ_COGS_COST |  |  |  | NUMERIC (20,4) | Amount at cost of Stock Adjustment that effects COGS for a subclass/location for the day. |
| 18 | PURCH_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of purchases received for a subclass/location for the day. |
| 19 | PURCH_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of purchases received for a subclass/location for the day. |
| 20 | RTV_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of merchandise returned to vendor for a subclass/location for the day. |
| 21 | RTV_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of merchandise returned to vendor for a subclass/location for the day. |
| 22 | FREIGHT_COST |  |  |  | NUMERIC (20,4) | Cost of freight for purchases received for a subclass/location for the day. |
| 23 | UP_CHRG_AMT_PROFIT |  |  |  | NUMERIC (20,4) | Contains the value of Profit Up Charge costs incurred by the location/sublcass for the day. |
| 24 | UP_CHRG_AMT_EXP |  |  |  | NUMERIC (20,4) | Contains the value of Expense Up Charge costs incurred by the location/sublcass for the day. |
| 25 | TSF_IN_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of merchandise transferred into a location/subclass for the day. |
| 26 | TSF_IN_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of merchandise transferred into a location/subclass for the day. |
| 27 | TSF_IN_BOOK_RETAIL |  |  |  | NUMERIC (20,4) | Contains the value, at retail, of merchandise transferred through a book transfer into a location/subclass for the day. |
| 28 | TSF_IN_BOOK_COST |  |  |  | NUMERIC (20,4) | Contains the value, at cost, of merchandise transferred through a book transfer into a location/subclass for the day. |
| 29 | TSF_OUT_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of merchandise transferred out of a location / subclass for the day. |
| 30 | TSF_OUT_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of merchandise transferred out of a location / subclass for the day. |
| 31 | TSF_OUT_BOOK_RETAIL |  |  |  | NUMERIC (20,4) | Contains the value, at retail, of merchandise transferred through a book transfer out of a location/subclass for the day. |
| 32 | TSF_OUT_BOOK_COST |  |  |  | NUMERIC (20,4) | Contains the value, at cost, of merchandise transferred through a book transfer out of a location/subclass for the day. |
| 33 | NET_SALES_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of net merchandise sold (gross sales - customer returns) for a subclass/location for the day. |
| 34 | NET_SALES_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of net merchandise sold (gross sales - customer returns) for a subclass/location for the day. |
| 35 | NET_SALES_RETAIL_EX_VAT |  |  |  | NUMERIC (20,4) | Dollar values at retail (excluding VAT) of net merchandise sold (gross sales - customer returns) for a subclass/location for the day. |
| 36 | RETURNS_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of merchandise returned by customers for a subclass/location for the day. |
| 37 | RETURNS_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of merchandise returned by customers for a subclass/location for the day. |
| 38 | PROM_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Promotional markdowns are temporary reductions to the original retail price established at the beginning of half for an item during a promotional event, or for other discounts and allowances granted at the point-of-sale(POS), hence it is sometimes known as POS markdowns. The reduction in the retail value of the item is the promotional markdown at retail and is captured only when the item is sold. This field holds the sum of promotional markdown at retail for all merchandise in a subclass/location for the day. |
| 39 | MARKDOWN_CAN_RETAIL |  |  |  | NUMERIC (20,4) | Markdown cancellations are upward revision to the retail price of an item, to be offset against markdowns previously taken. The increase in the retail value of the item is the markdown cancellation at retail. This field holds the sum of markdown cancellation at retail for all merchandise in a subclass/location for the day. |
| 40 | EMPL_DISC_RETAIL |  |  |  | NUMERIC (20,4) | Employee discounts are the discounts given to employees at the time of sale. This field holds the sum of employee discount amount for all merchandise in a subclass/location for the day. |
| 41 | WORKROOM_AMT |  |  |  | NUMERIC (20,4) | Workroom cost and other cost of sale such as alterations, are cost of providing services to customers, and will reduce the gross margin. This field holds the total workroom cost and other cost of sale incurred for a subclass/location for the day. |
| 42 | CASH_DISC_AMT |  |  |  | NUMERIC (20,4) | Cash discounts are discounts credited by vendor, and will increase the gross margin. This field holds the total cash discount amount earned for a subclass/location for the day. |
| 43 | SALES_UNITS |  |  |  | NUMERIC (12,4) | Number of net units of merchandise sold for a subclass/location for the day. |
| 44 | MARKUP_RETAIL |  |  |  | NUMERIC (20,4) | Markups are upward revisions to the original retail price established at the beginning of half for an item. The increase of this retail value is markup at retail. This field holds the sum of markup at retail for all merchandise in a subclass/location for the day. |
| 45 | MARKUP_CAN_RETAIL |  |  |  | NUMERIC (20,4) | A markup cancellation is used to correct an unintentional error in a previous markup. Currently this field is not used in Oracle Retail, since generally speaking price reductions are to be treated as markdowns and |
| 46 | CLEAR_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Clearance markdowns are reductions to the original retail price established at the beginning of half for an item during a clearance event. The reduction in the retail value of the item is the clearance markdown at retail. This field holds the sum of clearance markdown at retail for all merchandise in a subclass/location for the day. |
| 47 | PERM_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Permanent markdowns are permanent reductions to the original retail price established at the beginning of half for an item. The reduction in the retail value of the item is the permanent markdown at retail. This field holds the sum of permanent markdown at retail for all merchandise in a subclass/location for the day. |
| 48 | COST_VARIANCE_AMT |  |  |  | NUMERIC (20,4) | This field is used in the standard cost method of accounting to record the standard cost change as well as the cost difference between standard cost and transaction cost for transactions such as receiving, RTV and transfers. |
| 49 | RECLASS_IN_COST |  |  |  | NUMERIC (20,4) | This field contains the dollar values at cost of merchandise transferred into the location/subclass during the specified day due to reclassification. |
| 50 | RECLASS_IN_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the dollar values at retail of merchandise transferred into the location/subclass during the specified day due to reclassification. |
| 51 | RECLASS_OUT_COST |  |  |  | NUMERIC (20,4) | This field contains the dollar values at cost of merchandise transferred out of the location/subclass during the specified day due to reclassification. |
| 52 | RECLASS_OUT_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the dollar values at retail of merchandise transferred out of the location/subclass during the specified day due to reclassification. |
| 53 | FREIGHT_CLAIM_RETAIL |  |  |  | NUMERIC (20,4) | Amount at retail of freight claim for a subclass/location for the day. |
| 54 | FREIGHT_CLAIM_COST |  |  |  | NUMERIC (20,4) | Amount at cost of freight claim for a subclass/location for the day. |
| 55 | INTERCOMPANY_IN_RETAIL |  |  |  | NUMERIC (20,4) | Contains the dollar values at retail of merchandise transferred into a location/subclass for the day for intercompany transfers. |
| 56 | INTERCOMPANY_IN_COST |  |  |  | NUMERIC (20,4) | Contains the dollar values at cost of merchandise transferred into a location/subclass for the day for intercompany transfers. |
| 57 | INTERCOMPANY_OUT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the dollar values at retail of merchandise transferred out of a location/subclass for the day for intercompany transfers. |
| 58 | INTERCOMPANY_OUT_COST |  |  |  | NUMERIC (20,4) | Contains the dollar values at cost of merchandise transferred out of a location/subclass for the day for intercompany transfers. |
| 59 | INTERCOMPANY_MARKUP |  |  |  | NUMERIC (20,4) | Contains the sum of markup at retail of merchandise transferred out of a location/subclass for the day for intercompany transfers. |
| 60 | INTERCOMPANY_MARKDOWN |  |  |  | NUMERIC (20,4) | Contains the sum of markdown at retail of merchandise transferred out of a location/subclass for the day for intercompany transfers. |
| 61 | WO_ACTIVITY_UPD_INV |  |  |  | NUMERIC (20,4) | Contains the sum of dollar value at cost of merchandise required work order activity - update inventory in a location/subclass for the day for intercompany transfers. |
| 62 | WO_ACTIVITY_POST_FIN |  |  |  | NUMERIC (20,4) | Contains the sum of dollar value at cost of merchandise required work order activity - post to financial in a location/subclass for the day for intercompany transfers. |
| 63 | DEAL_INCOME_SALES |  |  |  | NUMERIC (20,4) | Dollar values of deal incomes sales received for a subclass/location for the day. |
| 64 | DEAL_INCOME_PURCH |  |  |  | NUMERIC (20,4) | Dollar values of deal incomes purchases received for a subclass/location for the day. |
| 65 | RESTOCKING_FEE |  |  |  | NUMERIC (20,4) | Dollar values at cost of restocking fees received for a subclass/location for the day. |
| 66 | RETAIL_COST_VARIANCE |  |  |  | NUMERIC (20,4) | Cost variance using retail based accounting. |
| 67 | MARGIN_COST_VARIANCE |  |  |  | NUMERIC (20,4) | New Cost variance using cost based accounting. |
| 68 | FRANCHISE_SALES_RETAIL |  |  |  | NUMERIC (20,4) | Amount at retail of merchandise sold to franchisees at the subclass / franchise location for the day |
| 69 | FRANCHISE_SALES_COST |  |  |  | NUMERIC (20,4) | Amount at cost of merchandise sold to franchisees at the subclass / franchise location for the day |
| 70 | FRANCHISE_RETURNS_RETAIL |  |  |  | NUMERIC (20,4) | Amount at retail of merchandise returned by franchisees at the subclass / franchise location for the day |
| 71 | FRANCHISE_RETURNS_COST |  |  |  | NUMERIC (20,4) | Amount at cost of merchandise returned by franchisees at the subclass / franchise location for the day |
| 72 | FRANCHISE_MARKUP_RETAIL |  |  |  | NUMERIC (20,4) | Contains the sum of markups at retail of merchandise at franchisee location / subclass for the day. |
| 73 | FRANCHISE_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Contains the sum of markdowns at retail of merchandise at franchisee location / subclass for the day. |
| 74 | FRANCHISE_RESTOCKING_FEE |  |  |  | NUMERIC (20,4) | Amount at cost of restocking fees received for a franchisee location / subclass for the day |
| 75 | VAT_IN |  |  |  | NUMERIC (20,4) | Input VAT |
| 76 | VAT_OUT |  |  |  | NUMERIC (20,4) | Output VAT |
| 77 | WEIGHT_VARIANCE_RETAIL |  |  |  | NUMERIC (20,4) | This will contain the weight variance retail for catchweight items. |
| 78 | RECOVERABLE_TAX |  |  |  | NUMERIC (20,4) | This column will hold the consolidated value of the tax amount which can be recovered. |
| 79 | NET_SALES_NON_INV_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of non-inventory item sold for a subclass/location for the day. |
| 80 | NET_SALES_NON_INV_RTL_EX_VAT |  |  |  | NUMERIC (20,4) | Dollar values at retail (excluding VAT) of non-inventory item sold for a subclass/location for the day. |
| 81 | NET_SALES_NON_INV_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of non-inventory item sold for a subclass/location for the day. |
| 82 | REC_COST_ADJ_VARIANCE |  |  |  | NUMERIC (20,4) | Dollar value for the receiver cost adjustment variance. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DAILY_DATA|PK||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
||||||LOC_TYPE|ASC|
||||||LOCATION|ASC|
||||||CURRENCY_IND|ASC|
||||||DATA_DATE|ASC|
||||||SET_OF_BOOKS_ID|ASC|
|DAILY_DATA_I1|||||HALF_NO|ASC|
|PK_DAILY_DATA|UN||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||LOC_TYPE|ASC|
||||||LOCATION|ASC|
||||||CURRENCY_IND|ASC|
||||||DATA_DATE|ASC|
||||||SET_OF_BOOKS_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_DAILY_DATA_CURRENCY_IND|CURRENCY_IND IN ('L', 'P')<br>|
||CHK_DAILY_DATA_DAY_NO|DAY_NO BETWEEN 1 AND 7<br>|
||CHK_DAILY_DATA_MONTH_NO|MONTH_NO BETWEEN 1 AND 6<br>|
||CHK_DAILY_DATA_WEEK_NO|WEEK_NO BETWEEN 1 AND 5<br>|
|Column Level|CURRENCY_IND||
||MONTH_NO||
||WEEK_NO||
||DAY_NO||

---

## Table: DAILY_DATA_BACKPOST

**Description:** This table holds the rolled up data for all back posted transactions.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  |  | Y | NUMERIC (4) | Contains the department number for the daily data backposting that is being stored. |
| 2 | CLASS |  |  | Y | NUMERIC (4) | Contains the class number for the daily data that is being stored. |
| 3 | SUBCLASS |  |  | Y | NUMERIC (4) | Contains the subclass number for the daily data that is being stored. |
| 4 | LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains Location Type. Valid Values are : S = Store, W = Warehouse, E = External Finisher |
| 5 | LOCATION |  |  | Y | NUMERIC (10) | This field contains the Store if Loc_type = S, the Warehouse or Internal Finisher if Loc_type = W, the External Finisher if Loc_type = E. |
| 6 | DATA_DATE |  |  | Y | Date | Contains the date on which the transaction happened. |
| 7 | SET_OF_BOOKS_ID |  |  | Y | NUMERIC (15) | Oracle set of books for Oracle Retail transactions. |
| 8 | STOCK_ADJ_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of stock on hand adjustment for a subclass/location for the day. |
| 9 | STOCK_ADJ_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of stock on hand adjustment for a subclass/location for the day. |
| 10 | STOCK_ADJ_COGS_RETAIL |  |  |  | NUMERIC (20,4) | Amount at retail of Stock Adjustment that effects COGS for a subclass/location for the day. |
| 11 | STOCK_ADJ_COGS_COST |  |  |  | NUMERIC (20,4) | Amount at cost of Stock Adjustment that effects COGS for a subclass/location for the day. |
| 12 | PURCH_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of purchases received for a subclass/location for the day. |
| 13 | PURCH_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of purchases received for a subclass/location for the day. |
| 14 | RTV_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of merchandise returned to vendor for a subclass/location for the day. |
| 15 | RTV_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of merchandise returned to vendor for a subclass/location for the day. |
| 16 | FREIGHT_COST |  |  |  | NUMERIC (20,4) | Cost of freight for purchases received for a subclass/location for the day. |
| 17 | UP_CHRG_AMT_PROFIT |  |  |  | NUMERIC (20,4) | Contains the value of Profit Up Charge costs incurred by the location/sublcass for the day. |
| 18 | UP_CHRG_AMT_EXP |  |  |  | NUMERIC (20,4) | Contains the value of Expense Up Charge costs incurred by the location/sublcass for the day. |
| 19 | TSF_IN_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of merchandise transferred into a location/subclass for the day. |
| 20 | TSF_IN_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of merchandise transferred into a location/subclass for the day. |
| 21 | TSF_IN_BOOK_RETAIL |  |  |  | NUMERIC (20,4) | Contains the value, at retail, of merchandise transferred through a book transfer into a location/subclass for the day. |
| 22 | TSF_IN_BOOK_COST |  |  |  | NUMERIC (20,4) | Contains the value, at cost, of merchandise transferred through a book transfer into a location/subclass for the day. |
| 23 | TSF_OUT_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of merchandise transferred out a location/subclass for the day. |
| 24 | TSF_OUT_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of merchandise transferred out a location/subclass for the day. |
| 25 | TSF_OUT_BOOK_RETAIL |  |  |  | NUMERIC (20,4) | Contains the value, at retail, of merchandise transferred through a book transfer out a location/subclass for the day. |
| 26 | TSF_OUT_BOOK_COST |  |  |  | NUMERIC (20,4) | Contains the value, at cost, of merchandise transferred through a book transfer out a location/subclass for the day. |
| 27 | NET_SALES_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of net merchandise sold (gross sales - customer returns) for a subclass/location for the day. |
| 28 | NET_SALES_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of net merchandise sold (gross sales - customer returns) for a subclass/location for the day. |
| 29 | NET_SALES_RETAIL_EX_VAT |  |  |  | NUMERIC (20,4) | Dollar values at retai (excludin VAT)l of net merchandise sold (gross sales - customer returns) for a subclass/location for the day. |
| 30 | RETURNS_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of merchandise returned by customers for a subclass/location for the day. |
| 31 | RETURNS_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of merchandise returned by customers for a subclass/location for the day. |
| 32 | PROM_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | This field holds the sum of promotional markdown at retail for all merchandise in a subclass/location for the day. |
| 33 | MARKDOWN_CAN_RETAIL |  |  |  | NUMERIC (20,4) | This field holds the sum of markdown cancellation at retail for all merchandise in a subclass/location for the day. |
| 34 | EMPL_DISC_RETAIL |  |  |  | NUMERIC (20,4) | Employee discounts are the discounts given to employees at the time of sale. This field holds the sum of employee discount amount for all merchandise in a subclass/location for the day. |
| 35 | WORKROOM_AMT |  |  |  | NUMERIC (20,4) | Workroom cost and other cost of sale such as alterations, are cost of providing services to customers, and will reduce the gross margin. This field holds the total workroom cost and other cost of sale incurred for a subclass/location for the day. |
| 36 | CASH_DISC_AMT |  |  |  | NUMERIC (20,4) | Cash discounts are discounts credited by vendor, and will increase the gross margin. This field holds the total cash discount amount earned for a subclass/location for the day. |
| 37 | SALES_UNITS |  |  |  | NUMERIC (12,4) | Number of net units of merchandise sold for a subclass/location for the day. |
| 38 | MARKUP_RETAIL |  |  |  | NUMERIC (20,4) | This field holds the sum of markup at retail for all merchandise in a subclass/location for the day. |
| 39 | MARKUP_CAN_RETAIL |  |  |  | NUMERIC (20,4) | A markup cancellation is used to correct an unintentional error in a previous markup. Currently this field is not used in Oracle Retail, since generally speaking price reductions are to be treated as markdowns and not as markup cancellations, and to do otherwise is open the door to abuse and permit the concealment of markdowns. An enhancement to the system is required to capture this dollar values for the rare cases where markup up cancellation can be clearly identified. This field holds the sum of markup cancellation at retail for all merchandise in a subclass/location for the day. |
| 40 | CLEAR_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | This field holds the sum of clearance markdown at retail for all merchandise in a subclass/location for the day. |
| 41 | PERM_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | This field holds the sum of permanent markdown at retail for all merchandise in a subclass/location for the day. |
| 42 | COST_VARIANCE_AMT |  |  |  | NUMERIC (20,4) | This field is used in the standard cost method of accounting to record the standard cost change as well as the cost difference between standard cost and transaction cost for transactions such as receiving, RTV and transfers. |
| 43 | RECLASS_IN_COST |  |  |  | NUMERIC (20,4) | This field contains the dollar values at cost of merchandise transferred into the location/subclass during the specified day due to reclassification. |
| 44 | RECLASS_IN_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the dollar values at retail of merchandise transferred into the location/subclass during the specified day due to reclassification. |
| 45 | RECLASS_OUT_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the dollar values at retail of merchandise transferred out the location/subclass during the specified day due to reclassification. |
| 46 | RECLASS_OUT_COST |  |  |  | NUMERIC (20,4) | This field contains the dollar values at cost of merchandise transferred out the location/subclass during the specified day due to reclassification. |
| 47 | FREIGHT_CLAIM_RETAIL |  |  |  | NUMERIC (20,4) | Amount at retail of freight claim for a subclass/location for the day. |
| 48 | FREIGHT_CLAIM_COST |  |  |  | NUMERIC (20,4) | Amount at cost of freight claim for a subclass/location for the day. |
| 49 | INTERCOMPANY_IN_RETAIL |  |  |  | NUMERIC (20,4) | Contains the dollar values at retail of merchandise transferred into a location/subclass for the day for intercompany transfers. |
| 50 | INTERCOMPANY_IN_COST |  |  |  | NUMERIC (20,4) | Contains the dollar values at cost of merchandise transferred into a location/subclass for the day for intercompany transfers. |
| 51 | INTERCOMPANY_OUT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the dollar values at retail of merchandise transferred out a location/subclass for the day for intercompany transfers. |
| 52 | INTERCOMPANY_OUT_COST |  |  |  | NUMERIC (20,4) | Contains the dollar values at cost of merchandise transferred out a location/subclass for the day for intercompany transfers. |
| 53 | INTERCOMPANY_MARKUP |  |  |  | NUMERIC (20,4) | Contains the sum of markup at retail of merchandise transferred out of a location/subclass for the day for intercompany transfers. |
| 54 | INTERCOMPANY_MARKDOWN |  |  |  | NUMERIC (20,4) | Contains the sum of markdown at retail of merchandise transferred out of a location/subclass for the day for intercompany transfers. |
| 55 | WO_ACTIVITY_UPD_INV |  |  |  | NUMERIC (20,4) | Contains the sum of dollar value at cost of merchandise required work order activity - update inventory in a location/subclass for the day for intercompany transfers. |
| 56 | WO_ACTIVITY_POST_FIN |  |  |  | NUMERIC (20,4) | Contains the sum of dollar value at cost of merchandise required work order activity - post to financial in a location/subclass for the day for intercompany transfers. |
| 57 | POST_DATE |  |  |  | Date | Date on which the backposted transactions was posted in this table. |
| 58 | FRANCHISE_SALES_RETAIL |  |  |  | NUMERIC (20,4) | Amount at retail of merchandise sold to franchisees at the subclass / franchise location for the day |
| 59 | FRANCHISE_SALES_COST |  |  |  | NUMERIC (20,4) | Amount at cost of merchandise sold to franchisees at the subclass / franchise location for the day |
| 60 | FRANCHISE_RETURNS_RETAIL |  |  |  | NUMERIC (20,4) | Amount at retail of merchandise returned by franchisees at the subclass / franchise location for the day |
| 61 | FRANCHISE_RETURNS_COST |  |  |  | NUMERIC (20,4) | Amount at cost of merchandise returned by franchisees at the subclass / franchise location for the day |
| 62 | FRANCHISE_MARKUP_RETAIL |  |  |  | NUMERIC (20,4) | Contains the sum of markups at retail of merchandise at franchisee location / subclass for the day. |
| 63 | FRANCHISE_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Contains the sum of markdowns at retail of merchandise at franchisee location / subclass for the day. |
| 64 | FRANCHISE_RESTOCKING_FEE |  |  |  | NUMERIC (20,4) | Amount at cost of restocking fees received for a location / subclass for the day |
| 65 | VAT_IN |  |  |  | NUMERIC (20,4) | Input VAT |
| 66 | VAT_OUT |  |  |  | NUMERIC (20,4) | Output VAT |
| 67 | WEIGHT_VARIANCE_RETAIL |  |  |  | NUMERIC (20,4) | This will contain the weight variance retail for catchweight items. |
| 68 | RECOVERABLE_TAX |  |  |  | NUMERIC (20,4) | This column will hold the consolidated value of the tax amount which can be recovered. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|DAILY_DATA_BACKPOST_I1|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
||||||LOC_TYPE|ASC|
||||||LOCATION|ASC|
||||||DATA_DATE|ASC|
||||||SET_OF_BOOKS_ID|ASC|

---

## Table: DAILY_DATA_TEMP

**Description:** This table will hold back_posted transactions that are processed by the salweek.pc batch program.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  | F | Y | NUMERIC (4) | contains the department number for the daily data that is being stored |
| 2 | CLASS |  | F | Y | NUMERIC (4) | contains the class number for the daily data that is being stored |
| 3 | SUBCLASS |  | F | Y | NUMERIC (4) | contains the subclass number for the daily data that is being stored |
| 4 | CURRENCY_IND |  |  | Y | VARCHAR (1) | If the record is in the locations local currency the indicator will be L. Otherwise the indicator will be a P for primary currency. |
| 5 | DATA_DATE |  |  | Y | Date | contains the date for which the daily data is being stored |
| 6 | EOW_DATE |  |  | Y | Date | this column contains the eow_date for the record |
| 7 | LOC_TYPE |  |  |  | VARCHAR (1) | This field contains Location Type. Valid Values are : S = Store, W = Warehouse, E = External Finisher |
| 8 | LOCATION |  |  |  | NUMERIC (10) | This field contains the Store if Loc_type = S, the Warehouse or Internal Finisher if Loc_type = W, the External Finisher if Loc_type = E. |
| 9 | SET_OF_BOOKS_ID |  |  | Y | NUMERIC (15) | Set Of Books Id |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|DAILY_DATA_TEMP_I1|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|

---

## Table: DAILY_PURGE

**Description:** This table is used to hold the table name and a key value for a record that needs to be deleted. Records are inserted into this table on-line as part of the delete logic. The actual deletes are performed in a nightly batch process by running the dlypurge.pc program.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | KEY_VALUE | P |  | Y | VARCHAR (50) | This column holds the key value that will be used to delete records from the given table name. For example, if a SKU was to be deleted from win_skus, this field would hold the SKU number. If a class is to be |
| 2 | TABLE_NAME | P |  | Y | VARCHAR (30) | This column holds the name of the table from which the record will be deleted. |
| 3 | DELETE_TYPE |  |  | Y | VARCHAR (1) | The value in this column indicates what type of delete this record represents, from pressing the delete button, D, or from pressing the cancel button, C. This field will only have a value if different logic is performed determined by which button was pressed. |
| 4 | DELETE_ORDER |  |  | Y | NUMERIC (1) | This field indicates the order that the record should be processed in the nightly batch run. All records that should be processed last should have a value of 2. All other records will have a value of 1. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DAILY_PURGE|PK||||KEY_VALUE|ASC|
||||||TABLE_NAME|ASC|

---

## Table: DAILY_PURGE_ERROR_LOG

**Description:** This table holds a log of errors that were found when running the dlypurge.pc program. The records on this table are purged at the beginning of the dlypurge run each day.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | KEY_VALUE |  |  | Y | VARCHAR (50) | This column holds the key value that will be used to delete records from the given table name. For example, if a SKU was to be deleted from win_skus, this field would hold the SKU number. If a class is to be deleted, where both the dept and class number are needed, the record should be inserted into this column as: dept,class. |
| 2 | TABLE_NAME |  |  | Y | VARCHAR (30) | This column holds the name of the table from which the record will be deleted. |
| 3 | ERROR_DESC |  |  | Y | VARCHAR (250) | This column holds the description of the error encountered when running dlypurge.pc. |

---

## Table: DAILY_SALES_DISCOUNT

**Description:** This table contains one record for each Item/Store which had a sales transaction with a multi-multi unit pricing discount for the date specified.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | This field contains the unique number representing the Item in the system. |
| 2 | STORE | P |  | Y | NUMERIC (10) | This field contains the number of the store at which the discount was taken. |
| 3 | PROM_TYPE | P |  | Y | VARCHAR (6) | This table indicates the type of promotion that was taken for the transaction. Valid values are stored in the codes table with a code type of PRMT. |
| 4 | DATA_DATE | P |  | Y | Date | This field contains the date on which the discount occurred. |
| 5 | TRAN_TYPE | P |  | Y | VARCHAR (1) | This field contains the valid transaction type for the item. Valid values are Sale and Return. It is captured for all promotion types. |
| 6 | SALES_QTY |  |  | Y | NUMERIC (12,4) | This field contains the number of items sold in the transaction with the discount. |
| 7 | SALES_RETAIL |  |  | Y | NUMERIC (20,4) | This field contains the retail amount of the items sold in the transaction with the discount. This field contains the local currency. It is captured for all promotion types. |
| 8 | DISCOUNT_AMT |  |  | Y | NUMERIC (20,4) | This field contains the monetary amount of the discount. This field is stored in the local currency. |
| 9 | EXPECTED_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the retail that RMS expected the item to be sold at. Values are held in the local currency. |
| 10 | ACTUAL_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the retail that the item was actually sold at. Values are held in the local currency. |
| 11 | PROMOTION |  |  |  | NUMERIC (10) | This field contains the promotion that the item was sold under. |
| 12 | GROSS_PROFIT_AMT |  |  |  | NUMERIC (20,4) | This field is captured for each promotional sale other than in-store promotion types. It is calculated as sales retail - cost of sales, where sales retail is the actual retail sold for this item and cost of sales is either av_cost or unit cost depending on system option std_av_ind = A or S, respectively. |
| 13 | PROM_COMPONENT | P |  | Y | NUMERIC (10) | This field contains the promotion component ID that the item was sold under. |

---

## Table: HALF

**Description:** In addition to weekly and monthly calendars, RMS also facilitates 'Half Yearly' time periods for which budgeting and reporting can be done in the stock ledger. This table is used for defining the Half Yearly periods and contains one row for each reporting half within the company about which either past history may be kept or future budgets can be planned. Whenever a half name is used by Oracle Retail, or a half number is validated, it is always selected from this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | HALF_NO | P |  | Y | NUMERIC (5) | This field contains the year and the half number (1 or 2) for each half. For example: 20131 or 20132. |
| 2 | HALF_NAME |  |  | Y | VARCHAR (120) | This field contains the season name and year for the half. For example: Summer 2013. |
| 3 | HALF_DATE |  |  | Y | VARCHAR (120) | This field contains the description of the month span for the half. For example: Aug 2012 to Jan 2013. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HALF|PK||||HALF_NO|ASC|

---

## Table: HALF_DATA

**Description:** This table provides a history, by half, of shrinkage amounts that are maintained by RMS. This table contains one row for each department/class/subclass/location/half combination in the company. The data in this table is updated in the end of half processing run.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P | F | Y | NUMERIC (4) | This field contains the unique identifier for the department for which the rolled-up half data is stored. |
| 2 | CLASS | P | F | Y | NUMERIC (4) | This field contains the unique identifier for the class for which the rolled-up half data is stored. |
| 3 | SUBCLASS | P | F | Y | NUMERIC (4) | This field contains the unique identifier for the subclass for which the rolled-up half data is stored. |
| 4 | LOC_TYPE | P |  | Y | VARCHAR (1) | This field contains Location Type.Valid Values are : S = Store, W = Warehouse or Internal Finisher, E = External Finisher |
| 5 | LOCATION | P |  | Y | NUMERIC (10) | This field contains the unique identifier for the location for which the rolled up half data is stored. The location will be a Store if Loc_type = S, the Warehouse or Internal Finisher if Loc_type = W, the External Finisher if Loc_type = E. |
| 6 | HALF_NO | P | F | Y | NUMERIC (5) | This field contains the half number for which the rolled-up data is stored. This is referenced from HALF table. |
| 7 | SET_OF_BOOKS_ID | P |  | Y | NUMERIC (15) | This field contains unique identifier for Set Of Books with which the location is attached. |
| 8 | INTER_STOCKTAKE_SHRINK_AMT |  |  |  | NUMERIC (20,4) | This field contains the cumulative estimated (or budgeted) shrinkage value since the last time a unit and value inventory count was taken for a subclass/location. It is valued at cost for the cost department and at retail for the retail department. It is reset to 0 after the actual shrinkage has been calculated for a Unit & Value count. This field is stored in the local currency. |
| 9 | INTER_STOCKTAKE_SALES_AMT |  |  |  | NUMERIC (20,4) | This field contains the cumulative net sales value since the last time a unit and value inventory count was taken for a subclass/location. It is valued at cost for the cost department and at retail for the retail department. It is reset to 0 after the actual shrinkage has been calculated for a Unit & Value count. This field is stored in the local currency. |
| 10 | SHRINKAGE_PCT |  |  |  | NUMERIC (12,4) | This field contains the Shrinkage percentage for the subclass/location/half. This is calculated as the inter_stocktake_shrink_amt/inter_stocktake_sales_amt for the subclass/location. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HALF_DATA|PK||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
||||||LOC_TYPE|ASC|
||||||LOCATION|ASC|
||||||HALF_NO|ASC|
||||||SET_OF_BOOKS_ID|ASC|
|HALF_DATA_I2|||||HALF_NO|ASC|
|HALF_DATA_I1|||||DEPT|ASC|
||||||LOC_TYPE|ASC|
||||||LOCATION|ASC|
|PK_HALF_DATA|UN||||DEPT|ASC|
||||||CLASS|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||SUBCLASS|ASC|
||||||LOC_TYPE|ASC|
||||||LOCATION|ASC|
||||||HALF_NO|ASC|
||||||SET_OF_BOOKS_ID|ASC|

---

## Table: HALF_DATA_BUDGET

**Description:** This table is used for holding data required for budgeting and gross margin forecasting. This table contains one row for each department/location/half within the company. New rows are added to this table when a new location or department is added to the system or in the end of half processing which adds rows for the new half for all department/location combinations. The half data budget table differs from the month data budget table in that it is not used only for reporting purposes. Shrinkage percent captured on the half data budget table drives processing in the system, based on the setting of the Budgeted Shrink Indicator. Rows are automatically purged by the end of half processing run when they are over eighteen months old. When this happens all six months of the half are purged resulting in twelve months of retained data.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P | F | Y | NUMERIC (4) | This field contains the unique identifier for the department for which the budget information for the half is being stored. |
| 2 | HALF_NO | P | F | Y | NUMERIC (5) | This field contains the half number for which the budget information is being stored. |
| 3 | LOC_TYPE | P |  | Y | VARCHAR (1) | This field contains Location Type.Valid Values are : S = Store, W = Warehouse or Internal Finisher, E = External Finisher |
| 4 | LOCATION | P |  | Y | NUMERIC (10) | This field contains the unique identifier for the location for which the half budget data is stored. The location will be a Store if Loc_type = S, the Warehouse or Internal Finisher if Loc_type = W, the External Finisher if Loc_type = E. |
| 5 | SET_OF_BOOKS_ID | P |  | Y | NUMERIC (15) | This field contains unique identifier for Set Of Books with which the location is attached. |
| 6 | CUM_MARKON_PCT |  |  |  | NUMERIC (12,4) | This field contains the budget value for the half for cumulative markon percent. This value is used in the retail method of accounting only. |
| 7 | SHRINKAGE_PCT |  |  |  | NUMERIC (12,4) | This field contains budget for the half for shrinkage amount as a percent of sales for the subclass/location. This field is used in the calculation of the shrinkage amount if budgeted shrink indicator option is selected as Y. |
| 8 | MARKDOWN_PCT |  |  |  | NUMERIC (12,4) | This field contains the budget for the half for markdowns as a percent of sales for the subclass/location. |
| 9 | GROSS_MARGIN_PCT |  |  |  | NUMERIC (12,4) | This field contains the budget for the half for the gross profit margin as a percent of sales for the subclass/location. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HALF_DATA_BUDGET|PK||||DEPT|ASC|
||||||HALF_NO|ASC|
||||||LOC_TYPE|ASC|
||||||LOCATION|ASC|
||||||SET_OF_BOOKS_ID|ASC|
|HALF_DATA_BUDGET_I1|||||HALF_NO|ASC|

---

## Table: HALF_TL

**Description:** This is the translation table for HALF table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | HALF_NO | P | F | Y | NUMERIC (5) | This field contains the year and the half number (1 or 2) for each half. For example: 20131 or 20132. |
| 3 | HALF_NAME |  |  | Y | VARCHAR (120) | This field contains the season name and year for the half. For example: Summer 2013. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_HALF_TL|PK||||LANG|ASC|
||||||HALF_NO|ASC|

---

## Table: MONTH_DATA

**Description:** This table provides a history, by month, of all dollar figures that are maintained by Oracle Retail. The table contains one row for each department/location/half/month number combination within the company. The data in this table is updated during the end of month processing run, by selecting rows from the table daily_data, and updating the appropriate fields, depending upon data type. New rows are added to this table whenever a new department or location is added, or in the end of half processing run when rows for the new half are added for all department/location combinations. Rows are automatically purged by the end of half processing run when they are over eighteen months old. When this happens, all 6 months for the half are purged, resulting in 12 months of data.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P | F | Y | NUMERIC (4) | Contains the department for which monthly data statistics are stored. |
| 2 | CLASS | P | F | Y | NUMERIC (4) | Contains the class for which monthly data statistics are stored. |
| 3 | SUBCLASS | P | F | Y | NUMERIC (4) | Contains the subclass for which monthly data statistics are stored. |
| 4 | LOC_TYPE | P |  | Y | VARCHAR (1 BYTE) | This field contains Location Type. Valid Values are : S = Store, W = Warehouse, E = External Finisher |
| 5 | LOCATION | P |  | Y | NUMERIC (10) | This field contains the Store if Loc_type = S the Warehouse or Internal Finisher if Loc_type = W the External Finisher if Loc_type = E. |
| 6 | HALF_NO | P | F | Y | NUMERIC (5) | Contains the half number for which the monthly data statistics are stored. |
| 7 | MONTH_NO | P |  | Y | NUMERIC (2) | Contains the month number for which the monthly data statistics are stored. |
| 8 | CURRENCY_IND | P |  | Y | VARCHAR (1 BYTE) | If the record is in the locations local currency the indicator will be L. Otherwise the indicator will be P for Primary currency. |
| 9 | EOM_DATE | P |  | Y | Date (7) | Contains the end of month date for the month for which these monthly data statistics are stored. |
| 10 | SET_OF_BOOKS_ID | P |  | Y | NUMERIC (15) | Set Of Books Id |
| 11 | OPN_STK_RETAIL |  |  |  | NUMERIC (20,4) | Beginning of month stock on hand dollar values at retail for a subclass/location. It is equal to cls_stk_retail of the previous month. |
| 12 | OPN_STK_COST |  |  |  | NUMERIC (20,4) | Beginning of month stock on hand dollar values at cost for a subclass/location. It is equal to cls_stk_cost of the previous month. |
| 13 | STOCK_ADJ_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of stock on hand adjustment for a subclass/location during a month. |
| 14 | STOCK_ADJ_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of stock on hand adjustment for a subclass/location during a month. |
| 15 | STOCK_ADJ_COGS_RETAIL |  |  |  | NUMERIC (20,4) | Amount at retail of Stock Adjustment that effects COGS for a subclass/location for the month. |
| 16 | STOCK_ADJ_COGS_COST |  |  |  | NUMERIC (20,4) | Amount at cost of Stock Adjustment that effects COGS for a subclass/location for the month. |
| 17 | PURCH_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of purchases received for a subclass/location during a month. |
| 18 | PURCH_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of purchases received for a subclass/location during a month. |
| 19 | RTV_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of merchandise returned to vendor for a subclass/location during a month. |
| 20 | RTV_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of merchandise returned to vendor for a subclass/location during a month. |
| 21 | FREIGHT_COST |  |  |  | NUMERIC (20,4) | Cost of freight for purchases received for a subclass/location during a month. |
| 22 | UP_CHRG_AMT_PROFIT |  |  |  | NUMERIC (20,4) | Contains the value of Profit Up Charge costs incurred by the location/sublcass for the month |
| 23 | UP_CHRG_AMT_EXP |  |  |  | NUMERIC (20,4) | Contains the value of Expense Up Charge costs incurred by the location/sublcass for the month |
| 24 | TSF_IN_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of merchandise transferred into a location/subclass during a month. |
| 25 | TSF_IN_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of merchandise transferred into a location/subclass during a month. |
| 26 | TSF_IN_BOOK_RETAIL |  |  |  | NUMERIC (20,4) | Contains the value, at retail, of merchandise transferred through a book transfer into a location/subclass for the month. |
| 27 | TSF_IN_BOOK_COST |  |  |  | NUMERIC (20,4) | Contains the value, at cost, of merchandise transferred through a book transfer into a location/subclass for the month. |
| 28 | TSF_OUT_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of merchandise transferred out of a location / subclass during a month. |
| 29 | TSF_OUT_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of merchandise transferred out of a location / subclass during a month. |
| 30 | TSF_OUT_BOOK_RETAIL |  |  |  | NUMERIC (20,4) | Contains the value, at retail, of merchandise transferred through a book transfer out of a location/subclass for the month. |
| 31 | TSF_OUT_BOOK_COST |  |  |  | NUMERIC (20,4) | Contains the value, at cost, of merchandise transferred through a book transfer out of a location/subclass for the month. |
| 32 | NET_SALES_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of net merchandise sold (gross sales - customer returns) for a subclass/location during a month. |
| 33 | NET_SALES_RETAIL_EX_VAT |  |  |  | NUMERIC (20,4) | Dollar values at retail (excluding VAT) of net merchandise sold (gross sales - customer returns) for a subclass/location during a month. |
| 34 | NET_SALES_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of net merchandise sold (gross sales - customer returns) for a subclass/location during a month. |
| 35 | RETURNS_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of merchandise returned by customers for a subclass/location during a month. |
| 36 | RETURNS_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of merchandise returned by customers for a subclass/location during a month. |
| 37 | MARKUP_RETAIL |  |  |  | NUMERIC (20,4) | Markups are upward revisions to the original retail price established at the beginning of half for an item. The increase of this retail value is |
| 38 | MARKUP_CAN_RETAIL |  |  |  | NUMERIC (20,4) | A markup cancellation is used to correct an unintentional error in a previous markup. Currently this field is not used in Oracle Retail, since generally speaking price reductions are to be treated as markdowns and not as markup cancellations, and to do otherwise is open the door to abuse and permit the concealment of markdowns. An enhancement to the system is required to capture this dollar values for the rare cases where markup up cancellation can be clearly identified. |
| 39 | CLEAR_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Clearance markdowns are reductions to the original retail price established at the beginning of half for an item during a clearance event. The reduction in the retail value of the item is the clearance markdown at retail. This field holds the sum of clearance markdown at retail for all merchandise in a subclass/location during a month. |
| 40 | PERM_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Permanent markdowns are permanent reductions to the original retail price established at the beginning of half for an item. The reduction in the retail value of the item is the permanent markdown at retail. This field holds the sum of permanent markdown at retail for all merchandise in a subclass/location during a month. |
| 41 | PROM_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Promotional markdowns are temporary reductions to the original retail price established at the beginning of half for an item during a promotional event, or for other discounts and allowances granted at the point-of-sale(POS), hence it is sometimes known as POS markdowns. The reduction in the retail value of the item is the promotional markdown at retail and is captured only when the item is sold. This field holds the sum of promotional markdown at retail for all merchandise in a subclass/location during a month. |
| 42 | MARKDOWN_CAN_RETAIL |  |  |  | NUMERIC (20,4) | Markdown cancellations are upward revision to the retail price of an item, to be offset against markdowns previously taken. The increase in the retail value of the item is the markdown cancellation at retail. This field holds the sum of markdown cancellation at retail for all merchandise in a subclass/location during a month. |
| 43 | SHRINKAGE_COST |  |  |  | NUMERIC (20,4) | This is the difference between actual inventory on hand at the end of a month and the corresponding amounts reflected in the stock ledger, measured in the cost value of all merchandise in a subclass/location. In most cases where a physical inventory is not taken during a month, this |
| 44 | SHRINKAGE_RETAIL |  |  |  | NUMERIC (20,4) | This is the difference between actual inventory on hand at the end of a month and the corresponding amounts reflected in the stock ledger, measured in the retail value of all merchandise in a subclass/location. In most cases where a physical inventory is not taken during a month, this is an estimated value of probable shrinkage based on past experiences. |
| 45 | EMPL_DISC_RETAIL |  |  |  | NUMERIC (20,4) | Employee discounts are the discounts given to employees at the time of sale. This field holds the sum of employee discount amount for all merchandise in a subclass/location during a month. |
| 46 | WORKROOM_AMT |  |  |  | NUMERIC (20,4) | Workroom cost and other cost of sale such as alterations, are cost of providing services to customers, and will reduce the gross margin. This field holds the total workroom cost and other cost of sale incurred for a subclass/location during a month. |
| 47 | CASH_DISC_AMT |  |  |  | NUMERIC (20,4) | Cash discounts are discounts credited by vendor, and will increase the gross margin. This field holds the total cash discount amount earned for a subclass/location during a month. |
| 48 | CLS_STK_RETAIL |  |  |  | NUMERIC (20,4) | End of month stock on hand dollar values at retail for a subclass/location. This is a calculated field. cls_stk_retail = opn_stk_retail + purch_retail + markup_retail - RTV _retail + tsf_in_retail - tsf_out_retail - net_sales_retail - perm_markdown_retail - prom_markdown_retail - clear_markdown_retail + markdown_can_retail - shrinkage_retail - empl_disc_retail |
| 49 | CLS_STK_COST |  |  |  | NUMERIC (20,4) | End of month stock on hand dollar values at cost for a subclass/location. This is a calculated field. For retail method of accounting : cls_stk_cost = cls_stk_retail * ( 1 - cum_markon_pct/100) For cost method of accounting : cls_stk_cost = opn_stk_cost + purch_cost - RTV_cost + tsf_in_cost - tsf_out_cost - net_sales_cost - shrinkage_cost |
| 50 | CUM_MARKON_PCT |  |  |  | NUMERIC (12,4) | Cumulative markon percent is used in the retail method of accounting only. This is a calculated field. cum_markon_pct = ((htd_gafs_retail - htd_gafs_cost ) / htd_gafs_retail) * 100 |
| 51 | GROSS_MARGIN_AMT |  |  |  | NUMERIC (20,4) | Gross margin dollar amounts. This is a calculated field. For retail method of accounting : gross_margin_amt = net_sales_retail - cost of goods sold - workroom_amt + cash_disc_amt where cost of goods sold = opn_stk_cost + purch_cost + freight_cost - RTV_cost + tsf_in_cost - tsf_out_cost - cls_stk_cost For cost method of accounting : gross_margin_amt = net_sales_retail - net_sales_cost |
| 52 | SALES_UNITS |  |  |  | NUMERIC (12,4) | Number of net units of merchandise sold for a subclass/location during a month. |
| 53 | COST_VARIANCE_AMT |  |  |  | NUMERIC (20,4) | This field is used in the standard cost method of accounting to record the standard cost change as well as the cost difference between standard cost and transaction cost for transactions such as receiving, RTV and transfers. |
| 54 | HTD_GAFS_RETAIL |  |  |  | NUMERIC (20,4) | Half-to-date Goods Available For Sale at retail, used in the retail method of accounting only. htd_gafs_retail = beginning of half stock at retail + half-to-date (purch_retail + markup_retail - RTV_retail + tsf_in_retail - tsf_out_retail)) |
| 55 | HTD_GAFS_COST |  |  |  | NUMERIC (20,4) | Half-to-date Goods Available For Sale at cost, used in the retail method of accounting only. htd_gafs_cost = beginning of half stock at cost + half-to-date (purch_cost + freight_cost - RTV_cost + tsf_in_cost - tsf_out_cost)) |
| 56 | INTER_STOCKTAKE_SALES_AMT |  |  |  | NUMERIC (20,4) | Cumulative net sales dollar amount since the last time a physical inventory was taken for a subclass/location. It is valued at cost for the cost department and at retail for the retail department. It is reset to 0 on the physical inventory date for this subclass/location, after the actual shrinkage has been calculated. |
| 57 | INTER_STOCKTAKE_SHRINK_AMT |  |  |  | NUMERIC (20,4) | Cumulative estimated (or budgeted) shrinkage dollar amount since the last time a physical inventory was taken for a subclass/location. It is valued at cost for the cost department and at retail for the retail department. It is reset to 0 on the physical inventory date for this subclass/location, after the actual shrinkage has been calculated. |
| 58 | STOCKTAKE_MTD_SALES_AMT |  |  |  | NUMERIC (20,4) | Month-to-date net sales dollar amount for a subclass/location. It is valued at cost for the cost department and at retail for the retail department. It is calculated only when physical inventory is taken, as of the physical inventory date. |
| 59 | STOCKTAKE_MTD_SHRINK_AMT |  |  |  | NUMERIC (20,4) | Month-to-date estimated (or budgeted) shrinkage dollar amount for a subclass/location. It is valued at cost for the cost department and at retail for the retail department. It is calculated only when physical inventory is taken, as of the physical inventory date. |
| 60 | STOCKTAKE_BOOKSTK_RETAIL |  |  |  | NUMERIC (20,4) | Book stock dollar amount at retail for a subclass/location. It is calculated only when physical inventory is taken, as of the physical inventory date. |
| 61 | STOCKTAKE_BOOKSTK_COST |  |  |  | NUMERIC (20,4) | Book stock dollar amount at cost for a subclass/location. It is calculated only when physical inventory is taken, as of the physical inventory date. |
| 62 | STOCKTAKE_ACTSTK_RETAIL |  |  |  | NUMERIC (20,4) | Actual stock dollar amount at retail for a subclass/location when the physical inventory is taken, as of the physical inventory date. |
| 63 | STOCKTAKE_ACTSTK_COST |  |  |  | NUMERIC (20,4) | Actual stock dollar amount at cost for a subclass/location when the physical inventory is taken, as of the physical inventory date. |
| 64 | RECLASS_IN_COST |  |  |  | NUMERIC (20,4) | This field contains the dollar values at cost of merchandise transferred into the location/subclass during the specified month due to reclassification. |
| 65 | RECLASS_IN_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the dollar values at retail of merchandise transferred into the location/subclass during the specified month due to reclassification. |
| 66 | RECLASS_OUT_COST |  |  |  | NUMERIC (20,4) | This field contains the dollar values at cost of merchandise transferred out of the location/subclass during the specified month due to reclassification. |
| 67 | RECLASS_OUT_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the dollar values at retail of merchandise transferred out of the location/subclass during the specified month due to reclassification. |
| 68 | FREIGHT_CLAIM_RETAIL |  |  |  | NUMERIC (20,4) | Amount at retail of freight claim for a subclass/location for the month. |
| 69 | FREIGHT_CLAIM_COST |  |  |  | NUMERIC (20,4) | Amount at cost of freight claim for a subclass/location for the month. |
| 70 | INTERCOMPANY_IN_RETAIL |  |  |  | NUMERIC (20,4) | Contains the dollar values at retail of merchandise transferred into a location/subclass during a month for intercompany transfers. |
| 71 | INTERCOMPANY_IN_COST |  |  |  | NUMERIC (20,4) | Contains the dollar values at cost of merchandise transferred into a location/subclass during a month for intercompany transfers. |
| 72 | INTERCOMPANY_OUT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the dollar values at retail of merchandise transferred out of a location/subclass during a month for intercompany transfers. |
| 73 | INTERCOMPANY_OUT_COST |  |  |  | NUMERIC (20,4) | Contains the dollar values at cost of merchandise transferred out of a location/subclass during a month for intercompany transfers. |
| 74 | INTERCOMPANY_MARKUP |  |  |  | NUMERIC (20,4) | Contains the sum of markup at retail of merchandise transferred out of a location/subclass during a month for intercompany transfers. |
| 75 | INTERCOMPANY_MARKDOWN |  |  |  | NUMERIC (20,4) | Contains the sum of markdown at retail of merchandise transferred out of a location/subclass during a month for intercompany transfers. |
| 76 | WO_ACTIVITY_UPD_INV |  |  |  | NUMERIC (20,4) | Contains the sum of dollar value at cost of merchandise required work order activity - update inventory in a location/subclass during a month for intercompany transfers. |
| 77 | WO_ACTIVITY_POST_FIN |  |  |  | NUMERIC (20,4) | Contains the sum of dollar value at cost of merchandise required work order activity - post to financial in a location/subclass during a month for intercompany transfers. |
| 78 | INTERCOMPANY_MARGIN |  |  |  | NUMERIC (20,4) | Contains calculated intercompany margin value. |
| 79 | DEAL_INCOME_SALES |  |  |  | NUMERIC (20,4) | Dollar values of deal incomes sales received for a subclass/location for the day. |
| 80 | DEAL_INCOME_PURCH |  |  |  | NUMERIC (20,4) | Dollar values of deal incomes purchases received for a subclass/location for the day. |
| 81 | RESTOCKING_FEE |  |  |  | NUMERIC (20,4) | Dollar values at cost of restocking fees received for a subclass/location for the month. |
| 82 | RETAIL_COST_VARIANCE |  |  |  | NUMERIC (20,4) | Cost variance using retail based accounting. |
| 83 | MARGIN_COST_VARIANCE |  |  |  | NUMERIC (20,4) | New Cost variance using cost based accounting. |
| 84 | FRANCHISE_SALES_RETAIL |  |  |  | NUMERIC (20,4) | Amount at retail of merchandise sold to franchisees at the subclass / franchise location for the month. |
| 85 | FRANCHISE_SALES_COST |  |  |  | NUMERIC (20,4) | Amount at cost of merchandise sold to franchisees at the subclass / franchise location for the month |
| 86 | FRANCHISE_RETURNS_RETAIL |  |  |  | NUMERIC (20,4) | Amount at retail of merchandise returned by franchisees at the subclass / franchise location for the month |
| 87 | FRANCHISE_RETURNS_COST |  |  |  | NUMERIC (20,4) | Amount at cost of merchandise returned by franchisees at the subclass / franchise location for the month |
| 88 | FRANCHISE_MARKUP_RETAIL |  |  |  | NUMERIC (20,4) | Contains the sum of markups at retail of merchandise at franchise location / subclass for the month. |
| 89 | FRANCHISE_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Contains the sum of markdowns at retail of merchandise at franchise location / subclass for the month. |
| 90 | FRANCHISE_RESTOCKING_FEE |  |  |  | NUMERIC (20,4) | Amount at cost of restocking fees received for a franchise location / subclass for the month |
| 91 | VAT_IN |  |  |  | NUMERIC (20,4) | Input VAT |
| 92 | VAT_OUT |  |  |  | NUMERIC (20,4) | Output VAT |
| 93 | WEIGHT_VARIANCE_RETAIL |  |  |  | NUMERIC (20,4) | This will contain the weight variance retail for catchweight items. |
| 94 | RECOVERABLE_TAX |  |  |  | NUMERIC (20,4) | This column will hold the consolidated value of the tax amount which can be recovered. |
| 95 | NET_SALES_NON_INV_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of non-inventory item sold for a subclass/location for the day. |
| 96 | NET_SALES_NON_INV_RTL_EX_VAT |  |  |  | NUMERIC (20,4) | Dollar values at retail (excluding VAT) of non-inventory item sold for a subclass/location for the day. |
| 97 | NET_SALES_NON_INV_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of non-inventory item sold for a subclass/location for the day. |
| 98 | REC_COST_ADJ_VARIANCE |  |  |  | NUMERIC (20,4) | Dollar value for the receiver cost adjustment variance. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_MONTH_DATA|PK||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
||||||LOC_TYPE|ASC|
||||||HALF_NO|ASC|
||||||MONTH_NO|ASC|
||||||CURRENCY_IND|ASC|
||||||LOCATION|ASC|
||||||EOM_DATE|ASC|
||||||SET_OF_BOOKS_ID|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|MONTH_DATA_I1|||||HALF_NO|ASC|
||||||MONTH_NO|ASC|
||||||LOCATION|ASC|

### Constraints

|Type|Column /<br>Constraint Name|Details|Col4|Col5|Col6|
|---|---|---|---|---|---|
|Column Level|MONTH_NO|Ranges|Ranges|Ranges||
|Column Level|MONTH_NO|Begin Value|End Value<br>|Description<br>|Description<br>|
|Column Level|MONTH_NO|1|6|||
||CURRENCY_IND|Value List<br>Value<br>Description<br>'L'<br> <br>'P'<br>|Value List<br>Value<br>Description<br>'L'<br> <br>'P'<br>|Value List<br>Value<br>Description<br>'L'<br> <br>'P'<br>|Value List<br>Value<br>Description<br>'L'<br> <br>'P'<br>|
||CURRENCY_IND|Value List|Value List|Value List|Value List|
||CURRENCY_IND|Value|Description|Description|Description|
||CURRENCY_IND|'L'||||
||CURRENCY_IND|'P'||||

---

## Table: MONTH_DATA_BUDGET

**Description:** This table holds the month-by-month data for budget forecasting. This table contains one row for each department/location/half/month number within the company. This table is updated by budget forms. New rows are added to this table when a new location or department is added to the system or in the end of half processing which adds rows for the new half for all department/location combinations. Rows are automatically purged by the end of half processing run when they are over eighteen months old. When this happens all six months of the half are purged resulting in twelve months of retained data.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P | F | Y | NUMERIC (4) | Contains the department for which the monthly budget exists. |
| 2 | MONTH_NO | P |  | Y | NUMERIC (1) | Contains the class for which the monthly budget exists. |
| 3 | HALF_NO | P | F | Y | NUMERIC (5) | Contains the half number for which the monthly budget exists. |
| 4 | LOC_TYPE | P |  | Y | VARCHAR (1) | This field contains Location Type. Valid Values are : S = Store, W = Warehouse, E = External Finisher |
| 5 | LOCATION | P |  | Y | NUMERIC (10) | This field contains the Store if Loc_type = S the Warehouse or Internal Finisher if Loc_type = W the External Finisher if Loc_type = E. |
| 6 | SET_OF_BOOKS_ID | P |  | Y | NUMERIC (15) | Oracle set of books for Oracle Retail transactions. |
| 7 | OPN_STK_RETAIL |  |  |  | NUMERIC (20,4) | Monthly budget for the beginning of month stock on hand dollar values at retail for a department/location. This field is stored in the primary currency. |
| 8 | OPN_STK_COST |  |  |  | NUMERIC (20,4) | Beginning of month stock on hand dollar values at cost for a subclass/location. It is equal to cls_stk_cost of the previous month. |
| 9 | PURCH_RETAIL |  |  |  | NUMERIC (20,4) | Monthly budget for the dollar values at retail of purchases received for a department/location during a month. This field is stored in the primary currency. |
| 10 | PURCH_COST |  |  |  | NUMERIC (20,4) | Monthly budget for the dollar values at cost of purchases received for a department/location during a month. This field is stored in the primary currency. |
| 11 | RTV_RETAIL |  |  |  | NUMERIC (20,4) | Monthly budget for merchandise expected to be returned to vendor valued at retail. This field is stored in the primary currency. |
| 12 | RTV_COST |  |  |  | NUMERIC (20,4) | Monthly budget for merchandise expected to be returned to vendor valued at cost. This field is stored in the primary currency. |
| 13 | NET_SALES_RETAIL |  |  |  | NUMERIC (20,4) | Monthly budget for dollar values at retail of net merchandise sold for a department/location during a month. This field is stored in the primary currency. |
| 14 | NET_SALES_COST |  |  |  | NUMERIC (20,4) | Monthly budget for dollar values at cost of net merchandise sold for a department/location during a month. This field is stored in the primary currency. |
| 15 | CLEAR_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Expected clearance markdowns to taken valued at retail. This field is stored in the primary currency. |
| 16 | PERM_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Expected permanent markdowns to be taken valued at retail. This field is stored in the primary currency. |
| 17 | PROM_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Expected promotions to be marked down at the register valued at retail. This field is stored in the primary currency. |
| 18 | TOTAL_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the sum of all expected markdowns at retail to be taken for the month. This field is stored in the primary currency. |
| 19 | TOTAL_MARKDOWN_COST |  |  |  | NUMERIC (20,4) | This field contains the sum of all expected markdowns at cost to be taken for the month. This field is stored in the primary currency. |
| 20 | SHRINKAGE_RETAIL |  |  |  | NUMERIC (20,4) | Monthly budget for shrinkage at retail for the department/location. This field is stored in the primary currency. |
| 21 | SHRINKAGE_COST |  |  |  | NUMERIC (20,4) | Monthly budget for shrinkage at cost for the department/location. This field is stored in the primary currency. |
| 22 | EMPL_DISC_RETAIL |  |  |  | NUMERIC (20,4) | Expected employee discounts to be taken at the register. This field is stored in the primary currency. |
| 23 | CLS_STK_RETAIL |  |  |  | NUMERIC (20,4) | Monthly budget for the end of month stock on hand dollar values at retail for the department/location. This field is stored in the primary currency. |
| 24 | CLS_STK_COST |  |  |  | NUMERIC (20,4) | Monthly budget for the end of month stock on hand dollar values at cost for the department/location. This field is stored in the primary currency. |
| 25 | GROSS_MARGIN |  |  |  | NUMERIC (20,4) | Monthly budget for the gross margin dollar amount for the department/location. This field is stored in the primary currency. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_MONTH_DATA_BUDGET|PK||||DEPT|ASC|
||||||MONTH_NO|ASC|
||||||HALF_NO|ASC|
||||||LOC_TYPE|ASC|
||||||LOCATION|ASC|
||||||SET_OF_BOOKS_ID|ASC|
|MONTH_DATA_BUDGET_I1|||||HALF_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_MNTH_DATA_BDGT_MTH_NO|MONTH_NO IN (1,2,3,4,5,6)<br>|
|Column Level|MONTH_NO||

---

## Table: WEEK_DATA

**Description:** This table provides a history, by week, of all dollar figures that are maintained by stock ledger module. This table contains one row for each subclass/location/half/week number combination within the company. The data in this table is updated during the end of the week processing run by selecting rows from the table daily_data and updating the appropriate fields, depending upon the data type.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P | F | Y | NUMERIC (4) | This field contains the department number for the weekly data that is stored. |
| 2 | CLASS | P | F | Y | NUMERIC (4) | This field contains the class number for the weekly data that is stored. |
| 3 | SUBCLASS | P | F | Y | NUMERIC (4) | This field contains the subclass number for the weekly data that is stored. |
| 4 | LOC_TYPE | P |  | Y | VARCHAR (1 BYTE) | This field contains Location Type. Valid Values are : S = Store, W = Warehouse, E = External Finisher |
| 5 | LOCATION | P |  | Y | NUMERIC (10) | This field contains the Store if Loc_type = S the Warehouse or Internal Finisher if Loc_type = W the External Finisher if Loc_type = E. |
| 6 | HALF_NO | P | F | Y | NUMERIC (5) | This field contains the half number for the weekly data that is stored. |
| 7 | MONTH_NO | P |  | Y | NUMERIC (2) | This field contains the month number for the weekly data that is stored. |
| 8 | WEEK_NO | P |  | Y | NUMERIC (2) | This field contains the week number for the weekly data that is stored. |
| 9 | CURRENCY_IND | P |  | Y | VARCHAR (1 BYTE) | If the record is in the locations local currency the indicator will be L. Otherwise the indicator will be P for Primary currency. |
| 10 | EOW_DATE | P |  | Y | Date (7) | This field contains the end of week date for the weekly data that is stored. |
| 11 | SET_OF_BOOKS_ID | P |  | Y | NUMERIC (15) | Set Of Books Id |
| 12 | OPN_STK_RETAIL |  |  |  | NUMERIC (20,4) | Beginning of week stock on hand dollar values at retail for a subclass/location. |
| 13 | OPN_STK_COST |  |  |  | NUMERIC (20,4) | Beginning of week stock on hand dollar values at cost for a subclass/location. |
| 14 | STOCK_ADJ_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of stock on hand adjustment for a subclass/location during a week. |
| 15 | STOCK_ADJ_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of stock on hand adjustment for a subclass/location during a week. |
| 16 | STOCK_ADJ_COGS_RETAIL |  |  |  | NUMERIC (20,4) | Amount at retail of Stock Adjustment that effects COGS for a subclass/location for the week. |
| 17 | STOCK_ADJ_COGS_COST |  |  |  | NUMERIC (20,4) | Amount at cost of Stock Adjustment that effects COGS for a subclass/location for the week. |
| 18 | PURCH_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of purchases received for a subclass/location during a week. |
| 19 | PURCH_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of purchases received for a subclass/location during a week. |
| 20 | RTV_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of merchandise returned to vendor for a subclass/location during a week. |
| 21 | RTV_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of merchandise returned to vendor for a subclass/location during a week. |
| 22 | FREIGHT_COST |  |  |  | NUMERIC (20,4) | Cost of freight for purchases received for a subclass/location during a week. |
| 23 | UP_CHRG_AMT_PROFIT |  |  |  | NUMERIC (20,4) | Contains the value of Profit Up Charge costs incurred by the location/sublcass for the week. |
| 24 | UP_CHRG_AMT_EXP |  |  |  | NUMERIC (20,4) | Contains the value of Expense Up Charge costs incurred by the location/sublcass for the week. |
| 25 | TSF_IN_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of merchandise transferred into a location/subclass during a week. |
| 26 | TSF_IN_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of merchandise transferred into a location/subclass during a week. |
| 27 | TSF_IN_BOOK_RETAIL |  |  |  | NUMERIC (20,4) | Contains the value, at retail, of merchandise transferred through a book transfer into a location/subclass for the week. |
| 28 | TSF_IN_BOOK_COST |  |  |  | NUMERIC (20,4) | Contains the value, at cost, of merchandise transferred through a book transfer into a location/subclass for the week. |
| 29 | TSF_OUT_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of merchandise transferred out of a location/subclass during a week. |
| 30 | TSF_OUT_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of merchandise transferred out of a location/subclass during a week. |
| 31 | TSF_OUT_BOOK_RETAIL |  |  |  | NUMERIC (20,4) | Contains the value, at retail, of merchandise transferred through a book transfer out of a location/subclass for the week. |
| 32 | TSF_OUT_BOOK_COST |  |  |  | NUMERIC (20,4) | Contains the value, at cost, of merchandise transferred through a book transfer out of a location/subclass for the week. |
| 33 | NET_SALES_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of net merchandise sold (gross sales - customer returns) for a subclass/location during a week. |
| 34 | NET_SALES_RETAIL_EX_VAT |  |  |  | NUMERIC (20,4) | Dollar values at retail (excluding VAT) of net merchandise sold (gross sales - customer returns) for a subclass/location during a week. |
| 35 | NET_SALES_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of net merchandise sold (gross sales - customer returns) for a subclass/location during a week. |
| 36 | RETURNS_RETAIL |  |  |  | NUMERIC (20,4) | Dollar values at retail of merchandise returned by customers for a subclass/location during a week. |
| 37 | RETURNS_COST |  |  |  | NUMERIC (20,4) | Dollar values at cost of merchandise returned by customers for a subclass/location during a week. |
| 38 | MARKUP_RETAIL |  |  |  | NUMERIC (20,4) | Markups are upward revisions to the original retail price established at the beginning of half for an item. The increase of this retail value is markup at retail. This field holds the sum of markup at retail for all merchandise in a subclass/location during a week. |
| 39 | MARKUP_CAN_RETAIL |  |  |  | NUMERIC (20,4) | A markup cancellation is used to correct an unintentional error in a previous markup. Currently this field is not used in Oracle Retail, since generally speaking price reductions are to be treated as markdowns and not as markup cancellations, and to do otherwise is open the door to abuse and permit the concealment of markdowns. An enhancement to the system is required to capture this dollar values for the rare cases where markup up cancellation can be clearly identified. |
| 40 | CLEAR_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Clearance markdowns are reductions to the original retail price established at the beginning of half for an item during a clearance event. The reduction in the retail value of the item is the clearance markdown at retail. This field holds the sum of clearance markdown at retail for all merchandise in a subclass/location during a week. |
| 41 | PERM_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Permanent markdowns are permanent reductions to the original retail price established at the beginning of half for an item. The reduction in the retail value of the item is the permanent markdown at retail. This field holds the sum of permanent markdown at retail for all merchandise in a subclass/location during a week. |
| 42 | PROM_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Promotional markdowns are temporary reductions to the original retail price established at the beginning of half for an item during a promotional event, or for other discounts and allowances granted at the point-of-sale(POS), hence it is sometimes known as POS markdowns. The reduction in the retail value of the item is the promotional markdown at retail and is captured only when the item is sold. This field holds the sum of promotional markdown at retail for all merchandise in a subclass/location during a week. |
| 43 | MARKDOWN_CAN_RETAIL |  |  |  | NUMERIC (20,4) | Markdown cancellations are upward revision to the retail price of an item, to be offset against markdowns previously taken. The increase in the retail value of the item is the markdown cancellation at retail. This field holds the sum of markdown cancellation at retail for all merchandise in a subclass/location during a week. |
| 44 | SHRINKAGE_RETAIL |  |  |  | NUMERIC (20,4) | This is the difference between actual inventory on hand at the end of a week and the corresponding amounts reflected in the stock ledger, measured in the retail value of all merchandise in a subclass/location. In most cases where a physical inventory is not taken during a month, this is an estimated value of probable shrinkage based on past experiences. |
| 45 | SHRINKAGE_COST |  |  |  | NUMERIC (20,4) | This is the difference between actual inventory on hand at the end of a week and the corresponding amounts reflected in the stock ledger, measured in the cost value of all merchandise in a subclass/location. In most cases where a physical inventory is not taken during a month, this is an estimated value of probable shrinkage based on past experiences. |
| 46 | EMPL_DISC_RETAIL |  |  |  | NUMERIC (20,4) | Employee discounts are the discounts given to employees at the time of sale. This field holds the sum of employee discount amount for all merchandise in a subclass/location during a week. |
| 47 | WORKROOM_AMT |  |  |  | NUMERIC (20,4) | Workroom cost and other cost of sale such as alterations, are cost of providing services to customers, and will reduce the gross margin. This field holds the total workroom cost and other cost of sale incurred for a subclass/location during a week. |
| 48 | CASH_DISC_AMT |  |  |  | NUMERIC (20,4) | Cash discounts are discounts credited by vendor, and will increase the gross margin. This field holds the total cash discount amount earned for a subclass/location during a week. |
| 49 | CLS_STK_RETAIL |  |  |  | NUMERIC (20,4) | End of month stock on hand dollar values at retail for a subclass/location. For cost method of accounting: cls_stk_retail = cls_stk_retail + purch_retail - rtv_retail + markup_retail - markup_can_retail + tsf_in_retail + tsf_in_book_retail + intercompany_in_retail - tsf_out_retail - tsf_out_book_retail - intercompany_out_retail + reclass_in_retail - reclass_out_retail - net_sales_retail - perm_markdown_retail - promo_markdown_retail - weight_variance_retail - clear_markdown_retail + markdown_can_retail - empl_disc_retail + stock_adj_retail - stocktake_adj_retail - freight_claims_retail + stock_adj_cogs_retail + intercompany_markup - intercompany_markdown - franchise_net_sales_retail + franchise_markup_retail - franchise_markdown_retail. For retail method of accounting: inventory_additions_cost = purch_cost + restocking_fee - rtv_cost + freight_cost + tsf_in_cost + tsf_in_book_cost + intercompany_in_cost - tsf_out_cost - tsf_out_book_cost + reclass_in_cost - reclass_out_cost |
| 50 | CLS_STK_COST |  |  |  | NUMERIC (20,4) | End of month stock on hand dollar values at cost for a subclass/location. This is a calculated field. For cost method of accounting: cls_stk_cost = cls_stk_cost + purch_cost - rtv_cost - net_sales_cost + tsf_in_cost + tsf_in_book_cost + intercompany_in_cost - tsf_out_cost - tsf_out_book_cost - intercompany_out_cost + up_chrg_amt_profit + up_chrg_amt_exp - shrinkage_cost + reclass_in_cost - reclass_out_cost - cost_variance_amt - freight_claims_cost + stock_adj_cogs_cost + wo_activity_upd_inv - margin_cost_variance_amount - franchise_net_sales_cost + recoverable_tax. For retail method of accounting: cls_stk_cost = cls_stk_retail * (1 - cum_markon_pct/100) |
| 51 | CUM_MARKON_PCT |  |  |  | NUMERIC (12,4) | Cumulative markon percent is used in the retail method of accounting only. This is a calculated field. cum_markon_pct = ((htd_gafs_retail - htd_gafs_cost ) / htd_gafs_retail) * 100 |
| 52 | GROSS_MARGIN_AMT |  |  |  | NUMERIC (20,4) | Gross margin dollar amounts. This is a calculated field. For retail method of accounting : gross_margin_amt = net_sales_retail - cost of goods sold - workroom_amt + cash_disc_amt where cost of goods sold = opn_stk_cost + purch_cost + freight_cost - RTV_cost + tsf_in_cost - tsf_out_cost - cls_stk_cost For cost method of accounting : gross_margin_amt = net_sales_retail - net_sales_cost |
| 53 | SALES_UNITS |  |  |  | NUMERIC (12,4) | Number of net units of merchandise sold for a subclass/location during a week. |
| 54 | COST_VARIANCE_AMT |  |  |  | NUMERIC (20,4) | This field is used in the standard cost method of accounting to record the standard cost change as well as the cost difference between standard cost and transaction cost for transactions such as receiving, RTV and transfers. |
| 55 | HTD_GAFS_RETAIL |  |  |  | NUMERIC (20,4) | Half-to-date Goods Available For Sale at retail, used in the retail method of accounting only. htd_gafs_retail = htd_gafs_retail + inventory_additions_retail; inventory_additions_retail = purch_retail - rtv_retail + markup_retail + intercompany_markup - markup_can_retail + tsf_in_retail + tsf_in_book_retail + intercompany_in_retail - tsf_out_retail - tsf_out_book_retail + reclass_in_retail - reclass_out_retail + franchise_returns_retail + franchise_markup_retail |
| 56 | HTD_GAFS_COST |  |  |  | NUMERIC (20,4) | Half-to-date Goods Available For Sale at cost, used in the retail method of accounting only. htd_gafs_cost = htd_gafs_cost + inventory_additions_cost. inventory_additions_cost = purch_cost + restocking_fee - rtv_cost + freight_cost + tsf_in_cost + tsf_in_book_cost + intercompany_in_cost - tsf_out_cost - tsf_out_book_cost + reclass_in_cost - reclass_out_cost + up_chrg_amt_profit + up_chrg_amt_exp + wo_activity_upd_inv + franchise_returns_cost + franchise_restocking_fee |
| 57 | STOCKTAKE_ADJ_RETAIL |  |  |  | NUMERIC (20,4) | Adjusted stock dollar amount at retail for a subclass/location when the physical inventory is taken, as of the physical inventory date. |
| 58 | STOCKTAKE_ADJ_COST |  |  |  | NUMERIC (20,4) | Adjusted stock dollar amount at cost for a subclass/location when the physical inventory is taken, as of the physical inventory date. |
| 59 | RECLASS_IN_COST |  |  |  | NUMERIC (20,4) | This field contains the dollar values at cost of merchandise transferred into the location/subclass during the specified week due to reclassification. |
| 60 | RECLASS_IN_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the dollar values at retail of merchandise transferred into the location/subclass during the specified week due to reclassification. |
| 61 | RECLASS_OUT_COST |  |  |  | NUMERIC (20,4) | This field contains the dollar values at cost of merchandise transferred out of the location/subclass during the specified week due to reclassification. |
| 62 | RECLASS_OUT_RETAIL |  |  |  | NUMERIC (20,4) | This field contains the dollar values at retail of merchandise transferred out of the location/subclass during the specified week due to reclassification. |
| 63 | FREIGHT_CLAIM_RETAIL |  |  |  | NUMERIC (20,4) | Amount at retail of freight claim for a subclass/location for the week. |
| 64 | FREIGHT_CLAIM_COST |  |  |  | NUMERIC (20,4) | Amount at cost of freight claim for a subclass/location for the week. |
| 65 | INTERCOMPANY_IN_RETAIL |  |  |  | NUMERIC (20,4) |  |
| 66 | INTERCOMPANY_IN_COST |  |  |  | NUMERIC (20,4) | Contains the dollar values at cost of merchandise transferred into a location/subclass during a week for intercompany transfers. |
| 67 | INTERCOMPANY_OUT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the dollar values at retail of merchandise transferred out of a location/subclass during a week for intercompany transfers. |
| 68 | INTERCOMPANY_OUT_COST |  |  |  | NUMERIC (20,4) | Contains the dollar values at cost of merchandise transferred out of a location/subclass during a week for intercompany transfers. |
| 69 | INTERCOMPANY_MARKUP |  |  |  | NUMERIC (20,4) | Contains the sum of markup at retail of merchandise transferred out of a location/subclass during a week for intercompany transfers. |
| 70 | INTERCOMPANY_MARKDOWN |  |  |  | NUMERIC (20,4) | Contains the sum of markdown at retail of merchandise transferred out of a location/subclass during a week for intercompany transfers. |
| 71 | WO_ACTIVITY_UPD_INV |  |  |  | NUMERIC (20,4) | Contains the sum of dollar value at cost of merchandise required work order activity - update inventory in a location/subclass during a week for intercompany transfers. |
| 72 | WO_ACTIVITY_POST_FIN |  |  |  | NUMERIC (20,4) | Contains the sum of dollar value at cost of merchandise required work order activity - post to financial in a location/subclass during a week for intercompany transfers. |
| 73 | INTERCOMPANY_MARGIN |  |  |  | NUMERIC (20,4) | Contains calculated intercompany margin value. |
| 74 | DEAL_INCOME_SALES |  |  |  | NUMERIC (20,4) | Dollar values of deal incomes sales received for a subclass/location for the day. |
| 75 | DEAL_INCOME_PURCH |  |  |  | NUMERIC (20,4) | Dollar values of deal incomes purchases received for a subclass/location for the day. |
| 76 | RESTOCKING_FEE |  |  |  | NUMERIC (20,4) | Dollar values at cost of restocking fees received for a subclass/location for the week |
| 77 | RETAIL_COST_VARIANCE |  |  |  | NUMERIC (20,4) | Cost variance using retail based accounting. |
| 78 | MARGIN_COST_VARIANCE |  |  |  | NUMERIC (20,4) | New Cost variance using cost based accounting. |
| 79 | FRANCHISE_SALES_RETAIL |  |  |  | NUMERIC (20,4) | Amount at cost of merchandise sold to wholesalers at the subclass / wholesale location for the week |
| 80 | FRANCHISE_SALES_COST |  |  |  | NUMERIC (20,4) | Amount at cost of merchandise to franchisees sold at the subclass / franchise location for the week |
| 81 | FRANCHISE_RETURNS_RETAIL |  |  |  | NUMERIC (20,4) | Amount at retail of merchandise returned by franchisees at the subclass / franchise location for the week. |
| 82 | FRANCHISE_RETURNS_COST |  |  |  | NUMERIC (20,4) | Amount at cost of merchandise returned by franchisees at the subclass / franchise location for the week |
| 83 | FRANCHISE_MARKUP_RETAIL |  |  |  | NUMERIC (20,4) |  |
| 84 | FRANCHISE_MARKDOWN_RETAIL |  |  |  | NUMERIC (20,4) | Contains the sum of markdowns at retail of merchandise at franchise location / subclass for the week. |
| 85 | FRANCHISE_RESTOCKING_FEE |  |  |  | NUMERIC (20,4) | Amount at cost of restocking fees received for a franchise location / subclass for the week |
| 86 | VAT_IN |  |  |  | NUMERIC (20,4) | Input VAT |
| 87 | VAT_OUT |  |  |  | NUMERIC (20,4) | Output VAT |
| 88 | WEIGHT_VARIANCE_RETAIL |  |  |  | NUMERIC (20,4) | This will contain the weight variance retail for catchweight items. |
| 89 | RECOVERABLE_TAX |  |  |  | NUMERIC (20,4) | This column will hold the consolidated value of the tax amount which can be recovered. |
| 90 | NET_SALES_NON_INV_RETAIL |  |  |  | NUMERIC (20,4) |  |
| 91 | NET_SALES_NON_INV_RTL_EX_VAT |  |  |  | NUMERIC (20,4) |  |
| 92 | NET_SALES_NON_INV_COST |  |  |  | NUMERIC (20,4) |  |
| 93 | REC_COST_ADJ_VARIANCE |  |  |  | NUMERIC (20,4) |  |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WEEK_DATA|PK||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
||||||HALF_NO|ASC|
||||||LOC_TYPE|ASC|
||||||MONTH_NO|ASC|
||||||WEEK_NO|ASC|
||||||CURRENCY_IND|ASC|
||||||LOCATION|ASC|
||||||EOW_DATE|ASC|
||||||SET_OF_BOOKS_ID|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|WEEK_DATA_I1|||||HALF_NO|ASC|

### Constraints

|Type|Column /<br>Constraint Name|Details|Col4|Col5|Col6|
|---|---|---|---|---|---|
|Column Level|MONTH_NO|Ranges|Ranges|Ranges||
|Column Level|MONTH_NO|Begin Value|End Value|Description|Description|
|Column Level|MONTH_NO|1|6|||
||WEEK_NO|Ranges|Ranges|Ranges||
||WEEK_NO|Begin Value|End Value<br>|Description<br>|Description<br>|
||WEEK_NO|1|5|||
||CURRENCY_IND|Value List<br>Value<br>Description<br>'L'<br> <br>'P'<br>|Value List<br>Value<br>Description<br>'L'<br> <br>'P'<br>|Value List<br>Value<br>Description<br>'L'<br> <br>'P'<br>|Value List<br>Value<br>Description<br>'L'<br> <br>'P'<br>|
||CURRENCY_IND|Value List|Value List|Value List|Value List|
||CURRENCY_IND|Value|Description|Description|Description|
||CURRENCY_IND|'L'||||
||CURRENCY_IND|'P'||||
