# RMS Store Allocations Datamodel - Physical Data Model Reference

## Table: ALC_COMP_LOC

**Description:** The ALC_COMP_LOC table contains the location-level information for the actual landed cost (ALC) of a given Purchase Order/Item/Component combination.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDER_NO | P | F | Y | NUMERIC (12) | This column contains the order number that the actual landed cost information is attached to. |
| 2 | SEQ_NO | P | F | Y | NUMERIC (10) | This column contains a sequence number that is used to distinguish between the different Obligation/Vessel/Voyage/Estimated Departure Date/Shipment combinations. |
| 3 | COMP_ID | P | F | Y | VARCHAR (10) | This column contains a user-specified code representing a specific expense or assessment found on the ELC_COMP table. |
| 4 | LOCATION | P |  | Y | NUMERIC (10) | This column contains the location where the item is sent. |
| 5 | LOC_TYPE |  |  | Y | VARCHAR (1) | This column contains the type of location where the item is sent. Valid values are W warehouse and S store. |
| 6 | ACT_VALUE |  |  | Y | NUMERIC (20,4) | This column contains the actual unit value of the landed cost component stored in primary currency. |
| 7 | QTY |  |  | Y | NUMERIC (12,4) | This column contains the quantity, that the obligation is charging the amount for, at the particular location. |
| 8 | LAST_CALC_DATE |  |  | Y | Date | This column contains the date when the actual landed cost value was last calculated. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ALC_COMP_LOC|PK||||ORDER_NO|ASC|
||||||SEQ_NO|ASC|
||||||COMP_ID|ASC|
||||||LOCATION|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|ALC_COMP_LOC_I1|||||COMP_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ALC_COMP_LOC_LOC_TYPE|loc_type in ('S','W')<br>|
|Column Level|LOC_TYPE||

---

## Table: ALC_HEAD

**Description:** The ACL_HEAD table contains the header-level information of the actual landed cost (ALC) of a given Purchase Order/Item combination.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDER_NO | P | F | Y | NUMERIC (12) | This column contains the order number that the actual landed cost information is attached to. |
| 2 | ITEM |  | F | Y | VARCHAR (25) | This column contains the unique identifier for the item. |
| 3 | PACK_ITEM |  | F |  | VARCHAR (25) | This column contains the number of the pack to which the item is associated (if the item is in a buyer pack). |
| 4 | SEQ_NO | P |  | Y | NUMERIC (10) | This column contains a sequence number that is used to distinguish between the different Item/Pack Item/Obligation/Customs Entry/Vessel/Voyage/Estimated Departure Date combinations |
| 5 | OBLIGATION_KEY |  | F |  | NUMERIC (10) | This column contains the unique sequence number that is used to distinguish between the different obligations. |
| 6 | CE_ID |  | F |  | NUMERIC (10) | This column contains the identifying number of the Customs Entry. |
| 7 | VESSEL_ID |  |  |  | VARCHAR (20) | This column contains the vessel or other vehicle identification used only with Import Orders. |
| 8 | VOYAGE_FLT_ID |  |  |  | VARCHAR (10) | This column contains the voyage or flight number used only with Import Orders. |
| 9 | ESTIMATED_DEPART_DATE |  |  |  | Date | This column contains the estimated date of departure for the goods leaving the port of lading used only with Import Orders. |
| 10 | ALC_QTY |  |  | Y | NUMERIC (12,4) | This column contains the quantity of the item that the actual landed cost is distributed across. |
| 11 | STATUS |  |  | Y | VARCHAR (6) | This column contains the status of the ALC record. Possible choices are P (Pending), FW (Finalize - Update WAC (Weighted Average Cost)), F (Finalize - No WAC Update), PW (Processed - WAC Updated), PR (Processed - No WAC Updated). All ALC records are initially in Pending status. When an ALC record is set to Finalize - Update WAC, this indicates that the record is ready to be written to the Stock Ledger, and the Weighted Average Cost of each item/location should be updated. When the ALC record is set to Finalize - No WAC Update, this indicates that the record is ready to be written to the Stock Ledger, but the Weighted Average Cost should not be updated. Once the record has been written to the Stock Ledger and WAC has been updated if necessary, the status will be set to Process - WAC Updated, or Processed - No WAC Updated depending on the previous Finalized status. |
| 12 | ERROR_IND |  |  | Y | VARCHAR (1) | This column indicates if there were any errors when updating and inserting into the actual landed cost tables with information entered into the Obligation dialog either manually or via an upload file. If this is set to Y (Yes) then there were errors in this process. These errors can be viewed on the actual landed cost errors table. |
| 13 | SHIPMENT |  |  |  | NUMERIC (12) | This contains the shipment reference number. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ALC_HEAD|PK||||ORDER_NO|ASC|
||||||SEQ_NO|ASC|
|UK_ALC_HEAD|UK||||ORDER_NO|ASC|
||||||ITEM|ASC|
||||||SEQ_NO|ASC|
||||||PACK_ITEM|ASC|






