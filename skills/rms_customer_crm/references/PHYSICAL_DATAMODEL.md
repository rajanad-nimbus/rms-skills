# RMS Customer & CRM Datamodel - Physical Data Model Reference

## Table: CUSTOMER_SEGMENTS

**Description:** This new table will contain the customer segment id of a given customer segment type. These customer segments will be referenced and attached to customer segment promotions in RPM.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CUSTOMER_SEGMENT_ID | P |  | Y | NUMERIC (10) | The customer segment id of a given customer segment type, referenced and attached to promotions in RPM. They will be available in RPM promotion UI screen for customer segment promotions. |
| 2 | CUSTOMER_SEGMENT_DESC |  |  |  | VARCHAR (120) | The description of customer segment id. |
| 3 | CUSTOMER_SEGMENT_TYPE |  | F | Y | VARCHAR (6) | The customer segment type of a given customer segment, referenced and attached to promotions in RPM. They will be available in RPM promotion UI screen for customer segment promotions. For example: Electrician. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CUSTOMER_SEGMENTS|PK||||CUSTOMER_SEGMENT_ID|ASC|

---

## Table: CUSTOMER_SEGMENTS_TL

**Description:** This is the translation table for CUSTOMER_SEGMENTS table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | CUSTOMER_SEGMENT_ID | P | F | Y | NUMERIC (10) | The customer segment id of a given customer segment type, referenced and attached to promotions in RPM. They will be available in RPM promotion UI screen for customer segment promotions. |
| 3 | CUSTOMER_SEGMENT_DESC |  |  |  | VARCHAR (120) | The description of customer segment id. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CUSTOMER_SEGMENTS_TL|PK||||LANG|ASC|
||||||CUSTOMER_SEGMENT_ID|ASC|

---

## Table: CUSTOMER_SEGMENT_POS_STG

**Description:** This table records the changes for customer segement ids. A new record is entered whenever a customer segement is created or updated or deleted.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CUSTOMER_SEGMENT_ID |  |  |  | NUMERIC (10) | The customer segment id of a given customer segment type, referenced and attached to promotions in RPM. They will be available in RPM promotion UI screen for customer segment promotions. |
| 2 | CHANGE_TYPE |  |  |  | VARCHAR (3) | The action type on a given customer segment |

---

## Table: CUSTOMER_SEGMENT_TYPES

**Description:** This table will contain the customer segment types of a given customer segment. The customer segment types stored here will be referenced and attached to customer segment promotions in RPM.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CUSTOMER_SEGMENT_TYPE | P |  | Y | VARCHAR (6) | The customer segment type of a given customer segment, referenced and attached to promotions in RPM. They will be available in RPM promotion UI screen for customer segment promotions. For example: Electrician. |
| 2 | CUSTOMER_SEGMENT_TYPE_DESC |  |  | Y | VARCHAR (120) | The customer segment type description. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CUSTOMER_SEGMENT_TYPES|PK||||CUSTOMER_SEGMENT_TYPE|ASC|

---

## Table: CUSTOMER_SEGMENT_TYPES_TL

**Description:** This is the translation table for CUSTOMER_SEGMENT_TYPES table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | CUSTOMER_SEGMENT_TYPE | P | F | Y | VARCHAR (6) | The customer segment type of a given customer segment, referenced and attached to promotions in RPM. They will be available in RPM promotion UI screen for customer segment promotions. For example: Electrician. |
| 3 | CUSTOMER_SEGMENT_TYPE_DESC |  |  | Y | VARCHAR (120) | The customer segment type description. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CUSTOMER_SEGMENT_TYPES_TL|PK||||LANG|ASC|
||||||CUSTOMER_SEGMENT_TYPE|ASC|

---

## Table: ORDCUST

