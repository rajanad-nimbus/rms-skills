# RMS Suppliers, Procurement & Partners Datamodel - Physical Data Model Reference

## Table: BUYER_WKSHT_MANUAL

**Description:** This table is used to store line items that were manually added through the Buyer Worksheet form.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  | F | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 2 | SUPPLIER |  | F | Y | NUMERIC (10) | The number of the supplier that will source the item. |
| 3 | ORIGIN_COUNTRY_ID |  | F | Y | VARCHAR (3) | This column contains the country code of the supplier country that will be used to supply item. |
| 4 | LOCATION |  | F | Y | NUMERIC (10) | The number of the location that the item is being ordered to. this column will hold virtual warehouses |
| 5 | LOC_TYPE |  |  | Y | VARCHAR (1) | This column contains the type of the location on replenishment. Valid values include Store and Warehouse |
| 6 | STATUS |  |  | Y | VARCHAR (6) | Status of the record. Valid values include: W - Worksheet, P - PO-Processed (is associated with a PO) |
| 7 | SOURCE_TYPE |  |  | Y | VARCHAR (6) | Contains a character indicator to determine where the recommended order quantity is coming from. It will only contain one valid value. This column, used in conjunction with the SOURCE_TYPE column on IB_RESULTS and REPL_RESULTS will aid in distinguishing which table the ROQ is coming from when displayed on the Buyer Worksheet form. M - Manual |
| 8 | ITEM_TYPE |  |  | Y | VARCHAR (1) | This column contains a character indicator to determine if the item being ordered is a pack or not. Valid values include: P - Pack item, N - Non-pack item |
| 9 | COMP_ITEM |  | F |  | VARCHAR (25) | This column contains the component item of the simple pack. It is only populated if the item_type is P and if the item is a simple pack |
| 10 | DEPT |  | F | Y | NUMERIC (4) | The number of the department to which the item is attached. |
| 11 | CLASS |  | F | Y | NUMERIC (4) | The number of the class to which the item is attached. |
| 12 | SUBCLASS |  | F | Y | NUMERIC (4) | The number of the subclass to which the item is attached. |
| 13 | BUYER |  | F |  | NUMERIC (4) | The number that uniquely identifies the buyer for the items department |
| 14 | POOL_SUPPLIER |  | F |  | NUMERIC (10) | This column will link the supplier, supplier/department, supplier/location, or the supplier/department/location to a master supplier. |
| 15 | PHYSICAL_WH |  | F |  | NUMERIC (10) | The number of the physical warehouse that is assigned to the virtual warehouse. |
| 16 | REPL_WH_LINK |  |  |  | NUMERIC (10) | This column contains the replenishable warehouse that is attached to the virtual warehouse. |
| 17 | SUPP_LEAD_TIME |  |  |  | NUMERIC (4) | Contains the time the supplier needs between receiving an order and having the order ready to ship. |
| 18 | PICKUP_LEAD_TIME |  |  |  | NUMERIC (4) | Contains the time it takes to get the item from the supplier to the initial receiving location. |
| 19 | SUPP_UNIT_COST |  |  | Y | NUMERIC (20,4) | This field is used to store the unit cost of the item specified at the item/supplier/origin country/location level. It will never be modified. This field, in conjunction with the unit cost field, will determine the cost source to be used at the order/item/location level. It is stored in the suppliers currency. |
| 20 | UNIT_COST |  |  | Y | NUMERIC (20,4) | The unit cost of the item defaulted from the item/supplier/origin country/location level. It may be edited. This field, in conjunction with the supplier unit cost field, will determine the cost source to be used at the order/item/location level. It is stored in the suppliers currency. |
| 21 | ORDER_ROQ |  |  | Y | NUMERIC (12,4) | Contains the quantity of the item to be ordered after all pack size rounding, proration and scaling logic is performed on the order quantity. This field is stored in the standard unit of measure. |
| 22 | LAST_ROUNDED_QTY |  |  |  | NUMERIC (12,4) | This column will hold the most recent system rounded order quantity value for the line item. |
| 23 | LAST_GRP_ROUNDED_QTY |  |  |  | NUMERIC (12,4) | This column will hold the last system rounded order quantity for the rounding group the location is apart of. |
| 24 | CASE_SIZE |  |  | Y | NUMERIC (12,4) | Contains the case size quantity for the item. |
| 25 | TI |  |  | Y | NUMERIC (12,4) | Number of shipping units (cases) that make up one tier of a pallet. Multiply TI x HI to get total number of units (cases) for a pallet |
| 26 | HI |  |  | Y | NUMERIC (12,4) | Number of tiers that make up a complete pallet (height). Multiply TI x HI to get total number of units (cases) for a pallet. |
| 27 | TSF_PO_LINK_NO |  |  |  | NUMERIC (12) | A reference number to link the item on the transfer to any purchase orders that have been created to allow the from location (i.e. warehouse) on the transfer to fulfill the transfer quantity to the to location (i.e store) on the transfer. |
| 28 | CREATE_DATE |  |  | Y | Date | The date of when the record was created. |
| 29 | AUDSID |  |  |  | NUMERIC | This column will store the auditing session ID when the user selects this record to create purchase orders with from the Buyer Worksheet form. This value will be used to identify which records should be grouped together for the purchase order and rounding libraries per user |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|BUYER_WKSHT_MANUAL_I4|||||COMP_ITEM|ASC|
|BUYER_WKSHT_MANUAL_I7|||||PHYSICAL_WH|ASC|
|BUYER_WKSHT_MANUAL_I2|||||AUDSID|ASC|
||||||STATUS|ASC|
|BUYER_WKSHT_MANUAL_I1|||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
||||||LOCATION|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|BUYER_WKSHT_MANUAL_I5|||||DEPT|ASC|
||||||CLASS|ASC|
||||||SUBCLASS|ASC|
|BUYER_WKSHT_MANUAL_I6|||||POOL_SUPPLIER|ASC|
|BUYER_WKSHT_MANUAL_I3|||||BUYER|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_BUYER_WKSHT_MANUAL_ITM_TYP|ITEM_TYPE IN('P','N')<br>|
||CHK_BUYER_WKSHT_MANUAL_LOC_TYP|LOC_TYPE in ('S','W')<br>|
||CHK_BUYER_WKSHT_MANUAL_SRC_TYP|SOURCE_TYPE IN ('M')<br>|
||CHK_BUYER_WKSHT_MANUAL_STATUS|STATUS IN ('W','P')<br>|
|Column Level|LOC_TYPE||
||STATUS||
||SOURCE_TYPE||

---

## Table: BUYER_WKSHT_PO_LIST_GTT

**Description:** Notes

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDER_NO |  |  |  | NUMERIC (12) | Contains the purchase order number. |
| 2 | DEPT |  |  |  | NUMERIC (4) | Contains the department number. |
| 3 | WRITTEN_DATE |  |  |  | Date | Contains the order written date. |
| 4 | SUPPLIER |  |  |  | NUMERIC (10) | Contains the order supplier. |
| 5 | SUP_NAME |  |  |  | VARCHAR (240) | Contains the translated name of the supplier in user language. |
| 6 | POOL_SUPPLIER |  |  |  | NUMERIC (10) | Contains the master supplier id. |
| 7 | LOC_TYPE |  |  |  | VARCHAR (1) | Location type - 'S' store, 'W' arehouse. |
| 8 | LOCATION |  |  |  | NUMERIC (10) | Contains a store or warehouse id. |
| 9 | LOC_NAME |  |  |  | VARCHAR (150) | Translated store name or warehouse name. |
| 10 | FIRST_ORDER_TOTAL |  |  |  | NUMERIC (20,4) | Total order quantity based on the first scaling constraint. |
| 11 | SECOND_ORDER_TOTAL |  |  |  | NUMERIC (20,4) | Total order quantity based on the second scaling constraint. |

---

## Table: CONTRACT_COST

**Description:** This table will hold contract cost information for parent items(for all contract types). Contract types C and D will only ever have records on the CONTRACT_COST table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CONTRACT_NO | P | F | Y | NUMERIC (6) | This number uniquely identifies a contract within the system. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (4) | This column will contain a unique identifier that as used in the primary key. |
| 3 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group two levels above the item. |
| 4 | ITEM_PARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group at the level above the item. |
| 5 | ITEM |  | F |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 6 | DIFF_1 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 7 | DIFF_2 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 8 | DIFF_3 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values |
| 9 | DIFF_4 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 10 | UNIT_COST |  |  | Y | NUMERIC (20,4) | This column contains the unit cost for the SKU being contracted. It will be based on the suppliers unit cost and can be overridden to display different costs by SKU. |
| 11 | ITEM_LEVEL_INDEX |  |  | Y | NUMERIC (1) | This index will be used to determine the product level at which the record is setup: 1 = Item, 2 = Item Parent/Diff_1, 3 = Item Parent/Diff_2, 4 = Item Parent/Diff_3, 5 = Item Parent/Diff_4, 6 = Item Parent |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CONTRACT_COST|PK||||CONTRACT_NO|ASC|
||||||SEQ_NO|ASC|
|CONTRACT_COST_I9|||||DIFF_4|ASC|
|CONTRACT_COST_I8|||||DIFF_3|ASC|
|CONTRACT_COST_I5|||||ITEM|ASC|
|CONTRACT_COST_I3|||||DIFF_2|ASC|
|CONTRACT_COST_I1|||||ITEM_PARENT|ASC|
|CONTRACT_COST_I6|UN||||CONTRACT_NO|ASC|
||||||ITEM_GRANDPARENT|ASC|
||||||ITEM_PARENT|ASC|
||||||ITEM|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||DIFF_1|ASC|
||||||DIFF_2|ASC|
||||||DIFF_3|ASC|
||||||DIFF_4|ASC|
|CONTRACT_COST_I7|||||ITEM_LEVEL_INDEX|ASC|
|CONTRACT_COST_I2|||||DIFF_1|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CNTR_COST_ITEM_LEVEL_INDEX|item_level_index IN (1,2,3,4,5,6)<br>|
||CHK_CNTR_COST_ITEM_PARENT_ITEM|item_grandparent is not NULL or item_parent is not NULL or item is not NULL<br>|

---

## Table: CONTRACT_COST_HIST

**Description:** This table will hold the cost history of the items on contracts.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CONTRACT_NO | P |  | Y | NUMERIC (6) | This column identifies the contract that the order was raised from. |
| 2 | ITEM | P |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 3 | ACTIVE_DATE |  |  | Y | Date | This column will hold the date that the record is written. (Date when order is called off contract.) |
| 4 | UNIT_COST |  |  | Y | NUMERIC (20,4) | This column contains the unit cost for the SKU being contracted. |

---

## Table: CONTRACT_DETAIL

**Description:** This table will hold item-level contract information for contract type A and B. The cost details for these items will be held in the CONTRACT_COST table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CONTRACT_NO | P | F | Y | NUMERIC (6) | This number uniquely identifies a contract within the system. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (4) | This number represents a sequence number which will be used as a primary key. |
| 3 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group two levels above the item. |
| 4 | ITEM_PARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group at the level above the item. |
| 5 | ITEM |  | F |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 6 | REF_ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the reference item. |
| 7 | DIFF_1 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a |
| 8 | DIFF_2 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 9 | DIFF_3 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 10 | DIFF_4 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 11 | LOC_TYPE |  |  |  | VARCHAR (1) | This column contains the location type of the location where the planned delivery quantity will be delivered by the delivery date. This will indicate whether the location is a Store or a Warehouse. |
| 12 | LOCATION |  |  |  | NUMERIC (10) | This column contains the location where the planned delivery quantity will be delivered by the delivery date. |
| 13 | READY_DATE |  |  |  | Date | This column contains the date the supplier has agreed to deliver the total number of items for this SKU. |
| 14 | QTY_CONTRACTED |  |  | Y | NUMERIC (12,4) | This column contains the total quantity contracted with the supplier for this item. |
| 15 | QTY_ORDERED |  |  |  | NUMERIC (12,4) | This column contains the total quantity of the SKU ordered to all locations for the contract to-date. |
| 16 | QTY_RECEIVED |  |  |  | NUMERIC (12,4) | This column contains the total quantity of the SKU received under all locations for the contract to date. |
| 17 | ITEM_LEVEL_INDEX |  |  | Y | NUMERIC (1) | This index will be used to determine the product level at which the record is setup: 1 = Item, 2 = Item Parent/Diff_1, 3 = Item Parent/Diff_2, 4 = Item Parent/Diff_3, 5 = Item Parent/Diff_4, 6 = Item Parent |
| 18 | CUR_REPL_QTY |  |  |  | NUMERIC (12,4) | This field will hold the cost that has been raised against the contract style or option by temporary orders (ORD_TEMP records) during the replenishment run. It is used to track style/options quantities to ensure that total contracted item quantities will not be overrun by the current batch processes (items firmed to the SKU level will not need to use this bucket). The value will be updated to null when the replenishment process is complete. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CONTRACT_DETAIL|PK||||CONTRACT_NO|ASC|
||||||SEQ_NO|ASC|
|CONTRACT_DETAIL_I4|||||ITEM_PARENT|ASC|
|CONTRACT_DETAIL_I6|||||DIFF_2|ASC|
|CONTRACT_DETAIL_I5|||||DIFF_1|ASC|
|CONTRACT_DETAIL_I8|||||DIFF_4|ASC|
|CONTRACT_DETAIL_I2|||||CONTRACT_NO|ASC|
||||||ITEM_GRANDPARENT|ASC|
||||||ITEM_PARENT|ASC|
||||||ITEM|ASC|
||||||DIFF_1|ASC|
||||||DIFF_2|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||DIFF_3|ASC|
||||||DIFF_4|ASC|
||||||LOCATION|ASC|
||||||READY_DATE|ASC|
|CONTRACT_DETAIL_I7|||||DIFF_3|ASC|
|CONTRACT_DETAIL_I3|||||ITEM|ASC|
|CONTRACT_DETAIL_I1|||||ITEM_LEVEL_INDEX|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CNTR_DETAIL_ITEM_LEVEL_IND|item_level_index IN (1,2,3,4,5,6)<br>|
||CHK_CNTR_DETAIL_ITEM_PARENT_IT|item_grandparent is not NULL or item_parent is not NULL or item is not NULL<br>|
||CHK_CNTR_DETAIL_LOC_TYPE|loc_type IN ('S','W')<br>|
|Column Level|LOC_TYPE||

---

## Table: CONTRACT_HEADER