|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||OBLIGATION_KEY|ASC|
||||||CE_ID|ASC|
||||||VESSEL_ID|ASC|
||||||VOYAGE_FLT_ID|ASC|
||||||ESTIMATED_DEPART_DATE|ASC|
|ALC_HEAD_I1|||||ITEM|ASC|
|ALC_HEAD_I3|||||PACK_ITEM|ASC|
|ALC_HEAD_I2|||||OBLIGATION_KEY|ASC|
|ALC_HEAD_I4|||||CE_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ALC_HEAD_ERROR_IND|error_ind in ('Y','N')<br>|
||CHK_ALC_HEAD_ESTIMATED_DEP_DTE|(estimated_depart_date is NOT NULL and voyage_flt_id is NOT NULL and vessel_id is NOT NULL) OR (estimated_depart_date is NULL and<br>voyage_flt_id is NULL and vessel_id is NULL)<br>|
||CHK_ALC_HEAD_VESSEL_ID|(vessel_id is NOT NULL and voyage_flt_id is NOT NULL and estimated_depart_date is NOT NULL OR vessel_id is NULL and voyage_flt_id<br>is NULL and estimated_depart_date is NULL)<br>|
||CHK_ALC_HEAD_VOYAGE_FLT_ID|(voyage_flt_id is NOT NULL and vessel_id is NOT NULL and estimated_depart_date is NOT NULL OR voyage_flt_id is NULL and vessel_id<br>is NULL and estimated_depart_date is NULL)<br>|
||CHK_ALC_HEAD_STATUS|((OBLIGATION_KEY IS NULL AND CE_ID IS NULL AND STATUS = 'E') OR (OBLIGATION_KEY IS NOT NULL AND STATUS IN ('N', 'P', 'PR',<br>'PW')) OR (CE_ID IS NOT NULL AND STATUS IN ('N', 'P', 'PR', 'PW')))<br>|
|Column Level|ERROR_IND||

---

## Table: ALC_HEAD_TEMP

**Description:** The ALC_HEAD_TEMP table temporarily holds selected records from the alc_head table and delete them upon procsesing.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ORDER_NO |  |  |  | NUMERIC (12) | This column contains the order number that the actual landed cost information is attached to. |
| 2 | SEQ_NO |  |  |  | NUMERIC (10) | This column contains a unique identifier for the record. |
| 3 | ITEM |  |  |  | VARCHAR (25) | This column contains the unique identifier for the item. |
| 4 | PACK_ITEM |  |  |  | VARCHAR (25) | This column contains the number of the pack to which the item is associated (if the item is in a buyer pack). |
| 5 | PROCESSED_IND |  |  |  | VARCHAR (1) | This column indicates whether or not the order/item record has been processed. |
| 6 | VARIANCE_PCT |  |  |  | NUMERIC (12,4) | This column contains the percent variance per order_no. |
| 7 | OBLIGATION_KEY |  |  |  | NUMERIC (10) | Contains the unique sequence number that is used to distinguish between the different obligations. |
| 8 | ASN |  |  |  | VARCHAR (30) | This column will hold the Advance Shipping Notice number associated with the ALC_HEAD_TEMP record |
| 9 | SHIPMENT |  |  |  | NUMERIC (12) | This contains the shipment reference number. |

---

## Table: ALLOC_CHRG