**Description:** This table contains the customer order information associated to with a Customer Order fulfilled through a purchase order or a transfer or inventory reservation at a store.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDCUST_NO | P |  | Y | NUMERIC (15) | This column contains a sequence generated key for each customer order. |
| 2 | STATUS |  |  | Y | VARCHAR (1) | This column indicates if a customer order was fully created, partially created or fully rejected. Valid values are C for complete, P for partial and X when the order cannot be created. |
| 3 | ORDER_NO |  | F |  | NUMERIC (12) | This column contains the purchase order created for the customer order. This field will be null if the customer order is associated with a transfer or if the customer order is for inventory reservation at a fulfilment location. |
| 4 | TSF_NO |  | F |  | NUMERIC (12) | This column contains the transfer created for the customer order. This field will be null if the customer order is associated with a purchase order or if the customer order is for inventory reservation at a fulfillment location. |
| 5 | SOURCE_LOC_TYPE |  |  |  | VARCHAR (2) | This column contains the source type for the customer order. Valid values are SU for supplier, ST for store and WH warehouse. This would only contain a value for vendor, warehouse, or multi-site fulfilment orders. |
| 6 | SOURCE_LOC_ID |  |  |  | NUMERIC (10) | This column contains the supplier, store or warehouse the customer order is sourced from. This would only contain a value for vendor, warehouse or multi-site fulfillment orders. |
| 7 | FULFILL_LOC_TYPE |  |  | Y | VARCHAR (1) | This column contains the fulfillment location type of the customer order. Valid values are S for physical store and V for virtual store. |
| 8 | FULFILL_LOC_ID |  |  | Y | NUMERIC (10) | This contains the fulfillment location of the customer order. It can only be either a physical store or a virtual store. |
| 9 | CUSTOMER_NO |  |  |  | VARCHAR (14) | This column contains the ID which identifies the customer who placed the order. |
| 10 | CUSTOMER_ORDER_NO |  |  | Y | VARCHAR (48) | This column contains the master customer order number from the Order Management System. |
| 11 | FULFILL_ORDER_NO |  |  | Y | VARCHAR (48) | This column contains the number from OMS related to the fulfillment details. One or more fulfillment orders could relate back to a single customer order in OMS. |
| 12 | PARTIAL_DELIVERY_IND |  |  | Y | VARCHAR (1) | This column indicates if the order can be picked and shipped partially or if it should be shipped only when complete. Valid values are Y or N. |
| 13 | DELIVERY_TYPE |  |  |  | VARCHAR (1) | This column contains the fulfillment method. Valid values are S for ship direct and C for customer pickup. |
| 14 | CARRIER_CODE |  |  |  | VARCHAR (4) | This column contains the carrier the order is to be shipped with, if specified on the order. |
| 15 | CARRIER_SERVICE_CODE |  |  |  | VARCHAR (6) | This column contains the shipping method that was selected by the customer. Valid values are defined as codes for code_type CSVC: F (Free 2 Day Shipping), D (Discounted 4 Day Shipping), O (Overnight Shipping), P (Premium Next Business Day Delivery) and S (Standard Shipping). |
| 16 | CONSUMER_DELIVERY_DATE |  |  |  | Date | This column contains the desired date the delivery is required by the customer. |
| 17 | CONSUMER_DELIVERY_TIME |  |  |  | Date | This column contains the desired time the delivery is required by the customer. |
| 18 | BILL_FIRST_NAME |  |  |  | VARCHAR (120) | This column contains the first name for the billing address on the order. |
| 19 | BILL_PHONETIC_FIRST |  |  |  | VARCHAR (120) | This column contains the phonetic first name for the billing address on the order. |
| 20 | BILL_LAST_NAME |  |  |  | VARCHAR (120) | This column contains the last name for the billing address on the order. |
| 21 | BILL_PHONETIC_LAST |  |  |  | VARCHAR (120) | This column contains the phonetic last name for the billing address on the order. |
| 22 | BILL_PREFERRED_NAME |  |  |  | VARCHAR (120) | This column contains the preferred name for the billing address on the order. |
| 23 | BILL_COMPANY_NAME |  |  |  | VARCHAR (120) | This column contains the company name for the billing address on the order. |
| 24 | BILL_ADD1 |  |  |  | VARCHAR (240) | This column contains the first line of the billing address of the customer. |
| 25 | BILL_ADD2 |  |  |  | VARCHAR (240) | This column contains the second line of the billing address of the customer. |
| 26 | BILL_ADD3 |  |  |  | VARCHAR (240) | This column contains the third line of the billing address of the customer. |
| 27 | BILL_COUNTY |  |  |  | VARCHAR (250) | This column contains the county portion of the billing address. |
| 28 | BILL_CITY |  |  |  | VARCHAR (120) | This column contains the city portion of the billing address. |
| 29 | BILL_STATE |  |  |  | VARCHAR (3) | This column contains the state portion of the billing address. |
| 30 | BILL_COUNTRY_ID |  |  |  | VARCHAR (3) | This column contains the country portion of the billing address. |
| 31 | BILL_POST |  |  |  | VARCHAR (30) | This column contains the postal code portion of the billing address. |
| 32 | BILL_JURISDICTION |  |  |  | VARCHAR (10) | This column contains the jurisdiction code for the billing country-state relationship. |
| 33 | BILL_PHONE |  |  |  | VARCHAR (20) | This column contains the billing phone number. |
| 34 | DELIVER_FIRST_NAME |  |  |  | VARCHAR (120) | This column contains the first name for the delivery address on the order. |
| 35 | DELIVER_PHONETIC_FIRST |  |  |  | VARCHAR (120) | This column contains the phonetic first name for the delivery address on the order. |
| 36 | DELIVER_LAST_NAME |  |  |  | VARCHAR (120) | This column contains the last name for the delivery address on the order. |
| 37 | DELIVER_PHONETIC_LAST |  |  |  | VARCHAR (120) | This column contains the phonetic last name for the delivery address on the order. |
| 38 | DELIVER_PREFERRED_NAME |  |  |  | VARCHAR (120) | This column contains the preferred name for the delivery address on the order. |
| 39 | DELIVER_COMPANY_NAME |  |  |  | VARCHAR (120) | This column contains the company name for the delivery address on the order. |
| 40 | DELIVER_ADD1 |  |  |  | VARCHAR (240) | This column contains the first line of the delivery address of the customer. |
| 41 | DELIVER_ADD2 |  |  |  | VARCHAR (240) | This column contains the second line of the delivery address of the customer. |
| 42 | DELIVER_ADD3 |  |  |  | VARCHAR (240) | This column contains the third line of the delivery address of the customer. |
| 43 | DELIVER_COUNTY |  |  |  | VARCHAR (250) | This column contains the county portion of the delivery address. |
| 44 | DELIVER_CITY |  |  |  | VARCHAR (120) | This column contains the city portion of the delivery address. |
| 45 | DELIVER_STATE |  |  |  | VARCHAR (3) | This column contains the state portion of the delivery address. |
| 46 | DELIVER_COUNTRY_ID |  |  |  | VARCHAR (3) | This column contains the country portion of the delivery address. |
| 47 | DELIVER_POST |  |  |  | VARCHAR (30) | This column contains the postal code portion of the delivery address. |
| 48 | DELIVER_JURISDICTION |  |  |  | VARCHAR (10) | This column contains the jurisdiction code for the delivery country-state relationship. |
| 49 | DELIVER_PHONE |  |  |  | VARCHAR (20) | This column contains the delivery phone number. |
| 50 | DELIVER_CHARGE |  |  |  | NUMERIC (20,4) | This column contains the delivery charges for Drop Ship purchase orders. |
| 51 | DELIVER_CHARGE_CURR |  |  |  | VARCHAR (3) | This column contains the currency of the delivery charge. |
| 52 | COMMENTS |  |  |  | VARCHAR (2000) | This column contains any comments about the customer order. |
| 53 | CREATE_DATETIME |  |  | Y | Date | This column contains the date when the customer order record was created. |
| 54 | CREATE_ID |  |  | Y | VARCHAR (30) | This column contains the ID of the user who created the customer order record. |
| 55 | LAST_UPDATE_DATETIME |  |  | Y | Date | This column contains the date when the customer order record was last updated. |
| 56 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This column contains the ID of the user who last updated the customer order record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ORDCUST|PK||||ORDCUST_NO|ASC|
|UK_ORDCUST_1|UK||||CUSTOMER_ORDER_NO|ASC|
||||||FULFILL_ORDER_NO|ASC|
||||||SOURCE_LOC_TYPE|ASC|
||||||SOURCE_LOC_ID|ASC|
||||||FULFILL_LOC_TYPE|ASC|
||||||FULFILL_LOC_ID|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|ORDCUST_I1|||||CUSTOMER_ORDER_NO|ASC|
||||||FULFILL_ORDER_NO|ASC|
|ORDCUST_I2|||||ORDER_NO|ASC|
|ORDCUST_I3|||||TSF_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ORDCUST_CARRIER_SERVICE_CO|carrier_service_code in ('F','D','O','P','S')<br>|
||CHK_ORDCUST_DELIVERY_TYPE|delivery_type in ('S','C')<br>|
||CHK_ORDCUST_FULFILL_LOC_TYPE|FULFILL_LOC_TYPE IN ('S','V')<br>|
||CHK_ORDCUST_PARTIAL_DELIVERY_I|PARTIAL_DELIVERY_IND IN ('Y','N')<br>|
||CHK_ORDCUST_SOURCE_LOC_TYPE|SOURCE_LOC_TYPE IN ('SU','ST','WH')<br>|
||CHK_ORDCUST_STATUS|STATUS IN ('C','P','X')<br>|
|Column Level|STATUS||
||SOURCE_LOC_TYPE||
||FULFILL_LOC_TYPE||
||PARTIAL_DELIVERY_IND||
||DELIVERY_TYPE||
||CARRIER_SERVICE_CODE||

