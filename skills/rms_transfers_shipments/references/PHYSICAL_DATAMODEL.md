# RMS Transfers, ASNs & Shipments Datamodel - Physical Data Model Reference

## Table: APPT_DETAIL

**Description:** This table contains detail-level information for warehouse generated appointments. It is populated during the appointments upload process and contains one record per appointment/location/item/ASN combination.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | APPT |  | F | Y | NUMERIC (9) | This column contains the warehouse-generated unique numerical identifier for an appointment |
| 2 | LOC |  | F | Y | NUMERIC (10) | This column contains the location to which merchandise has been sent. |
| 3 | LOC_TYPE |  |  | Y | VARCHAR (1) | This column contains the type of location where the merchandise was sent. Valid values are Warehouse, S store, and External Finisher. |
| 4 | DOC |  |  | Y | NUMERIC (12) | This column contains the Purchase Order/Transfer/Allocation corresponding to the shipped merchandise. |
| 5 | DOC_TYPE |  |  | Y | VARCHAR (1) | This column indicates the type of document corresponding to the shipped merchandise. Possible choices are Purchase Order, Transfer and Allocation. |
| 6 | ITEM |  | F | Y | VARCHAR (25) | This column contains the Item shipped to the location. |
| 7 | ASN |  |  |  | VARCHAR (30) | This column contains the Advance Shipping Notice number associated with the appointment. It is populated only when the appointment is based on an ASN. Its inclusion in the unique key allows for the existence of two or more ASN-based appointment detail records which have the same PO/Item combination. In its absence, the PO/Item quantities are rolled up into a single detail record prior to publication by the warehouse. |
| 8 | QTY_APPOINTED |  |  |  | NUMERIC (12,4) | This column contains the quantity of the Item slated to be sent to the location. |
| 9 | QTY_RECEIVED |  |  |  | NUMERIC (12,4) | This column contains the quantity of the Item actually received at the location. |
| 10 | RECEIPT_NO |  |  |  | VARCHAR (17) | This column contains the warehouse-generated unique numerical identifier corresponding to the successful reception of the item at the location. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|UK_APPT_DETAIL|UK||||APPT|ASC|
||||||LOC|ASC|
||||||DOC|ASC|
||||||ITEM|ASC|
||||||ASN|ASC|
|INDEX_APPT_DETAIL_I2|||||DOC|ASC|
|APPT_DETAIL_I1|||||ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_APPT_DETAIL_DOC_TYPE|DOC_TYPE in ('P','T','A')<br>|
||CHK_APPT_DETAIL_LOC_TYPE|LOC_TYPE in ('S','W','E')<br>|

---

## Table: APPT_HEAD

**Description:** This table contains header-level information for warehouse-generated appointments. It is populated during the appointments upload process, and will contain one record per appointment/location combination.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | APPT | P |  | Y | NUMERIC (9) | This column contains the warehouse-generated unique numerical identifier for an appointment |
| 2 | LOC | P |  | Y | NUMERIC (10) | This column contains the location to which the merchandise has been sent. |
| 3 | LOC_TYPE |  |  | Y | VARCHAR (1) | This column contains the type of location where the merchandise was sent. Valid values are Warehouse, S store, and External Finisher. |
| 4 | STATUS |  |  | Y | VARCHAR (2) | This column identifies the status of the appointment. Valid values include: SC - Scheduled, MS - Modified Scheduled, AR - Arrived, and AC - Closed. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_APPT_HEAD|PK||||APPT|ASC|
||||||LOC|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_APPT_HEAD_LOC_TYPE|LOC_TYPE in ('S','W','E')<br>|
||CHK_APPT_HEAD_STATUS|STATUS in ('SC', 'MS', 'AR', 'AC')<br>|
|Column Level|STATUS||

---

## Table: BOL_DISTRO_ITEMS_TEMP

**Description:** This global temporary table is used to aid setting up items for the bolshipment form. This will contain items from selected transfers and allocations. The records are automatically cleared on commit.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | BOL_NO | P |  | Y | VARCHAR (30) | This column contains a unique identifier for the BOL shipment in worksheet. |
| 2 | DISTRO_NO | P |  | Y | NUMERIC (12) | This field is the distribution number from where the items will be selected from |
| 3 | DISTRO_TYPE | P |  | Y | VARCHAR (1) | The type of distribution (Transfer/Allocation) |
| 4 | ITEM | P |  | Y | VARCHAR (25) | Contains the item number in the distro |
| 5 | DISTRO_QTY |  |  |  | NUMERIC (12,4) | This field is the available distribution quantity of the item. For transfers, it should be the tsf_qty. For allocations, it is the difference between qty_allocated and the qty_transfered. |
| 6 | SELECT_IND |  |  |  | VARCHAR (1) | This indicates if the item is already added to the BOL shipment. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_BOL_DISTRO_ITEMS_TEMP|PK||||BOL_NO|ASC|
||||||DISTRO_NO|ASC|
||||||DISTRO_TYPE|ASC|
||||||ITEM|ASC|

---

## Table: BOL_SHIPMENT

**Description:** This table will serve as a staging table for BOL shipments prior to shipping.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | BOL_NO | P |  | Y | VARCHAR (30) | This column contains a unique identifier for the BOL shipment in worksheet. |
| 2 | SHIP_DATE |  |  |  | Date | This column contains the target shipment date. |
| 3 | FROM_LOC |  |  | Y | NUMERIC (10) | This is the originating location. |
| 4 | FROM_LOC_TYPE |  |  | Y | VARCHAR (1) | This is the originating location type. |
| 5 | TO_LOC |  |  | Y | NUMERIC (10) | This is the destinaton location. |
| 6 | TO_LOC_TYPE |  |  | Y | VARCHAR (1) | This is the destination location type. |
| 7 | COURIER |  |  |  | VARCHAR (250) | This contains the courier method used for shipping. |
| 8 | NO_BOXES |  |  |  | NUMERIC (4) | The number of boxes in the shipment. |
| 9 | COMMENTS |  |  |  | VARCHAR (2000) | Contains miscellaneous information relating to the BOL shipment. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_BOL_SHIPMENT|PK||||BOL_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_BOL_SHIPMENT_FROM_LOC_TYPE|from_loc_type in ('S','W')<br>|
||CHK_BOL_SHIPMENT_TO_LOC_TYPE|to_loc_type in ('S','W')<br>|

---

## Table: BOL_SHIPSKU

**Description:** This table will serve as staging table for BOL shipments prior to shipping. This will contain items that may come from different distros.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | BOL_NO | P | F | Y | VARCHAR (30) | Unique identifier for the BOL shipment in worksheet. |
| 2 | DISTRO_NO | P |  | Y | NUMERIC (12) | This field contains the distribution number of the item in the BOL shipment. |
| 3 | DISTRO_TYPE | P |  | Y | VARCHAR (1) | Contains the distribution type (Transfer or Allocation). |
| 4 | ITEM | P |  | Y | VARCHAR (25) | This field contains the item to be shipped. |
| 5 | REF_ITEM |  |  |  | VARCHAR (25) | Contains the reference item if used. |
| 6 | CARTON |  |  |  | VARCHAR (20) | The carton number containing the item used in the BOL shipment. |
| 7 | SHIP_QTY |  |  |  | NUMERIC (12,4) | The quantity of items to be shipped. |
| 8 | WEIGHT_EXPECTED |  |  |  | NUMERIC (12,4) | Weight of the catch weight item. |
| 9 | WEIGHT_EXPECTED_UOM |  |  |  | VARCHAR (4) | Unit of measure used when shipping the catch weight item. |
| 10 | LAST_UPDATE_DATETIME |  |  |  | Date | Date and Time when the item was added. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_BOL_SHIPSKU|PK||||BOL_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||DISTRO_NO|ASC|
||||||DISTRO_TYPE|ASC|
||||||ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_BOL_SHIPSKU_DISTRO_TYPE|distro_type in ('A','T')<br>|
|Column Level|DISTRO_TYPE||

---

## Table: RECEIVE_ITEMS_GTT

**Description:** This global temporary table is used to support the Receive By Item screen. It holds the item receipts for a shipment.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  | Y | VARCHAR (25 ) | Unique identifier for the item. |
| 2 | SEQ_NO |  |  |  | NUMERIC (10) | Due to the fact that there can be multiple Transfers[Distros], Inventory Statuses, or Cartons for the same Shipment/Item, this field contains the sequence number used along with the Shipment number and Item to make the Shipment Item records unique. |
| 3 | ITEM_DESC |  |  |  | VARCHAR (255 ) | Item Description |
| 4 | CARTON |  |  |  | VARCHAR (20 ) | Identifies the UCC-128 carton number for shipments originating from the Advance Shipment Notification process as carton shipments. This field will be zero for all shipments that are not at a carton level. |
| 5 | DISTRO_NO |  |  |  | NUMERIC (12) | This column will hold a transfer or allocation number associated with the shipment/item/carton. |
| 6 | DISTRO_TYPE |  |  |  | VARCHAR (1 ) | Contains distro type that indicates the distro_no is for allocation number or transfer number. If A then allocation If T then transfer |
| 7 | QTY_RECEIVED |  |  |  | NUMERIC (12,4) | Contains the number of items already received for the SKU / Shipment combination. This value is used to compare the quantity expected for a shipment against the quantity actually received. |
| 8 | QTY_EXPECTED |  |  |  | NUMERIC (12,4) | Contains the number of items expected to be received based on the associated order number or on the suppliers advance shipment notification for this SKU / Shipment combination. |
| 9 | STANDARD_UOM |  |  |  | VARCHAR (4 ) | Standard unit of measurement for the item. |
| 10 | WEIGHT_EXPECTED |  |  |  | NUMERIC (12,4) | This column contains the expected weight of the item on the shipment. |
| 11 | WEIGHT_EXPECTED_UOM |  |  |  | VARCHAR (4 ) | This column contains the unit of measure of the expected weight. |
| 12 | WEIGHT_RECEIVED |  |  |  | NUMERIC (12,4) | This column contains the actual weight of the item on received on the shipment. |
| 13 | WEIGHT_RECEIVED_UOM |  |  |  | VARCHAR (4 ) | This column contains the unit of measure of the received weight. |
| 14 | ERROR_CODE |  |  |  | VARCHAR (4 ) | Holds the error code if there is failure in receiving the shipment. |
| 15 | RETURN_CODE |  |  |  | VARCHAR (4 ) | Holds the returns code if there is failure in receiving the shipment. |
| 16 | INV_STATUS |  |  |  | VARCHAR (4 ) | Holds the inventory status of the items in shipment. |
| 17 | QTY_EXPECTED_UOM |  |  |  | VARCHAR (4 ) | UOM for the expected quantity. |
| 18 | QTY_RECIEVED_UOM |  |  |  | VARCHAR (4 ) | UOM for the received quantity. |
| 19 | QTY_RECIEVED_UOM_FOR_DISPLAY |  |  |  | VARCHAR (4 ) | UOM for the received quantity. |

---

## Table: RECEIVING

**Description:** This table is used for recording details of receiving for a shipment for each order location. Once the shipment expected and received quantities are accepted, they are written to the appropriate tables. All the records written to the RECEIVING table to receive the shipment are then deleted.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SHIPMENT | P |  | Y | NUMERIC (12) | This field contains a unique number identifying a specific shipment of goods within the system. This number will either be system generated or entered by the user. |
| 2 | ITEM | P |  | Y | VARCHAR (25) | This field contains the unique identifier for the item. |
| 3 | REF_ITEM |  |  |  | VARCHAR (25) | This field contains a reference item to the item field. |
| 4 | VPN |  |  |  | VARCHAR (30) | This field contains the Vendor Product Number associated with the SKU on the shipment. |
| 5 | CARTON | P |  | Y | VARCHAR (20) | This field holds the carton number in UCC-128 number format for shipments originating from the Advance Shipment Notification process as carton shipments. This field will be zero for all shipments that are not at a carton level. |
| 6 | INV_STATUS | P |  | Y | NUMERIC (2) | This field contains the inventory status of the received item, if one exists. The inventory status field corresponds to the inventory status type found on the INV_STATUS_TYPES table. This field will contain a valid inv_status for records that have a inventory status, otherwise, this field will contain a -1. |
| 7 | QTY_RECEIVED |  |  |  | NUMERIC (12,4) | This field contains the number of items in the standard UOM already received for the SKU/Shipment combination. |
| 8 | QTY_EXPECTED |  |  |  | NUMERIC (12,4) | This field contains the number of items expected to be received based on the associated order number or on the suppliers advance shipment notification for this item / Shipment combination. |
| 9 | SUPP_PACK_SIZE |  |  | Y | NUMERIC (12,4) | This field contains the supplier pack size for this order/item or transfer/item. |
| 10 | WKSHT_QTY |  |  | Y | NUMERIC (12,4) | This field contains the quantity entered by the user to receive based on the UOR (Unit of Receipt). |

---

## Table: RECEIVING_LOG

**Description:** This table contains duplicate carton information when RMS receives a duplicate allocation receipt record for a carton.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | BOL_NO |  |  |  | VARCHAR (30) | This field holds the BOL number for duplicate carton. |
| 2 | CARTON |  |  |  | VARCHAR (20) | This field holds the carton ID for duplicate carton. |
| 3 | CARTON_STATUS |  |  |  | VARCHAR (1) | This field holds the carton status for duplicate carton. Values for this field can be: A - Actual, D - Dummy, O - Overage |
| 4 | TO_LOC |  |  |  | NUMERIC (10) | This field holds the receiving location for duplicate carton. |
| 5 | TRAN_TYPE |  |  |  | VARCHAR (1) | This field holds the transaction type on duplicate carton record. Valid values are: A - Adjustment, R - Receipt, T - Transshipment. |
| 6 | TRAN_DATE |  |  |  | Date | This field holds the transaction date when the duplicate carton was received. |
| 7 | RECEIPT_NO |  |  |  | VARCHAR (17) | This field holds the receipt number on duplicate carton record. |
| 8 | CREATE_DATETIME |  |  |  | Date | This field holds the timestamp when record was inserted into table. |

---

## Table: SHIPITEM_INV_FLOW

**Description:** This table will hold the details of how the shipment line item flows (i.e. maps) between the from location and the to location of the shipment. This mapping is determined in the transfer outbound process and is used by the transfer inbound process to determine how the stock should be distributed within the to location. The primary transactions that can populate this table include all externally generated transfers. No foreign key to the SHIPSKU table should exist. The BOL process needs to insert into this table before the SHIPSKU parent table due to performance reasons.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SHIPMENT | P |  | Y | NUMERIC (12) | This field contains the shipment number. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (10) | Due to the fact that there can be multiple Transfers[Distros], Inventory Statuses, or Cartons for the same Shipment/Item, this field contains the sequence number used along with the Shipment number and Item to make the Shipment Item records unique. |
| 3 | ITEM | P |  | Y | VARCHAR (25) | This field contains the item that is being shipped. |
| 4 | FROM_LOC | P |  | Y | NUMERIC (10) | This field contains the location number of the from location for the transfer detail inventory flow. This field will contain either a store or virtual warehouse number based on the FROM_LOC_TYPE field. |
| 5 | TO_LOC | P |  | Y | NUMERIC (10) | This field contains the location number of the to location for the transfer detail inventory flow. This field will contain either a store or virtual warehouse number based on the TO_LOC_TYPE field. |
| 6 | FROM_LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains the location type of the from location for the transfer detail inventory flow. Valid values are Store and Warehouse. |
| 7 | TO_LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains the location type of the to location for the transfer detail inventory flow. Valid values are Store and Warehouse. |
| 8 | TSF_NO |  | F | Y | NUMERIC (12) | This field contains a number that uniquely identifies the transfer within the system. |
| 9 | TSF_SEQ_NO |  | F | Y | NUMERIC (8) | This field contains a sequence number when combined with the transfer number will make the Transfer Detail line item unique. |
| 10 | TSF_QTY |  |  | Y | NUMERIC (12,4) | This field contains the transfer quantity associated with the inventory flow between the from and to locations. |
| 11 | RECEIVED_QTY |  |  |  | NUMERIC (12,4) | This field contains the received quantity associated with the inventory flow between the from and to locations. |
| 12 | DIST_PCT |  |  | Y | NUMERIC (12,4) | This field contains the percentage that the transfer quantity associated with the inventory flow between the from and to locations makes up from the entire transfer for the Transfer Detail line item. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SHIPITEM_INV_FLOW|PK||||SHIPMENT|ASC|
||||||SEQ_NO|ASC|
||||||ITEM|ASC|
||||||FROM_LOC|ASC|
||||||TO_LOC|ASC|
|SHIPITEM_INV_FLOW_I1|||||TSF_NO|ASC|
||||||TSF_SEQ_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SHPINV_FLW_FRM_LOC_TYPE|from_loc_type in ('S', 'W','E')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_SHPINV_FLW_TO_LOC_TYPE|to_loc_type in ('S', 'W','E')<br>|