**Description:** This table contains one row for each contract placed within Oracle Retail. A contract is defined as a legally binding agreement with a supplier to supply stated SKUs at a particular price.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CONTRACT_NO | P |  | Y | NUMERIC (6) | This field contains the number that uniquely identifies a contract within the system. |
| 2 | CONTRACT_TYPE |  |  | Y | VARCHAR (1) | This field indicates the type of contract. Valid values are: A - contracts with a production plan and declared supplier availability, B - contracts with a production plan and no declared supplier availability, C - contracts with no production plan and no supplier availability, D - contracts with no production plan and declared supplier availability |
| 3 | DEPT |  | F | Y | NUMERIC (4) | This field contains the department number for the contract. Unlike orders, contracts are always limited to a single department. |
| 4 | SUPPLIER |  | F | Y | NUMERIC (10) | This field contains the supplier for the contract. This vendor will provide the merchandise specified in the contract. |
| 5 | TERMS |  | F | Y | VARCHAR (15) | This field contains the sales terms for the contract. These terms specify when payment is due and if any discounts exist for early payment. |
| 6 | STATUS |  |  | Y | VARCHAR (1) | This field contains the status for the contract. The valid statuses are as follows: W - Worksheet, S - Submitted, A - Approved, R - Reviewed, C - Complete, X - Cancelled |
| 7 | STATUS_DATE |  |  | Y | Date | This field contains the date the status was last updated within the system. |
| 8 | CREATE_DATE |  |  | Y | Date | This field contains the date the contract was created within the system. |
| 9 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the Oracle user ID of the person creating the contract. |
| 10 | SUBMITTED_DATE |  |  |  | Date | This field contains the date the contract status is set to submitted. |
| 11 | SUBMITTED_ID |  |  |  | VARCHAR (30) | This field contains the Oracle user ID of the person submitting the contract. |
| 12 | APPROVAL_DATE |  |  |  | Date | This field contains the date the contract status is set to approved. |
| 13 | APPROVAL_ID |  |  |  | VARCHAR (30) | This field contains the Oracle user ID of the user approving the contract. |
| 14 | REVIEW_DATE |  |  |  | Date | This field contains the date the contract status is set to Review. |
| 15 | REVIEW_ID |  |  |  | VARCHAR (30) | This field contains the Oracle user ID of the user reviewing the contract. |
| 16 | CANCEL_DATE |  |  |  | Date | This field contains the date the status is set to cancelled. |
| 17 | CANCEL_ID |  |  |  | VARCHAR (30) | This field contains the Oracle user ID of the person cancelling the contract. |
| 18 | COMPLETE_DATE |  |  |  | Date | This field contains the date the contract was completed and closed. |
| 19 | START_DATE |  |  | Y | Date | This field contains the contract start date. |
| 20 | END_DATE |  |  | Y | Date | This field contains the contract end date. |
| 21 | LAST_ORDERED_DATE |  |  |  | Date | This field contains the last date an order was created within the system. |
| 22 | DISTRIBUTOR |  |  |  | VARCHAR (10) | This field contains the distributor name who will collect the merchandise from the supplier and deliver to the retailer. |
| 23 | COUNTRY_ID |  | F | Y | VARCHAR (3) | This field contains the abbreviation for the country where the contract originated. |
| 24 | CURRENCY_CODE |  | F | Y | VARCHAR (3) | This field contains the currency code for the currency associated with this contract. |
| 25 | SHIP_METHOD |  |  |  | VARCHAR (2) | This field contains a code representing the method of shipment associated with the contract. Valid values are: AR - Air, RD - Road, SA - Sea, RL - Rail |
| 26 | TOTAL_COST |  |  |  | NUMERIC (20,4) | This field contains the total value of the contract. This amount is the commitment recorded in the Open to Buy module for the contract. This field is only populated for contract types C and D. |
| 27 | OUTSTAND_COST |  |  |  | NUMERIC (20,4) | This field contains the total cost of items that have not been ordered from the contract. This field is only populated for contract types C and D. |
| 28 | EST_DUTY |  |  |  | NUMERIC (20,4) | This field contains the estimated duty for the contract. This field can be entered on the contract header form for estimation purposes. |
| 29 | EST_EXPENSES |  |  |  | NUMERIC (20,4) | This field contains the estimated expenses for the contract. This field can be entered on the contract header form for estimation purposes. |
| 30 | EDI_CONTRACT_IND |  |  | Y | VARCHAR (1) | This field indicates whether or not the contract will be transmitted to the supplier via an EDI transaction. The valid values for this field are: Y - Yes, N - No, S - Sent |
| 31 | EDI_SENT_IND |  |  |  | VARCHAR (1) | This column will indicate whether or not the contract has been sent. Valid values are Yes or No. |
| 32 | CONTRACT_APPROVAL_IND |  |  | Y | VARCHAR (1) | This field indicates whether orders attached to the contract require manual approval. Valid values are: Y, N. |
| 33 | ORDERABLE_IND |  |  | Y | VARCHAR (1) | This column will determine whether the contract can be ordered against. Valid values are Yes or No. |
| 34 | CUR_REPL_COST |  |  |  | NUMERIC (20,4) | This field contains the cost that has been raised against the contract by the temporary orders (ORD_TEMP records) during the contract |
| 35 | COMMENT_DESC |  |  |  | VARCHAR (2000) | This field contains any miscellaneous comments attached to the contract. |
| 36 | IMPORT_COUNTRY_ID |  |  | Y | VARCHAR (3) | This column holds Import Country Id. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CONTRACT_HEADER|PK||||CONTRACT_NO|ASC|
|CONTRACT_HEADER_I5|||||TERMS|ASC|
|CONTRACT_HEADER_I1|||||COUNTRY_ID|ASC|
|CONTRACT_HEADER_I2|||||CURRENCY_CODE|ASC|
|CONTRACT_HEADER_I3|||||DEPT|ASC|
|CONTRACT_HEADER_I4|||||SUPPLIER|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CONTRACT_HDR_CONTRACT_TYPE|CONTRACT_TYPE IN ('A', 'B', 'C', 'D')<br>|
||CHK_CONTRACT_HDR_CONT_APP_IND|CONTRACT_APPROVAL_IND IN ('Y', 'N')<br>|
||CHK_CONTRACT_HDR_EDI_CONT_IND|EDI_CONTRACT_IND IN ('Y', 'N')<br>|
||CHK_CONTRACT_HDR_EDI_SENT_IND|edi_sent_ind IN ('Y','N')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_CONTRACT_HDR_ORDERABLE_IND|orderable_ind IN ('Y','N')<br>|
||CHK_CONTRACT_HDR_SHIP_METHOD|SHIP_METHOD IN ('AR', 'RD', 'SA', 'RL')<br>|
||CHK_CONTRACT_HDR_STATUS|STATUS IN ('W', 'S', 'A', 'R', 'C', 'X')<br>|
|Column Level|CONTRACT_TYPE||
||STATUS||
||SHIP_METHOD||
||EDI_CONTRACT_IND||
||EDI_SENT_IND||
||CONTRACT_APPROVAL_IND||
||ORDERABLE_IND||

---

## Table: CONTRACT_MATRIX_TEMP

**Description:** This table is a temporary table used by the Contract Distribution forms. This table contains the records while they are in process of being distributed in the form. Once the changes in the form are saved, all records on this table are written to the CONTRACT_COST and CONTRACT_DETAIL table appropriately and this table is cleared.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CONTRACT_NO |  |  | Y | NUMERIC (6) | This column contains the identifier of the contract. |
| 2 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group two levels above the item. |
| 3 | ITEM_PARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group at the level above the item. |
| 4 | ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 5 | REF_ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the reference item. |
| 6 | DIFF_1 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 7 | DIFF_2 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 8 | DIFF_3 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 9 | DIFF_4 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 10 | LOC_TYPE |  |  |  | VARCHAR (1) | This filed contains the location type of the location field. Valid Values: S - Store, W - Warehouse |
| 11 | LOCATION |  |  |  | NUMERIC (10) | This column contains the number of the location where the planned delivery quantity will be delivered. |
| 12 | READY_DATE |  |  |  | Date | This field contains the date the supplier has agreed to deliver the total number of items for this contract. |
| 13 | QTY |  |  |  | NUMERIC (20,4) | This field contains the quantity contracted with the supplier for this item. |
| 14 | UNIT_COST |  |  |  | NUMERIC (20,4) | This field contains the contracted unit cost of the item. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|CONTRACT_MATRIX_TEMP_I1|UN||||CONTRACT_NO|ASC|
||||||ITEM_GRANDPARENT|ASC|
||||||ITEM_PARENT|ASC|
||||||ITEM|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||DIFF_1|ASC|
||||||DIFF_2|ASC|
||||||DIFF_3|ASC|
||||||DIFF_4|ASC|
||||||LOCATION|ASC|
||||||READY_DATE|ASC|

---

## Table: CONTRACT_ORDHEAD

**Description:** This table is a temporary table used in the manual creation of orders against contracts in the on-line dialogue.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CONTRACT_ORDHEAD_SEQ | P |  | Y | NUMERIC (4) | This field contains the sequence number related to the current session of the on-line dialogue. |
| 2 | CONTRACT_NO | P |  | Y | NUMERIC (6) | This field contains the number that uniquely identifies a contract within the system. |
| 3 | ORDER_NO |  |  | Y | NUMERIC (12) | This field contains the number that uniquely identifies an order within the system. |
| 4 | CREATE_STATUS |  |  | Y | VARCHAR (1) | This field indicates the status of the order on the temporary record. The valid values are: B - Built, C- Created, G - Generated |
| 5 | ORDER_TYPE |  |  |  | VARCHAR (3) | This field contains the order type for the order being created. The valid values are: N/B - Non Basic, ARB - Automatic Reorder of Basic, BRB - Buyer Reorder of Basic. |
| 6 | DEPT |  |  | Y | NUMERIC (4) | This field contains the department number that the order being created will be created for. |
| 7 | SUPPLIER |  |  | Y | NUMERIC (10) | This field contains the vendor number which will provide the merchandise specified in the order being created. |
| 8 | NOT_BEFORE_DATE |  |  | Y | Date | This field contains the first date that delivery of the order will be accepted. |
| 9 | NOT_AFTER_DATE |  |  | Y | Date | This field contains the last date that delivery of the order will be accepted. |
| 10 | CURRENCY_CODE |  |  | Y | VARCHAR (3) | This field contains the abbreviated code of the currency associated with |
| 11 | COUNTRY_ID |  |  | Y | VARCHAR (3) | This field contains the abbreviated code of the country in which the order originated. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CONTRACT_ORDHEAD|PK||||CONTRACT_ORDHEAD_SEQ|ASC|
||||||CONTRACT_NO|ASC|

---

## Table: CONTRACT_ORDLOC

**Description:** This table is a temporary table used in the manual creation of orders against contracts on-line dialogue.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CONTRACT_ORDHEAD_SEQ | P |  | Y | NUMERIC (4) | This field contains the sequence number related to the current session of the on-line dialogue. |
| 2 | CONTRACT_NO | P |  | Y | NUMERIC (6) | This field contains the number that uniquely identifies a contract within the system. |
| 3 | ITEM | P |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 4 | LOCATION | P |  | Y | NUMERIC (10) | This column contains a number that represents either the store or warehouse for this contract order. |
| 5 | LOC_TYPE |  |  | Y | VARCHAR (1) | This column contains either S for store or W for warehouse to indicate the type of location. |
| 6 | ORDER_NO |  |  |  | NUMERIC (12) | This field contains the number that uniquely identifies an order within the system. |
| 7 | UNIT_RETAIL |  |  | Y | NUMERIC (20,4) | This field contains the current retail price for the SKU at this location. |
| 8 | QTY_ORDERED |  |  | Y | NUMERIC (12,4) | This field contains the total quantity to be ordered for this SKU at this location. |

---

## Table: CONTRACT_ORDSKU

**Description:** This table is a temporary table used in the manual creation of orders against contracts on-line dialogue.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CONTRACT_ORDHEAD_SEQ | P |  | Y | NUMERIC (4) | This field contains the sequence number related to the current session of the on-line dialogue. |
| 2 | ITEM | P |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 3 | CONTRACT_NO |  |  |  | NUMERIC (6) | This field contains the number that uniquely identifies a contract within the system. |
| 4 | ORDER_NO |  |  |  | NUMERIC (12) | This field contains the number that uniquely identifies an order within the system. |
| 5 | UNIT_COST |  |  |  | NUMERIC (20,4) | This column displays the cost of the SKU. |

---

## Table: PARTNER

**Description:** This table is used to store partner detail information. Partners can include any outside entity (Banks, Agents, etc.) that the company deals with except suppliers, whose detail information is stored on the sups table. This table contains one row for each partner within the company.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PARTNER_TYPE | P |  | Y | VARCHAR (6) | Specifies the type of partner. Valid values are Bank BK, Agent AG, Freight Forwarder FF, Importer IM, Broker BR, Factory FA, Applicant AP, Consolidator CO, and Consignee CN, Supplier hierarchy level 1 S1, Supplier hierarchy level 2 S2, Supplier hierarchy level 3 S3. |
| 2 | PARTNER_ID | P |  | Y | VARCHAR (10) | Unique identifying number for a partner within the system. The user determines this number when a new partner is first added to the system. |
| 3 | PARTNER_DESC |  |  | Y | VARCHAR (240) | Contains the partners description or name. |
| 4 | CURRENCY_CODE |  | F | Y | VARCHAR (3) | Contains a code identifying the currency the partner uses for business transactions. |
| 5 | LANG |  | F |  | NUMERIC (6) | This field contains the partners preferred language. |
| 6 | STATUS |  |  | Y | VARCHAR (1) | Determines whether the partner is currently active. Valid values include: A for an active partner or I for an inactive partner. The status of a partner will be checked when an order is being created to make certain the partner is active. |
| 7 | CONTACT_NAME |  |  | Y | VARCHAR (120) | Contains the name of the partners representative contract. |
| 8 | CONTACT_PHONE |  |  | Y | VARCHAR (20) | Contains the phone number of the partners representative contact. |
| 9 | CONTACT_FAX |  |  |  | VARCHAR (20) | Contains the fax number of the partners representative contact. |
| 10 | CONTACT_TELEX |  |  |  | VARCHAR (20) | Contains the telex number of the partners representative contact. |
| 11 | CONTACT_EMAIL |  |  |  | VARCHAR (100) | Contains the e-mail address of the partners representative contact. |
| 12 | MFG_ID |  |  |  | VARCHAR (18) | Contains the manufacturers tax identification number. This field is NULL when the Partner Type is Bank (BK). |
| 13 | PRINCIPLE_COUNTRY_ID |  | F |  | VARCHAR (3) | Contains the country id to which the partner is assigned. This field is NULL when the Partner Type is Bank (BK). |
| 14 | LINE_OF_CREDIT |  |  |  | NUMERIC (20,4) | Contains the line of credit the company has at the Bank in the Partners currency. This field is not NULL when the Partner Type is Bank (BK). |
| 15 | OUTSTAND_CREDIT |  |  |  | NUMERIC (20,4) | Contains the total amount of credit that the company has used or has charged against in the Partners currency. This field is not NULL when the Partner Type is Bank (BK). |
| 16 | OPEN_CREDIT |  |  |  | NUMERIC (20,4) | Contains the total amount that the company can still charge against in the Partners currency. This field is not NULL when the Partner Type is Bank (BK). |
| 17 | YTD_CREDIT |  |  |  | NUMERIC (20,4) | Contains the total amount of credit the company has used this year to date in the Partners currency. This field is not NULL when the Partner Type is Bank (BK). |
| 18 | YTD_DRAWDOWNS |  |  |  | NUMERIC (20,4) | Contains the year to date payments the bank has made on behalf of the company in the Partners currency. This field is not NULL when the Partner Type is Bank (BK). |
| 19 | TAX_ID |  |  |  | VARCHAR (18) | Contains the unique tax identification number of the partner. This will be used for reporting during the Customs Entry process. |
| 20 | TERMS |  |  | Y | VARCHAR (15) | Payment terms for the partner. These terms specify when payment is due and if any discounts exist for early payment. If populated, they will default on any invoice entered for this partner. |
| 21 | SERVICE_PERF_REQ_IND |  |  | Y | VARCHAR (1) | Indicates if the expense vendors services (e.g. snowplowing, window washing) must be confirmed as performed before paying an invoice from that expense vendor. Valid values are Y (all service non-merchandise lines on an invoice from this expense vendor must be confirmed before the invoice can be paid) and N (services do not need to be confirmed or partner is not an expense vendor). |
| 22 | INVC_PAY_LOC |  |  |  | VARCHAR (6) | Indicates where invoices from this expense vendor are paid - at the store or centrally through corporate accounting. Valid values are S (paid at the store) and C (paid centrally). This field will only be populated for |
| 23 | INVC_RECEIVE_LOC |  |  |  | VARCHAR (6) | Indicates where invoices from this expense vendor are received - at the store or centrally through corporate accounting. Valid values are S (received at the store) and C (received centrally). This field should only be populated when using invoice matching. |
| 24 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3) | Import country of the Import Authority. This field is not populated for other partner types. |
| 25 | PRIMARY_IA_IND |  |  | Y | VARCHAR (1) | Indicates if an Import Authority is the primary Import Authority for an import country. This field will always be N for other partner types. There must be one and only one primary Import Authority for each country associated with an Import Authority on the partner table. |
| 26 | COMMENT_DESC |  |  |  | VARCHAR (2000) | Contains any comments associated with the Partner. |
| 27 | TSF_ENTITY_ID |  | F |  | NUMERIC (10) | ID of the transfer entity with which an external finisher (partner_type = E) is associated. Valid values are found on the TSF_ENTITY table. A transfer entity is a group of locations that share legal requirements around product management. If SYSTEM_OPTIONS.INTERCOMPANY_TRANSFER_IND = Y, then each external finisher will be required to have an associated TSF_ENTITY_ID. If SYSTEM_OPTIONS.INTERCOMPANY_TRANSFER_IND = N, then transfer entity functionality is not used and PARTNER.TSF_ENTITY_ID will not be required. |
| 28 | VAT_REGION |  | F |  | NUMERIC (4) | VAT (value added tax) region with which a partner is associated. Valid values will be found on the VAT_REGION table. If SYSTEM_OPTIONS.DEFAULT_TAX_TYPE is SVAT, then each partner will be required to have an associated VAT_REGION. For other default_tax_type, then VAT functionality is not used and PARTNER.VAT_REGION will not be required. |
| 29 | ORG_UNIT_ID |  | F |  | NUMERIC (15) | Org Unit Id |
| 30 | PARTNER_NAME_SECONDARY |  |  |  | VARCHAR (240) | This wil hold the secondary name of the partner. |
| 31 | AUTO_RCV_STOCK_IND |  |  | Y | VARCHAR (1) | This will indicate whether the system will update the stock for the external finisher when the 1st leg of the transfer is shipped. Valid values are Yes or No |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_PARTNER|PK||||PARTNER_TYPE|ASC|
||||||PARTNER_ID|ASC|
|PARTNER_I3|||||LANG|ASC|
|PARTNER_I5|||||VAT_REGION|ASC|
|PARTNER_I1|||||CURRENCY_CODE|ASC|
|PARTNER_I2|||||PRINCIPLE_COUNTRY_ID|ASC|
|PARTNER_I4|||||TSF_ENTITY_ID|ASC|
|PARTNER_I6|||||ORG_UNIT_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_PARTNER_AUTO_RCV_STOCK_IND|AUTO_RCV_STOCK_IND IN ('Y','N')<br>|
||CHK_PARTNER_INVC_PAY_LOC|INVC_PAY_LOC IN ('S','C')<br>|
||CHK_PARTNER_INVC_RECEIVE_LOC|INVC_RECEIVE_LOC IN ('S','C')<br>|
||CHK_PARTNER_PARTNER_TYPE|partner_type in ('BK', 'AG', 'FF', 'IM', 'BR', 'FA', 'AP', 'CO', 'CN', 'S1', 'S2', 'S3','EV', 'IA','ES','EC', 'E') and ((partner_type = 'BK' and mfg_id<br>is null and tsf_entity_id is null and line_of_credit is not null and outstand_credit is not null and open_credit is not null and ytd_credit is not<br>null and ytd_drawdowns is not null) or (partner_type = 'E' and mfg_id is null and line_of_credit is null and outstand_credit is null and<br>open_credit is null and ytd_credit is null and ytd_drawdowns is null)) or (partner_type != 'BK' and partner_type != 'E' and tsf_entity_id is<br>null and line_of_credit is null and outstand_credit is null and open_credit is null and ytd_credit is null and ytd_drawdowns is null)<br>|
||CHK_PARTNER_PRIMARY_IA_IND|PRIMARY_IA_IND IN ('Y','N')|