**Description:** The ALLOC_CHRG table contains Up Charge components and their associated information for a given allocation/from location/to location/item combination. These Up Charges are incurred when shipping the items between the from and the to locations.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ALLOC_NO | P | F | Y | NUMERIC (10) | This column contains the number that uniquely identifies the allocation within the system. |
| 2 | TO_LOC | P | F | Y | NUMERIC (10) | This column contains the To Location on the allocation. |
| 3 | ITEM | P | F | Y | VARCHAR (25) | This column contains the item on the allocation, or a component item of a buyer pack that is on the allocation. This column is part of the primary key to ensure record uniqueness when the item on the allocation is a buyer pack since Up Charge components are associated to the component items in the buyer pack and not the buyer pack itself. |
| 4 | COMP_ID | P | F | Y | VARCHAR (10) | This column contains the unique identifier of the Up Charge component. |
| 5 | TO_LOC_TYPE |  |  | Y | VARCHAR (1) | This column contains the To Location type on the allocation. Valid values are Store or Warehouse. |
| 6 | PACK_ITEM |  | F |  | VARCHAR (25) | This column contains the unique identifier for a buyer pack when the buyer pack is on the allocation. |
| 7 | COMP_RATE |  |  | Y | NUMERIC (20,4) | This column contains the rate to be charged against the weighted average cost of the Item/To Location combinations within the department. The value in this field will be a percentage if the calculation basis is V (Value), and a monetary amount if the calculation basis is S (Specific). |
| 8 | PER_COUNT |  |  |  | NUMERIC (12,4) | This column contains a count indicating the amount of the Per Count Unit of Measure to which the rate applies. This column will only contain |
| 9 | PER_COUNT_UOM |  | F |  | VARCHAR (4) | This column contains the unit of measure in which the Per Count is specified. This column will only contain a value if the calculation basis is S (Specific). When creating an Up Charge that is defined as $.20 for every 10 kilograms of an item shipped, the Per Count UOM would be the Unit of Measure code for Kilograms. |
| 10 | UP_CHRG_GROUP |  |  | Y | VARCHAR (6) | This column contains the rate to be charged against the weighted average cost of the Item/To Location combinations within the department. The value in this field will be a percentage if the calculation basis is V (Value), and a monetary amount if the calculation basis is S (Specific). Valid values can be found on the codes table with a code type of UPCG. |
| 11 | COMP_CURRENCY |  | F | Y | VARCHAR (3) | This column contains the currency of the Up Charge component. |
| 12 | DISPLAY_ORDER |  |  | Y | VARCHAR (2) | This column contains the order in which the components should be displayed. A value of 0 (zero) indicates that the component will not be displayed in the form, but the associated value will be included in the calculations. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ALLOC_CHRG|PK||||ALLOC_NO|ASC|
||||||TO_LOC|ASC|
||||||ITEM|ASC|
||||||COMP_ID|ASC|
|ALLOC_CHRG_I1|||||ITEM|ASC|
|ALLOC_CHRG_I5|||||PACK_ITEM|ASC|
|ALLOC_CHRG_I4|||||PER_COUNT_UOM|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|ALLOC_CHRG_I3|||||COMP_CURRENCY|ASC|
|ALLOC_CHRG_I2|||||COMP_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ALLOC_CHG_TO_LOC_TYPE|TO_LOC_TYPE IN ('S', 'W')<br>|

---

## Table: ALLOC_CHRG_TEMP

**Description:** The ALLOC_CHRG_TEMP table holds the same information as the alloc_chrg table and will serve as a holding table for allocation upcharges associated to an approved order that is being redistributed. The table also serves as a holding table when a user wants to revert back to an order before it was scaled.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ALLOC_NO | P | F | Y | NUMERIC (10) | This column contains the number that uniquely identifies the allocation within the system. |
| 2 | TO_LOC | P | F | Y | NUMERIC (10) | This column contains the To Location on the allocation. |
| 3 | ITEM | P | F | Y | VARCHAR (25) | This column contains the item on the allocation, or a component item of a buyer pack that is on the allocation. This column is part of the primary key to ensure record uniqueness when the item on the allocation is a buyer pack since Up Charge components are associated to the component items in the buyer pack and not the buyer pack itself. |
| 4 | COMP_ID | P | F | Y | VARCHAR (10) | This column contains the unique identifier of the Up Charge component. |
| 5 | TO_LOC_TYPE |  |  | Y | VARCHAR (1) | This column contains the To Location Type on the allocation. Valid values are Store or Warehouse. |
| 6 | PACK_ITEM |  | F |  | VARCHAR (25) | This column contains the unique identifier for a buyer pack when the buyer pack is on the allocation. |
| 7 | COMP_RATE |  |  | Y | NUMERIC (20,4) | This column contains the rate to be charged against the weighted average cost of the Item/To Location combinations within the department. The value in this field will be a percentage if the calculation basis is V (Value), and a monetary amount if the calculation basis is S (Specific). |
| 8 | PER_COUNT |  |  |  | NUMERIC (12,4) | This column contains a count indicating the amount of the Per Count Unit of Measure to which the rate applies. This column will only contain a value if the calculation basis is S (Specific). When creating an Up Charge that is defined as $.20 for every 10 kilograms of an item shipped, the Per Count would be 10. |
| 9 | PER_COUNT_UOM |  | F |  | VARCHAR (4) | This column contains the unit of measure in which the Per Count is specified. This column will only contain a value if the calculation basis is S (Specific). When creating an Up Charge that is defined as $.20 for every 10 kilograms of an item shipped, the Per Count UOM would be the Unit of Measure code for Kilograms. |
| 10 | UP_CHRG_GROUP |  |  | Y | VARCHAR (6) | This column contains the rate to be charged against the weighted average cost of the Item/To Location combinations within the department. The value in this field will be a percentage if the calculation basis is V (Value), and a monetary amount if the calculation basis is S (Specific). Valid values can be found on the codes table with a code type of UPCG. |
| 11 | COMP_CURRENCY |  | F | Y | VARCHAR (3) | This column contains the currency of the Up Charge component. |
| 12 | DISPLAY_ORDER |  |  | Y | NUMERIC (2) | This column contains the order in which the components should be displayed. A value of 0 (zero) indicates that the component will not be displayed in the form, but the associated value will be included in the calculations. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ALLOC_CHRG_TEMP|PK||||ALLOC_NO|ASC|
||||||TO_LOC|ASC|
||||||ITEM|ASC|
||||||COMP_ID|ASC|
|ALLOC_CHRG_TEMP_I2|||||COMP_ID|ASC|
|ALLOC_CHRG_TEMP_I3|||||PER_COUNT_UOM|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|ALLOC_CHRG_TEMP_I4|||||PACK_ITEM|ASC|
|ALLOC_CHRG_TEMP_I1|||||COMP_CURRENCY|ASC|
|ALLOC_CHRG_TEMP_I5|||||ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ALLOC_CHRG_TEMP_TO_LOC_TYP|TO_LOC_TYPE in ('S', 'W')<br>|