---

## Table: ORDCUST_DETAIL

**Description:** This table contains customer order details for each customer order that has been placed.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDCUST_NO |  | F | Y | NUMERIC (15) | Refers to the unique customer order number from ORDCUST table. |
| 2 | ITEM |  | F | Y | VARCHAR (25) | This field contains the item in the customer order. This field will contain the original ordered item from the customer order message. This field can also hold the substitute item when a new record is inserted in this table to hold the substitution details when store fulfills using a substitute item. |
| 3 | REF_ITEM |  |  |  | VARCHAR (25) | This field contains the reference item ordered. This will be used only when a specific UPC is ordered. This is supported for vendor drop-ships orders only. |
| 4 | ORIGINAL_ITEM |  |  |  | VARCHAR (25) | This field contains the original item in the customer order which has been substituted. This field will only be populated in the additional record inserted to hold the substitute item details. |
| 5 | QTY_ORDERED_SUOM |  |  | Y | NUMERIC (12,4) | This field holds the quantity ordered for the customer order/fulfillment no/item number. This quantity is in STANDARD_UOM. |
| 6 | QTY_CANCELLED_SUOM |  |  |  | NUMERIC (12,4) | This field holds the total cancelled quantity for the customer order record. This quantity is in STANDARD_UOM. |
| 7 | STANDARD_UOM |  | F | Y | VARCHAR (4) | This field contains the standard UOM of the item. |
| 8 | TRANSACTION_UOM |  | F | Y | VARCHAR (4) | This field contains the original unit of measure in which the customer had placed the order in OMS. This field is informational only for RMS. |
| 9 | SUBSTITUTE_ALLOWED_IND |  |  | Y | VARCHAR (1) | This field indicates substitute items are allowed for an item on a customer order at the time of store fulfillment. This field is applicable for store fulfillment only in SIM. The valid values are Y or N. |
| 10 | UNIT_RETAIL |  |  |  | NUMERIC (20,4) | Indicates the unit sales retail of item on the customer order and is maintained in standard UOM. |
| 11 | RETAIL_CURRENCY_CODE |  |  |  | VARCHAR (3) | Indicates currency of unit retail. |
| 12 | COMMENTS |  |  |  | VARCHAR (2000) | Used to indicate any special instructions for the item, such as services (monograms, engrave, etc) |
| 13 | CREATE_DATETIME |  |  | Y | Date | Contains the timestamp when the record is created. |
| 14 | CREATE_ID |  |  | Y | VARCHAR (30) | Contains the user ID that created the record. |
| 15 | LAST_UPDATE_DATETIME |  |  | Y | Date | Contains the timestamp when the record was last updated. |
| 16 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Contains the user ID that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|ODL_UK|UK||||ORDCUST_NO|ASC|
||||||ITEM|ASC|
||||||ORIGINAL_ITEM|ASC|
|ORDCUST_DETAIL_I1|||||ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ORDCUST_DETAIL_SUBSTITUTE|SUBSTITUTE_ALLOWED_IND in ('Y','N')<br>|
|Column Level|SUBSTITUTE_ALLOWED_IND||