|Type|Column / Constraint Name|Details|
|---|---|---|
||||
||CHK_PARTNER_SERVI_PERF_REQ_IND|SERVICE_PERF_REQ_IND in ('Y','N')<br>|
||CHK_PARTNER_STATUS|status in ('A', 'I')<br>|
|Column Level|STATUS||
||SERVICE_PERF_REQ_IND||
||INVC_PAY_LOC||
||INVC_RECEIVE_LOC||
||PRIMARY_IA_IND||
||AUTO_RCV_STOCK_IND||

---

## Table: PARTNER_CFA_EXT

**Description:** This is the custom attribute extension table for the entity PARTNER.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PARTNER_TYPE | P | F | Y | VARCHAR (6) | Specifies the type of partner. Valid values are Bank BK, Agent AG, Freight Forwarder FF, Importer IM, Broker BR, Factory FA, Applicant AP, Consolidator CO, and Consignee CN, Supplier hierarchy level 1 S1, Supplier hierarchy level 2 S2, Supplier hierarchy level 3 S3. |
| 2 | PARTNER_ID | P | F | Y | VARCHAR (10) | Unique identifying number for a partner within the system. The user determines this number when a new partner is first added to the system. |
| 3 | GROUP_ID | P |  | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this attribute. |
| 4 | VARCHAR2_1 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_1 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 5 | VARCHAR2_2 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_2 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 6 | VARCHAR2_3 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_3 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 7 | VARCHAR2_4 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_4 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 8 | VARCHAR2_5 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_5 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 9 | VARCHAR2_6 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_6 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 10 | VARCHAR2_7 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_7 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 11 | VARCHAR2_8 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_8 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 12 | VARCHAR2_9 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_9 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 13 | VARCHAR2_10 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_10 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 14 | NUMBER_11 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_11 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 15 | NUMBER_12 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_12 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 16 | NUMBER_13 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_13 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 17 | NUMBER_14 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_14 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 18 | NUMBER_15 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_15 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 19 | NUMBER_16 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_16 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 20 | NUMBER_17 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_17 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 21 | NUMBER_18 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_18 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 22 | NUMBER_19 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_19 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 23 | NUMBER_20 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_20 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 24 | DATE_21 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_21 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 25 | DATE_22 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_22 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 26 | DATE_23 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_22 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 27 | DATE_24 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_23 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 28 | DATE_25 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_23 in CFA_ATTRIB.STORAGE_COL_NAME. |

---

## Table: PARTNER_L10N_EXT

**Description:** This is the LFAS storage table for the entity PARTNER

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PARTNER_TYPE | P | F | Y | VARCHAR (6) | Specifies the type of partner. Valid values are Bank BK, Agent AG, Freight Forwarder FF, Importer IM, Broker BR, Factory FA, Applicant AP, Consolidator CO, and Consignee CN, Supplier hierarchy level 1 S1, Supplier hierarchy level 2 S2, Supplier hierarchy level 3 S3. |
| 2 | PARTNER_ID | P | F | Y | VARCHAR (10) | Unique identifying number for a partner within the system. The user determines this number when a new partner is first added to the system. |
| 3 | L10N_COUNTRY_ID | P | F | Y | VARCHAR (3) | This column holds the country this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this country in its localization pack. |
| 4 | GROUP_ID | P | F | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this country/attribute group in the countrys localization pack. |
| 5 | VARCHAR2_1 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_1 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 6 | VARCHAR2_2 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_2 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 7 | VARCHAR2_3 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_3 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 8 | VARCHAR2_4 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_4 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 9 | VARCHAR2_5 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_5 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 10 | VARCHAR2_6 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_6 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 11 | VARCHAR2_7 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_7 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 12 | VARCHAR2_8 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_8 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 13 | VARCHAR2_9 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_9 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 14 | VARCHAR2_10 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_10 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 15 | NUMBER_11 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_11 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 16 | NUMBER_12 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_12 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 17 | NUMBER_13 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_13 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 18 | NUMBER_14 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_14 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 19 | NUMBER_15 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_15 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 20 | NUMBER_16 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_16 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 21 | NUMBER_17 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_17 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 22 | NUMBER_18 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_18 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 23 | NUMBER_19 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_19 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 24 | NUMBER_20 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_20 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 25 | DATE_21 |  |  |  | Date | This column holds data related to the attribute defined on the L10N_ATTRIB table that references DATE_21 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |
| 26 | DATE_22 |  |  |  | Date | This column holds data related to the attribute defined on the L10N_ATTRIB table that references DATE_22 as its L10N_ATTRIB.ATTRIB_STORAGE_COL |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_PARTNER_L10N_EXT|PK||||PARTNER_TYPE|ASC|
||||||PARTNER_ID|ASC|
||||||L10N_COUNTRY_ID|ASC|
||||||GROUP_ID|ASC|

---

## Table: PARTNER_MFQUEUE

**Description:** This table tracks changes in RMS that need to be published to the RIB. It is populated by calls to ADDTOQ. It is updated and deleted from by calls to GETNXT and PUB_RETRY.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | The sequence in which the records was placed in the PARTNER_MFQUEUE. Used to order the publication of messages to the RIB. |
| 2 | PARTNER_TYPE |  |  | Y | VARCHAR (6) | Functional key that uniquely identify the change to the partner table that caused the record to be written to the PARTNER_MFQUEUE. Partner_type and partner_id uniquely identify a partner. |
| 3 | PARTNER_ID |  |  | Y | VARCHAR (10) | Functional key that uniquely identify the change to the partner table that caused the record to be written to the PARTNER_MFQUEUE. Partner_type and partner_id uniquely identify a partner. |
| 4 | ADDR_KEY |  |  |  | NUMERIC (11) | Functional key that uniquely identifies the change to the address table that caused the record to be written to the PARTNER_MFQUEUE. Addr_key uniquely identifies an address. |
| 5 | MESSAGE_TYPE |  |  | Y | VARCHAR (15) | Describes the action in RMS that is causing the message to be published to the RIB. |
| 6 | FAMILY |  |  | Y | VARCHAR (30) | The functional area that this transaction belongs to, in this case, partner. |
| 7 | CUSTOM_MESSAGE_TYPE |  |  |  | VARCHAR (1) | Not used by RMS. |
| 8 | PUB_STATUS |  |  | Y | VARCHAR (1) | Set to Unpublished upon insertion into the table. Will be set to Hospital when a non-fatal error is encountered during the publication process. |
| 9 | TRANSACTION_NUMBER |  |  |  | NUMERIC (10) | Business transaction key. |
| 10 | TRANSACTION_TIME_STAMP |  |  |  | Date | Time of record creation. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_PARTNER_MFQUEUE|PK||||SEQ_NO|ASC|

---

## Table: PARTNER_ORG_UNIT

**Description:** PARTNER_ORG_UNIT table will be the master table for Supplier/Supplier Site and Org Unit ID relation. This table will be populated when either Multiple Set of Books is ON And/or Financial AP is O.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PARTNER | P | F | Y | NUMERIC (10) | This field contains either Suppler or Supplier Site. |
| 2 | ORG_UNIT_ID | P | F | Y | NUMERIC (15) | This field contains org_unit_id. |
| 3 | PARTNER_TYPE | P |  | Y | VARCHAR (1) | Identifies the type of the partner. S for Supplier and U for Supplier Site. |
| 4 | PRIMARY_PAY_SITE |  |  |  | VARCHAR (1) | Primary payment site indicator. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 6 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_PARTNER_ORG_UNIT|PK||||PARTNER|ASC|
||||||ORG_UNIT_ID|ASC|
||||||PARTNER_TYPE|ASC|
|PARTNER_ORG_UNIT_I1|||||ORG_UNIT_ID|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_POU_PARTNER_TYPE|partner_type in ('S','U')<br>|

---

## Table: PARTNER_PUB_INFO

**Description:** This table helps the publication of partner. It does this by tracking the state of the partner and holding any information that can be populated at the header level and used in detail level publication.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PARTNER_TYPE | P |  | Y | VARCHAR (6) | One of the business object ids to publish by. They uniquely identify the row on the partner table. |
| 2 | PARTNER_ID | P |  | Y | VARCHAR (10) | One of the business object ids to publish by. They uniquely identify the row on the partner table. |
| 3 | PUBLISHED |  |  | Y | VARCHAR (1) | Indicates whether or not the transaction has been initially published. Set to N upon insertion into the table. When the entire transaction is published, it is set to Y. If some of the details in the transaction are published, but some are not, this indicator will be set to I (in progress). |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_PARTNER_PUB_INFO|PK||||PARTNER_TYPE|ASC|
||||||PARTNER_ID|ASC|

---

## Table: PARTNER_TL

**Description:** This is the translation table for PARTNER table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | PARTNER_TYPE | P | F | Y | VARCHAR (6) | Specifies the type of partner. Valid values are Bank BK, Agent AG, Freight Forwarder FF, Importer IM, Broker BR, Factory FA, Applicant AP, Consolidator CO, and Consignee CN, Supplier hierarchy level 1 S1, Supplier hierarchy level 2 S2, Supplier hierarchy level 3 S3. |
| 3 | PARTNER_ID | P | F | Y | VARCHAR (10) | Unique identifying number for a partner within the system. The user determines this number when a new partner is first added to the system. |
| 4 | PARTNER_DESC |  |  | Y | VARCHAR (240) | Contains the partners description or name. |
| 5 | PARTNER_NAME_SECONDARY |  |  |  | VARCHAR (240) | This wil hold the secondary name of the partner. |
| 6 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 7 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 8 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 9 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_PARTNER_TL|PK||||LANG|ASC|
||||||PARTNER_TYPE|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||PARTNER_ID|ASC|

---

## Table: PROCUREMENT_UNIT_OPTIONS

