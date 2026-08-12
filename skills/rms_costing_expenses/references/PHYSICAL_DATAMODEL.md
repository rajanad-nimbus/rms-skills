# RMS Costing, Landed Cost & Expenses Datamodel - Physical Data Model Reference

## Table: CE_CHARGES

**Description:** This table will hold the charges associated with an assigned Entry Number.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CE_ID | P |  | Y | NUMERIC (10) | This is the unique key for the Customs Entry module. |
| 2 | VESSEL_ID | P |  | Y | VARCHAR (20) | Contains vessel or other vehicle identification. |
| 3 | VOYAGE_FLT_ID | P |  | Y | VARCHAR (10) | Contains voyage or flight number. |
| 4 | ESTIMATED_DEPART_DATE | P |  | Y | Date | Estimated date of departure for the goods leaving the port of lading. |
| 5 | ORDER_NO | P |  | Y | NUMERIC (12) | Contains the purchase order number from which the item was originated. |
| 6 | ITEM | P |  | Y | VARCHAR (25) | Contains the item number. This field will hold a component sku of the pack if the pack_item field is not NULL. |
| 7 | SEQ_NO | P |  | Y | NUMERIC (6) | This field contains a sequence number which, when combined with the customs entry number, the vessel, the voyage, the estimated departure date, and the order number will make the row unique. |
| 8 | PACK_ITEM |  |  |  | VARCHAR (25) | Contains the number of the pack to which the item is associated (if the item is in a buyer pack). |
| 9 | HTS |  |  |  | VARCHAR (25) | Contains the unique HTS item classification number. This number is standard for the importing country. |
| 10 | EFFECT_FROM |  |  |  | Date | Denotes the beginning of the time period that the HTS classification is valid. |
| 11 | EFFECT_TO |  |  |  | Date | Denotes the end of the time period that the HTS classification is valid. |
| 12 | COMP_ID |  |  | Y | VARCHAR (10) | Contains a user specified code representing a specific expense or assessment. |
| 13 | COMP_RATE |  |  | Y | NUMERIC (20,4) | Contains the rate to be charged against the calculation base. The value in this field will be a percentage if the Calculation Basis is V (Value), and a monetary amount if the Calculation Basis is S (Specific). |
| 14 | COMP_VALUE |  |  | Y | NUMERIC (26,10) | Contains the value of the component. |
| 15 | CVB_CODE |  | F |  | VARCHAR (10) | Contains the Computation Value Basis used to calculate component charges. |
| 16 | PER_COUNT_UOM |  |  |  | VARCHAR (3) | Contains a count indicating the amount of the Per Count Unit of Measure to which the rate applies. When creating an expense that is defined as $.20 for every 10 kilograms of an item ordered, the Per Count would be 10. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CE_CHARGES|PK||||CE_ID|ASC|
||||||VESSEL_ID|ASC|
||||||VOYAGE_FLT_ID|ASC|
||||||ESTIMATED_DEPART_DATE|ASC|
||||||ORDER_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||ITEM|ASC|
||||||SEQ_NO|ASC|
|CE_CHARGES_I1|||||CVB_CODE|ASC|

---

## Table: CE_COMP_MIN_MAX

**Description:** This table should only contain assessment components for which a minimum and maximum range is required for a given Customs Entry. For the US this is only MPF (Merchandise Processing Fee). For Mexico they have two components, neither of which is MPF. These components are PRV and DTA.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | IMPORT_COUNTRY_ID | P |  | Y | VARCHAR (3) | This column will hold the import country. |
| 2 | COMP_ID | P |  | Y | VARCHAR (10) | This column will hold the component ID. |
| 3 | MIN_AMT |  |  | Y | NUMERIC (20,4) | This column will hold the minimum amount charged as fee. |
| 4 | MAX_AMT |  |  | Y | NUMERIC (20,4) | This column will hold the maximum amount charged as fee. |
| 5 | CURRENCY_CODE |  |  | Y | VARCHAR (3) | This column will hold the currency in which the minimum and maximum amount are stored. |

---

## Table: CE_FORMS

**Description:** This table will hold the forms associated with an assigned Entry Number.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CE_ID | P | F | Y | NUMERIC (10) | This is the unique identifier for the Customs Entry module. |
| 2 | FORM_TYPE | P |  | Y | VARCHAR (6) | This column holds the type of form that the importer needs to file to the government agency. |
| 3 | OGA_CODE | P | F | Y | VARCHAR (3) | This column holds the other government agency which the form is to be filed. |
| 4 | ISSUE |  |  | Y | VARCHAR (255) | Contains the issue of the form. |
| 5 | NOTICE_DATE |  |  | Y | Date | This column holds the date on which the government agency notified the importer or broker of the form. |
| 6 | RESPONDED_DATE |  |  |  | Date | Contains the date on which the importer/broker took action on the form. |
| 7 | DUE_DATE |  |  |  | Date | Contains the date that the form should be filed by. |
| 8 | COMMENTS |  |  |  | VARCHAR (2000) | This contains the user comments. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CE_FORMS|PK||||CE_ID|ASC|
||||||FORM_TYPE|ASC|
||||||OGA_CODE|ASC|
|CE_FORMS_I1|||||OGA_CODE|ASC|

---

## Table: CE_HEAD

**Description:** This table will hold the header level information in the Customs Entry dialog. The CE_ID will be the primary key since entry details might show up before the Customs assigned Entry Number.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CE_ID | P |  | Y | NUMERIC (10) | This is the unique identifier for the Customs Entry module. This artificial key is necessary because the Entry No. might be assigned after the detail information has been populated into the table structure. |
| 2 | STATUS |  |  | Y | VARCHAR (6) | This is the internal status of the CE ID. Valid values will be: Worksheet, Downloaded, and Uploaded. |
| 3 | ENTRY_NO |  |  |  | VARCHAR (40) | This is the Customs assigned number for the entry of goods. |
| 4 | ENTRY_DATE |  |  |  | Date | This is the date that the entry number was assigned. |
| 5 | ENTRY_STATUS |  | F | Y | VARCHAR (6) | This is the status which the entry is currently in. This status is defined by the customs agency. |
| 6 | ENTRY_TYPE |  | F | Y | VARCHAR (6) | This is a Customs defined entry type. |
| 7 | ENTRY_PORT |  |  |  | VARCHAR (5) | This contains the outside location where the entry is taking place. Only outside locations with a type of EP - Entry Port are valid, this will be enforced programmatically. |
| 8 | SUMMARY_DATE |  |  |  | Date | Date the Entry Summary document is submitted to Customs. |
| 9 | RELEASE_DATE |  |  |  | Date | Contains the date when the goods are released from the customs agency. |
| 10 | BROKER_ID |  |  |  | VARCHAR (10) | This identifies which broker partner is handling the entry. |
| 11 | BROKER_REF_ID |  |  |  | VARCHAR (18) | Contains a customs defined reference number for the importing broker. |
| 12 | FILE_NO |  |  |  | VARCHAR (18) | This column matches up with the U.S. Customs 7501 File Number field. |
| 13 | IMPORTER_ID |  |  |  | VARCHAR (10) | This identifies who is importing the goods. |
| 14 | IMPORT_COUNTRY_ID |  | F | Y | VARCHAR (3) | This is the country in which the entry is occurring. |
| 15 | CURRENCY_CODE |  | F | Y | VARCHAR (3) | This is the currency in which all fees will be paid. |
| 16 | EXCHANGE_RATE |  |  | Y | NUMERIC (20,10) | This is the exchange rate which would convert the Entry Currency into the primary currency. |
| 17 | BOND_NO |  |  |  | VARCHAR (18) | This is the number of the bond required for entry. |
| 18 | BOND_TYPE |  |  |  | VARCHAR (6) | A code representing the valid bond types. U.S. Customs valid bond type codes are: 0 = No bond required, 8 = Continuous bond, 9 = Single transaction bond |
| 19 | SURETY_CODE |  |  |  | VARCHAR (6) | A code identifying the surety company providing bond coverage for the importation. |
| 20 | CONSIGNEE_ID |  |  |  | VARCHAR (10) | This identifies which Oracle Retail partner will eventually receive the goods. |
| 21 | LIVE_IND |  |  | Y | VARCHAR (1) | This identifies whether or not the entry is live in accordance to the U.S. 7501 form. Valid values are Y and N. |
| 22 | BATCH_NO |  |  |  | VARCHAR (20) | Contains the customs assigned number representing the batch in which the Entry Number exists. |
| 23 | ENTRY_TEAM |  |  |  | VARCHAR (3) | Contains the code which identifies which team of customs agents cleared the goods. |
| 24 | LIQUIDATION_AMT |  |  |  | NUMERIC (20,4) | This value is the liquidation amount of the entry. |
| 25 | LIQUIDATION_DATE |  |  |  | Date | This is the date the liquidation amount is reported. |
| 26 | RELIQUIDATION_AMT |  |  |  | NUMERIC (20,4) | This value is the reliquidation amount of the entry. |
| 27 | RELIQUIDATION_DATE |  |  |  | Date | This is the date the reliquidation amount is reported. |
| 28 | MERCHANDISE_LOC |  |  |  | VARCHAR (40) | This column matches with the U.S. 7501 Location of Goods field. (Note: this is not a reference to a Oracle Retail Store, Warehouse or Outside Location.) |
| 29 | LOCATION_CODE |  |  |  | VARCHAR (4) | This column matches with the U.S. 7501 G.O. No. field. (Note: this is not a reference to a Oracle Retail Store, Warehouse or Outside Location.) |
| 30 | PAYEE_TYPE |  |  |  | VARCHAR (6) | Type of the payee on the customs entry. Valid payees include Import Authority partners and Broker partners. Valid values are IA - Import Authority and BR - Broker. |
| 31 | PAYEE |  |  |  | VARCHAR (10) | ID of the payee (Import Authority or Broker) on the customs entry. |
| 32 | COMMENTS |  |  |  | VARCHAR (2000) | This contains the user comments. |
| 33 | DOWNLOADED_IND |  |  | Y | VARCHAR (1 BYTE) | Indicates whether this Customs Entry record was previously downloaded. This will be set to 'Y'es when the record's status is set from 'D'ownloaded to 'W'orksheet. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CE_HEAD|PK||||CE_ID|ASC|
|CE_HEAD_I3|||||ENTRY_STATUS|ASC|
||||||IMPORT_COUNTRY_ID|ASC|
|CE_HEAD_I4|||||ENTRY_TYPE|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||IMPORT_COUNTRY_ID|ASC|
|CE_HEAD_I2|||||CURRENCY_CODE|ASC|
|CE_HEAD_I1|||||IMPORT_COUNTRY_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CE_HEAD_BOND_TYPE|BOND_TYPE in ('0','8','9')<br>|
||CHK_CE_HEAD_LIVE_IND|LIVE_IND in ('Y', 'N')<br>|
||CHK_CE_HEAD_PAYEE|(PAYEE IS NOT NULL and PAYEE_TYPE IS NOT NULL) OR (PAYEE IS NULL and PAYEE_TYPE IS NULL)|
||CHK_CE_HEAD_PAYEE_TYPE|(PAYEE_TYPE IN ('IA', 'BR') and (payee_type IS NOT NULL and payee IS NOT NULL) ) OR (payee_type IS NULL and payee IS NULL)<br>|
||CHK_CE_HEAD_STATUS|STATUS in ('W','D','U','S')<br>|
||CHK_CE_HEAD_DOWNLOADED_IND|DOWNLOADED_IND IN ('Y','N')<br>|
|Column Level|STATUS||
||BOND_TYPE||
||LIVE_IND||

---

## Table: CE_LIC_VISA

**Description:** This table is used to store license and visa information for the Customs Entry item.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CE_ID | P | F | Y | NUMERIC (10) | This is the unique key for the Customs Entry module. |
| 2 | VESSEL_ID | P | F | Y | VARCHAR (20) | Contains vessel or other vehicle identification. |
| 3 | VOYAGE_FLT_ID | P | F | Y | VARCHAR (10) | Contains voyage or flight number. |
| 4 | ESTIMATED_DEPART_DATE | P | F | Y | Date | Estimated date of departure for the goods leaving the port of lading. |
| 5 | ORDER_NO | P | F | Y | NUMERIC (12) | Contains the purchase order number from which the item was originated. |
| 6 | ITEM | P | F | Y | VARCHAR (25) | Contains the item number. |
| 7 | LICENSE_VISA_TYPE | P |  | Y | VARCHAR (6) | This field determines the whether the id in the license_visa_id column is a license or a visa. Valid values for this column are License or Visa. |
| 8 | LICENSE_VISA_ID | P |  | Y | VARCHAR (30) | Contains the identification of the license or visa. |
| 9 | LICENSE_VISA_QTY |  |  |  | NUMERIC (12,4) | Contains the number of units the license or visa applies to. |
| 10 | LICENSE_VISA_QTY_UOM |  |  |  | VARCHAR (4) | Contains the unit of measure that the license_visa_qty is stored in. |
| 11 | QUOTA_CAT |  |  |  | VARCHAR (6) | Contains the Customs Quota Category that the license or visa applies to. |
| 12 | NET_WEIGHT |  |  |  | NUMERIC (12,4) | Contains the Net/net Weight of the item. |
| 13 | NET_WEIGHT_UOM |  |  |  | VARCHAR (4) | Contains the unit of measure for the Net/net Weight of the item. |
| 14 | HOLDER_ID |  |  |  | VARCHAR (18) | Contains the holder of the License or Visa. |
| 15 | COMMENTS |  |  |  | VARCHAR (2000) | Contains the user comments. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CE_LIC_VISA|PK||||CE_ID|ASC|
||||||VESSEL_ID|ASC|
||||||VOYAGE_FLT_ID|ASC|
||||||ESTIMATED_DEPART_DATE|ASC|
||||||ORDER_NO|ASC|
||||||ITEM|ASC|
||||||LICENSE_VISA_TYPE|ASC|
||||||LICENSE_VISA_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CE_LIC_VISA_LICENSE_VISA_T|LICENSE_VISA_TYPE in ('L','V')<br>|
|Column Level|LICENSE_VISA_TYPE||

---

## Table: CE_ORD_ITEM

