# RMS Return to Vendor (RTV) Datamodel - Physical Data Model Reference

## Table: RTVITEM_INV_FLOW

**Description:** This table records the distribution detail of an RTV line item requested quantity at the time the RTV is approved. The RTV shipment process uses this information to determine how the RTV returned qty should be distributed among the virtual locations.Currently, only RTVs created in RMS will have a separate approval and shipping process. As a result, only RTVs created in RMS with physical warehouses will have records on this table. These RTVs wil be shipped in RMS as well. Records will be purged by the rtv purge batch process (rtvprg.pc).

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RTV_ORDER_NO | P |  | Y | NUMERIC (10) | The rtv order no. Along with seq_no, it identifies a unique RTV_DETAIL record. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (4) | The sequence number. Along with rtv_order_no, it identifies a unique RTV_DETAIL record. |
| 3 | ITEM | P |  | Y | VARCHAR (25) | The return to vendor item. It corresponds to the item on RTV_DETAIL associated with the rtv_order_no and seq_no. |
| 4 | LOC | P |  | Y | NUMERIC (10) | The distributed RTV location. Currently, only RTVs created in RMS with physical warehouses will have records on this table. As a result, this column holds a vitual warehouse corresponding to the physical warehouse on RTV_HEAD.wh. |
| 5 | LOC_TYPE |  |  | Y | VARCHAR (1) | The location type. Currently, only RTVs created in RMS with physical warehouses will have records on this table. As a result, loc type will always be W (warehouse). |
| 6 | QTY_REQUESTED |  |  | Y | NUMERIC (12,4) | The requested return to vendor quantity on RTV_DETAIL.qty_requested distributed to the virtual location. |
| 7 | QTY_RETURNED |  |  |  | NUMERIC (12,4) | The returned quantity distributed to the virtual location. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RTVITEM_INV_FLOW|PK||||RTV_ORDER_NO|ASC|
||||||SEQ_NO|ASC|
||||||ITEM|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||LOC|ASC|

---

## Table: RTVREQ_MFQUEUE

**Description:** This table will be the queue where RTV Request integration messages await publication.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | The sequence in which the records were placed in RTVREQ_MFQUEUE. Used to order the publication of messages to the RIB. |
| 2 | RTV_ORDER_NO |  |  |  | NUMERIC (10) | The RTV order number. |
| 3 | RTV_SEQ_NO |  |  |  | NUMERIC (4) | The RTV detail sequence number, associated to the seq_no on the RTV_detail table. |
| 4 | ITEM |  |  |  | VARCHAR (25) | Item to be deleted from the RTV. |
| 5 | MESSAGE_TYPE |  |  |  | VARCHAR (15) | Describes the action in RMS that caused the message to be published to the RIB. |
| 6 | THREAD_NO |  |  |  | NUMERIC (4) | The thread on which the business transaction will be published. Each business object has one and only one thread_no. |
| 7 | FAMILY |  |  |  | VARCHAR (30) | The functional area that this transaction belongs to. |
| 8 | CUSTOM_MESSAGE_TYPE |  |  |  | VARCHAR (1) | Not used by RMS. |
| 9 | PUB_STATUS |  |  |  | VARCHAR (1) | Set to Unpublished upon insertion into the table. Will be set to Hospital when an non-fatal error is encountered during the publication process. |
| 10 | TRANSACTION_NUMBER |  |  |  | NUMERIC (10) | Business transaction key. |
| 11 | TRANSACTION_TIME_STAMP |  |  |  | Date | Time of record creation. |

---

## Table: RTVREQ_PUB_INFO

**Description:** This table helps in publication of the business transacation. It does this by tracking the state of the business transaction.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RTV_ORDER_NO | P |  | Y | NUMERIC (10) | The RTV Order number. |
| 2 | INITIAL_APPROVAL_IND |  |  |  | VARCHAR (1) | Indicates whether or not the transaction has been initially approved. It is used by the detail level triggers (ADDTOQ) to determine if they should write records to the queue. |
| 3 | SHIPPED_IND |  |  |  | VARCHAR (1) | Indicates whether the RTV order has been shipped or not. |
| 4 | THREAD_NO |  |  |  | NUMERIC (6) | The thread on which the business transaction will be published. |
| 5 | PUBLISHED |  |  |  | VARCHAR (1) | Indicates whether or not the transaction has been initially published. |

---

## Table: RTV_DETAIL

