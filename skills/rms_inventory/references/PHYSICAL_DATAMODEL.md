# RMS Inventory & Stocktake Datamodel - Physical Data Model Reference

## Table: CARTON

**Description:** This table will hold a record for each carton to the destination location. A carton can contain items from multiple orders. The destination location could be the allocation location for cross-dock orders or the order location.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CARTON | P |  | Y | VARCHAR (20) | This column holds the carton number. |
| 2 | LOC_TYPE |  |  | Y | VARCHAR (1) | This column determines whether the location is a store or a warehouse. |
| 3 | LOCATION |  |  | Y | NUMERIC (10) | This column contains the final destination of the carton. For a cross-dock order this will be the allocation location, otherwise it will be the order location. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CARTON|PK||||CARTON|ASC|

---

## Table: INV_ADJ

**Description:** This table will contain and audit trail for inventory adjustment.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  | Y | VARCHAR (25) | Unique identifier for the item. |
| 2 | INV_STATUS |  | F |  | NUMERIC (2) | This field will have values made to non-saleable inventory types. |
| 3 | LOC_TYPE |  |  | Y | VARCHAR (1) | Contains the location type where the inventory adjustment occurred. Valid values are S for Store and W for Warehouse. |
| 4 | LOCATION |  |  | Y | NUMERIC (10) | Contains the location where the inventory adjustment occurred. |
| 5 | ADJ_QTY |  |  | Y | NUMERIC (12,4) | Contains the quantity the inventory was adjusted by. |
| 6 | REASON |  | F |  | NUMERIC (4) | Contains the reason for the inventory adjustment. This field will only have a value for saleable inventory types. |
| 7 | ADJ_DATE |  |  | Y | Date | Contains the date on which the inventory adjustment occurred. |
| 8 | PREV_QTY |  |  |  | NUMERIC (12,4) | Contains the quantity before the adjustment was applied for the item and status at the particular location. |
| 9 | USER_ID |  |  | Y | VARCHAR (30) | Contains the UserID for the user making the inventory adjustment. |
| 10 | ADJ_WEIGHT |  |  |  | NUMERIC (12,4) | Adjustment weight |
| 11 | ADJ_WEIGHT_UOM |  |  |  | VARCHAR (4) | Adjustment weight unit of measure |
| 12 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 13 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|INV_ADJ_I2|||||INV_STATUS|ASC|
|INV_ADJ_I1|||||REASON|ASC|
|INV_ADJ_I3|||||ITEM|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_INV_ADJ_LOC_TYPE|LOC_TYPE IN ('S', 'W','E')<br>|
|Column Level|LOC_TYPE||

---

## Table: INV_ADJ_REASON

**Description:** This table will hold reasons for inventory adjustments.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | REASON | P |  | Y | NUMERIC (4) | Contains a number which uniquely identifies the reason for an inventory adjustment. Note: To assign a specific reason code for inventory adjustment created for item transformation (for 2-legged transfers via a finisher), update record in code_detail table where code_type = ITRC and code = 1, and set code_desc = reason code (this field) assigned to item transformation. |
| 2 | COGS_IND |  |  | Y | VARCHAR (1) | Indicates the inventory adjustment reason code is associated with COGS. If Y then the inventory adjustment affect COGS If N then the inventory adjustment does not affect COGS |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_INV_ADJ_REASON|PK||||REASON|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_INV_ADJ_REASON_COGS_IND|COGS_IND IN ('Y','N')<br>|
|Column Level|COGS_IND||

---

## Table: INV_ADJ_REASON_TL

**Description:** This table holds the translated descriptions of inventory adjustment reason codes in all languages.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | REASON | P | F | Y | NUMERIC (4) | Contains the number which uniquely identifies the reason for the inventory adjustment. |
| 2 | LANG | P | F | Y | NUMERIC (6) | Contains the number which uniquely identifies a language. |
| 3 | REASON_DESC |  |  | Y | VARCHAR (120 ) | Holds the description of the inventory adjustment reason code in a given language. |
| 4 | ORIG_LANG_IND |  |  | Y | VARCHAR (1 ) | Indicates if the description is in the original language entered for the inventory adjustment reason code. It is set to â€˜Yâ€™ when the first record is written to the table for the inventory adjustment reason code. |
| 5 | REVIEWED_IND |  |  | Y | VARCHAR (1 ) | Indicates if the description needs to be reviewed for translation. It is set to â€˜Nâ€™ when the description in the original language is inserted or updated. We assume that clients will regularly run reports on all strings that are not reviewed (i.e. reviewed_ind = â€˜Nâ€™). When translation either provides a new string, or OKs that the existing string is correct, the reviewed_ind should be set to â€˜Yâ€™. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30 ) | This field contains the user that created the record. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30 ) | This field contains the user that last updated the record. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_INV_ADJ_REASON_TL|PK||||REASON|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_INV_ADJ_REASON_TL_ORIG_IND|ORIG_LANG_IND IN ('Y','N')<br>|
||CHK_INV_ADJ_REASON_TL_REV_IND|REVIEWED_IND IN ('Y','N')<br>|

---

## Table: INV_MOVE_UNIT_OPTIONS