**Description:** This table contains all Item level information need in clearing customs.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CE_ID | P | F | Y | NUMERIC (10) | This is the unique identifier for the Customs Entry module. |
| 2 | VESSEL_ID | P | F | Y | VARCHAR (20) | Contains vessel or other vehicle identification. |
| 3 | VOYAGE_FLT_ID | P | F | Y | VARCHAR (10) | Contains voyage or flight number. |
| 4 | ESTIMATED_DEPART_DATE | P | F | Y | Date | Estimated date of departure for the goods leaving the port of lading. |
| 5 | ORDER_NO | P | F | Y | NUMERIC (12) | Contains the purchase order number from which the item was originated. |
| 6 | ITEM | P | F | Y | VARCHAR (25) | Contains the SKU number. |
| 7 | BL_AWB_ID |  |  |  | VARCHAR (30) | Contains the Bill of Lading or Airway Bill number. This id will be generated by the agent that is shipping the goods. |
| 8 | INVOICE_ID |  |  |  | VARCHAR (30) | Contains the invoice id associated with the purchase order or item. |
| 9 | INVOICE_DATE |  |  |  | Date | Contains the date on which the invoice was issued. |
| 10 | INVOICE_AMT |  |  |  | NUMERIC (20,4) | Contains the amount of the invoice for the given order/item combination. |
| 11 | CURRENCY_CODE |  | F |  | VARCHAR (3) | Contains the currency of the invoice amount. |
| 12 | EXCHANGE_RATE |  |  |  | NUMERIC (20,10) | Contains the exchange rate of the invoice currency to the primary currency. |
| 13 | MANIFEST_ITEM_QTY |  |  | Y | NUMERIC (12,4) | Contains the number of items for this order/item combination. |
| 14 | MANIFEST_ITEM_QTY_UOM |  |  | Y | VARCHAR (4) | Contains the unit of measure that item_qty is stored in. |
| 15 | CARTON_QTY |  |  |  | NUMERIC (12,4) | Contains the number of cartons for this order/item combination. |
| 16 | CARTON_QTY_UOM |  |  |  | VARCHAR (4) | Contains the unit of measure that the carton quantity is store in. |
| 17 | GROSS_WT |  |  |  | NUMERIC (12,4) | Contains the gross weight for this order/item combination. |
| 18 | GROSS_WT_UOM |  | F |  | VARCHAR (4) | Contains the unit of measure that the gross weight is stored in. |
| 19 | NET_WT |  |  |  | NUMERIC (12,4) | Contains the net weight for this order/item combination. |
| 20 | NET_WT_UOM |  | F |  | VARCHAR (4) | Contains the unit of measure that the net weight is stored in. |
| 21 | CUBIC |  |  |  | NUMERIC (12,4) | Contains the cubic for this order/item combination. |
| 22 | CUBIC_UOM |  | F |  | VARCHAR (4) | Contains the unit of measure that the cubic is stored in. |
| 23 | CLEARED_QTY |  |  |  | NUMERIC (12,4) | Contains the number of items that have cleared. |
| 24 | CLEARED_QTY_UOM |  | F |  | VARCHAR (4) | Contains the unit of measure that the cleared quantity is stored in. |
| 25 | IN_TRANSIT_NO |  |  |  | VARCHAR (15) | Contains the in transit identification for the land freight movement of the goods. This column also matches the In Transit field on the U.S. 7501 form. |
| 26 | IN_TRANSIT_DATE |  |  |  | Date | Contains the date on which the goods will be shipped with the in transit number. |
| 27 | RUSH_IND |  |  | Y | VARCHAR (1) | Contains a Rush value. This will identify goods for promotional or other purposes that need to be received as quickly as possible. Valid values are Yes and No. |
| 28 | TARIFF_TREATMENT |  |  |  | VARCHAR (10) | Contains the tariff treatment used to calculate the value for duty. |
| 29 | RULING_NO |  |  |  | VARCHAR (10) | Contains the customs ruling number for the HTS classification. |
| 30 | DO_NO |  |  |  | VARCHAR (10) | Contains a broker defined number to identify goods for pickup with an internal transportation company after the goods have cleared. |
| 31 | DO_DATE |  |  |  | Date | Contains the date on which the D.O. Number was issued. |
| 32 | ALC_STATUS |  |  | Y | VARCHAR (6) | Contains the status of the charges on the entry for the VVE/order-item combination. If the charges have not been allocated into ALC or once modifications have been made to CE charges before ALC has been finalized, the ALC Status will be P (Pending). If the charges have been allocated but ALC has not yet been finalized, the ALC Status will be A (Allocated). If the charges have been allocated and ALC has been finalized and processed, the ALC Status will be R (Processed). Once all order-items for the Entry have an ALC Status of Processed, the charges on the entry can no longer be allocated. Valid values are found on the codes table with a code type of CEAS. |
| 33 | COMMENTS |  |  |  | VARCHAR (2000) | This contains the user comments. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CE_ORD_ITEM|PK||||CE_ID|ASC|
||||||VESSEL_ID|ASC|
||||||VOYAGE_FLT_ID|ASC|
||||||ESTIMATED_DEPART_DATE|ASC|
||||||ORDER_NO|ASC|
||||||ITEM|ASC|
|CE_ORD_ITEM_I1|||||CURRENCY_CODE|ASC|
|CE_ORD_ITEM_I8|||||CLEARED_QTY_UOM|ASC|
|CE_ORD_ITEM_I2|||||ITEM|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|CE_ORD_ITEM_I3|||||ORDER_NO|ASC|
|CE_ORD_ITEM_I4|||||NET_WT_UOM|ASC|
|CE_ORD_ITEM_I5|||||GROSS_WT_UOM|ASC|
|CE_ORD_ITEM_I7|||||CUBIC_UOM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CE_ORD_ITEM_ALC_STATUS|ALC_STATUS in ('P','A','R')<br>|
||CHK_CE_ORD_ITEM_CLEARED_QTY|(CLEARED_QTY is NOT NULL AND CLEARED_QTY_UOM is NOT NULL) OR (CLEARED_QTY is NULL AND CLEARED_QTY_UOM is NULL)<br>|
||CHK_CE_ORD_ITEM_CUBIC|(CUBIC is NOT NULL AND CUBIC_UOM is NOT NULL) OR (CUBIC is NULL AND CUBIC_UOM is NULL)<br>|
||CHK_CE_ORD_ITEM_GROSS_WT|(GROSS_WT is NOT NULL AND GROSS_WT_UOM is NOT NULL) OR (GROSS_WT is NULL AND GROSS_WT_UOM is NULL)<br>|
||CHK_CE_ORD_ITEM_NET_WT|(NET_WT is NOT NULL AND NET_WT_UOM is NOT NULL) OR (NET_WT is NULL AND NET_WT_UOM is NULL)<br>|
||CHK_CE_ORD_ITEM_RUSH_IND|RUSH_IND in ('Y','N')<br>|
|Column Level|RUSH_IND||
||ALC_STATUS||

---

## Table: CE_PROTEST

**Description:** This table will hold the protests associated with an assigned Entry Number.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CE_ID | P | F | Y | NUMERIC (10) | This is the unique identifier for the Customs Entry module. |
| 2 | PROTEST_NO | P |  | Y | NUMERIC (10) | Contains the customs defined protest number. |
| 3 | PROTEST_DATE |  |  | Y | Date | Contains the date on which the protest was filed. |
| 4 | PROTEST_CODE |  |  |  | VARCHAR (6) | Contains the code of the protest. |
| 5 | COMMENTS |  |  |  | VARCHAR (2000) | Contains the users comments. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CE_PROTEST|PK||||CE_ID|ASC|
||||||PROTEST_NO|ASC|

---

## Table: CE_SHIPMENT

**Description:** This table contains the Vessel/Voyage/Est. Depart Date level information for the Customs Entry module.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CE_ID | P | F | Y | NUMERIC (10) | This is the unique identifier for the Customs Entry module. |
| 2 | VESSEL_ID | P |  | Y | VARCHAR (20) | Contains vessel or other vehicle identification. |
| 3 | VOYAGE_FLT_ID | P |  | Y | VARCHAR (10) | Contains voyage or flight number. |
| 4 | ESTIMATED_DEPART_DATE | P |  | Y | Date | Estimated date of departure for the goods leaving the port of lading. |
| 5 | VESSEL_SCAC_CODE |  | F |  | VARCHAR (6) | Contains the Vessels Standard Carrier Alpha Code as established by Customs. Each vessel will have a unique SCAC code. |
| 6 | LADING_PORT |  |  |  | VARCHAR (5) | Contains the lading port id, which is the Customs port code identifying where the goods were loaded on a vessel. |
| 7 | DISCHARGE_PORT |  |  |  | VARCHAR (5) | Contains the discharge port id, which is the Customs port code identifying where the goods were unloaded from a vessel. |
| 8 | TRAN_MODE_ID |  |  |  | VARCHAR (6) | Contains a customs defined Transportation mode. Valid values are: 10 - Vessel, Non-container, 11 - Vessel, Container, 12 - Border Water-borne (Only - Mexico and Canada), 20 - Rail, Non-container, 21 - Rail, Container, 30 - Truck, Non-container 31 - Truck, Container, 32 - Auto, 33 - Pedestrian, 34 - Road, other, Includes foot and animal borne, 40 - Air, Non-container, 41 - Air, Container, 50 - Mail, 60 - Passenger, hand-carried, 70 - Fixed Tran Installation, 80 - Not used at this time. |
| 9 | EXPORT_DATE |  |  |  | Date | Contains the actual export date of the Vessel/Voyage combination. |
| 10 | IMPORT_DATE |  |  |  | Date | Contains the date on which the goods arrived to clear customs. |
| 11 | ARRIVAL_DATE |  |  |  | Date | Contains the date on which the goods arrived at the entry location. |
| 12 | EXPORT_COUNTRY_ID |  | F |  | VARCHAR (3) | Contains the id of the country where the goods were exported. |
| 13 | SHIPMENT_NO |  |  |  | VARCHAR (20) | Contains the shipment reference number. |
| 14 | COMMENTS |  |  |  | VARCHAR (2000) | This contains the user comments. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_CE_SHIPMENT|PK||||CE_ID|ASC|
||||||VESSEL_ID|ASC|
||||||VOYAGE_FLT_ID|ASC|
||||||ESTIMATED_DEPART_DATE|ASC|
|CE_SHIPMENT_I2|||||VESSEL_SCAC_CODE|ASC|
|CE_SHIPMENT_I1|||||EXPORT_COUNTRY_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CE_SHIPMENT_TRAN_MODE_ID|TRAN_MODE_ID in ('10','11','12','20','21','30','31','32','33','34','40','41','50','60','70','80')<br>|
|Column Level|TRAN_MODE_ID||

---

## Table: CE_TEMP

**Description:** This table temporarily holds new ce_ids created in TRANS_FINALIZE_SQL.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | CE_ID |  |  | Y | NUMERIC (10) | Holds ce_ids before they are added to CE_HEAD and the other customs entry tables. |
| 2 | TRANSPORTATION_ID |  |  | Y | NUMERIC (10) | The column contains the transportation ID for the record(s) being finalized |

---

## Table: COMPHEAD

**Description:** This table contains one row for the company name. No index is associated with this table because it contains only one row.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COMPANY | P |  | Y | NUMERIC (4) | Contains the unique number identifying the company the for which the system is running. This is the highest level in the merchandise hierarchy. |
| 2 | CO_NAME |  |  | Y | VARCHAR (120) | Contains the company name for which the system is running. |
| 3 | CO_ADD1 |  |  | Y | VARCHAR (240) | The address of the company headquarters. |
| 4 | CO_ADD2 |  |  |  | VARCHAR (240) | The second line of the company headquarters address. |
| 5 | CO_ADD3 |  |  |  | VARCHAR (240) | The third line of the company headquarters address. |
| 6 | CO_CITY |  |  | Y | VARCHAR (120) | The city of the company headquarters. |
| 7 | CO_STATE |  |  |  | VARCHAR (3) | The state of the company headquarters. |
| 8 | CO_COUNTRY |  | F | Y | VARCHAR (3) | The country of the company headquarters. |
| 9 | CO_POST |  |  |  | VARCHAR (30) | The postal code of the company headquarters. |
| 10 | CO_NAME_SECONDARY |  |  |  | VARCHAR (120) | Contains the secondary name of the company. |
| 11 | CO_JURISDICTION_CODE |  |  |  | VARCHAR (10) | Identifies the jurisdiction code for the country-state relationship. |
| 12 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 13 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COMPHEAD|PK||||COMPANY|ASC|
|COMPHEAD_I2|||||CO_STATE|ASC|
|COMPHEAD_I1|||||CO_COUNTRY|ASC|

---

## Table: COMPHEAD_TL

**Description:** This is the translation table for COMPHEAD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | COMPANY | P | F | Y | NUMERIC (4) | Contains the unique number identifying the company the for which the system is running. This is the highest level in the merchandise hierarchy. |
| 3 | CO_NAME |  |  | Y | VARCHAR (120) | Contains the company name for which the system is running. |
| 4 | CO_ADD1 |  |  | Y | VARCHAR (240) | The address of the company headquarters. |
| 5 | CO_ADD2 |  |  |  | VARCHAR (240) | The second line of the company headquarters address. |
| 6 | CO_ADD3 |  |  |  | VARCHAR (240) | The third line of the company headquarters address. |
| 7 | CO_CITY |  |  | Y | VARCHAR (120) | The city of the company headquarters. |
| 8 | CO_NAME_SECONDARY |  |  |  | VARCHAR (120) | Contains the secondary name of the company. |
| 9 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 10 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 11 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 12 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COMPHEAD_TL|PK||||LANG|ASC|
||||||COMPANY|ASC|

---

## Table: COST_CHANGE_ACTIVE_DATE_TEMP

**Description:** RMS_COL_CPH_ACTIVE_DATE_AUR trigger will populate this table. This will hold records for cost changes that exists in the FUTURE_COST table and whose active date has been modified.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_CHANGE |  |  | Y | NUMERIC (8) | Cost Change number |
| 2 | ITEM |  |  | Y | VARCHAR (25) | Item number |
| 3 | SUPPLIER |  |  | Y | NUMERIC (10) | Supplier number |
| 4 | ORIGIN_COUNTRY_ID |  |  | Y | VARCHAR (3) | Origin Country |
| 5 | LOC |  |  |  | NUMERIC (10) | Location |
| 6 | LOC_TYPE |  |  |  | VARCHAR (1) | Location type |
| 7 | OLD_ACTIVE_DATE |  |  | Y | Date | Cost Changes Active Date |

---

## Table: COST_CHANGE_LOC_TEMP

**Description:** This temporary table holds the data retrieved for the data used by the SUPPSKU_LOC form online.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_CHANGE |  |  | Y | NUMERIC (8) | Contains the number which uniquely identifies the cost change. |
| 2 | SUPPLIER |  |  | Y | NUMERIC (10) | Contains the number which identifies the supplier associated with the cost change. |
| 3 | ORIGIN_COUNTRY_ID |  |  | Y | VARCHAR (3) | The country where the item was manufactured or significantly altered. |
| 4 | ITEM |  |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 5 | LOC_TYPE |  |  | Y | VARCHAR (1) | Contains the location type that the cost change applies to. |
| 6 | LOCATION |  |  | Y | NUMERIC (10) | Contains the location that the cost change applies to. Cost changes will be managed and stored at the physical warehouse level since the unit cost must remain consistant across all virtual warehouses within the same physical warehouse. The sccext batch program will handle blowing the cost change down to all virtual warehouses that reside on the physical warehouse stored on this table. |
| 7 | BRACKET_VALUE1 |  |  |  | NUMERIC (12,4) | Contains the bracket for which the cost changes applies within the item/supplier combination. |
| 8 | BRACKET_UOM |  |  |  | VARCHAR (4) | Contains the unit of measure for the bracket value. |
| 9 | UNIT_COST_OLD |  |  |  | NUMERIC (20,4) | Contains the old unit cost for the specified item/supplier. |
| 10 | UNIT_COST_NEW |  |  |  | NUMERIC (20,4) | Contains the new unit cost for the specified item/supplier. |
| 11 | COST_CHANGE_TYPE |  |  |  | VARCHAR (2) | Describes the type of cost change |
| 12 | COST_CHANGE_VALUE |  |  |  | NUMERIC (20,4) | Holds the value of cost change |
| 13 | RECALC_ORD_IND |  |  | Y | VARCHAR (1) | This field indicates whether or not approved order costs should be re-calculated when a supplier cost has changed. Valid values are: Y- Yes, recalculate order, N - No, do not recalculate order |
| 14 | DEFAULT_BRACKET_IND |  |  | Y | VARCHAR (1) | This field contains the value which will control which cost is the base cost for processing throughout the system. Each bracket group (either by supplier, supplier/department, supplier/department/location, supplier/location) must have one bracket defined as the default bracket. |
| 15 | DEPT |  |  |  | NUMERIC (4) | Contains the number which uniquely identifies the department. This field is only populated from the supplier bracket costing dialogue when bracket inserts or default bracket changes involved the department level. |
| 16 | SUP_DEPT_SEQ_NO |  |  |  | NUMERIC (10) | This field will contain the supplier department sequence number. |
| 17 | BRACKET_VALUE2 |  |  |  | NUMERIC (12,4) | This field will contain the supplier secondary bracket values. |
| 18 | COST_UOM |  |  | Y | VARCHAR (4) | A field to hold the cost UOM value on ITEM_SUPP_COUNTRY |
| 19 | UNIT_COST_CUOM_NEW |  |  |  | NUMERIC (20,4) | Unit cost per cost UOM. This is the unit cost that is entered by the user in the suppsku form while unit_cost_new field in this table holds the unit cost per standard UOM. Note that unit_cost stored on ITEM_SUPP_COUNTRY table is in terms of standard UOM. |
| 20 | UNIT_COST_CUOM_OLD |  |  |  | NUMERIC (20,4) | Unit cost per cost UOM. This is the old unit cost CUOM which is calculated in the suppsku form while unit_cost_old field in this table holds the old unit cost per standard UOM. It will be used to aid in the markup calculation in the suppsku form. |
| 21 | VPN |  |  |  | VARCHAR (30) | A field to hold the Vendor Product Number on ITEM_SUPPLIER. |
| 22 | REF_ITEM |  |  |  | VARCHAR (25) | This field identifies the unique alphanumeric value for an item one level below the transaction level item. |
| 23 | DELIVERY_COUNTRY_ID |  |  |  | VARCHAR (3) | Country to which the item will be delivered to. |
| 24 | UNIT_COST_CUOM_ORIG |  |  |  | NUMERIC (20,4) | This is the original unit cost per cost UOM. |
| 25 | UNIT_COST_ORIG |  |  |  | NUMERIC (20,4) | Contains the original unit cost for the specified item/supplier |

