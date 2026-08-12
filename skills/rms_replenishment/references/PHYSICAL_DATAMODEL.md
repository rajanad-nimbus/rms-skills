# RMS Replenishment & Delivery Schedules Datamodel - Physical Data Model Reference

## Table: MASTER_REPL_ATTR

**Description:** Table for Master Replenishment Attribute (MRA) records. This table holds MRA records for an item/location combination.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | Alphanumeric identifier for the item on replenishment. |
| 2 | LOCATION | P |  | Y | NUMERIC (10) | Location that is on replenishment. Will hold only vritual warehouse in the multi-channel environment. |
| 3 | LOC_TYPE |  |  | Y | VARCHAR (6) | Contains the type of the location on replenishment. Valid values include Store, Warehouse. |
| 4 | ITEM_PARENT |  |  |  | VARCHAR (25) | The parent/group of the item on replenishment. |
| 5 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | The grandparent/master group of the item on replenishment. |
| 6 | PRIMARY_REPL_SUPPLIER |  |  |  | NUMERIC (10) | Contains the numeric identifier of the supplier from which the specified location will source the replenishment demand for the specified item location |
| 7 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | Contains the country code of the supplier country that will be used to supply the replenishment demand for the specified item location. Used for items on Direct to Store/Warehouse or Cross-docked replenishment. |
| 8 | REVIEW_CYCLE |  |  | Y | VARCHAR (6) | Contains the country code of the supplier country that will be used to supply the replenishment demand for the specified item location. Used for items on Direct to Store/Warehouse or Cross-docked replenishment. |
| 9 | STOCK_CAT |  |  | Y | VARCHAR (6) | Contains the sourcing strategy for the item/location relationship. Valid values are Direct to store (supplier to store), Cross-docked (supplier to store flowing through the warehouse), Warehouse stocked (warehouse to store), L for WH/Cross Link (warehouse to store and supplier to warehouse if insufficient warehouse stock). |
| 10 | REPL_ORDER_CTRL |  |  | Y | VARCHAR (6) | Determines if the replenishment process will create an actual order/transfer line item for the item location if there is a need for the item location or if only a record is written to the Replenishment Results table. Valid values are Manual (a record is written to the Replenishment Results table - no order/transfer line item is created), Semi-Automatic (an order/transfer line item is created - the order line item will be added to an order in Worksheet status, the transfer line item will be added to a transfer in Approved status with a freight type of Hold), Automatic (an order/transfer line item is created - the order line item will be added to an order in Approved status, the transfer line item will be added to a transfer in Approved status), Buyer Worksheet (a record is written to the Replenishment Results table and can be added to a purchase order on the Buyer Worksheet form/a transfer line item is added to a transfer in Approved status with a freight type of Hold). |
| 11 | SOURCE_WH |  |  |  | NUMERIC (10) | Contains the numeric identifier of the warehouse through which the specified item will crossdock to the specified store for a stock category of Crossdocked; or the numeric identifier of the warehouse from which the specified item will be sourced for the specified store for a stock category of Warehouse Stocked. |
| 12 | PRES_STOCK |  |  |  | NUMERIC (12,4) | Contains the minimum amount of stock that needs to be on store shelves. The presentation stock is nor expected to satisfy consumer demand but is expected to remain in the fixture. |
| 13 | DEMO_STOCK |  |  |  | NUMERIC (12,4) | Contains the amount of stock that cannot be sold as new and is not counted as part of inventory in the replenishment calculations. The value in this field is the amount of stock used strictly for demonstration purposes. |
| 14 | REPL_METHOD |  |  | Y | VARCHAR (6) | Contains the character code for the algorithm that will be used to calculate the recommended order quantity for the item location. Valid values include Constant, Min/Max, Floating point, Time Supply, Dynamic, SO Store Orders. |
| 15 | MIN_STOCK |  |  |  | NUMERIC (12,4) | Contains the required minimum number of units available for sale. Used in the Min/Max replenishment method algorithm |
| 16 | MAX_STOCK |  |  |  | NUMERIC (12,4) | Contains the required maximum number of units available for sale. Used in the Constant, Min/Max and Floating Point replenishment method algorithms |
| 17 | INCR_PCT |  |  |  | NUMERIC (12,4) | Contains the percentage by which the min and max stock levels will be multiplied when calculating the recommended order quantity. Ex. Actual max stock=max stock*increment percent. |
| 18 | MIN_SUPPLY_DAYS |  |  |  | NUMERIC (3) | Contains the minimum number of days of supply of stock to maintain. Used in the Time Supply replenishment method algorithm. |
| 19 | MAX_SUPPLY_DAYS |  |  |  | NUMERIC (3) | Contains the maximum number of days of supply of stock to maintain. Used in the Time Supply replenishment method algorithm. |
| 20 | TIME_SUPPLY_HORIZON |  |  |  | NUMERIC (3) | Contains the number of days over which an average sales rate is calculated to be used in the Time Supply replenishment method algorithm. |
| 21 | INV_SELLING_DAYS |  |  |  | NUMERIC (3) | Contains the number of days over which an average sales rate is calculated to be used in the Time Supply replenishment method algorithm. |
| 22 | SERVICE_LEVEL |  |  |  | NUMERIC (5,2) | Contains the required measure of probability that demand is satisfied from on hand inventory. Used in the Dynamic replenishment method algorithm. |
| 23 | LOST_SALES_FACTOR |  |  |  | NUMERIC (5,2) | Contains the percentage of sales that could have occurred if inventory had been available through the order lead time. Used in the Dynamic replenishment method algorithm. |
| 24 | REJECT_STORE_ORD_IND |  |  |  | VARCHAR (1) | Contains an indicator that determines if uploaded store orders should be rejected. If the indicator is N, then store orders for all need dates are valid. If Y, store orders with needs date on or after the NEXT_DELIVERY_DATE are valid. |
| 25 | NON_SCALING_IND |  |  | Y | VARCHAR (1) | Indicator used to determine if the item/location should be exempt from scaling during the order scaling process during the replenishment process. Y - Yes. The item/locations order quantity will not be adjusted during the order scaling process. N - No. The item/locations order quantity will be adjusted during the order scaling process. |
| 26 | MAX_SCALE_VALUE |  |  |  | NUMERIC (12,4) | Contains the limit up to which order scaling can increase the order quantity for the item/location during the replenishment process. If the replenishment method is C (constant), M (min/max), F (floating point) this value will be a quantity (ex. 1,000 eaches). If the replenishment method is a dynamic or time supply method this value will be a number of days. A 0 (zero) in this field indicates no max scaling value. This field is intended to prevent runaway scaling processes as well as to protect items from being ordered to locations in such amounts that would result in perishable or obsolescence issues. |
| 27 | PICKUP_LEAD_TIME |  |  |  | NUMERIC (4) | Contains the expected number of days required to ship the item from the supplier to the initial receiving location, which may be a store or warehouse defined on this record or the cross-dock warehouse through which the item will flow to get to the store defined on this record. |
| 28 | WH_LEAD_TIME |  |  |  | NUMERIC (4) | Contains the expected number of days required to move the item from the warehouse to the store defined on this record. |
| 29 | TERMINAL_STOCK_QTY |  |  |  | NUMERIC (12,4) | Contains the desired stock on hand for the item location when the end of season is reached. Used in the Seasonal Dynamic and Seasonal Time Supply replenishment methods. |
| 30 | SEASON_ID |  |  |  | NUMERIC (3) | Contains the numeric identifier of the season for which this item location is being replenished. Used in the Seasonal Dynamic and Seasonal Time Supply replenishment methods. |
| 31 | PHASE_ID |  |  |  | NUMERIC (3) | Contains the numeric identifier of the phase within the season for which this item location is being replenished. Used in the Seasonal Dynamic and Seasonal Time Supply replenishment methods. |
| 32 | LAST_REVIEW_DATE |  |  |  | Date | Contains the date on which the item location was last reviewed. |
| 33 | NEXT_REVIEW_DATE |  |  |  | Date | Contains the date on which the item location will be reviewed next. |
| 34 | PRIMARY_PACK_NO |  |  |  | VARCHAR (25) | Contains the numeric identifier of the primary simple pack that will be used to replenish the item. If the simple_pack_in = Yes and this field is NULL, this indicates that multiple simple packs are being used to replenish the item. If the simple_pack_ind = Yes and this field is NOT NULL, this indicates that this simple pack will be used to replenish the item. This field is used for performance purposes during the batch replenishment process. |
| 35 | PRIMARY_PACK_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of the item in the simple pack if a primary replenishment pack is being used to replenish the item. This field is used for performance purposes during the batch replenishment process. |
| 36 | UNIT_TOLERANCE |  |  |  | NUMERIC (12,4) | The allowable unit change to order quantities generated from replenishment. |
| 37 | PCT_TOLERANCE |  |  |  | NUMERIC (12,4) | The allowable percent change to order quantities generated from replenishment |
| 38 | ITEM_SEASON_SEQ_NO |  |  |  | NUMERIC (4) | This field will related to the item_season_seq_no for the associated item_seasons record. |
| 39 | USE_TOLERANCE_IND |  |  | Y | VARCHAR (1) | Indicates whether or not unit and percent tolerances will be used. |
| 40 | LAST_DELIVERY_DATE |  |  |  | Date | Contains the last delivery date that replenishment was run for. If replenishment is run on Monday and an order is created that will arrive on Friday, this field will be updated with Fridays date. |
| 41 | NEXT_DELIVERY_DATE |  |  |  | Date | Contains the next delivery date calculated for the next review cycle. If, for the next review cycle, an order will be created that is calculated to arrive on Thursday, this field will be updated with Thursdays date. |
| 42 | MBR_ORDER_QTY |  |  |  | NUMERIC (12,4) | This field is only populated if the item on replenishment is using the Warehouse Stocked/Cross-Docked stock category. It will store the portion of the recommended order quantity that cannot be fulfilled by warehouse stock. This quantity will be the quantity that is ordered when an order is created. |
| 43 | ADJ_PICKUP_LEAD_TIME |  |  |  | NUMERIC (4) | Pickup_lead_time for MBR cross-link line items after reqext processes them. |
| 44 | ADJ_SUPP_LEAD_TIME |  |  |  | NUMERIC (4) | Supp_lead_time for MBR cross-link line items after reqext processes them. |
| 45 | TSF_PO_LINK_NO |  |  |  | NUMERIC (12) | A reference number to link the item on the transfer to any purchase orders that have been created to allow the from location (i.e. warehouse) on the transfer to fulfill the transfer quantity to the to location (i.e store) on the transfer. |
| 46 | LAST_ROQ |  |  |  | NUMERIC (12,4) | This column will contain the last recommended order quantity created by Vendor Replenishment Extraction (rplext.pc). It will be used by the investment buy opportunity calculation (ibcalc.pc) in calculating future available quantity for the item/location. |
| 47 | STATUS |  |  |  | VARCHAR (1) | Status of the item. Valid values are : W= Worksheet, S = Submitted, A = Approved. This field is used for performance purposes during the |
| 48 | DEPT |  |  |  | NUMERIC (4) | Contains the number of the department in which the item is located. This field is used for performance purposes during the batch replenishment process. |
| 49 | CLASS |  |  |  | NUMERIC (4) | Contains the number of the class in which the item is located. This field is used for performance purposes during the batch replenishment process. |
| 50 | SUBCLASS |  |  |  | NUMERIC (4) | Contains the number of the subclass in which the item is located. This field is used for performance purposes during the batch replenishment process. |
| 51 | STORE_ORD_MULT |  |  |  | VARCHAR (6) | Contains the pack size level at which the item (or primary replenishment pack) is shipped between warehouses and stores. Valid values are Case, Inner, Each. If the item is being replenished using a primary replenishment pack (i.e. primary_pack_no is not NULL), the store order multiple will represent the packs store order multiple. Otherwise, the field will contain the items store order multiple. This field is used for performance purposes during the batch replenishment process. |
| 52 | UNIT_COST |  |  |  | NUMERIC (20,4) | This field contains the unit cost for the item (or simple pack if a replenishment simple pack is being used) for the replenishment supplier/country. This field is stored in the suppliers currency. |
| 53 | SUPP_LEAD_TIME |  |  |  | NUMERIC (4) | This field contains the number of days that will elapse between the date an order is written and the delivery to the store or warehouse from the supplier. |
| 54 | INNER_PACK_SIZE |  |  |  | NUMERIC (12,4) | This field contains the break pack size for the item for the supplier. |
| 55 | SUPP_PACK_SIZE |  |  |  | NUMERIC (12,4) | This field contains the quantity that orders must be placed in multiples of for the supplier of the item. |
| 56 | TI |  |  |  | NUMERIC (12,4) | This field contains the number of shipping units (cases) that make up one tier of a pallet. Multiply TI x HI to get total number of units (cases) for a pallet. |
| 57 | HI |  |  |  | NUMERIC (12,4) | This field contains the number of tiers that make up a complete pallet (height). Multiply TI x HI to get total number of units (cases) for a pallet. |
| 58 | ROUND_LVL |  |  |  | VARCHAR (6) | This field determines how order quantities will be rounded to Case, Layer and Pallet. |
| 59 | ROUND_TO_INNER_PCT |  |  |  | NUMERIC (12,4) | This field contains the Inner Rounding Threshold value. During rounding, this value is used to determine whether to round partial Inner quantities up or down. |
| 60 | ROUND_TO_CASE_PCT |  |  |  | NUMERIC (12,4) | This field contains the Case Rounding Threshold value. During rounding, this value is used to determine whether to round partial Case quantities up or down. |
| 61 | ROUND_TO_LAYER_PCT |  |  |  | NUMERIC (12,4) | This field contains the Layer Rounding Threshold value. During rounding, this value is used to determine whether to round partial Layer quantities up or down This field contains the Pallet Rounding Threshold value. During rounding, this value is used to determine whether to round partial Pallet quantities up or down. |
| 62 | ROUND_TO_PALLET_PCT |  |  |  | NUMERIC (12,4) | This field contains the Pallet Rounding Threshold value. During rounding, this value is used to determine whether to round partial Pallet quantities up or down. |
| 63 | SERVICE_LEVEL_TYPE |  |  |  | VARCHAR (2) | Service Level Type that will drive the safety stock calculation algorithm, valid values are Simple Sales and Standard. |
| 64 | UPDATE_DAYS_IND |  |  | Y | VARCHAR (1) | Indicator to specify whether or not the replenishment days will be updated for the specified item/location. Valid values are Y and N. |
| 65 | MONDAY_IND |  |  | Y | VARCHAR (1) | Indicator to specify whether or not the item/location will be reviewed on Monday. Valid values are Y and N. |
| 66 | TUESDAY_IND |  |  | Y | VARCHAR (1) | Indicator to specify whether or not the item/location will be reviewed on Tuesday. Valid values are Y and N. |
| 67 | WEDNESDAY_IND |  |  | Y | VARCHAR (1) | Indicator to specify whether or not the item/location will be reviewed on Wednesday. Valid values are Y and N. |
| 68 | THURSDAY_IND |  |  | Y | VARCHAR (1) | Indicator to specify whether or not the item/location will be reviewed on Thursday. Valid values are Y and N. |
| 69 | FRIDAY_IND |  |  | Y | VARCHAR (1) | Indicator to specify whether or not the item/location will be reviewed on Friday. Valid values are Y and N. |
| 70 | SATURDAY_IND |  |  | Y | VARCHAR (1) | Indicator to specify whether or not the item/location will be reviewed on Saturday. Valid values are Y and N. |
| 71 | SUNDAY_IND |  |  | Y | VARCHAR (1) | Indicator to specify whether or not the item/location will be reviewed on Sunday. Valid values are Y and N. |
| 72 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 73 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 74 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 75 | MULT_RUNS_PER_DAY_IND |  |  | Y | VARCHAR (1) | This indicates if an item can be replenished multiple times per day at the location. Default value is N |
| 76 | TSF_ZERO_SOH_IND |  |  | Y | VARCHAR (1) | The column indicates if a transfer should be created even though the warehouse does not have enough stock on hand. Default value is N |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_MASTER_REPL_ATTR|PK||||ITEM|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||LOCATION|ASC|