**Description:** This table contains parameters used to control the behavior of RMS related to inventory movement. For example, parameters related to replenishment, transfers and RTVs.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ALLOC_METHOD |  |  | Y | VARCHAR (1) | The allocation method that will be used as the default for transfers and cross-dock purchase order allocations: Pro-rate (P), Allocation Quantity (A), or Custom (C). Note: the Custom option is included for customization. It does not drive any process in RMS if selected. |
| 2 | APPLY_PROF_PRES_STOCK |  |  | Y | VARCHAR (1) | The Presentation Stock Size Profile indicator determines whether the size profile concept will be applied to the presentation stock. Size profile refers to the ratio derived out of historical sales figures to give an estimate of the number of items of different sizes that need to be allocated to the destination store and applies only to fashion items within Allocation. Valid values are Y and N . Default value is 'N'. |
| 3 | AUTO_RCV_STORE |  |  | Y | VARCHAR (1) | Determines if RMS will automatically record the receipt of merchandise from a PO, warehouse allocation or transfer to a store based on notification from an external warehouse system of an incoming shipment. Valid values are Y and N. |
| 4 | CLOSE_OPEN_SHIP_DAYS |  |  |  | NUMERIC (3) | Number of days that shipments can stay open in Unmatched status (invc_match_status) before they are closed. |
| 5 | COST_MONEY |  |  |  | NUMERIC (12,4) | The cost of money, defined as the annualized percentage cost to borrow capital for investing. This value is currently used by the investment buy functionality only. |
| 6 | COST_OUT_STORAGE |  |  |  | NUMERIC (20,4) | The default cost of outside storage, expressed as the weekly cost per the unit of measure specified in COST_OUT_STORAGE_UOM. This value is held in the primary system currency and currently used by the investment buy functionality only. |
| 7 | COST_OUT_STORAGE_MEAS |  |  |  | VARCHAR (6) | Defines the default measure for the cost of outside storage (3rd Party). |
| 8 | COST_OUT_STORAGE_UOM |  |  |  | VARCHAR (4) | Contains the unit of measure to which the default cost of outside storage is applicable. The unit of measure may only be pallet or from the volume class. This value is currently used by the investment buy functionality only. Valid values are found on the UOM_CLAS table. |
| 9 | COST_WH_STORAGE |  |  |  | NUMERIC (20,4) | The default cost of warehouse storage, expressed as the weekly cost per the unit of measure specified in COST_WH_STORAGE_UOM. This value is held in the primary system currency and currently used by the investment buy functionality only. |
| 10 | COST_WH_STORAGE_MEAS |  |  |  | VARCHAR (6) | Defines the default measure for cost of warehouse storage (company-owned). This is used by investment buy functionality only. Valid values are Mass, Volume, Pallet, Case, Each and Stat Case. |
| 11 | COST_WH_STORAGE_UOM |  |  |  | VARCHAR (4) | The unit of measure to which the default cost of warehouse storage is applicable. The UOM may only be pallet or from the volume class as defined on the UOM_CLASS table. |
| 12 | DEFAULT_ALLOC_CHRG_IND |  |  |  | VARCHAR (1) | Specifies if Up-Charges should be defaulted to allocations. |
| 13 | DEFAULT_ORDER_TYPE |  |  | Y | VARCHAR (9) | This is the default order type associated with transfers and stand-alone allocations. Valid values include AUTOMATIC, WAVE, and MANUAL which are stored on the ORDER_TYPES table with a po_ind = N. This value is sent to WMS and determines how stock orders that are downloaded are processed if not otherwise specified. Wave uses the pre-defined Shipping Schedule and proceeds without intervention. AUTOMATIC does not require destinations to have a pre-defined shipping schedule, but does proceed without inter-vention. MANUAL allows intervention by selecting orders to be included in a wave. |
| 14 | DEFAULT_SIZE_PROFILE |  |  | Y | VARCHAR (1) | This field defines if the size profile should be defaulted in replenishment, when set to Y the Apply Size Profile checkbox on replenishment attributes screen is checked. When set to Y, replenishment applies size profiles for stores. Default value = N. |
| 15 | DEPT_LEVEL_TRANSFERS |  |  | Y | VARCHAR (1) | Specifies whether to enforce department level transfers for transfers created in RMS and via replenishment. If this field is set to Y, then each transfer created in RMS and via replenishment must contain only items within a single department. If this field is set to N, then items from multiple departments can appear on a single transfer. This flag is not enforced on transfers created or modified by SIM, RWMS, AIP or other external systems. |
| 16 | DISTRIBUTION_RULE |  |  |  | VARCHAR (6) | Distribution rule to use when the actual quantity to be distributed among virtual warehouses is different from the expected quantity. For example, if the quantity received is greater than quantity ordered. The valid values are determined by code_type DRUL on the code_detail table, and includes Proration, Minimum to Maximum and Maximum to Minimum. |
| 17 | DUPLICATE_RECEIVING_IND |  |  | Y | VARCHAR (1) | Determine whether or not duplicate receiving will be allowed against the same carton on the same receipt. |
| 18 | INCREASE_TSF_QTY_IND |  |  | Y | VARCHAR (1) | Controls if the transfer quantity can be increased once a transfer has been approved. If Y, then transfer quantity can be changed if there is outstanding quantity on the transfer (e.g. transfer qty > distributed/selected/shipped qty). When N, a user can only update the transfer to indicate total stock on hand should be shipped instead of a manually entered quantity. |
| 19 | INTERCOMPANY_TRANSFER_BASIS |  |  | Y | VARCHAR (1) | Intercompany Transfer Basis determines if intercompany transfers are based on 'T'-transfer entities or 'B' - set of books indicator.Z |
| 20 | INV_HIST_LEVEL |  |  | Y | VARCHAR (1) | History Level specifies how inventory history should be captured in the weekly inventory history programs. Valid values for the field are: 'N' - for no inventory history, 'I' - end of week inventory for items that have had sales over the past week, and 'A' - to capture end of week inventory for all items regardless of whether they have had sales. |
| 21 | LOC_ACTIVITY_IND |  |  | Y | VARCHAR (1) | Specifies if the location activity schedules are used in the replenishment calculations. Activity schedule defines when stores and warehouses are closed or not available e.g, stock take, public holidays, Sunday, etc. |
| 22 | LOC_DLVRY_IND |  |  | Y | VARCHAR (1) | Specifies if the location delivery schedules are used in the replenishment calculations. Delivery schedules defines on what days suppliers and warehouse will make deliveries. |
| 23 | LOOK_AHEAD_DAYS |  |  |  | NUMERIC (3) | Number of days before a cost event (deal end or cost increase) that the investment buy opportunity calculation will begin considering the event. This value is currently used by the investment buy functionality only. |
| 24 | MAX_SCALING_ITERATIONS |  |  |  | NUMERIC (4) | The maximum number of iterations the constraint scaling process should perform when attempting to find a valid solution for an order before the process should stop. |
| 25 | MAX_WEEKS_SUPPLY |  |  |  | NUMERIC (3) | The default maximum weeks of supply to use in the investment buy opportunity calculation. The investment buy opportunity calculation will not recommend an order quantity that would stock the associated location (currently warehouses only) beyond this number of weeks. This value is currently used by the investment buy functionality only. |
| 26 | ORD_WORKSHEET_CLEAN_UP_DELAY |  |  | Y | NUMERIC (3) | Specifies the number of days after an order is created that that an order in Worksheet status that has never been approved will remain in the system. After this number of days, the order will be purged from the system. |
| 27 | RAC_RTV_TSF_IND |  |  |  | VARCHAR (1) | Determines whether RTV (created throught MRT functionality) and RAC (Reallocation Transfer) transfer types will be allowed to be created with locations that result in intercompany transfers. If set to A (Intra-Company), the system will not allow users to select locations on a transfer that cross entities. If set to E (Intercompany) then there is not a system level restriction on locations crossing entities for these types of transfers. |
| 28 | REJECT_STORE_ORD_IND |  |  | Y | VARCHAR (1) | The Reject Store Orders indicator determines if uploaded store orders should ever be rejected. If the indicator is N, then store orders for all need dates are valid. If set to 'Y', then only store orders with needs date on or after the NEXT_DELIVERY_DATE on REPL_ITEM_LOC are valid. |
| 29 | REPL_ORDER_DAYS |  |  |  | NUMERIC (3) | The number of days after the replenishment date plus the maximum lead time of the item/locations on the order that the not after date should fall for orders created by the replenishment process (i.e. not after date = replenishment date + max. lead time + replenishment order days). |
| 30 | RTV_NAD_LEAD_TIME |  |  | Y | NUMERIC (4) | Determines the number of days between the Tsf Not After Date and the RTV Not After Date for MRT generated RTVs and transfers. |
| 31 | RTV_UNIT_COST_IND |  |  | Y | VARCHAR (1) | The value used to set the default unit cost on an RTV (Return to Vendor). Valid values are R (last receipt cost), S (standard cost), or A (average cost). |
| 32 | SHIP_RCV_STORE |  |  | Y | VARCHAR (1) | Determines if RMS online will be used for shipping and receiving at store locations. If so, online access to these functions will be enabled for store locations. |
| 33 | SHIP_RCV_WH |  |  | Y | VARCHAR (1) | Determines if RMS online will be used for shipping and receiving at warehouse locations. If so, online access to these functions will be enabled for warehouse locations. |
| 34 | STORAGE_TYPE |  |  |  | VARCHAR (6) | Indicates the type of storage that should be used as the default storage cost when calculating investment buy opportunities. Valid values are Warehouse and Outside. This value is currently used by the investment buy functionality only. |
| 35 | STORE_PACK_COMP_RCV_IND |  |  | Y | VARCHAR (1) | Store pack component receiving, if set to Y, stores will do receiving at the component level, not the carton/pack level. This flag is used in conjunction with the tampered carton functionality in RMS. |
| 36 | WF_DEFAULT_WH |  |  |  | NUMERIC (10) | Indicates the warehouse that will be used as the default costing or sourcing warehouse if default_wh is not defined for the Franchise store during item/franchise store ranging or franchise order upload. |
| 37 | TARGET_ROI |  |  |  | NUMERIC (12,4) | The default return on investment that must be met or exceeded for the investment buy opportunity to recommend an order quantity. This value is currently used by the investment buy functionality only. |
| 38 | TSF_AUTO_CLOSE_STORE |  |  | Y | VARCHAR (1) | Indicates whether or not, when a transfer receiving location is store, a shipment is closed after receipt. If set to N, then the Document Close (DOCCLOSE) batch process will apply rules to determine whether the transfer can be closed. |
| 39 | TSF_AUTO_CLOSE_WH |  |  | Y | VARCHAR (1) | Indicates whether or not, when a transfer receiving location is warehouse, a shipment is closed after receipt. If set to N, then the |
| 40 | TSF_CLOSE_OVERDUE |  |  | Y | VARCHAR (1) | Indicator to close the unshipped/partially shipped transfers via the batch process tsfclose. A transfer is said to be overdue if it remains unprocessed for more than specified number of days. The number of days after which the transfer will be considered overdue are configured in WS_AUTO_CLOSE_DAYS, WW_AUTO_CLOSE_DAYS, SS_AUTO_CLOSE_DAYS and SW_AUTO_CLOSE_DAYS. Default value if NULL is N. |
| 41 | SIM_FORCE_CLOSE_IND |  |  |  | VARCHAR (2) | If this value is not null, it will override the value of TSF_FORCE_CLOSE_IND for store-to-store transfers only. Valid values are: * BL (Both Locations): The sending location on-hand quantity will be increased and 30/32 records will be written to reverse the shipment by the quantity which is not received. Note: the functionality described for BL will be applied for all over receipts of store-to-store transfers, regardless of the setting of this parameter for consistency with how SIM handles over receipts. * NL (No Loss): The sending location on-hand quantity will be increased and 22 records will be written at both locations for the quantity which is not received. *RL (Receiving Location): The sending location on-hand quantity will not be changed. A 22 record will be written at the receiving location to account for the quantity which is not received. *SL (Sending Location): The sending location on-hand quantity will not be changed. 30/32 records will be written to reverse the shipment by the quantity which is not received and a 22 record will be written at the sending location to account for the same quantity. This option is provided for compatibility with the options available in the SIM application for store-to-store transfers. |
| 42 | TSF_FORCE_CLOSE_IND |  |  | Y | VARCHAR (2) | This determines the inventory updates are made for under received quantities on receipt. Valid values include: * BL (Both Locations): The sending location on-hand quantity will be increased and 30/32 records will be written to reverse the shipment by the quantity which is not received. * NL (No Loss): The sending location on-hand quantity will be increased and 22 records will be written at both locations for the quantity which is not received. * RL (Receiving Location): The sending location on-hand quantity will not be changed. A 22 record will be written at the receiving location to |
| 43 | TSF_OVER_RECEIPT_IND |  |  | Y | VARCHAR (2) | This determines the inventory updates are made for overage quantities on receipt. Valid values include: * BL (Both Locations): The sending location on-hand quantity will be reduced and 30/32 records will be written to increase the shipment by the overage qty. * NL (No Loss): The sending location on-hand quantity will be reduced and 22 records will be written at both locations for the overage quantity. * RL (Receiving Location): The sending location on-hand quantity will not be changed. A 22 record will be written at the receiving location to account for the overage. * SL (Sending Location): The sending location on-hand quantity will not be changed. 30/32 records will be written to increase the shipment by the overage qty and a 22 record will be written at the sending location to account for the overage. |
| 44 | TSF_MD_STORE_TO_STORE_SND_RCV |  |  | Y | VARCHAR (1) | Indicates, for a store to store transfer, which location would take the markdown when the retail price of an item is different at the sending and receiving locations. Valid values are S - Sending or R - Receiving. |
| 45 | TSF_MD_STORE_TO_WH_SND_RCV |  |  | Y | VARCHAR (1) | Indicates, for a store to warehouse transfer, which location would take the markdown when the retail price of an item is different at the sending and receiving locations. Valid values are S - Sending or R - Receiving. |
| 46 | TSF_MD_WH_TO_STORE_SND_RCV |  |  | Y | VARCHAR (1) | Indicates, for a warehouse to store transfer, which location would take the markdown when the retail price of an item is different at the sending and receiving locations. Valid values are S - Sending or R - Receiving. |
| 47 | TSF_MD_WH_TO_WH_SND_RCV |  |  | Y | VARCHAR (1) | Indicates, for a warehouse to warehouse transfer, which location would take the markdown when the retail price of an item is different at the sending and receiving locations. Valid values are S - Sending or R - Receiving. |
| 48 | TSF_PRICE_EXCEED_WAC_IND |  |  | Y | VARCHAR (1) | Determines if the transfer price can exceed the WAC of the from location on intercompany transfers. |
| 49 | SS_AUTO_CLOSE_DAYS |  |  |  | NUMERIC (2) | The numbers of days after the last receipt that store to store stock orders will be closed automatically. |
| 50 | WS_AUTO_CLOSE_DAYS |  |  |  | NUMERIC (2) | This is the number of days after the create date or shipped date that warehouse to store stock orders will be closed automatically if not fully received. |
| 51 | SW_AUTO_CLOSE_DAYS |  |  |  | NUMERIC (2) | The number of days after the last receipt that store to warehouse stock orders will be closed automatically. |
| 52 | WW_AUTO_CLOSE_DAYS |  |  |  | NUMERIC (2) | This is the number of days after the create date or shipped date that warehouse to warehouse stock orders will be closed automatically if not fully received. |
| 53 | WF_ORDER_LEAD_DAYS |  |  |  | NUMERIC (3) | The number of days in advance of the need date that franchise orders should be processed. |
| 54 | WH_CROSS_LINK_IND |  |  | Y | VARCHAR (1) | Indicates if the WH/Cross Link stock category will be used in replenishment. If the indicator is Y, then RMS will allow orders to be created for warehouses above the quantity currently planned to be available for in a warehouse, by creating a PO into the warehouse to ensure quantity will be available. If N, this will not be displayed to users as a valid stock category for replenishment in RMS. |
| 55 | WRONG_ST_RECEIPT_IND |  |  | Y | VARCHAR (1) | Determines whether or not the system will handle wrong store receipts, meaning the a store other than the intended store received a transfer. Valid values are Y and N. When this indicator is 'Y', if stock order is received at the wrong store, then RMS will adjust inventory and stock ledger transactions at both the actual receiving store and the intended location as though the actual receiving store was always the intended location. |
| 56 | CREATE_ID |  |  | Y | VARCHAR (30) | Stores the Oracle username of the one who inserted the first record. This field is required by the database. |
| 57 | CREATE_DATETIME |  |  | Y | Date | The date and time of when the record was created in the table. This value should only be populated on insert - it should never be updated. |
| 58 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | The Oracle username of the one who most recently updated this record. |
| 59 | LAST_UPDATE_DATETIME |  |  | Y | Date | The date time stamp of the most recent update by the user. |

