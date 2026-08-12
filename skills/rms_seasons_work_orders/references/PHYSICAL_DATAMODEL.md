# RMS Seasons & Work Orders Datamodel - Physical Data Model Reference

## Table: DELIVERY_SLOT

**Description:** This table will contain generic delivery slots to be used by stores for a given day.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DELIVERY_SLOT_ID | P |  | Y | VARCHAR (15) | This column specifies when the store requested quantity is needed at the store. For example, it defines whether the stock is designated for AM or PM delivery. |
| 2 | DELIVERY_SLOT_DESC |  |  | Y | VARCHAR (240) | Description of the delivery slot. This could contain the time element for the delivery schedule (i.e. Afternoon Slot 3 PM). |
| 3 | DELIVERY_SLOT_SEQUENCE |  |  | Y | NUMERIC (8) | This column will specify the precedence of the delivery slot on a particular day. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DELIVERY_SLOT|PK||||DELIVERY_SLOT_ID|ASC|

---

## Table: DELIVERY_SLOT_MFQUEUE

**Description:** This table is used to store the the Delivery slot id that needs to published to external systems. Once the information has been published the row will be removed from this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | This column holds the sequence that the messages were created in. |
| 2 | PUB_STATUS |  |  | Y | VARCHAR (1) | This column holds the publication status of the message. Currently for delivery slots the only status is Unprocessed. |
| 3 | MESSAGE_TYPE |  |  | Y | VARCHAR (15) | This column holds the type of message that is being published. |
| 4 | DELIVERY_SLOT_ID |  |  | Y | VARCHAR (15) | This column holds the value of the delivery slot that should be published |
| 5 | DELIVERY_SLOT_DESC |  |  | Y | VARCHAR (240) | The description of the delivery slot that is being published. |
| 6 | TRANSACTION_TIME_STAMP |  |  | Y | Date | Timestamp of the record creation. |
| 7 | FAMILY |  |  |  | VARCHAR (30) | The functional area that the transaction belongs to. |
| 8 | TRANSACTION_NUMBER |  |  |  | NUMERIC (15) | This is the business transaction key of this message |
| 9 | THREAD_NO |  |  |  | NUMERIC (4) | The thread on which the business transaction will be published. Each business object has one and only one thread_no. |
| 10 | DELIVERY_SLOT_SEQUENCE |  |  | Y | NUMERIC (8) | This column will specify the precedence of the delivery slot on a particular day. |

---

## Table: PHASES

**Description:** This table holds the description of the phases (sub-seasons) defined in RMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEASON_ID | P | F | Y | NUMERIC (3) | This field contains the unique identifier for season that the phase is part of. |
| 2 | PHASE_ID | P |  | Y | NUMERIC (3) | This field contains the identifier for phase. This number is not unique without the associated season identifier. |
| 3 | PHASE_DESC |  |  | Y | VARCHAR (120) | This field holds the description of the phase. |
| 4 | START_DATE |  |  | Y | Date | This field holds the starting date of the phase. |
| 5 | END_DATE |  |  | Y | Date | This field holds the ending date of the phase. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_PHASES|PK||||SEASON_ID|ASC|
||||||PHASE_ID|ASC|

---

## Table: PHASES_TL

**Description:** This is the translation table for PHASES table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | SEASON_ID | P | F | Y | NUMERIC (3) | This field contains the unique identifier for season that the phase is part of. |
| 3 | PHASE_ID | P | F | Y | NUMERIC (3) | This field contains the identifier for phase. This number is not unique without the associated season identifier. |
| 4 | PHASE_DESC |  |  | Y | VARCHAR (120) | This field holds the description of the phase. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_PHASES_TL|PK||||LANG|ASC|
||||||SEASON_ID|ASC|
||||||PHASE_ID|ASC|

---

## Table: SEASONS