**Description:** This table contains attributes that affect how procurement functions are configured in RMS. This includes parameters related to purchase orders, deals, contracts, investment buy, open to buy (OTB) and item costing.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | BACKPOST_RCA_RUA_IND |  |  | Y | VARCHAR (1) | Determines if cost or unit adjustments will affect backposted deals processing, where any matched shipment after unmatched shipment will be used to calculate the correct on hand and adjust quantity for WAC calculation. |
| 2 | CALC_NEGATIVE_INCOME |  |  | Y | VARCHAR (1) | The Calculate Negative Income for Deals indicator determines if negative income will be calculated in case of RTV and sales return transactions during deal period. Default value if NULL is N. |
| 3 | COPY_PO_CURR_RATE |  |  |  | VARCHAR (1) | When copying a PO from an existing PO, this indicator determines if the exchange rate will be copied on the new PO. When Y, the exchange rate will be copied from existing POs. If N, then the latest exchange rate is used for POs. |
| 4 | COST_LEVEL |  |  |  | VARCHAR (6) | Indicates which cost bucket is used when calculating the return on investment for investment buy opportunities and also for deals. Valid values are â€˜Nâ€™ for net cost, â€˜NNâ€™ for net net cost and â€˜DNNâ€™ for dead net net cost. |
| 5 | CREDIT_MEMO_LEVEL |  |  | Y | VARCHAR (1) | This indicator decides at what level the credit/debit memos will be posted to ReIM, valid values can be L (Location level), S (Set of Books level), T (Transfer entity level), D (Deal level). Default value if NULL is D. |
| 6 | DEAL_AGE_PRIORITY |  |  | Y | VARCHAR (6) | The Deal Age Priority parameter drives if older or newer deals have a higher priority when more than one deal component applies to the same item/location. Valid values are 'O' for older deals or 'N' for newer deals. |
| 7 | DEAL_LEAD_DAYS |  |  | Y | NUMERIC (3) | This parameter determines the earliest date that a deal created today can become active in RMS, which is calculated by taking the current date plus the value in this parameter. |
| 8 | DEAL_TYPE_PRIORITY |  |  | Y | VARCHAR (6) | The Deal Type Priority parameter controls if annual deals or promotional deals have a higher priority when more than one deal component applies to the same item/location. Valid values are 'A' for annual deals or 'P' for promotional deals. |
| 9 | DEPT_LEVEL_ORDERS |  |  | Y | VARCHAR (1) | Indicates whether multiple department orders will be allowed in the system. If this parameter is set to Y, then only one department is allowed on an order when created via RMS screens or via replenishment. If the value is N, then one or more departments are allowed on orders. |
| 10 | EDI_COST_OVERRIDE_IND |  |  | Y | VARCHAR (1) | This parameter indicates whether RMS will allow costs sent through EDI855 for vendor generated orders to be overridden in RMS. If this field is set to Y, then the unit cost on the PO can be updated by applying deals the unit cost of the item. If this field is set to N, then the cost sent by the supplier will be used. |
| 11 | EXPIRY_DELAY_PRE_ISSUE |  |  | Y | NUMERIC (4) | Indicates the number of days pre-issued order numbers remain valid in RMS before being deleted. |
| 12 | GEN_CONSIGNMENT_INVC_FREQ |  |  | Y | VARCHAR (1) | The frequency that PO (and invoices if applicable) are generated for consignment goods. Valid values include are P - Multiple, W - Weekly, M - Monthly or D - Daily. If it is set to P, then only one PO/Invoice will be generated for each unique level (as defined by the gen_consignment_invc_item_sup_loc_ind ) per run of the sales upload program. If W, then only one PO/Invoice will be generated for each unique level per week. If M, then only one PO/Invoice will be generated for each unique level per month. If D, then only one PO/Invoice will be generated for each unique level per day. |
| 13 | GEN_CON_INVC_ITM_SUP_LOC_IND |  |  | Y | VARCHAR (1) | Identifies the level at which consignment POs and its consignment invoices are generated. Valid values include: S - Supplier/Department, L -Supplier/Department/Loc, I - Supplier/Location/Item. |
| 14 | LATEST_SHIP_DAYS |  |  | Y | NUMERIC (3) | The number of days after which the latest ship date should default from the earliest ship date on POs. |
| 15 | ORD_APPR_CLOSE_DELAY |  |  | Y | NUMERIC (3) | This parameter drives closure of shipped but unreceived orders once the latest ship date crosses the delay period through Order Auto Close batch process. |
| 16 | ORD_APPR_AMT_CODE |  |  | Y | VARCHAR (1) | Determines whether the order approval upper limit amount by user role is based on total cost or total retail of the order. Valid values for this field are: C - Cost R - Retail. Limits by user role are set on the RTK_ROLE_PRIVS table. |
| 17 | ORD_AUTO_CLOSE_PART_RCVD_IND |  |  | Y | VARCHAR (1) | Indicates if partially received orders should be auto closed through Order Auto Close batch. |
| 18 | ORD_PART_RCVD_CLOSE_DELAY |  |  | Y | NUMERIC (3) | This parameter drives closure of partially received orders once the not after date crosses the delay period and ORD_AUTO_CLOSE_PART_RCVD_IND=Y through the Order Auto Close batch process. |
| 19 | ORDER_BEFORE_DAYS |  |  |  | NUMERIC (2) | The number of days prior to the planned ready date for which the system automatically generates the next order specified on the production plan for type B contracts. |
| 20 | ORDER_EXCH_IND |  |  | Y | VARCHAR (1) | This indicator is used if the order exchange rate can be overwritten. When set to Y, a user can update the exchange rate used for order/location level expense to the exchange rate on the order, which would result in expenses and assessments being recalculated . Default value if NULL is N. |
| 21 | OTB_SYSTEM_IND |  |  | Y | VARCHAR (1) | This determines whether client intends to use the Open-to-Buy functionality within RMS. This is also used to control whether to re-calculate OTB during reclassification process. |
| 22 | RCV_COST_ADJ_TYPE |  |  | Y | VARCHAR (1) | Drives the type of Receiver cost adjustment. Valid values are S(Standard) and F(FIFO). The standard adjustment will recalculate WAC using all units on the receivers. The FIFO adjustment will layer the receipts for the PO and create adjust WAC for only those units in stock whose receivers have not been matched. |
| 23 | RECLASS_APPR_ORDER_IND |  |  | Y | VARCHAR (1) | Specifies whether item reclassification can take place if the item exists on an approved order. When this indicator is Y reclass is done as follows: * when department level PO is turned on and PO is in worksheet/submitted - reclass will be allowed * when department level PO is turned on and PO is in approved - reclass will not be allowed if multiple items on PO * when department level PO is turned off and PO is approved and partially received - reclass will not be allowed * when department level PO is turned off and PO is approved - reclass will be allowed Default value if NULL is Y. |
| 24 | REDIST_FACTOR |  |  | Y | NUMERIC (3) | The percentage by which the supplier lead time and warehouse lead time should be incremented to come up with the number of days prior to the not before date that an order should show up on a report listing approved orders requiring redistribution. |
| 25 | SOFT_CONTRACT_IND |  |  |  | VARCHAR (1) | Soft contracting is a option to allow fashion retailer to commit to a above transaction level item (e.g. style) without specifying the diffs that bring the item to transaction level. When set to N, all items on contracts must be indicated at the transaction level before the contract can be used. When set to Y, above transaction level items can be in included in contracts. |
| 26 | WAC_RECALC_ADJ_IND |  |  | Y | VARCHAR (1) | This wil determine if WAC will be recalculated when for adjustments on purchase order during receiving. Default value if NULL is N. |
| 27 | CREATE_ID |  |  | Y | VARCHAR (30) | Stores the Oracle username of the one who inserted the first record. This field is required by the database. |
| 28 | CREATE_DATETIME |  |  | Y | Date | The date and time of when the record was created in the table. This value should only be populated on insert - it should never be updated. |
| 29 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | The Oracle username of the one who most recently updated this record. |
| 30 | LAST_UPDATE_DATETIME |  |  | Y | Date | The date time stamp of the most recent update by the user. |

---

## Table: SUPPLIER_MFQUEUE

**Description:** Staging table for suppliers

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | This sequence number acts as the primary key for the table. |
| 2 | PUB_STATUS |  |  |  | VARCHAR (1) | Contains the status of the message. U = Unprocessed, N = Wait to process |
| 3 | MESSAGE_TYPE |  |  |  | VARCHAR (15) | Contains the message type. |
| 4 | SUPPLIER |  |  |  | NUMERIC (10) | Contains the supplier number |
| 5 | ADDR_SEQ_NO |  |  |  | NUMERIC (15) | Contains the seq_no from the addr table. |
| 6 | ADDR_TYPE |  |  |  | VARCHAR (2) | Contains the address type |
| 7 | RET_ALLOW_IND |  |  |  | VARCHAR (2) | Indicate if returns are allowed for the supplier |
| 8 | ORG_UNIT_ID |  |  |  | NUMERIC (15) | Organizational unit ID |
| 9 | MESSAGE |  |  |  | CLOB | The message that will be sent through the integration bus. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUPPLIER_MFQUEUE|PK||||SEQ_NO|ASC|

---

## Table: SUPP_PREISSUE

**Description:** This table will hold information that will be used to generate preissued order numbers for suppliers.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SUPPLIER | P | F | Y | NUMERIC (10) | The numbers created will be assigned to this supplier. |
| 2 | QTY |  |  | Y | NUMERIC (4) | The quantity of numbers to generate each time. |
| 3 | EXPIRY_DAYS |  |  | Y | NUMERIC (4) | The number of days between when the numbers are generated and when they expire. |
| 4 | FREQUENCY |  |  | Y | NUMERIC (4) | The number of days in between generation of numbers. |
| 5 | NEXT_GEN_DATE |  |  | Y | Date | The next date the system will generate numbers for this supplier. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | The user name of the person who created the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUPP_PREISSUE|PK||||SUPPLIER|ASC|

---

## Table: SUPS

**Description:** This table contains one row for each supplier within the company. When ever a supplier name etc. is used by Oracle Retail, or a supplier number is validated, it is always selected from this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SUPPLIER | P |  | Y | NUMERIC (10) | Unique identifying number for a supplier within the system. The user determines this number when a new supplier is first added to the system. |
| 2 | SUP_NAME |  |  | Y | VARCHAR (240) | Contains the suppliers trading name. |
| 3 | SUP_NAME_SECONDARY |  |  |  | VARCHAR (240) | Secondary name of the supplier. |
| 4 | SUPPLIER_PARENT |  | F |  | NUMERIC (10) | PARENT_SUPPLIER field will store supplier number for the supplier sites. For Suppliers, this field will be NULL. |
| 5 | CONTACT_NAME |  |  | Y | VARCHAR (120) | Contains the name of the suppliers representative contact. |
| 6 | CONTACT_PHONE |  |  | Y | VARCHAR (20) | Contains a telephone number for the suppliers representative contact. |
| 7 | CONTACT_FAX |  |  |  | VARCHAR (20) | Contains a fax number for the suppliers representative contact. |
| 8 | CONTACT_PAGER |  |  |  | VARCHAR (20) | Contains the number for the pager of the suppliers representative contact. |
| 9 | SUP_STATUS |  |  | Y | VARCHAR (1) | Determines whether the supplier is currently active. Valid values include: A for an active supplier or I for an inactive supplier. The status of a supplier will be checked when an order is being created to make certain the supplier is active. |
| 10 | QC_IND |  |  | Y | VARCHAR (1) | Determines whether orders from this supplier will default as requiring quality control. A value of Y means that all orders from this supplier will require quality control unless overridden by the user when the order is created. An N in this field means that quality control will not be required unless indicated by the user during order creation. |
| 11 | QC_PCT |  |  |  | NUMERIC (12,4) | Indicates the percentage of items per receipt that will be marked for quality checking. |
| 12 | QC_FREQ |  |  |  | NUMERIC (2) | Indicates the frequency in which items per receipt will be marked for quality checking. |
| 13 | VC_IND |  |  | Y | VARCHAR (1) | Determines whether orders from this supplier will default as requiring vendor control. A value of Y means that all orders from this supplier will require vendor control. An N in this field means that vendor control will not be required. |
| 14 | VC_PCT |  |  |  | NUMERIC (12,4) | Indicates the percentage of items per receipt that will be marked for vendor checking. |
| 15 | VC_FREQ |  |  |  | NUMERIC (2) | Indicates the frequency in which items per receipt will be marked for vendor checking. |
| 16 | CURRENCY_CODE |  | F | Y | VARCHAR (3) | Contains a code identifying the currency the supplier uses for business transactions. |
| 17 | LANG |  | F |  | NUMERIC (6) | This field contains the suppliers preferred language. This field is provided for custom purchase orders in a specified language. |
| 18 | TERMS |  | F | Y | VARCHAR (15) | Indicator identifying the sales terms that will default when an order is created for the supplier. These terms specify when payment is due and if any discounts exist for early payment. |
| 19 | FREIGHT_TERMS |  | F | Y | VARCHAR (30) | Indicator that references what freight terms will default when a order is created for the supplier. |
| 20 | RET_ALLOW_IND |  |  | Y | VARCHAR (1) | Indicates whether or not the supplier will accept returns. Valid values are Y and N. |
| 21 | RET_AUTH_REQ |  |  | Y | VARCHAR (1) | Indicates if returns must be accompanied by an authorization number when sent back to the vendor. Valid values are Y and N. |
| 22 | RET_MIN_DOL_AMT |  |  |  | NUMERIC (20,4) | Contains a value if the supplier requires a minimum dollar amount to be returned in order to accept the return. Returns of less than this amount will not be processed by the system. This field is stored in the suppliers currency. |
| 23 | RET_COURIER |  |  |  | VARCHAR (250) | Contains the name of the courier that should be used for all returns to the supplier. |
| 24 | HANDLING_PCT |  |  |  | NUMERIC (12,4) | Percentage multiplied by the total order cost to determine the handling cost for the return. |
| 25 | EDI_PO_IND |  |  | Y | VARCHAR (1) | Indicates whether purchase orders will be sent to the supplier via Electronic Data Interchange. Valid values are Y and N. |
| 26 | EDI_PO_CHG |  |  | Y | VARCHAR (1) | Indicates whether purchase order changes will be sent to the supplier via Electronic Data Interchange. Valid values are Y and N. |
| 27 | EDI_PO_CONFIRM |  |  | Y | VARCHAR (1) | Indicates whether this supplier will send acknowledgment of a purchase orders sent via Electronic Data Interchange. Valid values are Y and N. |
| 28 | EDI_ASN |  |  | Y | VARCHAR (1) | Indicates whether this supplier will send Advance Shipment Notifications electronically. Valid values are Y and N. |
| 29 | EDI_SALES_RPT_FREQ |  |  |  | VARCHAR (1) | This field contains the EDI sales report frequency for this supplier. Valid values are: D - Sales and stock information will be downloaded daily W - Sales and stock information will be downloaded weekly |
| 30 | EDI_SUPP_AVAILABLE_IND |  |  | Y | VARCHAR (1) | This field indicates whether the supplier will send availability via EDI. |
| 31 | EDI_CONTRACT_IND |  |  | Y | VARCHAR (1) | This field indicates whether contracts will be sent to the supplier via EDI. |
| 32 | EDI_INVC_IND |  |  | Y | VARCHAR (1) | Indicates whether invoices, debit memos and credit note requests will be sent to/from the supplier via Electronic Data Interchange. Valid values are Y and N. |
| 33 | EDI_CHANNEL_ID |  | F |  | NUMERIC (4) | If the supplier is an EDI supplier and supports vendor initiated ordering, this field will contain the channel ID for the channel to which all inventory for these types of orders will flow. This field is used when a vendor initiated order is created for a physical warehouse to determine the virtual warehouse within the physical warehouse to which the inventory will flow. The virtual warehouse belonging to the indicated channel will be used. This will only be used in a multichannel environment |
| 34 | COST_CHG_PCT_VAR |  |  |  | NUMERIC (12,4) | This field contains the cost change variance by percent. If an EDI cost change is accepted and falls within these boundaries, it will be approved when inserted into the cost change dialogue. |
| 35 | COST_CHG_AMT_VAR |  |  |  | NUMERIC (20,4) | This field contains the cost change variance by amount. If an EDI cost change is accepted and falls within these boundaries, it will be approved when inserted into the cost change dialogue. |
| 36 | REPLEN_APPROVAL_IND |  |  | Y | VARCHAR (1) | Indicates whether contract orders for the supplier should be created in Approved status. Valid values are Y and N. |
| 37 | SHIP_METHOD |  |  |  | VARCHAR (6) | The method used to ship the items on the purchase order from the country of origin to the country of import. Valid values are: 10 (Vessel, Non-container) 11 (Vessel, Container) 12 (Border Water-borne (Only Mexico and Canada)) 20 (Rail, Non-container) 21 (Rail, Container) 30 (Truck, Non-container) 31 (Truck, Container) 32 (Auto) 33 (Pedestrian) 34 (Road, other, includes foot and animal borne) 40 (Air, Non-container) 41 (Air, Container) 50 (Mail) 60 (Passenger, Hand carried) 70 (Fixed Transportation Installation) 80 (Not used at this time) |
| 38 | PAYMENT_METHOD |  |  |  | VARCHAR (6) | LC(Letter of Credit) |
| 39 | CONTACT_TELEX |  |  |  | VARCHAR (20) | This field contains the telex number of the partner or suppliers representative contact. |
| 40 | CONTACT_EMAIL |  |  |  | VARCHAR (100) | This field contains the email address of the partner or suppliers representative contact. |
| 41 | SETTLEMENT_CODE |  |  | Y | VARCHAR (1) | This field indicates which payment process method is used for this supplier. Valid values are: E - Evaluated Receipts Settlement (ERS) N - Not Applicable Choosing a settlement code of type E will cause an Accounts Payable transaction to be written for an item received from this supplier. |
| 42 | PRE_MARK_IND |  |  | Y | VARCHAR (1) | This field indicates whether or not the supplier has agreed to break an order into separate boxes (and mark them) that can be shipped directly to the stores. Valid values are Y and N. |
| 43 | AUTO_APPR_INVC_IND |  |  | Y | VARCHAR (1) | Indicates whether or not the suppliers invoice matches can be automatically approved for payment. Valid values are Y or N. This field will only be populated if invoice matching is installed. |
| 44 | DBT_MEMO_CODE |  |  |  | VARCHAR (1) | Indicates when a debit memo will be sent to the supplier to resolve a discrepancy. Valid values are Y if debit memos are always to be sent, L if debit memos are used only if a credit note is not sent by the invoice due date, or N if debit memos are never to be sent. This field will only be populated if invoice matching is installed. Debit memo codes will be held on the codes table under the code type IMDC. |
| 45 | FREIGHT_CHARGE_IND |  |  | Y | VARCHAR (1) | Indicates if a supplier is allowed to charge freight costs to the client. This field will only be populated if invoice matching is installed. Valid values are Y and N. |
| 46 | AUTO_APPR_DBT_MEMO_IND |  |  | Y | VARCHAR (1) | Indicates whether or not debit memos sent to the supplier can be automatically approved on creation. Valid values are Y or N. This field will only be populated if invoice matching is installed. |
| 47 | PREPAY_INVC_IND |  |  | Y | VARCHAR (1) | Indicates whether or not all invoices for the supplier can be considered pre-paid invoices. This field will only be populated if invoice matching is installed. Valid values are Y and N. |
| 48 | BACKORDER_IND |  |  | Y | VARCHAR (1) | Indicates if backorders or partial shipments will be accepted. |
| 49 | VAT_REGION |  | F |  | NUMERIC (4) | Contains the unique identifying number for the VAT region in the system. |
| 50 | INV_MGMT_LVL |  |  |  | VARCHAR (6) | Indicator that determines whether supplier inventory management information can be set up at the supplier/department level or just at the supplier level. Also determines if orders created through replenishment for this supplier should be split by department or not. If the supplier is returns-only, this field will be null. Otherwise, this field must have value. Values include: D - Department. Split orders by department. S - Supplier. Split orders by supplier. |
| 51 | SERVICE_PERF_REQ_IND |  |  | Y | VARCHAR (1) | Indicates if the suppliers services (e.g. shelf stocking) must be confirmed as performed before paying an invoice from that supplier. Valid values are Y (all service non-merchandise lines on an invoice from this supplier must be confirmed before the invoice can be paid) and N (services do not need to be confirmed). |
| 52 | INVC_PAY_LOC |  |  |  | VARCHAR (6) | Indicates where invoices from this supplier are paid - at the store or centrally through corporate accounting. Valid values are S (paid at the store) and C (paid centrally). This field should only be S if using ReSA to accept payment at the store, and only populated when using invoice matching. |
| 53 | INVC_RECEIVE_LOC |  |  |  | VARCHAR (6) | Indicates where invoices from this supplier are received - at the store or centrally through corporate accounting. Valid values are S (received at the store) and C (received centrally). This field should only be populated |
| 54 | ADDINVC_GROSS_NET |  |  |  | VARCHAR (6) | Indicates if the supplier invoice lists items at gross cost instead of net (off-invoice discounts subtracted). Valid values are G (invoices at gross) or N (invoices at net). These are stored on the code table under a code type of INGN. |
| 55 | DELIVERY_POLICY |  |  | Y | VARCHAR (6) | Contains the delivery policy of the supplier. Next Day indicates that the if a location is closed, the supplier will deliver on the next day. Next Valid Delivery Day indicates that the supplier will wait until the next scheduled delivery day before delivering. Valid values come from the DLVY code on code_head/code_detail. |
| 56 | COMMENT_DESC |  |  |  | VARCHAR (2000) | Any miscellaneous comments associated with the supplier. |
| 57 | DEFAULT_ITEM_LEAD_TIME |  |  |  | NUMERIC (4) | Holds the default lead time for the supplier. The lead time is the time the supplier needs between receiving an order and having the order ready to ship. This value will be defaulted to item/supplier relationships. |
| 58 | DUNS_NUMBER |  |  |  | VARCHAR (9) | This field holds the Dun and Bradstreet number to identify the supplier. |
| 59 | DUNS_LOC |  |  |  | VARCHAR (4) | This field holds the Dun and Bradstreet number to identify the location of the supplier. |
| 60 | BRACKET_COSTING_IND |  |  | Y | VARCHAR (1) | This field will determine if the supplier uses bracket costing pricing structures. Valid values: Y = Yes, N = No. |
| 61 | VMI_ORDER_STATUS |  |  |  | VARCHAR (6) | This column determines the status in which any inbound POs from this supplier are created. A NULL value indicates that the supplier is not a VMI supplier. Orders from these suppliers will be still be created in worksheet status. |
| 62 | DSD_IND |  |  | Y | VARCHAR (1) | Indicates whether the supplier can ship direct to store. Valid values are Y and N. |
| 63 | SCALE_AIP_ORDERS |  |  | Y | VARCHAR (1) | Depending upon the value in this column, scaling is done for AIP orders. Default value is N. |
| 64 | FINAL_DEST_IND |  |  | Y | VARCHAR (1) | Supplier can ship to final destination as per allocation or not. |
| 65 | SUP_QTY_LEVEL |  |  | Y | VARCHAR (6) | This will hold the level at which quantity is ordered at. Valid values are CA for cases; EA for eaches. Default value if NULL is EA |
| 66 | EXTERNAL_REF_ID |  |  |  | VARCHAR (32) | This column holds the ID for the supplier used in the external financial system. It is populated by the integration that brings suppliers from external financial systems into RMS. This ID and the supplier site ID can be used to join to information about the supplier in the external system. |
| 67 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 68 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |
| 69 | STATUS_UPD_BY_RMS |  |  |  | VARCHAR (1) | Column indicates that Supplier is inactivated from RMS. Suppliers inactivated in RMS will have this column updated as Y. Otherwise this column will be null. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUPS|PK||||SUPPLIER|ASC|
|SUPS_I4|||||TERMS|ASC|
|SUPS_I7|||||VAT_REGION|ASC|
|SUPS_I1|||||CURRENCY_CODE|ASC|
|SUPS_I9|||||SUPPLIER_PARENT|ASC|
|SUPS_I2|||||FREIGHT_TERMS|ASC|
|SUPS_I8||Y||UPPER(SUP_NAME)|||
|SUPS_I3|||||LANG|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SUPS_I5|||||EDI_CHANNEL_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SUPS_ADDINVC_GROSS_NET|ADDINVC_GROSS_NET in ('G','N')<br>|
||CHK_SUPS_AUTO_APPR_DBT_MEMO|auto_appr_dbt_memo_ind in ('Y','N')<br>|
||CHK_SUPS_AUTO_APPR_INVC_IND|auto_appr_invc_ind in ('Y','N')<br>|
||CHK_SUPS_BACKORDER_IND|BACKORDER_IND in ('Y','N')<br>|
||CHK_SUPS_BRACKET_COSTING_IND|BRACKET_COSTING_IND IN ('Y','N')<br>|
||CHK_SUPS_DBT_MEMO_CODE|dbt_memo_code in ('Y','L','N')<br>|
||CHK_SUPS_DELIVERY_POLICY|DELIVERY_POLICY IN ('NEXT','NDD')<br>|
||CHK_SUPS_EDI_ASN|EDI_ASN IN ('Y','N')<br>|
||CHK_SUPS_EDI_CONTRACT_IND|EDI_CONTRACT_IND IN ('Y','N')<br>|
||CHK_SUPS_EDI_INVC_IND|EDI_INVC_IND IN ('Y','N')<br>|
||CHK_SUPS_EDI_PO_CHG|EDI_PO_CHG IN ('Y','N')<br>|
||CHK_SUPS_EDI_PO_CONFIRM|EDI_PO_CONFIRM IN ('Y','N')<br>|
||CHK_SUPS_EDI_PO_IND|EDI_PO_IND IN ('Y','N')<br>|
||CHK_SUPS_EDI_SALES_RPT_FREQ|EDI_SALES_RPT_FREQ IN ('D','W')|