---

## Table: INV_RESV_UPDATE_TEMP

**Description:** This temporary table is used for inventory feed to AIP. This holds the location which had a change in customer reservation or back order quantity

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LOCATION |  |  | Y | NUMERIC (10) | Indicates the location (store or warehouse) for which customer reservation or back order quantity has been updated. |
| 2 | LOC_TYPE |  |  | Y | VARCHAR (1) | Indicates if the location is a S - Store or a W - Warehouse. |
| 3 | PROCESS_STATUS |  |  | Y | VARCHAR (1) | Indicates the processing status. Valid values are N - New, I - Inprogress. |
| 4 | CREATE_DATETIME |  |  | Y | Date | Contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | Contains the USER that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | Contains the timestamp when the record was last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Contains the USER that last updated the record. |

---

## Table: INV_STATUS_CODES

**Description:** This table will contain valid inventory status codes

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INV_STATUS_CODE | P |  | Y | VARCHAR (10) | Contains a unique inventory status code |
| 2 | INV_STATUS |  | F |  | NUMERIC (2) | The inventory status type associated with this inventory status code |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_INV_STATUS_CODES|PK||||INV_STATUS_CODE|ASC|
|INV_STATUS_CODES_I1|||||INV_STATUS|ASC|

---

## Table: INV_STATUS_CODES_TL

**Description:** This table holds the translated descriptions of inventory status codes in all languages.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INV_STATUS_CODE | P | F | Y | VARCHAR (10) | Contains the number which uniquely identifies the inventory status code. |
| 2 | LANG | P | F | Y | NUMERIC (6) | Contains the number which uniquely identifies a language. |
| 3 | INV_STATUS_CODE_DESC |  |  | Y | VARCHAR (120 ) | Holds the description of the inventory status code in a given language. |
| 4 | ORIG_LANG_IND |  |  | Y | VARCHAR (1 ) | Indicates if the description is in the original language entered for the inventory status code. It is set to â€˜Yâ€™ when the first record is written to the table for the inventory status code. |
| 5 | REVIEWED_IND |  |  | Y | VARCHAR (1 ) | Indicates if the description needs to be reviewed for translation. It is set to â€˜Nâ€™ when the description in the original language is inserted or updated. We assume that clients will regularly run reports on all strings that are not reviewed (i.e. reviewed_ind = â€˜Nâ€™). When translation either provides a new string, or OKs that the existing string is correct, the reviewed_ind should be set to â€˜Yâ€™. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30 ) | This field contains the user that created the record. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30 ) | This field contains the user that last updated the record. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_INV_STATUS_CODE_TL|PK||||INV_STATUS_CODE|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_INV_ST_CODE_TL_ORIG_IND|ORIG_LANG_IND IN ('Y', 'N')<br>|
||CHK_INV_ST_CODE_TL_REV_IND|REVIEWED_IND IN ('Y', 'N')<br>|

---

## Table: INV_STATUS_QTY

**Description:** For any non-salable merchandise at a specific location, this table will hold the item, a status from inv_status_types, the location and the quantity.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P | F | Y | VARCHAR (25) | Identifier of item for which there is non-salable merchandise. |
| 2 | INV_STATUS | P | F | Y | NUMERIC (2) | The non-salable inventory status type for the SKU. |
| 3 | LOC_TYPE | P |  | Y | VARCHAR (1) | This field designates whether the non-salable inventory is at a store or warehouse. Valid values are S for store and W for warehouse. |
| 4 | LOCATION | P |  | Y | NUMERIC (10) | The specific store or warehouse where the inventory is kept. |
| 5 | QTY |  |  | Y | NUMERIC (12,4) | The amount of inventory that is in the inventory status at the location. |
| 6 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time will be used in export processing. This value should only be populated on insert - it should never be updated. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This field is required by the database. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This field is required by the database. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_INV_STATUS_QTY|PK||||ITEM|ASC|
||||||INV_STATUS|ASC|
||||||LOC_TYPE|ASC|
||||||LOCATION|ASC|
|INV_STATUS_QTY_I1|||||INV_STATUS|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_INV_STATUS_QTY_LOC_TYPE|LOC_TYPE IN ('S', 'W','E')<br>|
|Column Level|LOC_TYPE||

---

## Table: INV_STATUS_TYPES

**Description:** This table will contain valid inventory types for non-salable merchandise.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INV_STATUS | P |  | Y | NUMERIC (2) | Contains a number which uniquely identifies an inventory status. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_INV_STATUS_TYPES|PK||||INV_STATUS|ASC|

---

## Table: INV_STATUS_TYPES_TL

**Description:** This table holds the translated descriptions of inventory status types in all languages.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INV_STATUS | P | F | Y | NUMERIC (2) | Contains the number which uniquely identifies the inventory status types |
| 2 | LANG | P | F | Y | NUMERIC (6) | Contains the number which uniquely identifies a language. |
| 3 | INV_STATUS_DESC |  |  | Y | VARCHAR (120 ) | Holds the description of the inventory status types in a given language. |
| 4 | ORIG_LANG_IND |  |  | Y | VARCHAR (1 ) | Indicates if the description is in the original language entered for the inventory status type. It is set to â€˜Yâ€™ when the first record is written to the table for the inventory status types. |
| 5 | REVIEWED_IND |  |  | Y | VARCHAR (1 ) | Indicates if the description needs to be reviewed for translation. It is set to â€˜Nâ€™ when the description in the original language is inserted or updated. We assume that clients will regularly run reports on all strings that are not reviewed (i.e. reviewed_ind = â€˜Nâ€™). When translation either provides a new string, or OKs that the existing string is correct, the reviewed_ind should be set to â€˜Yâ€™. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30 ) | This field contains the user that created the record. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30 ) | This field contains the user that last updated the record. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_INV_STATUS_TL|PK||||INV_STATUS|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_INV_STATUS_TL_ORIG_IND|ORIG_LANG_IND IN ('Y', 'N')<br>|
||CHK_INV_STATUS_TL_REV_IND|REVIEWED_IND IN ('Y', 'N')<br>|