---

## Table: ALLOC_DETAIL

**Description:** This table contains one row for every allocation store/warehouse combination. Allocations can be attached to a purchase order or can be created as standalone.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ALLOC_NO | P | F | Y | NUMERIC (10) | This column contains the number that uniquely identifies the allocation within the system. |
| 2 | TO_LOC | P |  | Y | NUMERIC (10) | This column contains the location to which the allocation is being sent. The loc_type field determines if the location is a store or a warehouse. |
| 3 | TO_LOC_TYPE |  |  | Y | VARCHAR (1) | This column contains the type of location in the location field. Valid values are Store and Warehouse. |
| 4 | QTY_TRANSFERRED |  |  |  | NUMERIC (12,4) | This column contains the number of items that have already been transferred under this allocation. |
| 5 | QTY_ALLOCATED |  |  | Y | NUMERIC (12,4) | This column contains the total number of items allocated. |
| 6 | QTY_PRESCALED |  |  | Y | NUMERIC (12,4) | This column contains the allocation quantity (system generated or manually generated) for the item/location before order scaling processing was performed. |
| 7 | QTY_DISTRO |  |  |  | NUMERIC (12,4) | This column contains the final quantity that the external system plans on filling. |
| 8 | QTY_SELECTED |  |  |  | NUMERIC (12,4) | This column contains the initial quantity that the external system plans on filling. |
| 9 | QTY_CANCELLED |  |  |  | NUMERIC (12,4) | This column contains the quantity that was left to be allocated when the line item was cancelled. |
| 10 | QTY_RECEIVED |  |  |  | NUMERIC (12,4) | This column contains the quantity of the item which has been received at the to location on the allocation. |
| 11 | QTY_RECONCILED |  |  |  | NUMERIC (12,4) | This column contains the quantity received at another location for this allocated item. It is populated when adjustment type ( shipsku.adjust_type) is Received Elsewhere .... |
| 12 | PO_RCVD_QTY |  |  |  | NUMERIC (12,4) | This column tracks the quantity received against a cross-docked order. It is only used to distribute unallocated quantities that are received in a physical warehouse. |
| 13 | NON_SCALE_IND |  |  | Y | VARCHAR (1) | This column determines if the item/locations allocation quantity should not be scaled during the order scaling process. Valid values include: Y - Yes. Fix the allocation quantity to ensure that the item/location allocation quantity is not adjusted during the order scaling process. N - No. Do not fix the allocation quantity to ensure that the item/location allocation quantity will be adjusted during the order scaling process. |
| 14 | IN_STORE_DATE |  |  |  | Date | This column contains the date to be included in the RMS publication (Oracle Retail Service Layer) to the RIB for communication to the warehouse. |
| 15 | RUSH_FLAG |  |  |  | VARCHAR (1) | This column contains the rush flag indicator to be included in the RMS publication (Oracle Retail Service Layer) to the RIB for communication to the warehouse. |
| 16 | WF_ORDER_NO |  | F | Y | NUMERIC (10) | This field holds the franchise order number this allocation detail line is linked to. |
| 17 | PROCESSED_IND |  |  | Y | VARCHAR (1) | Indicates if a book transfer has been created for the allocation detail. It is defaulted to 'N' and only applicable to warehouse sourced allocations. Once set to 'Y', the allocation detail cannot be modified. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ALLOC_DETAIL|PK||||ALLOC_NO|ASC|
||||||TO_LOC|ASC|
|ALLOC_DETAIL_I1|||||WF_ORDER_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ALLOC_DETAIL_NON_SCALE_IND|NON_SCALE_IND IN ('Y','N')<br>|
||CHK_ALLOC_DETAIL_PROCESSED_IND|PROCESSED_IND in ('Y','N')<br>|
||CHK_ALLOC_DETAIL_RUSH_FLAG|RUSH_FLAG in ('Y','N')<br>|
||CHK_ALLOC_DETAIL_TO_LOC_TYPE|to_loc_type in ('S', 'W')<br>|
|Column Level|NON_SCALE_IND||
||RUSH_FLAG||
||PROCESSED_IND||