---

## Table: REPL_APPRV_GTAX_QUEUE

**Description:** Contains approved replenishment purchase order numbers. The batch rplapprv.pc insert records into this table. The succeeding batch program, batch batch_rplapprvgtax.ksh, compute taxes for all the orders in this table and inserts/updates the taxes into the ORD_TAX_BREAKUP table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDER_NO | P |  | Y | NUMERIC (12) | Hold the replenishment purchase order number for global tax processing. |

---

## Table: REPL_ATTR_UPDATE_EXCLUDE

**Description:** New Table that holds excluded update replenishment attributes.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | REPL_ATTR_ID | P | F | Y | NUMERIC (10) | Replenishment attribute id. |
| 2 | ITEM | P |  | Y | VARCHAR (25) | Item that has been excluded. |
| 3 | LOCATION | P |  | Y | NUMERIC (10) | Location that has been excluded. |
| 4 | LOC_TYPE |  |  | Y | VARCHAR (1) | Location type that was entered. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_REPL_ATTR_UPDATE_EXCLUDE|PK||||REPL_ATTR_ID|ASC|
||||||ITEM|ASC|
||||||LOCATION|ASC|

### Constraints

|Type|Column /<br>Constraint Name|Details|
|---|---|---|
|Table Level|CHK_RAUE_LOC_TYPE|LOC_TYPE in ('S','W')<br>|
|Column Level|LOC_TYPE||

---

## Table: REPL_ATTR_UPDATE_HEAD

**Description:** This Table encompasses new replenishment functionality.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | REPL_ATTR_ID | P |  | Y | NUMERIC (10) | Replenishment attribute ID |
| 2 | SCHEDULED_ACTIVE_DATE |  |  | Y | Date | Schedule date that attributes get updated on. |
| 3 | ACTION |  |  | Y | VARCHAR (1) | This field contains the type of action to be taken with the new replenishment attribute: Valid values: A - Activate U - Update D - Deactivate |
| 4 | MRA_UPDATE |  |  | Y | VARCHAR (1) | Indicator that governs whether attribute changes should flow back to the master record. |
| 5 | MRA_RESTORE |  |  | Y | VARCHAR (1) | Indicator that governs whether attribute changes should be derived from the master record. |
| 6 | REPL_METHOD_IND |  |  |  | VARCHAR (240) | This field indicates whether the replenishment method should be updated (Y), or if the replenishment method should be used to determine the item locations for which the replenishment method attributes are to be updated (N). |
| 7 | STOCK_CAT |  |  |  | VARCHAR (1) | This field contains the new stock category value. Valid values are : D - Direct to store C - Cross-docked W - Warehouse stocked P - Warehouse/Cross-Link |
| 8 | REPL_ORDER_CTRL |  |  |  | VARCHAR (1) | This field contains the new replenishment order control value. Valid values are : B - Buyer S - System |
| 9 | SOURCING_WH |  |  |  | NUMERIC (10) | This field contains the value for the new sourcing warehouse. |
| 10 | ACTIVATE_DATE |  |  |  | Date | This field contains the new date on which the items replenishment will be activated. |
| 11 | DEACTIVATE_DATE |  |  |  | Date | This field contains the date that the item will be deactivated from replenishment. |
| 12 | PRES_STOCK |  |  |  | NUMERIC (12,4) | This field contains the new presentation stock quantity. |
| 13 | DEMO_STOCK |  |  |  | NUMERIC (12,4) | This field contains the new demo stock quantity. |
| 14 | REPL_METHOD |  |  |  | VARCHAR (6) | This field contains the new replenishment method. Valid values are : C - Constant M - Min/Max F - Floating Point T - Time Supply D - Dynamic TI - Time Supply - Issues DI - Dynamic - Issues SO - Store Orders |
| 15 | MIN_STOCK |  |  |  | NUMERIC (12,4) | This field contains the new minimum stock quantity. |
| 16 | MAX_STOCK |  |  |  | NUMERIC (12,4) | This field contains the new maximum stock quantity. |
| 17 | INCR_PCT |  |  |  | NUMERIC (12,4) | This field contains the new increment percent value. |
| 18 | MIN_SUPPLY_DAYS |  |  |  | NUMERIC (3) | This field contains the new minimum time supply days. |
| 19 | MAX_SUPPLY_DAYS |  |  |  | NUMERIC (3) | This field contains the new maximum time supply days. |
| 20 | TIME_SUPPLY_HORIZON |  |  |  | NUMERIC (3) | This field contains the new time supply horizon value. |
| 21 | INV_SELLING_DAYS |  |  |  | NUMERIC (3) | This field contains the new inventory selling days. |
| 22 | SERVICE_LEVEL |  |  |  | NUMERIC (5,2) | This field contains the new service level value. |
| 23 | LOST_SALES_FACTOR |  |  |  | NUMERIC (5,2) | This field contains the new lost sales factor. |
| 24 | REJECT_STORE_ORD_IND |  |  |  | VARCHAR (1) | Contains an indicator that determines if uploaded store orders will be rejected. If the indicator is N, then store orders for all need dates are valid. If Y, store orders with needs date on or after the NEXT_DELIVERY_DATE are valid. |
| 25 | NON_SCALING_IND |  |  |  | VARCHAR (1) | Indicator used to determine if the item/location will be exempt from scaling during the order scaling process during the replenishment process. If Y (yes)m the item/locations order quantity will not be adjusted during the order scaling process. If N (no), the item/locations order quantity will be adjusted during the order scaling process. |
| 26 | MAX_SCALE_VALUE |  |  |  | NUMERIC (12,4) | Contains the limit up to which order scaling can increase the order quantity for the item/location during the replenishment process. If the replenishment method is C (constant), M (min/max), or F (floating point), the MAX_SCALE_VALUE will be a quantity (ex. 1,000 eaches). If the replenishment method is a dynamic or time supply method, the MAX_SCALE_VALUE will be a number of days. A 0 (zero) in this field indicates no max scaling value. This field is intended to prevent run-away scaling processes as well as to protect items from being ordered to locations in such amounts that would result in perishable or obsolescence issues. |
| 27 | PICKUP_LEAD_TIME |  |  |  | NUMERIC (4) | This field contains the new pickup to location lead time value. |
| 28 | WH_LEAD_TIME |  |  |  | NUMERIC (4) | This field contains the new warehouse to location lead time value. |
| 29 | TERMINAL_STOCK_QTY |  |  |  | NUMERIC (12,4) | This field contains the desired stock on hand of the item when the end of the season is reached while using seasonal replenishment. |
| 30 | SEASON_ID |  |  |  | NUMERIC (3) | This field contains the numeric identifier of the relevant season when using seasonal replenishment. |
| 31 | PHASE_ID |  |  |  | NUMERIC (3) | This column contains the numeric identifier of the phase within the season when using seasonal replenishment. |
| 32 | SUPPLIER |  |  |  | NUMERIC (10) | This column contains the numeric identifier of the supplier from which the specified location will source the replenishment demand for the specified item (locations are specified on the Replenishment Attribute Update Location table). |
| 33 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | This field contains the country code of the supplier country that will be used to supply the replenishment demand for the specified item/location (locations are specified on the Replenishment Attribute Update Location table). |
| 34 | REVIEW_CYCLE |  |  |  | VARCHAR (6) | Contains the number representing when the specified item/location will be reviewed for replenishment. Valid values are 0 - 14. A 0 (zero) represents a weekly review cycle, a 1 represents a daily review cycle, a 2 represents a review cycle of every two weeks, etc. |
| 35 | UPDATE_DAYS_IND |  |  | Y | VARCHAR (1) | Indicator to determine if the replenishment days have to be updated for the specified item/location. Valid values are Y and N. |
| 36 | MONDAY_IND |  |  | Y | VARCHAR (1) | Indicator to determine, if the replenishment days are being updated for the specified item/location, whether or not the item/location will be reviewed on Monday. Valid values are Y (yes), where the specified item/location will be reviewed on Mondays, and N (no), where the specified item/location will not be reviewed on Mondays. |
| 37 | TUESDAY_IND |  |  | Y | VARCHAR (1) | Indicator to determine, if the replenishment days are being updated for the specified item/location, whether or not the item/location will be reviewed on Tuesday. Valid values are Y (yes), where the specified item/location will be reviewed on Tuesdays, and N (no), where the specified item/location will not be reviewed on Tuesdays. |
| 38 | WEDNESDAY_IND |  |  | Y | VARCHAR (1) | Indicator to determine, if the replenishment days are being updated for the specified item/location, whether or not the item/location will be reviewed on Wednesday. Valid values are Y (yes), where the specified item/location will be reviewed on Wednesdays, and N (no), where the specified item/location will not be reviewed on Wednesdays. |
| 39 | THURSDAY_IND |  |  | Y | VARCHAR (1) | replenishment days are being updated for the specified item/location, whether or not the item/location will be reviewed on Thursday. Valid values are Y (yes), where the specified item/location will be reviewed on Thursdays, and N (no), where the specified item/location will not be reviewed on Thursdays. |
| 40 | FRIDAY_IND |  |  | Y | VARCHAR (1) | Indicator to determine, if the replenishment days are being updated for the specified item/location, whether or not the item/location will be reviewed on Friday. Valid values are Y (yes), where the specified item/location will be reviewed on Fridays, and N (no), where the specified item/location will not be reviewed on Fridays. |
| 41 | SATURDAY_IND |  |  | Y | VARCHAR (1) | Indicator to determine, if the replenishment days are being updated for the specified item/location, whether or not the item/location will be reviewed on Saturday. Valid values are Y (yes), where the specified item/location will be reviewed on Saturdays, and N (no), where the specified item/location will not be reviewed on Saturdays. |
| 42 | SUNDAY_IND |  |  | Y | VARCHAR (1) | Indicator to determine, if the replenishment days are being updated for the specified item/location, whether or not the item/location will be reviewed on Sunday. Valid values are Y (yes), where the specified item/location will be reviewed on Sundays, and N (no), where the specified item/location will not be reviewed on Sundays. |
| 43 | UNIT_TOLERANCE |  |  |  | NUMERIC (12,4) | The allowable unit change to order quantities generated from replenishment. |
| 44 | PCT_TOLERANCE |  |  |  | NUMERIC (12,4) | The allowable percent change to order quantities generated from replenishment. |
| 45 | DEFAULT_PACK_IND |  |  | Y | VARCHAR (1) | If the default pack indicator is Y (yes), then the primary cost pack from ITEM_LOC will be defaulted as the REPL_ITEM_LOC.PRIMARY_PACK_NO. |
| 46 | REMOVE_PACK_IND |  |  |  | VARCHAR (1) | When the remove pack indicator is Y (yes), the primary replenishment pack will be NULL for the multiple item/multiple location combination being updated on replenishment. If the remove pack indicator is N (no), no updating will occur. |
| 47 | USE_TOLERANCE_IND |  |  |  | VARCHAR (1) | Indicates whether or not the unit and percent tolerances will be used. |
| 48 | SERVICE_LEVEL_TYPE |  |  |  | VARCHAR (2) | Service Level Type |
| 49 | CREATE_DATE |  |  |  | Date | Standard Oracle Retail Create date Time column. |
| 50 | CREATE_ID |  |  |  | VARCHAR (30) | Standard Oracle Retail Create Id. |
| 51 | SCH_RPL_DESC |  |  |  | VARCHAR (250) | Description Column that the user can enter to identify a scheduled replenishment update record. |
| 52 | PRIMARY_PACK_NO |  |  |  | VARCHAR (25) | Contains the numeric identifier of the primary simple pack that will be used to replenish the item. |
| 53 | SIZE_PROFILE_IND |  |  |  | VARCHAR (1) | Size Profile indicator |
| 54 | MULT_RUNS_PER_DAY_IND |  |  | Y | VARCHAR (1) | The column indicates if an item can be replenished multiple times per day at the location. Default value is N |
| 55 | TSF_ZERO_SOH_IND |  |  | Y | VARCHAR (1) | The column indicates if a transfer should be created even though the warehouse does not have enough stock on hand. Default value is N |
| 56 | ADD_LEAD_TIME_IND |  |  |  | VARCHAR (1) | This indicator will determine if the supplier lead time will be considered in to the calculation of time supply order points and order up to point. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_REPL_ATTR_UPDATE_HEAD|PK||||REPL_ATTR_ID|ASC|
|REPL_ATTR_UPDATE_HEAD_I1|||||SCHEDULED_ACTIVE_DATE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_RAUH_ACTION|ACTION in ('A','U','D')<br>|
||CHK_RAUH_DEFAULT_PACK_IND|DEFAULT_PACK_IND in ('Y','N')<br>|
||CHK_RAUH_MRA_RESTORE|MRA_RESTORE in ('Y','N')<br>|
||CHK_RAUH_MRA_UPDATE|MRA_UPDATE in ('Y','N')<br>|
||CHK_RAUH_MULT_RUNS_PER_DAY_IND|MULT_RUNS_PER_DAY_IND in ('Y','N') and ((REPL_METHOD = 'SO' and STOCK_CAT in ('W','L') and REVIEW_CYCLE = 1 and<br>MULT_RUNS_PER_DAY_IND = 'Y') or (MULT_RUNS_PER_DAY_IND = 'N'))<br>|
||CHK_RAUH_NON_SCALING_IND|NON_SCALING_IND in ('Y','N')<br>|
||CHK_RAUH_REJECT_STORE_ORD_IND|REJECT_STORE_ORD_IND in ('Y','N')|