|Type|Column / Constraint Name|Details|
|---|---|---|
||||
||CHK_SUPS_EDI_SUPP_AVAIL_IND|EDI_SUPP_AVAILABLE_IND IN ('Y','N')<br>|
||CHK_SUPS_FINAL_DEST_IND|final_dest_ind in ('Y','N')<br>|
||CHK_SUPS_FREIGHT_CHARGE_IND|freight_charge_ind in ('Y','N')<br>|
||CHK_SUPS_INVC_PAY_LOC|INVC_PAY_LOC IN ('S','C')<br>|
||CHK_SUPS_INVC_RECEIVE_LOC|INVC_RECEIVE_LOC IN ('S','C')<br>|
||CHK_SUPS_INV_MGMT_LVL|INV_MGMT_LVL in ('S','D','L','A')<br>|
||CHK_SUPS_PREPAY_INVC_IND|prepay_invc_ind in ('Y','N')<br>|
||CHK_SUPS_PRE_MARK_IND|PRE_MARK_IND IN ('Y','N')<br>|
||CHK_SUPS_QC_IND|QC_IND IN ('Y','N')<br>|
||CHK_SUPS_QC_PCT|qc_ind = 'Y' and qc_pct is not null or qc_ind = 'N' and qc_pct is null<br>|
||CHK_SUPS_REPLEN_APPROVAL_IND|REPLEN_APPROVAL_IND IN ('Y','N')<br>|
||CHK_SUPS_RET_ALLOW_IND|RET_ALLOW_IND IN ('Y','N')<br>|
||CHK_SUPS_RET_AUTH_REQ|RET_AUTH_REQ IN ('Y','N')<br>|
||CHK_SUPS_SCALE_AIP_ORDERS|scale_aip_orders in ('Y','N')<br>|
||CHK_SUPS_SERVICE_PERF_REQ_IND|SERVICE_PERF_REQ_IND IN ('Y','N')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_SUPS_SETTLEMENT_CODE|SETTLEMENT_CODE IN ('E','N')<br>|
||CHK_SUPS_STATUS_UPD_BY_RMS|STATUS_UPD_BY_RMS in ('Y', 'N')<br>|
||CHK_SUPS_SUP_QTY_LEVEL|SUP_QTY_LEVEL in ('EA','CA')<br>|
||CHK_SUPS_SUP_STATUS|SUP_STATUS IN ('A','I')<br>|
||CHK_SUPS_VC_IND|VC_IND IN ('Y', 'N')<br>|
||CHK_SUPS_VMI_ORDER_STATUS|(vmi_order_status in ('W','A')) or (vmi_order_status IS NULL)<br>|
|Column Level|SUP_STATUS||
||QC_IND||
||VC_IND||
||RET_ALLOW_IND||
||RET_AUTH_REQ||
||EDI_PO_IND||
||EDI_PO_CHG||
||EDI_PO_CONFIRM||
||EDI_ASN||
||EDI_SALES_RPT_FREQ||
||EDI_SUPP_AVAILABLE_IND||
||EDI_CONTRACT_IND||
||REPLEN_APPROVAL_IND||
||SETTLEMENT_CODE||
||PRE_MARK_IND||






|Type|Column / Constraint Name|Details|
|---|---|---|
||DBT_MEMO_CODE||
||FREIGHT_CHARGE_IND||
||AUTO_APPR_DBT_MEMO_IND||
||BACKORDER_IND||
||INV_MGMT_LVL||
||SERVICE_PERF_REQ_IND||
||INVC_PAY_LOC||
||INVC_RECEIVE_LOC||
||ADDINVC_GROSS_NET||
||DELIVERY_POLICY||
||BRACKET_COSTING_IND||
||VMI_ORDER_STATUS||
||SCALE_AIP_ORDERS||
||FINAL_DEST_IND||
||SUP_QTY_LEVEL||
||STATUS_UPD_BY_RMS||

---

## Table: SUPS_CFA_EXT

**Description:** This is the custom attribute extension table for the entity SUPS

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SUPPLIER | P | F | Y | NUMERIC (10) | This column holds the Supplier this extended data is associated with. |
| 2 | GROUP_ID | P |  | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this attribute. |
| 3 | VARCHAR2_1 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_1 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 4 | VARCHAR2_2 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_2 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 5 | VARCHAR2_3 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_3 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 6 | VARCHAR2_4 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_4 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 7 | VARCHAR2_5 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_5 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 8 | VARCHAR2_6 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_6 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 9 | VARCHAR2_7 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_7 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 10 | VARCHAR2_8 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_8 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 11 | VARCHAR2_9 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_9 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 12 | VARCHAR2_10 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the CFA_ATTRIB table that references VARCHAR2_10 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 13 | NUMBER_11 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_11 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 14 | NUMBER_12 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_12 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 15 | NUMBER_13 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_13 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 16 | NUMBER_14 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_14 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 17 | NUMBER_15 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_15 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 18 | NUMBER_16 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_16 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 19 | NUMBER_17 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_17 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 20 | NUMBER_18 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_18 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 21 | NUMBER_19 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_19 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 22 | NUMBER_20 |  |  |  | NUMERIC | This column holds data related to the attribute defined on the CFA_ATTRIB table that references NUMBER_20 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 23 | DATE_21 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_21 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 24 | DATE_22 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_22 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 25 | DATE_23 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_23 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 26 | DATE_24 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_24 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 27 | DATE_25 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_25 in CFA_ATTRIB.STORAGE_COL_NAME. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUPS_CFA_EXT|PK||||SUPPLIER|ASC|
||||||GROUP_ID|ASC|

---

## Table: SUPS_IMP_EXP

**Description:** This new table will contain multiple rows for each supplier within the system. Only one default importer/exporter will be provided per supplier.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SUPPLIER | P |  | Y | NUMERIC (10) | Uniquely identities the supplier number. This references the SUPS.SUPPLIER column and a foreign key should be added to reflect this |
| 2 | IMPORT_ID | P |  | Y | NUMERIC (10) | This identifies the importer/exporter assigned to the supplier. This references the WH.WH column, a foreight key should be added for this. |
| 3 | IMPORT_TYPE |  |  | Y | VARCHAR (2) | Valid values are iMporter and eXporter. This determines if entity assigned to a supplier is an importer or exporter. |
| 4 | DEFAULT_IND |  |  | Y | VARCHAR (1) | This will determine if the importer/exporter for the supplier is the default set. There should only be one default importer/exporter per supplier. Default value for this field if NULL is N. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUPS_IMP_EXP|PK||||SUPPLIER|ASC|
||||||IMPORT_ID|ASC|

---

## Table: SUPS_L10N_EXT

**Description:** This is the LFAS storage table for the entity SUPS

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SUPPLIER | P | F | Y | NUMERIC (10) | Unique identifying number for a supplier within the system |
| 2 | L10N_COUNTRY_ID | P | F | Y | VARCHAR (3) | This column holds the country this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the metadata defined for this country in its localization pack. |
| 3 | GROUP_ID | P | F | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, |
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
| 14 | NUMBER_11 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_11 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 15 | NUMBER_12 |  |  |  | NUMERIC (20,4) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references NUMBER_12 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
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
|PK_SUPS_L10N_EXT|PK||||SUPPLIER|ASC|
||||||L10N_COUNTRY_ID|ASC|
||||||GROUP_ID|ASC|

---

## Table: SUPS_MIN_FAIL

**Description:** This table contains a record of orders and locations purged because they did not meet vendor minimums. This table is used for reporting purposes only.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDER_NO |  |  | Y | NUMERIC (12) | Contains the order number of the order being purged. |
| 2 | ITEM |  |  |  | VARCHAR (25) | Unique identifier for the item. |
| 3 | STORE |  |  | Y | NUMERIC (10) | If the entire order is being purged, then both the store and wh fields will contain a -1. If a wh location is being purged, then the store field will contain -1, and the store field will have a valid value. Likewise, if a store location is being purged, the store location will have a valid store value and the wh field will contain a -1. |
| 4 | WH |  |  | Y | NUMERIC (10) | The SUPS_MIN_FAIL table is used to track order line items that failed vendor minimum checks and were therefore purged from the order during the automatic order building process for replenishment. Since vendor minimum checks are performed at the physical wh level, if a physical wh fails the vendor minimum checks, it will be written to this table. |
| 5 | SUPPLIER |  |  | Y | NUMERIC (10) | Contains the supplier of the purged order. |
| 6 | DEPT |  |  |  | NUMERIC (4) | The department number (if applicable) of the order from which line items failing supplier minimums were purged. |
| 7 | MIN_VALUE |  |  | Y | NUMERIC (20,4) | Contains the minimum value the vendor requires. |
| 8 | MAX_VALUE |  |  | Y | NUMERIC (20,4) | Contains the minimum value the vendor requires. |
| 9 | ORDER_VALUE |  |  | Y | NUMERIC (20,4) | Contains the value ordered on the purchase order. |
| 10 | CREATE_DATE |  |  | Y | Date | Contains the date that the record was created. |
| 11 | ERROR_MSG |  |  |  | VARCHAR (255) | Error message indicating why order/location was purged. |

---

## Table: SUPS_PACK_TMPL_DESC

**Description:** This table contains one row for each supplier/pack template combination. It is used to store the description of the supplier/pack template.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SUPPLIER | P | F | Y | NUMERIC (10) | This field holds the supplier number. |
| 2 | PACK_TMPL_ID | P | F | Y | NUMERIC (8) | This field holds the pack template ID. |
| 3 | SUPP_PACK_DESC |  |  | Y | VARCHAR (250) | This field contains the pack description of the suppliers pack template. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUPS_PACK_TMPL_DESC|PK||||SUPPLIER|ASC|
||||||PACK_TMPL_ID|ASC|
|SUPS_PACK_TMPL_DESC_I2|||||PACK_TMPL_ID|ASC|