**Description:** This table contains item level details for items on the RTV order.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RTV_ORDER_NO | P | F | Y | NUMERIC (10) | This field contains the number that uniquely identifies the return to vendor within the system. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (4) | This field contains a sequence number which makes the record unique when combined with the RTV_ORDER_NO field. |
| 3 | ITEM |  |  | Y | VARCHAR (25) | This field contains an unique identifier for the item which is being returned to the supplier. |
| 4 | SHIPMENT |  |  |  | NUMERIC (12) | This field is no longer used by RMS. |
| 5 | INV_STATUS |  | F |  | NUMERIC (2) | This field contains the number representing the inventory status code. This field is only required if the reason field has a value of U for unavailable inventory. |
| 6 | QTY_REQUESTED |  |  | Y | NUMERIC (12,4) | This field contains the quantity of this item requested to be returned to the supplier. |
| 7 | QTY_RETURNED |  |  |  | NUMERIC (12,4) | This field contains the quantity of this item that was shipped to the supplier on this RTV. |
| 8 | QTY_CANCELLED |  |  |  | NUMERIC (12,4) | The difference between qty_requested and qty_returned. This is updated after the RTV has been shipped. |
| 9 | UNIT_COST |  |  | Y | NUMERIC (20,4) | This field contains the cost per unit for the item being returned that is expected to be recovered from the supplier. This field is stored in the suppliers currency. |
| 10 | REASON |  |  | Y | VARCHAR (6) | This field contains the value identifying the reason for the return. Valid values are: O - Overstock, U - Unavailable Inventory, W - Externally Initiated RTV. Valid values for this field are defined on CODE_DETAIL where CODE_TYPE = RTVR. |
| 11 | PUBLISH_IND |  |  | Y | VARCHAR (1) | This field specifies whether or not the detail record has been published by the RTV message family manager. Valid values are N (not published) or Y (published) |
| 12 | RESTOCK_PCT |  |  |  | NUMERIC (12,4) | This field contains the Restocking Fee percentage applicable to the item. This is the fee as percentage of the total return value charged by the supplier for recovering the expenses that may have to be incurred while restocking them at suppliers location. |
| 13 | ORIGINAL_UNIT_COST |  |  | Y | NUMERIC (20,4) | This field contains the current weighted average cost for the item at the return location. |
| 14 | UPDATED_BY_RMS_IND |  |  | Y | VARCHAR (1) | This field indicates if the last update to RTV_DETAIL table is done by RMS or an external application. If by RMS, then the indicator will be set to Y and a message will be published to external systems; otherwise, the indicator will be set to N and a message will not be published to external systems. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RTV_DETAIL|PK||||RTV_ORDER_NO|ASC|
||||||SEQ_NO|ASC|
|RTV_DETAIL_I3|||||ITEM|ASC|
|RTV_DETAIL_I2|||||INV_STATUS|ASC|
|RTV_DETAIL_I1|UN||||RTV_ORDER_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||ITEM|ASC|
||||||SHIPMENT|ASC|
||||||REASON|ASC|
||||||INV_STATUS|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_RTV_DETAIL_INV_STATUS|(SHIPMENT IS NOT NULL AND INV_STATUS IS NULL) OR (SHIPMENT IS NULL AND INV_STATUS IS NULL) OR (SHIPMENT IS NULL AND<br>INV_STATUS IS NOT NULL)<br>|
||CHK_RTV_DETAIL_UPD_BY_RMS_IND|updated_by_rms_ind in ('Y','N')|
|Column Level|UPDATED_BY_RMS_IND||

---

## Table: RTV_HEAD