|Type|Column / Constraint Name|Details|
|---|---|---|
||||
||CHK_RAUH_REMOVE_PACK_IND|REMOVE_PACK_IND in ('Y','N')<br>|
||CHK_RAUH_REPL_METHOD|REPL_METHOD in ('C','M','F','D','DI','TI','SO','S','T','E')<br>|
||CHK_RAUH_REPL_METHOD_IND|REPL_METHOD_IND in ('Y','N')<br>|
||CHK_RAUH_REPL_ORDER_CTRL|REPL_ORDER_CTRL in ('B','S','M','A')<br>|
||CHK_RAUH_SERVICE_LEVEL_TYPE|SERVICE_LEVEL_TYPE in ('S','SS')<br>|
||CHK_RAUH_SIZE_PROFILE_IND|size_profile_ind in ('Y','N')<br>|
||CHK_RAUH_STOCK_CAT|STOCK_CAT in ('D','C','W','L')<br>|
||CHK_RAUH_TSF_ZERO_SOH_IND|TSF_ZERO_SOH_IND in ('Y','N') and ((REPL_METHOD = 'SO' and STOCK_CAT = 'W' and TSF_ZERO_SOH_IND = 'Y') or<br>(TSF_ZERO_SOH_IND = 'N'))<br>|
|Column Level|ACTION||
||MRA_UPDATE||
||MRA_RESTORE||
||STOCK_CAT||
||REPL_ORDER_CTRL||
||REPL_METHOD||
||REJECT_STORE_ORD_IND||
||NON_SCALING_IND||
||DEFAULT_PACK_IND||
||REMOVE_PACK_IND||





|Type|Column / Constraint Name|Details|
|---|---|---|
||SIZE_PROFILE_IND||

---

## Table: REPL_ATTR_UPDATE_ITEM

**Description:** This table is used to temporarily store item replenishment attribute information. This table is populated using an on-line mass change form, and the then the information is help on this table until the nightly batch program, rplatupd.pc is run to update the items replenishment attributes.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | This field contains the item that should have its replenishment attributes updated. |
| 2 | REPL_ATTR_ID |  |  | Y | NUMERIC (10) | Please remove all columns from this table except for the new REPL_ATTR_ID field and the ITEM field (which remains as part of the primary key). |
| 3 | DEPT |  |  |  | NUMERIC (4) | Department |
| 4 | CLASS |  |  |  | NUMERIC (4) | Class |
| 5 | SUBCLASS |  |  |  | NUMERIC (4) | Subclass |
| 6 | DIFF_1 |  |  |  | VARCHAR (10) | Diff 1 |
| 7 | DIFF_2 |  |  |  | VARCHAR (10) | Diff 2 |
| 8 | DIFF_3 |  |  |  | VARCHAR (10) | Diff 3 |
| 9 | DIFF_4 |  |  |  | VARCHAR (10) | Diff 4 |

---

## Table: REPL_ATTR_UPDATE_LOC

**Description:** This table is used to temporarily store item location replenishment attribute information. This table is populated using an on-line mass change form, and the then the information is help on this table until the nightly batch program, rplatupd.pc is run to update the item/location replenishment attributes.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LOC | P |  | Y | NUMERIC (10) | This field contains the location which should have the replenishment information updated. |
| 2 | LOC_TYPE | P |  | Y | VARCHAR (1) | This field contains the location type for the location field. Valid values are: S - Store W - Warehouse |
| 3 | REPL_ATTR_ID | P | F | Y | NUMERIC (10) | Replenishment attribute id. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_REPL_ATTR_UPDATE_LOC|PK||||REPL_ATTR_ID|ASC|
||||||LOC|ASC|
||||||LOC_TYPE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_REPL_ATTR_LOC_LOC_TYPE|LOC_TYPE IN ('S', 'W')<br>|

---

## Table: REPL_ATTR_UPD_HIST

**Description:** This table stores data that is captured whenever a change occurs on the replenishment form. A new row would be added to this table everytime a new replenishment is defined or when the attributes are updated.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | REPL_ATTR_UPD_ID | P |  | Y | NUMERIC (10) | This field contains the sequence value from REPL_ATTR_UPD_ID_S. |
| 2 | DEPT |  |  |  | NUMERIC (4) | Department id. |
| 3 | CLASS |  |  |  | NUMERIC (4) | Class id. |
| 4 | SUBCLASS |  |  |  | NUMERIC (4) | Subclass id. |
| 5 | DIFF_AGGREGATE |  |  |  | VARCHAR (50) | This field holds the concatenated value of the aggregated differentiators. |
| 6 | ITEM |  |  |  | VARCHAR (25) | Item value. |
| 7 | LOC_TYPE |  |  |  | VARCHAR (6) | Location type of the location where replenishment attributes are being applied. |
| 8 | LOCATION |  |  |  | VARCHAR (20) | Location at which the replenishment attributes are being applied. |
| 9 | ITEM_PARENT |  |  |  | VARCHAR (25) | Parent item number. |
| 10 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | Grandparent item number. |
| 11 | SIZE_PROFILE_IND |  |  |  | VARCHAR (1) | Size profile indicator checkbox value. |
| 12 | PRIMARY_REPL_SUPPLIER |  |  |  | NUMERIC (10) | Stores the supplier to which an order would be sent for replenishment. |
| 13 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | Supplier origin country. |
| 14 | REVIEW_CYCLE |  |  |  | VARCHAR (6) | Contains the number representing when the specified item location will be reviewed for replenishment. |
| 15 | STOCK_CAT |  |  |  | VARCHAR (6) | Sourcing strategy for the item/location relationship. |
| 16 | REPL_ORDER_CTRL |  |  |  | VARCHAR (6) | Determines in what way the replenishment process will create an order. |
| 17 | SOURCE_WH |  |  |  | NUMERIC (10) | Numeric identifier for the warehouse through which the item will cross-dock. |
| 18 | ACTIVATE_DATE |  |  |  | Date | Date on which the item location will start to be reviewed for replenishment. |
| 19 | DEACTIVATE_DATE |  |  |  | Date | Date at which time the item location will no longer be reviewed for replenishment. |
| 20 | PRES_STOCK |  |  |  | NUMERIC (12,4) | Minimum amount of stock that needs to be on store shelves. |
| 21 | DEMO_STOCK |  |  |  | NUMERIC (12,4) | Amount of stock that cannot be sold as new and is not counted as part of inventory in the replenishment calculations. |
| 22 | REPL_METHOD |  |  |  | VARCHAR (6) | Character code for the algorithm that will be used to calculate the recommended order quantity for the item location. |
| 23 | MIN_STOCK |  |  |  | NUMERIC (12,4) | Required minimum number of units available for sale. |
| 24 | MAX_STOCK |  |  |  | NUMERIC (12,4) | Required maximum number of units available for sale. |
| 25 | INCR_PCT |  |  |  | NUMERIC (12,4) | Percentage by which the min and max stock levels will be multiplied when calculating the recommended order quantity. |
| 26 | MIN_SUPPLY_DAYS |  |  |  | NUMERIC (3) | Minimum number of days of supply of stock to maintain. Used in the Time Supply replenishment method algorithm. |
| 27 | MAX_SUPPLY_DAYS |  |  |  | NUMERIC (3) | Maximum number of days of supply of stock to maintain. Used in the Time Supply replenishment method algorithm. |
| 28 | TIME_SUPPLY_HORIZON |  |  |  | NUMERIC (3) | Number of days over which an average sales rate is calculated to be used in the Time Supply replenishment method algorithm. |
| 29 | INV_SELLING_DAYS |  |  |  | NUMERIC (3) | Number of required days of on hand inventory to satisfy demand. Used in the Dynamic replenishment method algorithm. |
| 30 | SERVICE_LEVEL |  |  |  | NUMERIC (5,2) | Required measure of probability that demand is satisfied from on hand inventory. Used in the Dynamic replenishment method algorithm. |
| 31 | LOST_SALES_FACTOR |  |  |  | NUMERIC (5,2) | Percentage of sales that could have occurred if inventory had been available through the order lead-time. |
| 32 | REJECT_STORE_ORD_IND |  |  |  | VARCHAR (1) | Indicator that determines if uploaded store orders should be rejected. |
| 33 | NON_SCALING_IND |  |  |  | VARCHAR (1) | Indicator used to determine if the item/location should be exempt from scaling during the order scaling process during replenishment. |
| 34 | MAX_SCALE_VALUE |  |  |  | NUMERIC (12,4) | Contains the limit up to which order scaling can increase the order quantity for the item/location during the replenishment process. |
| 35 | PICKUP_LEAD_TIME |  |  |  | NUMERIC (4) | Expected number of days required to ship the item from the supplier to the intitial receiving location. |
| 36 | WH_LEAD_TIME |  |  |  | NUMERIC (4) | Expected number of days required to move the item from the warehouse to the store defined on this record. |
| 37 | TERMINAL_STOCK_QTY |  |  |  | NUMERIC (12,4) | Contains desired stock on hand for the item location when the end of season is reached. |
| 38 | SEASON_ID |  |  |  | NUMERIC (3) | Season for which this item location is being replenished. |
| 39 | PHASE_ID |  |  |  | NUMERIC (3) | Phase within the season for which this item location is being replenished. |
| 40 | PRIMARY_PACK_NO |  |  |  | VARCHAR (25) | Primary simple pack that will be used to replenish the item. |
| 41 | PRIMARY_PACK_QTY |  |  |  | NUMERIC (12,4) | Quantity of the item in the simple pack if a primary replenishment pack is being used to replenish the item. |
| 42 | UNIT_TOLERANCE |  |  |  | NUMERIC (12,4) | The allowable unit change to order quantities generated from replenishment. |
| 43 | PCT_TOLERANCE |  |  |  | NUMERIC (12,4) | The allowable percent change to order quantities generated from replenishment. |
| 44 | USE_TOLERANCE_IND |  |  |  | VARCHAR (1) | Indicates whether or not unit and percent tolerance will be used. |
| 45 | SERVICE_LEVEL_TYPE |  |  |  | VARCHAR (2) | Drives the safety stock calculation algorithm. |
| 46 | STORE_ORDER_MULT |  |  |  | VARCHAR (6) | Pack size level at which the item (or primary replenishment pack) is shipped between warehouses and stores. |
| 47 | LAST_REVIEW_DATE |  |  |  | Date | Date on which the item location was last reviewed. |
| 48 | WEEK_NUM |  |  |  | NUMERIC (12) | Week number in the year. |
| 49 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds user information who last updated the repl attributes. |
| 50 | LAST_UPDATE_DATETIME |  |  | Y | Date | Records the date and time stamp at which the repl attr form was submitted. |
| 51 | TSF_ZERO_SOH_IND |  |  | Y | VARCHAR (1) | This indicates if a transfer should be created even though the warehouse does not have enough stock on hand. Default value is N |
| 52 | MULT_RUNS_PER_DAY_IND |  |  | Y | VARCHAR (1) | This indicates if an item can be replenished multiple times per day at the location. Default value is N |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_REPL_ATTR_UPD_HIST|PK||||REPL_ATTR_UPD_ID|ASC|

---

## Table: REPL_DAY

**Description:** This new table indicates what days of the week an item location should be reviewed for replenishment.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Contains the item that is on replenishment. |
| 2 | LOCATION | P | F | Y | NUMERIC (10) | Contains the numeric identifier of the location that is on replenishment. |
| 3 | WEEKDAY | P |  | Y | NUMERIC (1) | Contains the weekday that the item location should be reviewed for replenishment. Valid values are 1 (first day of the week), 1 (second day of the week), etc. |
| 4 | LOC_TYPE |  |  | Y | VARCHAR (6) | Contains the type of the location on replenishment. Valid values include Store, Warehouse. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_REPL_DAY|PK||||ITEM|ASC|
||||||LOCATION|ASC|
||||||WEEKDAY|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_REPL_DAY_LOC_TYPE|loc_type in ('S','W')<br>|
||CHK_REPL_DAY_WEEKDAY|weekday >=1 and weekday<=7<br>|
|Column Level|WEEKDAY||
||LOC_TYPE||

---

## Table: REPL_DAY_UPDATE

**Description:** This table will be a global temporary table used during the rplatupd batch program. It will hold updates to the repl_day table that will be inserted into the repl_day table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  | Y | VARCHAR (25) | Contains the item that is on replenishment. |
| 2 | LOCATION |  |  | Y | NUMERIC (10) | Contains the numeric identifier of the location that is on replenishment. |
| 3 | LOC_TYPE |  |  | Y | VARCHAR (6) | Contains the type of the location on replenishment. Valid values include Store, Warehouse. |
| 4 | MONDAY |  |  | Y | VARCHAR (1) | Indicator to determine whether or not the item/location will be reviewed on Monday. Valid values include Yes (specified item/location will be reviewed on Mondays) and No (specified item/location will not be reviewed on Mondays). |
| 5 | TUESDAY |  |  | Y | VARCHAR (1) | Indicator to determine whether or not the item/location will be reviewed on Tuesday. Valid values include Yes (specified item/location will be reviewed on Tuesdays) and No (specified item/location will not be reviewed on Tuesdays). |
| 6 | WEDNESDAY |  |  | Y | VARCHAR (1) | Indicator to determine whether or not the item/location will be reviewed on Wednesday. Valid values include Yes (specified item/location will be reviewed on Wednesdays) and No (specified item/location will not be reviewed on Wednesdays). |
| 7 | THURSDAY |  |  | Y | VARCHAR (1) | Indicator to determine whether or not the item/location will be reviewed on Thursday. Valid values include Yes (specified item/location will be reviewed on Thursdays) and No (specified item/location will not be reviewed on Thursdays). |
| 8 | FRIDAY |  |  | Y | VARCHAR (1) | Indicator to determine whether or not the item/location will be reviewed on Friday. Valid values include Yes (specified item/location will be reviewed on Fridays) and No (specified item/location will not be reviewed on Fridays). |
| 9 | SATURDAY |  |  | Y | VARCHAR (1) | Indicator to determine whether or not the item/location will be reviewed on Saturday. Valid values include Yes (specified item/location will be reviewed on Saturdays) and No (specified item/location will not be reviewed on Saturdays). |
| 10 | SUNDAY |  |  | Y | VARCHAR (1) | Indicator to determine whether or not the item/location will be reviewed on Sunday. Valid values include Yes (specified item/location will be reviewed on Sundays) and No (specified item/location will not be reviewed on Sundays). |

---

## Table: REPL_ITEM_LOC