---

## Table: COST_CHANGE_TEMP

**Description:** This temporary table holds the data retrieved for the data used by the SUPPSKU form online.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_CHANGE |  |  | Y | NUMERIC (8) | Contains the number which uniquely identifies the cost change. |
| 2 | SUPPLIER |  |  | Y | NUMERIC (10) | Contains the number which identifies the supplier associated with the cost change. |
| 3 | ORIGIN_COUNTRY_ID |  |  | Y | VARCHAR (3) | The country where the item was manufactured or significantly altered. |
| 4 | ITEM |  |  | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 5 | BRACKET_VALUE1 |  |  |  | NUMERIC (12,4) | Contains the bracket for which the cost changes applies within the item/supplier combination. |
| 6 | BRACKET_UOM |  |  |  | VARCHAR (4) | Contains the unit of measure for the bracket value. |
| 7 | UNIT_COST_OLD |  |  |  | NUMERIC (20,4) | Contains the old unit cost for the specified item/supplier. |
| 8 | UNIT_COST_NEW |  |  |  | NUMERIC (20,4) | Contains the new unit cost for the specified item/supplier. |
| 9 | COST_CHANGE_TYPE |  |  |  | VARCHAR (2) | Describes the type of cost change |
| 10 | COST_CHANGE_VALUE |  |  |  | NUMERIC (20,4) | Holds the value of cost change |
| 11 | RECALC_ORD_IND |  |  | Y | VARCHAR (1) | This field indicates whether or not approved order costs should be re-calculated when a supplier cost has changed. Valid values are: Y - Yes, recalculate order, N - No, do no recalculate order |
| 12 | LOC_LEVEL_IND |  |  | Y | VARCHAR (1) | Indicates whether or not location level cost change details exist. |
| 13 | DEFAULT_BRACKET_IND |  |  | Y | VARCHAR (1) | This field contains the value which will control which cost is the base cost for processing throughout the system. Each bracket group (either by supplier, supplier/department, supplier/department/location, supplier/location) must have one bracket defined as the default bracket. |
| 14 | DEPT |  |  |  | NUMERIC (4) | Contains the number which uniquely identifies the department. This field is only populated from the supplier bracket costing dialogue when bracket inserts or default bracket changes involved the department level. |
| 15 | SUP_DEPT_SEQ_NO |  |  |  | NUMERIC (10) | This field will contain the supplier department sequence number. |
| 16 | BRACKET_VALUE2 |  |  |  | NUMERIC (12,4) | This field will contain the supplier secondary bracket values. |
| 17 | COST_UOM |  |  | Y | VARCHAR (4) | A field to hold the cost UOM value on ITEM_SUPP_COUNTRY. |
| 18 | UNIT_COST_CUOM_NEW |  |  |  | NUMERIC (20,4) | Unit cost per cost UOM. This is the unit cost that is entered by the user in the suppsku form while unit_cost_new field in this table holds the unit cost per standard UOM. Note that unit_cost stored on ITEM_SUPP_COUNTRY table is in terms of standard UOM. |
| 19 | UNIT_COST_CUOM_OLD |  |  |  | NUMERIC (20,4) | Unit cost per cost UOM. This is the old unit cost CUOM which is calculated in the suppsku form while unit_cost_old field in this table holds the old unit cost per standard UOM. It will be used to aid in the markup calculation in the suppsku form. |
| 20 | VPN |  |  |  | VARCHAR (30) | A field to hold the Vendor Product Number on ITEM_SUPPLIER. |
| 21 | REF_ITEM |  |  |  | VARCHAR (25) | A field to hold the reference item number selected from ITEM_MASTER |
| 22 | DELIVERY_COUNTRY_ID |  |  |  | VARCHAR (3) | Country to which the item will be delivered to. |
| 23 | UNIT_COST_CUOM_ORIG |  |  |  | NUMERIC (20,4) | This is the original unit cost per Cost UOM. |
| 24 | UNIT_COST_ORIG |  |  |  | NUMERIC (20,4) | Contains the original unit cost for the specified item/supplier. |

---

## Table: COST_CHANGE_TEMP2

**Description:** Staging table for supplier cost change extract batch (sccext.pc) containing cost changes with location information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_CHANGE |  |  |  | NUMERIC (8) | Cost change number from the cost_susp_sup_detail or cost_susp_sup_detail_loc |
| 2 | ITEM |  |  |  | VARCHAR (25) | Item under cost change |
| 3 | SUPPLIER |  |  |  | NUMERIC (10) | Supplier under cost change |
| 4 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | Country ID under cost change |
| 5 | LOC |  |  |  | NUMERIC (10) | Location information |
| 6 | LOC_TYPE |  |  |  | VARCHAR (1) | Location type information |
| 7 | UNIT_COST |  |  |  | NUMERIC (20,4) | New unit cost from the cost_susp_sup_detail or cost_susp_sup_detail_loc table |
| 8 | COST_CHANGE_TYPE |  |  |  | VARCHAR (2) | Cost change type from cost change tables |
| 9 | COST_CHANGE_VALUE |  |  |  | NUMERIC (20,4) | Cost change value from the cost change tables |
| 10 | RECALC_ORD_IND |  |  |  | VARCHAR (1) | Order recalculation indicator from the cost change tables |
| 11 | ISC_ROWID |  |  |  | ROWID | ITEM_SUPP_COUNTRY rowid corresponding to the item under cost change |
| 12 | ISC_UNIT_COST |  |  |  | NUMERIC (20,4) | Item supplier country unit cost |
| 13 | ISCL_ROWID |  |  |  | ROWID | ITEM_SUPP_COUNTRY_LOC rowid corresponding to the item under cost change |
| 14 | ISCL_UNIT_COST |  |  |  | NUMERIC (20,4) | Item supplier country loc unit cost |
| 15 | ISCL_PRIM_LOC_IND |  |  |  | VARCHAR (1) | Item supplier country loc primary location indicator |
| 16 | DEPT |  |  |  | NUMERIC (4) | Item department information |
| 17 | CLASS |  |  |  | NUMERIC (4) | Item class information |
| 18 | SUBCLASS |  |  |  | NUMERIC (4) | Item subclass information |
| 19 | STATUS |  |  |  | VARCHAR (1) | Item status information |
| 20 | PACK_IND |  |  |  | VARCHAR (1) | Pack indicator |
| 21 | CHILD_IND |  |  |  | VARCHAR (1) | Child item indicator |
| 22 | TRAN_LEVEL_ITEM_IND |  |  |  | VARCHAR (1) | Transaction level item indicator |
| 23 | SUP_CURRENCY |  |  |  | VARCHAR (3) | Supplier currency |
| 24 | LOC_CURRENCY |  |  |  | VARCHAR (3) | Location currency |
| 25 | DELIVERY_COUNTRY_ID |  |  |  | VARCHAR (3) | Country to which the item will be delivered to. |
| 26 | NEGOTIATED_ITEM_COST |  |  |  | NUMERIC (20,4) | This will hold the supplier negotiated item cost for the primary delivery country of the item. This is a column added to help bulk processing when integrated with an external tax solution. |
| 27 | EXTENDED_BASE_COST |  |  |  | NUMERIC (20,4) | This will hold the extended base cost for the primary delivery country of the item. Extended base cost is the cost inclusive of all the taxes that affect the WAC. This is a column added to help bulk processing when integrated with an external tax solution. |
| 28 | INCLUSIVE_COST |  |  |  | NUMERIC (20,4) | This will hold the inclusive cost for the primary delivery country of the item. This cost will have both the recoverable and non recoverable taxes included. This is a column added to help bulk processing when integrated with an external tax solution. |
| 29 | BASE_COST |  |  |  | NUMERIC (20,4) | This field will hold the tax exclusive cost of the item. This is a column added to help bulk processing when integrated with an external tax solution. |

---

## Table: COST_CHANGE_TEMP3

**Description:** GLOBAL TEMPORARY TABLE COST_CHANGE_TEMP3 with ON COMMIT DELETE ROWS

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_CHANGE |  |  |  | NUMERIC (8) | Cost Change number from cost_susp_sup_detail or cost_susp_sup_detail_loc tables |
| 2 | ITEM |  |  |  | VARCHAR (25) | Item under cost change |
| 3 | SUPPLIER |  |  |  | NUMERIC (10) | Supplier under cost change |
| 4 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | Country Id under cost change |
| 5 | LOC |  |  |  | NUMERIC (10) | Location information under cost change |
| 6 | LOC_TYPE |  |  |  | VARCHAR (1) | Location type information under cost change |
| 7 | UNIT_COST |  |  |  | NUMERIC (20,4) | New unit cost from cost_susp_sup_detail |
| 8 | COST_CHANGE_TYPE |  |  |  | VARCHAR (2) | Cost change type from cost change tables |
| 9 | COST_CHANGE_VALUE |  |  |  | NUMERIC (20,4) | Cost change type from cost change tables. |
| 10 | RECALC_ORD_IND |  |  |  | VARCHAR (1) | Order recalculation indicator from cost change tables |
| 11 | ISC_ROWID |  |  |  | ROWID | Item_supp_country rowid corresponding to item under cost change |
| 12 | ISC_UNIT_COST |  |  |  | NUMERIC (20,4) | Item supplier country unit cost |
| 13 | ISCL_ROWID |  |  |  | ROWID | Item_supp_country_loc rowid corresponding to item under cost change |
| 14 | ISCL_UNIT_COST |  |  |  | NUMERIC (20,4) | Item supplier country location unit cost |
| 15 | ISCL_PRIM_LOC_IND |  |  |  | VARCHAR (1) | Item supplier country location primary indicator |
| 16 | DEPT |  |  |  | NUMERIC (4) | Item Department Information |
| 17 | CLASS |  |  |  | NUMERIC (4) | Item Class Information |
| 18 | SUBCLASS |  |  |  | NUMERIC (4) | Item Subclass Information |
| 19 | STATUS |  |  |  | VARCHAR (1) | Item status information |
| 20 | PACK_IND |  |  |  | VARCHAR (1) | Pack indicator |
| 21 | CHILD_IND |  |  |  | VARCHAR (1) | Child indicator |
| 22 | TRAN_LEVEL_ITEM_IND |  |  |  | VARCHAR (1) | Transaction level item indicator |
| 23 | SUP_CURRENCY |  |  |  | VARCHAR (3) | Supplier currency |
| 24 | LOC_CURRENCY |  |  |  | VARCHAR (3) | Location currency |
| 25 | DELIVERY_COUNTRY_ID |  |  |  | VARCHAR (3) | Country to which the item will be delivered to. |
| 26 | NEGOTIATED_ITEM_COST |  |  |  | NUMERIC (20,4) | This will hold the supplier negotiated item cost for the primary delivery country of the item. This is a column added to help bulk processing when integrated with an external tax solution. |
| 27 | EXTENDED_BASE_COST |  |  |  | NUMERIC (20,4) | This will hold the extended base cost for the primary delivery country of the item. Extended base cost is the cost inclusive of all the taxes that affect the WAC. This is a column added to help bulk processing when integrated with an external tax solution. |
| 28 | INCLUSIVE_COST |  |  |  | NUMERIC (20,4) | This will hold the inclusive cost for the primary delivery country of the item. This cost will have both the recoverable and non recoverable taxes included. This is a column added to help bulk processing when integrated with an external tax solution. |
| 29 | BASE_COST |  |  |  | NUMERIC (20,4) | This field will hold the tax exclusive cost of the item. This is a column added to help bulk processing when integrated with an external tax solution. |

---

## Table: COST_CHG_REASON

**Description:** This table contains one row for each valid reason for which a cost change is acceptable within the company. No index is associated with this table because it contains a small number of rows.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | REASON | P |  | Y | NUMERIC (2) | Contains the number which uniquely identifies the reason for the cost change. |

---

## Table: COST_CHG_REASON_TL

**Description:** This table holds the translated descriptions of cost change reason codes in all languages.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | REASON | P | F | Y | NUMERIC (2) | Contains the number which uniquely identifies the reason for the cost change. |
| 2 | LANG | P | F | Y | NUMERIC (6) | Contains the number which uniquely identifies a language. |
| 3 | REASON_DESC |  |  | Y | VARCHAR (120 ) | Holds the description of the cost change reason code in a given language. |
| 4 | ORIG_LANG_IND |  |  | Y | VARCHAR (1 ) | Indicates if the description is in the original language entered for the cost change reason code. It is set to â€˜Yâ€™ when the first record is written to the table for the cost change reason code. |
| 5 | REVIEWED_IND |  |  | Y | VARCHAR (1 ) | Indicates if the description needs to be reviewed for translation. It is set to â€˜Nâ€™ when the description in the original language is inserted or updated. We assume that clients will regularly run reports on all strings that are not reviewed (i.e. reviewed_ind = â€˜Nâ€™). When translation either provides a new string, or OKs that the existing string is correct, the reviewed_ind should be set to â€˜Yâ€™. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30 ) | This field contains the user that created the record. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30 ) | This field contains the user that last updated the record. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COST_CHG_REASON_TL|PK||||REASON|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_CC_REASON_TL_ORIG_LANG_IND|ORIG_LANG_IND IN ('Y', 'N')<br>|
||CHK_CC_REASON_TL_REVIEWED_IND|REVIEWED_IND IN ('Y', 'N')<br>|

---

## Table: COST_COMP_EXC_LOG