---

## Table: SHIPMENT

**Description:** This table contains one row for each shipment within the system. Base information about each shipment for each order is held in this table for as long as its associated order header is retained.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SHIPMENT | P |  | Y | NUMERIC (12) | Contains the unique number identifying a specific shipment of goods within the system. This number will either be system generated or entered by the user. |
| 2 | ORDER_NO |  | F |  | NUMERIC (12) | Identifies the order number which relates to the goods delivered in the shipment. |
| 3 | BOL_NO |  |  |  | VARCHAR (30 BYTE) | This column will hold the bill of lading number associated with a shipment. |
| 4 | ASN |  |  |  | VARCHAR (30 BYTE) | This column will hold the advance shipping notice number associated with a shipment. |
| 5 | SHIP_DATE |  |  | Y | Date (7) | This field contains the date the transfer or PO was shipped. |
| 6 | RECEIVE_DATE |  |  |  | Date (7) | This field contains the date the transfer or PO is received. |
| 7 | EST_ARR_DATE |  |  |  | Date (7) | This field contains the estimated arrival date of a vendor PO shipment. It is updated by EDIUP856. It is used for vendor/lead time analysis. |
| 8 | SHIP_ORIGIN |  |  | Y | VARCHAR (1 BYTE) | Indicates where the shipment was created in the system. Valid values for this field include: 0 - ASN Shipment 1 - Manual Shipment 2 - Autoship 3 - System 4 - System ASN 5 - System UCC-128 6 - ASN UCC-128. |
| 9 | STATUS_CODE |  |  | Y | VARCHAR (1 BYTE) | Indicates the current status of the shipment. The valid values are: R - Received I - Input C - Cancelled E - Extracted V - Invoice Entered U - Unmatched (indicates a shipment w/ origin_code = 4 created in receipts upload process which has not been matched to either an electronically sent ASN or manually keyed ASN. |
| 10 | INVC_MATCH_STATUS |  |  |  | VARCHAR (1 BYTE) | Status of the shipments invoice matching. Valid values are U for unmatched, P for partially matched, M for matched and C for closed (posted to AP or closed out by batch). This column will only be populated for PO shipments. |
| 11 | INVC_MATCH_DATE |  |  |  | Date (7) | Date the shipment is completely matched to one or more invoices. This column will only be populated for PO shipments. |
| 12 | TO_LOC |  |  | Y | NUMERIC (10) | This field contains the location that the shipment will be delivered to. |
| 13 | TO_LOC_TYPE |  |  | Y | VARCHAR (1 BYTE) | This field indicates whether the to_loc value contains a Store, a Warehouse or an External Finisher. Valid values are S,W and E. |
| 14 | FROM_LOC |  |  |  | NUMERIC (10) | For transfer and allocation shipments, this field will hold the location from which the shipment was sourced. |
| 15 | FROM_LOC_TYPE |  |  |  | VARCHAR (1 BYTE) | For transfer and allocation shipments, this field will hold the location type from which the shipment was sourced. This field indicates whether the from_loc value contains a Store, a Warehouse or an External Finisher. Valid values are S,W and E. |
| 16 | COURIER |  |  |  | VARCHAR (250 BYTE) | Contains the courier that will deliver the shipment. |
| 17 | NO_BOXES |  |  |  | NUMERIC (6) | Contains the number of boxes associated with the shipment. |
| 18 | EXT_REF_NO_IN |  |  |  | VARCHAR (17 BYTE) | This field holds the transaction sequence number on the input file from the receiving PO or transfer process. |
| 19 | EXT_REF_NO_OUT |  |  |  | VARCHAR (17 BYTE) | This field holds the transaction sequence number on the input file from the transfer shipment confirmation process. |
| 20 | COMMENTS |  |  |  | VARCHAR (2000 BYTE) | Contains any miscellaneous comments about the shipment. |
| 21 | PARENT_SHIPMENT |  | F | Y | NUMERIC (12) | Shipment No of Parent shipment (Indicates that this is a Child Shipment). A Child shipment is created when an already matched shipment is updated with an adjustment quantity. The adjust quantity is created for the child shipment. |
| 22 | BILL_TO_LOC |  |  |  | NUMERIC (10) | This identifies the importer/exporter assigned to the supplier. This will reference the WH.WH table and a foreign key created to reflect this. |
| 23 | BILL_TO_LOC_TYPE |  |  |  | VARCHAR (1 BYTE) | Location type of the Bill_to_loc. |
| 24 | REF_DOC_NO |  |  |  | VARCHAR (25 BYTE) | This contains a reference number for a document associated to the shipment (e.g. Fiscal Document ID for Brazilian based transactions) |

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table<br>Level|CHK_SHIPMENT_BOL_NO|(bol_no is not null and from_loc is not null and from_loc_type is not null and order_no is null) or (bol_no is null and from_loc is null and from_loc_type<br>is null and order_no is not null)<br>|
||CHK_SHIPMENT_FROM_LOC_TYPE|(from_loc_type         IN ('W','S','E'))<br>|
||CHK_SHIPMENT_INVC_MATCH_STATUS|(invc_match_status IN ('U','M','C') )<br>|
||CHK_SHIPMENT_SHIP_ORIGIN|(SHIP_ORIGIN             IN('0','1','2','3','4','5','6') )<br>|
||CHK_SHIPMENT_STATUS_CODE|(STATUS_CODE             IN('R','I','C','E','V','U') )<br>|
||CHK_SHIPMENT_TO_LOC_TYPE|(TO_LOC_TYPE             IN ('S','W','E'))|
|Column<br>Level|SHIP_ORIGIN||
|Column<br>Level|SHIP_ORIGIN|Value List|






|Type|Column / Constraint Name|Details|Col4|
|---|---|---|---|
|||Value|Description|
|||'0'||
|||'1'||
|||'2'||
|||'3'||
|||'4'||
|||'5'||
|||'6'||
||STATUS_CODE|||
||STATUS_CODE|Value List|Value List|
||STATUS_CODE|Value|Description|
||STATUS_CODE|'C'||
||STATUS_CODE|'E'||
||STATUS_CODE|'I'||
||STATUS_CODE|'R'||
||STATUS_CODE|'U'||
||STATUS_CODE|'V'||
||INVC_MATCH_STATUS|||
||INVC_MATCH_STATUS|Value List|Value List|
||INVC_MATCH_STATUS|Value|Description|
||INVC_MATCH_STATUS|'C'||
||INVC_MATCH_STATUS|'M'||
||INVC_MATCH_STATUS|'U'||
||TO_LOC_TYPE|||
||TO_LOC_TYPE|Value List|Value List|
||TO_LOC_TYPE|Value|Description|






|Type|Column / Constraint Name|Details|Col4|
|---|---|---|---|
|||'E'||
|||'S'||
|||'W'||
||FROM_LOC_TYPE|||
||FROM_LOC_TYPE|Value List|Value List|
||FROM_LOC_TYPE|Value|Description|
||FROM_LOC_TYPE|'E'||
||FROM_LOC_TYPE|'S'||
||FROM_LOC_TYPE|'W'||

---

## Table: SHIPMENT_PUB_INFO

**Description:** This table is used for publishing shipments for Tranfers and Allocations created in RMS on-line. When a shipment is created in RMS and the corresponding receipt will not be processed in RMS, the shipment will be staged on this table for publishing to the RIB, so as to inform the receiving location of the incoming shipment.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | The sequence in which records are placed on SHIPMENT_PUB_INFO. Used to order the publication of messages to the RIB. |
| 2 | SHIPMENT |  |  | Y | NUMERIC (12) | This field contains the shipment number. |
| 3 | THREAD_NO |  |  | Y | NUMERIC (6) | The thread on which the business transaction will be published. Each business object has one and only one thread_no. |
| 4 | MESSAGE_TYPE |  |  | Y | VARCHAR (15) | Describes the action in RMS that is causing the message to be published to the RIB |
| 5 | FAMILY |  |  | Y | VARCHAR (30) | The functional area that this transaction belongs to, in this case, shipments. |
| 6 | CUSTOM_MESSAGE_TYPE |  |  |  | VARCHAR (1) | Not used by RMS. |
| 7 | PUB_STATUS |  |  | Y | VARCHAR (1) | Indicates the publishing status of the message. Inserted as U (unpublished); set to H (hospital) when an error is encountered during the publication process; set to P (published) when published successfully. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SHIPMENT_PUB_INFO|PK||||SEQ_NO|ASC|

---

## Table: SHIPMENT_PUB_TEMP

**Description:** This is a session specific global temporary table that will assist the publishing of shipments created in RMS on-line that will be received in a separate store or warehouse system. Shipment number will be recorded in this table if system_options.ship_rcv_store = N and ship to location type is S or if system_options.ship_rcv_wh = N and ship to location type is W.A publishing trigger on this table will call the shipment publishing API to add the shipment to the SHIPMENT_PUB_INFO table for RIB to pick up. Since this is a session specific global temporary table, records on the staging SHIPMENT_PUB_TEMP table are automatically purged upon closing the RMS form.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SHIPMENT | P |  | Y | NUMERIC (12) | This contains the shipment number that will be published. |

---

## Table: SHIPMENT_PURGE_TEMP

**Description:** This table is used to hold shipments for the transfers picked by batch tsfprg.pc for purging.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SHIPMENT |  |  |  | NUMERIC (12) | Contains the unique number identifying a specific shipment of goods within the system. This number will either be system generated or entered by the user. |

---

## Table: SHIPMENT_TMP

**Description:** This table is used to assist the V_SHIPMENT view in returning shipment information on the shipfind form.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SHIPMENT_NO | P |  | Y | NUMERIC (12) | This field will hold all the shipment numbers resulting from the dynamic query created from the form. |

---

## Table: SHIPSKU

**Description:** This table contains one row for each shipment/SKU combination in the system. When a shipment header is purged all associated rows in this table are also purged.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SHIPMENT | P |  | Y |  | Contains the unique number identifying a specific shipment of goods within the system. This number will either be system generated or entered by the user. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (10) | Due to the fact that there can be multiple Transfers[Distros], Inventory Statuses, or Cartons for the same Shipment/Item, this field contains the sequence number used along with the Shipment number and Item to make the Shipment Item records unique. |
| 3 | ITEM | P |  | Y | VARCHAR (25 BYTE) | Unique identifier for the item. |
| 4 | DISTRO_NO |  |  |  | NUMERIC (12) | This column will hold a transfer or allocation number associated with the shipment/item/carton. |
| 5 | DISTRO_TYPE |  |  |  | VARCHAR (1 BYTE) | Contains distro type that indicates the distro_no is for allocation number or transfer number. If A then allocation If T then transfer |
| 6 | REF_ITEM |  |  |  | VARCHAR (25 BYTE) | Contains a reference item to the item field. |
| 7 | CARTON |  |  |  | VARCHAR (20 BYTE) | Identifies the UCC-128 carton number for shipments originating from the Advance Shipment Notification process as carton shipments. This field will be zero for all shipments that are not at a carton level. |
| 8 | INV_STATUS |  |  |  | NUMERIC (2) | This field contains the inventory status, if one exists, for the SHIPSKU record. The inventory status field corresponds to the inventory status type found on the INV_STATUS_TYPES table. This field will contain a valid inv_status for transfer records that have a inventory status, otherwise, this field will contain a -1. |
| 9 | STATUS_CODE |  |  | Y | VARCHAR (1 BYTE) | Indicates the status of the SKU on the shipment. Valid values include: H - Hold A - Accept R - Reject C - Carton Received. |
| 10 | QTY_RECEIVED |  |  |  | NUMERIC (12,4) | Contains the number of items already received for the SKU / Shipment combination. This value is used to compare the quantity expected for a shipment against the quantity actually received. |
| 11 | UNIT_COST |  |  | Y | NUMERIC (20,4) | If the shipment is associated with a purchase order, UNIT_COST contains the cost of the SKU for this Shipment / Location combination based on the purchase order cost for the item and is stored in the order currency. The cost does not include landed cost components. If the shipment is associated with a transfer or allocation, UNIT_COST contains the average cost of the item at the sending location plus any |
| 12 | UNIT_RETAIL |  |  | Y | NUMERIC (20,4) | If the shipment is associated with a purchase order, UNIT_RETAIL contains the retail price of the item based on the associated purchase order and is stored in the local currency. If the shipment is associated with a transfer or allocation, UNIT_RETAIL contains the retail of the item at the from location and is stored in the from locations currency. If it is for a transfer Of type EG (externally generated) and has multiple inventory flows, UNIT_RETAIL contains the average retail of the sending locations. |
| 13 | QTY_EXPECTED |  |  |  | NUMERIC (12,4) | Contains the number of items expected to be received based on the associated order number or on the suppliers advance shipment notification for this SKU / Shipment combination. |
| 14 | MATCH_INVC_ID |  | F |  | NUMERIC (10) | Invoice that the shipment line is matched to. |
| 15 | ADJUST_TYPE |  |  |  | VARCHAR (6 BYTE) | Contains the type of adjustment made for stock order receipt exceptions. This field is not required and valid values besides NULL are: SL - Shipping Location Faulted RL - Receiving Location Faulted FC - Freight Claim (i.e. missing units are freight claimed) FR - Force Receipt (i.e. what is shipped is received) RE - Received Elsewhere See Comments (i.e. wrong store received the qty) Adjust type RE is set by the Wrong Store Receipt Exception handler, while the rest of the adjust types are entered by the user through the Stock Order Exception Reconciliation Screen. Valid values are contained on the code_detail table with code_type = GART. |
| 16 | ACTUAL_RECEIVING_STORE |  |  |  | NUMERIC (10) | Contains the Actual Receiving Store Number when the Carton was received at wrong store. |
| 17 | RECONCILE_USER_ID |  |  |  | VARCHAR (30 BYTE) | Contains the ID of the user who reconciled the exception from the Stock Order Exception Reconciliation Screen. |
| 18 | RECONCILE_DATE |  |  |  | Date (7) | Contains the date the exception was reconciled from the Stock Order Exception Reconciliation Screen. |
| 19 | TAMPERED_IND |  |  |  | VARCHAR (1 BYTE) | Indicates the Carton was tampered or not. |
| 20 | DISPOSITIONED_IND |  |  |  | VARCHAR (1 BYTE) | Indicates the shipment was dispositioned at Carton level (not BOL level). |
| 21 | QTY_MATCHED |  |  |  | NUMERIC (12,4) | Matched Quantity that will be updated by ReIM when the receipt is matched |
| 22 | WEIGHT_RECEIVED |  |  |  | NUMERIC (12,4) | This column contains the actual weight of the item on received on the shipment. |
| 23 | WEIGHT_RECEIVED_UOM |  |  |  | VARCHAR (4 BYTE) | This column contains the unit of measure of the received weight. |
| 24 | WEIGHT_EXPECTED |  |  |  | NUMERIC (12,4) | This column contains the expected weight of the item on the shipment. |
| 25 | WEIGHT_EXPECTED_UOM |  |  |  | VARCHAR (4 BYTE) | This column contains the unit of measure of the expected weight. |
| 26 | ORIG_MATCHED_COST |  |  |  | NUMERIC (20,4) | The cost at which the receipt was originally matched the first time. |
| 27 | INVC_MATCH_STATUS |  |  |  | VARCHAR (1 BYTE) | Invoice match status. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SHIPSKU|PK||||SHIPMENT|ASC|
||||||ITEM|ASC|
||||||SEQ_NO|ASC|
|SHIPSKU_I2|||||MATCH_INVC_ID|ASC|
|SHIPSKU_I1|||||ITEM|ASC|
||||||DISTRO_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SHIPSKU_I6|||||RECONCILE_USER_ID|ASC|
|SHIPSKU_I5|||||CARTON|ASC|
|SHIPSKU_I4|||||SHIPMENT|ASC|
||||||ITEM|ASC|
||||||CARTON|ASC|
||||||DISTRO_NO|ASC|
||||||INV_STATUS|ASC|
||||||DISTRO_TYPE|ASC|
|SHIPSKU_I7|||||DISTRO_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|Col4|
|---|---|---|---|
|Table<br>Level|CHK_SHIPSKU_ADJUST_TYPE|ADJUST_TYPE IN ('FC', 'FR', 'RE', 'RL', 'SL','NL','BL')<br>|ADJUST_TYPE IN ('FC', 'FR', 'RE', 'RL', 'SL','NL','BL')<br>|
||CHK_SHIPSKU_DISPOSITIONED_IND|DISPOSITIONED_IND IN ('Y')<br>|DISPOSITIONED_IND IN ('Y')<br>|
||CHK_SHIPSKU_DISTRO_TYPE|DISTRO_TYPE IN ('A','T')<br>|DISTRO_TYPE IN ('A','T')<br>|
||CHK_SHIPSKU_STATUS_CODE|STATUS_CODE IN ('H','A','R','C')<br>|STATUS_CODE IN ('H','A','R','C')<br>|
||CHK_SHIPSKU_TAMPERED_IND|TAMPERED_IND IN ('Y')<br>|TAMPERED_IND IN ('Y')<br>|
|Column<br>Level|DISTRO_TYPE|Value List<br>Value<br>Description<br>'A'<br> <br>'T'<br>|Value List<br>Value<br>Description<br>'A'<br> <br>'T'<br>|
|Column<br>Level|DISTRO_TYPE|Value List|Value List|
|Column<br>Level|DISTRO_TYPE|Value|Description|
|Column<br>Level|DISTRO_TYPE|'A'||
|Column<br>Level|DISTRO_TYPE|'T'||






|Type|Column / Constraint Name|Details|Col4|
|---|---|---|---|
||STATUS_CODE|Value List<br>Value<br>Description<br>'A'<br> <br>'C'<br> <br>'H'<br> <br>'R'<br>|Value List<br>Value<br>Description<br>'A'<br> <br>'C'<br> <br>'H'<br> <br>'R'<br>|
||STATUS_CODE|Value List|Value List|
||STATUS_CODE|Value|Description|
||STATUS_CODE|'A'||
||STATUS_CODE|'C'||
||STATUS_CODE|'H'||
||STATUS_CODE|'R'||
||ADJUST_TYPE<br>|<br>Value List<br>Value<br>Description<br>'BL'<br> <br>'FC'<br> <br>'FR'<br> <br>'NL'<br> <br>'RE'<br>'RL'<br> <br>'SL'<br>|<br>Value List<br>Value<br>Description<br>'BL'<br> <br>'FC'<br> <br>'FR'<br> <br>'NL'<br> <br>'RE'<br>'RL'<br> <br>'SL'<br>|
||ADJUST_TYPE<br>|Value List|Value List|
||ADJUST_TYPE<br>|Value|Description|
||ADJUST_TYPE<br>|'BL'||
||ADJUST_TYPE<br>|'FC'||
||ADJUST_TYPE<br>|'FR'||
||ADJUST_TYPE<br>|'NL'||
||ADJUST_TYPE<br>|'RE'||
||ADJUST_TYPE<br>|'RL'||
||ADJUST_TYPE<br>|'SL'||
||TAMPERED_IND|Value List<br>Value<br>Description<br>'Y'<br>|Value List<br>Value<br>Description<br>'Y'<br>|
||TAMPERED_IND|Value List|Value List|
||TAMPERED_IND|Value|Description|
||TAMPERED_IND|'Y'||
||DISPOSITIONED_IND|Value List<br>Value<br>Description<br>'Y'<br>|Value List<br>Value<br>Description<br>'Y'<br>|
||DISPOSITIONED_IND|Value List|Value List|
||DISPOSITIONED_IND|Value|Description|
||DISPOSITIONED_IND|'Y'||

---

## Table: SHIPSKU_LOC

**Description:** This table holds the order received quantity at virtual warehouses when an order is received at a warehouse or has a warehouse as the costing location.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SHIPMENT | P | F | Y |  | Contains the unique number identifying a specific shipment of goods within the system. |
| 2 | SEQ_NO | P | F | Y | NUMERIC (10) | Contains the shipsku seq_no. |
| 3 | ITEM | P | F | Y | VARCHAR (25 BYTE) | Identifies the item on the shipsku. |
| 4 | TO_LOC | P |  | Y | NUMERIC (10) | Holds the virtial warehouse that received the order quantity. |
| 5 | QTY_RECEIVED |  |  |  | NUMERIC (12,4) | Holds the quantity received at the virtual warehouse. |
| 6 | QTY_EXPECTED |  |  |  | NUMERIC (12,4) | Holds the quantity expected at the virtual warehouse. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SHIPSKU_LOC|PK||||SHIPMENT|ASC|
||||||SEQ_NO|ASC|
||||||ITEM|ASC|
||||||TO_LOC|ASC|

---

## Table: SHIPSKU_TEMP

**Description:** This is a global temporary table used during dummy and tampered carton batch processing.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SHIPMENT |  |  |  | NUMERIC (12) | Contains the unique number identifying a specific shipment of goods within the system. This number will either be system generated or entered by the user. |
| 2 | STATUS_CODE |  |  |  | VARCHAR (1) | Indicates the status of the SKU on the shipment. |
| 3 | DISTRO_TYPE |  |  |  | VARCHAR (1) | Indicates the type of distro |
| 4 | CARTON |  |  |  | VARCHAR (20) | Carton ID retrieved from shipsku for the BOL |
| 5 | ITEM |  |  |  | VARCHAR (25) | Item |
| 6 | PREPACK_ITEM |  |  |  | VARCHAR (25) | prepack item |
| 7 | COMPONENT_QTY_EXPECTED |  |  |  | NUMERIC (12,4) | Expected quantity of the item |
| 8 | PACK_QTY_EXPECTED |  |  |  | NUMERIC (12,4) | Expected quantity of the pack item. |
| 9 | DISTRO_NO |  |  |  | NUMERIC (12) | Distro number for the item retrieved from the shipsku table |
| 10 | QTY_RECEIVED |  |  |  | NUMERIC (12,4) | Contains the number of items already received for the SKU / Shipment combination |

---

## Table: SIM_EXPL

**Description:** Sup_inv_mgmt hold investment buy information for sup/dept/loc combinations that are investment buy eligible. It combines sup_inv_mgmt records exploded down to the sup/dept/loc level for all wh/dept combinations on wh_dept_sim. It is then used by ibcalc.pc to find investment buy opportunities.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SUPPLIER |  |  | Y | NUMERIC (10) | Unique identifying number for the supplier within the system. |
| 2 | POOL_SUPPLIER |  |  |  | NUMERIC (10) | This column will link the supplier/dept/loc to a master supplier. |
| 3 | IB_ORDER_CTRL |  |  | Y | VARCHAR (6) | Contains the investment buy order control associated with the supplier, supplier/dept, supplier/loc or supplier/dept/loc. When the investment buy opportunity calculation processes an item/supplier/origin_country/location, this value is retrieved at lowest applicable level. A value of Manual dictates that investment buy ROQs |
| 4 | TERMS |  |  | Y | VARCHAR (15) | Indicates the alphanumeric representation of Term Name which acts as the Term code in Oracle Financials. |
| 5 | DUEDAYS |  |  | Y | NUMERIC (3) | Contains the number of days until payment is due |
| 6 | WH |  |  | Y | NUMERIC (10) | This column will contain the warehouse associated with the Investment Buy setup data. |
| 7 | PHYSICAL_WH |  |  | Y | NUMERIC (10) | Contains the physical wh associated with the wh. |
| 8 | REPL_WH_LINK |  |  |  | NUMERIC (10) | This column contains the replenishable warehouse that is attached to the virtual warehouse. |
| 9 | DEPT |  |  | Y | NUMERIC (4) | This column will contain the department associated with the Investment Buy setup data |
| 10 | BUYER |  |  |  | NUMERIC (4) | Contains the buyer associated with the dept. |
| 11 | COST_WH_STORAGE_MEAS |  |  |  | VARCHAR (6) | The type of the whs stroage cost. |
| 12 | COST_WH_STORAGE |  |  |  | NUMERIC (20,4) | Contains the default cost of warehouse storage, expressed as the weekly cost per the unit of measure specified in COST_WH_STORAGE_UOM. This value is held in the primary system currency and currently used by the investment buy functionality only. |
| 13 | COST_WH_STORAGE_UOM |  |  |  | VARCHAR (4) | Contains the unit of measure to which the default cost of warehouse storage is applicable. The unit of measure may only be pallet or from the volume class. This value is currently used by the investment buy functionality only. |
| 14 | COST_OUT_STORAGE_MEAS |  |  |  | VARCHAR (6) | The type of the whs stroage cost. |
| 15 | COST_OUT_STORAGE |  |  |  | NUMERIC (20,4) | Contains the default cost of outside storage, expressed as the weekly cost per the unit of measure specified in COST_OUT_STORAGE_UOM. This value is held in the primary system currency and currently used by the investment buy functionality only. |
| 16 | COST_OUT_STORAGE_UOM |  |  |  | VARCHAR (4) | Contains the unit of measure to which the default cost of outside storage is applicable. The unit of measure may only be pallet or from the volume class. This value is currently used by the investment buy functionality only. |
| 17 | STORAGE_TYPE |  |  | Y | VARCHAR (6) | Indicates which type of storage cost should be used as the default storage cost when calculating investment buy opportunities. Valid values are Warehouse and Outside. This value is currently used by the investment buy functionality only. |
| 18 | STORAGE_CURRENCY |  |  | Y | VARCHAR (3) | Indicates currency used for storages costs. |
| 19 | SUPPLIER_CURRENCY |  |  | Y | VARCHAR (3) | Indicates suppliers currency. |
| 20 | MAX_WEEKS_SUPPLY |  |  | Y | NUMERIC (3) | Contains the default maximum weeks of supply to use in the investment buy opportunity calculation. The investment buy opportunity calculation will not recommend an order quantity that would stock the associated location (currently warehouses only) beyond this number of weeks. This value is currently used by the investment buy functionality only. |
| 21 | TARGET_ROI |  |  | Y | NUMERIC (12,4) | Contains the default return on investment that must be met or exceeded for the investment buy opportunity to recommend an order quantity. This value is currently used by the investment buy functionality only |
| 22 | COST_MONEY |  |  |  | NUMERIC (12,4) | Contains the cost of money, defined as the annualized percentage cost to borrow capital for investing. This value is currently used by the investment buy functionality only. |
| 23 | RECORD_SRC |  |  |  | VARCHAR (10) | Contains ALL_LVL if the sup_inv_mgmt parameters were sourced at the sup/dept/loc level. Contains LOC_LVL if the sup_inv_mgmt parameters |

---

## Table: SO_SHIPMENT_TEMP

**Description:** This table will be used by the Stock Order Exception Reconciliation form. It will be populated upon entering the form with shipment records that have discrepencies between the quantity shipped and the quantity received on the shipsku table. Valid shipments must be for transfers or allocations, shipment not in closed status, with discrepant shipsku records that have not already been adjusted. The totals are summations of the discrepant shipsku records.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SHIPMENT |  |  |  | NUMERIC (12) | Unique number identifying a specific shipment of goods within the system that has discrepencies. |
| 2 | BOL_NO |  |  |  | VARCHAR (30) | Bill of lading number associated with the shipment |
| 3 | TO_LOC_TYPE |  |  |  | VARCHAR (1) | Indicates whether the receiving location value contains a store or a warehouse. Valid values are S and W. |
| 4 | TO_LOC |  |  |  | NUMERIC (10) | Location receiving the shipment |
| 5 | TO_LOC_DESC |  |  |  | VARCHAR (150) | Description of the store or warehouse. |
| 6 | FROM_LOC_TYPE |  |  |  | VARCHAR (1) | Indicates whether the sending location value contains a store or a warehouse. Valid values are S and W. |
| 7 | FROM_LOC |  |  |  | NUMERIC (10) | Location sending the shipment. |
| 8 | FROM_LOC_DESC |  |  |  | VARCHAR (150) | Description of the store or warehouse. |
| 9 | SHIP_DATE |  |  |  | Date | Date the transfer, allocation, or PO was shipped. |
| 10 | RECEIVE_DATE |  |  |  | Date | Date the transfer, allocation, or PO was received. |
| 11 | OVER_SHORT |  |  |  | NUMERIC (12,4) | Calculated by summing (qty_received - qty_expected) for all shipsku records where the qty_received is not equal to the qty_expected. This number may be positive, negative, or zero (if there are shipsku records with an overage and shipsku records with a shortage). |
| 12 | TOTAL_COST_FROM_LOC |  |  |  | NUMERIC (20,4) | Calculated by summing the cost times the over_short, i.e. (unit_cost * (qty_received - qty_expected)), for all shipsku records where the qty_received is not equal to the qty_expected. This number may be positive, negative, or zero (if there are shipsku records with an overage and shipsku records with a shortage). This value is in the sending location currency. |
| 13 | TOTAL_COST_PRIMARY |  |  |  | NUMERIC (20,4) | Conversion of total_cost_from_loc into the primary currency. |
| 14 | TOTAL_COST_LOCAL |  |  |  | NUMERIC (20,4) | Conversion of total_cost_from_loc into the currency of the receiving location (local currency). |
| 15 | TOTAL_RETAIL_FROM_LOC |  |  |  | NUMERIC (20,4) | Calculated by summing the retail times the over_short, i.e. (unit_retail * (qty_received - qty_expected)), for all shipsku records where the qty_received is not equal to the qty_expected. This number may be positive, negative, or zero (if there are shipsku records with an overage and shipsku records with a shortage). This value is in the sending location currency. |
| 16 | TOTAL_RETAIL_PRIMARY |  |  |  | NUMERIC (20,4) | Conversion of total_retail_from_loc into the primary currency. |
| 17 | TOTAL_RETAIL_LOCAL |  |  |  | NUMERIC (20,4) | Conversion of total_retail_from_loc into the currency of the receiving location (local currency). |
| 18 | LOCAL_CURRENCY |  |  |  | VARCHAR (5) | Currency of the receiving location (local currency). |
| 19 | TAMPERED_IND |  |  |  | VARCHAR (1) | Indicates if any carton within the discrepant shipsku records has been tampered (tampered_ind = Y). |
| 20 | HAS_CARTON_IND |  |  |  | VARCHAR (1) | Indicates if any discrepant shipsku record has an associated carton. |
| 21 | CARTON_DISP_IND |  |  |  | VARCHAR (1) | Indicates if any discrepant shipsku records have already been adjusted within the Carton Level Disposition window. |
| 22 | ADJUST_TYPE |  |  |  | VARCHAR (6) | The type of adjustment to be applied to all discrepant, non-adjusted shipsku records for this shipment. Valid values are SL - Shipping Location; RL - Receiving Location; FC - Freight Claim; FR - Forced Receipt; RE - Received Elsewhere. |
| 23 | SHIPMENT_OVER_SHORT_IND |  |  |  | NUMERIC (1) | Value indicating the existence of carton overage or shortage records within the shipment: 1 if all carton level records are overages -1 if all carton level records are shortages 0 if both overage and shortage carton level records exist |
| 24 | SHIPMENT_UNRECEIVED_IND |  |  |  | VARCHAR (1) | If any of the cartons for this shipment have line items that have not been received then the shipment_unreceived_ind is set to Y (N otherwise). |
| 25 | WRONG_STORE_IND |  |  |  | VARCHAR (1) | Indicates one or more items in the shipment or carton was received at wrong store. |

---

## Table: SO_SHIPSKU_TEMP

**Description:** This table will be used by the Stock Order Exception Reconciliation form. It will be populated upon entering the form with shipsku records that have discrepencies between the quantity shipped and the quantity received. Valid records must be for transfers or allocations, shipment not in closed status, with discrepant shipsku records that have not already been adjusted. The discrepant shipsku records are rolled up to the shipment/carton level.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SHIPMENT |  |  |  | NUMERIC (12) | Number identifying a specific shipment of goods within the system that has discrepencies. A unique record on this table consists of a shipment/carton combination. |
| 2 | CARTON |  |  |  | VARCHAR (20) | Identifies the UCC-128 carton number for shipments originating from the Advance Shipment Notification process as carton shipments. This field will be zero for all shipments that are not at a carton level. A unique record on this table consists of a shipment/carton combination. |
| 3 | ADJUST_TYPE |  |  |  | VARCHAR (6) | The type of adjustment to be applied to all discrepant shipsku records for this shipment/carton combination. Valid values are SL - Shipping Location; RL - Receiving Location; FC - Freight Claim; FR - Forced Receipt; RE - Received Elsewhere. |
| 4 | OVER_SHORT |  |  |  | NUMERIC (12,4) | Calculated by summing (qty_received - qty_expected) for all shipsku records where the qty_received is not equal to the qty_expected within this shipment/carton combination. This number may be positive, negative, or zero (if there are shipsku records with an overage and shipsku records with a shortage). |
| 5 | TOTAL_COST_FROM_LOC |  |  |  | NUMERIC (20,4) | Calculated by summing the cost times the over_short, i.e. (unit_cost * (qty_received - qty_expected)), for all shipsku records where the qty_received is not equal to the qty_expected within this shipment/carton combination. This number may be positive, negative, |
| 6 | TOTAL_COST_PRIMARY |  |  |  | NUMERIC (20,4) | Conversion of total_cost_from_loc into the primary currency. |
| 7 | TOTAL_COST_LOCAL |  |  |  | NUMERIC (20,4) | Conversion of total_cost_from_loc into the currency of the receiving location (local currency). |
| 8 | TOTAL_RETAIL_FROM_LOC |  |  |  | NUMERIC (20,4) | Calculated by summing the retail times the over_short, i.e. (unit_retail * (qty_received - qty_expected)), for all shipsku records where the qty_received is not equal to the qty_expected within this shipment/carton combination. This number may be positive, negative, or zero (if there are shipsku records with an overage and shipsku records with a shortage). This value is in the sending location currency. |
| 9 | TOTAL_RETAIL_PRIMARY |  |  |  | NUMERIC (20,4) | Conversion of total_retail_from_loc into the primary currency. |
| 10 | TOTAL_RETAIL_LOCAL |  |  |  | NUMERIC (20,4) | Conversion of total_retail_from_loc into the currency of the receiving location (local currency). |
| 11 | TAMPERED_IND |  |  |  | VARCHAR (1) | Indicates if the carton for this shipment/carton record has been tampered (tampered_ind = Y). |
| 12 | CARTON_OVER_SHORT_IND |  |  |  | NUMERIC (1) | Value indicating the existence of overage or shortage records within the shipment/carton: 1 if all item level records are overages -1 if all item level records are shortages 0 if both overage and shortage item level records exist |
| 13 | CARTON_UNRECEIVED_IND |  |  |  | VARCHAR (1) | If any of the shipsku line items for this carton have not been received then the carton_unreceived_ind is set to Y (N otherwise). |
| 14 | WRONG_STORE_IND |  |  |  | VARCHAR (1) | Indicates one or more items in the shipment or carton was received at wrong store. |

---

## Table: TIF_EXPLODE

**Description:** This table will reside in the RMS as part of the point of sale interface and will contain rows for each new item/site combination that has been affected by a tax change.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (10) | Unique numerical identifier |
| 2 | ITEM |  |  |  | VARCHAR (25) | Item number affected by the tax change, FK store.store |
| 3 | DEPT |  |  |  | NUMERIC (4) | Department number affected by the tax change. FK deps.dept |
| 4 | STORE |  | F | Y | NUMERIC (10) | Store for which the tax change is calculated. FK store.store |
| 5 | CURRENT_RATE_IND |  |  | Y | VARCHAR (1) | Indicates whether the current tax rate should be pulled for the item/store or dept/store combination |
| 6 | CHANGED_IND |  |  | Y | VARCHAR (1) | Indicates if tax change record was modified within batch processing window, which involves additional calculations. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TIF_EXPLODE|PK||||SEQ_NO|ASC|
|UK_TIF_EXPLODE|UK||||ITEM|ASC|
||||||STORE|ASC|
||||||DEPT|ASC|
||||||CURRENT_RATE_IND|ASC|
||||||CHANGED_IND|ASC|
|TIF_EXPLODE_I1|||||STORE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TIF_EXPLODE_CHANGED_IND|changed_ind IN ('Y', 'N')<br>|
||CHK_TIF_EXPLODE_CURR_RATE_IND|current_rate_ind IN ('Y', 'N')|






|Type|Column / Constraint Name|Details|
|---|---|---|
||||
|Column Level|CURRENT_RATE_IND||
||CHANGED_IND||

---

## Table: TRANSFERS_PUB_INFO

**Description:** This table helps in publication of the business transacation. It does this by tracking the state of the business transaction and holding any information that can be populated at the header level an used in detail level publication.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_NO | P |  | Y | NUMERIC (12) | This field contains the number that uniquely identifies the transfer within the system. |
| 2 | TSF_TYPE |  |  |  | VARCHAR (6) | This field identifies the type of the transfer. |
| 3 | INITIAL_APPROVAL_IND |  |  |  | VARCHAR (1) | Indicates whether or not the transaction has been initially approved. It is used by the detail level triggers (ADDTOQ) to determine if they should write records to the queue. |
| 4 | THREAD_NO |  |  |  | NUMERIC (6) | The thread on which the business transaction will be published. |
| 5 | PHYSICAL_FROM_LOC |  |  |  | NUMERIC (10) | Holds the physical_wh value for the value in the FROM_LOC field if FROM_LOC holds a wh. WIll be equal to FROM_LOC if FROM_LOC is a store |
| 6 | FROM_LOC |  |  |  | NUMERIC (10) | This field contains the location number of the transfer from location. This field will contain either a store or warehouse number based on the FROM_LOC_TYPE field. |
| 7 | FROM_LOC_TYPE |  |  |  | VARCHAR (1) | This field contains the location type of the transfer from location. |
| 8 | PHYSICAL_TO_LOC |  |  |  | NUMERIC (10) | Holds the physical_wh value for the value in the TO_LOC field if TO_LOC holds a wh. WIll be equal to TO_LOC if FROM_LOC is a store |
| 9 | TO_LOC |  |  |  | NUMERIC (10) | This field contains the location number of the transfer to location. This field will contain either a store or warehouse number based on the TO_LOC_TYPE field. |
| 10 | TO_LOC_TYPE |  |  |  | VARCHAR (1) | This field contains the location type of the transfer to location. |
| 11 | FREIGHT_CODE |  |  |  | VARCHAR (1) | The freight code associated with the transfer. |
| 12 | PUBLISHED |  |  |  | VARCHAR (1) | Indicates whether or not the transaction has had its initially published. |

---

## Table: TRANSPORTATION

**Description:** This table is used to store multiple details about a Transportation header record. These records are the basis for creating the Pro-Forma customs entry form that is sent to the broker. The system-generated primary key is necessary because at any given point of the transportation transaction one of the major columns (vessel_id, voyage_id, estimated departure date, order no, item, container, bl/awb or commercial invoice) may be null.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TRANSPORTATION_ID | P |  | Y | NUMERIC (10) | Contains the unique key, system generated by sequence number that will uniquely identify a single transportation transaction record. |
| 2 | VESSEL_ID |  |  |  | VARCHAR (20) | Contains vessel or other vehicle identification |
| 3 | VOYAGE_FLT_ID |  |  |  | VARCHAR (10) | Contains voyage or flight number. |
| 4 | ESTIMATED_DEPART_DATE |  |  |  | Date | Estimated date of departure for the goods leaving the port of lading. |
| 5 | ACTUAL_DEPART_DATE |  |  |  | Date | contains the actual depart date of the transportation |
| 6 | ORDER_NO |  | F |  | NUMERIC (12) | Contains the purchase order number from which the item was originated. |
| 7 | ITEM |  |  |  | VARCHAR (25) | Contains the item number. |
| 8 | BL_AWB_ID |  |  |  | VARCHAR (30) | Contains the Bill of Lading or Airway Bill number. This id will be generated by the agent that is shipping the goods. |
| 9 | CONTAINER_ID |  |  |  | VARCHAR (20) | Contains the id number of the container in which the item was shipped. |
| 10 | INVOICE_ID |  |  |  | VARCHAR (30) | Contains the invoice id associated with the purchase order or item. |
| 11 | INVOICE_DATE |  |  |  | Date | Contains the date that the invoice was issued. |
| 12 | SHIPMENT_NO |  |  |  | VARCHAR (20) | Contains the ASN# or shipment tracking number. |
| 13 | ACTUAL_ARRIVAL_DATE |  |  |  | Date | Actual arrival date of the goods to the discharge port. |
| 14 | DELIVERY_DATE |  |  |  | Date | Actual delivery date of the goods of the goods from the port. |
| 15 | STATUS |  |  |  | VARCHAR (6) | Contains the status of the detail record. Valid values are Booked, Delivered, Loaded and Sailed. |
| 16 | TRAN_MODE_ID |  |  |  | VARCHAR (6) | Contains a customs defined Transportation mode. Valid values are: 10 - Vessel, Non-container 11 - Vessel, Container 12 - Border Water-borne (Only - Mexico and Canada) 20 - Rail, Non-container 21 - Rail, Container 30 - Truck, Non-container 31 - Truck, Container 32 - Auto 33 - Pedestrian 34 - Road, other, Includes foot and animal borne 40 - Air, Non-container 41 - Air, Container 50 - Mail 60 - Passenger, hand-carried 70 - Fixed Tran Installation 80 - Not used at this time. |
| 17 | VESSEL_SCAC_CODE |  | F |  | VARCHAR (6) | Contains the Vessels Standard Carrier Alpha Code as established by Customs. Each vessel will have a unique scac code. |
| 18 | CONTAINER_SCAC_CODE |  | F |  | VARCHAR (6) | Contains the Containers Standard Carrier Alpha Code as established by Customs. Each container will have a unique SCAC code. |
| 19 | SEAL_ID |  |  |  | VARCHAR (15) | Contains the id number of the tag used to physically seal a container before placement on a vessel. |
| 20 | FREIGHT_TYPE |  | F |  | VARCHAR (6) | Contains the method in which the goods are shipped. |
| 21 | FREIGHT_SIZE |  | F |  | VARCHAR (6) | Contains the size of the freight type used. |
| 22 | ORIGIN_COUNTRY_ID |  | F |  | VARCHAR (3) | Contains the id of the country where the goods originated. |
| 23 | CONSOLIDATION_COUNTRY_ID |  | F |  | VARCHAR (3) | Contains the id of the country where the goods were consolidated |
| 24 | EXPORT_COUNTRY_ID |  | F |  | VARCHAR (3) | Contains the id of the country where the goods were exported. |
| 25 | ESTIMATED_ARRIVAL_DATE |  |  |  | Date | Contains the estimated arrival date of the Tran detail record. |
| 26 | LADING_PORT |  |  |  | VARCHAR (5) | Contains the lading port id, which is the Customs port code identifying where the goods were loaded on a vessel. |
| 27 | DISCHARGE_PORT |  |  |  | VARCHAR (5) | Contains the discharge port id, which is the Customs port code identifying where the goods were unloaded from a vessel. |
| 28 | RECEIPT_ID |  |  |  | VARCHAR (30) | Contains the receipt identification that was assigned to these goods. |
| 29 | FCR_ID |  |  |  | VARCHAR (15) | Contains the Forwarders Cargo Receipt id. |
| 30 | FCR_DATE |  |  |  | Date | Contains the date the Forwarders Cargo Receipt was issued. |
| 31 | SERVICE_CONTRACT_NO |  |  |  | VARCHAR (15) | Contains the Service Contract number for the negotiated freight rates. |
| 32 | IN_TRANSIT_NO |  |  |  | VARCHAR (15) | Contains the In Transit number for shipments cleared at inland locations, or other than Discharge Port. |
| 33 | IN_TRANSIT_DATE |  |  |  | Date | Contains the date the In Transit number was issued. |
| 34 | LOT_NO |  |  |  | VARCHAR (15) | Contains the Lot number of the fabric or material which is used to maintain item consistency for deliveries. |
| 35 | INVOICE_AMT |  |  |  | NUMERIC (20,4) | Contains the value of the invoice. The currency code for this value is stored in this record in the Currency Code column. |
| 36 | CURRENCY_CODE |  |  |  | VARCHAR (3) | The currency that values are stored in the Tran module for this header record. |
| 37 | EXCHANGE_RATE |  |  |  | NUMERIC (20,10) | The rate of exchange for the given currency code against the primary currency |
| 38 | CARTON_QTY |  |  |  | NUMERIC (12,4) | Contains the number of cartons for this order/item combination. |
| 39 | CARTON_UOM |  | F |  | VARCHAR (4) | Contains the unit of measure that carton_qty is stored in. |
| 40 | ITEM_QTY |  |  |  | NUMERIC (12,4) | Contains the number of items for this order/item combination. |
| 41 | ITEM_QTY_UOM |  | F |  | VARCHAR (4) | Contains the unit of measure that item_qty is stored in. |
| 42 | GROSS_WT |  |  |  | NUMERIC (12,4) | Contains the gross weight for this order/item combination. |
| 43 | GROSS_WT_UOM |  | F |  | VARCHAR (4) | Contains the unit of measure that the gross weight is stored in. |
| 44 | NET_WT |  |  |  | NUMERIC (12,4) | Contains the net weight for this order/item combination. |
| 45 | NET_WT_UOM |  | F |  | VARCHAR (4) | Contains the unit of measure that the net weight is stored in. |
| 46 | CUBIC |  |  |  | NUMERIC (12,4) | Contains the cubic for this order/item combination. |
| 47 | CUBIC_UOM |  | F |  | VARCHAR (4) | Contains the unit of measure that the cubic is stored in. |
| 48 | PACKING_METHOD |  |  |  | VARCHAR (6) | Contains the shipment type of the record. Valid values are DESH Deconsolidated Shipment and DISH Direct Shipment. |
| 49 | RUSH_IND |  |  | Y | VARCHAR (1) | Contains a Rush value. This will identify goods for promotional or other purposes that need to be received as quickly as possible. Valid values are Yes and No. |
| 50 | CANDIDATE_IND |  |  | Y | VARCHAR (1) | This indicator will determine whether or not a Transporation record is to be considered for Customs Entry finalization. |
| 51 | COMMENTS |  |  |  | VARCHAR (2000) | Contains user comments. |
| 52 | SELECTED_IND |  |  |  | VARCHAR (1) | identifies row selected for update |
| 53 | TRANS_PARTNER_TYPE |  |  |  | VARCHAR (6) | Contains the partner type of the transportation partner id. |
| 54 | TRANS_PARTNER_ID |  |  |  | VARCHAR (10) | Contains the partner associated with the transportation. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TRANSPORTATION|PK||||TRANSPORTATION_ID|ASC|
|TRANSPORTATION_I4|||||ITEM|ASC|
|TRANSPORTATION_I11|||||GROSS_WT_UOM|ASC|
|TRANSPORTATION_I6|||||FREIGHT_TYPE|ASC|
|TRANSPORTATION_I10|||||ITEM_QTY_UOM|ASC|
|TRANSPORTATION_I7|||||ORDER_NO|ASC|
|TRANSPORTATION_I9|||||CARTON_UOM|ASC|
|TRANSPORTATION_I5|||||FREIGHT_SIZE|ASC|
|TRANSPORTATION_I3|||||EXPORT_COUNTRY_ID|ASC|
|TRANSPORTATION_I14|||||CUBIC_UOM|ASC|
|TRANSPORTATION_I12|||||NET_WT_UOM|ASC|
|TRANSPORTATION_I15|||||VESSEL_SCAC_CODE|ASC|
|TRANSPORTATION_I2|||||CONSOLIDATION_COUNTRY_ID|ASC|
|TRANSPORTATION_I1|||||ORIGIN_COUNTRY_ID|ASC|
|TRANSPORTATION_I16|||||CONTAINER_SCAC_CODE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TRANSPORTATION_CANDIDA_IND|candidate_ind in ('Y','N')<br>|
||CHK_TRANSPORTATION_CARTON_UOM|(CARTON_QTY is NOT NULL and CARTON_UOM is NOT NULL) or (CARTON_QTY is NULL and CARTON_UOM is NULL)<br>|
||CHK_TRANSPORTATION_CUBIC_UOM|(CUBIC is NOT NULL and CUBIC_UOM is NOT NULL) or (CUBIC is NULL and CUBIC_UOM is NULL)<br>|
||CHK_TRANSPORTATION_CURRENCY_CO|(INVOICE_AMT is NOT NULL and CURRENCY_CODE is NOT NULL) or (INVOICE_AMT is NULL and CURRENCY_CODE is NULL)<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_TRANSPORTATION_GROSS_WT_UO|(GROSS_WT is NOT NULL and GROSS_WT_UOM is NOT NULL) or (GROSS_WT is NULL and GROSS_WT_UOM is NULL)<br>|
||CHK_TRANSPORTATION_NET_WT_UOM|(NET_WT is NOT NULL and NET_WT_UOM is NOT NULL) or (NET_WT is NULL and NET_WT_UOM is NULL)<br>|
||CHK_TRANSPORTATION_RUSH_IND|rush_ind in ('Y','N')<br>|
||CHK_TRANSPORTATION_SELECTED_IN|SELECTED_IND in ('Y','N')<br>|
|Column Level|PACKING_METHOD||
||RUSH_IND||
||CANDIDATE_IND||
||SELECTED_IND||

---

## Table: TRANSPORTATION_SHIPMENT

**Description:** Holds the shipment related to a transportation.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SHIPMENT | P |  | Y | NUMERIC (12) | Holds the shipment number for the transportation. |
| 2 | VESSEL_ID | P |  | Y | VARCHAR (20) | Contains vessel or other vehicle identification. |
| 3 | VOYAGE_FLT_ID | P |  | Y | VARCHAR (10) | Contains voyage or flight number. |
| 4 | ESTIMATED_DEPART_DATE | P |  | Y | Date | Estimated date of departure for the goods leaving the port of lading. |
| 5 | ORDER_NO | P |  | Y | NUMERIC (12) | Contains the purchase order number from which the item was originated. |
| 6 | ASN |  |  |  | VARCHAR (30) | Contains the ASN number for the shipment. |

---

## Table: TRANS_CLAIMS

**Description:** This table is used to store claims information for Tran details. A single claim may span multiple cartons.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TRANSPORTATION_ID | P | F | Y | NUMERIC (10) | Contains the unique key that identifies the transportation record. |
| 2 | CLAIM_ID | P |  | Y | VARCHAR (30) | Contains the formal claim identification filed with the partner. |
| 3 | FROM_CARTON | P |  | Y | VARCHAR (8) | Contains the first carton in a series on which the damaged shipment was based. |
| 4 | TO_CARTON | P |  | Y | VARCHAR (8) | Contains the last carton in a series on which the damaged shipment was based. |
| 5 | CLAIM_DATE |  |  | Y | Date | Contains the date on which the claim was filed. |
| 6 | ITEM_QTY |  |  | Y | NUMERIC (12,4) | Contains the number of items that were reported in the formal claim. |
| 7 | ITEM_QTY_UOM |  | F | Y | VARCHAR (4) | This field contains the Unit of Measure that the Item Quantity field is stored in. |
| 8 | CLAIM_AGAINST_TYPE |  |  | Y | VARCHAR (6) | This column holds the partner type that the claim is logged against. |
| 9 | CLAIM_AGAINST_ID |  |  | Y | VARCHAR (10) | Contains the identification of the partner against which the claim was filed. This field can contain any partner or supplier. |
| 10 | CLAIM_AMOUNT |  |  | Y | NUMERIC (20,4) | Contains the amount the claim is for. This value will be stored in the Transportation currency held in the Transportation table. |
| 11 | DISCREPANCY_TYPE |  |  |  | VARCHAR (6) | Contains the user defined code which identifies the discrepancy. Valid values are O - Overage, S - Shortage. |
| 12 | DAMAGE_CODE |  |  |  | VARCHAR (6) | Contains the user defined code which identifies the damage to the items in the claim. Valid values are S - Spoilage, E External Damage, C - Concealed Damage. |
| 13 | COMMENTS |  |  |  | VARCHAR (2000) | Contains any comments about the claim. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TRANS_CLAIMS|PK||||TRANSPORTATION_ID|ASC|
||||||CLAIM_ID|ASC|
||||||FROM_CARTON|ASC|
||||||TO_CARTON|ASC|
|TRANS_CLAIMS_I1|||||ITEM_QTY_UOM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TRANS_CLAIMS_DISCREP_TYPE|DISCREPANCY_TYPE in ('O','S')<br>|
||CHK_TRANS_CLAIMS_DAMAGE_CODE|damage_code in ('S','E','C')<br>|
|Column Level|DISCREPANCY_TYPE||
||DAMAGE_CODE||

---

## Table: TRANS_DELIVERY

**Description:** This table is used to store delivery information at the destination level for a specific Transportation record.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TRANSPORTATION_ID | P | F | Y | NUMERIC (10) | Contains the unique key that identifies the Transportation record. |
| 2 | DELIVERY_LOCATION | P |  | Y | VARCHAR (10) | The location for the delivery. |
| 3 | DELIVERY_LOC_TYPE | P |  | Y | VARCHAR (6) | Contains the type of location that the shipment will be delivered to. Valid values are Store, Warehouse and DP Discharge Port. |
| 4 | ESTIMATED_DELIVERY_DATE | P |  | Y | Date | Estimated date on which the goods will be delivered |
| 5 | CARTON_QTY |  |  |  | NUMERIC (12,4) | Number of cartons for this delivery. |
| 6 | CARTON_QTY_UOM |  | F |  | VARCHAR (4) | Contains the unit of measure that the carton quantity is stored in. |
| 7 | ITEM_QTY |  |  |  | NUMERIC (12,4) | Quantity of items expected for this delivery. |
| 8 | ITEM_QTY_UOM |  | F |  | VARCHAR (4) | Contains the unit of measure that the item quantity is stored in. |
| 9 | VENDOR_ORDER_NO |  |  |  | VARCHAR (15) | Vendor purchase order number. |
| 10 | COMMENTS |  |  |  | VARCHAR (2000) | Comments. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TRANS_DELIVERY|PK||||TRANSPORTATION_ID|ASC|
||||||DELIVERY_LOCATION|ASC|






|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||DELIVERY_LOC_TYPE|ASC|
||||||ESTIMATED_DELIVERY_DATE|ASC|
|TRANS_DELIVERY_I2|||||ITEM_QTY_UOM|ASC|
|TRANS_DELIVERY_I1|||||CARTON_QTY_UOM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TRANS_DELIV_CARTON_QTY_UOM|(carton_qty is NULL AND carton_qty_uom is NULL) OR (carton_qty is NOT NULL AND carton_qty_uom is NOT NULL)<br>|
||CHK_TRANS_DELIV_DELIV_LOC_TYPE|delivery_loc_type in ('S','W','DP')<br>|
||CHK_TRANS_DELIV_ITEM_QTY_UOM|(item_qty is NULL AND item_qty_uom is NULL) OR (item_qty is NOT NULL AND item_qty_uom is NOT NULL)<br>|
|Column Level|DELIVERY_LOC_TYPE||

---

## Table: TRANS_LIC_VISA

**Description:** This table is used to store license and visa information for Transportation details.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TRANSPORTATION_ID | P | F | Y | NUMERIC (10) | Contains the unique key that identifies the tranistic_detail record. |
| 2 | IMPORT_COUNTRY_ID | P |  | Y | VARCHAR (3) | Contains the country that is importing the goods. |
| 3 | LICENSE_VISA_ID | P |  | Y | VARCHAR (30) | Contains the identification of the license or visa. |
| 4 | LICENSE_VISA_TYPE | P |  | Y | VARCHAR (6) | This field determines the whether the id in the license_visa_id column is a license or a visa. Valid values for this column are License or Visa. |
| 5 | LICENSE_VISA_QTY |  |  |  | NUMERIC (12,4) | Contains the number of units the license or visa applies to. |
| 6 | LICENSE_VISA_QTY_UOM |  | F |  | VARCHAR (4) | Contains the unit of measure that the license_visa_qty is stored in. |
| 7 | QUOTA_CAT |  |  |  | VARCHAR (6) | Contains the Customs Quota Category that the license or visa applies to. |
| 8 | NET_WEIGHT |  |  |  | NUMERIC (12,4) | Contains the Net/net Weight of the item. |
| 9 | NET_WEIGHT_UOM |  | F |  | VARCHAR (4) | Contains the unit of measure for the Net/net Weight of the item. |
| 10 | HOLDER_ID |  |  |  | VARCHAR (18) | Contains the holder of the License or Visa. |
| 11 | COMMENTS |  |  |  | VARCHAR (2000) | Contains the user comments. |

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TRANS_LIC_VISA_LIS_V_Q_UOM|(LICENSE_VISA_QTY is NOT NULL and LICENSE_VISA_QTY_UOM is NOT NULL) or (LICENSE_VISA_QTY is NULL and<br>LICENSE_VISA_QTY_UOM is NULL)<br>|
||CHK_TRANS_LIC_VISA_LIS_V_TYPE|LICENSE_VISA_TYPE in ('L','V')<br>|
|Column Level|LICENSE_VISA_TYPE||

---

## Table: TRANS_PACKING

**Description:** This table is used to store packing information at the destination level for a specific Transportation record.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TRANSPORTATION_ID | P | F | Y | NUMERIC (10) | Contains the unique key that identifies the Transportation record |
| 2 | FROM_CARTON | P |  | Y | VARCHAR (8) | Contains the first carton in the series of cartons that are being packed for this shipment. |
| 3 | TO_CARTON | P |  | Y | VARCHAR (8) | Contains the last carton in the series of cartons that are being packed for this shipment. |
| 4 | LOAD_POSITION |  |  |  | VARCHAR (6) | Contains the code of the location of the carton range within the container. Valid values are: M - Middle, N - Nose, R - Rear and T - Tail. |
| 5 | SAMPLE_CARTON_NO |  |  |  | VARCHAR (8) | Contains the identification of the carton that contains the sample item. |
| 6 | SAMPLE_POSITION |  |  |  | VARCHAR (6) | Contains the load position of the carton that contains the sample item. Valid values are: M - Middle, N - Nose, R - Rear and T - Tail. |
| 7 | CARTON_QTY |  |  |  | NUMERIC (20,4) | Contains the number of cartons received for this Tran record. |
| 8 | CARTON_QTY_UOM |  | F |  | VARCHAR (4) | Contains the Unit of Measure in which the carton quantity is stored. |
| 9 | CARTON_PACK_QTY_UOM |  | F |  | VARCHAR (4) | Contains the Unit of Measure in which the carton pack quantity is stored. |
| 10 | CARTON_REC_QTY_UOM |  | F |  | VARCHAR (4) | Contains the Unit of Measure in which the carton receive quantity is stored. |
| 11 | CARTON_PACK_REC_QTY_UOM |  | F |  | VARCHAR (4) | Contains the Unit of Measure in which the carton pack receive quantity is stored. |
| 12 | ITEM_QTY_UOM |  | F |  | VARCHAR (4) | Contains the Unit of Measure in which the item quantity is stored. |
| 13 | ITEM_REC_QTY_UOM |  | F |  | VARCHAR (4) | Contains the Unit of Measure in which the item receive quantity is stored. |
| 14 | CARTON_PACK_QTY |  |  |  | NUMERIC (20,4) | Contains the number of items received for this Tran record |
| 15 | ITEM_QTY |  |  |  | NUMERIC (20,4) | Contains the number of items for this carton range. |
| 16 | CARTON_RECEIVE_QTY |  |  |  | NUMERIC (20,4) | Contains the number of cartons received for this Tran record. |
| 17 | CARTON_PACK_REC_QTY |  |  |  | NUMERIC (20,4) | Contains the number of items received for this Tran record |
| 18 | ITEM_RECEIVE_QTY |  |  |  | NUMERIC (20,4) | Contains the number of items received for this Tran record. |
| 19 | COMMENTS |  |  |  | VARCHAR (2000) | Contains the user comments for the packing record. |

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TRANS_PACK_CARTON_PACK_REC|(carton_pack_rec_qty is NOT NULL and carton_pack_rec_qty_uom is NOT NULL) or carton_pack_rec_qty is NULL<br>|
||CHK_TRANS_PACK_CARTON_QTY|(carton_qty is NOT NULL and carton_qty_uom is NOT NULL) or carton_qty is NULL<br>|
||CHK_TRANS_PACK_CARTON_REC_QTY|(carton_receive_qty is NOT NULL and carton_rec_qty_uom is NOT NULL) or carton_receive_qty is NULL<br>|
||CHK_TRANS_PACK_ITEM_QTY|(item_qty is NOT NULL and item_qty_uom is NOT NULL) or item_qty is NULL<br>|
||CHK_TRANS_PACK_ITEM_REC_QTY|( item_receive_qty is NOT NULL and item_rec_qty_uom is NOT NULL) or item_receive_qty is NULL<br>|
||CHK_TRANS_PACK_LOAD_POSITION|LOAD_POSITION in ('M','N','R','T')<br>|
||CHK_TRANS_PACK_SAMPLE_POSITION|SAMPLE_POSITION IN ('M','N','R','T')|
||CHK_TRANS_PACK_CARTON_PACK_QTY|(carton_pack_qty IS NOT NULL AND carton_pack_qty_uom IS NOT NULL) OR carton_pack_qty IS NULL<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
|Column Level|LOAD_POSITION||
||SAMPLE_POSITION||

---

## Table: TRANS_SKU

**Description:** This table contains the component SKUs, color or sizes for the fashion style for the Transportation record.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TRANSPORTATION_ID | P | F | Y | NUMERIC (10) | Contains the unique key that identifies the transportation record. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (4) | Contains a sequence number which keeps the trans_sku record unique. |
| 3 | ITEM |  |  |  | VARCHAR (25) | Unique identifier for the item. |
| 4 | QUANTITY |  |  |  | NUMERIC (12,4) | Contains the quantity of the component items of the style on the Transportation record. |
| 5 | QUANTITY_UOM |  | F |  | VARCHAR (4) | Contains the unit of measure in which the component quantity is stored. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TRANS_SKU|PK||||TRANSPORTATION_ID|ASC|
||||||SEQ_NO|ASC|
|TRANS_SKU_I3|||||QUANTITY_UOM|ASC|
|TRANS_SKU_I1|||||ITEM|ASC|

---

## Table: TSFDETAIL

**Description:** This table holds the details of every transfer and contains one row for each transfer/SKU/prepack/inv_status combination held in the system. This information is held until the transfer is completed and has been held longer than the transfer history months from the system options table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_NO | P | F | Y | NUMERIC (12) | This field contains a number that uniquely identifies the transfer within the system. |
| 2 | TSF_SEQ_NO | P |  | Y | NUMERIC (8) | This field contains a sequence number when combined with the transfer number will make this row unique. This field is used to make up the primary key. A unique key is placed on the columns (tsf_no, sku, prepack_id, inv_status), which would normally make up the key, but because the fields prepack_id and inv_status can contain nulls, a sequence is used for the primary key and a unique key is placed on the other keys. |
| 3 | ITEM |  | F | Y | VARCHAR (25) | This field holds the unique alphanumeric value that identifies the item. |
| 4 | INV_STATUS |  | F |  | NUMERIC (2) | This field contains the inventory status, if one exists, for the transfer detail record. The inventory status field corresponds to the inventory status type found on the INV_STATUS_TYPES table. If a value exists in this field and the tsfhead.inventory_status is Unavailable, then the transfer will move from the specified unavailable inventory disposition (e.g. Trouble, etc.) at the from location to the same unavailable inventory disposition at the to location. |
| 5 | TSF_PRICE |  |  |  | NUMERIC (20,4) | This field holds the unit cost of the item that will be used for this specific transfer if being transferred at something other than current WAC. This field should only have a value for intercompany transfers. |
| 6 | TSF_QTY |  |  |  | NUMERIC (12,4) | This field contains the total quantity of the item reserved at the from location for this transfer. |
| 7 | FILL_QTY |  |  |  | NUMERIC (12,4) | This field contains the total amount of the item that has been filled for a PO-Linked transfer. |
| 8 | SHIP_QTY |  |  |  | NUMERIC (12,4) | This field contains the quantity of the item which has been shipped from the from location on the transfer. In-transit quantity is shipped quantity - received quantity. |
| 9 | RECEIVED_QTY |  |  |  | NUMERIC (12,4) | This field contains the quantity of the item which has been received at the to location on the transfer. In-transit quantity is shipped_qty - received_qty. |
| 10 | RECONCILED_QTY |  |  |  | NUMERIC (12,4) | This field contains the quantity of the item on the transfer that has been reconciled based on short or over receipt. |
| 11 | DISTRO_QTY |  |  |  | NUMERIC (12,4) | This field indicates the final quantity that the external system (e.g. RWMS) plans on filling. |
| 12 | SELECTED_QTY |  |  |  | NUMERIC (12,4) | This field contains the initial quantity that the external system (e.g. RWMS) plans on filling. |
| 13 | CANCELLED_QTY |  |  |  | NUMERIC (12,4) | This field contains the quantity of an item on the transfer that is left to be transferred at the time of cancellation of the line item. |
| 14 | SUPP_PACK_SIZE |  |  | Y | NUMERIC (12,4) | This field contains the supplier pack size for this transfer/item. |
| 15 | TSF_PO_LINK_NO |  |  |  | NUMERIC (12) | This field contains a reference number to link the item on the transfer to any purchase orders that have been created to allow the from location (i.e. warehouse) on the transfer to fulfill the transfer quantity to the to location (i.e store) on the transfer. |
| 16 | DEFAULT_CHRGS_2_LEG_IND |  |  |  | VARCHAR (1) | This field is an indicator to identify whether item up charges(if exist) should be defaulted to the 2nd-leg of the transfer. The valid values are Y, N and NULL. Its value is set on transfer detail form when applying item up charges to the 1st-leg. |
| 17 | MBR_PROCESSED_IND |  |  |  | VARCHAR (1) | This field contains the indicator that will mark the line item as processed for PO-Linked transfer types. When the transfer type is PO-Linked, the value of this indicator for all of the transfers line items will determine if the freight code can be updated from Hold. If all of the transfer line items have an mbr_processed_ind of Y, the transfers freight code can be updated from Hold. The updating of this indicator will occur from the Buyer Worksheet when the associated Buyer Worksheet line items are either added to a purchase order or deleted. For all other transfer types, the value of this column should be defaulted to NULL. |
| 18 | PUBLISH_IND |  |  | Y | VARCHAR (1) | This field specifies whether or not the detail record has been published by the transfers message family manager. Valid values are NULL (not published) or Y (published) |
| 19 | TSF_COST |  |  |  | NUMERIC (20,4) | This field holds the unit cost of the item that will be used for this specific transfer if current shipping locations WAC is not used. |
| 20 | RESTOCK_PCT |  |  |  | NUMERIC (12,4) | This field contains the percentage of cost charged by the supplier for re-stocking. This could be different than the restocking percentage held in TSFHEAD if the user decides to change the percentage at item level. |
| 21 | FINISHER_AV_RETAIL |  |  |  | NUMERIC (20,4) | This field is applicable to two-legged transfers and contains the weighted average retail of all the units of the transfer item currently at or in transit to the finisher. |
| 22 | FINISHER_UNITS |  |  |  | NUMERIC (12,4) | This field is applicable to two-legged transfers and contains the number of units of the transfer item currently at or in transit to the finisher. |
| 23 | UPDATED_BY_RMS_IND |  |  | Y | VARCHAR (1) | This column indicates if the last update to TSFDETAIL table is done by RMS or an external application. If by RMS, then the indicator will be set to Y and the update will be published to the RIB; otherwise, the indicator will be set to N and the update will NOT be published to the RIB, since the external application is already aware of the change. |
| 24 | CUST_ORD_TSF_UNIT_RETAIL |  |  |  | NUMERIC (20,4) | This will contain the unit retail of the customer order transfer from an external application. |
| 25 | CUST_ORD_TSF_UNIT_RETAIL_CURR |  |  |  | VARCHAR (3) | This will contain the currency code of the customer order transfer unit retail value. |
| 26 | CUST_ORD_TSF_TOTAL_RETAIL |  |  |  | NUMERIC (20,4) | This will contain the total retail of the item on the customer order transfer from an external application. Total retail may differ from unit retail * transfer quantity depending on applicable customer order specific discounts. |
| 27 | CUST_ORD_TSF_TOTAL_RETAIL_CURR |  |  |  | VARCHAR (3) | This will contain the currency code of the customer order transfer total retail value. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TSFDETAIL|PK||||TSF_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||TSF_SEQ_NO|ASC|
|TSFDETAIL_I2|||||ITEM|ASC|
|TSFDETAIL_I1|||||INV_STATUS|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TSFDETAIL_DEFLT_CHGS_2_LEG|DEFAULT_CHRGS_2_LEG_IND IN ('Y','N',null)<br>|
||CHK_TSFDETAIL_MBR_PROC_IND|(MBR_PROCESSED_IND IN ('Y','N')) OR (MBR_PROCESSED_IND IS NULL)<br>|
||CHK_TSFDETAIL_UPDATED_RMS_IND|updated_by_rms_ind in ('Y','N')|
|Column Level|DEFAULT_CHRGS_2_LEG_IND||
||MBR_PROCESSED_IND||
||UPDATED_BY_RMS_IND||

---

## Table: TSFDETAIL_CHRG

**Description:** This table holds Up Charge components and their associated information for a given transfer/from location/to location/item combination. These Up Charges are incurred when transferring the items between the from and the to locations.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_NO |  |  | Y | NUMERIC (12) | This field contains a number that uniquely identifies the transfer within the system. |
| 2 | TSF_SEQ_NO |  |  | Y | NUMERIC (8) | This field contains a sequence number when combined with the transfer number references a unique record on the transfer detail table. |
| 3 | SHIPMENT |  |  |  | NUMERIC (12) | This field contains the shipment number for the associated transfer. The field will only contain a value if the transfer is an Externally Generated transfer (i.e. the Transfer Type is EG). |
| 4 | SHIP_SEQ_NO |  |  |  | NUMERIC (10) | This field contains the sequence number used along with the Shipment number and Item to make the Shipment Item records unique. There can be multiple Transfers [Distros], Inventory Statuses, or Cartons for the same Shipment/Item; the sequence number will refer back to a single unique Shipment/Item record if those values vary. The field will only contain a value if the transfer is an Externally Generated transfer (i.e. the Transfer Type is EG). |
| 5 | ITEM |  | F | Y | VARCHAR (25) | This field holds the unique alphanumeric value that identifies the item, or a component item of a pack that is on the transfer. |
| 6 | FROM_LOC |  |  | Y | NUMERIC (10) | This field contains the location number of the from location for the up charge associated with the transfer detail inventory flow. This field will contain either a store or virtual warehouse or external finisher number based on the FROM_LOC_TYPE field. |
| 7 | TO_LOC |  |  | Y | NUMERIC (10) | This field contains the location number of the to location for the up charge associated with the transfer detail inventory flow. This field will contain a store, virtual warehouse, internal finisher or external finisher based on the TO_LOC_TYPE field. |
| 8 | COMP_ID |  | F | Y | VARCHAR (10) | This field contains the unique identifier for the Up Charge component. |
| 9 | FROM_LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains the location type of the from location for the up charge associated with the transfer detail inventory flow. Valid values are Store, Warehouse (warehouse and internal finisher), External finisher (on PARTNER table). |
| 10 | TO_LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains the location type of the to location for the up charge associated with the transfer detail inventory flow. Valid values are Store, Warehouse (warehouse and internal finisher), External finisher (on PARTNER table). |
| 11 | PACK_ITEM |  | F |  | VARCHAR (25) | This field contains the unique identifier for a pack when one is on the transfer. |
| 12 | COMP_RATE |  |  | Y | NUMERIC (20,4) | This field contains the rate to be charged against the weighted average cost of the Item/To Location combinations within the department. The value in this field will be a percentage if the calculation basis is V (Value), and a monetary amount if the calculation basis is S (Specific). |
| 13 | PER_COUNT |  |  |  | NUMERIC (12,4) | This field contains a count indicating the amount of the Per Count Unit of Measure to which the rate applies. This column will only contain a value if the calculation basis is S (Specific). For example, when creating an Up Charge that is defined as $.20 for every 10 kilograms of an item transferred, the Per Count would be 10. |
| 14 | PER_COUNT_UOM |  | F |  | VARCHAR (4) | This field contains the unit of measure in which the Per Count is specified. This column will only contain a value if the calculation basis is |
| 15 | UP_CHRG_GROUP |  |  | Y | VARCHAR (6) | Contains the group to which the component ID belongs. Valid values can be found on the codes table with a code type of UCHG. |
| 16 | COMP_CURRENCY |  | F | Y | VARCHAR (3) | This field contains the currency code of the Up Charge component. |
| 17 | DISPLAY_ORDER |  |  | Y | NUMERIC (2) | This field contains the order in which the components should be displayed. A value of 0 (zero) indicates that the component will not be displayed in the form, but the assoicated value will be included in the calculations. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|UK_TSFDETAIL_CHRG|UK||||TSF_NO|ASC|
||||||TSF_SEQ_NO|ASC|
||||||SHIPMENT|ASC|
||||||SHIP_SEQ_NO|ASC|
||||||ITEM|ASC|
||||||FROM_LOC|ASC|
||||||TO_LOC|ASC|
||||||COMP_ID|ASC|
|TSFDETAIL_CHRG_I2|||||PER_COUNT_UOM|ASC|
|TSFDETAIL_CHRG_I3|||||COMP_CURRENCY|ASC|
|TSFDETAIL_CHRG_I5|||||PACK_ITEM|ASC|
|TSFDETAIL_CHRG_I1|||||COMP_ID|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|TSFDETAIL_CHRG_I6|||||TSF_NO|ASC|
||||||TSF_SEQ_NO|ASC|
||||||ITEM|ASC|
||||||PACK_ITEM|ASC|
||||||COMP_ID|ASC|
|TSFDETAIL_CHRG_I4|||||ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TSFDETAIL_CHRG_FRM_LOC_TYP|from_loc_type in ('S', 'W','E')<br>|
||CHK_TSFDETAIL_CHRG_TO_LOC_TYPE|to_loc_type in ('S', 'W','E')<br>|

---

## Table: TSFHEAD

**Description:** This table contains one row for each transfer that has been created in the system. This information is held until the transfer is completed and has been held longer than the transfer history monthsfrom the system options table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_NO | P |  | Y | NUMERIC (12) | This field contains a number that uniquely identifies the transfer within the system. |
| 2 | TSF_PARENT_NO |  | F |  | NUMERIC (12) | This number identifies the transfer at the level above the transfer. This value must exist as another row on TSFHEAD. This is only used for the transfer with finishing activity. |
| 3 | FROM_LOC_TYPE |  |  |  | VARCHAR (1) | This field contains the location type of the from location of the transfer. S - Store W - Warehouse (for warehouse and internal finishers) E - External Finisher (on PARTNER table) |
| 4 | FROM_LOC |  |  |  | NUMERIC (10) | This field contains the location number of the transfer from location. This field will contain a store, internal finisher, external finisher or warehouse number based upon the FROM_LOC_TYPE field. An internal finisher is a warehouse and an external finisher is a partner. |
| 5 | TO_LOC_TYPE |  |  |  | VARCHAR (1) | This field contains the location type of the to location of the transfer. Valid values are: S - Store W - Warehouse (for warehouse and internal finishers) E - External Finisher (on PARTNER table) |
| 6 | TO_LOC |  |  |  | NUMERIC (10) | This field contains the location number of the transfer to location. This field will contain a store, internal finisher, external finisher or warehouse number based upon the TO_LOC_TYPE field. An internal finisher is a warehouse and an external finisher is a partner. |
| 7 | EXP_DC_DATE |  |  |  | Date | This field is communicated to a WMS. It is the date that the transfer is expected to be shipped a the warehouse. |
| 8 | DEPT |  | F |  | NUMERIC (4) | This field contains the department number associated with the transfer. This field will only be populated if transfers are created at a department level based on the system options field dept_level_transfers. It is only applicable to transfers created in RMS and via replenishment, not transfers created or modified by SIM, RWMS, AIP, or other external |
| 9 | INVENTORY_TYPE |  |  | Y | VARCHAR (6) | This column will indicate whether the transfer is for Available inventory or Unavailable inventory. Merchandise will be received into the same inventory status as it was transferred out of. A specific transfer can only contain available or unavailable merchandise, never a combination of both. |
| 10 | TSF_TYPE |  |  | Y | VARCHAR (6) | This field identifies the type or reason for the transfer. Valid values are: SR - Store Requisition, CO - Customer Order, RV - RTV, CF - Confirmation, AD - Administrative, MR - Manual Requisition, PL - PO-Linked Transfer, BT - Book Transfer, EG - Externally Generated, IC - Intercompany, RAC - Reallocation, AIP - AIP Generated, SIM - SIM Generated, FO - Franchise Order, FR - Franchise Return, SG - System Generated |
| 11 | STATUS |  |  | Y | VARCHAR (1) | This field contains the status of the transfer. Valid values are: I - Input, B - Submitted, A - Approved, S - Shipped, C - Closed, D - Deleted (will be deleted during batch), X - Transfer is being externally closed, P - Picked, L - Selected. Note: Statuses of B and A are reserved stock. X is a dummy status that is only used in integration processing and should never actually get saved to the table. |
| 12 | FREIGHT_CODE |  |  | Y | VARCHAR (1) | This field will be used to determine the priority for this trnasfer. Valid values for this field are: N - Normal E - Expedite H - Hold |
| 13 | ROUTING_CODE |  |  |  | VARCHAR (1) | This field will be used to indicate the type of freight to use on the transfer. Valid values are: 1 - 1 day expedite 2 - 2 day expedite 3 - 3 day expedite |
| 14 | CREATE_DATE |  |  | Y | Date | This field contains the date the transfer was created. |
| 15 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user ID of the user that created the transfer. |
| 16 | APPROVAL_DATE |  |  |  | Date | This field contains the date the transfer was approved. |
| 17 | APPROVAL_ID |  |  |  | VARCHAR (30) | This field contains the user ID of the user that approved the transfer. |
| 18 | DELIVERY_DATE |  |  |  | Date | Indicates the earliest date that the transfer can be delivered to the store. |
| 19 | CLOSE_DATE |  |  |  | Date | This field contains the date the transfer was closed. |
| 20 | EXT_REF_NO |  |  |  | VARCHAR (14) | This field contains audit trail reference to external system when an external transaction initiates master record creation in the Oracle Retail system. |
| 21 | REPL_TSF_APPROVE_IND |  |  | Y | VARCHAR (1) | This field contains the indicator used to determine if the transfer should be approved during the replenishment process. All replenishment transfers are initially created in Submitted status and then flipped to Approved status, if necessary, by another process. This 2 step status setting is required to support the integration strategy with the Integration Bus. |
| 22 | COMMENT_DESC |  |  |  | VARCHAR (2000) | This field contains any miscellaneous comments associated with the transfer entered by the user. |
| 23 | EXP_DC_EOW_DATE |  |  |  | Date | This column holds the eow_date for the exp_dc_date column. It is used for OTB extracts for Intercompany transfers. |
| 24 | MRT_NO |  | F |  | NUMERIC (10) | This field holds the Mass Return Transfer Number with with this transfer is associated. This is the primary key for the table MRT. |
| 25 | NOT_AFTER_DATE |  |  |  | Date | This field holds the last day upon which a store can ship the requested merchandise to the warehouse. |
| 26 | CONTEXT_TYPE |  |  |  | VARCHAR (6) | This field holds the reason code related to which a transfer is made. Valid values are: Promotion, Customer Transfer, Store Requisition and Repairing. Two-legged transfer can not be created for context types Promotion, Customer Transfer and Store Requisition. For the context type Repairing only external finisher can be selected. |
| 27 | CONTEXT_VALUE |  |  |  | VARCHAR (25) | This field holds value relating to the context type, for example Promotion Number. |
| 28 | RESTOCK_PCT |  |  |  | NUMERIC (12,4) | This field holds the percentage of cost charged by the receiving location for re-stocking. |
| 29 | WF_NEED_DATE |  |  |  | Date | This field contains the need date of franchise Order. This column is populated only for Franchise Order transfers. |
| 30 | DELIVERY_SLOT_ID |  | F |  | VARCHAR (15) | Indicates the delivery slot that will be used for the transfer. Valid delivery slots are defined on DELIVERY_SLOT |
| 31 | ORDER_NO |  |  |  | NUMERIC (12) | This will contain the import order number for which the intercompany book transfer was created for POs created using an Importer. |
| 32 | WF_ORDER_NO |  | F | Y | NUMERIC (10) | This field holds the franchise order number this transfer is linked to. |
| 33 | RMA_NO |  | F | Y | NUMERIC (10) | This field holds the franchise return number this transfer is linked to. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TSFHEAD|PK||||TSF_NO|ASC|
|TSFHEAD_I7|||||REPL_TSF_APPROVE_IND|ASC|
|TSFHEAD_I10|||||DELIVERY_SLOT_ID|ASC|
|TSFHEAD_I3|||||ORDER_NO|ASC|
||||||TSF_TYPE|ASC|
|TSFHEAD_I9|||||EXT_REF_NO|ASC|
||||||STATUS|ASC|
|TSFHEAD_I2|||||TSF_PARENT_NO|ASC|
|TSFHEAD_I5|||||FROM_LOC|ASC|
|TSFHEAD_I6|||||MRT_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|TSFHEAD_I8|||||TO_LOC|ASC|
||||||DELIVERY_DATE|ASC|
||||||TSF_TYPE|ASC|
||||||STATUS|ASC|
|TSFHEAD_I1|||||DEPT|ASC|
|TSFHEAD_I12|||||RMA_NO|ASC|
|TSFHEAD_I11|||||WF_ORDER_NO|ASC|
|TSFHEAD_I13|||||ORDER_NO|ASC|
||||||TSF_TYPE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TSFHEAD_FREIGHT_CODE|FREIGHT_CODE IN ('N','E','H')<br>|
||CHK_TSFHEAD_FROM_LOC_TYPE|FROM_LOC_TYPE IN ('S','W','E')<br>|
||CHK_TSFHEAD_REPL_TSF_APPRV_IND|REPL_TSF_APPROVE_IND in ('Y','N')<br>|
||CHK_TSFHEAD_STATUS|STATUS IN ('I','A','S','C','D','X','B','P','L')<br>|
||CHK_TSFHEAD_TO_LOC_TYPE|TO_LOC_TYPE IN ('S','W','E')<br>|
||CHK_TSFHEAD_TSF_PARENT_NO|(TSF_PARENT_NO IS NULL AND FROM_LOC IS NOT NULL AND FROM_LOC_TYPE IS NOT NULL) OR (TSF_PARENT_NO IS NOT NULL)<br>|
||CHK_TSFHEAD_TSF_TYPE|TSF_TYPE IN ('SR','CO','RV','CF','AD','MR','PL','BT','EG','IC','RAC','AIP', 'SIM','FO','FR', 'ICB','SG')|
|Column Level|TSF_TYPE||
||STATUS||






|Type|Column / Constraint Name|Details|
|---|---|---|
||FREIGHT_CODE||
||REPL_TSF_APPROVE_IND||

---

## Table: TSFHEAD_CFA_EXT

**Description:** This is the custom attribute extension table for the entity TSFHEAD.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_NO | P | F | Y | NUMERIC (12) | This column holds the Transfer Number this extended data is associated with. |
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
|PK_TSFHEAD_CFA_EXT|PK||||TSF_NO|ASC|
||||||GROUP_ID|ASC|

---

## Table: TSFHEAD_L10N_EXT

**Description:** This is the Localization Felxible Attribute Solution (LFAS) storage table for the entity TSFHEAD

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_NO | P | F | Y | NUMERIC (12) | This field contains the number that uniquely identifies the transfer within the system. |
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
| 13 | VARCHAR2_10 |  |  |  | VARCHAR (250) | This column holds data related to the attribute defined on the L10N_ATTRIB table that references VARCHAR2_10 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
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
|PK_TSFHEAD_L10N_EXT|PK||||TSF_NO|ASC|
||||||L10N_COUNTRY_ID|ASC|
||||||GROUP_ID|ASC|

---

## Table: TSFITEM_INV_FLOW

**Description:** This table will hold the details of how the line item on a transfer was distributed amongst virtual warehouses in the physical warehouse sent as the from and/or to location for externally generated transfers.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_NO | P |  | Y | NUMERIC (12) | This field contains a number that uniquely identifies the transfer within the system. |
| 2 | TSF_SEQ_NO | P |  | Y | NUMERIC (10) | This field contains the sequence number used along with the Transfer number and Item to make the Transfer Item records unique. |
| 3 | ITEM | P |  | Y | VARCHAR (25) | This field contains the unique alphanumeric value identifying the item that is being transferred. |
| 4 | FROM_LOC | P |  | Y | NUMERIC (10) | This field contains the location number of the from location for the transfer detail inventory flow. This field will contain either a store or virtual warehouse number based on the FROM_LOC_TYPE field. |
| 5 | TO_LOC | P |  | Y | NUMERIC (10) | This field contains the location number of the to location for the transfer detail inventory flow. This field will contain either a store or virtual warehouse number based on the TO_LOC_TYPE field. |
| 6 | FROM_LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains the location type of the from location for the transfer detail inventory flow. Valid values are Store and Warehouse. |
| 7 | TO_LOC_TYPE |  |  | Y | VARCHAR (1) | This field contains the location type of the to location for the transfer detail inventory flow. Valid values are Store and Warehouse. |
| 8 | TSF_QTY |  |  | Y | NUMERIC (12,4) | This field contains the transfer quantity allocated to the from and to locations. |
| 9 | SHIPPED_QTY |  |  |  | NUMERIC (12,4) | This field contains the shipped quantity allocated to the from and to locations. |
| 10 | DIST_PCT |  |  | Y | NUMERIC (12,4) | This field contains the percentage of the overall transfer quantity that was associated with the to location/from location combination. |

---

## Table: TSFZONE

**Description:** The table holds all of the transfer zones created within the company. Transfer zones are used to restrict transfers from store to store to a specified group of stores (zone). Zones are enforced if defined and added to the store table. Inter-store transfers can only be created for stores in the same transfer zone.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TRANSFER_ZONE | P |  | Y | NUMERIC (4) | This field contains the number which uniquely identifies the transfer zone. |
| 2 | DESCRIPTION |  |  | Y | VARCHAR (120) | This field contains the name of the transfer zone. |
| 3 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TSFZONE|PK||||TRANSFER_ZONE|ASC|

---

## Table: TSFZONE_TL

**Description:** This is the translation table for TSFZONE table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG |  | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | TRANSFER_ZONE |  | F | Y | NUMERIC (4) | This field contains the number which uniquely identifies the transfer zone. |
| 3 | DESCRIPTION |  |  | Y | VARCHAR (120) | This field contains the name of the transfer zone. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TSFZONE_TL|UK||||LANG|ASC|
||||||TRANSFER_ZONE|ASC|

---

## Table: TSF_ENTITY

**Description:** This table holds all the transfer entities created within the company. A transfer entity is a group of locations that are a part of single legal entity and share same accounting set of books. A business can have multiple smaller legally independent companies within a large parent company and these smaller companies are set up as legal entities. If a business does not want to use mutiple transfer entities, one transfer entity will be created and all the locations will be grouped into this. Transfers between legal entities are called intercompany transfers.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_ENTITY_ID | P |  | Y | NUMERIC (10) | This field contains the number which uniquely identifies the transfer entity. |
| 2 | TSF_ENTITY_DESC |  |  | Y | VARCHAR (120) | This field contains the name of the transfer entity. |
| 3 | SECONDARY_DESC |  |  |  | VARCHAR (120) | This column contains the secondary description of the transfer entity. |
| 4 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TSF_ENTITY|PK||||TSF_ENTITY_ID|ASC|

---

## Table: TSF_ENTITY_L10N_EXT

**Description:** This is the Localization Felxible Attribute Solution (LFAS) storage table for the transfer entity.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_ENTITY_ID | P | F | Y | NUMERIC (10) | Contains the number which uniquely identifies the transfer entity. |
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
|PK_TSF_ENTITY_L10N_EXT|PK||||TSF_ENTITY_ID|ASC|
||||||L10N_COUNTRY_ID|ASC|
||||||GROUP_ID|ASC|

---

## Table: TSF_ENTITY_ORG_UNIT_SOB

**Description:** This table holds the mapping of Transfer Entity, Org Unit ID and Set Of Book ID with each other. One Set of Books can be shared among multiple Transfer Entities and Org Units . However, each Transfer Entity and Org Unit can be uniquely associated with one Set of Book . One Transfer Entity can have multiple Org Units associated but each Org Unit can be associated uniquely with only one Transfer Entity .

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_ENTITY_ID | P | F | Y | NUMERIC (10) | This field contains the number which uniquely identifies a transfer entity. |
| 2 | ORG_UNIT_ID | P | F | Y | NUMERIC (15) | This field contains the number which uniquely identifies a org unit. |
| 3 | SET_OF_BOOKS_ID |  | F | Y | NUMERIC (15) | This field contains the number which uniquely identifies a set of books. One set of books can be shared among multiple transfer entities and org units however each transfer entity and org unit can be associated with only one set of books. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TSF_ENTITY_ORG_UNIT_SOB|PK||||TSF_ENTITY_ID|ASC|
||||||ORG_UNIT_ID|ASC|
|TSF_ENTITY_ORG_UNIT_SOB_I1|||||SET_OF_BOOKS_ID|ASC|
|TSF_ENTITY_ORG_UNIT_SOB_I2|||||ORG_UNIT_ID|ASC|

---

## Table: TSF_ENTITY_TL

**Description:** This is the translation table for TSF_ENTITY table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | TSF_ENTITY_ID | P | F | Y | NUMERIC (10) | This field contains the number which uniquely identifies the transfer entity. |
| 3 | TSF_ENTITY_DESC |  |  | Y | VARCHAR (120) | This field contains the name of the transfer entity. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TSF_ENTITY_TL|PK||||LANG|ASC|
||||||TSF_ENTITY_ID|ASC|

---

## Table: TSF_ITEM_COST

**Description:** This table holds the average transfer price, transfer quantity, and shipped quantity for items on the transfer. This table is populated for 2-legged transfers (could be either inter- or intra-company) and single-legged inter-company transfers (LEG_IND = S).

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_ITEM_COST_ID | P |  | Y | NUMERIC (15) | This is a system generated identifier, used as primary key for this table. |
| 2 | TSF_NO |  | F | Y | NUMERIC (12) | This field holds a valid transfer number on the transfer head uniquely identifying the transfer. For 2-legged transfer, this could be either the first leg or the second leg of the transfer. |
| 3 | ITEM |  |  | Y | VARCHAR (25) | This field contains the unique alphanumeric value identifying the item that is being transferred. In case of 2-legged transfers this will contain the item being transferred that particular leg of the transfer. For example, Item 1 can be trasformed to Item 2 in the 2nd leg of a 2-legged transfer. |
| 4 | TSF_PARENT_NO |  | F |  | NUMERIC (12) | This field holds the parent transfer number holding the different legs of the transfer and populated only for the second leg of a 2-legged transfer. |
| 5 | TSF_QTY |  |  | Y | NUMERIC (12,4) | This field contains the total quantity of the item on the transfer. |
| 6 | TSF_AVG_PRICE |  |  |  | NUMERIC (20,4) | This field holds the average transfer price of the item held in the ITEM column, i.e. if the ITEM is on first leg, this is the average transfer price of the first leg item. For second leg of a 2-legged transfer or single-legged transfers, this will be in the currency of the final receiving location and for For first leg of a 2-legged transfer, it will be in the currency of the initial sending location. |
| 7 | SHIPPED_QTY |  |  |  | NUMERIC (12,4) | This field holds the total quantity of the item (held in ITEM column) that has been shipped. It is populated for the inter-company leg of the transfer, i.e. when crossing transfer entity, or ICT_LEG_IND = Y or single-legged (inter-company) transfer only. |
| 8 | XFORM_TO_ITEM |  | F |  | VARCHAR (25) | This field contains the unique alphanumeric value identifying the item. This holds the transformed item if item in ITEM column is on the first leg of a 2-legged transfer and is transformed, and will be the item on the 2nd leg of transfer. This column is populated only for the first leg of the two-legged transfers. |
| 9 | LEG_IND |  |  | Y | VARCHAR (1) | This field specifies that the particular transfer is which leg of a 2-legged transfer or a single-legged transfer. Valid values are 1,2 and S.1= first leg of a 2-legged transfer, 2=second leg of a 2-legged transfer, S=single-legged transfer. |
| 10 | ICT_LEG_IND |  |  |  | VARCHAR (1) | This field specifies which leg for 2-legged inter-company transfer is inter-company transfer and which one is intra-company. Possible values are Y, N and Null. Since in the case of 2-legged inter-company transfers, the finisher has to be part of the same transfer entity as one of the two locations, one leg of the transfer will be a inter-company transfer and other leg will be intra-compnay transfer. A Y value means this leg is the inter-company leg of a 2-legged inter-company transfer. A N value means this leg is the intra-company leg of a 2-legged inter-company transfer. NULL means single-legged transfer or intra-company 2-legged transfer. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TSF_ITEM_COST|PK||||TSF_ITEM_COST_ID|ASC|
|TSF_ITEM_COST_I1|UN||||TSF_NO|ASC|
||||||ITEM|ASC|
|TSF_ITEM_COST_I2|||||XFORM_TO_ITEM|ASC|
|TSF_ITEM_COST_I3|||||TSF_PARENT_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TSF_ITEM_COST_ICT_LEG_IND|ICT_LEG_IND IN ('Y','N')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_TSF_ITEM_COST_LEG_IND|LEG_IND IN ('1','2','S')<br>|
|Column Level|LEG_IND||

---

## Table: TSF_ITEM_WO_COST

**Description:** This is a child table of TSF_ITEM_COST. It contains a record for each work order activity that is applied to the item, the quantity of the item the activity is applied to, and the average cost of the activity.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_ITEM_COST_ID | P | F | Y | NUMERIC (15) | This is a foreign key that ties the table to tsf_item_cost. |
| 2 | ACTIVITY_ID | P | F | Y | NUMERIC (10) | This field contains a unique ID for work order activity defined in the wo_activity table. It identifies a finishing activity which is to be carried on to an item. Multiple activity IDs can be applied to a single item. Transfers |
| 3 | AVG_UNIT_COST |  |  | Y | NUMERIC (20,4) | This field contains the average unit cost of the activity. This will be calculated based on the TSF_WO_DETAIL.UNIT_COST for bulk items and the prorated TSF_WO_DETAIL.UNIT_COST for components of pack items. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TSF_ITEM_WO_COST|PK||||TSF_ITEM_COST_ID|ASC|
||||||ACTIVITY_ID|ASC|
|TSF_ITEM_WO_COST_I1|||||ACTIVITY_ID|ASC|

---

## Table: TSF_MFQUEUE

**Description:** This table holds the transfer transactions which are on the queue where integration messages await publication via the RIB.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | This field holds the sequence in which the records was placed in this table . It is used to order the publication of messages to the RIB. |
| 2 | TSF_NO |  |  |  | NUMERIC (12) | This field contains the unique number identifiying the transfer. |
| 3 | ITEM |  |  |  | VARCHAR (25) | This field contains unique alphanumeric identifier for the item on the transfer. |
| 4 | MESSAGE_TYPE |  |  |  | VARCHAR (15) | This field describes the action in RMS that is causing the message to be published to the RIB. |
| 5 | THREAD_NO |  |  |  | NUMERIC (4) | This field contains the thread on which the business transaction will be published. Each business object has one and only one thread number. |
| 6 | FAMILY |  |  |  | VARCHAR (30) | This field indicates the functional area that this transaction belongs to. |
| 7 | CUSTOM_MESSAGE_TYPE |  |  |  | VARCHAR (1) | This field is not used by RMS. |
| 8 | PUB_STATUS |  |  |  | VARCHAR (1) | This field contains the publication status of the transaction. It is set to Unpublished upon insertion into the table and set to Hospital when an non-fatal error is encountered during the publication process. |
| 9 | TRANSACTION_NUMBER |  |  |  | NUMERIC (12) | This field contains the unique number identifiying the transfer. |
| 10 | TRANSACTION_TIME_STAMP |  |  |  | Date | This field contains the time of record creation. |

---

## Table: TSF_PACKING

**Description:** This table contains the header packing mapping information. This table groups the packing instructions of TSF_PACK_DETAIL into the logical From and Resultant items.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_PACKING_ID | P |  | Y | NUMERIC (10) | This field contains the key uniquely identifying each row on the table. This key is generated by the TSF_PACKING_ID_SEQ database sequence and is not editable by the user. |
| 2 | TSF_NO |  |  | Y | NUMERIC (12) | This field contains the unique number identifying the transfer the packing is associated with. |
| 3 | SET_NO |  |  | Y | NUMERIC (10) | This field contains a number that is used to identify to grouping of the From and Resultant items within the packing instructions. This and the TSF_NO are the unique key for this table. |
| 4 | PUBLISH_IND |  |  | Y | VARCHAR (1) | This field specifies whether or not the set has been published by the woout message family manager. Valid values are N (not published) or Y (published) |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TSF_PACKING|PK||||TSF_PACKING_ID|ASC|
|UK_TSF_PACKING|UK||||TSF_NO|ASC|
||||||SET_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TSF_PACKING_PUBLISH_IND|PUBLISH_IND IN ('Y','N')<br>|
|Column Level|PUBLISH_IND||

---

## Table: TSF_PACKING_DETAIL

**Description:** This table contains packing mapping information. Two types of packing can occur: (1) a pack is exploded to its components, (2) pack(s) and/or bulk item(s) can be combined to form a new pack. The TSF_PACKING_DETAIL table contains the set of From and Resultant items of a transformation. For example, Pack 1 (2A, 2B) is exploded into 2 A and 2 B. In this example Pack 1 would be a From item and items A and B are the Resultant Items. Another example is, of Pack 100 (2A) are combined with item B to create Pack 200 (2A, 1B). In this scenario, Pack 100 and item B are the From items and Pack 2 is the Resultant items. Finally, transformation may have occurred on one of the components before packing. Example, Pack 100 (2A) had its components transformed (Z). Then Pack 100 was combined with item B to create Pack 300 (2Z, 1B). In this scenario Pack 1 would still be a from item even though Pack 100 is technically not (2Z). Transformation information is stored on TSF_XFORM and TSF_XFORM_DETAIL. The From and Result items are grouped by a header record on TSF_PACKING

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_PACKING_DETAIL_ID | P |  | Y | NUMERIC (15) | This field contains the key uniquely identifying each row on the table. This key is generated by the TSF_PACKING_DETAIL_ID_SEQ database sequence and is not editable by the user. |
| 2 | TSF_PACKING_ID |  | F | Y | NUMERIC (10) | This field contains the key uniquely identifying the TSF_PACKING row that this detail record is associated with. |
| 3 | RECORD_TYPE |  |  | Y | VARCHAR (1) | This field determines if the item in the ITEM column is being used to create a pack (F - From) an item or a result of the pack creation process (R - Result). |
| 4 | ITEM |  | F | Y | VARCHAR (25) | This field either contains the item that will be used for packing or the item that is the result of the packing process. This column contains transaction-level items only. They can be packs. The RECORD_TYPE determines if this item used to create packs (F - From) or a result of the packing process (R - Result). |
| 5 | DIFF_ID |  | F |  | VARCHAR (10) | This field contains diff id for the from item (record type is F). |
| 6 | QTY |  |  | Y | NUMERIC (12,4) | This field contains the quantity of the item used to create the pack or as a result of the packing process. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TSF_PACKING_DETAIL|PK||||TSF_PACKING_DETAIL_ID|ASC|
|UK_TSF_PACKING_DETAIL|UK||||TSF_PACKING_ID|ASC|
||||||RECORD_TYPE|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||ITEM|ASC|
|TSF_PACKING_DETAIL_I1|||||DIFF_ID|ASC|
|TSF_PACKING_DETAIL_I2|||||ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TSF_PACKING_DTL_RECORD_TYP|RECORD_TYPE IN ('F','R')<br>|
|Column Level|RECORD_TYPE||

---

## Table: TSF_TO_PACK_TEMP

**Description:** This temporary table is used to store a destination pack and the quantity thereof that will be constructed as a result of packing activities performed by a finisher. Data on this table is never committed to the database.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_PACKING_ID |  | F | Y | NUMERIC (10) | This field references the tsf_packing_id on the tsf_packing table. It is used to identify which group of items that these packs will be created from. |
| 2 | ITEM |  |  | Y | VARCHAR (25) | This field contains the destination pack that will be constructed as a result of the packing activities. The field contains approved packs only. |
| 3 | QTY |  |  |  | NUMERIC (12,4) | This field contains the quantity of destination packs that will be constructed as a result of the packing activities. This field contains the quantity of approved packs only. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|TSF_TO_PACK_TEMP_I1|||||TSF_PACKING_ID|ASC|

---

## Table: TSF_TYPE

**Description:** This table contains different transfer types and whether or not Item Up Charges will default to Transfers of the given transfer type.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_TYPE | P |  | Y | VARCHAR (6) | This field contains the different transfer type codes. Valid values can be found on code details table under code type TR4E. |
| 2 | DEFAULT_CHRGS_IND |  |  | Y | VARCHAR (1) | This field indicates whether or not Item Up Charges will default to Transfers of the given transfer type. Valid values are Y or N. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TSF_TYPE|PK||||TSF_TYPE|ASC|

---

## Table: TSF_WO_DETAIL

**Description:** This table contains work order detail information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_WO_DETAIL_ID | P |  | Y | NUMERIC (20) | This field contains the key uniquely identifying each row on the table. This key is generated by the TSF_WO_DETAIL_ID_SEQ database sequence and is not editable by the user. |
| 2 | TSF_WO_ID |  | F | Y | NUMERIC (15) | This field contains the work order number under which the finishing activities will be performed. |
| 3 | ITEM |  | F | Y | VARCHAR (25) | This field contains the unique alphanumeric value identifying the item, the finishing activity will be performed upon. |
| 4 | ACTIVITY_ID |  | F |  | NUMERIC (10) | This field contains the finishing activity that will be performed upon the item. To support the interface behaviors in the transfer work order online module, this column has been specified as optional. However, transfers that pass through a finisher cannot be submitted or approved until each item on the transfer has been associated with at least one finishing activity. |
| 5 | UNIT_COST |  |  |  | NUMERIC (20,4) | This field contains the per-unit cost of the finishing activity. This field is held in the primary currency and may contain a value of zero. If the associated item is a pack, this value represents the cost for performing the finishing activity for the entire pack, not for each component therein. |
| 6 | COMMENTS |  |  |  | VARCHAR (2000) | This field contains any additional information associated with the item/finishing activity. |
| 7 | PUBLISH_IND |  |  | Y | VARCHAR (1) | This field specifies whether or not the detail record has been published by the work order out (WOOUT) message family manager. Valid values are N (not published) or Y (published) |
| 8 | INV_STATUS |  | F |  | NUMERIC (2) | This field contains the inventory status, if one exists, for the transfer detail record. The inventory status field corresponds to the inventory status type found on the INV_STATUS_TYPES table. |

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TSF_WO_DETAIL_PUBLISH_IND|PUBLISH_IND IN ('Y','N')<br>|
|Column Level|PUBLISH_IND||

---

## Table: TSF_WO_HEAD

**Description:** This table associates a work order with a transfer. Work orders allow finishing activities such as silk screening and ironing to be associated with items on a transfer. Only transfers that pass through a finisher before reaching the final location may be associated with work orders. Finishers may be internal (held as a virtual warehouse) or external (held as a stockholding partner).

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_WO_ID | P |  | Y | NUMERIC (15) | This field contains the work order number used to group finishing activities. This number is generated by the TSF_WO_ID_SEQ database sequence and is not editable by the user. |
| 2 | TSF_NO |  | F | Y | NUMERIC (12) | This field contains the identifier of the transfer during which the work order activities will be performed. For 2-legged transfers, this is the |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TSF_WO_HEAD|PK||||TSF_WO_ID|ASC|
|TSF_WO_HEAD_I1|||||TSF_NO|ASC|

---

## Table: TSF_XFORM

**Description:** This table contains the header item transformation mapping information. Item transformation is the activity where an item is transformed into another item by carrying out some activities. This table groups the item transformation details of tsf_xform_detail table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_XFORM_ID | P |  | Y | NUMERIC (10) | This field contains the numerical ID for each unique transformation. One transfer can be associated with multiple transformations. This is a primary key. |
| 2 | TSF_NO |  |  | Y | NUMERIC (12) | This field contains the unique number identifying the transfer, the item transformation is associated with. |

---

## Table: TSF_XFORM_DETAIL

**Description:** This table contains SKU level instructions for a transformation request.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_XFORM_DETAIL_ID | P |  | Y | NUMERIC (15) | This field contains the key uniquely identifying each row on the table. This key is generated by the TSF_XFORM_DETAIL_ID_SEQ database sequence and is not editable by the user. |
| 2 | TSF_XFORM_ID |  |  | Y | NUMERIC (10) | This field contains the key uniquely identifying the TSF_XFORM row that this detail record is associated with. |
| 3 | FROM_ITEM |  | F |  | VARCHAR (25) | This field contains the original item that was on the transfer. |
| 4 | FROM_QTY |  |  |  | NUMERIC (12,4) | This field contains the number of items to be transformed. |
| 5 | TO_ITEM |  | F |  | VARCHAR (25) | This field contains the item the original item will be transformed into |
| 6 | TO_QTY |  |  |  | NUMERIC (12,4) | This field contains the number of items in the final product. In this release, the FROM and TO qty will be the same qty of the FROM item that is on the transfer. The user has no control over either quantity. These were included for future upgradability when the user might want to be able to specify a FROM and/or TO quantity. |
| 7 | QTY_XFORMED |  |  |  | NUMERIC (12,4) | This column contains the quantity of the from _item that has been transformed into the to_item. |
| 8 | PUBLISH_IND |  |  | Y | VARCHAR (1) | This field specifies whether or not the detail record has been published by the woout message family manager. Valid values are N (not published) or Y (published) |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TSF_XFORM_DETAIL|PK||||TSF_XFORM_DETAIL_ID|ASC|
|TSF_XFORM_DETAIL_I1|UN||||TSF_XFORM_ID|ASC|
||||||FROM_ITEM|ASC|
||||||TO_ITEM|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|TSF_XFORM_DETAIL_I2|||||FROM_ITEM|ASC|
|TSF_XFORM_DETAIL_I3|||||TO_ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TSF_XFORM_DETAIL_PUBLISH|PUBLISH_IND IN ('Y','N')<br>|
|Column Level|PUBLISH_IND||

---

## Table: TSF_XFORM_DETAIL_TEMP

**Description:** This is a temporary table to hold the results of a transformation request

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_NO |  | F | Y | NUMERIC (12) | This field contains the foreign key to the transfer table |
| 2 | FROM_ITEM |  | F | Y | VARCHAR (25) | This field contains the item to be transformed. |
| 3 | FROM_QTY |  |  | Y | NUMERIC (12,4) | This field contains the number of items to be transformed. |
| 4 | TO_ITEM |  | F | Y | VARCHAR (25) | This field contains the item the original item will be transformed into |
| 5 | TO_QTY |  |  | Y | NUMERIC (12,4) | This field contains the number of items in the final product. In this release, the FROM and TO qty will be the same qty of the FROM item that is on the transfer. The user has no control over either quantity. These were included for future upgradability when the user might want to be able to specify a FROM and/or TO quantity. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|TSF_XFORM_DETAIL_TEMP_I1|||||TO_ITEM|ASC|
|TSF_XFORM_DETAIL_TEMP_I2|||||FROM_ITEM|ASC|
|TSF_XFORM_DETAIL_TEMP_I3|||||TSF_NO|ASC|

---

## Table: TSF_XFORM_REQUEST

**Description:** This is a temporary table, used by the Transformation form. Holds the from and to items the user requested for transformation.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_NO |  | F | Y | NUMERIC (12) | This field contains the foreign key to the transfer table |
| 2 | RECORD_TYPE |  |  | Y | VARCHAR (1) | This field specifies if this is a from or to item. |
| 3 | ITEM |  | F | Y | VARCHAR (25) | This field contains the item being processed. |
| 4 | DIFF_ID |  | F |  | VARCHAR (10) | This field contains the diff to be processed, if the user specified one. |
| 5 | QTY |  |  | Y | NUMERIC (12,4) | This field contains the quantity of the item to be processed. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|UK_TSF_XFORM_REQUEST|UK||||TSF_NO|ASC|
||||||RECORD_TYPE|ASC|
||||||ITEM|ASC|
||||||DIFF_ID|ASC|
|TSF_XFORM_REQUEST_I1|||||DIFF_ID|ASC|
|TSF_XFORM_REQUEST_I2|||||ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_TSF_XFORM_RQST_RECORD_TYPE|RECORD_TYPE IN ('F','R')<br>|
|Column Level|RECORD_TYPE||