**Description:** This table is used to store item location level replenishment attributes.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Alphanumeric identifier for the item on replenishment. |
| 2 | LOCATION | P |  | Y | NUMERIC (10) | Location that is on replenishment. Will hold only vritual warehouse in the multi-channel environment. |
| 3 | LOC_TYPE |  |  | Y | VARCHAR (6) | Contains the type of the location on replenishment. Valid values include Store, Warehouse. |
| 4 | ITEM_PARENT |  |  |  | VARCHAR (25) | The parent/group of the item on replenishment. |
| 5 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | The grandparent/master group of the item on replenishment. |
| 6 | PRIMARY_REPL_SUPPLIER |  | F |  | NUMERIC (10) | Contains the numeric identifier of the supplier from which the specified location will source the replenishment demand for the specified item location. Used for items on Direct to Store/Warehouse or Cross-docked replenishment. |
| 7 | ORIGIN_COUNTRY_ID |  | F |  | VARCHAR (3) | Contains the country code of the supplier country that will be used to supply the replenishment demand for the specified item location. Used for items on Direct to Store/Warehouse or Cross-docked replenishment. |
| 8 | REVIEW_CYCLE |  |  | Y | VARCHAR (6) | Contains the number representing when the specified item location will be reviewed for replenishment. Valid values are 0-14. A 0 represents a weekly review cycle, a 1 represents a daily review cycle, a 2 represents a review cycle of every 2 weeks, a 3 represents a review cycle of every 3 weeks, etc. |
| 9 | STOCK_CAT |  |  | Y | VARCHAR (6) | Contains the sourcing strategy for the item/location relationship. Valid values are Direct to store (supplier to store), Cross-docked (supplier to store flowing through the warehouse), Warehouse stocked (warehouse to store), L for WH/Cross Link (warehouse to store and supplier to warehouse if insufficient warehouse stock). |
| 10 | REPL_ORDER_CTRL |  |  | Y | VARCHAR (6) | Determines if the replenishment process will create an actual order/transfer line item for the item location if there is a need for the item location or if only a record is written to the Replenishment Results table. Valid values are Manual (a record is written to the Replenishment Results table - no order/transfer line item is created), Semi-Automatic (an order/transfer line item is created - the order line item will be added to an order in Worksheet status, the transfer line item will be added to a transfer in Approved status with a freight type of Hold), Automatic (an order/transfer line item is created - the order line item will be added to an order in Approved status, the transfer line item will be added to a transfer in Approved status), Buyer Worksheet (a record is written to the Replenishment Results table and can be added to a purchase order on the Buyer Worksheet form/a transfer line item is added to a transfer in Approved status with a freight type of Hold). |
| 11 | SOURCE_WH |  | F |  | NUMERIC (10) | Contains the numeric identifier of the warehouse through which the specified item will crossdock to the specified store for a stock category of Cross-docked; or the numeric identifier of the warehouse from which the specified item will be sourced for the specified store for a stock category |
| 12 | ACTIVATE_DATE |  |  | Y | Date | Contains the date on which the item location will start to be reviewed for replenishment. |
| 13 | DEACTIVATE_DATE |  |  |  | Date | Contains the date at which time the item location will no longer be reviewed for replenishment. |
| 14 | PRES_STOCK |  |  |  | NUMERIC (12,4) | Contains the minimum amount of stock that needs to be on store shelves. The presentation stock is nor expected to satisfy consumer demand but is expected to remain in the fixture. |
| 15 | DEMO_STOCK |  |  |  | NUMERIC (12,4) | Contains the amount of stock that cannot be sold as new and is not counted as part of inventory in the replenishment calculations. The value in this field is the amount of stock used strictly for demonstration purposes. |
| 16 | REPL_METHOD |  |  | Y | VARCHAR (6) | Contains the character code for the algorithm that will be used to calculate the recommended order quantity for the item location. Valid values include Constant, Min/Max, Floating point, Time Supply, Dynamic, SO Store Orders. |
| 17 | MIN_STOCK |  |  |  | NUMERIC (12,4) | Contains the required minimum number of units available for sale. Used in the Min/Max replenishment method algorithm. |
| 18 | MAX_STOCK |  |  |  | NUMERIC (12,4) | Contains the required maximum number of units available for sale. Used in the Constant, Min/Max and Floating Point replenishment method algorithms. |
| 19 | INCR_PCT |  |  |  | NUMERIC (12,4) | Contains the percentage by which the min and max stock levels will be multiplied when calculating the recommended order quantity. Ex. Actual max stock=max stock*increment percent. |
| 20 | MIN_SUPPLY_DAYS |  |  |  | NUMERIC (3) | Contains the minimum number of days of supply of stock to maintain. Used in the Time Supply replenishment method algorithm. |
| 21 | MAX_SUPPLY_DAYS |  |  |  | NUMERIC (3) | Contains the maximum number of days of supply of stock to maintain. Used in the Time Supply replenishment method algorithm. |
| 22 | TIME_SUPPLY_HORIZON |  |  |  | NUMERIC (3) | Contains the number of days over which an average sales rate is calculated to be used in the Time Supply replenishment method algorithm. |
| 23 | INV_SELLING_DAYS |  |  |  | NUMERIC (3) | Contains the number of required days of on hand inventory to satisfy demand. Used in the Dynamic replenishment method algorithm. |
| 24 | SERVICE_LEVEL |  |  |  | NUMERIC (5,2) | Contains the required measure of probability that demand is satisfied from on hand inventory. Used in the Dynamic replenishment method algorithm. |
| 25 | LOST_SALES_FACTOR |  |  |  | NUMERIC (5,2) | Contains the percentage of sales that could have occurred if inventory had been available through the order lead time. Used in the Dynamic replenishment method algorithm. |
| 26 | REJECT_STORE_ORD_IND |  |  |  | VARCHAR (1) | Contains an indicator that determines if uploaded store orders should be rejected. If the indicator is N, then store orders for all need dates are valid. If Y, store orders with needs date on or after the NEXT_DELIVERY_DATE are valid. |
| 27 | NON_SCALING_IND |  |  | Y | VARCHAR (1) | Indicator used to determine if the item/location should be exempt from scaling during the order scaling process during the replenishment process. Y - Yes. The item/locations order quantity will not be adjusted during the order scaling process. N - No. The item/locations order quantity will be adjusted during the order scaling process. |
| 28 | MAX_SCALE_VALUE |  |  |  | NUMERIC (12,4) | Contains the limit up to which order scaling can increase the order quantity for the item/location during the replenishment process. If the replenishment method is C (constant), M (min/max), F (floating point) this value will be a quantity (ex. 1,000 eaches). If the replenishment method is a dynamic or time supply method this value will be a number of days. A 0 (zero) in this field indicates no max scaling value. This field is intended to prevent run-away scaling processes as well as to protect items from being ordered to locations in such amounts that would result in perishable or obsolescence issues. |
| 29 | PICKUP_LEAD_TIME |  |  |  | NUMERIC (4) | Contains the expected number of days required to ship the item from the supplier to the initial receiving location, which may be a store or warehouse defined on this record or the cross-dock warehouse through |
| 30 | WH_LEAD_TIME |  |  |  | NUMERIC (4) | Contains the expected number of days required to move the item from the warehouse to the store defined on this record. |
| 31 | TERMINAL_STOCK_QTY |  |  |  | NUMERIC (12,4) | Contains the desired stock on hand for the item location when the end of season is reached. Used in the Seasonal Dynamic and Seasonal Time Supply replenishment methods. |
| 32 | SEASON_ID |  |  |  | NUMERIC (3) | Contains the numeric identifier of the season for which this item location is being replenished. Used in the Seasonal Dynamic and Seasonal Time Supply replenishment methods. |
| 33 | PHASE_ID |  |  |  | NUMERIC (3) | Contains the numeric identifier of the phase within the season for which this item location is being replenished. Used in the Seasonal Dynamic and Seasonal Time Supply replenishment methods. |
| 34 | LAST_REVIEW_DATE |  |  |  | Date | Contains the date on which the item location was last reviewed. |
| 35 | NEXT_REVIEW_DATE |  |  |  | Date | Contains the date on which the item location will be reviewed next. |
| 36 | PRIMARY_PACK_NO |  |  |  | VARCHAR (25) | Contains the numeric identifier of the primary pack that will be used to replenish the item. This field is used for performance purposes during the batch replenishment process. |
| 37 | PRIMARY_PACK_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of the item in the simple pack if a primary replenishment pack is being used to replenish the item. This field is used for performance purposes during the batch replenishment process. |
| 38 | UNIT_TOLERANCE |  |  |  | NUMERIC (12,4) | The allowable unit change to order quantities generated from replenishment. |
| 39 | PCT_TOLERANCE |  |  |  | NUMERIC (12,4) | The allowable percent change to order quantities generated from replenishment. |
| 40 | ITEM_SEASON_SEQ_NO |  | F |  | NUMERIC (4) | This field will related to the item_season_seq_no for the associated item_seasons record. |
| 41 | USE_TOLERANCE_IND |  |  | Y | VARCHAR (1) | Indicates whether or not unit and percent tolerances will be used. |
| 42 | LAST_DELIVERY_DATE |  |  |  | Date | Contains the last delivery date that replenishment was run for. If replenishment is run on Monday and an order is created that will arrive on Friday, this field will be updated with Fridays date. |
| 43 | NEXT_DELIVERY_DATE |  |  |  | Date | Contains the next delivery date calculated for the next review cycle. If, for the next review cycle, an order will be created that is calculated to arrive on Thursday, this field will be updated with Thursdays date. |
| 44 | MBR_ORDER_QTY |  |  |  | NUMERIC (12,4) | This field is only populated if the item on replenishment is using the WH/Cross Link stock category. It will store the portion of the recommended order quantity that cannot be fulfilled by warehouse stock. This quantity will be the quantity that is ordered when an order is created. |
| 45 | ADJ_PICKUP_LEAD_TIME |  |  |  | NUMERIC (4) | Pickup_lead_time for MBR cross-link line items after reqext processes them. |
| 46 | ADJ_SUPP_LEAD_TIME |  |  |  | NUMERIC (4) | Supp_lead_time for MBR cross-link line items after reqext processes them. |
| 47 | TSF_PO_LINK_NO |  |  |  | NUMERIC (12) | A reference number to link the item on the transfer to any purchase orders that have been created to allow the from location (i.e. warehouse) on the transfer to fulfill the transfer quantity to the to location (i.e store) on the transfer. |
| 48 | LAST_ROQ |  |  |  | NUMERIC (12,4) | This column will contain the last recommended order quantity created by Vendor Replenishment Extraction (rplext.pc). It will be used by the investment buy opportunity calculation (ibcalc.pc) in calculating future available quantity for the item/location. |
| 49 | STATUS |  |  |  | VARCHAR (1) | Status of the item. Valid values are: W = Worksheet, S = Submitted, A = Approved. This field is used for performance purposes during the batch replenishment process. |
| 50 | DEPT |  |  |  | NUMERIC (4) | Contains the number of the department in which the item is located. This field is used for performance purposes during the batch replenishment process. |
| 51 | CLASS |  |  |  | NUMERIC (4) | Contains the number of the class in which the item is located. This field is used for performance purposes during the batch replenishment process. |
| 52 | SUBCLASS |  |  |  | NUMERIC (4) | Contains the number of the class in which the item is located. This field is used for performance purposes during the batch replenishment process. |
| 53 | STORE_ORD_MULT |  |  |  | VARCHAR (6) | Contains the pack size level at which the item (or primary replenishment pack) is shipped between warehouses and stores. Valid values are Case, Inner, Each. If the item is being replenished using a primary replenishment pack (i.e. primary_pack_no is not NULL), the store order multiple will represent the packs store order multiple. Otherwise, the field will contain the items store order multiple. This field is used for performance purposes during the batch replenishment process. |
| 54 | UNIT_COST |  |  |  | NUMERIC (20,4) | This field contains the unit cost for the item (or simple pack if a replenishment simple pack is being used) for the replenishment supplier/country. This field is stored in the suppliers currency. |
| 55 | SUPP_LEAD_TIME |  |  |  | NUMERIC (4) | This field contains the number of days that will elapse between the date an order is written and the delivery to the store or warehouse from the supplier. |
| 56 | INNER_PACK_SIZE |  |  |  | NUMERIC (12,4) | This field contains the break pack size for the item for the supplier |
| 57 | SUPP_PACK_SIZE |  |  |  | NUMERIC (12,4) | This field contains the quantity that orders must be placed in multiples of for the supplier of the item. |
| 58 | TI |  |  |  | NUMERIC (12,4) | This field contains the number of shipping units (cases) that make up one tier of a pallet. Multiply TI x HI to get total number of units (cases) for a pallet. |
| 59 | HI |  |  |  | NUMERIC (12,4) | This field contains the number of tiers that make up a complete pallet (height). Multiply TI x HI to get total number of units (cases) for a pallet. |
| 60 | ROUND_LVL |  |  |  | VARCHAR (6) | This field determines how order quantities will be rounded to Case, Layer and Pallet. |
| 61 | ROUND_TO_INNER_PCT |  |  |  | NUMERIC (12,4) | This field contains the Inner Rounding Threshold value. During rounding, this value is used to determine whether to round partial Inner quantities up or down. |
| 62 | ROUND_TO_CASE_PCT |  |  |  | NUMERIC (12,4) | This field contains the Case Rounding Threshold value. During rounding, this value is used to determine whether to round partial Case quantities up or down. |
| 63 | ROUND_TO_LAYER_PCT |  |  |  | NUMERIC (12,4) | This field contains the Layer Rounding Threshold value. During rounding, this value is used to determine whether to round partial Layer quantities up or down |
| 64 | ROUND_TO_PALLET_PCT |  |  |  | NUMERIC (12,4) | This field contains the Pallet Rounding Threshold value. During rounding, this value is used to determine whether to round partial Pallet quantities up or down. |
| 65 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 66 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 67 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |
| 68 | SERVICE_LEVEL_TYPE |  |  |  | VARCHAR (2) | Service Level Type that will drive the safety stock calculation algorithm, valid values are Simple Sales and Standard. |
| 69 | TSF_ZERO_SOH_IND |  |  | Y | VARCHAR (1) | This indicates if a transfer should be created even though the warehouse does not have enough stock on hand. Default value is N |
| 70 | MULT_RUNS_PER_DAY_IND |  |  | Y | VARCHAR (1) | This indicates if an item can be replenished multiple times per day at the location. Default value is N. |
| 71 | ADD_LEAD_TIME_IND |  |  |  | VARCHAR (1) | This indicator will determine if the supplier lead time will be considered in the calculation of time supply order points and order up to point. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_REPL_ITEM_LOC|PK||||ITEM|ASC|
||||||LOCATION|ASC|
|REPL_ITEM_LOC_I3|||||PRIMARY_PACK_NO|ASC|
|REPL_ITEM_LOC_I2|||||ITEM|ASC|
||||||SEASON_ID|ASC|
||||||PHASE_ID|ASC|
|REPL_ITEM_LOC_I1|||||ITEM|ASC|
||||||PRIMARY_REPL_SUPPLIER|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
|REPL_ITEM_LOC_I4|||||SOURCE_WH|ASC|
||||||ITEM|ASC|
|REPL_ITEM_LOC_I6|||||DEPT|ASC|
|REPL_ITEM_LOC_I5|||||ITEM|ASC|
||||||ITEM_SEASON_SEQ_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_REPL_ITEM_LOC_LOC_TYPE|loc_type in ('S','W')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_REPL_ITEM_LOC_NON_SCAL_IND|non_scaling_ind in ('Y', 'N')<br>|
||CHK_REPL_ITEM_LOC_REJECT_STORE|(reject_store_ord_ind in ('Y','N') and repl_method in ('SO')) or reject_store_ord_ind IS NULL<br>|
||CHK_REPL_ITEM_LOC_REPL_METHOD|(repl_method in ('C','M','F','T','D','TI','DI','SO'))<br>|
||CHK_REPL_ITEM_LOC_REPL_ORDER_C|repl_order_ctrl in ('M','S','A','B')<br>|
||CHK_REPL_ITEM_LOC_REV_CYCLE|review_cycle >= 0 and review_cycle <=14<br>|
||CHK_REPL_ITEM_LOC_STATUS|(STATUS IN ('W','S','A')) OR (STATUS IS NULL)<br>|
||CHK_REPL_ITEM_LOC_STOCK_CAT|stock_cat in ('D','C','W','L')<br>|
||CHK_REPL_ITEM_LOC_ST_ORD_MULT|store_ord_mult in ('C','I','E')<br>|
||CHK_REPL_ITEM_LOC_USE_TOLERANC|use_tolerance_ind in ('Y','N')<br>|
||CHK_RIL_MULT_RUNS_PER_DAY_IND|MULT_RUNS_PER_DAY_IND IN ('Y','N')<br>|
||CHK_RIL_MULT_RUNS_PER_DAY_IND1|(REPL_METHOD = 'SO' and STOCK_CAT in ('W','L') and REVIEW_CYCLE = 1 and MULT_RUNS_PER_DAY_IND = 'Y') or<br>(MULT_RUNS_PER_DAY_IND = 'N')<br>|
||CHK_RIL_SERVICE_LEVEL_TYPE|SERVICE_LEVEL_TYPE in ('S','SS')<br>|
||CHK_RIL_TSF_ZERO_SOH_IND|TSF_ZERO_SOH_IND in ('Y','N')<br>|
||CHK_RIL_TSF_ZERO_SOH_IND1|(REPL_METHOD = 'SO' and STOCK_CAT = 'W' and TSF_ZERO_SOH_IND = 'Y') or (TSF_ZERO_SOH_IND = 'N')<br>|
|Column Level|LOC_TYPE||
||REVIEW_CYCLE||