**Description:** This is an exception logging table that contains the old and new values of the updates to the cost components throughtout the system. This will only contain the records where user overrides occurred before being updated by the cost component update batch program. Depending on the exception type, the details would be populated into this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | EXCEPTION_TYPE |  |  | Y | VARCHAR (2) | This field indicates the type of the exception that has been logged. The different types of exceptions are, D - Exception logged during department level upcharge mass maintenance. EP - Exception logged during Expense profile mass maintenance. IE - Exception logged during item expense mass maintenance. IA - Exception logged during item assessment mass maintenance. IU - Exception logged during item upcharge mass maintenance. OA - Exception logged during order assessment mass maintenance. OE - Exception logged during order expense mass maintenance. T - Exception logged during the mass maintenance of transfer upcharges. A - Exception logged during mass maintenance of Allocation upcharges. |
| 2 | DEPT |  |  |  | NUMERIC (4) | Contains the department number. |
| 3 | ITEM |  |  |  | VARCHAR (25) | Alphanumeric value that identifies the item. |
| 4 | PACK_ITEM |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the pack. |
| 5 | FROM_LOC |  |  |  | NUMERIC (10) | Contains the location number of the location from where goods will be transferred. This column can contain either a store or a warehouse. |
| 6 | TO_LOC |  |  |  | NUMERIC (10) | Contains the location number of the location to which goods will be transferred. This column can contain either a store or a warehouse. |
| 7 | EXP_PROF_KEY |  |  |  | NUMERIC (6) | Contains the unique number that is used to distinguish between the different profiles. |
| 8 | SUPPLIER |  |  |  | NUMERIC (10) | The unique identifier for the supplier. |
| 9 | ITEM_EXP_TYPE |  |  |  | VARCHAR (1) | Contains the type of expense. |
| 10 | ITEM_EXP_SEQ |  |  |  | NUMERIC (6) | Contains a sequence number that is used to distinguish between the differentItem/Supplier expenses. |
| 11 | HTS |  |  |  | VARCHAR (10) | The unique identifier for the Harmonized Tariff Schedule code. |
| 12 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3) | The unique identifier for the country that the item will be imported into. |
| 13 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | The country where the item was manufactured or significantly altered. |
| 14 | EFFECT_FROM |  |  |  | Date | The date from which the Item/HTS relationship is valid. This field is used to maintain historical information related to the Item/HTS relationship. |
| 15 | EFFECT_TO |  |  |  | Date | The date till which the Item/HTS relationship is valid. This field is used to maintain historical information related to the Item/HTS relationship. |
| 16 | ORDER_NO |  |  |  | NUMERIC (12) | This field contains the order number that the Assessment is attached to. |
| 17 | ORDER_LOCATION |  |  |  | NUMERIC (10) | Location on the order where the expense component is modified. |
| 18 | REASON_CODE |  |  |  | VARCHAR (6) | Contains the reason why the particular order was not updated with the new expense values. |
| 19 | TSF_NO |  |  |  | NUMERIC (12) | Contains the number that uniquely identifies the transfer within the system. |
| 20 | TSF_SEQ_NO |  |  |  | NUMERIC (8) | Contains a sequence number when combined with the transfer number references a unique record on the transfer detail table. |
| 21 | TSF_FROM_LOC |  |  |  | NUMERIC (10) | This field contains the location number of the from location for the up charge associated with the transfer detail inventory flow. This field will contain either a store or virtual warehouse number based on the FROM_LOC_TYPE field. |
| 22 | TSF_ALLOC_TO_LOC |  |  |  | NUMERIC (10) | This filed contains the location number of the to location for the up charge associated with the transfer detail inventory flow. This field will contain a store, virtual warehouse, internal finisher or external finisher based on the TO_LOC_TYPE field. |
| 23 | ALLOC_NO |  |  |  | NUMERIC (10) | Contains the number that uniquely identifies the allocation within the system. |
| 24 | ALLOC_TO_LOC |  |  |  | NUMERIC (10) | Contains the To Location on the allocation. |
| 25 | COMP_ID |  |  | Y | VARCHAR (10) | Contains a user specified code representing a specific expense or assessment. |
| 26 | OLD_COMP_RATE |  |  | Y | NUMERIC (20,4) | Contains the old rate to be charged against the calculation base. |
| 27 | OLD_COMP_CURRENCY |  |  |  | VARCHAR (3) | Contains the old currency the expense or assessment is to be entered in. |
| 28 | OLD_PER_COUNT |  |  |  | NUMERIC (12,4) | Contains the old count indicating the amount of the Per Count Unit of Measure to which the rate applies. |
| 29 | OLD_PER_COUNT_UOM |  |  |  | VARCHAR (4) | Contains the old unit of measure in which the Per Count is specified. |
| 30 | NEW_COMP_RATE |  |  | Y | NUMERIC (20,4) | Contains the new rate to be charged against the calculation base. |
| 31 | NEW_COMP_CURRENCY |  |  |  | VARCHAR (3) | Contains the new currency the expense or assessment is to be entered in. |
| 32 | NEW_PER_COUNT |  |  |  | NUMERIC (12,4) | Contains the new count indicating the amount of the Per Count Unit of Measure to which the rate applies. |
| 33 | NEW_PER_COUNT_UOM |  |  |  | VARCHAR (4) | Contains the new unit of measure in which the Per Count is specified. |
| 34 | CREATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most created this record. |
| 35 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. |
| 36 | LOCATION |  |  |  | NUMERIC (10) | This columns store the order location. |

---

## Table: COST_COMP_UPD_STG

**Description:** This is a new staging table that will hold cost component changes made on the expense, assessment and upcharge screens, that have to be defaulted to other entities.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO |  |  | Y | NUMERIC (12) | Sequence number for the cost components updates. |
| 2 | DEFAULTING_LEVEL |  |  | Y | VARCHAR (1) | Defaulting level for the cost component change. It represents the at which level the cost component change was made. Valid values are E - Expense Component Level, C - Country level, S - Supplier level, P - Partner level, D - Dept level, I - Item level. |
| 3 | COMP_ID |  |  | Y | VARCHAR (10) | Contains a unique user specified code representing the cost Component. |
| 4 | COMP_TYPE |  |  | Y | VARCHAR (1) | Contains a code used to distinguish between Expenses, Assessments, and Up Charges. |
| 5 | EXPENSE_TYPE |  |  |  | VARCHAR (6) | This field will be populated only when the component type is Expense and it defines the type of the expense |
| 6 | EXP_PROF_KEY |  |  |  | NUMERIC (6) | Contains the unique number that is used to distinguish between the different profiles. |
| 7 | DEPT |  |  |  | NUMERIC (4) | Contains the department number. |
| 8 | ITEM |  |  |  | VARCHAR (25) | Alphanumeric value that identifies the item. |
| 9 | SUPPLIER |  |  |  | NUMERIC (10) | The unique identifier for the supplier. |
| 10 | ITEM_EXP_TYPE |  |  |  | VARCHAR (1) | Contains the type of expense. |
| 11 | ITEM_EXP_SEQ |  |  |  | NUMERIC (6) | Contains a sequence number that is used to distinguish between the differentItem/Supplier expenses. |
| 12 | HTS |  |  |  | VARCHAR (10) | The unique identifier for the Harmonized Tariff Schedule code. |
| 13 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3) | The unique identifier for the country that the item will be imported into. |
| 14 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | The country where the item was manufactured or significantly altered. |
| 15 | EFFECT_FROM |  |  |  | Date | The date from which the Item/HTS relationship is valid. This field is used to maintain historical information related to the Item/HTS relationship. |
| 16 | EFFECT_TO |  |  |  | Date | The date till which the Item/HTS relationship is valid. This field is used to maintain historical information related to the Item/HTS relationship. |
| 17 | FROM_LOC |  |  |  | NUMERIC (10) | Contains the location number of the location from which goods will be transferred. This column can contain either a store or a warehouse. |
| 18 | TO_LOC |  |  |  | NUMERIC (10) | Contains the location number of the location to which goods will be transferred. This column can contain either a store or a warehouse. |
| 19 | OLD_COMP_RATE |  |  | Y | NUMERIC (20,4) | Contains the old rate to be charged against the calculation base. |
| 20 | OLD_COMP_CURRENCY |  |  |  | VARCHAR (3) | Contains the old currency the expense or assessment is to be entered in. |
| 21 | OLD_PER_COUNT |  |  |  | NUMERIC (12,4) | Contains the old count indicating the amount of the Per Count Unit of Measure to which the rate applies. |
| 22 | OLD_PER_COUNT_UOM |  |  |  | VARCHAR (4) | Contains the old unit of measure in which the Per Count is specified. |
| 23 | NEW_COMP_RATE |  |  | Y | NUMERIC (20,4) | Contains the new rate to be charged against the calculation base. |
| 24 | NEW_COMP_CURRENCY |  |  |  | VARCHAR (3) | Contains the new currency the expense or assessment is to be entered in. |
| 25 | NEW_PER_COUNT |  |  |  | NUMERIC (12,4) | Contains the new count indicating the amount of the Per Count Unit of Measure to which the rate applies. |
| 26 | NEW_PER_COUNT_UOM |  |  |  | VARCHAR (4) | Contains the new unit of measure in which the Per Count is specified. |
| 27 | CNTRY_DEFAULT_IND |  |  | Y | VARCHAR (1) | Indicator to specify if this cost component change is to be cascaded to countries. |
| 28 | SUPP_DEFAULT_IND |  |  | Y | VARCHAR (1) | Indicator to specify if this cost component change is to be cascaded to suppliers. |
| 29 | PTNR_DEFAULT_IND |  |  | Y | VARCHAR (1) | Indicator to specify if this cost component change is to be cascaded to partners. |
| 30 | ITEM_DEFAULT_IND |  |  | Y | VARCHAR (1) | Indicator to specify if this cost component change is to be cascaded to items. |
| 31 | ORDER_DEFAULT_IND |  |  | Y | VARCHAR (1) | Indicator to specify if this cost component change is to be cascaded to orders. |
| 32 | TSF_ALLOC_DEFAULT_IND |  |  | Y | VARCHAR (1) | Indicator to specify if this cost component change is to be cascaded to transfers and allocations |
| 33 | DEPT_DEFAULT_IND |  |  | Y | VARCHAR (1) | Indicator to specify if this cost component change is to be cascaded to departments. |
| 34 | ZONE_ID |  |  |  | NUMERIC (10) | Contains the zone identification number which uniquely identifies the zone. Ifthe level of the zone group is store, then the zone will be the store number. Thisfield will only have a value for zone level expenses. |
| 35 | ZONE_GROUP_ID |  |  |  | NUMERIC (4) | This field contains the zone group ID for which the profile or the items expense belongs to. This field will only have a value for zone level expenses. |
| 36 | EXCHANGE_RATE |  |  |  | NUMERIC (20,10) | This field contains the exchange between the old and new component currencies. |
| 37 | EFFECTIVE_DATE |  |  | Y | Date | The date from which the new values are effective in the system. If the defaulting level is I then the date is equal to the vdate |
| 38 | LADING_PORT |  |  |  | VARCHAR (5) | Contains the identification of the Landed Cost lading port.This field will only contain a value if the Expense Type is Country |
| 39 | DISCHARGE_PORT |  |  |  | VARCHAR (5) | Contains the identification of the discharge port where item is entering the country |

---

## Table: COST_COM_GTT

**Description:** This table will act as a helper table for future cost engine while applying the cost buildup templates to franchise stores.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Holds the item for record on future cost |
| 2 | SUPPLIER |  |  |  | NUMERIC (10) | Holds the supplier for record on future cost |
| 3 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | Holds the origin country for record on future cost |
| 4 | LOCATION |  |  |  | NUMERIC (10) | Holds the location for record on future cost |
| 5 | ACTIVE_DATE |  |  |  | Date | Holds the active date for record on future cost |
| 6 | TEMPL_ID |  |  |  | NUMERIC (10) | Holds the template id for record on future cost |
| 7 | COMP_ID |  |  |  | VARCHAR (10) | Holds the component id attached to the template for record on future cost |
| 8 | COMP_RATE |  |  |  | NUMERIC (20,4) | Holds the component rate for the component id attached to the template for record on future cost |
| 9 | PER_COUNT_UOM |  |  |  | VARCHAR (4) | Holds the per count uom for the component id attached to the template for record on future cost |
| 10 | PER_COUNT |  |  |  | NUMERIC (12,4) | Holds the per count for component id attached to the template for record on future cost |
| 11 | VALUE |  |  |  | NUMERIC (20,4) | Holds the value for component id attached to the template for record on future cost |
| 12 | EXCHANGE_RATE |  |  |  | NUMERIC (20,10) | Holds the exchange rate for component id attached to the template for record on future cost |

---

## Table: COST_COM_TEMP

**Description:** This table is used for processing of future cost engine.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Holds the item for record on future cost |
| 2 | SUPPLIER |  |  |  | NUMERIC (10) | Holds the supplier for record on future cost |
| 3 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | Holds the origin country for record on future cost |
| 4 | LOCATION |  |  |  | NUMERIC (10) | Holds the location for record on future cost |
| 5 | ACTIVE_DATE |  |  |  | Date | Holds the active date for record on future cost |
| 6 | TEMPL_ID |  |  |  | NUMERIC (10) | Holds the template id for record on future cost |
| 7 | COMP_ID |  |  |  | VARCHAR (10) | Holds the component id attached to the template for record on future cost |
| 8 | COMP_RATE |  |  |  | NUMERIC (20,4) | Holds the component rate for the component id attached to the template for record on future cost |
| 9 | PER_COUNT_UOM |  |  |  | VARCHAR (4) | Holds the per count uom for the component id attached to the template for record on future cost |
| 10 | PER_COUNT |  |  |  | NUMERIC (12,4) | Holds the per count for component id attached to the template for record on future cost |
| 11 | VALUE |  |  |  | NUMERIC (20,4) | Holds the value for component id attached to the template for record on future cost |
| 12 | EXCHANGE_RATE |  |  |  | NUMERIC (20,10) | Holds the exchange rate for component id attached to the template for record on future cost |

---

## Table: COST_EVENT

**Description:** Holds cost event records used to drive the real time costing engine.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID | P |  | Y | NUMERIC (15) | The unique identifier of the cost event. |
| 2 | ACTION |  |  | Y | VARCHAR (3) | The action that caused the cost event to be generated. Options are: ADD, REM, and MOD. |
| 3 | EVENT_TYPE |  |  | Y | VARCHAR (3) | The type of the cost event.Options are: SC for supplier cost events, NIL for new item locations, PP for primary pack change cost events, CC for cost change cost events, R for reclassification cost events, D for deal cost events, MH for merchandise hierarchy cost events, OH for organizational hierarchy cost events, CZ for cost zone cost events, ELC for estimated cost cost events, SH for supplier hierarchy cost events, ICZ item cost zone group cost events, DP for Deal Pass through percentage events, TMP for franchise cost template events |
| 4 | PERSIST_IND |  |  | Y | VARCHAR (1) | The persist_ind controls whether the results of the cost engine calculations will be pushed back to the future_cost table or to the future_cost_workspace table. The workspace table is used to see the impact of a cost event before taking the action. |
| 5 | USER_ID |  |  | Y | VARCHAR (30) | The user that created the cost event. |
| 6 | CREATE_DATETIME |  |  | Y | Date | The date and time that the cost event record was created. |
| 7 | OVERRIDE_RUN_TYPE |  |  |  | VARCHAR (5) | his column will handle future cost overrides at the cost event level. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COST_EVENT|PK||||COST_EVENT_PROCESS_ID|ASC|

---

## Table: COST_EVENT_CL

**Description:** Holds the cost event related details of the event related to the change of costing location of franchise store.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID |  |  | Y | NUMERIC (15) | The unique identifier of the cost event |
| 2 | ITEM |  |  | Y | VARCHAR (25) | Holds item associated to the affected franchise location whose costing location is updated. |
| 3 | FRANCHISE_LOC |  |  | Y | NUMERIC (10) | Holds the franchise store whose costing location is updated |
| 4 | COSTING_LOC |  |  | Y | NUMERIC (10) | Holds the new costing location for the franchise store |
| 5 | COST_LOC_CHANGE_DATE |  |  | Y | Date | Holds the date when the cost location of the franchise store changed |

---

## Table: COST_EVENT_COST_CHG

**Description:** Holds the cost changes associated to the cost event.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID | P |  | Y | NUMERIC (15) | The unique identifier of the cost event. |
| 2 | COST_CHANGE | P |  | Y | NUMERIC (8) | Holds the cost change associated to the cost event. |
| 3 | SRC_TMP_IND |  |  | Y | VARCHAR (1) | Sourcing Cost Change details from temporary tables indicator. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COST_EVENT_COST_CHG|PK||||COST_EVENT_PROCESS_ID|ASC|
||||||COST_CHANGE|ASC|

---

## Table: COST_EVENT_COST_RELATIONSHIP

**Description:** This table holds a cost event related to a cost relation change that would require recalculation of the future cost.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID |  |  | Y | NUMERIC (15) | The unique identifier of the cost event. |
| 2 | DEPT |  |  | Y | NUMERIC (4) | The DEPT associated with the relationship. |
| 3 | CLASS |  |  | Y | NUMERIC (4) | The CLASS associated with the relationship. |
| 4 | SUBCLASS |  |  | Y | NUMERIC (4) | The SUBCLASS associated with the relationship. |
| 5 | LOCATION |  |  | Y | NUMERIC (10) | The LOCATION associated with the relationship. |
| 6 | OLD_START_DATE |  |  |  | Date | The OLD_START_DATE associated with the relationship. |
| 7 | NEW_START_DATE |  |  |  | Date | The new START_DATE associated with the relationship. |
| 8 | OLD_END_DATE |  |  |  | Date | The OLD_END_DATE associated with the relationship. |
| 9 | NEW_END_DATE |  |  |  | Date | The new END_DATE associated with the relationship. |
| 10 | TEMPL_ID |  |  |  | NUMERIC (10) | This holds the cost templated id which has been updated. |
| 11 | ITEM |  |  |  | VARCHAR (25) | Holds item associated to new item/location event. |

---

## Table: COST_EVENT_COST_TMPL