**Description:** This table holds the description of all the seasons defined in RMS. Seasons are specific time periods of year for which distinct merchandise planning is done. For example, Spring-Summer, Autmn-Winter, Back to School, etc. Each item created in RMS can be attached to a season, which can be further divided into phases. Seasons are used for replenishment and item lists.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEASON_ID | P |  | Y | NUMERIC (3) | This field contains the unique identifier for season. |
| 2 | SEASON_DESC |  |  | Y | VARCHAR (120) | This field contains the description associated with the season. |
| 3 | START_DATE |  |  | Y | Date | This field contains the starting date for the season. |
| 4 | END_DATE |  |  | Y | Date | This field contains the ending date for the season. |
| 5 | FILTER_ORG_ID |  |  |  | NUMERIC (10) | The ID of the organziational hierarchy to which the season is assigned. The level of the organziational hierarchy is determined based on SECURITY_CONFIG_OPTIONS.SEASON_ORG_LEVEL_CODE. The value in this column will be used to control the seasons a user can use when utilized in RMS, if data level security has been set up for users in the system. This value is not required. |
| 6 | FILTER_MERCH_ID |  |  |  | NUMERIC (4) | The ID of the merchandise hierarchy to which the season is assigned. The level of the merchandise hierarchy is determined based on SECURITY_CONFIG_OPTIONS.SEASON_MERCH_LEVEL_CODE. The value in this column will be used to control the seasons a user can use when utilized in RMS, if data level security has been set up for users in the system. This value is not required. |
| 7 | FILTER_MERCH_ID_CLASS |  |  |  | NUMERIC (4) | If SECURITY_CONFIG_OPTIONS.SEASON_MERCH_LEVEL_CODE is C (class) or S (subclass), then the FILTER_MERCH_ID column on this table will hold the department and the class associated with that department is held in this column. |
| 8 | FILTER_MERCH_ID_SUBCLASS |  |  |  | NUMERIC (4) | If SECURITY_CONFIG_OPTIONS.SEASON_MERCH_LEVEL_CODE is S (subclass), then the FILTER_MERCH_ID column on this table will hold the department, FILTER_MERCH_ID_CLASS will hold the class and the subclass associated with that department is held in this column. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SEASONS|PK||||SEASON_ID|ASC|

---

## Table: SEASONS_TL

**Description:** This is the translation table for SEASONS table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | SEASON_ID | P | F | Y | NUMERIC (3) | This field contains the unique identifier for season. |
| 3 | SEASON_DESC |  |  | Y | VARCHAR (120) | This field contains the description associated with the season. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SEASONS_TL|PK||||LANG|ASC|
||||||SEASON_ID|ASC|

---

## Table: WOIN_MFQUEUE

**Description:** The message queue that keeps track of all of the events that occur on the WO_DETAIL table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | The sequence in which the records was placed in the WOIN_MFQUEUE. Used to order the publication of messages to the RIB. |
| 2 | PUB_STATUS |  |  | Y | VARCHAR (1) | Current publishing status of the event. |
| 3 | MESSAGE_TYPE |  |  | Y | VARCHAR (15) | Describes the action in RMS that is causing the message to be published to the RIB. |
| 4 | WO_ID |  |  | Y | NUMERIC (10) | wo_id from the WO_DETAIL table |
| 5 | WH |  |  | Y | NUMERIC (10) | wh from the WO_DETAIL table |
| 6 | WO_SEQ_NO |  |  | Y | NUMERIC (4) | seq_no from the WO_DETAIL table |
| 7 | ITEM |  |  | Y | VARCHAR (25) | item from the WO_DETAIL table |
| 8 | LOCATION |  |  | Y | NUMERIC (10) | location from the WO_DETAIL table |
| 9 | ORDER_NO |  |  |  | NUMERIC (12) | Order_no from the WO_HEAD table |
| 10 | LOC_TYPE |  |  | Y | VARCHAR (1) | Loc_type from the WO_HEAD table. |
| 11 | WIP_CODE |  |  |  | VARCHAR (6) | Wip_code from the WO_HEAD table. |
| 12 | THREAD_NO |  |  | Y | NUMERIC (4) | The thread on which the business transaction will be published. Each business object has one and only one thread_no. |
| 13 | FAMILY |  |  | Y | VARCHAR (30) | The functional area that this transaction belongs to. |
| 14 | CUSTOM_MESSAGE_TYPE |  |  |  | VARCHAR (1) | Not used by RMS. |
| 15 | TRANSACTION_NUMBER |  |  |  | NUMERIC (10) | Business transaction key. |
| 16 | TRANSACTION_TIME_STAMP |  |  |  | Date | Time of record creation. |

---

## Table: WOOUT_MFQUEUE