|Type|Column / Constraint Name|Details|
|---|---|---|
||STOCK_CAT||
||REPL_ORDER_CTRL||
||NON_SCALING_IND||
||USE_TOLERANCE_IND||
||STATUS||
||STORE_ORD_MULT||
||TSF_ZERO_SOH_IND||
||MULT_RUNS_PER_DAY_IND||

---

## Table: REPL_ITEM_LOC_SUPP_DIST

**Description:** This table will contain the supplier distribution ratio for an item/location that is set up for replenishment. It is used to by the replenishment process to automatically split replenishment orders among different suppliers.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Item to be replenished according to the supplier ratio specified. |
| 2 | LOCATION | P | F | Y | NUMERIC (10) | Location of the item where the order needs to be placed from the supplier. |
| 3 | SUPPLIER | P | F | Y | NUMERIC (10) | This specifies the supplier to whom the order should be placed according to the ratio specified. |
| 4 | ORIGIN_COUNTRY_ID | P | F | Y | VARCHAR (3) | The origin country of the order that will be placed. |
| 5 | DIST_PCT |  |  | Y | NUMERIC (12,4) | This specifies the percentage of the ROQ at an item/location that should be ordered from this supplier/origin country. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | Timestamp of when the row was updated most recently. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_REPL_ITEM_LOC_SUPP_DIST|PK||||ITEM|ASC|
||||||LOCATION|ASC|
||||||SUPPLIER|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|

---

## Table: REPL_ITEM_LOC_UPDATES

**Description:** This table is used as a staging table for the Replenishment Attribute Update batch process. It is populated by multiple modules in which updates would cause some of the values in the Replenishment Results table (REPL_ITEM_LOC) to change. For example, if the case size for an item/supplier/country was changed in the Item Supplier Country dialog and the item was on replenishment using the supplier/country, the case size on the REPL_ITEM_LOC table would need to be updated to the new value entered in the item/supplier/country dialog. Therefore, a record would be written to this table with the item/supplier/country and change type of ISC to indicate to the batch process that an update to the case size field on REPL_ITEM_LOC is required for records using the item/supplier/country combination. Since this is a temporary table populated by RMS modules, due to performance reasons, no constraints, foreign keys, etc. have been added to this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | This field contains the item associated with the change. It is used to determine which records on the REPL_ITEM_LOC will need to be updated. |
| 2 | SUPPLIER |  |  |  | NUMERIC (10) | This field contains the replenishment supplier associated with the change. It is used to determine which records on the REPL_ITEM_LOC will need to be updated. |
| 3 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | This field contains the country associated with the change. It is used to determine which records on the REPL_ITEM_LOC will need to be updated. |
| 4 | LOCATION |  |  |  | NUMERIC (10) | This field contains the location associated with the change. It is used to determine which records on the REPL_ITEM_LOC will need to be updated. In a multi-channel environment, a warehouse location will always represent a virtual warehouse. |
| 5 | LOC_TYPE |  |  |  | VARCHAR (6) | This field contains the location type of the location. Valid values are Store and Warehouse |
| 6 | CHANGE_TYPE |  |  |  | VARCHAR (6) | This field contains the type of change. Valid values include: HIER - The merchandise hierarchy of an item has been changed. ISC - Any or all of the inner size, case size, ti size or hi size have changed for an item/supplier/country. ISCL - Any or all of the unit cost, rounding level, inner threshold %, case threshold %, layer threshold %, pallet threshold % have changed for an item/supplier/country/location. RIL - Replenishment information has changed for an item/location. IL - Any or all of the store order multiple, primary supplier, primary origin country have changed for an item/location. |
| 7 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 8 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

---

## Table: REPL_RESULTS