**Description:** Holds the template id and cost_event_process_id for which margin_pct or first_applied has been modified

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID | P |  | Y | NUMERIC (15) | The unique identifier of the cost event. |
| 2 | TEMPL_ID | P |  | Y | NUMERIC (10) | Holds the template_id for which margin_pct or first_applied or component has been modified |

---

## Table: COST_EVENT_COST_ZONE

**Description:** Holds required details for the cost zone change cost event.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID | P |  | Y | NUMERIC (15) | The unique identifier of the cost event. |
| 2 | LOCATION | P |  | Y | NUMERIC (10) | Holds the location associated to the cost zone change event. |
| 3 | ZONE_GROUP_ID | P |  | Y | NUMERIC (4) | Holds the zone group ID associated to the cost zone change event. |
| 4 | OLD_ZONE_ID | P |  | Y | NUMERIC (10) | Holds the old zone ID associated to the cost zone change event. |
| 5 | NEW_ZONE_ID |  |  | Y | NUMERIC (10) | Holds the new zone ID associated to the cost zone change event. |

---

## Table: COST_EVENT_DEAL

**Description:** Holds the deal IDs associated to the deal cost event.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID | P |  | Y | NUMERIC (15) | The unique identifier of the cost event. |
| 2 | DEAL_ID | P |  | Y | NUMERIC (10) | Holds the deal ID associated to the deal cost event. |

---

## Table: COST_EVENT_DEAL_PASSTHRU

**Description:** Holds the dealpassthru percent associated to the dealpassthru event.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID | P |  | Y | NUMERIC (15) | The unique identifier of the cost event. |
| 2 | DEPT | P |  | Y | NUMERIC (4) | The dept associated with the deal_passthru. |
| 3 | SUPPLIER | P |  | Y | NUMERIC (10) | The supplier associated with the deal_passthru. |
| 4 | LOCATION | P |  | Y | NUMERIC (10) | The location associated with the deal_passthru. |
| 5 | LOC_TYPE |  |  | Y | VARCHAR (1) | The location type of the location associated with the deal_passthru. |
| 6 | COSTING_LOC | P |  | Y | NUMERIC (10) | This field contains the source warehouse for the franchise store applicable for the deal passthru. |
| 7 | PASSTHRU_PCT |  |  | Y | NUMERIC (12,4) | The passthru percent defined at the warehouse. |

---

## Table: COST_EVENT_ELC

**Description:** Holds the item, supplier, origin country id, cost zone group and cost zone combinations associated to the estimated landing cost event.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID |  |  | Y | NUMERIC (10) | The unique identifier of the cost event. |
| 2 | ITEM |  |  | Y | VARCHAR (25) | Holds the item associated to the ELC cost event. |
| 3 | SUPPLIER |  |  | Y | NUMERIC (10) | Holds the supplier associated to the ELC cost event. |
| 4 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | Holds the origin country ID associated to the ELC cost event. |
| 5 | COST_ZONE_GROUP |  |  |  | NUMERIC (4) | Holds the cost zone group associated to the ELC cost event. |
| 6 | COST_ZONE |  |  |  | NUMERIC (10) | Holds the cost zone associated to the ELC cost event. |

---

## Table: COST_EVENT_ITEM_COST_ZONE

**Description:** Holds the items associated to the cost zone change event.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID | P |  | Y | NUMERIC (15) | The unique identifier of the cost event. |
| 2 | ITEM | P |  | Y | VARCHAR (25) | Holds the item associated to the cost zone change event. |

---

## Table: COST_EVENT_MERCH_HIER

**Description:** Holds the old and new hierarchy associated to the merchandise hierarchy change event.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID | P |  | Y | NUMERIC (15) | The unique identifier of the cost event. |
| 2 | OLD_DIVISION |  |  |  | NUMERIC (4) | Holds the old division associated to the merchandise hierarchy change event. |
| 3 | OLD_GROUP_NO | P |  | Y | NUMERIC (4) | Holds the old group number associated to the merchandise hierarchy change event. |
| 4 | NEW_DIVISION |  |  |  | NUMERIC (4) | Holds the new division associated to the merchandise hierarchy change event. |
| 5 | NEW_GROUP_NO |  |  | Y | NUMERIC (4) | Holds the new group number associated to the merchandise hierarchy change event. |
| 6 | DEPT |  |  |  | NUMERIC (4) | Holds the dept associated to the merchandise hierarchy change event. |

---

## Table: COST_EVENT_NIL

**Description:** Holds the new item/location details associated to new item/location event.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID | P |  | Y | NUMERIC (15) | The unique identifier of the cost event. |
| 2 | ITEM | P |  | Y | VARCHAR (25) | Holds item associated to new item/location event. |
| 3 | LOCATION | P |  | Y | NUMERIC (10) | Holds location associated to new item/location event. |
| 4 | LOC_TYPE |  |  | Y | VARCHAR (1) | Holds location type associated to new item/location event. |
| 5 | DIVISION |  |  | Y | NUMERIC (4) | Holds divison associated to new item/location event. |
| 6 | GROUP_NO |  |  | Y | NUMERIC (4) | Holds group number associated to new item/location event. |
| 7 | DEPT |  |  | Y | NUMERIC (4) | Holds dept associated to new item/location event. |
| 8 | CLASS |  |  | Y | NUMERIC (4) | Holds class associated to new item/location event. |
| 9 | SUBCLASS |  |  | Y | NUMERIC (4) | Holds subclass associated to new item/location event. |
| 10 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | Holds item grandparent associated to new item/location event. |
| 11 | ITEM_PARENT |  |  |  | VARCHAR (25) | Holds item parent associated to new item/location event. |
| 12 | DIFF_1 |  |  |  | VARCHAR (10) | Holds diff 1 value associated to new item/location event. |
| 13 | DIFF_2 |  |  |  | VARCHAR (10) | Holds diff 2 value associated to new item/location event. |
| 14 | DIFF_3 |  |  |  | VARCHAR (10) | Holds diff 3 value associated to new item/location event. |
| 15 | DIFF_4 |  |  |  | VARCHAR (10) | Holds diff 4 value associated to new item/location event. |
| 16 | CHAIN |  |  |  | NUMERIC (10) | Holds chain associated to new item/location event. |
| 17 | AREA |  |  |  | NUMERIC (10) | Holds area associated to new item/location event. |
| 18 | REGION |  |  |  | NUMERIC (10) | Holds region associated to new item/location event. |
| 19 | DISTRICT |  |  |  | NUMERIC (10) | Holds district associated to new item/location event. |
| 20 | SIMPLE_PACK_IND |  |  |  | VARCHAR (1) | Holds simple pack indicator associated to new item/location event. |
| 21 | STORE_TYPE |  |  |  | VARCHAR (1) | Holds the type of the store when the location type is store. Valid values are:F- Franchise, C- Company |
| 22 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 23 | CREATE_DATETIME |  |  | Y | Date | This column holds the date time the record was created. |

---

## Table: COST_EVENT_ORG_HIER

**Description:** Holds the organization hierarchy levels combinations associated to organization hierarchy changes event.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID | P |  | Y | NUMERIC (15) | The unique identifier of the cost event. |
| 2 | OLD_CHAIN |  |  |  | NUMERIC (10) | Holds the old chain associated to organization hierarchy changes event. |
| 3 | OLD_AREA |  |  |  | NUMERIC (10) | Holds the old chain associated to organization hierarchy changes event. |
| 4 | OLD_REGION |  |  |  | NUMERIC (10) | Holds the old region associated to organization hierarchy changes event. |
| 5 | OLD_DISTRICT |  |  |  | NUMERIC (10) | Holds the old district associated to organization hierarchy changes event. |
| 6 | NEW_CHAIN |  |  |  | NUMERIC (10) | Holds the new chain associated to organization hierarchy changes event. |
| 7 | NEW_AREA |  |  |  | NUMERIC (10) | Holds the new area associated to organization hierarchy changes event. |
| 8 | NEW_REGION |  |  |  | NUMERIC (10) | Holds the new region associated to organization hierarchy changes event. |
| 9 | NEW_DISTRICT |  |  |  | NUMERIC (10) | Holds the new district associated to organization hierarchy changes event. |
| 10 | LOCATION |  |  |  | NUMERIC (10) | Holds the store associated to organization hierarchy changes event. |

---

## Table: COST_EVENT_PRIM_PACK

**Description:** Holds the item, location, pack number combinations associated to the primary cost pack change event.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID | P |  | Y | NUMERIC (15) | The unique identifier of the cost event. |
| 2 | ITEM | P |  | Y | VARCHAR (25) | Holds the item associated to the primary cost pack change event. |
| 3 | LOCATION | P |  | Y | NUMERIC (10) | Holds the location associated to the primary cost pack change event. |
| 4 | PACK_NO |  |  |  | VARCHAR (25) | Holds the pack number associated to the primary cost pack change event. |

---

## Table: COST_EVENT_RECLASS

**Description:** Holds the reclass numbers associated to the reclass cost event.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID | P |  | Y | NUMERIC (15) | The unique identifier of the cost event. |
| 2 | RECLASS_NO | P |  | Y | NUMERIC (4) | Holds the reclass number associated to the reclass cost event. |
| 3 | RECLASS_DATE |  |  |  | Date | Holds the date associated with the reclass cost event. |
| 4 | ITEM | P |  | Y | VARCHAR (25) | Holds the item associated with the reclass cost event. |
| 5 | TO_DEPT |  |  |  | NUMERIC (4) | Holds the department the item is reclassified to. |
| 6 | TO_CLASS |  |  |  | NUMERIC (4) | Holds the class the item is reclassified to. |
| 7 | TO_SUBCLASS |  |  |  | NUMERIC (4) | Holds the subclass the item is reclassified to. |

---

## Table: COST_EVENT_RESULT

**Description:** Holds the thread status associated to a cost event. The status can be N-new, E-error or C-complete. The error message that was generated from a thread failure will be held here. Additional records are created each time a thread for a cost event is reprocessed. The ATTEMPT_NUM column tracks the iteration when reprocessing.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID | P |  | Y | NUMERIC (15) | The unique identifier of the cost event. |
| 2 | THREAD_ID | P |  | Y | NUMERIC (10) | The thread number associated to the cost event. |
| 3 | ATTEMPT_NUM | P |  | Y | NUMERIC (10) | The reprocessing iteration of a cost event thread. |
| 4 | STATUS |  |  | Y | VARCHAR (1) | The status of the cost event thread. Options are: N-new, E-error, R-reprocessing and C-complete. |
| 5 | RETRY_USER_ID |  |  |  | VARCHAR (30) | The user that retried the cost event. |
| 6 | ERROR_MESSAGE |  |  |  | VARCHAR (255) | The error message associated to the failed thread. |
| 7 | CREATE_DATETIME |  |  | Y | Date | The date and time that the cost_event_result row was written. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COST_EVENT_RESULT|PK||||COST_EVENT_PROCESS_ID|ASC|
||||||THREAD_ID|ASC|
||||||ATTEMPT_NUM|ASC|

---

## Table: COST_EVENT_RETAIL_CHANGE

**Description:** This tables holds the items and associated templates for which the unit retail is changed.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID | P |  | Y | NUMERIC (15) | The unique identifier of the cost event. |
| 2 | ITEM | P |  | Y | VARCHAR (25) | Holds the item associated with the price cha |
| 3 | LOC | P |  | Y | NUMERIC (10) | Holds the location associated with the price cha |
| 4 | LOC_TYPE | P |  | Y | VARCHAR (1) | Holds the location type of the location associated with the price cha |
| 5 | UNIT_RETAIL |  |  | Y | NUMERIC (20,4) | Holds the unit retail of the item at the location associated with the price cha |
| 6 | MARGIN_PCT |  |  | Y | NUMERIC (12,4) | Holds the margin percent of the template associated with the price change |
| 7 | TEMPL_ID | P |  | Y | NUMERIC (10) | Holds the unit retail of the item at the location associated with the price cha |
| 8 | START_DATE | P |  | Y | Date | Holds the starting date of the price change event. |
| 9 | END_DATE | P |  | Y | Date | Holds the end date of the price change event. |

---

## Table: COST_EVENT_RUN_TYPE_CNFG_TL

**Description:** This is the translation table for COST_EVENT_RUN_TYPE_CONFIG table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | EVENT_TYPE | P | F | Y | VARCHAR (3) | The type of the cost event. Options are: SC for supplier cost events, NIL for new item locations, PP for primary pack change cost events, CC for cost change cost events, R for reclassification cost events, D for deal cost events, MH for merchandise hierarchy cost events, OH for organizational hierarchy cost events, CZ for cost zone cost events, ELC for estimated cost cost events, SH for supplier hierarchy cost events, ICZ item cost zone group cost events |
| 3 | EVENT_DESC |  |  | Y | VARCHAR (255) | Holds the description of the cost event types. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COST_EVENT_RUN_TYPE_CNFG_TL|PK||||LANG|ASC|
||||||EVENT_TYPE|ASC|

---

## Table: COST_EVENT_RUN_TYPE_CONFIG

**Description:** Holds configuration information for each cost event type.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | EVENT_TYPE | P |  | Y | VARCHAR (3) | The type of the cost event. Options are: SC for supplier cost events, NIL for new item locations, PP for primary pack change cost events, CC for cost change cost events, R for reclassification cost events, D for deal cost events, MH for merchandise hierarchy cost events, OH for organizational hierarchy cost events, CZ for cost zone cost events, ELC |
| 2 | EVENT_DESC |  |  | Y | VARCHAR (255) | Holds the description of the cost event types. |
| 3 | EVENT_RUN_TYPE |  |  | Y | VARCHAR (5) | Holds the cost event run type. The future cost engine can run cost event in three different types, asynchrony, synchrony, or batch. |
| 4 | MAX_TRAN_SIZE |  |  | Y | NUMERIC (6) | The maximum size of event threads |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COST_EVENT_RUN_TYPE_CONFIG|PK||||EVENT_TYPE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CST_EVT_RN_TY_CO_EVT_RN_TYPE|EVENT_RUN_TYPE in ('SYNC', 'ASYNC','BATCH')<br>|
|Column Level|EVENT_RUN_TYPE||

---

## Table: COST_EVENT_SUPP_COUNTRY

**Description:** Holds the item, location, supplier, and origin country ID combinations associated to the supplier/origin country event.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID | P |  | Y | NUMERIC (15) | The unique identifier of the cost event. |
| 2 | ITEM | P |  | Y | VARCHAR (25) | Holds the item associated to the supplier/origin country cost event. |
| 3 | LOCATION | P |  | Y | NUMERIC (10) | Holds the location associated to the supplier/origin country cost event. |
| 4 | SUPPLIER | P |  | Y | NUMERIC (10) | Holds the supplier associated to the supplier/origin country cost event. |
| 5 | ORIGIN_COUNTRY_ID | P |  | Y | VARCHAR (3) | Holds the origin country ID associated to the supplier/origin country cost event. |

---

## Table: COST_EVENT_SUPP_HIER

**Description:** Holds the item, supplier, origin country ID, location, and supplier hierarchy levels combinations associated to supplier hierarchy changes event.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID | P |  | Y | NUMERIC (15) | The unique identifier of the cost event. |
| 2 | ITEM | P |  | Y | VARCHAR (25) | Holds the item associated to the supplier hierarchy change event. |
| 3 | SUPPLIER | P |  | Y | NUMERIC (10) | Holds the supplier associated to the supplier hierarchy change event. |
| 4 | ORIGIN_COUNTRY_ID | P |  | Y | VARCHAR (3) | Holds the origin country ID associated to the supplier hierarchy change event. |
| 5 | LOCATION | P |  | Y | NUMERIC (10) | Holds the location associated to the supplier hierarchy change event. |
| 6 | OLD_SUPP_HIER_LVL_1 |  |  |  | VARCHAR (10) | Holds the old supplier hierarchy level 1 associated to the supplier hierarchy change event. |
| 7 | OLD_SUPP_HIER_LVL_2 |  |  |  | VARCHAR (10) | Holds the old supplier hierarchy level 2 associated to the supplier hierarchy change event. |
| 8 | OLD_SUPP_HIER_LVL_3 |  |  |  | VARCHAR (10) | Holds the old supplier hierarchy level 3 associated to the supplier hierarchy change event. |
| 9 | NEW_SUPP_HIER_LVL_1 |  |  |  | VARCHAR (10) | Holds the new supplier hierarchy level 1 associated to the supplier hierarchy change event. |
| 10 | NEW_SUPP_HIER_LVL_2 |  |  |  | VARCHAR (10) | Holds the new supplier hierarchy level 2 associated to the supplier hierarchy change event. |
| 11 | NEW_SUPP_HIER_LVL_3 |  |  |  | VARCHAR (10) | Holds the new supplier hierarchy level 3 associated to the supplier hierarchy change event. |