---

## Table: ORDCUST_L10N_EXT

**Description:** This extension table will hold the customer order localization extension attributes.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDCUST_NO | P | F | Y | NUMERIC (15) | This column contains a sequence generated key for each customer order. |
| 2 | L10N_COUNTRY_ID | P | F | Y | VARCHAR (3) | Contains the country this extended data is associated with. |
| 3 | GROUP_ID | P | F | Y | NUMERIC (10) | Contains the attribute group id this extended data is associated with. |
| 4 | VARCHAR2_1 |  |  |  | VARCHAR (250) | Holds the data defined on the L10N_ATTRIB table that references VARCHAR2_1 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 5 | VARCHAR2_2 |  |  |  | VARCHAR (250) | Holds the data defined on the L10N_ATTRIB table that references VARCHAR2_2 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 6 | VARCHAR2_3 |  |  |  | VARCHAR (250) | Holds the data defined on the L10N_ATTRIB table that references VARCHAR2_3 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 7 | VARCHAR2_4 |  |  |  | VARCHAR (250) | Holds the data defined on the L10N_ATTRIB table that references VARCHAR2_4 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 8 | VARCHAR2_5 |  |  |  | VARCHAR (250) | Holds the data defined on the L10N_ATTRIB table that references VARCHAR2_5 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 9 | VARCHAR2_6 |  |  |  | VARCHAR (250) | Holds the data defined on the L10N_ATTRIB table that references VARCHAR2_6 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 10 | VARCHAR2_7 |  |  |  | VARCHAR (250) | Holds the data defined on the L10N_ATTRIB table that references VARCHAR2_7 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 11 | VARCHAR2_8 |  |  |  | VARCHAR (250) | Holds the data defined on the L10N_ATTRIB table that references VARCHAR2_8 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 12 | VARCHAR2_9 |  |  |  | VARCHAR (250) | Holds the data defined on the L10N_ATTRIB table that references VARCHAR2_9 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 13 | VARCHAR2_10 |  |  |  | VARCHAR (250) | Holds the data defined on the L10N_ATTRIB table that references VARCHAR2_10 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 14 | NUMBER_11 |  |  |  | NUMERIC (20,4) | Holds the data defined on the L10N_ATTRIB table that references NUMBER_11 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 15 | NUMBER_12 |  |  |  | NUMERIC (20,4) | Holds the data defined on the L10N_ATTRIB table that references NUMBER_12 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 16 | NUMBER_13 |  |  |  | NUMERIC (20,4) | Holds the data defined on the L10N_ATTRIB table that references NUMBER_13 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 17 | NUMBER_14 |  |  |  | NUMERIC (20,4) | Holds the data defined on the L10N_ATTRIB table that references NUMBER_14 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 18 | NUMBER_15 |  |  |  | NUMERIC (20,4) | Holds the data defined on the L10N_ATTRIB table that references NUMBER_15 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 19 | NUMBER_16 |  |  |  | NUMERIC (20,4) | Holds the data defined on the L10N_ATTRIB table that references NUMBER_16 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 20 | NUMBER_17 |  |  |  | NUMERIC (20,4) | Holds the data defined on the L10N_ATTRIB table that references NUMBER_17 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 21 | NUMBER_18 |  |  |  | NUMERIC (20,4) | Holds the data defined on the L10N_ATTRIB table that references NUMBER_18 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 22 | NUMBER_19 |  |  |  | NUMERIC (20,4) | Holds the data defined on the L10N_ATTRIB table that references NUMBER_19 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 23 | NUMBER_20 |  |  |  | NUMERIC (20,4) | Holds the data defined on the L10N_ATTRIB table that references NUMBER_20 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 24 | DATE_21 |  |  |  | Date | Holds the data defined on the L10N_ATTRIB table that references DATE_21 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |
| 25 | DATE_22 |  |  |  | Date | Holds the data defined on the L10N_ATTRIB table that references DATE_22 as its L10N_ATTRIB.ATTRIB_STORAGE_COL. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ORDCUST_L10N_EXT|PK||||ORDCUST_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||L10N_COUNTRY_ID|ASC|
||||||GROUP_ID|ASC|