---

## Table: ALLOC_DETAILS_PUBLISHED

**Description:** This table helps in publication of the business transacation. It is done by recording whether or not a detail record has been published. It is also used to create ROUTING_INFO, especially useful in detail deletes (DTL_DEL).

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ALLOC_NO | P |  | Y | NUMERIC (10) | This column contains the number that uniquely identifies an allocation within the system. |
| 2 | TO_LOC_VIR | P |  | Y | NUMERIC (10) | This column specifies which detail record has been published. It corresponds to the to_loc column on the alloc_detail table, which is the |
| 3 | DETAIL_EXISTS_IND |  |  | Y | VARCHAR (1) | This column specifies whether or not the corresponding detail record exists on the container. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ALLOC_DETAILS_PUBLISHED|PK||||ALLOC_NO|ASC|
||||||TO_LOC_VIR|ASC|

---

## Table: ALLOC_DETAIL_TEMP

**Description:** This table contains the same information as that of the alloc_detail table. It also serves as a holding table for allocation records pertaining to items on an order being redistributed.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ALLOC_NO | P |  | Y | NUMERIC (10) | This column contains the number that uniquely identifies the allocation within the system. |
| 2 | TO_LOC | P |  | Y | NUMERIC (10) | This column contains the location to which the allocation is being sent. The loc_type field determines if the location is a store or a warehouse. |
| 3 | TO_LOC_TYPE |  |  | Y | VARCHAR (1) | This column contains the type of location in the location field. Valid values are Store and Warehouse. |
| 4 | QTY_TRANSFERRED |  |  |  | NUMERIC (12,4) | This column contains the number of items that have already been transferred under this allocation. |
| 5 | QTY_ALLOCATED |  |  | Y | NUMERIC (12,4) | This column contains the total number of items allocated. |
| 6 | QTY_PRESCALED |  |  | Y | NUMERIC (12,4) | This column contains the allocation quantity (system generated or manually generated) for the item/location before order scaling processing was performed. |
| 7 | QTY_DISTRO |  |  |  | NUMERIC (12,4) | This column contains the final quantity that the external system plans on filling. |
| 8 | QTY_SELECTED |  |  |  | NUMERIC (12,4) | This column contains the initial quantity that the external system plans on filling. |
| 9 | QTY_CANCELLED |  |  |  | NUMERIC (12,4) | This column contains the quantity that was left to be allocated when the line item was cancelled. |
| 10 | QTY_RECEIVED |  |  |  | NUMERIC (12,4) | This column contains the quantity of the item which has been received at the to location on the allocation. |
| 11 | PO_RCVD_QTY |  |  |  | NUMERIC (12,4) | This column tracks the qty received against a cross-docked order. It is only used to distribute unallocated quantities that are received in a physical warehouse. |
| 12 | NON_SCALE_IND |  |  | Y | VARCHAR (1) | This column determines if the item/locations allocation quantity should not be scaled during the order scaling process. Valid values include: Y - Yes. Fix the allocation quantity to ensure that the item/location allocation quantity is not adjusted during the order scaling process. N - No. Do not fix the allocation quantity to ensure that the item/location allocation quantity will be adjusted during the order scaling process. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ALLOC_DETAIL_TEMP|PK||||ALLOC_NO|ASC|
||||||TO_LOC|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ALLOC_DETAIL_TEMP_NON_SI|non_scale_ind in ('Y','N')<br>|
||CHK_ALLOC_DETAIL_TEMP_TO_LOC_T|to_loc_type in ('S', 'W')<br>|
|Column Level|NON_SCALE_IND||