---

## Table: SUPS_PACK_TMPL_DESC_TL

**Description:** This is the translation table for SUPS_PACK_TMPL_DESC table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | SUPPLIER | P | F | Y | NUMERIC (10) | This field holds the supplier number. |
| 3 | PACK_TMPL_ID | P | F | Y | NUMERIC (8) | This field holds the pack template ID. |
| 4 | SUPP_PACK_DESC |  |  | Y | VARCHAR (250) | This field contains the pack description of the suppliers pack template. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUPS_PACK_TMPL_DESC_TL|PK||||LANG|ASC|
||||||SUPPLIER|ASC|
||||||PACK_TMPL_ID|ASC|

---

## Table: SUPS_ROUTING_LOC

**Description:** This table defines supplier routing locations in ORMS. One supplier can have multiple routing locations, but only one default routing location should be defined for the supplier.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SUPPLIER | P |  | Y | NUMERIC (10) | Uniquely identities the supplier number. This references the SUPS.SUPPLIER column - a foreign key should be created for this. |
| 2 | ROUTING_LOC_ID | P |  | Y | VARCHAR (5) | This identifies the routing location assigned to the supplier. A foreign key should exist that will reference the OUTLOC.OUTLOC_ID column. |
| 3 | DEFAULT_IND |  |  | Y | VARCHAR (1) | This will determine if the routing location for the supplier is the default one. There should only be one default routing location per supplier (Default value if NULL is N). |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUPS_ROUTING_LOC|PK||||SUPPLIER|ASC|
||||||ROUTING_LOC_ID|ASC|

---

## Table: SUPS_TL

**Description:** This is the translation table for SUPS table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | SUPPLIER | P | F | Y | NUMERIC (10) | Unique identifying number for a supplier within the system. The user determines this number when a new supplier is first added to the system. |
| 3 | SUP_NAME |  |  | Y | VARCHAR (240) | Contains the suppliers trading name. |
| 4 | SUP_NAME_SECONDARY |  |  |  | VARCHAR (240) | Secondary name of the supplier. |
| 5 | CONTACT_NAME |  |  | Y | VARCHAR (120) | Contains the name of the suppliers representative contact. |
| 6 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 7 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 8 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 9 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUPS_TL|PK||||LANG|ASC|
||||||SUPPLIER|ASC|

---

## Table: SUP_AVAIL

**Description:** This table is used by the Contract Module. It is populated only for contract types A and D. It records availability declared by a supplier for a particular SKU. It is populated either via manual entry or EDI link with the Supplier.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SUPPLIER | P | F | Y | NUMERIC (10) | This field contains the vendor number who will declare the merchandise available. |
| 2 | ITEM | P | F | Y | VARCHAR (25) | Unique identifier for the item. |
| 3 | REF_ITEM |  |  |  | VARCHAR (25) | Unique alphanumeric value that identifies the reference item. |
| 4 | QTY_AVAIL |  |  | Y | NUMERIC (12,4) | This field contains the total number of items for this SKU that the supplier has agreed as available. |
| 5 | LAST_UPDATE_DATE |  |  | Y | Date | This field contains the last date the availability for this item has been manually modified. |
| 6 | LAST_DECLARED_DATE |  |  |  | Date | This field contains the last date the supplier has declared availability via EDI. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUP_AVAIL|PK||||SUPPLIER|ASC|
||||||ITEM|ASC|
|SUP_AVAIL_I1|||||ITEM|ASC|

---

## Table: SUP_BRACKET_COST

**Description:** This table will contain the actual bracket levels set by the supplier

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SUP_DEPT_SEQ_NO | P | F | Y | NUMERIC (10) | Primary key, system generated by a sequence that will uniquely identify the parent supplier inventory management record at the supplier, supplier/department, supplier/department/location or supplier/location level. |
| 2 | BRACKET_VALUE1 | P |  | Y | NUMERIC (12,4) | Primary key. This field contains the value of the primary bracket type. A specific value, -999, will be used to hold the FOB/pickup bracket value. The values in this field are stored in the bracket UOM 1 field at the parent supplier inventory management level. |
| 3 | SUPPLIER |  |  | Y | NUMERIC (10) | This field contains the unique identifying number for a supplier within the system |
| 4 | DEPT |  |  |  | NUMERIC (4) | This field contains the number which uniquely identifies the department. |
| 5 | LOCATION |  |  |  | NUMERIC (10) | This field contains the number which identifies the location. Only warehouse locations have bracket costing. In a multi-channel environment, only physical warehouses will have brackets attached. This table is being stored at the physical warehouse level because it is easier to maintain at that level since attributes will not vary from virtual warehouse to virtual warehouse within the same physical warehouse. Also, suppliers will have no knowledge (at this point in time) of virtual warehouses within physical warehouses, so this table must be stored at the physical warehouse level. |
| 6 | LOC_TYPE |  |  |  | VARCHAR (1) | This field contains the type of location in the location field. Valid values are: S = Store, W = Warehouse |
| 7 | BRACKET_VALUE2 |  |  |  | NUMERIC (12,4) | This field contains the value of the primary bracket type. The values in this field are stored in the bracket UOM 2 field at the parent supplier inventory management level. |
| 8 | DEFAULT_BRACKET_IND |  |  | Y | VARCHAR (1) | This field contains the value that will control which cost is the base cost for processing throughout the system. Each bracket group (either by supplier, supplier/department, supplier/department/location, supplier/location) must have one bracket defined as the default bracket. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUP_BRACKET_COST|PK||||SUP_DEPT_SEQ_NO|ASC|
||||||BRACKET_VALUE1|ASC|
|UK_SUP_BRACKET_COST|UK||||SUPPLIER|ASC|
||||||DEPT|ASC|
||||||LOCATION|ASC|
||||||BRACKET_VALUE1|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SUP_BRK_COST_DEF_DF_BR_IND|DEFAULT_BRACKET_IND IN ('Y','N')<br>|
||CHK_SUP_BRK_COST_LOC_TYPE|LOC_TYPE IN ('W','S') OR LOC_TYPE IS NULL<br>|
|Column Level|LOC_TYPE||
||DEFAULT_BRACKET_IND||

---

## Table: SUP_DATA

**Description:** This table contains the dollar level transactions by supplier, department, date, and transaction type for the current month. These transactions are used by the end of month processing run to update the table sup_month. All rows are deleted from this table at the end of each end of month processing run. No index is associated with this table because all rows are always selected.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT |  | F | Y | NUMERIC (4) | Contains the department number associated with the transaction. |
| 2 | SUPPLIER |  | F | Y | NUMERIC (10) | Contains the supplier number associated with the transaction. |
| 3 | DAY_DATE |  |  | Y | Date | Identifies the date the transaction was written. |
| 4 | TRAN_TYPE |  |  | Y | NUMERIC (2) | Identifies the type of the transaction. Valid values include: 01 - Purchases at Cost 02 - Purchases at Retail 03 - Claims at Cost 10 - Markdowns at Retail 20 - Cancellations at Cost 30 - Sales at Retail 40 - Quantity Failed |
| 5 | AMOUNT |  |  | Y | NUMERIC (20,4) | Contains the dollar amount of the transaction. This field is stored in the primary currency. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SUP_DATA_I2|||||SUPPLIER|ASC|
|SUP_DATA_I1|||||DEPT|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_SUP_DATA_TRAN_TYP|TRAN_TYPE IN(1, 2, 3, 10, 20, 30, 40)<br>|
|Column Level|TRAN_TYPE||

---

## Table: SUP_IMPORT_ATTR

**Description:** This table is used to import specific attributes associated with a supplier. This table will only be populated if Import2000 is being used.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SUPPLIER | P |  | Y | NUMERIC (10) | Unique identifying number for a supplier within the system. |
| 2 | AGENT |  |  |  | VARCHAR (10) | The agent associated with the supplier. |
| 3 | ADVISING_BANK |  |  |  | VARCHAR (10) | Code for the bank advising the Letter of Credit. |
| 4 | ISSUING_BANK |  |  |  | VARCHAR (10) | issuing_bank |
| 5 | LADING_PORT |  |  |  | VARCHAR (5) | Contains the identification number of the suppliers Lading Port. |
| 6 | DISCHARGE_PORT |  |  |  | VARCHAR (5) | Contains the identification number of the suppliers Discharge Port. |
| 7 | MFG_ID |  |  |  | VARCHAR (18) | Contains the manufacturers tax identification number. |
| 8 | RELATED_IND |  |  | Y | VARCHAR (1) | This field will indicate if the Supplier is related to the company or not. Valid values are Y and N. |
| 9 | BENEFICIARY_IND |  |  | Y | VARCHAR (1) | This field will indicate whether this supplier can be a beneficiary or not. Valid values are Y and N. |
| 10 | WITH_RECOURSE_IND |  |  | Y | VARCHAR (1) | Indicates conditional payment on the part of the bank as instructed by the buyer. Valid values are Y and N. |
| 11 | REVOCABLE_IND |  |  | Y | VARCHAR (1) | Indicates if the Letter of Credit is revocable or not. If this is Y then the Letter of Credit can be amended or cancelled at any time by the buyer or buyers bank. If this is N then the Letter of Credit has to have both buyer and seller approval to do anything. |
| 12 | VARIANCE_PCT |  |  |  | NUMERIC (12,4) | Allowed currency variance percentage for the Letter of Credit. e.g. If the variance pct is 5, this means that Letter of Credit can be under or over paid by 5 percent. |
| 13 | LC_NEG_DAYS |  |  |  | NUMERIC (3) | The number of days to negotiate documents. |
| 14 | PLACE_OF_EXPIRY |  |  |  | VARCHAR (6) | Contains the place where the Letter of Credit will expire. Valid values are: 01 - Issuing Bank, 02 - Advising Bank, 03 - Miami, 04 - New York, 05 - Los Angeles. |
| 15 | DRAFTS_AT |  |  |  | VARCHAR (6) | This field specifies the terms of draft (or when payment is to be made) for the Letter of Credit. Valid values are: 01 - At Sight, 02 - 30 Days, 03 - 60 Days. |
| 16 | PRESENTATION_TERMS |  |  |  | VARCHAR (6) | presentation_terms in (P,A,N) |
| 17 | FACTORY |  |  |  | VARCHAR (10) | Contains the factory partner id for the factory partner type. |
| 18 | PARTNER_TYPE_1 |  | F |  | VARCHAR (6) | Contains the partner type of the first additional partner. |
| 19 | PARTNER_1 |  | F |  | VARCHAR (10) | Contains the partner id of the first additional partner. |
| 20 | PARTNER_TYPE_2 |  | F |  | VARCHAR (6) | Contains the partner type of the second additional partner. |
| 21 | PARTNER_2 |  | F |  | VARCHAR (10) | Contains the partner id of the second additional partner. |
| 22 | PARTNER_TYPE_3 |  | F |  | VARCHAR (6) | Contains the partner type of the third additional partner. |
| 23 | PARTNER_3 |  | F |  | VARCHAR (10) | Contains the partner id of the third additional partner. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUP_IMPORT_ATTR|PK||||SUPPLIER|ASC|
|SUP_IMPORT_ATTR_I3|||||PARTNER_TYPE_3|ASC|
||||||PARTNER_3|ASC|
|SUP_IMPORT_ATTR_I2|||||PARTNER_TYPE_2|ASC|
||||||PARTNER_2|ASC|
|SUP_IMPORT_ATTR_I1|||||PARTNER_TYPE_1|ASC|
||||||PARTNER_1|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SUP_IMP_ATTR_BENEF_IND|beneficiary_ind in ('Y','N')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_SUP_IMP_ATTR_DRAFTS_AT|drafts_at in( '01','02','03')<br>|
||CHK_SUP_IMP_ATTR_PLACE_OF_EXPR|place_of_expiry in ('01','02','03','04','05')<br>|
||CHK_SUP_IMP_ATTR_PRES_TERMS|presentation_terms in ('P','A','N')<br>|
||CHK_SUP_IMP_ATTR_RELATED_IND|related_ind in ('Y','N')<br>|
||CHK_SUP_IMP_ATTR_REVOCABLE_IND|revocable_ind in ('Y','N')<br>|
||CHK_SUP_IMP_ATTR_WITH_REC_IND|with_recourse_ind in ('Y','N')<br>|
|Column Level|RELATED_IND||
||BENEFICIARY_IND||
||WITH_RECOURSE_IND||
||REVOCABLE_IND||
||PLACE_OF_EXPIRY||
||DRAFTS_AT||
||PRESENTATION_TERMS||

---

## Table: SUP_INV_MGMT