**Description:** This table will be the queue where integration messages await publication.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | The sequence in which the record was placed in the WOOUT_MFQUEUE. Used to order the publication of messages to the RIB. |
| 2 | TSF_WO_ID |  |  |  | NUMERIC (15) | The unique identifier of the Transfer Work Order |
| 3 | MESSAGE_TYPE |  |  |  | VARCHAR (15) | Describes the action in RMS that is causing the message to be published to the RIB. |
| 4 | THREAD_NO |  |  |  | NUMERIC (4) | The thread on which the business transaction will be published. Each business object has one and only one thread_no. |
| 5 | FAMILY |  |  |  | VARCHAR (30) | The functional area that this transaction belongs to. |
| 6 | CUSTOM_MESSAGE_TYPE |  |  |  | VARCHAR (1) | Not used by RMS. |
| 7 | PUB_STATUS |  |  |  | VARCHAR (1) | Set to Unpublished upon insertion into the table. Will be set to Hospital when an non-fatal error is encountered during the publication process. |
| 8 | TRANSACTION_NUMBER |  |  |  | NUMERIC (15) | Business transaction key. |
| 9 | TRANSACTION_TIME_STAMP |  |  |  | Date | Time of record creation. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WOOUT_MFQUEUE|PK||||SEQ_NO|ASC|

---

## Table: WOOUT_PUB_INFO

**Description:** This table helps in publication of the business transacation. It does this by tracking the state of the business transaction and holding any information that can be populated at the header level an used in detail level publication.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_WO_ID | P |  | Y | NUMERIC (15) | This field contains the number that uniquely identifies the transfer work order within the system. |
| 2 | THREAD_NO |  |  |  | NUMERIC (6) | The thread on which the business transaction will be published. |
| 3 | PUBLISHED |  |  |  | VARCHAR (1) | Indicates whether or not the transaction has been initially published. Valid values are Yes, No, In progress. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WOOUT_PUB_INFO|PK||||TSF_WO_ID|ASC|

---

## Table: WO_ACTIVITY

**Description:** This table holds information for the work orders that can be attached to a transfer for carrying out finishing activities on items while at a finisher location. Finishing activities are small value additions to the goods, for example adding a monogram to the shirts or reticketing merchandise.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ACTIVITY_ID | P |  | Y | NUMERIC (10) | This field contains the key uniquely identifying each row on the table. This key is generated by the WO_ACTIVITY_ID_SEQ database sequence and is not editable by the user. |
| 2 | ACTIVITY_CODE |  |  | Y | VARCHAR (10) | This field holds a unique, user-defined identifier for a particular activity to be carried out through a work order at the finisher location. |
| 3 | ACTIVITY_DESC |  |  | Y | VARCHAR (250) | This field holds the description of the activity that is to take place at the finisher location. |
| 4 | UNIT_COST |  |  |  | NUMERIC (20,4) | This field holds the per-unit monetary value for carrying out the activity. |
| 5 | COST_TYPE |  |  | Y | VARCHAR (6) | This field holds the accounting method, which determines how the cost for this activity should be handled (e.g., adding the cost to the value of the item, or expensing the cost of the activity). Valid values for this field are P - Post to Financial and U- Update Inventory Cost and is stored on the code tables for code_type ACTP. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WO_ACTIVITY|PK||||ACTIVITY_ID|ASC|
|UK_WO_ACTIVITY|UK||||ACTIVITY_CODE|ASC|

### Constraints

|Type|Column /<br>Constraint Name|Details|
|---|---|---|
|Table Level|CHK_WO_ACTIVITY|COST_TYPE IN ('U','P')<br>|
|Column Level|COST_TYPE||

---

## Table: WO_ACTIVITY_TL

**Description:** This is the translation table for WO_ACTIVITY table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | ACTIVITY_ID | P | F | Y | NUMERIC (10) | This field contains the key uniquely identifying each row on the table. This key is generated by the WO_ACTIVITY_ID_SEQ database sequence and is not editable by the user. |
| 3 | ACTIVITY_DESC |  |  | Y | VARCHAR (250) | This field holds the description of the activity that is to take place at the finisher location. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WO_ACTIVITY_TL|PK||||LANG|ASC|
||||||ACTIVITY_ID|ASC|

---

## Table: WO_DETAIL