---

## Table: COST_EVENT_TAX_RECALC

**Description:** This table holds the tax recalculation requests associated to the cost event.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID | P |  | Y | NUMERIC (15) | The unique identifier for the cost event. |
| 2 | TAX_RECALC_ID | P |  | Y | NUMERIC (18) | Holds the tax recalculation id associated to the cost event. |

---

## Table: COST_EVENT_THREAD

**Description:** Holds the item, supplier, origin country id and location combinations associated to a cost event. Also contains the thread number that is used by the future cost engine.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID | P |  | Y | NUMERIC (15) | The unique identifier of the cost event. |
| 2 | ITEM | P |  | Y | VARCHAR (25) | Holds the item associated to the cost event. |
| 3 | DEAL_BUY_ITEM |  |  |  | VARCHAR (25) | Holds the buy item in buy one get one deals. Used by the threading logic to ensure that the buy item and get items on a deal are on the same thread. |
| 4 | SUPPLIER | P |  | Y | NUMERIC (10) | Holds the supplier associated to the cost event. |
| 5 | ORIGIN_COUNTRY_ID | P |  | Y | VARCHAR (3) | Holds the origin country id associated to the cost event. |
| 6 | LOCATION | P |  | Y | NUMERIC (10) | Holds the location associated to the cost event. Can be a store or a warehouse. |
| 7 | THREAD_ID | P |  | Y | NUMERIC (10) | Holds the thread number of the item, supplier, country id, location combination. |
| 8 | STORE_TYPE |  |  |  | VARCHAR (1) | Holds the store type if the location is a store. Valid values are:F- Franchise, C -Company |

---

## Table: COST_SUSP_SUP_DETAIL

**Description:** This table holds the detail SKU/Supplier cost event records.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_CHANGE |  | F | Y | NUMERIC (8) | Contains the number which uniquely identifies the cost change. |
| 2 | SUPPLIER |  | F | Y | NUMERIC (10) | Contains the number which identifies the supplier associated with the cost change. |
| 3 | ORIGIN_COUNTRY_ID |  | F | Y | VARCHAR (3) | The country where the item was manufactured or significantly altered. |
| 4 | ITEM |  | F | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item |
| 5 | BRACKET_VALUE1 |  |  |  | NUMERIC (12,4) | The values are the various levels in the vendor price list whereby costing of the items will be affected as the levels are achieved on the Purchase Orders. |
| 6 | BRACKET_UOM1 |  |  |  | VARCHAR (4) | The unit of mesaure defining each value in a bracket. All values within a bracket have the same UOM. |
| 7 | BRACKET_VALUE2 |  |  |  | NUMERIC (12,4) | This column will contain the value of the secondary bracket. |
| 8 | UNIT_COST |  |  | Y | NUMERIC (20,4) | Contains the new unit cost which will be implemented as a result of the cost change. This field is stored in the suppliers currency. |
| 9 | COST_CHANGE_TYPE |  |  |  | VARCHAR (2) | Describes the type of cost change |
| 10 | COST_CHANGE_VALUE |  |  |  | NUMERIC (20,4) | Holds the value of cost_change |
| 11 | RECALC_ORD_IND |  |  | Y | VARCHAR (1) | This field indicates whether or not approved order costs should be re-calculated when a supplier cost has changed. Valid values are: Y - Yes, recalculate order, N - No, do no recalculate order |
| 12 | DEFAULT_BRACKET_IND |  |  | Y | VARCHAR (1) | This field contains the value which will control which cost is the base cost for processing throughout the system. Each bracket group (either by supplier, supplier/department, supplier/department/location, supplier/location) must have one bracket defined as the default bracket. |
| 13 | DEPT |  |  |  | NUMERIC (4) | Contains the number which uniquely identifies the department. This field is only populated from the supplier bracket costing dialogue when bracket inserts or default bracket changes involved the department level. |
| 14 | SUP_DEPT_SEQ_NO |  |  |  | NUMERIC (10) | This field will contain the supplier department sequence number. |
| 15 | DELIVERY_COUNTRY_ID |  |  |  | VARCHAR (3) | Country to which the item will be delivered to. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|UK_COST_SUSP_SUP_DETAIL|UK||||ORIGIN_COUNTRY_ID|ASC|
||||||BRACKET_VALUE1|ASC|
||||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||COST_CHANGE|ASC|
||||||DELIVERY_COUNTRY_ID|ASC|
|COST_SUSP_SUP_DETAIL_I3|||||SUP_DEPT_SEQ_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|COST_SUSP_SUP_DETAIL_I2|||||COST_CHANGE|ASC|
|COST_SUSP_SUP_DETAIL_I1|||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_COST_SUSP_DTL_DEF_BRK_IND|DEFAULT_BRACKET_IND IN ('Y','N')<br>|
||CHK_COST_SUSP_DTL_RECALC_ORD|RECALC_ORD_IND IN ('Y','N')<br>|
|Column Level|RECALC_ORD_IND||
||DEFAULT_BRACKET_IND||

---

## Table: COST_SUSP_SUP_DETAIL_LOC

**Description:** This table contains all locations that an item/supplier/country cost change applies to. If no records exist on this table for a cost change, the cost change is assumed to apply to all item/location records for which an item/location relationship exists.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_CHANGE |  |  | Y | NUMERIC (8) | Contains the number which uniquely identifies the cost change. |
| 2 | SUPPLIER |  | F | Y | NUMERIC (10) | Contains the number which identifies the supplier associated with the cost change. |
| 3 | ORIGIN_COUNTRY_ID |  | F | Y | VARCHAR (3) | The country where the item was manufactured or significantly altered. |
| 4 | ITEM |  | F | Y | VARCHAR (25) | Unique alphanumeric value that identifies the item. |
| 5 | LOC_TYPE |  |  | Y | VARCHAR (1) | Contains the type of the location. Valid values are Store and Warehouse. |
| 6 | LOC |  | F | Y | NUMERIC (10) | Number of the location the cost change will occur at. This can represent a store or a warehouse Cost changes will be managed and stored at the physical warehouse level since the unit cost must remain consistant across all virtual warehouses within the same physical warehouse. The sccext batch program will handle blowing the cost change down to all virtual warehouses that reside on the physical warehouse stored on this table. |
| 7 | BRACKET_VALUE1 |  |  |  | NUMERIC (12,4) | The values are the various levels in the vendors price list whereby costing of the items will be affected as the levels are achieved on Purchase Orders. |
| 8 | BRACKET_UOM1 |  |  |  | VARCHAR (4) | The unit of measure defining each value in a bracket. All values within a bracket have the same UOM. |
| 9 | BRACKET_VALUE2 |  |  |  | NUMERIC (12,4) | This column will contain the value of the secondary bracket. |
| 10 | UNIT_COST |  |  | Y | NUMERIC (20,4) | Contains the new unit cost for the specified item/location. |
| 11 | COST_CHANGE_TYPE |  |  |  | VARCHAR (2) | Describes the type of cost change |
| 12 | COST_CHANGE_VALUE |  |  |  | NUMERIC (20,4) | Holds the value of cost change |
| 13 | RECALC_ORD_IND |  |  | Y | VARCHAR (1) | This field indicates whether or not approved order costs should be re-calculated when a supplier cost has changed. Valid values are: Y - Yes, recalculate order, N - No, do no recalculate order |
| 14 | DEFAULT_BRACKET_IND |  |  | Y | VARCHAR (1) | This field contains the value which will control which cost is the base cost for processing throughout the system. Each bracket group (either by supplier, supplier/department, supplier/department/location, supplier/location) must have one bracket defined as the default bracket. |
| 15 | DEPT |  |  |  | NUMERIC (4) | Contains the number which uniquely identifies the department. This field is only populated from the supplier bracket costing dialogue when bracket inserts or default bracket changes involved the department level. |
| 16 | SUP_DEPT_SEQ_NO |  |  |  | NUMERIC (10) | This field will contain the supplier department sequence number. |
| 17 | DELIVERY_COUNTRY_ID |  |  |  | VARCHAR (3) | DELIVERY_COUNTRY_ID |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|UK_COST_SUSP_SUP_DETAIL_LOC|UK||||COST_CHANGE|ASC|
||||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
||||||LOC|ASC|
||||||BRACKET_VALUE1|ASC|
|COST_SUSP_SUP_DETAIL_LOC_I2|||||SUP_DEPT_SEQ_NO|ASC|
|COST_SUSP_SUP_DETAIL_LOC_I1|||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
||||||LOC|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_COST_SUSP_DTL_LOC_DF_BR_ID|DEFAULT_BRACKET_IND IN ('Y','N')<br>|
||CHK_COST_SUSP_DTL_LOC_LOC_TYPE|LOC_TYPE in ('S','W')<br>|
||CHK_COST_SUSP_DTL_LOC_REC_ORD|RECALC_ORD_IND in ('Y','N')<br>|
|Column Level|RECALC_ORD_IND||
||DEFAULT_BRACKET_IND||

---

## Table: COST_SUSP_SUP_HEAD

**Description:** This table contains one row for each cost/retail event created within the company. If the cost event has retail changes associated with it, the retail changes are stored on the price_susp tables.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_CHANGE | P |  | Y | NUMERIC (8) | Contains the number which uniquely identifies the cost change. |
| 2 | COST_CHANGE_DESC |  |  | Y | VARCHAR (120) | Contains a description which, along with the cost change number, identifies the cost change. |
| 3 | REASON |  | F | Y | NUMERIC (2) | Contains a number which identifies the reason for the cost change. The number can be decoded on the cost_chg_reason table. |
| 4 | ACTIVE_DATE |  |  | Y | Date | Contains the date in which the cost change will become active. |
| 5 | STATUS |  |  | Y | VARCHAR (1) | Contains the status of the cost change. Valid values are: W = Worksheet, D = Deleted (to be deleted), C = Canceled, A = Approved, E = Extracted, R = Rejected, S = Submitted |
| 6 | COST_CHANGE_ORIGIN |  |  | Y | VARCHAR (3) | Contains a code which identifies the origin of the cost change. This code is used to determine whether the event was created by supplier or by SKU. Cost events with a supplier origin will have multiple detail records all having the same supplier. Cost events with a SKU origin will have multiple detail records which may have multiple SKUs and multiple suppliers. Valid Values are: SUP - By Supplier, SKU - By SKU |
| 7 | CREATE_DATE |  |  | Y | Date | Contains the date on which the cost change was created. |
| 8 | CREATE_ID |  |  | Y | VARCHAR (30) | Contains the ID of the user who created the cost change. |
| 9 | APPROVAL_DATE |  |  |  | Date | Contains the date on which the cost change was last approved. |
| 10 | APPROVAL_ID |  |  |  | VARCHAR (30) | Contains the user ID of the person who last approved the cost change. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COST_SUSP_SUP_HEAD|PK||||COST_CHANGE|ASC|
|COST_SUSP_SUP_HEAD_I1|||||REASON|ASC|
|COST_SUSP_SUP_HEAD_I2|||||ACTIVE_DATE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_COST_SUSP_SUP_HEAD_ORIGIN|COST_CHANGE_ORIGIN IN ('SKU', 'SUP')<br>|
||CHK_COST_SUSP_SUP_HEAD_STATUS|STATUS IN('W', 'S', 'A', 'E', 'R', 'C', 'D')<br>|
|Column Level|STATUS||

---

## Table: COST_SUSP_SUP_HEAD_CFA_EXT

**Description:** This is the custom attribute extension table for the entity COST_SUSP_SUP_HEAD.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_CHANGE | P | F | Y | NUMERIC (8) | Contains the number which uniquely identifies the cost change. |
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
| 25 | DATE_23 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_22 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 26 | DATE_24 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_23 in CFA_ATTRIB.STORAGE_COL_NAME. |
| 27 | DATE_25 |  |  |  | Date | This column holds data related to the attribute defined on the CFA_ATTRIB table that references DATE_23 in CFA_ATTRIB.STORAGE_COL_NAME. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COST_SUSP_SUP_HEAD_CFA_EXT|PK||||COST_CHANGE|ASC|
||||||GROUP_ID|ASC|

---

## Table: COST_TAX_RECALC

**Description:** This is table that will hold tax recalculation requests, and the accompanying item/supp/country/loc combinations affected.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_TAX_RECALC_ID | P |  | Y | NUMERIC (18) | The unique identifier for the tax recalculation request. |
| 2 | ACTIVE_DATE | P |  | Y | Date (7) | The date that the tax recalculation should take effect. |
| 3 | ITEM | P |  | Y | VARCHAR (25 BYTE) | Alphanumeric id that identifies the item affected by the tax recalculation. |
| 4 | SUPPLIER | P |  | Y | NUMERIC (10) | Unique identifier for the supplier. |
| 5 | ORIGIN_COUNTRY_ID | P |  | Y | VARCHAR (3 BYTE) | The country where the item originated. |
| 6 | LOC | P |  | Y | NUMERIC (10) | Number of the location where the item is to be found. |
| 7 | LOC_TYPE | P |  | Y | VARCHAR (1 BYTE) | Type of location in the location field. |
| 8 | STATUS |  |  | Y | VARCHAR (1 BYTE) | The status of the tax recalculation. It is either (N)ot processed or (P)rocessed. |
| 9 | THREAD_ID |  |  |  | NUMERIC (10) | Holds the thread id used when executing the the tax recalculation. |
| 10 | CREATED_ID |  |  | Y | VARCHAR (30 BYTE) | Contains the id of the user that initiated the tax recalculation. |
| 11 | CREATE_DATETIME |  |  | Y | Date (7) | Contains the date on which the tax recalculation was created. |
| 12 | LAST_UPDATE_ID |  |  |  | VARCHAR (30 BYTE) | Holds the Oracle user id of the user who most recently updated this record. |
| 13 | LAST_UPDATE_DATETIME |  |  |  | Date (7) | Holds the date time stamp of the most recent update to this record. |

---

## Table: COST_ZONE

**Description:** This table contains cost zone information. Each zone defined on this table belongs to a common zone group. Each zone will have a currency associated with it, and all stores within the zone (defined on the COST_ZONE_GROUP_STORE table) must use that same currency. A landed cost profile number is assigned at this level to determine which cost components should be initially assigned to each SKU/supplier/zone combination on the SKU_ZONE_COMP table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ZONE_GROUP_ID | P | F | Y | NUMERIC (4) | Contains the identification number of the zone group in which the zone is located. |
| 2 | ZONE_ID | P |  | Y | NUMERIC (10) | Contains the zone identification number which uniquely identifies the zone. If the cost level of the zone group is store, then the zone will be the store number. |
| 3 | DESCRIPTION |  |  | Y | VARCHAR (150) | Contains the name of the zone. If the cost level of the zone group is Store, then this column contains the store name. |
| 4 | CURRENCY_CODE |  | F | Y | VARCHAR (3) | This field contains the currency code for the zone. Each zone will have a currency code attached to ensure that each store location associated with the zone shares the same currency. |
| 5 | BASE_COST_IND |  |  | Y | VARCHAR (1) | Indicates whether or not this zone will be used as the default for the base cost zone. Valid values are Y and N. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COST_ZONE|PK||||ZONE_GROUP_ID|ASC|
||||||ZONE_ID|ASC|
|COST_ZONE_I1|||||CURRENCY_CODE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_COST_ZONE_BASE_COST_IND|BASE_COST_IND IN ('Y', 'N')|






|Type|Column / Constraint Name|Details|
|---|---|---|
||||
|Column Level|BASE_COST_IND||

---

## Table: COST_ZONE_GROUP