**Description:** Determines whether the stock out comparisons for Due order determination should be performed in units (standard unit of measures), cost or profit (i.e. retail - cost) in the orders currency (ex. $US). Will only be used for replenishment orders when the Due Order Indicator is set to Yes. Valid values include:U - Unit service basis. Stock out amounts calculated in units (standard unit of measures).C - Cost service basis. Stock out amounts are calculated as the stock out in units multiplied by the items cost.P - Profit service basis. Stock out amounts are calculated as the stock out in units multiplied by the items margin (i.e. retail - cost).

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SUP_DEPT_SEQ_NO | P |  | Y | NUMERIC (10) | Primary key, system generated by a sequence that will uniquely identify a single supplier or supplier/department record. |
| 2 | SUPPLIER |  | F | Y | NUMERIC (10) | Unique identifying number for the supplier within the system. |
| 3 | DEPT |  | F |  | NUMERIC (4) | Contains the number identifying the department of the supplier for which inventory management information is being specified. |
| 4 | LOCATION |  |  |  | NUMERIC (10) | This field potentially contains a location if the inventory management level is supplier/location or supplier/department/location. If the inventory management level is supplier or supplier/department, this field will always be NULL. For now, this column will only contain physical warehouses. |
| 5 | LOC_TYPE |  |  |  | VARCHAR (1) | This field contains the type of location in the location field. Valid values are: S - Store, W - Warehouse |
| 6 | REVIEW_CYCLE |  |  |  | VARCHAR (6) | Determines when a replenishment review cycle is run. 0 represents a weekly review cycle, 1 represents a daily review cycle, 2 represents a cycle every 2 weeks, 3 represents a cycle every 3 weeks, etc. This field is used as a default when setting up the review cycle for an item/location. |
| 7 | REPL_ORDER_CTRL |  |  |  | VARCHAR (6) | Contains the replenishment order control associated with the supplier, supplier/dept, supplier/loc or supplier/dept/loc. This value will be defaulted to the item/location level when an item/location is set up on replenishment. A value of Manual dictates that any replenishment ROQs generated for the item/location will only be written to the Replenishment Results table. A value of Buyer Worksheet dictates that the replenishment ROQ is processed via the buyer worksheet online dialog. A value of Semi-automatic dictates that the replenishment ROQ will be added to a Worksheet order. A value of Automatic dictates that the replenishment ROQ will be added to an Approved order. |
| 8 | SCALE_CNSTR_IND |  |  | Y | VARCHAR (1) | Indicator used to determine if orders for the supplier or supplier/department should be scaled to meet constraints. This indicator is used for both replenishment and manual orders. Valid values are: Y - Yes. Scale orders to meet constraints. N - No. Do not scale orders to meet constraints. |
| 9 | SCALE_CNSTR_LVL |  |  |  | VARCHAR (6) | Determines the scaling constraint level when scaling orders for the supplier or supplier/department. Valid values include: O - Order level. Scaling constraints apply to the entire order. L - Location level. Scaling constraints apply to each location on the order. |
| 10 | SCALE_CNSTR_OBJ |  |  |  | VARCHAR (6) | Determines if the minimum scaling constraint or the maximum scaling constraint should be used as the objective when scaling the order for the supplier or supplier/department. This applies to both scaling constraints. Valid values include: M - Minimum. Scaling objective is the minimum scaling constraint. For example, if the minimum scaling constraint is 20,000lbs and the maximum scaling constraint is 40,000lbs, orders under 20,000lbs would be scaled to at least 20,000lbs. X - Maximum. Scaling objective is the maximum scaling constraint. For example, if the minimum scaling constraint is 20,000lbs and the maximum scaling constraint is 40,000lbs, orders under 40,000lbs would |
| 11 | SCALE_CNSTR_TYPE1 |  |  |  | VARCHAR (6) | The type of the supplier or supplier/departments primary constraint. Valid values include: A - Amount (ex. $US) M - Mass (ex. kilograms) V - Volume (ex. cubic feet) P - Pallets C - Case E - Each S- Stat Case |
| 12 | SCALE_CNSTR_UOM1 |  | F |  | VARCHAR (4) | The primary constraints unit of measure. For example, if the constraint type is Mass, units of measure may include KG (kilograms), LBS (pounds), etc. |
| 13 | SCALE_CNSTR_CURR1 |  | F |  | VARCHAR (3) | The primary constraints currency if Amount is selected as the constraint type. For example, if the constraint type is Amount, the currency field may contain USD (US dollars). This field will always match the suppliers currency |
| 14 | SCALE_CNSTR_MIN_VAL1 |  |  |  | NUMERIC (20,4) | The value of the primary minimum scaling constraint. |
| 15 | SCALE_CNSTR_MAX_VAL1 |  |  |  | NUMERIC (20,4) | The value of the primary maximum scaling constraint. |
| 16 | SCALE_CNSTR_MIN_TOL1 |  |  |  | NUMERIC (12,4) | The value of the primary minimum scaling constraints tolerance. Defined as a percentage. For example, if the minimum value was 20,000lbs and the tolerance was 5%, the acceptable minimum value can be down to 19,000lbs. |
| 17 | SCALE_CNSTR_MAX_TOL1 |  |  |  | NUMERIC (12,4) | The value of the suppliers primary maximum scaling constraints tolerance. Defined as a percentage. For example, if the maximum value was 40,000lbs and the tolerance was 5%, the maximum value can be up to 42,000lbs. |
| 18 | SCALE_CNSTR_TYPE2 |  |  |  | VARCHAR (6) | The type of the supplier or supplier/departments second constraint. Valid values include: A - Amount (ex. $US) M - Mass (ex. kilograms) V - Volume (ex. cubic feet) P - Pallets C - Case E - Each S- Stat Case |
| 19 | SCALE_CNSTR_UOM2 |  | F |  | VARCHAR (4) | The second constraints unit of measure. For example, if the constraint type is Mass, units of measure may include KG (kilograms), LBS (pounds), etc. |
| 20 | SCALE_CNSTR_CURR2 |  | F |  | VARCHAR (3) | The second constraints currency if Amount is selected as the constraint type. For example, if the constraint type is Amount, the currency field may contain USD (US dollars). This field will always match the suppliers currency |
| 21 | SCALE_CNSTR_MIN_VAL2 |  |  |  | NUMERIC (20,4) | The value of the second minimum scaling constraint. |
| 22 | SCALE_CNSTR_MAX_VAL2 |  |  |  | NUMERIC (20,4) | The value of the second maximum scaling constraint. |
| 23 | SCALE_CNSTR_MIN_TOL2 |  |  |  | NUMERIC (12,4) | The value of the second minimum scaling constraints tolerance. Defined as a percentage. For example, if the minimum value was 20,000lbs and the tolerance was 5%, the minimum value can be down to 19,000lbs. |
| 24 | SCALE_CNSTR_MAX_TOL2 |  |  |  | NUMERIC (12,4) | The value of the second maximum scaling constraints tolerance. Defined as a percentage. For example, if the maximum value was 40,000lbs and the tolerance was 5%, the minimum value can be up to 42,000lbs. |
| 25 | MIN_CNSTR_LVL |  |  |  | VARCHAR (6) | Determines the level at which the supplier or supplier/departments minimums are applied to an order. Valid values include: O - Order level. Minimum constraints apply to the entire order. L - Location level. Minimum constraints apply to each location on the order. |
| 26 | MIN_CNSTR_CONJ |  |  |  | VARCHAR (6) | Min_cnstr_conj Add VC(6) Y A, O If 2 minimum constraints have been specified, determines the relationship between the two. Valid values include: A - And. Both minimum constraints have to be met for the order to be valid. O - Or. Only one of the two constraints has to be met for the order to be valid. |
| 27 | MIN_CNSTR_TYPE1 |  |  |  | VARCHAR (6) | The type of the supplier or supplier/departments primary minimum constraint. Valid values include: A - Amount (ex. $US) M - Mass (ex. kilograms) V - Volume (ex. cubic feet) P - Pallets C - Case E - Each S- Stat Case |
| 28 | MIN_CNSTR_UOM1 |  | F |  | VARCHAR (4) | The primary minimum constraints unit of measure. For example, if the constraint type is Mass, units of measure may include KG (kilograms), LBS (pounds), etc. |
| 29 | MIN_CNSTR_CURR1 |  | F |  | VARCHAR (3) | The primary minimum constraints currency if Amount is selected as the constraint type. For example, if the constraint type is Amount, the currency field may contain USD (US dollars). This field will always match the suppliers currency |
| 30 | MIN_CNSTR_VAL1 |  |  |  | NUMERIC (20,4) | The value of the primary minimum constraint. |
| 31 | MIN_CNSTR_TYPE2 |  |  |  | VARCHAR (6) | The type of the supplier or supplier/departments second minimum constraint. Valid values include: A - Amount (ex. $US) M - Mass (ex. kilograms) V - Volume (ex. cubic feet) P - Pallets C - Case E - Each S- Stat Case |
| 32 | MIN_CNSTR_UOM2 |  | F |  | VARCHAR (4) | The second minimum constraints unit of measure. For example, if the constraint type is Mass, units of measure may include KG (kilograms), LBS (pounds), etc. |
| 33 | MIN_CNSTR_CURR2 |  | F |  | VARCHAR (3) | The value of the second minimum constraint. |
| 34 | MIN_CNSTR_VAL2 |  |  |  | NUMERIC (20,4) | The value of the second minimum constraint. |
| 35 | TRUCK_SPLIT_IND |  |  | Y | VARCHAR (1) | This column will indicate whether truck splitting should be applied to orders for the supplier or supplier/department |
| 36 | TRUCK_SPLIT_METHOD |  |  |  | VARCHAR (1) | This column will hold the truck splitting method for the supplier or supplier/department. Valid values include Item Sequence or Balanced Assortment. The Item Sequence truck splitting method simply places items onto trucks in order of the items numbers. The Balanced Assortment truck splitting method attempts to place some of each item ordered onto each truck. |
| 37 | TRUCK_CNSTR_TYPE1 |  |  |  | VARCHAR (1) | This column will hold the constraint type for the truck constraint 1. Valid values include Mass, Volume, Pallet, Case, Each, and Stat Case. |
| 38 | TRUCK_CNSTR_UOM1 |  | F |  | VARCHAR (4) | This column will store a Unit of Measure if truck constraint type 1 is either Mass or Volume - i.e. kg, lbs, FT3, etc. |
| 39 | TRUCK_CNSTR_VAL1 |  |  |  | NUMERIC (20,4) | This column will store the value of truck constraint 1. For example, a constraint type may be mass with a UOM of pounds. The value column |
| 40 | TRUCK_CNSTR_TOL1 |  |  |  | NUMERIC (12,4) | This column will define the absolute maximum value for a truck. For example, if the constraint is 40,000 lbs and the tolerance is 10%, the absolute maximum weight the truck can carry will be 44,000 lbs. |
| 41 | TRUCK_CNSTR_TYPE2 |  |  |  | VARCHAR (1) | This column will hold the constraint type for the truck constraint 2. Valid values include Mass, Volume, Pallet, Case, Each, and Stat Case. |
| 42 | TRUCK_CNSTR_UOM2 |  | F |  | VARCHAR (4) | This column will store a Unit of Measure if truck constraint type 2 is either Mass or Volume - i.e. kg, lbs, FT3, etc. |
| 43 | TRUCK_CNSTR_VAL2 |  |  |  | NUMERIC (20,4) | This column will store the value of truck constraint 2. For example, a constraint type may be mass with a UOM of pounds. The value column could then be 3000 which would mean 3000lbs. |
| 44 | TRUCK_CNSTR_TOL2 |  |  |  | NUMERIC (12,4) | This column will define the absolute maximum value for a truck. For example, if the constraint is 40,000 lbs and the tolerance is 10%, the absolute maximum weight the truck can carry will be 44,000 lbs. |
| 45 | LTL_APPROVAL_IND |  |  | Y | VARCHAR (1) | When checked, the approval process will simply look to the user specified vendor minimums to determine whether there is enough quantity on the order for it to be approved. However, when unchecked, only orders that are full truckloads will be approved while LTLs will be put into worksheet status. A truck will be considered full based upon the user defined truck constraints. |
| 46 | DUE_ORD_PROCESS_IND |  |  | Y | VARCHAR (1) | Indicator used to determine if Due Order Processing will be used when creating orders for the supplier or supplier/department. This indicator will only be used for replenishment orders. Valid values include: Y - Yes. Due order processing will be used. N - No. Due order processing will not be used. |
| 47 | DUE_ORD_LVL |  |  |  | VARCHAR (6) | Determines the level at which Due purchase orders for the supplier or supplier/department are determined. This field is only used for replenishment orders. Valid values include: I - Item level. If any item/location on the order is Due, the entire order will be considered Due. O - Order level. The entire order is Due only if the summed estimated stock out amount (ESO) across all item/locations on the order is greater than the summed accepted stock out amount (ASO) across all |
| 48 | DUE_ORD_SERV_BASIS |  |  |  | VARCHAR (6) | Determines whether the safety stock comparisons for Due order determination should be performed in units (standard unit of measures) or currency (ex. $US). Only be used for replenishment orders when the Due Order Indicator is set to Yes. Valid values include: C - Currency based service levels. Safety stock amounts are calculated as the safety stock in units multiplied by the items cost. U - Unit based service levels. Safety stock amounts calculated in units (standard unit of measures). |
| 49 | NON_DUE_ORD_CREATE_IND |  |  | Y | VARCHAR (1) | Indicator to determine whether or not non-due orders should be created in the system. Valid values include: Y - Yes. Create non-due orders. N - No. Do not create non-due orders. |
| 50 | MULT_VEHICLE_IND |  |  | Y | VARCHAR (1) | Indicator used to determine if an order should be scaled to one or multiple vehicles. This indicator is used for both replenishment and manual orders. Valid values include: Y - Yes. Order will be scaled to multiple vehicles. N - No. Order will be scaled to one vehicle. |
| 51 | SINGLE_LOC_IND |  |  | Y | VARCHAR (1) | Indicator used to determines if orders created by replenishment should be limited to one location. This indicator is only used in the replenishment order build process. Valid values include: Y - Yes. Orders should be split by location. N - No. Orders can have multiple locations. |
| 52 | ROUND_LVL |  |  | Y | VARCHAR (6) | This column will be used to determine how order quantities will be rounded to Case, Layer and Pallet. Valid values include: C - Case L - Layer P - Pallet CL - Case/Layer CLP - Case/Layer/Pallet LP - Layer/Pallet If set to Case, order quantities will be rounded up or down to the nearest case. If set to Layer, order quantities will be rounded up or down to the nearest Layer. If set to Pallet, order quantities will be rounded up or down to the nearest Pallet. If set to Case/Layer, order quantities will first be rounded up to the nearest Layer and if they can not be rounded up, they will be rounded up or down to the nearest Case. If set to Case/Layer/Pallet, order quantities will first be rounded up to the nearest Pallet and if they can not be rounded up, they will be rounded up to the nearest Layer and if they can not be rounded up, they will be rounded up or down to the nearest Case. |
| 53 | ROUND_TO_INNER_PCT |  |  | Y | NUMERIC (12,4) | This column will hold the Inner Rounding Threshold value. During rounding, this value is used to determine whether to round partial Inner quantities up or down. If the Inner-fraction in question is less than the Threshold proportion, it is rounded down; if not, it is rounded up. For |
| 54 | ROUND_TO_CASE_PCT |  |  | Y | NUMERIC (12,4) | This column will hold the Case Rounding Threshold value. During rounding, this value is used to determine whether to round partial Case quantities up or down. If the Case-fraction in question is less than the Threshold proportion, it is rounded down; if not, it is rounded up. For instance, with an Case size of 10 and a Threshold of 80%, Case quantities such as 18, 29 and 8 would be rounded up to 20, 30 and 10 respectively, while quantities of 12, 27 and 35 would be rounded down to 10, 20 and 30 respectively. Quantities are never rounded down to zero; a quantity of 7, in the example above, would be rounded up to 10. This column will be maintained solely for purposes of defaulting to the Item/Supplier/Country and Item/Supplier/Country/Location levels. |
| 55 | ROUND_TO_LAYER_PCT |  |  | Y | NUMERIC (12,4) | This column will hold the Layer Rounding Threshold value. During rounding, this value is used to determine whether to round partial Layer quantities up or down. If the Layer-fraction in question is less than the Threshold proportion, it is rounded down; if not, it is rounded up. For instance, with a Layer size of 10 and a Threshold of 80%, Layer quantities such as 18, 29 and 8 would be rounded up to 20, 30 and 10 respectively, while quantities of 12, 27 and 35 would be rounded down to 10, 20 and 30 respectively. Quantities are never rounded down to zero; a quantity of 7, in the example above, would be rounded up to 10. This column will be maintained solely for purposes of defaulting to the Item/Supplier/Country and Item/Supplier/Country/Location levels. |
| 56 | ROUND_TO_PALLET_PCT |  |  | Y | NUMERIC (12,4) | This column will hold the Pallet Rounding Threshold value. During rounding, this value is used to determine whether to round partial Pallet quantities up or down. If the Pallet -fraction in question is less than the Threshold proportion, it is rounded down; if not, it is rounded up. For instance, with an Pallet size of 10 and a Threshold of 80%, Pallet quantities such as 18, 29 and 8 would be rounded up to 20, 30 and 10 respectively, while quantities of 12, 27 and 35 would be rounded down to 10, 20 and 30 respectively. Quantities are never rounded down to zero; a quantity of 7, in the example above, would be rounded up to 10. This column will be maintained solely for purposes of defaulting to the Item/Supplier/Country and Item/Supplier/Country/Location levels. |
| 57 | ORD_PURGE_IND |  |  | Y | VARCHAR (1) | Indicator used to determine if orders not meeting the supplier minimum constraints should be purged or created in Worksheet status during the replenishment order build process. Valid values are: Y - Yes. Purge orders not meeting supplier minimum constraints. N - No. Create orders in Worksheet status. |
| 58 | POOL_SUPPLIER |  |  |  | NUMERIC (10) | This field, if populated, will contain a supplier which will be used to link orders together for the supplier, supplier/department, supplier/location, or the supplier/department/location. |
| 59 | PICKUP_LOC |  |  |  | VARCHAR (250) | Contains the location at which the order will be picked up. Used to default to the order level. |
| 60 | PURCHASE_TYPE |  |  |  | VARCHAR (6) | This field indicates how the goods will be transported from the vendor to the client. Examples include, FOB/Pickup (Free on Board), Deliverd. |
| 61 | THRESHOLD_NEXT_BRACKET |  |  |  | NUMERIC (12,4) | This field contains the value scaling will use to determine if the current order is within the threshold percent of the next bracket level |
| 62 | BRACKET_TYPE1 |  |  |  | VARCHAR (6) | The field contains the primary measurement basis for each bracket set up. All brackets within a bracket group have the same type. Valid values include: M - Mass (ex. kilograms) V - Volume (ex. cubic feet) P - Pallets C - Case S - Stat Case E - Each |
| 63 | BRACKET_UOM1 |  | F |  | VARCHAR (4) | This field contains the primary unit of measure for the selected bracket. |
| 64 | BRACKET_TYPE2 |  |  |  | VARCHAR (6) | The field contains the secondary measurement basis for each bracket set up. All brackets within a bracket group have the same type. Valid values include: M - Mass (ex. kilograms) V - Volume (ex. cubic feet) P - Pallets C - Case S - Stat Case E - Each |
| 65 | BRACKET_UOM2 |  | F |  | VARCHAR (4) | This field contains the secondary unit of measure for the selected bracket. |
| 66 | IB_IND |  |  | Y | VARCHAR (1) | Indicates that the supplier, supplier/dept, supplier/loc or supplier/dept/loc is eligible for Investment Buy purchases |
| 67 | IB_ORDER_CTRL |  |  |  | VARCHAR (6) | Contains the investment buy order control associated with the supplier, supplier/dept, supplier/loc or supplier/dept/loc. When the investment buy opportunity calculation processes an item/supplier/origin_country/location, this value is retrieved at lowest applicable level. A value of Manual dictates that investment buy ROQs will only be written to the Investment Buy Results table and will not be processed by any online or batch processes. A value of Buyer Worksheet dictates that investment buy ROQs will be processed solely via the buyer worksheet online dialog. A value of Semi-Automatic dictates that investment buy ROQs will be added to Worksheet orders by the replenishment automatic order building process. A value of Automatic dictates that investment buy ROQs will be added to Approved orders by the replenishment automatic order building process. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUP_INV_MGMT|PK||||SUP_DEPT_SEQ_NO|ASC|
|SUP_INV_MGMT_I10|||||SCALE_CNSTR_UOM2|ASC|
|SUP_INV_MGMT_I4|||||SCALE_CNSTR_CURR2|ASC|
|SUP_INV_MGMT_I1|||||MIN_CNSTR_CURR1|ASC|
|SUP_INV_MGMT_I16|||||LOCATION|ASC|
|SUP_INV_MGMT_I7|||||MIN_CNSTR_UOM1|ASC|
|SUP_INV_MGMT_I9|||||SCALE_CNSTR_UOM1|ASC|
|SUP_INV_MGMT_I15|||||BRACKET_UOM2|ASC|
|SUP_INV_MGMT_I11|UN||||SUPPLIER|ASC|
||||||DEPT|ASC|
||||||LOCATION|ASC|
|SUP_INV_MGMT_I2|||||MIN_CNSTR_CURR2|ASC|
|SUP_INV_MGMT_I13|||||TRUCK_CNSTR_UOM2|ASC|
|SUP_INV_MGMT_I5|||||DEPT|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SUP_INV_MGMT_I14|||||BRACKET_UOM1|ASC|
|SUP_INV_MGMT_I8|||||MIN_CNSTR_UOM2|ASC|
|SUP_INV_MGMT_I3|||||SCALE_CNSTR_CURR1|ASC|
|SUP_INV_MGMT_I12|||||TRUCK_CNSTR_UOM1|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SUP_INV_MGMT_DUE_ORD_LVL|DUE_ORD_LVL IN ('I','O')<br>|
||CHK_SUP_INV_MGMT_DUE_ORD_P_IND|DUE_ORD_PROCESS_IND in ('Y','N')<br>|
||CHK_SUP_INV_MGMT_DUE_ORD_SV_BA|DUE_ORD_SERV_BASIS IN ('C','U','P')<br>|
||CHK_SUP_INV_MGMT_IB_IND|IB_IND IN ('Y') and ib_order_ctrl in ('M','B','S','A') or (ib_ind = 'N' and ib_order_ctrl is NULL)<br>|
||CHK_SUP_INV_MGMT_LOC_TYPE|LOC_TYPE IN ('S','W')<br>|
||CHK_SUP_INV_MGMT_LTL_APPROVAL|ltl_approval_ind in ('Y','N')<br>|
||CHK_SUP_INV_MGMT_MIN_CNSTR_CON|MIN_CNSTR_CONJ IN ('A','O')<br>|
||CHK_SUP_INV_MGMT_MIN_CNSTR_LVL|MIN_CNSTR_LVL IN ('O','L')<br>|
||CHK_SUP_INV_MGMT_MIN_CNST_TYP1|(MIN_CNSTR_TYPE1 IN ('A','M','V','P','C','E','S')) or (MIN_CNSTR_TYPE1 IS NULL)<br>|
||CHK_SUP_INV_MGMT_MIN_CNST_TYP2|(MIN_CNSTR_TYPE2 IN ('A','M','V','P','C','E','S')) OR (MIN_CNSTR_TYPE2 IS NULL)<br>|
||CHK_SUP_INV_MGMT_MU_VEHICLE_IN|NON_DUE_ORD_CREATE_IND IN ('Y','N')<br>|
||CHK_SUP_INV_MGMT_NON_DU_O_C_IN|NON_DUE_ORD_CREATE_IND IN ('Y','N')|