---

## Table: INV_TRACK_UNIT_OPTIONS

**Description:** This table contains parameters used to control the behavior of RMS related to inventory tracking, primarily related to stock counts.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CYCLE_COUNT_LAG_DAYS |  |  |  | NUMERIC (2) | The Days Prior to Stock Count Variance Processing parameter indicates the number of days before stock count variances will be automatically processed. A value of zero specifies that variances will be processed immediately. |
| 2 | STAKE_AUTO_PROCESSING |  |  |  | VARCHAR (2) | The Stock Count Automatic Processing indicator is used to indicate whether stock counts will be automatically processed after the designated number of elapsed days. Valid values are Y, N, S or NULL. When auto-processing is 'Y' and the count occurred x days ago, based on the CYCLE_COUNT_LAG_DAYS, then the Stock Count Stock on Hand Updates (stkvar) batch process will automatically process stock counts that have a snapshot and count. When the value is set to 'S', then RMS will automatically process both the unit and value components of the count. When value is set to N or NULL, user has to manually ""approve"" the count on-line so that it is processed through this batch process. When integrating with SIM and RWMS, it is recommended that this be set to Y or S in order to keep RMS in synch with inventory levels in SIM and RWMS. |
| 3 | STAKE_COST_VARIANCE |  |  | Y | NUMERIC (20,4) | Contains the inventory value variance at cost that will trigger exception reporting in the Stock Count module. Cost variances (plus or minus) smaller than this value will not be reflected in the Stock Count Variance report, unless one of the other criteria (see retail and unit variances parameters) is exceeded. However, all variances will be reflected in inventory updates and shrinkage calculations on the stock ledger. |
| 4 | STAKE_RETAIL_VARIANCE |  |  | Y | NUMERIC (20,4) | Contains the inventory value variance at retail that will trigger exception reporting in the Stock Count module. Retail variances (plus or minus) smaller than this value will not be reflected in the report, unless one of the other criteria (see cost and unit variance parameters) is exceeded. However, all variances will be reflected in inventory updates and shrinkage calculations on the stock ledger. |
| 5 | STAKE_LOCKOUT_DAYS |  |  | Y | NUMERIC (2) | Contains the number of days before a stock count date that changes |
| 6 | STAKE_REVIEW_DAYS |  |  | Y | NUMERIC (2) | This field contains the minimum number of days before a scheduled stock count that the stock count actually gets generated in the system. |
| 7 | STAKE_UNIT_VARIANCE |  |  | Y | NUMERIC (12,4) | Contains the number of units of variance that will trigger exception reporting in the Stock Count module. Unit variances (plus or minus) smaller than this value will not be reflected in the report, unless one of the other criteria (see cost and retail variance parameters) is exceeded. However, all variances will be reflected in inventory updates and shrinkage calculations on the stock ledger. |
| 8 | CREATE_ID |  |  | Y | VARCHAR (30) | Stores the Oracle username of the one who inserted the first record. This field is required by the database. |
| 9 | CREATE_DATETIME |  |  | Y | Date | The date and time of when the record was created in the table. This value should only be populated on insert - it should never be updated. |
| 10 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | The Oracle username of the one who most recently updated this record. |
| 11 | LAST_UPDATE_DATETIME |  |  | Y | Date | The date time stamp of the most recent update by the user. |

---

## Table: MRT

**Description:** This table supports the concept of a Mass Return Transfer Number and other attributes to maintain multiple transfers and Rtvs. This table will hold the header information and the details to create an Rtv if an Rtv is applicable.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | MRT_NO | P |  | Y | NUMERIC (10) | Mass Return Transfer No. Unique number identifying the mass return transfer, populated by an oracle sequence. |
| 2 | MRT_DESC |  |  | Y | VARCHAR (120) | A descriptive name for the MRT to make identification of an MRT easier. |
| 3 | WH |  | F | Y | NUMERIC (10) | The Warehouse which will be receiving the merchandise from the MRT. This is the primary key to the table WH. |
| 4 | MRT_TYPE |  |  | Y | VARCHAR (6) | Depending on the setting of the system_options RTV/RAC indicator, this field needs to be specified to be across legal entities or not. If the indicator is set to intra-company transfer, then the value will default to intra-company transfer. If the indicator is set to inter-company transfer, then the user can select inter-company or intra-company. This selection will determine if the transfer price or transfer cost is editable on an Mass Return Transfer. |
| 5 | MRT_STATUS |  |  | Y | VARCHAR (1) | The status of the Mass Return Transfer. Valid values are: I - Input S - Submitted A - Approved R - RTV created C - Closed |
| 6 | TSF_NOT_AFTER_DATE |  |  | Y | Date | This field holds the last day upon which a store can ship the requested merchandise to the warehouse. |
| 7 | INVENTORY_TYPE |  |  | Y | VARCHAR (6) | Contains the values Available or Unavailable to indicate what type of stock is being returned CODE_TYPE = TSIT. |
| 8 | QUANTITY_TYPE |  |  | Y | VARCHAR (6) | Indicates whether to include the entire available SOH for the Mass Return Transfer, or a manually entered quantity CODE_TYPE = QYTP |
| 9 | CURRENCY_CODE |  | F | Y | VARCHAR (3) | The currency code that the user will see the whole of the mass transfer in. |
| 10 | CLOSE_DATE |  |  |  | Date | The date the Mass Return Transfer status was set to Closed. |
| 11 | COMMENT_DESC |  |  |  | VARCHAR (2000) | Additional information concerning the MRT or RTV. |
| 12 | SUPPLIER |  | F |  | NUMERIC (10) | Supplier number for RTV. |
| 13 | RTV_REASON |  |  |  | VARCHAR (6) | This is the Rtv reason used in creating the RTV record and the values of which are held in the CODE_HEAD CODE_TYPE LTVR. |
| 14 | RTV_CREATE_DATE |  |  |  | Date | The date upon which the RTV will be auto- generated. If this date is not filled in, the RTV will never be auto generated. |
| 15 | RTV_NOT_AFTER_DATE |  |  |  | Date | This date indicates the last date that an RTV can be send to a supplier. It will populate the not after date on the RTV_HEAD table. |
| 16 | CREATE_RTV_STATUS |  |  |  | VARCHAR (6) | tatus of the RTV. This will only be activated if the RTV creation date has been entered. CODE_TYPE = RTVS. |
| 17 | REF_AUTH_NUM |  |  |  | VARCHAR (12) | Authorisation Number for the RTV: user-entered, usually furnished by the supplier. |
| 18 | RESTOCK_PCT |  |  |  | NUMERIC (20,4) | The percentage of cost charged by the supplier for re-stocking. |
| 19 | INCLUDE_WH_INV |  |  |  | VARCHAR (1) | Indicates whether to include the existing receiving warehouse quantities in the RTV. |
| 20 | TSF_CREATE_DATE |  |  |  | Date | Holds the date when the associated transfers have been created. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_MRT|PK||||MRT_NO|ASC|
|MRT_I1|||||RTV_CREATE_DATE|ASC|
||||||TSF_NOT_AFTER_DATE|ASC|
|MRT_I3|||||SUPPLIER|ASC|
|MRT_I2|||||CURRENCY_CODE|ASC|
|MRT_I4|||||WH|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_MRT_INCLUDE_WH_INV|INCLUDE_WH_INV in ('Y','N')<br>|
||CHK_MRT_MRT_STATUS|MRT_STATUS in ('I','A','S','C','R')<br>|
||CHK_MRT_QUANTITY_TYPE|QUANTITY_TYPE in ('A','M')<br>|
|Column Level|MRT_STATUS||






|Type|Column / Constraint<br>Name|Details|
|---|---|---|
||QUANTITY_TYPE||

---

## Table: MRT_ITEM

**Description:** This table supports the concept of a Mass Return Transfer Number and other attributes to maintain multiple transfers and Rtvs. The table will hold all the items relating to a Mass return Transfer.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | MRT_NO | P | F | Y | NUMERIC (10) | Mass Return Transfer No. Unique number identifying the Mass Return Transfer. |
| 2 | ITEM | P | F | Y | VARCHAR (25) | This field holds the Item number. |
| 3 | RESTOCK_PCT |  |  |  | NUMERIC (12,4) | The percentage of the cost charged by the supplier. This could be different than the restocking percentage held in MASS_RETURN_TRANSFRES if the user decides to change the percentage at item level. |
| 4 | SELECTED_IND |  |  | Y | VARCHAR (1) | This field holds the selected indicator and is used as an indicator as to which transfers get created when the Mass return transfer is approved. |
| 5 | RTV_COST |  |  |  | NUMERIC (20,4) | This will hold the RTV cost for the item and will usually hold the unit cost value of the item at the receiving warehouse. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_MRT_ITEM|PK||||MRT_NO|ASC|
||||||ITEM|ASC|
|MRT_ITEM_I1|||||ITEM|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_MRI_SELECTED_IND|SELECTED_IND in ('Y','N')<br>|
|Column Level|SELECTED_IND||