---

## Table: ORDCUST_PUB_INFO

**Description:** This table is used to publish confirmation of customer order fulfillment requests to an external customer order management system via RIB.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | Contains a system generated sequence that indicates the order in which ORDCUST records are to be published to the RIB. |
| 2 | ORDCUST_NO |  |  | Y | NUMERIC (15) | Contains RMS's ORDCUST_NO on ORDCUST table to be published. |
| 3 | THREAD_NO |  |  | Y | NUMERIC (4) | Contains the thread on which the customer order fulfillment transaction will be published. The thread value is determined by the ORDCUST_NO and the maximum number of threads on RIB_SETTINGS. |
| 4 | MESSAGE_TYPE |  |  | Y | VARCHAR (25) | Describes the action in RMS that is causing the message to be published to the RIB. For the fulfilord message family, 'fulfilordcfmcre' is the only message type to be published. |
| 5 | FAMILY |  |  | Y | VARCHAR (25) | Contains the name of the RIB message family. Valid value: 'fulfilordcfm'. |
| 6 | PUB_STATUS |  |  | Y | VARCHAR (1) | Indicates the publishing status of the message. Inserted as 'U'npublished; set to 'H'ospital when an error is encountered during the publication process. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ORDCUST_PUB_INFO|PK||||SEQ_NO|ASC|

---

## Table: ORDCUST_PUB_TEMP

**Description:** This table is used to assist the publishing of customer order fulfillment requests on ORDCUST and ORDCUST_DETAIL tables. The ordcust_no is recorded in this table if a confirmation message needs to be published to an external order management system via RIB. A publishing trigger on this table will call the order fulfillment publishing API to add the ordcust_no to the ORDCUST_PUB_INFO table for RIB to pick up.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDCUST_NO |  |  | Y | NUMERIC (15) | This column holds the ORDCUST_NO to be published. |