**Description:** This table contains zone group level information for cost zones. Cost zones are attached to each SKU or style/supplier combination as a way of defaulting landed cost components to each item.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ZONE_GROUP_ID | P |  | Y | NUMERIC (4) | This field contains the number that uniquely identifies the zone group. |
| 2 | COST_LEVEL |  |  | Y | VARCHAR (1) | Contains the pricing level of the zone group. Valid values are: L = Location, C = Corporate, Z = Zone. There will be only one record with a Corporate pricing level and only one record with a Location cost level, |
| 3 | DESCRIPTION |  |  | Y | VARCHAR (120) | Contains the description of the cost zone group. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COST_ZONE_GROUP|PK||||ZONE_GROUP_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_COST_ZONE_GROUP_COST_LEVEL|COST_LEVEL IN ('C', 'L', 'Z')<br>|
|Column Level|COST_LEVEL||

---

## Table: COST_ZONE_GROUP_LOC

**Description:** This table contains one row for each zone group/store combination. Every store on the store table must contain a row on this table for each zone group.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ZONE_GROUP_ID | P | F | Y | NUMERIC (4) | This field contains the zone group identification number for the zone group. |
| 2 | LOCATION | P |  | Y | NUMERIC (10) | Contains the store or warehouse number which uniquely identifies the location. Whether this field contains a store or warehouse is determined by the LOC_TYPE field. If the cost level of the zone group is Location, then the location value will be equal to the zone value. There must be exactly one record for every store and warehouse in every zone group. |
| 3 | LOC_TYPE | P |  | Y | VARCHAR (1) | This field indicated whether the value in the LOCATION field is a store value or a warehouse value. Valid values for this field are: S - Store, W - Warehouse |
| 4 | ZONE_ID |  | F | Y | NUMERIC (10) | Contains the zone identification number of the zone within the zone group. If the cost level of the zone group is Location, then the location value will be equal to the zone value. |
| 5 | PRIMARY_DISCHARGE_PORT |  |  |  | VARCHAR (5) | Contains the identification of the primary port where items are entering the country for the location. It is used to assess estimated landing cost. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COST_ZONE_GROUP_LOC|PK||||ZONE_GROUP_ID|ASC|
||||||LOCATION|ASC|
||||||LOC_TYPE|ASC|
|COST_ZONE_GROUP_LOC_I1|||||ZONE_GROUP_ID|ASC|
||||||ZONE_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_COST_ZONE_GROUP_LOC_TYPE|LOC_TYPE IN ('S', 'W')<br>|
|Column Level|LOC_TYPE||

---

## Table: COST_ZONE_GROUP_TL

**Description:** This is the translation table for COST_ZONE_GROUP table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | ZONE_GROUP_ID | P | F | Y | NUMERIC (4) | This field contains the number that uniquely identifies the zone group. |
| 3 | DESCRIPTION |  |  | Y | VARCHAR (120) | Contains the description of the cost zone group. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COST_ZONE_GROUP_TL|PK||||LANG|ASC|
||||||ZONE_GROUP_ID|ASC|

---

## Table: COST_ZONE_TL

**Description:** This is the translation table for COST_ZONE table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | ZONE_GROUP_ID | P | F | Y | NUMERIC (4) | Contains the identification number of the zone group in which the zone is located. |
| 3 | ZONE_ID | P | F | Y | NUMERIC (10) | Contains the zone identification number which uniquely identifies the zone. If the cost level of the zone group is store, then the zone will be the store number. |
| 4 | DESCRIPTION |  |  | Y | VARCHAR (150) | Contains the name of the zone. If the cost level of the zone group is Store, then this column contains the store name. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_COST_ZONE_TL|PK||||LANG|ASC|
||||||ZONE_GROUP_ID|ASC|
||||||ZONE_ID|ASC|

---

## Table: ELC_COMP

**Description:** This table is used to store Expense, Assessment, and Up Charge information. Expenses are the components that make up the cost of an item. Assessments are the components that make up the total duty charges for an item. Up Charges are incurred when transferring goods between warehouses and stores.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COMP_ID | P |  | Y | VARCHAR (10) | Contains a unique user specified code representing the Component. |
| 2 | COMP_DESC |  |  | Y | VARCHAR (250) | Contains the name or description of the Component. |
| 3 | COMP_TYPE |  |  | Y | VARCHAR (1) | Contains a code used to distinguish between Expenses, Assessments, and Up Charges. The valid values are Expense (E), Assessment (A), or Up Charge (U). |
| 4 | ASSESS_TYPE |  |  |  | VARCHAR (3) | Contains a code representing what type of tariff this expense component is related to. The assessment type must exist on the HTS_FEE or HTS_TAX table. This field is only populated when the Component Type is A (Assessment). |
| 5 | IMPORT_COUNTRY_ID |  | F |  | VARCHAR (3) | Contains the country that the assessment applies to. This field will only have a value if the Component Type is A (Assessment). |
| 6 | EXPENSE_TYPE |  |  |  | VARCHAR (6) | Contains a code used to classify and group this expense. The code_type for this field is EXPT. Valid values are user defined. This field will only be populated if the Component Type is E (Expense). |
| 7 | UP_CHRG_TYPE |  |  |  | VARCHAR (6) | Contains the type of Up Charge component. Valid values are E (Expense) or P (Profit). Expense Up Charges are charges incurred by the sending location when transferring goods from to the receiving location, like Freight or Insurance. The receiving location will have to pay these charges to the sending location. Profit Up Charges are used when the sending location is trying to become a profit center. Examples of Profit charges are Storage Fees and Processing Fees. |
| 8 | UP_CHRG_GROUP |  |  |  | VARCHAR (6) | Contains the group of the Up Charge, used for grouping Up Charges together for display in the Transfer diaolg. |
| 9 | CVB_CODE |  | F |  | VARCHAR (10) | Contains a code representing the base value for calculating a component. These codes must exist on the Computation Value Base Header table (cvb_head). If this field is NULL and the Calculation Basis is V (Value), calculation of the Component will use the Suppliers unit cost (if the cost_basis is Supplier), or order cost (if the cost_basis is Order) as the base. However, if the Component Type is Up Charge, then the Item/Locations Weighted Average Cost will be used, and this field will always be NULL. |
| 10 | CALC_BASIS |  |  | Y | VARCHAR (6) | Contains a one character code indicating whether the component is calculated on a per-unit (Specific) or ad valorem (Value) basis. Valid values are Value (V) or Specific (S). |
| 11 | COST_BASIS |  |  |  | VARCHAR (1) | Contains the basis the expense will be calculated against if there is no CVB code attached to the expense. Valid values are S (Supplier) or O (Order). If the Cost Basis is S then when calculating the expense, the items supplier cost will be used. If the Cost Basis is O then the total order cost of the item on the order will be used to calculate the expense. This field will be NULL if the CVB code field is NULL or if the Component Type is Assessment or Up Charge. |
| 12 | EXP_CATEGORY |  |  |  | VARCHAR (6) | Contains a code that is used to classify and group expenses. The codes are user defined. Two example expense categories are Admin (A) and Misc (M). These codes are on the code detail table with a code type of EXPC. |
| 13 | COMP_RATE |  |  | Y | NUMERIC (20,4) | Contains the rate to be charged against the calculation base. The value in this field will be a percentage if the Calculation Basis is V (Value), and a monetary amount if the Calculation Basis is S (Specific). |
| 14 | COMP_LEVEL |  |  | Y | NUMERIC (2) | Contains a numeric value that determines component calculation order. Components that have the same comp_level will be calculated in the order they appear in the table. |
| 15 | DISPLAY_ORDER |  |  | Y | NUMERIC (2) | Contains a numeric value that determines the display order of the components when used in other modules. |
| 16 | ALWAYS_DEFAULT_IND |  |  | Y | VARCHAR (1) | Contains a flag indicating that the component should always default to every item. Valid values are Yes (Y) or No (N). |
| 17 | COMP_CURRENCY |  | F | Y | VARCHAR (3) | Contains the currency code for the cost component that is being entered in the Cost Component Maintenance Form. |
| 18 | PER_COUNT |  |  |  | NUMERIC (12,4) | Contains a count indicating the amount of the Per Count Unit of Measure to which the rate applies. This field will be NULL if the calc_basis is Value (V). This field is required If the calc_basis is Specific (S). |
| 19 | PER_COUNT_UOM |  |  |  | VARCHAR (4) | Contains the unit of measure in which the Per Count is specified. This field will be NULL if the calc_basis is Value (V). This field is required If the calc_basis is Specific (S). |
| 20 | NOM_FLAG_1 |  |  | Y | VARCHAR (1) | Indicates whether or not the value of the Component should be added to or subtracted from the corresponding CVB. If a different component exists with a CVB, and that CVB has the first nomination flag checked. Then any other component with the first nomination flag set to + or - will be added to or subtracted from the value of that CVB, which is then used to calculate the component to which it is attached. This flag is completely user definable, including the corresponding label which is defined on the System Options table. |
| 21 | NOM_FLAG_2 |  |  | Y | VARCHAR (1) | Also referred to as the In Duty flag. Indicates whether or not the value of the Component should be added to or subtracted from Total Duty. This flag is system defined and should only be used to include or subtract values to or from Duty. |
| 22 | NOM_FLAG_3 |  |  | Y | VARCHAR (1) | Indicates whether or not the value of the Component should be added to or subtracted from the corresponding CVB. If a different component exists with a CVB, and that CVB has the third nomination flag checked. Then any other component with the third nomination flag set to + or - will be added to or subtracted from the value of that CVB, which is then used to calculate the component to which it is attached. This flag is completely user definable, including the corresponding label which is defined on the System Options table. |
| 23 | NOM_FLAG_4 |  |  | Y | VARCHAR (1) | Also referred to as the In Exp. flag. Indicates whether or not the value of the Component should be added to or subtracted from Total Expenses. This flag is system defined and should only be used to include or subtract values to or from the Total Expense value. |
| 24 | NOM_FLAG_5 |  |  | Y | VARCHAR (1) | Also referred to as the In ALC flag. Indicates whether or not the value of the Component should be added to or subtracted from Total Actual Landed Cost. This flag is system defined and should only be used to include or subtract values to or from ALC when the client is not expecting to receive an Invoice for the amount, (i.e. internal fees). |
| 25 | SYS_GENERATED_IND |  |  | Y | VARCHAR (1) | This specifies whether the elc component was generated by the system during the installation process or manually created. If system generated then these components cannot be updated by the user on screen. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ELC_COMP|PK||||COMP_ID|ASC|
|ELC_COMP_I4|||||PER_COUNT_UOM|ASC|
|ELC_COMP_I1|||||IMPORT_COUNTRY_ID|ASC|
|ELC_COMP_I2|||||COMP_CURRENCY|ASC|
|ELC_COMP_I3|||||CVB_CODE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ELC_COMP_AL_DEF_IND|always_default_ind in ('Y','N')<br>|
||CHK_ELC_COMP_CALC_BASIS|(calc_basis = 'V' and per_count is NULL and per_count_uom is NULL) or (calc_basis = 'S' and per_count is NOT NULL and per_count_uom<br>is NOT NULL and cost_basis is NULL)<br>|
||CHK_ELC_COMP_COMP_TYPE|(comp_type = 'E' and expense_type is NOT NULL and assess_type is NULL and import_country_id is NULL and up_chrg_group is NULL and<br>up_chrg_type is NULL) or (comp_type = 'A' and expense_type is NULL and cost_basis is NULL and exp_category is NULL and<br>import_country_id is NOT NULL and up_chrg_group is NULL and up_chrg_type is NULL) or (comp_type = 'U' and expense_type is NULL<br>and cost_basis is NULL and assess_type is NULL and exp_category is NULL and import_country_id is NULL and up_chrg_group is NOT<br>NULL and up_chrg_type is NOT NULL)<br>|
||CHK_ELC_COMP_COST_BASIS2|cost_basis in ('S','O')<br>|
||CHK_ELC_COMP_CVB_CODE|cvb_code is NOT NULL and cost_basis is NULL or cvb_code is NULL and cost_basis is NOT NULL or cvb_code is NULL and cost_basis is<br>NULL<br>|
||CHK_ELC_COMP_EXPENSE_TYPE|expense_type in ('Z','C')<br>|
||CHK_ELC_COMP_NOM_FLAG_1|nom_flag_1 in ('N','+','-')<br>|
||CHK_ELC_COMP_NOM_FLAG_2|nom_flag_2 in ('N','+','-')<br>|
||CHK_ELC_COMP_NOM_FLAG_3|nom_flag_3 in ('N','+','-')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_ELC_COMP_NOM_FLAG_4|nom_flag_4 in ('N','+','-')<br>|
||CHK_ELC_COMP_NOM_FLAG_5|nom_flag_5 in ('N','+','-')<br>|
||CHK_ELC_COMP_SYS_GENERATED_IND|sys_generated_ind in ('Y','N')<br>|
||CHK_ELC_COMP_UP_CHRG_TYPE|(UP_CHRG_TYPE IN ('E','P')) OR (UP_CHRG_TYPE IS NULL)<br>|
|Column Level|EXPENSE_TYPE||
||UP_CHRG_TYPE||
||COST_BASIS||
||ALWAYS_DEFAULT_IND||
||NOM_FLAG_1||
||NOM_FLAG_2||
||NOM_FLAG_3||
||NOM_FLAG_4||
||NOM_FLAG_5||
||SYS_GENERATED_IND||

---

## Table: ELC_COMP_CFA_EXT

**Description:** This is the custom attribute extension table for the entity ELC_COMP.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COMP_ID | P | F | Y | VARCHAR (10) | This column holds the Component ID this extended data is associated with. |
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
|PK_ELC_COMP_CFA_EXT|PK||||COMP_ID|ASC|
||||||GROUP_ID|ASC|

---

## Table: ELC_COMP_TL

**Description:** This is the translation table for ELC_COMP table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | COMP_ID | P | F | Y | VARCHAR (10) | Contains a unique user specified code representing the Component. |
| 3 | COMP_DESC |  |  | Y | VARCHAR (250) | Contains the name or description of the Component. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ELC_COMP_TL|PK||||LANG|ASC|
||||||COMP_ID|ASC|

---

## Table: EXP_PROF_DETAIL

**Description:** This table holds Expense Profile Detail information. This information indicates the expenses incurred when moving goods from a particular origin country/lading port to a discharge port in another country, or from a discharge port to a particular zone.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | EXP_PROF_KEY | P | F | Y | NUMERIC (6) | Contains the unique number that is used to distinguish between the different profiles. |
| 2 | COMP_ID | P |  | Y | VARCHAR (10) | Contains a user specified code representing a specific expense or assessment found on the ELC_COMP table. |
| 3 | CVB_CODE |  | F |  | VARCHAR (10) | Contains a code representing the base value for calculating an expense. |
| 4 | COMP_RATE |  |  | Y | NUMERIC (20,4) | Contains the rate to be charged against the calculation base. The value in this field will be a percentage if the calculation basis is V (Value), and a monetary amount if the calculation basis is S (Specific). |
| 5 | COMP_CURRENCY |  | F | Y | VARCHAR (3) | Contains the currency the expense or assessment is to be entered in. This field will only have a value if the Components Calculation Basis is Specific. |
| 6 | PER_COUNT |  |  |  | NUMERIC (12,4) | Contains a count indicating the amount of the Per Count Unit of Measure to which the rate applies. |
| 7 | PER_COUNT_UOM |  | F |  | VARCHAR (4) | Contains the unit of measure in which the Per Count is specified. |
| 8 | NOM_FLAG_1 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. |
| 9 | NOM_FLAG_2 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. |
| 10 | NOM_FLAG_3 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. |
| 11 | NOM_FLAG_4 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. |
| 12 | NOM_FLAG_5 |  |  | Y | VARCHAR (1) | Contains a flag that is used to indicate the status of this particular nomination flag for a given expense. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_EXP_PROF_DETAIL|PK||||EXP_PROF_KEY|ASC|
||||||COMP_ID|ASC|
|EXP_PROF_DETAIL_I3|||||PER_COUNT_UOM|ASC|
|EXP_PROF_DETAIL_I2|||||CVB_CODE|ASC|
|EXP_PROF_DETAIL_I1|||||COMP_CURRENCY|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_EXP_PROF_DETAIL_INF_4|NOM_FLAG_4 IN ('N','+','-')<br>|
||CHK_EXP_PROF_DETAIL_INF_5|NOM_FLAG_5 IN ('N','+','-')<br>|
||CHK_EXP_PROF_DETAIL_NF_1|NOM_FLAG_1 IN ('N','+','-')<br>|
||CHK_EXP_PROF_DETAIL_NF_2|NOM_FLAG_2 IN ('N','+','-')<br>|
||CHK_EXP_PROF_DETAIL_NF_3|NOM_FLAG_3 IN ('N','+','-')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
|Column Level|NOM_FLAG_1||
||NOM_FLAG_2||
||NOM_FLAG_3||
||NOM_FLAG_4||
||NOM_FLAG_5||