**Description:** This table holds the details for a work order associated with a PO. It will hold all item/wh/dest loc/wip code combinations.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WO_ID | P | F | Y | NUMERIC (10) | This column holds the unique work order ID for the finishing work. |
| 2 | WH | P | F | Y | NUMERIC (10) | This column holds the warehouse at which the work order will be done. |
| 3 | ITEM | P | F | Y | VARCHAR (25) | This column holds the unique identifier included on the work order. |
| 4 | LOCATION | P |  | Y | NUMERIC (10) | This column holds the final destination of the merchandise on a PO, which could be either a store or a warehouse. |
| 5 | LOC_TYPE | P |  | Y | VARCHAR (1) | This column holds the location type of the final destination location. Valid values are: S - Store W - Warehouse |
| 6 | SEQ_NO | P |  | Y | NUMERIC (4) | This column holds a sequence number which is needed to ensure each record is unique. This is needed because the same WIP code can be listed more than once on the same work order. |
| 7 | WIP_CODE |  |  | Y | VARCHAR (6) | This column holds the WIP code which indicates the work that is to be done on the item. Valid values for this field are held on CODE_DETAIL for the code_type = WWIP. |
| 8 | PUBLISH_IND |  |  | Y | VARCHAR (1) | This field specifies whether or not the detail record has been published by the work order message family manager. Valid values are N (not published) or Y (published). |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WO_DETAIL|PK||||WO_ID|ASC|
||||||WH|ASC|
||||||ITEM|ASC|
||||||LOCATION|ASC|
||||||LOC_TYPE|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||SEQ_NO|ASC|
|WO_DETAIL_I2|||||WH|ASC|
|WO_DETAIL_I1|||||ITEM|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_WO_DETAIL_LOC_TYPE|loc_type in ('S', 'W')<br>|
|Column Level|LOC_TYPE||

---

## Table: WO_DETAIL_TEMP

**Description:** This is a temporary table which holds the details for a work order associated with a PO. It will hold all item/wh/dest loc/WIP code combinations.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WO_ID | P |  | Y | NUMERIC (10) | This column holds the work order ID for the finishing work. |
| 2 | WH | P | F | Y | NUMERIC (10) | This column holds the warehouse at which the work order will be done. |
| 3 | ITEM | P | F | Y | VARCHAR (25) | This column holds the unique identifier included on the work order. |
| 4 | LOCATION | P |  | Y | NUMERIC (10) | This column holds the final destination of the merchandise on a PO, which could be either a store or a warehouse. |
| 5 | LOC_TYPE | P |  | Y | VARCHAR (1) | This column holds the location type of the final destination location. Valid values are: S - Store W - Warehouse |
| 6 | SEQ_NO | P |  | Y | NUMERIC (4) | This column holds a sequence number which is needed to ensure each record is unique. This is needed because the same wip code can be listed more than once on the same work order. |
| 7 | WIP_CODE |  |  | Y | VARCHAR (6) | This column holds the WIP code which indicates the work that is to be done on the item. Valid values for this field are held on CODE_DETAIL for the code_type = WWIP. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WO_DETAIL_TEMP|PK||||WO_ID|ASC|
||||||WH|ASC|
||||||ITEM|ASC|
||||||LOCATION|ASC|
||||||LOC_TYPE|ASC|
||||||SEQ_NO|ASC|
|WO_DETAIL_TEMP_I1|||||ITEM|ASC|
|WO_DETAIL_TEMP_I2|||||WH|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_WO_DETAIL_TEMP_LOC_TYPE|loc_type in ('S', 'W')<br>|
|Column Level|LOC_TYPE||

---

## Table: WO_HEAD

**Description:** This table contains all work orders, both inbound and outbound, associated to an order or stock allocation, respectively. A work order specifies additional work in process that needs to be performed by the warehouse for specific items.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WO_ID | P |  | Y | NUMERIC (10) | This field holds a unique identifier for work in process associated with a purchase order. |
| 2 | TSFALLOC_NO |  |  |  | NUMERIC (12) | This field contains the transfer allocation number associated with the work order. This field is not populated currently. |
| 3 | ORDER_NO |  | F |  | NUMERIC (12) | This field contains the purchase order number associated with the work order. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WO_HEAD|PK||||WO_ID|ASC|
|WO_HEAD_I2|||||ORDER_NO|ASC|
|WO_HEAD_I1|||||TSFALLOC_NO|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_WO_HEAD_ORDER_NO|order_no is NOT NULL or tsfalloc_no is not NULL<br>|

---

## Table: WO_HEAD_TEMP