---

## Table: MRT_ITEM_LOC

**Description:** This table supports the concept of a Mass Return Transfer Number and other attributes to maintain multiple transfers and Rtvs. The table will hold all the items/location combinations relating to a Mass Return Transfer.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | MRT_NO | P | F | Y | NUMERIC (10) | This field holds the Item number. |
| 2 | ITEM | P | F | Y | VARCHAR (25) | This field holds the Item number. |
| 3 | LOCATION | P |  | Y | NUMERIC (10) | Location number of the warehouse or store. |
| 4 | LOC_TYPE |  |  | Y | VARCHAR (1) | This field holds the Location Type Valid values are: W - Warehouse S - Store |
| 5 | RETURN_AVAIL_QTY |  |  | Y | NUMERIC (12,4) | This field holds the available quantity that could be returned at the time the MRT was created. |
| 6 | TSF_QTY |  |  | Y | NUMERIC (12,4) | This field holds the expected quanity that could be returned. This could be the RETURN_AVAIL_QTY or a user defined quantity. |
| 7 | RECEIVED_QTY |  |  |  | NUMERIC (12,4) | This field holds the actual quantity received for the item/location combination and will be populated via the RIB. |
| 8 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This field holds the base Unit Retail Price for the item/location. |
| 9 | UNIT_COST |  |  |  | NUMERIC (20,4) | This field holds the Last Receipt or Weighted Average Cost and is the original cost. |
| 10 | TSF_COST |  |  |  | NUMERIC (20,4) | This field holds the transfer cost used for this transfer. |
| 11 | TSF_PRICE |  |  |  | NUMERIC (20,4) | This field holds the transfer price used for this transfer. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_MRT_ITEM_LOC|PK||||MRT_NO|ASC|
||||||ITEM|ASC|
||||||LOCATION|ASC|
|MRT_ITEM_LOC_I1|||||MRT_NO|ASC|
||||||LOCATION|ASC|
||||||ITEM|ASC|
|MRT_ITEM_LOC_I2|||||ITEM|ASC|

### Constraints

|Type|Column /<br>Constraint Name|Details|
|---|---|---|
|Table Level|CHK_MRL_LOC_TYPE|LOC_TYPE in ('W','S')<br>|
|Column Level|LOC_TYPE||

---

## Table: MRT_L10N_EXT

**Description:** This is the LFAS storage table for the entity MRT

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | MRT_NO | P | F | Y | NUMERIC (10) | Mass Return Transfer No. Unique number identifying the mass return transfer,populated by an oracle sequence. |
| 2 | L10N_COUNTRY_ID | P | F | Y | VARCHAR (3) | This column holds the country this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this country in its localization pack. |
| 3 | GROUP_ID | P | F | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this country/attribute group in the countrys localization pack. |
| 4 | VARCHAR2_1 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_1 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 5 | VARCHAR2_2 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_2 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 6 | VARCHAR2_3 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_3 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 7 | VARCHAR2_4 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_4 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 8 | VARCHAR2_5 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_5 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 9 | VARCHAR2_6 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_6 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 10 | VARCHAR2_7 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_7 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 11 | VARCHAR2_8 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_8 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 12 | VARCHAR2_9 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_9 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 13 | VARCHAR2_10 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_10 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 14 | NUMBER_11 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_11 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 15 | NUMBER_12 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_12 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 16 | NUMBER_13 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_13 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 17 | NUMBER_14 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_14 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 18 | NUMBER_15 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_15 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 19 | NUMBER_16 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_16 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 20 | NUMBER_17 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_17 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 21 | NUMBER_18 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_18 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 22 | NUMBER_19 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_19 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 23 | NUMBER_20 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_20 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 24 | DATE_21 |  |  |  | Date | This column holds data related to the attribute defined on the L10N_ATTRIB table that references DATE_21 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 25 | DATE_22 |  |  |  | Date | This column holds data related to the attribute defined on the L10N_ATTRIB table that references DATE_22 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_MRT_L10N_EXT|PK||||MRT_NO|ASC|
||||||L10N_COUNTRY_ID|ASC|
||||||GROUP_ID|ASC|

---

## Table: NWP