**Description:** This table contains header level information for all the Return to Vendor (RTV) orders.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RTV_ORDER_NO | P |  | Y | NUMERIC (10) | This field contains the unique identifier for the return to vendor (RTV) order within the system. |
| 2 | SUPPLIER |  | F | Y | NUMERIC (10) | This field contains the unique identifier for the supplier or supplier site to which the merchandise is being returned. |
| 3 | STATUS_IND |  |  | Y | NUMERIC (2) | This field Contains the current status of the return. Valid values include: 05- Input 10 - Approved 12 - In Progress 15 - Shipped 20 - Cancelled |
| 4 | STORE |  |  | Y | NUMERIC (10) | This field contains the unique identifer for the store if the items are being returned from a store location. This value will be -1 if the return is from a warehouse. |
| 5 | WH |  |  | Y | NUMERIC (10) | This field contains the unique identifier for the warehouse, if the items are being returned from a warehouse location. This value will be -1 if the return is from a store. |
| 6 | TOTAL_ORDER_AMT |  |  |  | NUMERIC (20,4) | This field contains the total amount of the return. This field is stored in the suppliers currency. |
| 7 | SHIP_TO_ADD_1 |  |  | Y | VARCHAR (240) | This field contains the first line of the suppliers address for returns. |
| 8 | SHIP_TO_ADD_2 |  |  |  | VARCHAR (240) | This field contains the second line of the suppliers address for returns. |
| 9 | SHIP_TO_ADD_3 |  |  |  | VARCHAR (240) | This field contains the third line of the suppliers address for returns. |
| 10 | SHIP_TO_CITY |  |  | Y | VARCHAR (120) | This field contains the city name of the suppliers address for returns. |
| 11 | STATE |  |  |  | VARCHAR (3) | This field contains the state of the suppliers address for returns. |
| 12 | SHIP_TO_COUNTRY_ID |  |  | Y | VARCHAR (3) | This field contains the country ID of the suppliers address for returns. |
| 13 | SHIP_TO_PCODE |  |  |  | VARCHAR (30) | This field contains the zip code of the suppliers address for returns. |
| 14 | RET_AUTH_NUM |  |  |  | VARCHAR (12) | This field contains the number that the supplier provides when the decision is made that an order may be returned. This value is not mandatory and is determined by vendor level indicator called RET_AUTH_REQ. |
| 15 | COURIER |  |  |  | VARCHAR (250) | This field contains the courier name if the supplier requires that returns be sent by a designated carrier. |
| 16 | FREIGHT |  |  |  | NUMERIC (20,4) | This field contains the freight cost associated with the vendor return, if applicable and is stored in the suppliers currency. It is a part of shipment information. |
| 17 | CREATED_DATE |  |  | Y | Date | This field contains the date on which the RTV order was created. |
| 18 | COMPLETED_DATE |  |  |  | Date | This field contains the date the RTV order was completed. |
| 19 | EXT_REF_NO |  |  |  | VARCHAR (14) | This field contains an audit trail reference to external system when an RTV is created by external store or warehouse systems. |
| 20 | COMMENT_DESC |  |  |  | VARCHAR (2000) | This field contains any comments associated with the return. |
| 21 | MRT_NO |  | F |  | NUMERIC (10) | This field holds the unique identifier for the Mass Return Transfer (MRT) if the RTV is created through a MRT. |
| 22 | NOT_AFTER_DATE |  |  |  | Date | This field contains the last date that an RTV can be sent to a supplier. This will be populated if the RTV is created by the MRT process. |
| 23 | RESTOCK_PCT |  |  |  | NUMERIC (12,4) | This field contains the Restocking Fee percentage applicable to the order. This is the fee as percentage of the total return value charged by the supplier for recovering the expenses that may have to be incurred while restocking them at suppliers location. |
| 24 | RESTOCK_COST |  |  |  | NUMERIC (20,4) | This field contains the Restocking Fee Value. This is calculated based on the RESTOCK_PCT by multiplying it to the total return value. |
| 25 | ITEM |  |  |  | VARCHAR (25) | This field is only populated for RTVs generated for consignment items. If the system option for generating consignment invoices is set to Supplier/Location/Item, then this will contain the item on the RTV. Otherwise, it will be NULL. |
| 26 | SHIP_TO_JURISDICTION_CODE |  |  |  | VARCHAR (10) | This field Identifies the jurisdiction code for the country-state relationship. |
| 27 | DEPT |  |  |  | NUMERIC (4) | This field is only populated for RTVs generated for consignment items. If the system option for generating consignment invoices is set to Supplier/Department, then this will contain the department of the item on the RTV. Otherwise, it will be NULL. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RTV_HEAD|PK||||RTV_ORDER_NO|ASC|
|RTV_HEAD_I2|||||STATE|ASC|
|RTV_HEAD_I3|||||MRT_NO|ASC|
|RTV_HEAD_I1|||||SUPPLIER|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_RTV_HEAD_STATUS_IND<br>|STATUS_IND IN(5,10,12,15,20)<br>|
|Column Level|STATUS_IND<br>||

---

## Table: RTV_HEAD_CFA_EXT

**Description:** This is the custom flex attribute extension table for the entity RTV_HEAD.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RTV_ORDER_NO | P | F | Y | NUMERIC (10) | This column holds the RTV Order Number this extended data is associated with. |
| 2 | GROUP_ID | P |  | Y | NUMERIC (10) | This column holds the attribute group id that this extended data is associated with. The logical business meaning of the VARCHAR_, NUMBER_ and DATE_ columns on this table are determined by the |
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
|PK_RTV_HEAD_CFA_EXT|PK||||RTV_ORDER_NO|ASC|
||||||GROUP_ID|ASC|