---

## Table: EXP_PROF_HEAD

**Description:** This table holds Expense Profile Header information. There are two types of profiles, Zone and Country. Zone profiles consist of expenses that are incurred from the movement of goods between a particular discharge port to a zone within the discharge ports country. Country profiles consist of the expense incurred when moving goods from a particular origin country/lading port to a given discharge port. Profiles are created to default sets of expenses into Item level expenses, which will be defaulted into Purchase Order level expenses when an item is added to an order.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | EXP_PROF_KEY | P |  | Y | NUMERIC (6) | Contains the unique sequence number that is used to distinguish between the different profiles. |
| 2 | EXP_PROF_TYPE |  |  | Y | VARCHAR (1) | Contains the type of Profile. Valid values are Z (Zone), or C (Country). Zone profiles consist of expenses that are incurred from the movement of goods between a particular discharge port to a zone within the discharge ports country. Country profiles consist of the expense incurred when moving goods from a particular origin country/lading port to a given discharge port. The code type for this field is EXPT. |
| 3 | MODULE |  |  | Y | VARCHAR (6) | This field holds the code for the module that the Landed Cost Profile is associated with. Valid values are SUPP (Supplier), PTNR (Partner), and CTRY (Country). |
| 4 | KEY_VALUE_1 |  |  | Y | VARCHAR (20) | This field will hold the specific id that the profile is attached to, e.g. for Supplier the key_value_1 would be the supplier identification number. However if the module is Partner then this field will hold the Partner Type (e.g. Bank, Freight Forwarder, Importer, etc). |
| 5 | KEY_VALUE_2 |  |  |  | VARCHAR (20) | This field will contain the specific id that the profile is attached to if key_value_1 is being used to hold a type, i.e. if the module is Partner then this field will hold the Partner Identification number. |
| 6 | ZONE_GROUP_ID |  |  |  | NUMERIC (4) | This field contains the zone group ID for which the profile belongs to. This field will only have a value if the Profile Type is Zone. |
| 7 | ZONE_ID |  |  |  | NUMERIC (10) | Contains the zone identification number which uniquely identifies the zone. If the level of the zone group is store, then the zone will be the store number. This field will only contain a value if the Profile Type is Zone. |
| 8 | ORIGIN_COUNTRY_ID |  | F |  | VARCHAR (3) | Contains the code of the origin country the Landed Cost Country Profile is associated with. This field will only contain a value if the Profile Type is Country. |
| 9 | LADING_PORT |  |  |  | VARCHAR (5) | Contains the identification of the Landed Cost Country Profiles lading port. This field will only contain a value if the Profile Type is Country. |
| 10 | DISCHARGE_PORT |  |  | Y | VARCHAR (5) | Contains the identification of the Landed Cost Profiles discharge port. |
| 11 | BASE_PROF_IND |  |  | Y | VARCHAR (1) | Indicates whether or not the unit cost for the Expense Profile is also the base profile. Valid values are Y or N. For any given Supplier or Partner there can only be one base profile for each type, Zone and Country. For any given Country there can only be only base profile of type Country. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_EXP_PROF_HEAD|PK||||EXP_PROF_KEY|ASC|
|UK_EXP_PROF_HEAD|UK||||EXP_PROF_TYPE|ASC|
||||||MODULE|ASC|
||||||KEY_VALUE_1|ASC|
||||||KEY_VALUE_2|ASC|
||||||ZONE_GROUP_ID|ASC|
||||||ZONE_ID|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
||||||LADING_PORT|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||DISCHARGE_PORT|ASC|
|EXP_PROF_HEAD_I2|||||ORIGIN_COUNTRY_ID|ASC|
|EXP_PROF_HEAD_I1|||||ZONE_GROUP_ID|ASC|
||||||ZONE_ID|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
||||||LADING_PORT|ASC|
||||||DISCHARGE_PORT|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_EXP_PRF_HD_BASE_PRF_IND|BASE_PROF_IND IN ('Y','N')<br>|
||CHK_EXP_PRF_HD_EXP_PRF_TYPE|(EXP_PROF_TYPE IN ('Z','C')) and ((EXP_PROF_TYPE='Z' and zone_group_id IS NOT NULL and zone_id IS NOT NULL and origin_country_id IS<br>NULL and lading_port IS NULL) or (EXP_PROF_TYPE='C' and origin_country_id IS NOT NULL and lading_port IS NOT NULL and zone_group_id<br>IS NULL and zone_id IS NULL))<br>|
||CHK_EXP_PRF_HD_MODULE|MODULE IN ('SUPP','PTNR','CTRY')<br>|
|Column Level|MODULE||
||BASE_PROF_IND||

---

## Table: MC_CHRG_DETAIL

**Description:** This temporary table will be used to maintain item list upcharge detail records until they are blown down to the item level on the ITEM_CHRG_DETAIL table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM_LIST | P | F | Y | NUMERIC (8) | Contains the item list number. |
| 2 | FROM_LOC | P | F | Y | NUMERIC (10) | Contains the location number of the location from which goods will be transferred. This column can contain store number, warehouse number (virtual warehouse or internal finisher), or an external finisher number. |
| 3 | TO_LOC | P | F | Y | NUMERIC (10) | Contains the location number of the location to which goods will be transferred. This column can contain store number, warehouse number (virtual warehouse or internal finisher), or an external finisher number. |
| 4 | COMP_ID | P | F | Y | VARCHAR (10) | Contains the unique identifier of the Up Charge component. |
| 5 | FROM_LOC_TYPE |  |  | Y | VARCHAR (1) | Contains the location type from which goods will be transferred. Valid values are: S Store W Warehouse E External Finisher |
| 6 | TO_LOC_TYPE |  |  | Y | VARCHAR (1) | Contains the location type to which goods will be transferred. Valid values are: S Store W Warehouse E External Finisher |
| 7 | COMP_RATE |  |  | Y | NUMERIC (20,4) | Contains the rate to be charged against the weighted average cost of the item/to location combinations within the department. The value in this field will be a percentage if the calculation basis is V (value), and a monetary amount if the calculation basis is S (specific). |
| 8 | PER_COUNT |  |  |  | NUMERIC (12,4) | Contains a count indicating the amount of the Per Count Unit of Measure to which the rate applies. This column will only contain a value if the calculation basis is S (Specific). When creating an Up Charge that is |
| 9 | PER_COUNT_UOM |  | F |  | VARCHAR (4) | Contains the unit of measure in which the Per Count is specified. This column will only contain a value if the calculation basis is S (Specific). When creating an Up Charge that is defined as $.20 for every 10 kilograms of an item transferred, the Per Count UOM would be the Unit of Measure code for Kilograms. |
| 10 | UP_CHRG_GROUP |  |  | Y | VARCHAR (6) | Contains the rate to be charged against the weighted average cost of the Item/To Location combinations within the department. The value in this field will be a percentage if the calculation basis is V (Value), and a monetary amount if the calculation basis is S (Specific). Valid values can be found on the codes table with a code type of UPCG. |
| 11 | COMP_CURRENCY |  | F | Y | VARCHAR (3) | Contains the currency of the Up Charge component. |
| 12 | DISPLAY_ORDER |  |  | Y | NUMERIC (2) | Contains the order in which the components should be displayed. A value of 0 (zero) indicates that the component will not be displayed in the form, but the assoicated value will be included in the calculations. |
| 13 | MAINTENANCE_TYPE | P |  | Y | VARCHAR (1) | Contains the value A if the item list upcharge record should be inserted into the item upcharge tables, and the value D if the item list upcharge record should be deleted from the item upcharge tables. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_MC_CHRG_DETAIL|PK||||ITEM_LIST|ASC|
||||||FROM_LOC|ASC|
||||||TO_LOC|ASC|
||||||COMP_ID|ASC|
||||||MAINTENANCE_TYPE|ASC|
|MC_CHRG_DETAIL_I3|||||PER_COUNT_UOM|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|MC_CHRG_DETAIL_I2|||||COMP_ID|ASC|
|MC_CHRG_DETAIL_I1|||||COMP_CURRENCY|ASC|

---

## Table: MC_CHRG_HEAD

**Description:** This temporary table will be used to maintain item list upcharge head records until they are blown down to the item level on the ITEM_CHRG_HEAD table

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM_LIST | P | F | Y | NUMERIC (8) | Contains the item list number. |
| 2 | FROM_LOC | P |  | Y | NUMERIC (10) | Contains the location from which goods will be transferred. This column can contain store numbers, warehouse numbers (Virtual warehouses or internal finishers), or an external finsiher number. |
| 3 | TO_LOC | P |  | Y | NUMERIC (10) | Contains the location number of the location to which goods will be transferred. This column can contain store number, warehouse number (virtual warehouse or internal finisher), or an external finisher number. |
| 4 | FROM_LOC_TYPE |  |  |  | VARCHAR (1) | Contains the location type from which goods will be transferred. Valid values are: S Store W Warehouse E External Finisher |
| 5 | TO_LOC_TYPE |  |  |  | VARCHAR (1) | Contains the location type to which goods will be transferred. Valid values are: S Store W Warehouse E External Finisher |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_MC_CHRG_HEAD|PK||||ITEM_LIST|ASC|
||||||FROM_LOC|ASC|
||||||TO_LOC|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_MCH_FROM_LOC_TYPE|FROM_LOC_TYPE IN ('S','W','E')<br>|
||CHK_MCH_TO_LOC_TYPE|TO_LOC_TYPE IN ('S','W','E')<br>|

---

## Table: MC_LOCATION_TEMP

**Description:** This table is used to temporarily hold the locations against which a mass item location change will run. All rows are deleted once the change is completed.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LOCATION |  |  | Y | NUMERIC (10) | Contains the store or warehouse number that will be involved in the change. |
| 2 | LOCATION_NAME |  |  |  | VARCHAR (250) | Contains the name of the store or warehouse location. |
| 3 | LOC_TYPE |  |  |  | VARCHAR (1) | This column will hold the location type of the location that has been rejected. |

---

## Table: MC_LOC_TRAIT_TEMP

**Description:** This table is used to temporarily hold the location traits against which a mass location list change will run. All rows are deleted for the location list once the change is completed.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LOC_LIST | P |  | Y | NUMERIC (4) | Contains the location list number the loc_trait mass change will apply to. |
| 2 | LOC_TRAIT | P |  | Y | NUMERIC (4) | Contains the location trait that will be added for all stores on the location list. |
| 3 | ACTION_TYPE |  |  | Y | VARCHAR (6) | Indicates whether to add or delete location trait for all stores on the location list. Valid values are: A - add D - delete |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_MC_LOC_TRAIT_TEMP|PK||||LOC_LIST|ASC|
||||||LOC_TRAIT|ASC|

---

## Table: MC_REJECTIONS

**Description:** This table is filled when items are rejected from the mass item change process. The information is then used by the mass item report to show why the records failed out of the process. This is only a temporary table used only for reporting purposes.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | Contains a SKU or a Style number that was rejected from the mass item change process. |
| 2 | CHANGE_TYPE |  |  | Y | VARCHAR (1) | Indicates the type of change being made. Valid change values include: R - Replenishment S - Substitute Items I - Item Indicator M - Merchandise Hierarchy L - Location Level Attribute U - User Defined Attributes P - Seasons/Phases |
| 3 | REJECTION_REASON |  |  | Y | VARCHAR (1000) | Contains the reason the item was rejected from the mass item change process. The parameters will be filled in with the values being processed when the error occurred. |
| 4 | LOC |  |  |  | NUMERIC (10) | This field may contain the location value for the mass change that has been rejected. This field is strictly to give more information to the user about the change that has been rejected. This field will contain a store or warehouse value depending on the LOC_TYPE field. |
| 5 | LOC_TYPE |  |  |  | VARCHAR (1) | This field may contain the location type for the mass change that has been rejected. This field is strictly to give more information to the user about the change that has been rejected. Valid values for this field are: S - Store W - Warehouse |
| 6 | USER_ID |  |  | Y | VARCHAR (30) | This field will contain the ORACLE User ID of the user that was rejected for the mass change. This field will be used to determine what rejections to print out on the mass change rejection report. |

---

## Table: MC_REJECTION_REASONS

**Description:** This table holds all the rejection reasons for mass item changes. This table is populated during installation of the system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | REASON_KEY | P |  | Y | VARCHAR (25) | Contains the short description of the rejection reason that uniquely identifies the reason. |
| 2 | REJECTION_REASON |  |  | Y | VARCHAR (1000) | Message explaining why the record was rejected. Specifies what parameters can be passed in order to be written to the rejection report. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_MC_REJECTION_REASONS|PK||||REASON_KEY|ASC|

---

## Table: MC_REJECTION_REASONS_TL

**Description:** This is the translation table for MC_REJECTION_REASONS table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | REASON_KEY | P | F | Y | VARCHAR (25) | Contains a key for the rejection reason. |
| 3 | REJECTION_REASON |  |  | Y | VARCHAR (1000) | Contains the actual text of the message. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_MC_REJECTION_REASONS_TL|PK||||LANG|ASC|
||||||REASON_KEY|ASC|

---

## Table: MOD_ORDER_ITEM_HTS

**Description:** This table is used for reporting purposes to show which items and order/items are impacted after HTS upload program has been processed. It will be purged prior to HTS upload execution.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDER_NO |  |  |  | NUMERIC (12) | This field contains the order number that is impacted by the HTS upload. |
| 2 | ITEM |  |  |  | VARCHAR (25) | This field contains the item number that is impacted by the HTS upload. |
| 3 | IMPORT_COUNTRY_ID |  |  |  | VARCHAR (3) | Contains the country id of the importing country. |
| 4 | HTS |  |  |  | VARCHAR (25) | Contains the Harmonized Tariff Schedule item classification number that is associated with the HTS upload. This number is standard for the importing country. |
| 5 | EFFECT_FROM |  |  |  | Date | The date from which the Item/HTS relationship is valid. This field is used to maintain historical information related to the Item/HTS relationship. |
| 6 | EFFECT_TO |  |  |  | Date | The date to which the Item/HTS relationship is valid. This field is used to maintain historical information related to the Item/HTS relationship. |
| 7 | UNAPPROVE_IND |  |  | Y | VARCHAR (1) | This field will store a Y to indicate that the associated order was unapproved during the HTS upload and will store a N to indicate that the status was not unapproved. |
| 8 | PGM_NAME |  |  | Y | VARCHAR (100) | This column will specify which program has modified the HTS on the order. |
| 9 | UPDATED_DATETIME |  |  | Y | Date | Timestamp of when the HTS details were modified on the order. |

---

## Table: NEW_COSTING_LOC

**Description:** This table logs costing location changes for franchise stores at item location level.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | This field holds the item associated with the costing location change. |
| 2 | LOCATION | P |  | Y | NUMERIC (10) | This field holds the location of the item associated with the costing location change.Location can only be Franchise store. |
| 3 | SUPPLIER |  |  | Y | NUMERIC (10) | This field holds the primary supplier of the item. |
| 4 | COSTING_LOC |  |  | Y | NUMERIC (10) | This field holds the new costing location for the Franchise store.Can be store or warehouse. |
| 5 | ACTIVE_DATE |  |  | Y | Date | This field holds the date on which the costing location change becomes active. |
| 6 | STATUS |  |  | Y | VARCHAR (1) | This field holds the status of the costing location change event. |
| 7 | RMS_ASYNC_ID |  |  |  | NUMERIC (15) | This field holds the unique identifier for the asynchronous process if the costing location change event is processed in asynchronous mode. |