**Description:** This table is used to store item location level replenishment results information and the replenishment attributes used to drive the order quantities for the item location.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SOURCE_TYPE |  |  | Y | VARCHAR (6) | Contains a character indicator to determine where the recommended order quantity is coming from. It will only contain one valid value. This column, used in conjunction with the SOURCE_TYPE column on IB_RESULTS and BUYER_WKSHT_MANUAL will aid in distinguishing which table the ROQ is coming from when displayed on the Buyer Worksheet form. R - Replenishment |
| 2 | STATUS |  |  | Y | VARCHAR (6) | Status of the record. Valid values include: W - Worksheet P - PO-Processed (is associated with a PO) D - Deleted |
| 3 | ORD_TEMP_SEQ_NO |  |  |  | NUMERIC (10) | This field will allow a link to be created between repl_results and ord_temp. It will be used by rplbld.pc when calculating due orders. Rplbld needs to have visibility to SSO and ESO from repl_results. |
| 4 | TSF_PO_LINK_NO |  |  |  | NUMERIC (12) | A reference number to link the item on the transfer to any purchase orders that have been created to allow the from location (i.e. warehouse) on the transfer to fulfill the transfer quantity to the to location (i.e store) on the transfer. |
| 5 | ORDER_NO |  |  |  | NUMERIC (12) | Contains the number of the order on which the item/location has been placed. |
| 6 | ALLOC_NO |  |  |  | NUMERIC (10) | Contains the number of the allocation on which the item/location has been placed. |
| 7 | MASTER_ITEM |  |  | Y | VARCHAR (25) | Contains the item that is being reviewed and against which replenishment calculations are performed. The item placed on the order/transfer may not necessarily be this item, but may be a simple pack used in ordering this item or a substitute item used in transferring this item. |
| 8 | ITEM |  |  | Y | VARCHAR (25) | contains the item that is on replenishment. |
| 9 | ITEM_TYPE |  |  | Y | VARCHAR (1) | Contains a character indicator to determine if the item being ordered/transferred is the item actually being reviewed and against which replenishment calculations are performed (i.e. the master item), or if the item is a simple pack or substitute item being used to replenish the master item. Valid values include: M - Master item. This indicates |
| 10 | DEPT |  |  | Y | NUMERIC (4) | The number of the department to which the item is attached. |
| 11 | CLASS |  |  | Y | NUMERIC (4) | The number of the class to which the item is attached. |
| 12 | SUBCLASS |  |  | Y | NUMERIC (4) | The number of the subclass to which the item is attached. |
| 13 | BUYER |  |  |  | NUMERIC (4) | The number that uniquely identifies the buyer for the items department. |
| 14 | PACK_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of the item in the pack being used to replenish the item. |
| 15 | LOC_TYPE |  |  | Y | VARCHAR (1) | contains the type of the location on replenishment. Valid values include Store, Warehouse. |
| 16 | LOCATION |  |  | Y | NUMERIC (10) | contains the numeric identifier of the location that is on replenishment. |
| 17 | PHYSICAL_WH |  |  |  | NUMERIC (10) | The number of the physical warehouse that is assigned to the virtual warehouse. |
| 18 | PRIMARY_REPL_SUPPLIER |  |  |  | NUMERIC (10) | Contains the numeric identifier of the supplier from which the specified location will source the replenishment demand for the specified item location. |
| 19 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | contains the country code of the supplier country that will be used to supply the replenishment demand for the specified item location. |
| 20 | POOL_SUPPLIER |  |  |  | NUMERIC (10) | This column will link the supplier, supplier/department, supplier/location, or the supplier/department/location to a master supplier. |
| 21 | SUPP_UNIT_COST |  |  |  | NUMERIC (20,4) | This field is used to store the unit cost of the item specified at the item/supplier/origin country/location level. It will never be modified. This field, in conjunction with the unit cost field, will determine the cost source to be used at the order/item/location level. It is stored in the suppliers currency. |
| 22 | UNIT_COST |  |  |  | NUMERIC (20,4) | - The unit cost of the item defaulted from the item/supplier/origin country/location level. It may be edited. This field, in conjunction with the supplier unit cost field, will determine the cost source to be used at the order/item/location level. It is stored in the suppliers currency. |
| 23 | ORIG_RAW_ROQ |  |  |  | NUMERIC (12,4) | Contains the original recommended order quantity (ROQ) before any recalculations were performed on the quantity. |
| 24 | ORIG_RAW_ROQ_PACK |  |  |  | NUMERIC (12,4) | Contains the original recommended order quantity (ROQ) for the items simple pack before any recalculations were performed on the quantity. |
| 25 | RAW_ROQ |  |  |  | NUMERIC (12,4) | Contains the raw recommended order quantity (ROQ) calculated by the system before any pack size rounding, proration, etc. was performed on the quantity |
| 26 | RAW_ROQ_PACK |  |  |  | NUMERIC (12,4) | Contains the raw recommended order quantity (ROQ) for the items simple pack calculated by the system before any pack size rounding, proration, etc. was performed on the quantity. |
| 27 | PRESCALE_ROQ |  |  |  | NUMERIC (12,4) | Contains the recommended order quantity (ROQ) for the item/location before order scaling processing was performed on the quantity and after pack size rounding, proration, ec. Was performed. |
| 28 | ORDER_ROQ |  |  |  | NUMERIC (12,4) | Contains the actual recommended order quantity (ROQ) for the item/location after all pack size rounding, proration and scaling logic is performed on the order quantity. |
| 29 | CONTRACT_ROQ |  |  |  | NUMERIC (12,4) | Contains the recommended order quantity (ROQ) for the item/location that was to be sourced using contracts. |
| 30 | SOURCED_ROQ |  |  |  | NUMERIC (12,4) | Contains the recommended order quantity (ROQ) that can actually be sourced using contracts. If the entire order quantity could be sourced from contracts, this number will be the same as the contract_roq. |
| 31 | LAST_ROUNDED_QTY |  |  |  | NUMERIC (12,4) | This column will hold the most recent system rounded order quantity value for the line item. |
| 32 | LAST_GRP_ROUNDED_QTY |  |  |  | NUMERIC (12,4) | This column will hold the last system rounded order quantity for the rounding group the location is apart of. |
| 33 | NET_INVENTORY |  |  |  | NUMERIC (12,4) | Contains the net inventory for the item/location. Includes stock on hand, orders, transfers, allocations, unavailable inventory, reserved inventory. |
| 34 | STOCK_ON_HAND |  |  |  | NUMERIC (12,4) | Contains the current stock on hand position of the item at the location. |
| 35 | PACK_COMP_SOH |  |  |  | NUMERIC (12,4) | Contains the current stock on hand position of the item at the location as a component of a pack. |
| 36 | ON_ORDER |  |  |  | NUMERIC (12,4) | Contains the current on-order position of the item at the location. |
| 37 | IN_TRANSIT_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of the item that is currently in transit to the location. |
| 38 | PACK_COMP_INTRAN |  |  |  | NUMERIC (12,4) | Contains the quantity of item that is currently in transit to the location as a component of a pack. |
| 39 | TSF_RESV_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of the item reserved for transfers from the location. |
| 40 | PACK_COMP_RESV |  |  |  | NUMERIC (12,4) | Contains the quantity of the item reserved for transfers from the location as a component of a pack. |
| 41 | TSF_EXPECTED_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of the item expected for transfers to the location. |
| 42 | PACK_COMP_EXP |  |  |  | NUMERIC (12,4) | Contains the quantity of the item expected for transfers to the location as a component of a pack. |
| 43 | RTV_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of the item waiting to be returned from the location. |
| 44 | ALLOC_IN_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of the item on allocations to the location. |
| 45 | ALLOC_OUT_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of the item on allocations out of the location. |
| 46 | NON_SELLABLE_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of the item that is non-sellable at the location. |
| 47 | ORDER_POINT |  |  |  | NUMERIC (12,4) | Contains the level below which a recommended order quantity is generated if the net inventory is lower than the order point, for the item/location. |
| 48 | ORDER_UP_TO_POINT |  |  |  | NUMERIC (12,4) | Contains the level up to which a recommended order quantity should bring the net inventory of the item. |
| 49 | SAFETY_STOCK |  |  |  | NUMERIC (12,4) | Contains the quantity of the calculated safety stock for the item/location. |
| 50 | LOST_SALES |  |  |  | NUMERIC (12,4) | Contains the quantity of the calculated lost sales for the item/location. |
| 51 | MIN_SUPPLY_DAYS_FORECAST |  |  |  | NUMERIC (12,4) | Contains the forecasted amount over the minimum time supply days. Used for the time supply replenishment methods. |
| 52 | MAX_SUPPLY_DAYS_FORECAST |  |  |  | NUMERIC (12,4) | Contains the forecasted amount over the maximum time supply days. Used for the time supply replenishment methods. |
| 53 | TIME_SUPPLY_HORIZON_FORECAST |  |  |  | NUMERIC (12,4) | Contains the forecasted amount over the time supply horizon. Used for the time supply replenishment methods. |
| 54 | INV_SELL_DAYS_FORECAST |  |  |  | NUMERIC (12,4) | Contains the forecasted amount over the inventory selling days. Used for the dynamic replenishment methods. |
| 55 | REVIEW_TIME_FORECAST |  |  |  | NUMERIC (12,4) | Contains the forecasted amount over the review time. Used for the dynamic replenishment methods. |
| 56 | ORDER_LEAD_TIME_FORECAST |  |  |  | NUMERIC (12,4) | Contains the forecasted amount over the order lead time. Used for the dynamic replenishment methods. |
| 57 | NEXT_LEAD_TIME_FORECAST |  |  |  | NUMERIC (12,4) | Contains the Next review cycles lead time forecast. This value is used in the dynamic order quantity calculations. |
| 58 | ACCEPTED_STOCK_OUT |  |  |  | NUMERIC (20,4) | Contains the accepted stock out (ASO) quantity for the item/location. |
| 59 | ESTIMATED_STOCK_OUT |  |  |  | NUMERIC (20,4) | Contains the estimated stock out (ESO) quantity for the item/location. |
| 60 | DUE_IND |  |  | Y | VARCHAR (1) | Indicator to determine if the item/location is Due. This is where the estimated stock out (ESO) value of the item/location is greater than the accepted stock out (ASO) value of the item/location. Valid values include: Y - Yes. The item/location is due. N - No. The item/location is not due. |
| 61 | REVIEW_TIME |  |  |  | NUMERIC (3) | Contains the number of days in the review time used in the recommended order quantity calculations. |
| 62 | REPL_ORDER_CTRL |  |  | Y | VARCHAR (6) | Determines if the replenishment process will create an actual order/transfer line item for the item location if there is a need for the item location or if only a record is written to the Replenishment Results table. Valid values are Manual (a record is written to the Replenishment Results table - no order/transfer line item is created), Semi-Automatic (an order/transfer line item is created - the order line item will be added to an order in Worksheet status, the transfer line item will be added to a transfer in Approved status with a freight type of Hold), Automatic (an order/transfer line item is created - the order line item will be added to an order in Approved status, the transfer line item will be added to a transfer in Approved status), Buyer Worksheet (a record is written to the Replenishment Results table and can be added to a purchase order on the Buyer Worksheet form/a transfer line item is added to a transfer in Approved status with a freight type of Hold). |
| 63 | REVIEW_CYCLE |  |  |  | VARCHAR (6) | Contains the number representing when the specified item location will be reviewed for replenishment. Valid values are 0 - 14. A 0 represents a weekly review cycle, a 1 represents a daily review cycle, a 2 represents a review cycle of every 2 weeks, a 3 represents a review cycle of every 3 weeks, etc. |
| 64 | STOCK_CAT |  |  | Y | VARCHAR (6) | Contains the sourcing strategy for the item/location relationship. Valid values are Direct to store (supplier to store), Cross-docked (supplier to store flowing through the warehouse), Warehouse stocked (warehouse to store), L for WH/Cross Link (warehouse to store and supplier to warehouse if insufficient warehouse stock). |
| 65 | SOURCE_WH |  |  |  | NUMERIC (10) | Contains the numeric identifier of the warehouse through which the specified item will cross-dock to the specified store for a stock category of Cross-docked; or the numeric identifier of the warehouse from which the specified item will be sourced for the specified store for a stock category of Warehouse Stocked. |
| 66 | ACTIVATE_DATE |  |  | Y | Date | Contains the date on which the item location will start to be reviewed for replenishment. |
| 67 | DEACTIVATE_DATE |  |  |  | Date | Contains the date at which time the item location will no longer be reviewed for replenishment. |
| 68 | PRES_STOCK |  |  |  | NUMERIC (12,4) | Contains the minimum amount of stock that needs to be on store shelves. The presentation stock is nor expected to satisfy consumer demand but is expected to remain in the fixture. |
| 69 | DEMO_STOCK |  |  |  | NUMERIC (12,4) | Contains the amount of stock that cannot be sold as new and is not counted as part of inventory in the replenishment calculations. The value in this field is the amount of stock used strictly for demonstration purposes. |
| 70 | REPL_METHOD |  |  |  | VARCHAR (6) | Contains the character code for the algorithm that will be used to calculate the recommended order quantity for the item location. Valid values include Constant, Min/Max, Floating point, Time Supply, Dynamic, SO Store Orders. |
| 71 | MIN_STOCK |  |  |  | NUMERIC (12,4) | Contains the required minimum number of units available for sale. Used in the Min/Max replenishment method algorithm. |
| 72 | MAX_STOCK |  |  |  | NUMERIC (12,4) | Contains the required maximum number of units available for sale. Used in the Constant, Min/Max and Floating Point replenishment method algorithms. |
| 73 | INCR_PCT |  |  |  | NUMERIC (12,4) | Contains the percentage by which the min and max stock levels will be multiplied when calculating the recommended order quantity. Ex. Actual max stock = max stock * increment percent. |
| 74 | MIN_SUPPLY_DAYS |  |  |  | NUMERIC (3) | Contains the minimum number of days of supply of stock to maintain. Used in the Time Supply replenishment method algorithm. |
| 75 | MAX_SUPPLY_DAYS |  |  |  | NUMERIC (3) | Contains the maximum number of days of supply of stock to maintain. Used in the Time Supply replenishment method algorithm. |
| 76 | TIME_SUPPLY_HORIZON |  |  |  | NUMERIC (3) | Contains the number of days over which an average sales rate is calculated to be used in the Time Supply replenishment method algorithm. |
| 77 | INV_SELLING_DAYS |  |  |  | NUMERIC (3) | Contains the number of required days of on hand inventory to satisfy demand. Used in the Dynamic replenishment method algorithm. |
| 78 | SERVICE_LEVEL |  |  |  | NUMERIC (5,2) | Contains the required measure of probability that demand is satisfied from on hand inventory. Used in the Dynamic replenishment method algorithm. |
| 79 | LOST_SALES_FACTOR |  |  |  | NUMERIC (5,2) | Contains the percentage of sales that could have occurred if inventory had been available through the order lead time. Used in the Dynamic replenishment method algorithm. |
| 80 | TERMINAL_STOCK_QTY |  |  |  | NUMERIC (12,4) | Contains the desired stock on hand for the item location when the end of season is reached. Used in the Seasonal Dynamic and Seasonal Time Supply replenishment methods. |
| 81 | SEASON_ID |  |  |  | NUMERIC (3) | Contains the numeric identifier of the season for which this item location is being replenished. Used in the Seasonal Dynamic and Seasonal Time Supply replenishment methods. |
| 82 | PHASE_ID |  |  |  | NUMERIC (3) | Contains the numeric identifier of the phase within the season for which this item location is being replenished. Used in the Seasonal Dynamic and Seasonal Time Supply replenishment methods. |
| 83 | REJECT_STORE_ORD_IND |  |  |  | VARCHAR (1) | Contains an indicator that determines if uploaded store orders should be rejected. If the indicator is N, then store orders for all need dates are valid. If Y, store orders with needs date on or after the NEXT_DELIVERY_DATE are valid. |
| 84 | NON_SCALING_IND |  |  | Y | VARCHAR (1) | Indicator used to determine if the item/location should be exempt from scaling during the order scaling process during the replenishment process. Y - Yes. The item/locations order quantity will not be adjusted during the order scaling process. N - No. The item/locations order quantity will be adjusted during the order scaling process. |
| 85 | MAX_SCALE_VALUE |  |  |  | NUMERIC (12,4) | Contains the limit up to which order scaling can increase the order quantity for the item/location during the replenishment process. If the replenishment method is C (constant), M (min/max), F (floating point) this value will be a quantity (ex. 1,000 eaches). If the replenishment method is a dynamic or time supply method this value will be a number of days. This field is intended to prevent run-away scaling processes as well as to protect items from being ordered to locations in such amounts that would result in perishability or obscelesence issues. |
| 86 | SUPP_LEAD_TIME |  |  |  | NUMERIC (4) | Contains the expected number of days required to send the order to the supplier and have the item ready for pickup to the initial receiving location. |
| 87 | PICKUP_LEAD_TIME |  |  |  | NUMERIC (4) | Contains the expected number of days required to ship the item from the supplier to the initial receiving location, which may be a store or warehouse defined on this record or the cross-dock warehouse through which the item will flow to get to the store defined on this record. |
| 88 | WH_LEAD_TIME |  |  |  | NUMERIC (4) | Contains the expected number of days required to move the item from the warehouse to the store defined on this record. |
| 89 | NEXT_ORDER_LEAD_TIME |  |  |  | NUMERIC (12,4) | Contains the calculated lead time for the next review cycle used in the replenishment calculations. |
| 90 | COLT_ADDED |  |  |  | NUMERIC (12,4) | Contains the number of days added to the current lead time during the replenishment calculation due to a location being closed for delivery. |
| 91 | NOLT_ADDED |  |  |  | NUMERIC (12,4) | Contains the number of days added to the next order lead time during the replenishment calculation due to a location being closed for |
| 92 | INNER_SIZE |  |  |  | NUMERIC (12,4) | Contains the inner size quantity for the item. |
| 93 | CASE_SIZE |  |  |  | NUMERIC (12,4) | Contains the case size quantity for the item. |
| 94 | TI |  |  |  | NUMERIC (12,4) | Number of shipping units (cases) that make up one tier of a pallet. Multiply TI x HI to get total number of units (cases) for a pallet. |
| 95 | HI |  |  |  | NUMERIC (12,4) | Number of tiers that make up a complete pallet (height). Multiply TI x HI to get total number of units (cases) for a pallet. |
| 96 | STORE_ORD_MULT |  |  |  | VARCHAR (1) | Contains the store order multiple for the item |
| 97 | REPL_DATE |  |  | Y | Date | Determines if the item/location replenishment attributes have been changed and the item/location is eligible for replenishment recalculation and if so, what type of recalculation. Valid values include: N - No. Recalculation is not required. Q - Quantity. The order quantity should be updated using the quantity manually entered. A - Attributes. The order quantity should be updated by recalculating the order quantity based on the changed replenishment attributes. |
| 98 | RECALC_TYPE |  |  | Y | VARCHAR (1) | Contains the date of the replenishment run that created this record. |
| 99 | RECALC_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity the order should be set to if the recalc_type field is set to Quantity. |
| 100 | AUDSID |  |  |  | NUMERIC | This column will store the auditing session ID when the user selects this record to create purchase orders with from the Buyer Worksheet form. This value will be used to identify which records should be grouped together for the purchase order and rounding libraries per user. |
| 101 | NEED_DATE |  |  |  | Date | The date on which the item is needed at the store. |
| 102 | DELIVERY_SLOT_ID |  | F |  | VARCHAR (15) | This column specifies when the store requested quantity is needed at the store on the need date. |
| 103 | CURR_ORDER_LEAD_TIME |  |  |  | NUMERIC (12,4) | Holds the expected number of days for the current order to arrive. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|REPL_RESULTS_I6|||||DELIVERY_SLOT_ID|ASC|
|REPL_RESULTS_I2|||||PRIMARY_REPL_SUPPLIER|ASC|
|REPL_RESULTS_I1|||||ITEM|ASC|
|REPL_RESULTS_I3|||||LOCATION|ASC|
|REPL_RESULTS_I5|||||ORDER_NO|ASC|
|REPL_RESULTS_I4|||||AUDSID|ASC|
||||||STATUS|ASC|
||||||REPL_ORDER_CTRL|ASC|
|REPL_RESULTS_I7|||||ORD_TEMP_SEQ_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table<br>Level|CHK_REPL_RESULTS_DUE_IND|DUE_IND in ('Y','N')<br>|
||CHK_REPL_RESULTS_ITEM_TYPE|ITEM_TYPE in ('M','P','S')<br>|
||CHK_REPL_RESULTS_LOC_TYPE|loc_type in ('S','W')<br>|
||CHK_REPL_RESULTS_NON_SCALE_IND|NON_SCALING_IND IN ('Y','N')<br>|
||CHK_REPL_RESULTS_RECALC_TYPE|RECALC_TYPE IN ('N','Q','A')<br>|






|Type|Column / Constraint Name|Details|Col4|
|---|---|---|---|
||CHK_REPL_RESULTS_REJECT_STORE|REJECT_STORE_ORD_IND in ('Y','N')<br>|REJECT_STORE_ORD_IND in ('Y','N')<br>|
||CHK_REPL_RESULTS_REPL_METHOD|(repl_method in ('C','M','F','T','D','TI','DI','SO')) or (repl_method IS NULL)<br>|(repl_method in ('C','M','F','T','D','TI','DI','SO')) or (repl_method IS NULL)<br>|
||CHK_REPL_RESULTS_REPL_ORDER_CT|repl_order_ctrl in ('M','S','A','B')<br>|repl_order_ctrl in ('M','S','A','B')<br>|
||CHK_REPL_RESULTS_SOURCE_TYPE|source_type in ('R')<br>|source_type in ('R')<br>|
||CHK_REPL_RESULTS_STATUS|status in ('W','P','D')<br>|status in ('W','P','D')<br>|
||CHK_REPL_RESULTS_STOCK_CAT|stock_cat in ('D','C','W','L')<br>|stock_cat in ('D','C','W','L')<br>|
|Column<br>Level|SOURCE_TYPE|||
|Column<br>Level|SOURCE_TYPE|Value List|Value List|
|Column<br>Level|SOURCE_TYPE|Value|Description|
|Column<br>Level|SOURCE_TYPE|'R'||
||STATUS|||
||STATUS|Value List|Value List|
||STATUS|Value|Description|
||STATUS|'D'||
||STATUS|'P'||
||STATUS|'W'||
||ITEM_TYPE|||
||ITEM_TYPE|Value List|Value List|
||ITEM_TYPE|Value|Description|
||ITEM_TYPE|'M'||
||ITEM_TYPE|'P'||
||ITEM_TYPE|'S'||
||LOC_TYPE|||






|Type|Column / Constraint Name|Details|Col4|
|---|---|---|---|
|||Value List|Value List|
|||Value|Description|
|||'S'||
|||'W'||
||DUE_IND|||
||DUE_IND|Value List|Value List|
||DUE_IND|Value|Description|
||DUE_IND|'N'||
||DUE_IND|'Y'||
||REPL_ORDER_CTRL|||
||REPL_ORDER_CTRL|Value List|Value List|
||REPL_ORDER_CTRL|Value|Description|
||REPL_ORDER_CTRL|'A'||
||REPL_ORDER_CTRL|'B'||
||REPL_ORDER_CTRL|'M'||
||REPL_ORDER_CTRL|'S'||
||STOCK_CAT|||
||STOCK_CAT|Value List|Value List|
||STOCK_CAT|Value|Description|
||STOCK_CAT|'C'||
||STOCK_CAT|'D'||
||STOCK_CAT|'L'||
||STOCK_CAT|'W'||
||REPL_METHOD<br>|||
||REJECT_STORE_ORD_IND|||
||REJECT_STORE_ORD_IND|Value List|Value List|
||REJECT_STORE_ORD_IND|Value|Description|






|Type|Column / Constraint Name|Details|Col4|
|---|---|---|---|
|||'N'||
|||'Y'||
||NON_SCALING_IND|||
||NON_SCALING_IND|Value List|Value List|
||NON_SCALING_IND|Value|Description|
||NON_SCALING_IND|'N'||
||NON_SCALING_IND|'Y'||
||RECALC_TYPE|||
||RECALC_TYPE|Value List|Value List|
||RECALC_TYPE|Value|Description|
||RECALC_TYPE|'A'||
||RECALC_TYPE|'N'||
||RECALC_TYPE|'Q'||

---

## Table: REPL_RESULTS_TEMP