---

## Table: ALLOC_HEADER

**Description:** This table contains header level information for the allocation of a SKU from a warehouse to a group of stores or other warehouses.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ALLOC_NO | P |  | Y | NUMERIC (10) | This column contains the number that uniquely identifies the allocation within the system. |
| 2 | ORDER_NO |  |  |  | NUMERIC (12) | This column contains the order number to which the allocation applies. |
| 3 | WH |  | F | Y | NUMERIC (10) | This column contains the number of the warehouse location from where the allocation originates. |
| 4 | ITEM |  |  | Y | VARCHAR (25) | This column contains a unique alphanumeric value that identifies the item. |
| 5 | STATUS |  |  | Y | VARCHAR (1) | This column contains the status of the allocation. Valid values are: W = Worksheet, R = Reserved, A = Approved, C = Closed, X = Allocation is being externally closed. Note: X is a dummy status only being used in integration processing and should never be saved to the table. |
| 6 | ALLOC_DESC |  |  | Y | VARCHAR (300) | This column contains the description of the allocation. |
| 7 | PO_TYPE |  | F |  | VARCHAR (4) | This column contains the value associated with the PO_TYPE for the order. |
| 8 | ALLOC_METHOD |  |  | Y | VARCHAR (1) | This column contains the preferred allocation method which is used to distribute goods when the stock received at a warehouse cannot immediately fill all requested allocations to stores. Valid values are: A - Allocation quantity based, P - Prorate method, C - Custom |
| 9 | RELEASE_DATE |  |  |  | Date | This column contains the date on which the allocation should be released from the warehouse for delivery to the store locations. |
| 10 | ORDER_TYPE |  | F |  | VARCHAR (9) | This column identifies the type of the order. Allocations created against Purchase Orders will be marked as PREDIST order types. Allocations created against Warehouse stock will be populated with the DEFAULT_ORDER_TYPE from the SYSTEM_OPTIONS table which can be AUTOMATIC, MANUAL or WAVE. |
| 11 | CONTEXT_TYPE |  |  |  | VARCHAR (6) | This column contains the functional area code to which the transfer relates to, for example, Promotions. Valid values are: PROM - Promotion |
| 12 | CONTEXT_VALUE |  |  |  | VARCHAR (25) | This column contains the value relating to the context type, for example, Promotion Number. |
| 13 | COMMENT_DESC |  |  |  | VARCHAR (2000) | This column contains additional information concerning the allocation. |
| 14 | DOC |  |  |  | VARCHAR (30) | This column contains the ASN or BOL number for an ASN or BOL sourced allocation. This will be populated for the product source of the tier one allocation. |
| 15 | DOC_TYPE |  |  |  | VARCHAR (5) | This column contains the type of allocation product source. |
| 16 | ALLOC_PARENT |  |  |  | NUMERIC (10) | This column contains allocation numbers for all MLD allocations that are not the original product source. In an MLD allocation, any tier that is not the product source of an allocation will be populated with the allocation number the tier is sourcing from. This column will allow for a linking within RMS between all tiers of an MLD allocation. This includes WH stock on hand portions of an MLD allocation. If a non MLD retailer is |
| 17 | ORIGIN_IND |  |  | Y | VARCHAR (6) | This column identifies the origin point of the allocation. Valid values are: AIP, EG, RMS, ALC |
| 18 | CLOSE_DATE |  |  |  | Date | This column contains the date when the allocation is closed. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ALLOC_HEADER|PK||||ALLOC_NO|ASC|
|ALLOC_HEADER_I2|||||ITEM|ASC|
|ALLOC_HEADER_I4|||||WH|ASC|
|ALLOC_HEADER_I8|||||ALLOC_PARENT|ASC|
||||||STATUS|ASC|
|ALLOC_HEADER_I1|||||ORDER_NO|ASC|
||||||ITEM|ASC|
||||||WH|ASC|
|ALLOC_HEADER_I5|||||ORDER_TYPE|ASC|
|ALLOC_HEADER_I7|||||ITEM|ASC|
||||||WH|ASC|
||||||ORDER_NO|ASC|
|ALLOC_HEADER_I6|||||ALLOC_NO|ASC|
||||||STATUS|ASC|
|ALLOC_HEADER_I3|||||PO_TYPE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ALLOC_HEADER_ALLOC_METHOD|ALLOC_METHOD IN ('A', 'P', 'C')<br>|
||CHK_ALLOC_HEADER_DOC_TYPE|DOC_TYPE in ('BOL', 'TSF', 'ALLOC', 'ASN', 'PO')<br>|
||CHK_ALLOC_HEADER_ORIGIN_IND|ORIGIN_IND IN ('AIP', 'EG', 'RMS', 'ALC')<br>|
||CHK_ALLOC_HEADER_STATUS|STATUS IN ('W', 'R', 'A', 'C','X')<br>|
|Column Level|STATUS||
||ALLOC_METHOD||
||ORIGIN_IND||