|Type|Column / Constraint Name|Details|
|---|---|---|
||||
||CHK_SUP_INV_MGMT_ORD_PURGE_IND|ORD_PURGE_IND in ('Y','N')<br>|
||CHK_SUP_INV_MGMT_REPL_ORDER_CT|(repl_order_ctrl in ('M','B','S','A'))or(repl_order_ctrl is NULL)<br> <br> <br> <br>|
||CHK_SUP_INV_MGMT_ROUND_LVL|ROUND_LVL IN ('C','L','P','CL','CLP','LP')<br>|
||CHK_SUP_INV_MGMT_SCAL_CNST_IND|SCALE_CNSTR_IND IN ('Y','N')<br>|
||CHK_SUP_INV_MGMT_SCL_CNSTR_LVL|SCALE_CNSTR_LVL IN ('O','L')<br>|
||CHK_SUP_INV_MGMT_SCL_CNSTR_OBJ|SCALE_CNSTR_OBJ IN ('M','X')<br>|
||CHK_SUP_INV_MGMT_SCL_CONR_TYP1|(SCALE_CNSTR_TYPE1 IN ('A','M','V','P','C','E','S')) OR (SCALE_CNSTR_TYPE1 IS NULL)<br>|
||CHK_SUP_INV_MGMT_SCL_CONR_TYP2|(SCALE_CNSTR_TYPE2 IN ('A','M','V','P','C','E','S')) OR (SCALE_CNSTR_TYPE2 IS NULL)<br>|
||CHK_SUP_INV_MGMT_SINGL_LOC_IND|SINGLE_LOC_IND IN ('Y','N')<br>|
||CHK_SUP_INV_MGMT_TRK_CNS_TP1|(truck_cnstr_type1 in ('V','M','P','C','E','S')) or (truck_cnstr_type1 is NULL)<br>|
||CHK_SUP_INV_MGMT_TRK_CNS_TP2|(truck_cnstr_type2 in ('V','M','P','C','E','S')) or (truck_cnstr_type2 is NULL)<br>|
||CHK_SUP_INV_MGMT_TRK_SPLIT_IND|(truck_split_ind = 'Y' and single_loc_ind = 'Y' and truck_split_method is not NULL and truck_cnstr_type1 is not NULL) or (truck_split_ind<br>= 'N' and truck_split_method is NULL and truck_cnstr_type1 is NULL)|
||CHK_SUP_INV_MGMT_TRK_SPLIT_MTH|truck_split_method in ('I','B')<br>|
|Column Level|LOC_TYPE||





|Type|Column / Constraint Name|Details|
|---|---|---|
||REPL_ORDER_CTRL||
||SCALE_CNSTR_IND||
||SCALE_CNSTR_LVL||
||SCALE_CNSTR_OBJ||
||SCALE_CNSTR_TYPE1||
||SCALE_CNSTR_TYPE2||
||MIN_CNSTR_LVL||
||MIN_CNSTR_CONJ||
||MIN_CNSTR_TYPE1||
||MIN_CNSTR_TYPE2||
||TRUCK_SPLIT_METHOD||
||TRUCK_CNSTR_TYPE1||
||TRUCK_CNSTR_TYPE2||
||LTL_APPROVAL_IND||
||DUE_ORD_PROCESS_IND||
||DUE_ORD_LVL||
||DUE_ORD_SERV_BASIS||
||NON_DUE_ORD_CREATE_IND||
||SINGLE_LOC_IND||
||ROUND_LVL||
||ORD_PURGE_IND||

---

## Table: SUP_MONTH

**Description:** This table contains the dollar level history for the supplier, department, and month combination. History is maintained in the table for eighteen months and then purged by the end of monthprocessing run. No index is associated with this table because either rows are only inserted during update or all rows are selected during reporting.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEPT | P | F | Y | NUMERIC (4) | Contains the department number associated with the supplier history information. |
| 2 | SUPPLIER | P | F | Y | NUMERIC (10) | Contains the supplier number associated with the history information. |
| 3 | HALF_NO | P | F | Y | NUMERIC (5) | Contains the half number for the history period. It consists of the year and the half (1 or 2). |
| 4 | MONTH_NO | P |  | Y | NUMERIC (2) | Contains the month number ranging from 1 to 12 for the period. |
| 5 | PURCH_COST |  |  | Y | NUMERIC (20,4) | Contains the total cost of purchases from the supplier for the month. This field is stored in the primary currency. |
| 6 | PURCH_SELL |  |  | Y | NUMERIC (20,4) | Contains the total retail value of purchases from the supplier for the month. This field is stored in the primary currency. |
| 7 | CLAIM_COST |  |  | Y | NUMERIC (20,4) | Contains the total cost of vendor returns to the supplier for the month. This field is stored in the primary currency. |
| 8 | CANCEL_COST |  |  | Y | NUMERIC (20,4) | Contains the total cost of orders to the supplier that were cancelled during the month. This field is stored in the primary currency. |
| 9 | MARKDOWN_SELL |  |  | Y | NUMERIC (20,4) | Contains the net supplier markdowns/markups for the month. This field is stored in the primary currency. |
| 10 | SALES_SELL |  |  | Y | NUMERIC (20,4) | Contains the value of consignment sales for the period. This field is stored in the primary currency. |
| 11 | QTY_FAILED |  |  | Y | NUMERIC (12,4) | Contains the number of items from the supplier that failed quality control during the month. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUP_MONTH|PK||||DEPT|ASC|
||||||SUPPLIER|ASC|
||||||HALF_NO|ASC|
||||||MONTH_NO|ASC|
|SUP_MONTH_I2|||||HALF_NO|ASC|
|SUP_MONTH_I1|||||SUPPLIER|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SUP_MONTH_MONTH_NO|MONTH_NO BETWEEN 1 AND 6<br>|
|Column Level|MONTH_NO||

---

## Table: SUP_REPL_DAY

**Description:** This table contains one row for each supplier/weekday combination for which the supplier will be reviewed for replenishment.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WEEKDAY | P |  | Y | NUMERIC (1) | This field contains the weekday that the supplier should be reviewed for replenishment. Valid values are 1 through 7 where 1 = Sunday, 2 = Monday, etc. |
| 2 | SUP_DEPT_SEQ_NO | P | F | Y | NUMERIC (10) | Primary key, system generated by a sequence that will uniquely identify a supplier or supplier/department record on the sups_inv_mgmt table. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUP_REPL_DAY|PK||||SUP_DEPT_SEQ_NO|ASC|
||||||WEEKDAY|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SUP_REPL_DAY_WEEKDAY|WEEKDAY IN (1,2,3,4,5,6,7)<br>|
|Column Level|WEEKDAY||

---

## Table: SUP_TOLERANCE

**Description:** This table will hold records for each invoice matching supplier tolerance that will be used by the system. Supplier tolerances will be used during the invoice matching process to determine if discrepancies are acceptable to be paid or not.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SUPPLIER | P | F | Y | NUMERIC (10) | Supplier number. |
| 2 | TOLERANCE_FAVOR | P |  | Y | VARCHAR (1) | Indicator of the favor in which this tolerance should be used. Valid values are S for supplier, R for retailer. A value of S would mean this tolerance would only be used in cases where a discrepancy is in the suppliers favor. A value of R would mean this tolerance would be used in cases where a discrepancy is in the retailers favor. Tolerance favors will be held on the codes table under the code type STFV. |
| 3 | TOLERANCE_LEVEL | P |  | Y | VARCHAR (2) | Indicator of the level at which this tolerance should be used. Valid values are TC for summary cost, TQ for summary quantity, LC for line item cost or LQ for line item quantity. Tolerance levels will be held on the codes table under the code type SUTL. |
| 4 | LOWER_LIMIT | P |  | Y | NUMERIC (20,4) | Lower limit of the supplier tolerance. This will be a cost value for summary or line item cost tolerances, a quantity for line item quantity tolerances. If a cost value, this field will be held in the primary currency. |
| 5 | UPPER_LIMIT | P |  | Y | NUMERIC (20,4) | Upper limit of the supplier tolerance. This will be a cost value for the summary or line item cost tolerances, a quantity for line item quantity tolerances. If a cost value, this field will be held in the primary currency. |
| 6 | TOLERANCE_TYPE | P |  | Y | VARCHAR (1) | Indicates whether the tolerance_value is an amount or a percent. Valid values are A for amount or P for percent. Tolerance types will be held on the codes table under the code type STTT. |
| 7 | TOLERANCE_VALUE |  |  | Y | NUMERIC (20,4) | Amount that the invoice and receipt (received shipment) can differ by and still be considered a match. This value can be a cost value, a quantity or a percentage, depending on the values in tolerance_level and tolerance_type. If a cost value, this field will be held in the primary currency. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUP_TOLERANCE|PK||||SUPPLIER|ASC|
||||||TOLERANCE_FAVOR|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||TOLERANCE_LEVEL|ASC|
||||||LOWER_LIMIT|ASC|
||||||UPPER_LIMIT|ASC|
||||||TOLERANCE_TYPE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SUP_TOLERANCE_TLRCE_FAVOR|TOLERANCE_FAVOR IN ('S', 'R')<br>|
||CHK_SUP_TOLERANCE_TLRCE_LEVEL|TOLERANCE_LEVEL IN ('TC', 'TQ', 'LC', 'LQ')<br>|
||CHK_SUP_TOLERANCE_TLRCE_TYPE|TOLERANCE_TYPE IN ('A', 'P')<br>|
|Column Level|TOLERANCE_FAVOR||
||TOLERANCE_LEVEL||
||TOLERANCE_TYPE||

---

## Table: SUP_TRAITS

**Description:** This table contains one row for each supplier trait within Oracle Retail. Supplier traits give retailers the ability to group suppliers with a common trait together for reporting purposes.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SUP_TRAIT | P |  | Y | NUMERIC (4) | This field contains the number that uniquely identifies the supplier trait. |
| 2 | DESCRIPTION |  |  | Y | VARCHAR (120) | This field contains the description associated with the supplier trait. |
| 3 | MASTER_SUP_IND |  |  | Y | VARCHAR (1) | This field indicates whether the trait is a master supplier trait or not. Valid values for this field are Y and N. |
| 4 | MASTER_SUP |  |  |  | VARCHAR (10) | If this supplier trait is a master supplier trait, then this field can contain the number of the master supplier. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUP_TRAITS|PK||||SUP_TRAIT|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SUP_TRAITS_MASTER_SUP_IND|MASTER_SUP_IND IN ('Y','N')<br>|

---

## Table: SUP_TRAITS_MATRIX

**Description:** This table contains one row for each supplier trait/supplier combination.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SUP_TRAIT | P | F | Y | NUMERIC (4) | This field contains the number that uniquely identifies the supplier trait. |
| 2 | SUPPLIER | P | F | Y | NUMERIC (10) | This field contains the number that represents the supplier which is associated with the supplier trait. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUP_TRAITS_MATRIX|PK||||SUP_TRAIT|ASC|
||||||SUPPLIER|ASC|
|SUP_TRAITS_MATRIX_I1|||||SUPPLIER|ASC|

---

## Table: SUP_TRAITS_TL

**Description:** This is the translation table for SUP_TRAITS table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG |  | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | SUP_TRAIT |  | F | Y | NUMERIC (4) | This field contains the number that uniquely identifies the supplier trait. |
| 3 | DESCRIPTION |  |  | Y | VARCHAR (120) | This field contains the description associated with the supplier trait. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SUP_TRAITS_TL|UK||||LANG|ASC|
||||||SUP_TRAIT|ASC|

---

## Table: SUP_VIOLATION

**Description:** This table will hold multiple supplier violation codes for shipments.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SHIPMENT | P |  | Y | NUMERIC (12) | Number of a shipment in the system to which the user would like to attach violation codes. |
| 2 | SUP_VIOLATION_CODE | P |  | Y | VARCHAR (6) | Code associated with a vendor violation. Descriptions of vendor violation codes will be held on the CODE_DETAIL table under the code type of SUPV (Supplier Violations). |