**Description:** This is a temporary table that contains all work orders, both inbound and outbound, associated to an order or stock allocation, respectively. A work order specifies additional work in process that needs to be performed by the warehouse for specific items.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WO_ID | P |  | Y | NUMERIC (10) | This field holds a unique identifier for work in process associated with a purchase order. |
| 2 | TSFALLOC_NO |  |  |  | NUMERIC (12) | This field contains the transfer allocation number associated with the work order. This field is not populated currently. |
| 3 | ORDER_NO |  |  |  | NUMERIC (12) | This field contains the purchase order number associated with the work order. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WO_HEAD_TEMP|PK||||WO_ID|ASC|
|WO_HEAD_TEMP_I2|||||TSFALLOC_NO|ASC|
|WO_HEAD_TEMP_I1|||||ORDER_NO|ASC|

---

## Table: WO_SKU_LOC

**Description:** This table contains work order information associated with a purchase order at a item/location level, in which work in process is applied.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WO_ID | P | F | Y | NUMERIC (10) | This field holds a unique identifier for work in process associated with an order. |
| 2 | WH | P |  | Y | NUMERIC (10) | This field contains the initial destination of the ordered/transferred merchandise. |
| 3 | ITEM | P |  | Y | VARCHAR (25) | This field contains a unique alphanumeric value that identifies the item. |
| 4 | LOCATION | P |  | Y | NUMERIC (10) | This field contains the final destination of the ordered/transferred merchandise, in which the WIP code is applied. This may be the warehouse ordered to or, for cross-docked allocations, the cross-dock destination location. |
| 5 | LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains the final destination location type. Valid values are S for store and W for warehouse. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WO_SKU_LOC|PK||||WO_ID|ASC|
||||||WH|ASC|
||||||ITEM|ASC|
||||||LOCATION|ASC|

---

## Table: WO_TMPL_DETAIL

**Description:** This table contains details of the work order template grouping common finishing activities. Work order templates can be associated with transfers with finishing.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WO_TMPL_DETAIL_ID | P |  | Y | NUMERIC (12) | This field holds a System-generated ID for the work order activity. |
| 2 | WO_TMPL_ID |  | F | Y | NUMERIC (10) | This field contains the unique identifier for work order template from the table WO_TMPL_HEAD. |
| 3 | ACTIVITY_ID |  | F | Y | NUMERIC (10) | This field contains the unique identifier of the finishing activity. |
| 4 | UNIT_COST |  |  | Y | NUMERIC (20,4) | This field contains the per-unit cost of the finishing activity. This value is stored in the primary currency. |
| 5 | COMMENTS |  |  |  | VARCHAR (2000) | This field contains any additional information associated with the finishing activity. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WO_TMPL_DETAIL|PK||||WO_TMPL_DETAIL_ID|ASC|
|UK_WO_TMPL_DETAIL|UK||||WO_TMPL_ID|ASC|
||||||ACTIVITY_ID|ASC|
|WO_TMPL_DETAIL_I1|||||ACTIVITY_ID|ASC|

---

## Table: WO_TMPL_HEAD

**Description:** This table contains work order templates that are used to group sets of common finishing activities. Work order templates can be associated with transfers with finishing.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WO_TMPL_ID | P |  | Y | NUMERIC (10) | This field holds a System-generated ID for the work order template. |
| 2 | WO_TMPL_DESC |  |  | Y | VARCHAR (120) | This field contains the description of a work order template. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WO_TMPL_HEAD|PK||||WO_TMPL_ID|ASC|

---

## Table: WO_TMPL_HEAD_TL

**Description:** This is the translation table for WO_TMPL_HEAD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | WO_TMPL_ID | P | F | Y | NUMERIC (10) | This field holds a System-generated ID for the work order template. |
| 3 | WO_TMPL_DESC |  |  | Y | VARCHAR (120) | This field contains the description of a work order template. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WO_TMPL_HEAD_TL|PK||||LANG|ASC|
||||||WO_TMPL_ID|ASC|

---

## Table: WO_WIP

**Description:** This table holds the codes which represent the work to be done on a work order associated with a purchase order.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | WO_ID | P | F | Y | NUMERIC (10) | This field holds a unique identifier for work in process associated with an order. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (4) | This field hods a sequence number to ensures record uniqueness. It is used as part of the primary key. |
| 3 | WIP_CODE |  |  | Y | VARCHAR (6) | This field contains the unique code that indicates the processing that should take place for the work order. Valid values for this field are held on CODE_DETAIL for the code_type = WWIP. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_WO_WIP|PK||||WO_ID|ASC|
||||||SEQ_NO|ASC|