---

## Table: ALLOC_HEADER_TEMP

**Description:** This table holds the same information as that of the alloc_header table. It also serves as a holding table for allocation records pertaining to items on an order being redistributed.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ALLOC_NO | P |  | Y | NUMERIC (10) | This column contains the number that uniquely identifies the allocation within the system. |
| 2 | ORDER_NO |  |  |  | NUMERIC (12) | This column contains the order number to which the allocation applies. |
| 3 | WH |  |  | Y | NUMERIC (10) | This column contains the number of the warehouse location from where the allocation originates. |
| 4 | ITEM |  |  | Y | VARCHAR (25) | This column contains the stock keeping unit (SKU) that is being allocated. |
| 5 | STATUS |  |  | Y | VARCHAR (1) | This column contains the status of the allocation. Valid values are: W = Worksheet, R = Reserved, A = Approved, C = Closed |
| 6 | ALLOC_DESC |  |  | Y | VARCHAR (300) | This column contains the description of the allocation. |
| 7 | PO_TYPE |  |  |  | VARCHAR (4) | This column contains the value associated with the PO_TYPE for the order. |
| 8 | ALLOC_METHOD |  |  | Y | VARCHAR (1) | This column contains the preferred allocation method, which is used to distribute goods when the stock received at a warehouse cannot immediately fill all requested allocations to stores. Valid values are: A - Allocation quantity based, P - Prorate method, C - Custom |
| 9 | RELEASE_DATE |  |  |  | Date | This column contains the date on which the allocation should be released from the warehouse for delivery to the store locations. |
| 10 | ORDER_TYPE |  | F |  | VARCHAR (9) | This column identifies the order type associated with the PO. Allocations created before PO approval will be marked as PREDIST order types. Allocations created after PO approval will be marked as PO order types. |
| 11 | ORIGIN_IND |  |  | Y | VARCHAR (6) | This column identifies the origin point of the allocation. Valid values are: AIP, EG, RMS, ALC. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ALLOC_HEADER_TEMP|PK||||ALLOC_NO|ASC|
|ALLOC_HEADER_TEMP_I4|||||ITEM|ASC|
|ALLOC_HEADER_TEMP_I5|||||ORDER_TYPE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_ALLOC_HEADER_TEMP_ALLMETH|ALLOC_METHOD IN ('A', 'P', 'C')<br>|
||CHK_ALLOC_HEADER_TEMP_OR_IND|ORIGIN_IND IN ('AIP', 'EG', 'RMS', 'ALC')<br>|
||CHK_ALLOC_HEADER_TEMP_STATUS|STATUS IN ('W', 'R', 'A', 'C')<br>|
|Column Level|STATUS||
||ALLOC_METHOD||
||ORIGIN_IND||

---

## Table: ALLOC_MFQUEUE

**Description:** This table is a staging table for allocation messages as they wait to be sent over the Integration Bus.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | This column contains the seq_no for the record. |
| 2 | ALLOC_NO |  |  |  | NUMERIC (10) | This column contains the allocation number for the message. |
| 3 | TO_LOC |  |  |  | NUMERIC (25) | This column contains the location number for the allocation. |
| 4 | MESSAGE_TYPE |  |  |  | VARCHAR (15) | This column contains the message type. The message type informs the subscriber the kind of message that will be received. |
| 5 | THREAD_NO |  |  |  | NUMERIC (4) | This column contains the thread on which the business transaction will be published. Each business object has only one thread_no. |
| 6 | FAMILY |  |  |  | VARCHAR (30) | This column contains the functional area that this transaction belongs to. |
| 7 | CUSTOM_MESSAGE_TYPE |  |  |  | VARCHAR (1) | This column is not used by RMS. |
| 8 | PUB_STATUS |  |  |  | VARCHAR (1) | This column contains the publish status for the message. Valid values are Unpublished, Need Details |
| 9 | TRANSACTION_NUMBER |  |  |  | NUMERIC (10) | This column contains the business transaction key. |
| 10 | TRANSACTION_TIME_STAMP |  |  |  | Date | This column contains the business transaction key. |