**Description:** Temp table that is used to store item location level replenishment results information and the replenishment attributes used to drive the order quantities for the item location.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SOURCE_TYPE |  |  | Y | VARCHAR (6) | Contains a character indicator to determine where the recommended order quantity is coming from. It will only contain one valid value. This column, used in conjunction with the SOURCE_TYPE column on |
| 2 | STATUS |  |  | Y | VARCHAR (6) | Status of the record. Valid values include: W - Worksheet P - PO-Processed (is associated with a PO) D - Deleted |
| 3 | ORD_TEMP_SEQ_NO |  |  |  | NUMERIC (10) | This field will allow a link to be created between repl_results and ord_temp. It will be used by rplbld.pc when calculating due orders. Rplbld needs to have visibility to SSO and ESO from repl_results. |
| 4 | TSF_PO_LINK_NO |  |  |  | NUMERIC (12) | A reference number to link the item on the transfer to any purchase orders that have been created to allow the from location (i.e. warehouse) on the transfer to fulfill the transfer quantity to the to location (i.e store) on the transfer |
| 5 | ORDER_NO |  |  |  | NUMERIC (12) | Contains the number of the order on which the item/location has been placed. |
| 6 | ALLOC_NO |  |  |  | NUMERIC (10) | Contains the number of the order on which the item/location has been placed. |
| 7 | MASTER_ITEM |  |  | Y | VARCHAR (25) | Contains the item that is being reviewed and against which replenishment calculations are performed. The item placed on the order/transfer may not necessarily be this item, but may be a simple pack used in ordering this item or a substitute item used in transferring this item. |
| 8 | ITEM |  |  | Y | VARCHAR (25) | contains the item that is on replenishment. |
| 9 | ITEM_TYPE |  |  | Y | VARCHAR (1) | Contains a character indicator to determine if the item being ordered/transferred is the item actually being reviewed and against which replenishment calculations are performed (i.e. the master item), or if the item is a simple pack or substitute item being used to replenish the master item. Valid values include: M - Master item. This indicates that the item being reviewed is actually the item being ordered/transferred. P - Simple pack item. This indicates that the item being reviewed is actually being replenished through the use of a simple pack. S - Substitute item. This indicates that the item being reviewed is actually being replenished through the use of a substitute item. |
| 10 | DEPT |  |  | Y | NUMERIC (4) | The number of the department to which the item is attached |
| 11 | CLASS |  |  | Y | NUMERIC (4) | The number of the class to which the item is attached. |
| 12 | SUBCLASS |  |  | Y | NUMERIC (4) | The number of the subclass to which the item is attached. |
| 13 | BUYER |  |  |  | NUMERIC (4) | The number that uniquely identifies the buyer for the items department |
| 14 | PACK_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of the item in the pack being used to replenish the item. |
| 15 | LOC_TYPE |  |  | Y | VARCHAR (1) | contains the type of the location on replenishment. Valid values include Store, Warehouse. |
| 16 | LOCATION |  |  | Y | NUMERIC (10) | contains the numeric identifier of the location that is on replenishment. |
| 17 | PHYSICAL_WH |  |  |  | NUMERIC (10) | The number of the physical warehouse that is assigned to the virtual warehouse. |
| 18 | PRIMARY_REPL_SUPPLIER |  |  |  | NUMERIC (10) | Contains the numeric identifier of the supplier from which the specified location will source the replenishment demand for the specified item location. |
| 19 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | contains the country code of the supplier country that will be used to supply the replenishment demand for the specified item location. |
| 20 | POOL_SUPPLIER |  |  |  | NUMERIC (10) | This column will link the supplier, supplier/department, supplier/location, or the supplier/department/location to a master supplier |
| 21 | SUPP_UNIT_COST |  |  | Y | NUMERIC (20,4) | This field is used to store the unit cost of the item specified at the item/supplier/origin country/location level. It will never be modified. This field, in conjunction with the unit cost field, will determine the cost source to be used at the order/item/location level. It is stored in the suppliers currency. |
| 22 | UNIT_COST |  |  | Y | NUMERIC (20,4) | The unit cost of the item defaulted from the item/supplier/origin country/location level. It may be edited. This field, in conjunction with the supplier unit cost field, will determine the cost source to be used at the order/item/location level. It is stored in the suppliers currency. |
| 23 | ORIG_RAW_ROQ |  |  |  | NUMERIC (12,4) | Contains the original recommended order quantity (ROQ) before any recalculations were performed on the quantity. |
| 24 | ORIG_RAW_ROQ_PACK |  |  |  | NUMERIC (12,4) | Contains the original recommended order quantity (ROQ) for the items simple pack before any recalculations were performed on the quantity. |
| 25 | RAW_ROQ |  |  |  | NUMERIC (12,4) | Contains the raw recommended order quantity (ROQ) calculated by the system before any pack size rounding, proration, etc. was performed on the quantity |
| 26 | RAW_ROQ_PACK |  |  |  | NUMERIC (12,4) | Contains the raw recommended order quantity (ROQ) for the items simple pack calculated by the system before any pack size rounding, proration, etc. was performed on the quantity. |
| 27 | PRESCALE_ROQ |  |  |  | NUMERIC (12,4) | Contains the recommended order quantity (ROQ) for the item/location before order scaling processing was performed on the quantity and after pack size rounding, proration, ec. Was performed. |
| 28 | ORDER_ROQ |  |  |  | NUMERIC (12,4) | Contains the actual recommended order quantity (ROQ) for the item/location after all pack size rounding, proration and scaling logic is performed on the order quantity. |
| 29 | CONTRACT_ROQ |  |  |  | NUMERIC (12,4) | Contains the recommended order quantity (ROQ) for the item/location that was to be sourced using contracts. |
| 30 | SOURCED_ROQ |  |  |  | NUMERIC (12,4) | Contains the recommended order quantity (ROQ) that can actually be sourced using contracts. If the entire order quantity could be sourced from contracts, this number will be the same as the contract_roq. |
| 31 | LAST_ROUNDED_QTY |  |  |  | NUMERIC (12,4) | This column will hold the most recent system rounded order quantity value for the line item. |
| 32 | LAST_GRP_ROUNDED_QTY |  |  |  | NUMERIC (12,4) | This column will hold the last system rounded order quantity for the rounding group the location is apart of. |
| 33 | NET_INVENTORY |  |  |  | NUMERIC (12,4) | Contains the net inventory for the item/location. Includes stock on hand, orders, transfers, allocations, unavailable inventory, reserved inventory. |
| 34 | STOCK_ON_HAND |  |  |  | NUMERIC (12,4) | Contains the current stock on hand position of the item at the location. |
| 35 | PACK_COMP_SOH |  |  |  | NUMERIC (12,4) | Contains the current stock on hand position of the item at the location as a component of a pack. |
| 36 | ON_ORDER |  |  |  | NUMERIC (12,4) | Contains the current on-order position of the item at the location. |
| 37 | IN_TRANSIT_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of the item that is currently in transit to the location. |
| 38 | PACK_COMP_INTRAN |  |  |  | NUMERIC (12,4) | Contains the quantity of item that is currently in transit to the location as a component of a pack. |
| 39 | TSF_RESV_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of the item reserved for transfers from the location. |
| 40 | PACK_COMP_RESV |  |  |  | NUMERIC (12,4) | Contains the quantity of the item reserved for transfers from the location as a component of a pack. |
| 41 | TSF_EXPECTED_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of the item expected for transfers to the location. |
| 42 | PACK_COMP_EXP |  |  |  | NUMERIC (12,4) | Contains the quantity of the item expected for transfers to the location as a component of a pack. |
| 43 | RTV_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of the item waiting to be returned from the location. |
| 44 | ALLOC_IN_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of the item on allocations to the location. |
| 45 | ALLOC_OUT_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of the item on allocations out of the location. |
| 46 | NON_SELLABLE_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity of the item that is non-sellable at the location. |
| 47 | ORDER_POINT |  |  |  | NUMERIC (12,4) | Contains the level below which a recommended order quantity is generated if the net inventory is lower than the order point, for the item/location. |
| 48 | ORDER_UP_TO_POINT |  |  |  | NUMERIC (12,4) | Contains the level up to which a recommended order quantity should bring the net inventory of the item. |
| 49 | SAFETY_STOCK |  |  |  | NUMERIC (12,4) | Contains the quantity of the calculated safety stock for the item/location. |
| 50 | LOST_SALES |  |  |  | NUMERIC (12,4) | Contains the quantity of the calculated lost sales for the item/location. |
| 51 | MIN_SUPPLY_DAYS_FORECAST |  |  |  | NUMERIC (12,4) | Contains the forecasted amount over the minimum time supply days. Used for the time supply replenishment methods. |
| 52 | MAX_SUPPLY_DAYS_FORECAST |  |  |  | NUMERIC (12,4) | Contains the forecasted amount over the maximum time supply days. Used for the time supply replenishment methods. |
| 53 | TIME_SUPPLY_HORIZON_FORECAST |  |  |  | NUMERIC (12,4) | Contains the forecasted amount over the time supply horizon. Used for the time supply replenishment methods. |
| 54 | INV_SELL_DAYS_FORECAST |  |  |  | NUMERIC (12,4) | Contains the forecasted amount over the inventory selling days. Used for the dynamic replenishment methods. |
| 55 | REVIEW_TIME_FORECAST |  |  |  | NUMERIC (12,4) | Contains the forecasted amount over the review time. Used for the dynamic replenishment methods. |
| 56 | ORDER_LEAD_TIME_FORECAST |  |  |  | NUMERIC (12,4) | Contains the forecasted amount over the order lead time. Used for the dynamic replenishment methods. |
| 57 | NEXT_LEAD_TIME_FORECAST |  |  |  | NUMERIC (12,4) | Contains the Next review cycles lead time forecast. This value is used in the dynamic order quantity calculations. |
| 58 | ACCEPTED_STOCK_OUT |  |  |  | NUMERIC (20,4) | Contains the accepted stock out (ASO) quantity for the item/location. |
| 59 | ESTIMATED_STOCK_OUT |  |  |  | NUMERIC (20,4) | Contains the estimated stock out (ESO) quantity for the item/location. |
| 60 | DUE_IND |  |  | Y | VARCHAR (1) | Indicator to determine if the item/location is Due. This is where the estimated stock out (ESO) value of the item/location is greater than the accepted stock out (ASO) value of the item/location. Valid values include: Y - Yes. The item/location is due. N - No. The item/location is not due. |
| 61 | REVIEW_TIME |  |  |  | NUMERIC (3) | Contains the number of days in the review time used in the recommended order quantity calculations. |
| 62 | REPL_ORDER_CTRL |  |  | Y | VARCHAR (6) | Determines if the replenishment process will create an actual order/transfer line item for the item location if there is a need for the item location or if only a record is written to the Replenishment Results table. Valid values are Manual (a record is written to the Replenishment Results table - no order/transfer line item is created), Semi-Automatic (an order/transfer line item is created - the order line item will be added to an order in Worksheet status, the transfer line item will be added to a transfer in Approved status with a freight type of Hold), Automatic (an order/transfer line item is created - the order line item will be added to an order in Approved status, the transfer line item will be added to a transfer in Approved status). |
| 63 | REVIEW_CYCLE |  |  |  | VARCHAR (6) | Contains the number representing when the specified item location will be reviewed for replenishment. Valid values are 0 - 14. A 0 represents a weekly review cycle, a 1 represents a daily review cycle, a 2 represents a review cycle of every 2 weeks, a 3 represents a review cycle of every 3 weeks, etc. |
| 64 | STOCK_CAT |  |  | Y | VARCHAR (6) | Contains the sourcing strategy for the item/location relationship. Valid values are Direct to store (supplier to store), Cross-docked (supplier to store flowing through the warehouse), Warehouse stocked (warehouse to store). |
| 65 | SOURCE_WH |  |  |  | NUMERIC (10) | Contains the numeric identifier of the warehouse through which the specified item will cross-dock to the specified store for a stock category of Cross-docked; or the numeric identifier of the warehouse from which the specified item will be sourced for the specified store for a stock category of Warehouse Stocked. |
| 66 | ACTIVATE_DATE |  |  | Y | Date | Contains the date on which the item location will start to be reviewed for replenishment. |
| 67 | DEACTIVATE_DATE |  |  |  | Date | Contains the date at which time the item location will no longer be reviewed for replenishment. |
| 68 | PRES_STOCK |  |  |  | NUMERIC (12,4) | Contains the minimum amount of stock that needs to be on store shelves. The presentation stock is nor expected to satisfy consumer demand but is expected to remain in the fixture. |
| 69 | DEMO_STOCK |  |  |  | NUMERIC (12,4) | Contains the amount of stock that cannot be sold as new and is not counted as part of inventory in the replenishment calculations. The value in this field is the amount of stock used strictly for demonstration purposes. |
| 70 | REPL_METHOD |  |  |  | VARCHAR (6) | Contains the character code for the algorithm that will be used to calculate the recommended order quantity for the item location. Valid values include Constant, Min/Max, Floating point, Time Supply, Dynamic. |
| 71 | MIN_STOCK |  |  |  | NUMERIC (12,4) | Contains the required minimum number of units available for sale. Used in the Min/Max replenishment method algorithm. |
| 72 | MAX_STOCK |  |  |  | NUMERIC (12,4) | Contains the required maximum number of units available for sale. Used in the Constant, Min/Max and Floating Point replenishment method algorithms. |
| 73 | INCR_PCT |  |  |  | NUMERIC (12,4) | Contains the percentage by which the min and max stock levels will be multiplied when calculating the recommended order quantity. Ex. Actual max stock = max stock * increment percent. |
| 74 | MIN_SUPPLY_DAYS |  |  |  | NUMERIC (3) | Contains the minimum number of days of supply of stock to maintain. Used in the Time Supply replenishment method algorithm. |
| 75 | MAX_SUPPLY_DAYS |  |  |  | NUMERIC (3) | Contains the maximum number of days of supply of stock to maintain. Used in the Time Supply replenishment method algorithm. |
| 76 | TIME_SUPPLY_HORIZON |  |  |  | NUMERIC (3) | Contains the number of days over which an average sales rate is calculated to be used in the Time Supply replenishment method algorithm. |
| 77 | INV_SELLING_DAYS |  |  |  | NUMERIC (3) | Contains the number of required days of on hand inventory to satisfy demand. Used in the Dynamic replenishment method algorithm. |
| 78 | SERVICE_LEVEL |  |  |  | NUMERIC (5,2) | Contains the required measure of probability that demand is satisfied from on hand inventory. Used in the Dynamic replenishment method algorithm. |
| 79 | LOST_SALES_FACTOR |  |  |  | NUMERIC (5,2) | Contains the percentage of sales that could have occurred if inventory had been available through the order lead time. Used in the Dynamic replenishment method algorithm. |
| 80 | TERMINAL_STOCK_QTY |  |  |  | NUMERIC (12,4) | Contains the desired stock on hand for the item location when the end of season is reached. Used in the Seasonal Dynamic and Seasonal Time Supply replenishment methods. |
| 81 | SEASON_ID |  |  |  | NUMERIC (3) | Contains the numeric identifier of the season for which this item location is being replenished. Used in the Seasonal Dynamic and Seasonal Time Supply replenishment methods. |
| 82 | PHASE_ID |  |  |  | NUMERIC (3) | Contains the numeric identifier of the phase within the season for which this item location is being replenished. Used in the Seasonal Dynamic and Seasonal Time Supply replenishment methods. |
| 83 | REJECT_STORE_ORD_IND |  |  |  | VARCHAR (1) | Contains an indicator that determines if uploaded store orders should be rejected. If the indicator is N, then store orders for all need dates are valid. If Y, store orders with needs date on or after the NEXT_DELIVERY_DATE are valid. |
| 84 | NON_SCALING_IND |  |  | Y | VARCHAR (1) | Indicator used to determine if the item/location should be exempt from scaling during the order scaling process during the replenishment |
| 85 | MAX_SCALE_VALUE |  |  |  | NUMERIC (12,4) | Contains the limit up to which order scaling can increase the order quantity for the item/location during the replenishment process. If the replenishment method is C (constant), M (min/max), F (floating point) this value will be a quantity (ex. 1,000 eaches). If the replenishment method is a dynamic or time supply method this value will be a number of days. This field is intended to prevent run-away scaling processes as well as to protect items from being ordered to locations in such amounts that would result in perishability or obscelesence issues. |
| 86 | SUPP_LEAD_TIME |  |  |  | NUMERIC (4) | Contains the expected number of days required to send the order to the supplier and have the item ready for pickup to the initial receiving location. |
| 87 | PICKUP_LEAD_TIME |  |  |  | NUMERIC (4) | Contains the expected number of days required to ship the item from the supplier to the initial receiving location, which may be a store or warehouse defined on this record or the cross-dock warehouse through which the item will flow to get to the store defined on this record. |
| 88 | WH_LEAD_TIME |  |  |  | NUMERIC (4) | Contains the expected number of days required to move the item from the warehouse to the store defined on this record. |
| 89 | NEXT_ORDER_LEAD_TIME |  |  |  | NUMERIC (12,4) | Contains the Next review cycles lead time forecast. This value is used in the dynamic order quantity calculations. |
| 90 | COLT_ADDED |  |  |  | NUMERIC (12,4) | Contains the number of days added to the current lead time during the replenishment calculation due to a location being closed for delivery. |
| 91 | NOLT_ADDED |  |  |  | NUMERIC (12,4) | Contains the number of days added to the next order lead time during the replenishment calculation due to a location being closed for delivery.. |
| 92 | INNER_SIZE |  |  |  | NUMERIC (12,4) | Contains the inner size quantity for the item. |
| 93 | CASE_SIZE |  |  |  | NUMERIC (12,4) | Contains the case size quantity for the item. |
| 94 | TI |  |  |  | NUMERIC (12,4) | Number of shipping units (cases) that make up one tier of a pallet. Multiply TI x HI to get total number of units (cases) for a pallet |
| 95 | HI |  |  |  | NUMERIC (12,4) | Number of tiers that make up a complete pallet (height). Multiply TI x HI to get total number of units (cases) for a pallet. |
| 96 | STORE_ORD_MULT |  |  |  | VARCHAR (1) | Contains the store order multiple for the item |
| 97 | REPL_DATE |  |  | Y | Date | Determines if the item/location replenishment attributes have been changed and the item/location is eligible for replenishment recalculation and if so, what type of recalculation. Valid values include: N - No. Recalculation is not required. Q - Quantity. The order quantity should be updated using the quantity manually entered. A - Attributes. The order quantity should be updated by recalculating the order quantity based on the changed replenishment attributes. |
| 98 | RECALC_TYPE |  |  | Y | VARCHAR (1) | Contains the date of the replenishment run that created this record. |
| 99 | RECALC_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity the order should be set to if the recalc_type field is set to Quantity. |
| 100 | AUDSID |  |  |  | NUMERIC | This column will store the auditing session ID when the user selects this record to create purchase orders with from the Buyer Worksheet form. This value will be used to identify which records should be grouped together for the purchase order and rounding libraries per user. |