**Description:** This table will be added to the system to record all activity for the NWP process. This table will hold a record for every active Item/Location combination for each year. Items on this table will be non-pack items at the transaction level.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | Contains the item number. |
| 2 | LOCATION | P |  | Y | NUMERIC (10) | Contains the location number. |
| 3 | FISCAL_YEAR | P |  | Y | NUMERIC (4) | Contains the year in which the stock is valid. |
| 4 | ORDER_NO |  |  |  | VARCHAR (12) | Contains the referencing order number (ordhead). |
| 5 | SHIPMENT |  |  |  | NUMERIC (12) | Contains the referencing shipment number (shipment). |
| 6 | RECEIVE_DATE |  |  |  | Date | Contains the shipment receipt date (shipment). |
| 7 | QTY_RECEIVED |  |  |  | NUMERIC (12,4) | Contains the quantity of products received (shipsku). |
| 8 | REC_UNIT_COST |  |  |  | NUMERIC (20,4) | Contains the items receipt (shipsku) unit cost for the specific item, location combination. |
| 9 | CURRENCY_CODE |  |  |  | VARCHAR (3) | Contains the currency from the purchase order (ordhead). |
| 10 | EXCHANGE_RATE |  |  |  | NUMERIC (20,10) | Contains the exchange rate between local and primary (ordhead). |
| 11 | ADJUSTMENT_DATE |  |  |  | Date | Contains the date any adjustments were made. |
| 12 | COST_ADJ_AMT |  |  |  | NUMERIC (20,4) | Contains the adjusted receipt cost. |
| 13 | UNIT_ADJ_QTY |  |  |  | NUMERIC (12,4) | Contains the number of adjusted units. |
| 14 | ON_HAND_QTY |  |  |  | NUMERIC (12,4) | Contains a snapshot of the qty of products on hand. |
| 15 | IN_TRANSIT_QTY |  |  |  | NUMERIC (12,4) | Contains a snapshot of the qty of products in transit. |
| 16 | WAC |  |  |  | NUMERIC (20,4) | Contains the weighted average cost. |
| 17 | VARIANCE_QTY |  |  |  | NUMERIC (12,4) | Variance Quantity (updated by stock count process covered under AVA requirement #37). |

---

## Table: NWP_FREEZE_DATE

**Description:** Table to hold a list of freeze dates for NWP processing by Fiscal Year. If the freeze date has passed for the current fiscal year the NWP inserts/updates are disabled.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FISCAL_YEAR | P |  | Y | NUMERIC (4) | Hold the Fiscal year. |
| 2 | FREEZE_DATE |  |  | Y | Date | Indicates the current freeze date for inserting records into the NWP table. |
| 3 | VARIANCE_FREEZE_DATE |  |  | Y | Date | Stock count variances are recorded in NWP. The variance_freeze_date will specify the last stocktake date that will have its variance recorded for the fiscal year. |

---

## Table: SAFETY_STOCK_LOOKUP

**Description:** This table is used in the safety stock calculation for the Dynamic replenishment method. It is used to calculate the required number of units of safety stock to order. This table is populated during installation of the system and must be maintained by the database administrator.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SAFETY_STOCK_STD_DEV | P |  | Y | NUMERIC (12,4) | This field identifies how may standard deviations of safety stock are required to give, over the long run, the desired number of lost sales. Multiplying this by the standard deviation results in the required number of units of safety stock to order. |
| 2 | EXP_UNITS_SHORT |  |  | Y | NUMERIC (12,4) | This field contains the expected number of units short normalized by the sales demands standard deviation. |

---

## Table: SIT_CONFLICT

**Description:** This table contains a duplicate item/location record that exists within item list/location list link which conflicts with the newly created item list/location list link.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEMLOC_LINK_ID | P |  | Y | NUMERIC (10) | This field contains the number that uniquely identifies an item list/location list link. This is an ID of the newly created item list/location |
| 2 | CONFLICT_ITEMLOC_LINK_ID | P | F | Y | NUMERIC (10) | This field contains the number that uniquely identifies an item list/location list link. This is an existing ID whose one or more item/location records conflict with the newly created item list/location list link (itemloc_link_ID). |
| 3 | ITEM | P | F | Y | VARCHAR (25) | This field identifies the item that is part of the duplicate item/location record. |
| 4 | LOCATION | P | F | Y | NUMERIC (10) | This field identifies the location that is part of the duplicate item/location record. The location can be either a store or a warehouse. |
| 5 | INSERT_DATE |  |  | Y | Date | This field contains a date when the duplicate record was written to this table. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SIT_CONFLICT|PK||||ITEM|ASC|
||||||LOCATION|ASC|
||||||CONFLICT_ITEMLOC_LINK_ID|ASC|
||||||ITEMLOC_LINK_ID|ASC|
|SIT_CONFLICT_I1|||||CONFLICT_ITEMLOC_LINK_ID|ASC|
||||||ITEM|ASC|
||||||LOCATION|ASC|

---

## Table: SIT_CONFLICT_TEMP

**Description:** This table will hold all the same information as the sit_conflict table and will serve as a holding table for when item lists and location lists are rebuilt.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CONFLICT_ITEMLOC_LINK_ID |  |  |  | NUMERIC (10) | This field contains the number that uniquely identifies an item list/location list link. This is an existing ID whose one or more |
| 2 | ITEM |  |  |  | VARCHAR (25) | This field identifies the item that is part of the duplicate item/location record. |
| 3 | LOCATION |  |  |  | NUMERIC (10) | This field identifies the location that is part of the duplicate item/location record. The location can be either a store or a warehouse. |
| 4 | ITEMLOC_LINK_ID |  |  |  | NUMERIC (10) | This field contains the number that uniquely identifies an item list/location list link. This is an ID of newly created item list/location list link. |
| 5 | INSERT_DATE |  |  |  | Date | This field contains a date when the duplicate record was written to this table. |

---

## Table: SIT_DETAIL

**Description:** This table contains the detail information for each item list/location list link. There can be multiple rows for each item list/location list link.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEMLOC_LINK_ID | P | F | Y | NUMERIC (10) | This field contains the number that uniquely identifies an item list/location list link. |
| 2 | STATUS |  |  | Y | VARCHAR (1) | This field contains the current status of the item list/location list link. Valid values are: A = Active, item is valid and can be |
| 3 | STATUS_UPDATE_DATE | P |  | Y | Date | This field contains the date on which the status for the item list/location list link was most recently changed. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SIT_DETAIL|PK||||ITEMLOC_LINK_ID|ASC|
||||||STATUS_UPDATE_DATE|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_SIT_DETAIL_STATUS|status in ('A', 'I', 'C', 'D')|
|Column Level|STATUS||

---

## Table: SIT_EXPLODE

**Description:** This table contains one row for either each item/location combination that exists within item list/location list link. This table also indicates whether items and locations are being added to their respective lists or are being deleted from their respective lists.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEMLOC_LINK_ID | P | F | Y | NUMERIC (10) | This field contains the number that uniquely identifies an item/location list link. |
| 2 | SKULIST |  |  | Y | NUMERIC (8) | This field contains the number that uniquely identifies an item list. |
| 3 | ITEM | P |  | Y | VARCHAR (25) | This field contains the item that is on the item list. |
| 4 | LOC_LIST |  |  | Y | NUMERIC (10) | This field contains the number that uniquely identifies a location list. |
| 5 | LOCATION | P |  | Y | NUMERIC (10) | This field identifies the location that is on the location list. The location can be either a store or a warehouse |
| 6 | UPDATE_IND |  |  | Y | VARCHAR (1) | This field indicates whether an item has been added to an item list or whether a location has been added to a location list. Valid values for this field are: Yes, No. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SIT_EXPLODE|PK||||ITEMLOC_LINK_ID|ASC|
||||||ITEM|ASC|
||||||LOCATION|ASC|
|SIT_EXPLODE_I1|||||LOC_LIST|ASC|
||||||LOCATION|ASC|
|SIT_EXPLODE_I2|||||SKULIST|ASC|
||||||ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SIT_EXPLODE_UPDATE_IND|UPDATE_IND in ('Y', 'N')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
|Column Level|UPDATE_IND||

---

## Table: SIT_HEAD

**Description:** This table contains the header information for each item list/location list link in the system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEMLOC_LINK_ID | P |  | Y | NUMERIC (10) | This field contains a number to uniquely identify an item list/location list link. |
| 2 | ITEMLOC_LINK_DESC |  |  | Y | VARCHAR (120) | This field contains the description of the item/location link. |
| 3 | SKULIST |  | F | Y | NUMERIC (8) | This field contains a number that identifies an item list. |
| 4 | LOC_LIST |  | F | Y | NUMERIC (10) | This field contains a number that identifies a location list. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SIT_HEAD|PK||||ITEMLOC_LINK_ID|ASC|
|SIT_HEAD_I1|||||LOC_LIST|ASC|
|SIT_HEAD_I2|||||SKULIST|ASC|

---

## Table: STAKE_CONT

**Description:** This table is used to control the processing during a stocktaking run. Only SKU/location combinations in this table are processed during any particular run. All existing rows are deleted and new rows added to this table as part of a stocktaking control run, whether a unit run or a dollar run.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | Unique identifier for the item. |
| 2 | LOC_TYPE | P | F | Y | VARCHAR (1) | Contains location type. Valid values are : S = Store, W = Warehouse or Internal Finisher, E = External Finisher |
| 3 | LOCATION | P | F | Y | NUMERIC (10) | Contains the location where the cycle (stock) count will occur. If LOC_TYPE is S, then the location is the Store. If LOC_TYPE is W, then the location is the Warehouse or Internal Finisher. If LOC_TYPE is E, then the location is the External Finisher. |
| 4 | CYCLE_COUNT | P | F | Y | NUMERIC (8) | Contains the number which uniquely identifies the cycle (stock) count. |
| 5 | RUN_TYPE |  |  | Y | VARCHAR (1) | Contains the code which controls the type of processing in batch. Valid values are: T - Trial, used to control the running of the trial variance report A - Actual, used to trigger the actual adjustment of stock on hand by the stock count quantity in the batch program stkvar |
| 6 | USER_ID |  |  |  | VARCHAR (30) | Contains the Oracle User Id for the user requesting the trial variance report. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STAKE_CONT|PK||||CYCLE_COUNT|ASC|
||||||LOC_TYPE|ASC|
||||||LOCATION|ASC|
||||||ITEM|ASC|
|PK_STAKE_CONT|UN||||CYCLE_COUNT|ASC|
||||||LOC_TYPE|ASC|
||||||LOCATION|ASC|
||||||ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|Col4|
|---|---|---|---|
|Table Level|CHK_STAKE_CONT_LOC_TYPE|LOC_TYPE IN ('S','W','E')<br>|LOC_TYPE IN ('S','W','E')<br>|
||CHK_STAKE_CONT_RUN_TYPE|RUN_TYPE IN('A', 'T')<br>|RUN_TYPE IN('A', 'T')<br>|
|Column Level|LOC_TYPE|Value List<br>Value<br>Description<br>'E'<br> <br>'S'<br> <br>'W'<br>|Value List<br>Value<br>Description<br>'E'<br> <br>'S'<br> <br>'W'<br>|
|Column Level|LOC_TYPE|Value List|Value List|
|Column Level|LOC_TYPE|Value|Description|
|Column Level|LOC_TYPE|'E'||
|Column Level|LOC_TYPE|'S'||
|Column Level|LOC_TYPE|'W'||
||RUN_TYPE|||

---

## Table: STAKE_CONT_TEMP

**Description:** Temporary Staging Table to aid processing item containers in stkvar

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CYCLE_COUNT |  |  |  | NUMERIC (8) | This column contains the cycle count to be processed for container items |
| 2 | DEPT |  |  |  | NUMERIC (4) | This column contains the depts to be processed for container items |
| 3 | LOCATION |  |  |  | NUMERIC (10) | This column contains the location to be processed for container items |

---

## Table: STAKE_HEAD

**Description:** This table contains header level information about stock count events (stocktakes) in the system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CYCLE_COUNT | P |  | Y | NUMERIC (8) | Contains the number which uniquely identifies the stock or cycle count. |
| 2 | CYCLE_COUNT_DESC |  |  | Y | VARCHAR (250) | Contains a description of the cycle or stock count which, along with the cycle count number, identifies the cycle or stock count. |
| 3 | LOC_TYPE |  |  | Y | VARCHAR (1) | Contains location type whether the stock count is requested for Store, Warehouse(including Internal Finisher) or External Finisher. Valid Values are : S = Store, W = Warehouse, E = External Finisher |
| 4 | STOCKTAKE_DATE |  |  | Y | Date | Contains the date on which the stock or cycle count event will take place. |
| 5 | STOCKTAKE_TYPE |  |  | Y | VARCHAR (1) | Contains a value which indicates the type of stock count. Valid values are: B - Both Unit & Value, where dept, class or subclass is used when requesting it, and stock value will be generated to replace the ledger stock value and shrinkage value will be calculated for a dept/class/subclass/location. Note that this type of stock count must be requested at the product level where stock ledger is maintained at. U - Unit only, item list can be used when requesting it, in addition to dept, class, or subclass. stock_on_hand will be updated by the stock count result. Stock adjustment tran_data will be generated. |
| 6 | PRODUCT_LEVEL_IND |  |  |  | VARCHAR (1) | This field indicates at which product level (department, class, or subclass) the stock count is requested. |
| 7 | DELETE_IND |  |  | Y | VARCHAR (1) | in Forms. When this field is set to Y, it will indicate to the |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STAKE_HEAD|PK||||CYCLE_COUNT|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_STAKE_HEAD_DELETE_IND|DELETE_IND IN ('Y','N')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_STAKE_HEAD_LOC_TYPE|LOC_TYPE IN ('S', 'W','E')<br>|
||CHK_STAKE_HEAD_PROD_LEVEL_IND|PRODUCT_LEVEL_IND IN ('D','C','S','N')<br>|
||CHK_STAKE_HEAD_STK_TYPE|STOCKTAKE_TYPE IN('U', 'B')<br>|
|Column Level|LOC_TYPE||
||STOCKTAKE_TYPE||
||PRODUCT_LEVEL_IND||
||DELETE_IND||

---

## Table: STAKE_LOCATION

**Description:** This table contains location information for stock count events (stocktakes) in the system. Each stock count can have stores or warehouses, but not both.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CYCLE_COUNT | P | F | Y | NUMERIC (8) | Contains a number which uniquely identifies the cycle or stock count. |
| 2 | LOC_TYPE | P |  | Y | VARCHAR (1) | Contains location type. Valid values are : S = Store, W = Warehouse or Internal Finisher, E = External Finisher |
| 3 | LOCATION | P |  | Y | NUMERIC (10) | Contains the location where the cycle (stock) count will occur. If LOC_TYPE is S, then the location is the Store. If LOC_TYPE is W, then the location is the Warehouse or Internal Finisher. If LOC_TYPE is E, then the location is the External Finisher. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STAKE_LOCATION|PK||||CYCLE_COUNT|ASC|
||||||LOC_TYPE|ASC|
||||||LOCATION|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_STAKE_LOCATION_LOC_TYPE|LOC_TYPE IN ('S','W','E')<br>|
|Column Level|LOC_TYPE||

---

## Table: STAKE_PRODUCT

**Description:** This table contains department information for stock count events (stocktakes) in the system and is used for Physical Inventory type of stock count only.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CYCLE_COUNT |  | F | Y | NUMERIC (8) | Contains the number which uniquely identifies the cycle (stock) count. |
| 2 | DEPT |  | F | Y | NUMERIC (4) | Contains the department number where the cycle count will occur. |
| 3 | CLASS |  | F | Y | NUMERIC (4) | Contains the class number where the cycle count will occur. This field is not required, because the cycle count can take be specified to be at the dept, class, or subclass level. |
| 4 | SUBCLASS |  | F | Y | NUMERIC (4) | Contains the subclass number where the cycle count will occur. This field is not required, because the cycle count can take be specified to be at the dept, class, or subclass level. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|STAKE_PRODUCT_I2|||||CYCLE_COUNT|ASC|
|STAKE_PRODUCT_I1|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|

---

## Table: STAKE_PROD_LOC

**Description:** This table contains a row for each dept/class/subclass location combination in the company for which a Physical Inventory is scheduled. The location can be specified at any level, i.e. department, class or subclass.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CYCLE_COUNT | P | F | Y | NUMERIC (8) | Contains the number which uniquely identifies the cycle (stock) count. |
| 2 | DEPT | P | F | Y | NUMERIC (4) | Contains the department number where the stock take will occur. |
| 3 | CLASS | P | F | Y | NUMERIC (4) | Contains the class number where the stock take will occur. |
| 4 | SUBCLASS | P | F | Y | NUMERIC (4) | Contains the subclass number where the stock take will occur. |
| 5 | LOC_TYPE | P | F | Y | VARCHAR (1) | Contains location type. Valid values are : S = Store, W = Warehouse or Internal Finisher, E = External Finisher |
| 6 | LOCATION | P | F | Y | NUMERIC (10) | Contains the location where the cycle (stock) count will occur. If LOC_TYPE is S, then the location is the Store. If LOC_TYPE is W, then the location is the Warehouse or Internal Finisher. If LOC_TYPE is E, then the location is the External Finisher. |
| 7 | PROCESSED |  |  | Y | VARCHAR (1) | Indicates whether or not the record has been processed. The value will be N for not processed when the record is first created. Once the user approves the record to affect the stock ledger the value will be updated to a P. This will then change to S to once the record is processed by the stock ledger programs. |
| 8 | TOTAL_COST |  |  | Y | NUMERIC (20,4) | Contains the total cost of the inventory for the department. This field is stored in the local currency. |
| 9 | TOTAL_RETAIL |  |  | Y | NUMERIC (20,4) | Contains the total retail value of the inventory for the department. This field is stored in the local currency. |
| 10 | ADJUST_COST |  |  | Y | NUMERIC (20,4) | This field represents the adjustment to the total_cost. This provides an audit trail when the total_cost is modified. This field is stored in the local currency. |
| 11 | ADJUST_RETAIL |  |  | Y | NUMERIC (20,4) | This field represents the adjustment to the total_retail. This provides an audit trail when the total_retail is modified. This field is stored in the local currency. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STAKE_PROD_LOC|PK||||CYCLE_COUNT|ASC|
||||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
||||||LOC_TYPE|ASC|
||||||LOCATION|ASC|
|STAKE_PROD_LOC_I1|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
|STAKE_PROD_LOC_I3|||||CYCLE_COUNT|ASC|
||||||PROCESSED|ASC|
|STAKE_PROD_LOC_I2|||||CYCLE_COUNT|ASC|
||||||LOC_TYPE|ASC|
||||||LOCATION|ASC|

---

## Table: STAKE_QTY

**Description:** This table contains unit stock count result records that are captured for a SKU/location defined for a stock count.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CYCLE_COUNT |  | F | Y | NUMERIC (8) | Contains the number which uniquely identifies the cycle (stock) count. |
| 2 | LOC_TYPE |  | F | Y | VARCHAR (1) | Contains location type. Valid values are : S = Store, W = Warehouse or Internal Finisher, E = External Finisher |
| 3 | LOCATION |  | F | Y | NUMERIC (10) | Contains the location where the cycle (stock) count will occur. If LOC_TYPE is S, then the location is the Store. If LOC_TYPE is W, then the location is the Warehouse or Internal Finisher. If LOC_TYPE is E, then the location is the External Finisher. |
| 4 | ITEM |  | F | Y | VARCHAR (25) | Unique identifier for the item. |
| 5 | QTY |  |  | Y | NUMERIC (12,4) | Contains the quantity counted for a SKU / Location combination. |
| 6 | LOCATION_DESC |  |  | Y | VARCHAR (150) | Contains a description of the location where the inventory was found. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|STAKE_QTY_I1|||||CYCLE_COUNT|ASC|
||||||LOC_TYPE|ASC|
||||||LOCATION|ASC|
||||||ITEM|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|Col4|
|---|---|---|---|
|Table Level|CHK_STAKE_QTY_LOC_TYPE|LOC_TYPE IN ('S','W','E')<br>|LOC_TYPE IN ('S','W','E')<br>|
|Column Level|LOC_TYPE|Value List<br>Value<br>Description|Value List<br>Value<br>Description|
|Column Level|LOC_TYPE|Value List|Value List|
|Column Level|LOC_TYPE|Value|Description|






|Type|Column / Constraint<br>Name|Details|Col4|Col5|
|---|---|---|---|---|
|||'E'|||
|||'S'|||
|||'W'|||

---

## Table: STAKE_QTY_GTT

**Description:** Temporary table to hold stock count information during stkupld batch run to improve performance.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CYCLE_COUNT |  |  |  | NUMERIC (8) | Contains the number which uniquely identifies the cycle (stock) count. |
| 2 | LOC_TYPE |  |  |  | VARCHAR (1) | Contains location type. Valid values are : S = Store, W =Warehouse or Internal Finisher, E = External Finisher |
| 3 | LOCATION |  |  |  | NUMERIC (10) | Contains the location where the cycle (stock) count will occur. |
| 4 | ITEM |  |  |  | VARCHAR (25) | Unique identifier for the item |
| 5 | QTY |  |  |  | NUMERIC (12,4) | Contains the quantity counted for a SKU / Location combination. |
| 6 | LOCATION_DESC |  |  |  | VARCHAR (150) | Contains a description of the location where the inventory was found. |

---

## Table: STAKE_SCHEDULE

**Description:** This table will hold stock count schedules.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SCHEDULE_ID | P |  | Y | NUMERIC (6) | The unique identifier for the cycle count schedule. |
| 2 | LOCATION |  |  |  | NUMERIC (10) | The valid store or warehouse that is being scheduled. If the location list field is entered, this field will be null. This table holds stock count schedules. Since the actual count only takes place at the physical level, this table should be held at the physical warehouse level as well |
| 3 | STOCKTAKE_TYPE |  |  | Y | VARCHAR (6) | Indicates whether the count that is generated is a Unit Only count or a Unit and Dollar count. Valid values are U for Unit Only and B for Unit and Dollar. |
| 4 | DEPT |  | F |  | NUMERIC (4) | A valid department that contains items existing at the location being counted. This field should only be populated when the stocktake_type is B. |
| 5 | CLASS |  | F |  | NUMERIC (4) | A valid class that contains items existing at the location being counted. This field should only be populated when the stocktake_type is B. |
| 6 | SUBCLASS |  | F |  | NUMERIC (4) | A valid subclass that contains items existing at the location being counted. This field should only be populated when the stocktake_type is B. |
| 7 | SKULIST |  | F |  | NUMERIC (8) | A valid item list that exists on skulist_head. This field should only be populated when the stocktake_type is U. This field should be null if the classification field is populated. |
| 8 | START_DATE |  |  | Y | Date | The date on which the first stock count should be created from this schedule. |
| 9 | LAST_EOW_DATE |  |  |  | Date | The EOW of the last week that this schedule was run. If the schedule has been newly created or changed, this column is NULL. The EOW is determined by the Oracle databases end of week, not the 454 calendars. |
| 10 | COUNT_TIME |  |  | Y | Date | The count time of the schedule. This time is when the count is expected to occur during the day. |
| 11 | END_DATE |  |  |  | Date | The date upon which the schedule should no longer create stock counts. |
| 12 | COUNT_CYCLE |  |  | Y | VARCHAR (6) | The frequency with which the count will take place. Examples of valid values are daily, weekly, every 2 weeks, every 3 weeks, etc. These valid values should match the values used in replenishment scheduling dialog (RPRC values from the code_detail table). |
| 13 | DAYS_STRING |  |  | Y | VARCHAR (7) | Indicates which days a stock count will take place. It will hold a three-letter representation for each day. For example, if the count were to take place on Tuesdays and Thursdays the string would be TUETHU. |
| 14 | LOC_TYPE |  |  | Y | VARCHAR (1) | Indicates the location type. Valid values are: S - Store W - Warehouse L - Location List |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STAKE_SCHEDULE|PK||||SCHEDULE_ID|ASC|
|STAKE_SCHEDULE_I4|||||SKULIST|ASC|
|STAKE_SCHEDULE_I1|||||LOCATION|ASC|
|STAKE_SCHEDULE_I3|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_STAKE_SCH_COUNT_CYCLE|count_cycle in ('0','1','2','3','4','5','6','7','8','9','10','11','12','13','14')<br>|
||CHK_STAKE_SCH_STOCKTAKE_TY_ETC|(stocktake_type = 'U' and dept is NULL and class is NULL and subclass is NULL) OR (stocktake_type = 'B' and dept is NOT NULL and skulist<br>is NULL)<br>|
||CHK_STAKE_SCH_LOC_TYPE|LOC_TYPE IN ('S','W','L','E')<br>|
|Column Level|COUNT_CYCLE||
||LOC_TYPE||

---

## Table: STAKE_SKU_LOC

**Description:** This table contains a row for each SKU/location combination for a stock count.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CYCLE_COUNT | P | F | Y | NUMERIC (8) | Contains the number which uniquely identifies the cycle (stock) count. |
| 2 | LOC_TYPE | P | F | Y | VARCHAR (1) | Contains the number of the store in which the stock count will occur. |
| 3 | LOCATION | P | F | Y | NUMERIC (10) | Contains the number of the warehouse in which the stock count will occur. |
| 4 | ITEM | P |  | Y | VARCHAR (25) | Unique identifier for the item. |
| 5 | SNAPSHOT_ON_HAND_QTY |  |  |  | NUMERIC (12,4) | Contains the current system value for stock on hand for the stock take location at the end of the day when the physical count is to be taken. |
| 6 | SNAPSHOT_IN_TRANSIT_QTY |  |  |  | NUMERIC (12,4) | Contains the current in transit amount for the SKU / stock take location combination at the end of the day when the physical count is to be taken. |
| 7 | SNAPSHOT_UNIT_COST |  |  |  | NUMERIC (20,4) | Contains the current unit cost for the SKU at the stock take location at the end of the day when the physical count is to be taken. This field is stored in the local currency. |
| 8 | SNAPSHOT_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Contains the current retail price for the SKU at the stock take location at the end of the day when the physical count is to be taken. This field is stored in the local currency. |
| 9 | PROCESSED |  |  | Y | VARCHAR (1) | Indicates whether or not the record has been processed. The value will be N when the record is first created and will be updated to a P for processed when an inventory adjustment is created. This adjustment will reflex the difference between the physical count and the stock on hand in the system. |
| 10 | PHYSICAL_COUNT_QTY |  |  |  | NUMERIC (12,4) | Contains the total quantity counted for the SKU / Store or Warehouse combination. |
| 11 | PACK_COMP_QTY |  |  | Y | NUMERIC (12,4) | Field is required for stock counting pack items. Records the quantity of a component SKU existing in the pack items that were counted. |
| 12 | DEPT |  |  | Y | NUMERIC (4) | This field contains the department of the SKU on the table. It is held on this table for performance reasons. |
| 13 | CLASS |  |  | Y | NUMERIC (4) | This field contains the class of the SKU on the table. It is held on this table for performance reasons. |
| 14 | SUBCLASS |  |  | Y | NUMERIC (4) | This field contains the subclass of the SKU on the table. It is held on this table for performance reasons. |
| 15 | IN_TRANSIT_AMT |  |  |  | NUMERIC (20,4) | Transit amount for item/location |
| 16 | DEPOSIT_ITEM_TYPE |  |  |  | VARCHAR (1) | Holds the deposit item type of Content for deposit items. Valid values: E - Content |
| 17 | XFORM_ITEM_TYPE |  |  |  | VARCHAR (1) | Holds the item xform type of Orderable for orderable-only items and Sellable for sellable-only items that have associated orderable-only items. Valid values: S - Sellable O - orderable Null |
| 18 | DISTRIBUTE_QTY |  |  |  | NUMERIC (12,4) | This field contains the adjusted distribution quantity for an item/virtual warehouse. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_STAKE_SKU_LOC|PK||||CYCLE_COUNT|ASC|
||||||LOC_TYPE|ASC|
||||||LOCATION|ASC|
||||||ITEM|ASC|
|STAKE_SKU_LOC_I2|||||CYCLE_COUNT|ASC|
||||||PROCESSED|ASC|
|STAKE_SKU_LOC_I1|||||ITEM|ASC|
||||||LOC_TYPE|ASC|
||||||LOCATION|ASC|
|STAKE_SKU_LOC_I3|||||ITEM|ASC|
||||||CYCLE_COUNT|ASC|
|PK_STAKE_SKU_LOC|UN||||CYCLE_COUNT|ASC|
||||||LOC_TYPE|ASC|
||||||LOCATION|ASC|
||||||ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SSL_DEPOSIT_ITEM_TYPE|DEPOSIT_ITEM_TYPE in ('E')<br>|
||CHK_SSL_XFORM_ITEM_TYPE|XFORM_ITEM_TYPE in ('O','S')<br>|






|Type|Column / Constraint Name|Details|Col4|
|---|---|---|---|
||CHK_STAKE_SKU_LOC_LOC_TYPE|LOC_TYPE IN ('S','W','E')<br>|LOC_TYPE IN ('S','W','E')<br>|
||CHK_STAKE_SKU_LOC_PROCESSED|PROCESSED IN ('N', 'P')<br>|PROCESSED IN ('N', 'P')<br>|
|Column<br>Level|LOC_TYPE|<br>Value List<br>Value<br>Description<br>'E'<br> <br>'S'<br> <br>'W'<br>|<br>Value List<br>Value<br>Description<br>'E'<br> <br>'S'<br> <br>'W'<br>|
|Column<br>Level|LOC_TYPE|Value List|Value List|
|Column<br>Level|LOC_TYPE|Value|Description|
|Column<br>Level|LOC_TYPE|'E'||
|Column<br>Level|LOC_TYPE|'S'||
|Column<br>Level|LOC_TYPE|'W'||
||PROCESSED|||
||DEPOSIT_ITEM_TYPE|Value List<br>Value<br>Description<br>'E'<br>|Value List<br>Value<br>Description<br>'E'<br>|
||DEPOSIT_ITEM_TYPE|Value List|Value List|
||DEPOSIT_ITEM_TYPE|Value|Description|
||DEPOSIT_ITEM_TYPE|'E'||
||XFORM_ITEM_TYPE|<br>Value List<br>Value<br>Description<br>'O'<br> <br>'S'<br>|<br>Value List<br>Value<br>Description<br>'O'<br> <br>'S'<br>|
||XFORM_ITEM_TYPE|Value List|Value List|
||XFORM_ITEM_TYPE|Value|Description|
||XFORM_ITEM_TYPE|'O'||
||XFORM_ITEM_TYPE|'S'||

---

## Table: STOCK_LEDGER_INSERTS

**Description:** This table is written to every time a new entity is created that will cause a row to be created on the stock ledger. A batch program will read this table and create the appropriate rows.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TYPE_CODE |  |  | Y | VARCHAR (1) | This field contains the type of record that needs to be created on the stock ledger. The valid values are: D = Department C = Class B = Subclass S = Store W = Warehouse E = External finisher |
| 2 | DEPT |  | F |  | NUMERIC (4) | If the TYPE_CODE field is D, C, or B than this field will contain the department that will be inserted into the stock ledger. |
| 3 | CLASS |  | F |  | NUMERIC (4) | If the TYPE_CODE field is C, or B than this field will contain the class that will be inserted into the stock ledger. |
| 4 | SUBCLASS |  | F |  | NUMERIC (4) | If the TYPE_CODE field is B than this field will contain the subclass that will be inserted into the stock ledger. |
| 5 | LOCATION |  |  |  | NUMERIC (10) | This field contains the Store if Loc_type = S the Warehouse or Internal Finisher if Loc_type = W the External Finisher if Loc_type = E. |
| 6 | RMS_ASYNC_ID |  |  |  | NUMERIC (15) | A numeric value that identifies an asynchronous process RMS. The asynchronous process in the context of this table is stock ledger insertion. |
| 7 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 8 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|STOCK_LEDGER_INSERTS_I1|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_STOCK_LEDG_INS_TYP_CODE|TYPE_CODE IN('S', 'W', 'B', 'D', 'C', 'E')<br>|
|Column Level|TYPE_CODE||