---

## Table: ALLOC_PUB_INFO

**Description:** This table helps in publication of the business transacation. It is done by tracking the state of the business transaction and holding any information that can be populated at the header level and used in detail-level publication.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ALLOC_NO | P |  | Y | NUMERIC (10) | This column contains the number that uniquely identifies the allocation within the system. |
| 2 | INITIAL_APPROVAL_IND |  |  |  | VARCHAR (1) | This column indicates whether or not the transaction has been initially approved. It is used by the detail level triggers (ADDTOQ) to determine if they should write records to the queue. |
| 3 | THREAD_NO |  |  |  | NUMERIC (6) | This column contains the thread on which the business transaction will be published. |
| 4 | WH |  |  |  | VARCHAR (10) | This column contains the number of the warehouse location from where the allocation originates. |
| 5 | PHYSICAL_WH |  |  |  | VARCHAR (10) | This column contains the physical_wh value for the warehouse in the WH field. |
| 6 | ITEM |  |  |  | VARCHAR (25) | This column contains a unique alphanumeric value that identifies the item. |
| 7 | PACK_IND |  |  |  | VARCHAR (1) | This column indicates if the item is a pack. |
| 8 | SELLABLE_IND |  |  |  | VARCHAR (1) | This column indicates if the pack item may be sold as a unit. This field will only be available if the item is a pack item. |
| 9 | PUBLISHED |  |  |  | VARCHAR (1) | This column indicates whether or not the transaction was initially published. |

---

## Table: ALLOC_PURGE_QUEUE

**Description:** This table contains the details of the allocation based on inventory existing in a warehouse to be purged from the system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ALLOC_NO |  |  |  | NUMERIC (12) | This field contains the number that uniquely identifies the Allocation within the system. |
| 2 | CHILD_ALLOC_NO |  |  |  | NUMERIC (12) | This field contains the number that uniquely identifies the second leg of a two legged Allocation within the system. |
| 3 | FROM_LOC |  |  |  | NUMERIC (10) | This field contains the location number of the transfer from location. This field will contain a store, internal finisher, external finisher or warehouse number based upon the FROM_LOC_TYPE field. An internal finisher is a warehouse and an external finisher is a partner. |
| 4 | FROM_LOC_TYPE |  |  |  | VARCHAR (1 ) | This field contains the location type of the from location of the transfer. S - Store, W - Warehouse (for warehouse and internal finishers) E - External Finisher (on PARTNER table) |

---

## Table: ALLOC_REV

**Description:** This table contains the allocation revision history.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ALLOC_NO | P |  | Y | NUMERIC (10) | This column contains the number that uniquely identifies this allocation in the system. |
| 2 | REV_NO | P |  | Y | NUMERIC (6) | This column contains an incremental counter of the number of revisions for a particular allocation. |
| 3 | LOCATION | P |  | Y | NUMERIC (10) | This column contains the store or warehouse number where the allocation will be received. It will hold only virtual warehouses. |
| 4 | LOC_TYPE |  |  | Y | VARCHAR (1) | This column indicates whether the location is a store or a warehouse. Valid values are: S for store and W for warehouse. |
| 5 | ORDER_NO |  |  | Y | NUMERIC (12) | This column contains the number that uniquely identifies an order in the system. |
| 6 | WH |  |  | Y | NUMERIC (10) | This column contains the warehouse location from where the allocation is from. |
| 7 | QTY_TRANSFERRED |  |  |  | NUMERIC (12,4) | This column contains the number of items that have already been transferred under this allocation. |
| 8 | QTY_ALLOCATED |  |  | Y | NUMERIC (12,4) | This column contains the total number of items allocated. |
| 9 | QTY_PRESCALED |  |  | Y | NUMERIC (12,4) | This column contains the alloction quantity (system generated or manually generated) for the item/location before order scaling processing was performed. |
| 10 | NON_SCALE_IND |  |  | Y | VARCHAR (1) | This column determines if the item/locations allocation quantity should not be scaled during the order scaling process. Valid values include: Y-Yes. Fix the allocation quanity to ensure the item/location allocation quantity is not adjusted during the order scaling process. N-No. Do not |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_ALLOC_REV|PK||||ALLOC_NO|ASC|
||||||REV_NO|ASC|
||||||LOCATION|ASC|
|ALLOC_REV_I1|||||ORDER_NO|ASC|
||||||REV_NO|ASC|