---

## Table: RPL_ALLOC_IN_TMP

**Description:** This is a temporary table being created to improve the performance of reqext.pc batch program.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | TO_LOC |  |  | Y | NUMERIC (10) | This field contains the location to which the allocation is being sent. The loc_type field determines if the location is a store or a warehouse. |
| 3 | TO_LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains the type of location in the location field. Valid values are Store and Warehouse. |
| 4 | NOT_BEFORE_DATE |  |  |  | Date | Contains the first date that delivery of the order will be accepted. |
| 5 | ALLOC_IN_QTY |  |  |  | NUMERIC (12,4) | Contains the total number of items allocated. |

---

## Table: RPL_DISTRO_TMP

**Description:** This is a temporary table being created to improve the performance of reqext.pc batch program.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | WH |  |  | Y | NUMERIC (10) | Contains the number of the warehouse location where the allocation will originate. |
| 3 | QTY_DISTRO |  |  |  | NUMERIC (12,4) | This column contains the final quantity that the external system plans on filling. |

---

## Table: RPL_NET_INVENTORY_TMP

**Description:** This table holds the calculated replenishment order quantity for item location.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  | Y | VARCHAR (25) | Holds the item on replenishment. |
| 2 | LOCATION |  |  | Y | NUMERIC (10) | Holds the location on replenishment. |
| 3 | LOC_TYPE |  |  | Y | VARCHAR (6) | Holds the location type. Valid values are 'S' (store) and 'W' (warehouse). |
| 4 | CURR_ORDER_LEAD_TIME |  |  |  | NUMERIC (5) | Holds the expected number of days for the current order to arrive. |
| 5 | NEXT_ORDER_LEAD_TIME |  |  |  | NUMERIC (5) | Holds the expected number of days for the next order to arrive. |
| 6 | DAYS_ADDED_TO_COLT |  |  |  | NUMERIC (3) | Holds the number of days added to current order lead time. |
| 7 | DAYS_ADDED_TO_NOLT |  |  |  | NUMERIC (3) | Holds the number of days added to next order lead time. |
| 8 | REVIEW_TIME |  |  |  | NUMERIC (3) | Holds the nubmer of days for order review. |
| 9 | NEXT_DELIVERY_DATE |  |  |  | Date | Contains the next delivery date calculated for the next review cycle. If, for the next review cycle, an order will be created that is calculated to arrive on Thursday, this field will be updated with Thursdays date. |
| 10 | NEXT_REVIEW_DATE |  |  |  | Date | Contains the next date the item location will be reviewed for replenishment. |
| 11 | ROQ |  |  | Y | NUMERIC (12,4) | Contains the calculated replenishment order quantity. |
| 12 | ORDER_POINT |  |  | Y | NUMERIC (12,4) | Contains the calculated order point. It is the inventory level after replenishment. |
| 13 | ORDER_UP_TO_POINT |  |  | Y | NUMERIC (12,4) | Contains the calculated order up to point in dynamic replenishment. |
| 14 | NET_INVENTORY |  |  |  | NUMERIC (12,4) | Contains item's net available inventory at the location. |
| 15 | STOCK_ON_HAND |  |  |  | NUMERIC (12,4) | Contains the item stock on hand at the location. |
| 16 | PACK_COMP_SOH |  |  |  | NUMERIC (12,4) | Contains the item's stock on hand as a component of a pack. |
| 17 | ON_ORDER |  |  |  | NUMERIC (12,4) | Contains the calculated on order quantity. |
| 18 | IN_TRANSIT_QTY |  |  |  | NUMERIC (12,4) | Contains the item's in transit quantity at the location. |
| 19 | PACK_COMP_INTRAN |  |  |  | NUMERIC (12,4) | Contains the item's in transit quatntiy as a component of a pack. |
| 20 | TSF_RESV_QTY |  |  |  | NUMERIC (12,4) | Contains the item quantity reserved to be transferred from the location. |
| 21 | PACK_COMP_RESV |  |  |  | NUMERIC (12,4) | Contains the item quantity reserved to be transferred from the location as part of a pack. |
| 22 | TSF_EXPECTED_QTY |  |  |  | NUMERIC (12,4) | Contains the item expected quantity at the location. |
| 23 | PACK_COMP_EXP |  |  |  | NUMERIC (12,4) | Contains the item expected quantity at the location as part of a pack. |
| 24 | RTV_QTY |  |  |  | NUMERIC (12,4) | Contains the item quantity to be returned to vendor from the location. |
| 25 | ALLOC_IN_QTY |  |  |  | NUMERIC (12,4) | Contains the item quantity to be allocation to the location. |
| 26 | ALLOC_OUT_QTY |  |  |  | NUMERIC (12,4) | Contains the item quantity to be allocation from the location. |
| 27 | NON_SELLABLE_QTY |  |  |  | NUMERIC (12,4) | Contains the non-sellable item quantity at the location. |
| 28 | SAFETY_STOCK |  |  |  | NUMERIC (12,4) | Contains the quantity for safety stock in dynamic replenishment. |
| 29 | LOST_SALES |  |  |  | NUMERIC (12,4) | Contains the quantity for lost sales due to stock out. |
| 30 | DUE_IND |  |  |  | VARCHAR (1) | Indicator that controls the due order processing in replenishment. Valid values are Y and N. |
| 31 | ASO |  |  |  | NUMERIC (20,4) | Contains the ASO amount in dynamic replenishment. |
| 32 | ESO |  |  |  | NUMERIC (20,4) | Contains the ESO amount in dynamic replenishment. |
| 33 | MIN_SUP_DAYS_FORECAST |  |  |  | NUMERIC (12,4) | Holds the quantity for the minumum number days of supply based on forecast. |
| 34 | MAX_SUP_DAYS_FORECAST |  |  |  | NUMERIC (12,4) | Holds the quantity for the maximum number days of supply based on forecast. |
| 35 | TIME_SUP_HORIZON_FORECAST |  |  |  | NUMERIC (12,4) |  |
| 36 | COLT_FORECAST |  |  |  | NUMERIC (12,4) | Holds the forecasted quantity for the current order lead time. |
| 37 | NOLT_FORECAST |  |  |  | NUMERIC (12,4) | Holds the forecasted quantity for the next order lead time. |
| 38 | REVIEW_TIME_FORECAST |  |  |  | NUMERIC (12,4) | Holds the forecasted quantity till the next order review time. |
| 39 | INV_SELLING_DAYS_FORECAST |  |  |  | NUMERIC (12,4) | Holds the forecased inventory selling days. It is used to calculate order up to point in dynamic replenishment. |
| 40 | SUPP_LEAD_TIME |  |  |  | NUMERIC (4) | Holds the number of days it takes for an order to arrive at the location from a supplier. |
| 41 | PICKUP_LEAD_TIME |  |  |  | NUMERIC (4) | ontains the expected number of days required to ship the item from the supplier to the initial receiving location, which may be a store or warehouse defined on this record or the cross-dock warehouse through which the item will flow to get to the store defined on this record. |
| 42 | WH_LEAD_TIME |  |  |  | NUMERIC (4) | Contains the expected number of days required to move the item from the warehouse to the store defined on this record. |
| 43 | LAST_DELIVERY_DATE |  |  |  | Date | Contains the last delivery date that replenishment was run for. If replenishment is run on Monday and an order is created that will arrive on Friday, this field will be updated with Fridays date. |

---

## Table: SOURCE_DLVRY_SCHED

**Description:** Maintain store and location data.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SOURCE | P |  | Y | NUMERIC (10) | Contains the warehouse or supplier number for which the schedule pertains. |
| 2 | SOURCE_TYPE | P |  | Y | VARCHAR (6) | Contains the type of source which the schedule is for. Supplier or Warehouse. |
| 3 | LOCATION | P |  | Y | NUMERIC (10) | The unique identifier for the store or warehouse. |
| 4 | LOC_TYPE |  |  | Y | VARCHAR (1) | Location type. Valid types are: S - store, W - warehouse. |
| 5 | DELIVERY_CYCLE |  |  | Y | VARCHAR (6) | Delivery frequency, can be daily, weekly, every two weeks, etc. |
| 6 | START_DATE |  |  | Y | Date | Starting date of the delivery for the particular store/location. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SOURCE_DLVRY_SCHED|PK||||SOURCE|ASC|
||||||SOURCE_TYPE|ASC|
||||||LOCATION|ASC|

---

## Table: SOURCE_DLVRY_SCHED_DAYS

**Description:** Maintain store and location schedules.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SOURCE | P |  | Y | NUMERIC (10) | Contains the warehouse or supplier number for which the schedule pertains. |
| 2 | SOURCE_TYPE | P |  | Y | VARCHAR (6) | Contains the type of source which the schedule is for. Supplier or Warehouse. |
| 3 | LOCATION | P |  | Y | NUMERIC (10) | The unique identifier for the store or warehouse. |
| 4 | LOC_TYPE |  |  | Y | VARCHAR (1) | Location type. Valid types are: S - store, W - warehouse. |
| 5 | DAY | P |  | Y | NUMERIC (1) | Day of the week. 1=Sunday, 2=Monday, 3=Tuesday, etc. |
| 6 | START_TIME |  |  | Y | Date | Delivery start time. The earliest start time is to take place on the given day. |
| 7 | END_TIME |  |  | Y | Date | Delivery end time. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SOURCE_DLVRY_SCHED_DAYS|PK||||SOURCE|ASC|
||||||SOURCE_TYPE|ASC|
||||||LOCATION|ASC|
||||||DAY|ASC|

---

## Table: SOURCE_DLVRY_SCHED_EXC

**Description:** This table will be modified to hold item level exceptions for suppliers and warehouses.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SOURCE | P |  | Y | NUMERIC (10) | Contains the warehouse or supplier number for which the schedule pertains. |
| 2 | SOURCE_TYPE | P |  | Y | VARCHAR (6) | Contains the type of source which the schedule is for. Supplier or Warehouse. |
| 3 | LOCATION | P |  | Y | NUMERIC (10) | The unique identifier for the store or warehouse. |
| 4 | DAY | P |  | Y | NUMERIC (1) | Day of the week. 1=Sunday, 2=Monday, 3=Tuesday, etc. |
| 5 | ITEM | P | F | Y | VARCHAR (25) | The unique identifier of the item. |
| 6 | LOC_TYPE |  |  | Y | VARCHAR (1) | Location type. Valid types are: S - store, W - warehouse. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SOURCE_DLVRY_SCHED_EXC|PK||||SOURCE|ASC|
||||||SOURCE_TYPE|ASC|
||||||LOCATION|ASC|
||||||ITEM|ASC|
||||||DAY|ASC|
|SOURCE_DLVRY_SCHED_EXC_I1|||||ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SOURCE_DLVY_SCH_EXC_LOC_TY|LOC_TYPE in ('W','S')<br>|
||CHK_SOURC_DLVY_SCHD_EXC_SOU_TY|SOURCE_TYPE IN ('SUP','W')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
|Column Level|LOC_TYPE||
