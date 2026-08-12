# RMS Invoice Matching (ReIM) & Invoicing Datamodel - Physical Data Model Reference

## Table: DOC

**Description:** This table is used to store strings of pre-written text to be attached to a given item to be printed at the Letter of Credit, Logistics, Customs Entry, Purchase Order, and Item modules. These texts are crucial in that they provide needed information in all areas of the system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DOC_ID | P |  | Y | NUMERIC (6) | An assigned sequence number to distinguish between the different documents. |
| 2 | DOC_DESC |  |  | Y | VARCHAR (120) | A full description or name of the document type. |
| 3 | DOC_TYPE |  |  | Y | VARCHAR (6) | Specifies the type of document. Valid values are: REQ - Required Documents, SI - Special Instructions Additional types can be added using the codes table. |
| 4 | LC_IND |  |  | Y | VARCHAR (1) | This column indicates whether or not the document is a Letter of Credit document. Letter of Credit documents are not modifiable in any other dialog besides Letter of Credit. |
| 5 | SWIFT_TAG |  |  |  | VARCHAR (6) | A pre-established identifier for company-to-bank electronic exchange. (43B, 44A, 46C, etc) |
| 6 | SEQ_NO |  |  |  | NUMERIC (4) | This number is an indicator of what order documents should go in on any given Letter of Credit. |
| 7 | TEXT |  |  | Y | VARCHAR (2000) | Contains the actual text of the document. |
| 8 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 9 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Constraints

|Type|Column /<br>Constraint Name|Details|
|---|---|---|
|Table Level|CHK_DOC_LC_IND|LC_IND in ('Y','N')<br>|
|Column Level|LC_IND||

---

## Table: DOC_CLOSE_QUEUE

**Description:** This table records unappointed receipts (POs, Transfer or Allocation). These records have no corresponding Appointment record within RMS. The Document Close batch, when run, will utilize these records in attempting to close out the Receipts. These receipts cannot be closed via appointment processing.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DOC |  |  | Y | NUMERIC (12) | This field holds the unique identifier for un-Appointed Purchase Order, Transfer or Allocation ID. |
| 2 | DOC_TYPE |  |  | Y | VARCHAR (1) | This field indicates the type of Document held in the doc field: P = Purchase Order T = Transfer A = Allocation |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|DOC_CLOSE_QUEUE_I1|||||DOC_TYPE|ASC|
||||||DOC|ASC|

---

## Table: DOC_CLOSE_QUEUE_TEMP

**Description:** This is a global temporary table used to hold filtered data from DOC_CLOSE_QUEUE.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DOC |  |  | Y | NUMERIC (12) | This field holds the unique identifier for un-Appointed Purchase Order, Transfer or Allocation ID. |
| 2 | DOC_TYPE |  |  | Y | VARCHAR (1) | This field indicates the type of Document held in the doc field: P = Purchase Order T = Transfer A = Allocation |

---

## Table: DOC_LINK

**Description:** This table is used to store the module and type of document that should be displayed in the appropriate dialogues.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | MODULE | P |  | Y | VARCHAR (6) | Specifies the module with which any given documents of a particular type will be displayed. Valid values are: IT - Item Maintenance, PO - Purchase Orders, CE - Customs Entry, CTRY - Country, PTNR - Partner, SUPP - Supplier, HTSC - Harmonized Tariff Schedule Chapter |
| 2 | DOC_TYPE | P |  | Y | VARCHAR (6) | Specifies the type of document to be attached to the given module. Valid values are: REQ - Required Documents, SI - Special Instructions |

---

## Table: DOC_PURGE_QUEUE

**Description:** This table contains the details of the transfers to be purged from the system. This table is used to improve performance of transfer purge batch.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TSF_NO |  |  |  | NUMERIC (12) | This field contains the number that uniquely identifies the transfer within the system. |
| 2 | CHILD_TSF_NO |  |  |  | NUMERIC (12) | This field contains the number that uniquely identifies the second leg of a two legged transfer within the system. |
| 3 | TO_LOC |  |  |  | NUMERIC (10) | This field contains the location number of the transfer to location. This field will contain a store, internal finisher, external finisher or warehouse number based upon the TO_LOC_TYPE field. An internal finisher is a warehouse and an external finisher is a partner. |
| 4 | TO_LOC_TYPE |  |  |  | VARCHAR (1) | This field contains the type of location to which goods will be transferred. This column can contain either S for Store, W for Warehouse or Internal Finisher, or E for External Finisher. |
| 5 | FROM_LOC |  |  |  | NUMERIC (10) | This field contains the location number of the transfer from location. This field will contain a store, internal finisher, external finisher or warehouse number based upon the FROM_LOC_TYPE field. An internal finisher is a warehouse and an external finisher is a partner. |
| 6 | FROM_LOC_TYPE |  |  |  | VARCHAR (1) | This field contains the location type of the from location of the transfer. S - Store, W - Warehouse (for warehouse and internal finishers) E - External Finisher (on PARTNER table) |

---

## Table: DOC_TL

**Description:** This is the translation table for DOC table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG |  | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | DOC_ID |  | F | Y | NUMERIC (6) | An assigned sequence number to distinguish between the different documents. |
| 3 | DOC_DESC |  |  | Y | VARCHAR (120) | A full description or name of the document type. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 6 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 7 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_DOC_TL|UK||||LANG|ASC|
||||||DOC_ID|ASC|

---

## Table: IIF_DETAIL

**Description:** This table will hold one record for every SKU/receipt matched in the system, to be transmitted to the financial system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_ID |  |  | Y | NUMERIC (10) | Oracle Retail invoice number. |
| 2 | ITEM |  |  | Y | VARCHAR (25) | Unique identifier for the item. |
| 3 | PAYMENT_UNIT_COST |  |  |  | NUMERIC (20,4) | Unit cost that is being paid for the SKU. This field will be held in the invoice currency. |
| 4 | PAYMENT_VAT_RATE |  |  |  | NUMERIC (20,10) | VAT rate that is being applied to the SKU. |
| 5 | COST_DSCRPNCY_IND |  |  | Y | VARCHAR (1) | Indicates if there was a cost discrepancy on this line match. |
| 6 | QTY_DSCRPNCY_IND |  |  | Y | VARCHAR (1) | Indicates if there was a quantity discrepancy on this line match. |
| 7 | VAT_DSCRPNCY_IND |  |  | Y | VARCHAR (1) | Indicates if there was a VAT rate discrepancy on this line match. |
| 8 | PAYMENT_QTY |  |  |  | NUMERIC (12,4) | Quantity of the SKU that is being paid for. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|IIF_DETAIL_I1|||||INVC_ID|ASC|

---

## Table: IIF_DISCOUNT

**Description:** This staging table will hold any transaction-level discounts associated with the invoice being posted to financials. It mirrors the INVC_DISCOUNT table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_ID | P |  | Y | NUMERIC (10) | ID of the invoice the discounts apply to |
| 2 | SEQ_NO | P |  | Y | NUMERIC (6) | Sequence number that uniquely identifies each invc_discount line associated with an invoice |
| 3 | DISCOUNT_TYPE |  |  | Y | VARCHAR (6) | Type of the discount. Valid values are P (percent) or A (amount). |
| 4 | DISCOUNT_VALUE |  |  | Y | NUMERIC (20,4) | Value of the discount, corresponding to the discount_type (e.g. 10%, or $100). If it is an amount, it will be held in the invoice currency. |
| 5 | APPLIES_TO_AMT |  |  |  | NUMERIC (20,4) | Amount of the invoice (total cost) that the discount applies to (e.g. discount of 10% off $1000 of the invoice). It will be held in the invoice currency. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_IIF_DISCOUNT|PK||||SEQ_NO|ASC|
||||||INVC_ID|ASC|

---

## Table: IIF_HEAD

**Description:** This table will hold a row for each invoice in the system that is to be transmitted to the financial system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_ID |  |  | Y | NUMERIC (10) | Oracle Retail invoice or settlement number. |
| 2 | INVC_TYPE |  |  | Y | VARCHAR (1) | Type of the invoice. Valid values are I for merchandise invoice, N for non-merchandise invoice, O for consignment invoice, C for credit note, D for debit memo, and M for credit memo. |
| 3 | SUPPLIER |  |  |  | NUMERIC (10) | Invoice suppliers number. |
| 4 | PARTNER_TYPE |  |  |  | VARCHAR (6) | Type of partner assigned to the invoice. Valid values include Bank BK, Agent AG, Freight Forwarder FF, Importer IM, Broker BR, Factory FA, Applicant AP, Consolidator CO, Consignee CN, Supplier Hierarchy Level 1 S1, Supplier Hierarchy Level 2 S2, and Supplier Hierarchy Level 3 S3. These partner types will be held on the codes table under the code_type PTAL. |
| 5 | PARTNER_ID |  |  |  | VARCHAR (10) | Partner assigned to the invoice. Partners can be assigned to any invoice type except merchandise invoices. |
| 6 | EXT_REF_NO |  |  |  | VARCHAR (30) | Any given supplier-generated invoice number. |
| 7 | PAYMENT_STATUS |  |  | Y | VARCHAR (1) | Payment status of the invoice. Valid values include: H - Hold payment, U - Pre-paid unmatched, M - Pre-paid matched, P - Ready for payment, C - Payment completed |
| 8 | REF_INVC_ID |  |  |  | NUMERIC (10) | For invoice types C or D, the invoice that the credit note or debit memo was raised against. |
| 9 | REF_RTV_ORDER_NO |  |  |  | NUMERIC (10) | For invoice types C or D, the RTV that the credit note or debit memo was raised against. |
| 10 | REF_PRICE_CHANGE |  |  |  | NUMERIC (8) | The number that uniquely identifies a price change associated with this invoice. This is the number of the price change that is vendor funded and when the price change is extracted generates a credit memo invoice. |
| 11 | REF_RSN_CODE |  |  |  | VARCHAR (6) | For invoice types C or D, the reason why the credit note or debit memo was raised. Valid values include Q for quantity discrepancy, C for cost discrepancy, D for discount discrepancy, T for terms discount |
| 12 | TERMS |  |  |  | VARCHAR (15) | Indicator identifying the payment terms for the invoice. These terms specify when payment is due and if any discounts exist for early payment. |
| 13 | DUE_DATE |  |  | Y | Date | Date the invoice is due to be paid, defaulted according to the payment terms negotiated with the supplier. |
| 14 | PAYMENT_METHOD |  |  |  | VARCHAR (6) | Code identifying the payment method for the invoice, indicating how the invoice will be paid. Valid values include LC for letter of credit, WT for wire transfer, and OA for open account. Other values may be added by the client as desired. Payment methods will be held on the codes table under a code type of PAYM. |
| 15 | TERMS_DSCNT_APPL_IND |  |  | Y | VARCHAR (1) | Indicates whether or not the terms discount has been applied to the total cost of the invoice or not. Valid values are Y or N. |
| 16 | TERMS_DSCNT_PCT |  |  |  | NUMERIC (12,4) | Discount that will be applied to the invoice if the invoice is paid by the due date. |
| 17 | FREIGHT_TERMS |  |  |  | VARCHAR (30) | Indicator that references the freight terms associated with the invoice. |
| 18 | INVC_DATE |  |  | Y | Date | Date the invoice/credit note was issued by the supplier or the debit memo was issued by the retailer. |
| 19 | FORCE_PAY_IND |  |  | Y | VARCHAR (1) | Indicates whether or not the invoice is to be force paid (paid without being matched to receipts). Valid values are Y or N. |
| 20 | POST_DATE |  |  | Y | Date | Date the invoice was posted to the AP staging tables. |
| 21 | CURRENCY_CODE |  |  | Y | VARCHAR (3) | Code identifying the currency in which the invoice is held. |
| 22 | EXCHANGE_RATE |  |  |  | NUMERIC (20,10) | Exchange rate at which the invoice is held. |
| 23 | TOTAL_PAYMENT_MERCH_COST |  |  |  | NUMERIC (20,4) | Total merchandise cost of the invoice that is being paid/debited (excludes VAT and other non-merchandise costs). |
| 24 | TOTAL_PAYMENT_QTY |  |  |  | NUMERIC (12,4) | Total quantity of goods on the invoice that are being paid/debited for. |
| 25 | ADDR_KEY |  |  | Y | NUMERIC (11) | Indicates which vendor invoice address should be associated with the invoice. |
| 26 | PAYMENT_REF_NO |  |  |  | VARCHAR (16) | Reference number attached to the invoice payment, used when the invoice is paid from the POS system and interfaced through ReSA. |
| 27 | PAYMENT_DATE |  |  |  | Date | Date that the invoice was paid from the POS system. This field will be populated when the invoice is interfaced through ReSA. |
| 28 | PROOF_OF_DELIVERY_NO |  |  |  | VARCHAR (30) | Proof of delivery or service number, given at the time of receipt at the store. This field will be populated when the invoice is interfaced through ReSA. |
| 29 | DIRECT_IND |  |  | Y | VARCHAR (1) | Indicates whether the invoice was created for a direct store delivery order via the Quick Order Entry form in which the invoice was already paid. Valid values are Y - Yes and N - No. |
| 30 | COMMENTS |  |  |  | VARCHAR (255) | Free-form comments associated with the invoice. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|IIF_HEAD_I1|||||INVC_ID|ASC|
||||||SUPPLIER|ASC|
||||||PAYMENT_STATUS|ASC|

---

## Table: IIF_MATCH_DETAIL

**Description:** This table will hold match shipment information for each matched invoice line item.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_ID |  |  | Y | NUMERIC (10) | Oracle Retail invoice number. |
| 2 | ITEM |  |  | Y | VARCHAR (25) | Unique identifier for the item. |
| 3 | ORDER_NO |  |  | Y | NUMERIC (12) | Order number associated with the invoice line item. |
| 4 | ASN_NO |  |  |  | VARCHAR (30) | ASN number associated with the invoice line item. |
| 5 | SHIPMENT |  |  | Y | NUMERIC (12) | Shipment matched to the invoice line item. |
| 6 | RCPT_DATE |  |  |  | Date | Date the shipment matched to the invoice was received. |

---

## Table: IIF_MERCH_VAT

**Description:** This table will hold the VAT cost codes and total amount that VAT code is applied to for each invoice in the system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_ID |  |  | Y | NUMERIC (10) | Unique invoice number. |
| 2 | VAT_CODE |  |  | Y | VARCHAR (6) | Code identifying the VAT rate that should be applied to the cost amount entered in the total_cost_excl_vat field. |
| 3 | TOTAL_COST_EXCL_VAT |  |  | Y | NUMERIC (20,4) | Cost of the merchandise that will be charged VAT based on the vat_code specified. This field will be held in the invoice currency. |

---

## Table: IIF_NON_MERCH

**Description:** This table will hold all non-merchandise costs associated with each invoice, to be transmitted to the financial system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_ID |  |  | Y | NUMERIC (10) | Oracle Retail invoice number. |
| 2 | NON_MERCH_CODE |  |  | Y | VARCHAR (6) | Oracle Retail code identifying the non-merchandise cost being added to the invoice. Non-merchandise cost codes may be referenced to the codes table under the code type IMNM. |
| 3 | NON_MERCH_AMT |  |  | Y | NUMERIC (20,4) | Amount of the non-merchandise cost, specified by the non-merchandise code, that has been invoiced for. This field will be held in the invoice currency. |
| 4 | VAT_CODE |  |  |  | VARCHAR (6) | Code identifying the VAT rate that should be applied to the non_merch_amt entered. |
| 5 | SERVICE_PERF_IND |  |  | Y | VARCHAR (1) | Indicates if a service non-merchandise cost has actually been performed. Valid values are Y (service has been performed) or N (service has not been performed or non-merchandise cost is not a service cost) |
| 6 | STORE |  |  |  | NUMERIC (10) | Indicates the store at which the service was performed. It is optional and will only be populated for service non-merchandise lines. |

---

## Table: INVC_DETAIL

**Description:** This table contains one row for each SKU on an invoice. When an invoice header is purged, all associated rows on this table are also purged.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_ID | P | F | Y | NUMERIC (10) | Unique invoice number. |
| 2 | ITEM | P | F | Y | VARCHAR (25) | Unique identifier for the item. |
| 3 | REF_ITEM |  |  |  | VARCHAR (25) | The unique identifier for an item that references the other. |
| 4 | INVC_UNIT_COST | P |  | Y | NUMERIC (20,4) | Unit cost that the SKU has been invoiced at, as entered by the user. This value can be edited at any time until the invoice is matched. This field will be held in the invoice currency. |
| 5 | INVC_QTY |  |  | Y | NUMERIC (12,4) | Quantity of the SKU that has been invoiced for, as entered by the user. This value can be edited at any time until the invoice is matched. |
| 6 | INVC_VAT_RATE |  |  |  | NUMERIC (20,10) | VAT rate applied to the SKU that has been invoiced for, as entered by the user. This value can be edited at any time until the invoice is matched. |
| 7 | STATUS |  |  | Y | VARCHAR (1) | Status of the invoice line item. Valid values are U for unmatched, R for partially matched and M for matched. Invoice line match statuses will be held on the codes table under the code type IMDS. |
| 8 | ORIG_UNIT_COST |  |  |  | NUMERIC (20,4) | Unit cost that the SKU has been invoiced at, captured at the time of invoice entry. This value can be used to revert the invoice back to its original values after it has been edited. This field will be held in the invoice currency. |
| 9 | ORIG_QTY |  |  |  | NUMERIC (12,4) | Quantity of the SKU that has been invoiced for, captured at the time of invoice entry. This value can be used to revert the invoice back to its original values after it has been edited. |
| 10 | ORIG_VAT_RATE |  |  |  | NUMERIC (20,10) | VAT rate applied to the SKU that has been invoiced for. This value is captured at the time the invoice is entered and can be used to revert the invoice back to its original values after it has been edited. |
| 11 | COST_DSCRPNCY_IND |  |  | Y | VARCHAR (1) | Indicates if the invoice unit cost falls outside of tolerance of the receipt unit cost matched to it. Valid values are Y and N. |
| 12 | QTY_DSCRPNCY_IND |  |  | Y | VARCHAR (1) | Indicates if the invoice quantity falls outside of tolerance of the receipt quantity matched to it. Valid values are Y and N. |
| 13 | VAT_DSCRPNCY_IND |  |  | Y | VARCHAR (1) | Indicates if the invoice VAT rate is different than the VAT rate held in the system for the SKU. Valid values are Y and N. |
| 14 | PROCESSED_IND |  |  | Y | VARCHAR (1) | Indicator that can be used by the user to mark lines that have been looked at. Valid values are Y and N. |
| 15 | COMMENTS |  |  |  | VARCHAR (2000) | Comments attached to the line. Use of this field will only be available when the line has a discrepancy. |
| 16 | POST_DATE |  |  |  | Date | holds the date the record was added or changed |
| 17 | VAT_CODE |  | F |  | VARCHAR (6) | It contains the VAT code.It references to VAT_CODE of VAT_CODES table |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_INVC_DETAIL|PK||||INVC_ID|ASC|
||||||ITEM|ASC|
||||||INVC_UNIT_COST|ASC|
|INVC_DETAIL_I2|||||REF_ITEM|ASC|
|INVC_DETAIL_I1|||||ITEM|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_INVC_DETAIL_COST_DSCR_IND|cost_dscrpncy_ind in ('Y','N')<br>|
||CHK_INVC_DETAIL_PROCESSED_IND|processed_ind in ('Y','N')<br>|
||CHK_INVC_DETAIL_QTY_DSCR_IND|qty_dscrpncy_ind in ('Y','N')<br>|
||CHK_INVC_DETAIL_STATUS|status in ('U', 'R', 'M')<br>|
||CHK_INVC_DETAIL_VAT_DSCR_IND|vat_dscrpncy_ind in ('Y','N')<br>|
|Column Level|STATUS||
||COST_DSCRPNCY_IND||
||QTY_DSCRPNCY_IND||
||VAT_DSCRPNCY_IND||
||PROCESSED_IND||

---

## Table: INVC_DETAIL_TEMP

**Description:** This table contains one row for each SKU on an invoice. This table is written by the posupld batch program when It needs to update the data in the invc_detail table. The prepost batch program will then read the data from this table, update the invc_detail table and then truncate the data from the table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_DETAIL_ROWID |  |  | Y | VARCHAR (18) | This column contains the rowid of the invc_detail table. The prepost batch program will then use this rowid to update the invc_qty field on the invc_detail table. |
| 2 | INVC_QTY |  |  | Y | NUMERIC (12,4) | Quantity of the SKU that has been invoiced for, as entered by the user. This value can be edited at any time until the invoice is matched. |

---

## Table: INVC_DETAIL_TEMP2

**Description:** This table is created to insert the data INVC_DETAIL data in posupld.pc batch to avoid the primary key contention. This table will be truncated by prepost post posupld function.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_ID |  |  | Y | NUMERIC (10) | Unique invoice number. |
| 2 | ITEM |  |  | Y | VARCHAR (25) | Unique identifier for the item. |
| 3 | REF_ITEM |  |  |  | VARCHAR (25) | The unique identifier for an item that references the other. |
| 4 | INVC_UNIT_COST |  |  | Y | NUMERIC (20,4) | Unit cost that the SKU has been invoiced at, as entered by the user. This value can be edited at any time until the invoice is matched. This field will be held in the invoice currency. |
| 5 | INVC_QTY |  |  | Y | NUMERIC (12,4) | Quantity of the SKU that has been invoiced for, as entered by the user. This value can be edited at any time until the invoice is matched. |
| 6 | INS_UPDATE |  |  |  | VARCHAR (10) | This column will be updated by prepost posupld function. The value will be null if the row is a new and will have U if the row is already in invc_detail table. |
| 7 | INVC_VAT_RATE |  |  |  | NUMERIC (20,10) | VAT rate applied to the SKU that has been invoiced for, as entered by the user. This value can be edited at any time until the invoice is matched. |
| 8 | STATUS |  |  | Y | VARCHAR (1) | Status of the invoice line item. Valid values are U for unmatched, R for partially matched and M for matched. Invoice line match statuses will be held on the codes table under the code type IMDS. |
| 9 | ORIG_UNIT_COST |  |  |  | NUMERIC (20,4) | Unit cost that the SKU has been invoiced at, captured at the time of invoice entry. This value can be used to revert the invoice back to its original values after it has been edited. This field will be held in the invoice currency. |
| 10 | ORIG_QTY |  |  |  | NUMERIC (12,4) | Quantity of the SKU that has been invoiced for, captured at the time of invoice entry. This value can be used to revert the invoice back to its original values after it has been edited. |
| 11 | ORIG_VAT_RATE |  |  |  | NUMERIC (20,10) | VAT rate applied to the SKU that has been invoiced for. This value is captured at the time the invoice is entered and can be used to revert the invoice back to its original values after it has been edited. |
| 12 | COST_DSCRPNCY_IND |  |  | Y | VARCHAR (1) | Indicates if the invoice unit cost falls outside of tolerance of the receipt unit cost matched to it. Valid values are Y and N. |
| 13 | QTY_DSCRPNCY_IND |  |  | Y | VARCHAR (1) | Indicates if the invoice quantity falls outside of tolerance of the receipt quantity matched to it. Valid values are Y and N. |
| 14 | VAT_DSCRPNCY_IND |  |  | Y | VARCHAR (1) | Indicates if the invoice VAT rate is different than the VAT rate held in the system for the SKU. Valid values are Y and N. |
| 15 | PROCESSED_IND |  |  | Y | VARCHAR (1) | Indicator that can be used by the user to mark lines that have been looked at. Valid values are Y and N. |
| 16 | COMMENTS |  |  |  | VARCHAR (255) | Comments attached to the line. Use of this field will only be available when the line has a discrepancy. |
| 17 | POST_DATE |  |  |  | Date | holds the date the record was added or changed |
| 18 | VAT_CODE |  |  |  | VARCHAR (6) | It contains the VAT Code |

---

## Table: INVC_DETAIL_VAT

**Description:** This table contains VAT information for an invoice detail record.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_ID | P | F | Y | NUMERIC (10) | Contains the identifier for the invoice |
| 2 | ITEM | P |  | Y | VARCHAR (25) | Unique identifier for the item on the invoice. |
| 3 | INVC_UNIT_COST | P |  | Y | NUMERIC (20,4) | Contains the unit cost for the invoice detail record. |
| 4 | VAT_COST |  |  | Y | NUMERIC (20,4) | Contains the VAT cost for the invoice record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_INVC_DETAIL_VAT|PK||||INVC_ID|ASC|
||||||ITEM|ASC|
||||||INVC_UNIT_COST|ASC|

---

## Table: INVC_DISCOUNT

**Description:** This table will hold any transaction-level discounts associated with the invoice. The user will specify the type of the discount (percentage or amount), the value of the discount, and the amount of the invoice that it applies to.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_ID | P |  | Y | NUMERIC (10) | ID of the invoice the discounts apply to. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (6) | Sequence number that uniquely identifies each invc_discount line associated with an invoice. |
| 3 | DISCOUNT_TYPE |  |  | Y | VARCHAR (6) | Type of the discount. Valid values are P (percent) or A (amount). |
| 4 | DISCOUNT_VALUE |  |  | Y | NUMERIC (20,4) | Value of the discount, corresponding to the discount_type (e.g. 10%, or $100). If it is an amount, it will be held in the invoice currency. |
| 5 | APPLIES_TO_AMT |  |  |  | NUMERIC (20,4) | Amount of the invoice (total cost) that the discount applies to (e.g. discount of 10% off $1000 of the invoice). It will be held in the invoice currency. It will only be populated for discount types of P (percent). |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_INVC_DISCOUNT|PK||||SEQ_NO|ASC|
||||||INVC_ID|ASC|

---

## Table: INVC_HEAD

**Description:** This table will hold one row for each invoice sent to and processed by the company. Base information about each invoice is held until the first purchase order it is matched to is purged.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_ID | P |  | Y | NUMERIC (10) | Unique invoice number, generated from a sequence. |
| 2 | INVC_TYPE |  |  | Y | VARCHAR (1) | Type of the invoice. Valid values are I for merchandise invoice, N for non-merchandise invoice, O for consignment invoice, C for credit note, D for debit memo, M for credit memo, R for credit note request. Invoice types will be held on the codes table under a code type of IMIT. |
| 3 | SUPPLIER |  | F |  | NUMERIC (10) | Invoice suppliers number. |
| 4 | EXT_REF_NO |  |  |  | VARCHAR (30) | Any given supplier-generated invoice number. |
| 5 | STATUS |  |  | Y | VARCHAR (1) | Code for the status of the invoice. Valid values are U for unmatched, R for partially matched, M for matched, A for approved and P for posted. Invoice statuses will be held on the codes table under the code type IMST. |
| 6 | EDI_INVC_IND |  |  | Y | VARCHAR (1) | Indicates whether or not an invoice was uploaded via EDI. Valid values are Y or N. |
| 7 | EDI_SENT_IND |  |  | Y | VARCHAR (1) | Shows if this invoice has been dowloaded via EDI yet or not. |
| 8 | MATCH_FAIL_IND |  |  | Y | VARCHAR (1) | Indicates whether or not an invoice has failed a match attempt. Valid values are Y or N. |
| 9 | REF_INVC_ID |  | F |  | NUMERIC (10) | For invoice types C, D or R, the invoice that the credit note, debit memo or credit note request was raised against. |
| 10 | REF_RTV_ORDER_NO |  | F |  | NUMERIC (10) | For invoice types C, D or R, the RTV that the credit note, debit memo or credit note request was raised against. |
| 11 | REF_PRICE_CHANGE |  |  |  | NUMERIC (8) | The number that uniquely identifies a price change associated with this invoice. This is the number of the price change that is vendor funded and when the price change is extracted generates a credit memo invoice. |
| 12 | REF_RSN_CODE |  |  |  | VARCHAR (6) | For invoice types C, D or R, the reason that the credit note, debit memo or credit note request was raised. Valid values include Q for quantity discrepancy, C for cost discrepancy, D for discount discrepancy, V for VAT discrepancy or R for RTV. Other values may be added by the client as desired, and will be held on the codes table under the code type IMRR. |
| 13 | TERMS |  | F |  | VARCHAR (15) | Indicator identifying the payment terms for the invoice. These terms specify when payment is due and if discounts exist for payment by the due date. |
| 14 | DUE_DATE |  |  |  | Date | Date the invoice is due to be paid, defaulted according to the payment terms negotiated with the supplier. |
| 15 | PAYMENT_METHOD |  |  |  | VARCHAR (6) | Code identifying the payment method for the invoice, indicating how the invoice will be paid. Valid values include LC for letter of credit, WT for wire transfer, and OA for open account. Other values maybe added by the client as desired. Payment methods will be held on the codes table |
| 16 | TERMS_DSCNT_PCT |  |  |  | NUMERIC (12,4) | Discount that will be applied to the invoice if the invoice is paid by the due date. |
| 17 | TERMS_DSCNT_APPL_IND |  |  | Y | VARCHAR (1) | Indicates whether or not the terms discount has been applied to the total cost of the invoice or not. Valid values are Y or N. |
| 18 | TERMS_DSCNT_APPL_NON_MRCH_IND |  |  | Y | VARCHAR (1) | This field will indicate if the specified terms discount should be applied to non-merchandise costs. |
| 19 | FREIGHT_TERMS |  | F |  | VARCHAR (30) | Indicator that references the freight terms associated with the invoice. |
| 20 | CREATE_ID |  |  | Y | VARCHAR (30) | Oracle user ID of the user that entered the invoice into the system. If the invoice was entered via EDI, this field will be populated with EDI. |
| 21 | CREATE_DATE |  |  | Y | Date | Date the invoice was entered into the system, either manually or via EDI. |
| 22 | INVC_DATE |  |  | Y | Date | Date the invoice was issued by the supplier. |
| 23 | MATCH_ID |  |  |  | VARCHAR (30) | Oracle user ID of the user that matched the invoice. |
| 24 | MATCH_DATE |  |  |  | Date | Date the invoice was matched. |
| 25 | APPROVAL_ID |  |  |  | VARCHAR (30) | Oracle user ID of the user that approved the invoice match. |
| 26 | APPROVAL_DATE |  |  |  | Date | Date the invoice match was approved. |
| 27 | FORCE_PAY_IND |  |  | Y | VARCHAR (1) | Indicates whether or not the invoice is to be force paid (paid before being matched to receipts). Valid values are Y or N. |
| 28 | FORCE_PAY_ID |  |  |  | VARCHAR (30) | Oracle ID of the user that marked the invoice for force payment. This field will only have a value if the force_pay_ind = Y. |
| 29 | POST_DATE |  |  |  | Date | Date the invoice was posted to the AP staging tables. |
| 30 | CURRENCY_CODE |  | F | Y | VARCHAR (3) | Code identifying the currency in which the invoice is held. |
| 31 | EXCHANGE_RATE |  |  |  | NUMERIC (20,10) | Exchange rate at which the invoice is held. |
| 32 | TOTAL_MERCH_COST |  |  |  | NUMERIC (20,4) | Total merchandise cost for the invoice. This field will be held in the invoice currency. |
| 33 | TOTAL_QTY |  |  |  | NUMERIC (12,4) | Total quantity of items on the invoice. This field is optional, and only needs to be entered if total quantity matching will be performed on the invoice. |
| 34 | DIRECT_IND |  |  | Y | VARCHAR (1) | Indicates whether the invoice was created for a direct store delivery order via the Quick Order Entry form in which the invoice was already paid. Valid values are Y -Yes and N -No. |
| 35 | PARTNER_TYPE |  | F |  | VARCHAR (6) | Type of partner assigned to the invoice. Valid values include Bank BK, Agent AG, Freight Forwarder FF, Importer IM, Broker BR, Factory FA, Applicant AP, Consolidator CO, Consignee CN, Supplier Hierarchy Level 1 S1, Supplier Hierarchy Level 2 S2, and Supplier Hierarchy Level 3 S3. These partner types will be held on the codes table under the code_type PTAL. |
| 36 | PARTNER_ID |  | F |  | VARCHAR (10) | Partner assigned to the invoice. Partners can be assigned to any invoice type except merchandise invoices. |
| 37 | ADDR_KEY |  | F | Y | NUMERIC (11) | Indicates which vendor invoice address should be associated with the invoice. |
| 38 | PAID_IND |  |  | Y | VARCHAR (1) | Indicates if the invoice has already been paid. Valid values are Y (invoice has already been paid) or N (invoice should be paid in AP system). |
| 39 | PAYMENT_REF_NO |  |  |  | VARCHAR (16) | Reference number attached to the invoice payment, used when the invoice is paid from the POS system and interfaced through ReSA |
| 40 | PAYMENT_DATE |  |  |  | Date | Date that the invoice was paid from the POS system. This field will be populated when the invoice is interfaced through ReSA. |
| 41 | PROOF_OF_DELIVERY_NO |  |  |  | VARCHAR (30) | Proof of delivery or service number, given at the time of receipt at the store. This field will be populated when the invoice is interfaced through ReSA. |
| 42 | CE_ID |  |  |  | NUMERIC (10) | Customs entry ID of the custom entry from which the invoice was created. This field will only be populated for invoices created from customs entry. |
| 43 | OBLIGATION_KEY |  |  |  | NUMERIC (10) | Obligation key of the obligation from which the invoice was created. This field will only be populated for invoices created from obligations. |
| 44 | COMMENTS |  |  |  | VARCHAR (255) | Free-form comments entered with the invoice. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_INVC_HEAD|PK||||INVC_ID|ASC|
|INVC_HEAD_I7|||||PARTNER_TYPE|ASC|
||||||PARTNER_ID|ASC|
|INVC_HEAD_I3|||||REF_INVC_ID|ASC|
|INVC_HEAD_I2|||||FREIGHT_TERMS|ASC|
|INVC_HEAD_I8|||||ADDR_KEY|ASC|
|INVC_HEAD_I5|||||SUPPLIER|ASC|
|INVC_HEAD_I6|||||TERMS|ASC|
|INVC_HEAD_I1|||||CURRENCY_CODE|ASC|
|INVC_HEAD_I4|||||REF_RTV_ORDER_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_INVC_HEAD_DIRECT_IND|direct_ind in ('Y','N')<br>|
||CHK_INVC_HEAD_EDI_INVC_IND|edi_invc_ind in ('Y', 'N')<br>|
||CHK_INVC_HEAD_EDI_SENT_IND|EDI_SENT_IND in ('Y', 'N')<br>|
||CHK_INVC_HEAD_FORCE_PAY_IND|FORCE_PAY_IND IN ('Y', 'N')<br>|
||CHK_INVC_HEAD_INVC_TYPE|invc_type in ('I','N','O','C','D','M','R','P','Q')<br>|
||CHK_INVC_HEAD_MATCH_FAIL_IND|match_fail_ind in ('Y', 'N')<br>|
||CHK_INVC_HEAD_PAID_IND|PAID_IND in ('Y','N')<br>|
||CHK_INVC_HEAD_PART_TYPE_PART_S|(supplier is NULL and partner_type is NOT NULL and partner_id is NOT NULL) OR (supplier is NOT NULL and partner_type is NULL and<br>partner_id is NULL)<br>|
||CHK_INVC_HEAD_STATUS|STATUS IN ('U', 'R','M', 'A', 'P')<br>|
||CHK_INVC_HEAD_SUPPLIER_INVC_TY|(supplier is NOT NULL and invc_type in ('I','O')) OR (invc_type not in ('I','O'))<br>|
||CHK_INVC_HEAD_TERMS_DANMI|terms_dscnt_appl_non_mrch_ind in ('Y','N')<br>|
||CHK_INVC_HEAD_TERMS_DS_AP_IND|terms_dscnt_appl_ind in ('Y', 'N')<br>|
|Column Level|INVC_TYPE||
||STATUS||
||EDI_INVC_IND||
||EDI_SENT_IND||
||MATCH_FAIL_IND||





|Type|Column / Constraint Name|Details|
|---|---|---|
||FORCE_PAY_IND||
||DIRECT_IND||
||PAID_IND||

---

## Table: INVC_HEAD_TEMP

**Description:** This table contains one row for each SKU on an invoice. This table is written by the posupld batch program when It needs to update the data in the invc_head table.The prepost batch program will then read the data from this table, update the invc_head table and then truncate the data from the table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_HEAD_ROWID |  |  | Y | VARCHAR (18) | This field is used to store the rowid for each invc_id. |
| 2 | TOTAL_MERCH_COST |  |  |  | NUMERIC (20,4) | Total merchandise cost for the invoice. This field will be held in the invoice currency. |
| 3 | TOTAL_QTY |  |  |  | NUMERIC (12,4) | Total quantity of items on the invoice. This field is optional, and only needs to be entered if total quantity matching will be performed on the invoice. |

---

## Table: INVC_MATCH_QUEUE

**Description:** This table will contain the invoice number of any invoices that should be processed in the automatic invoice matching process. Rows will be inserted into this table when an invoice is created, modified, or a shipment is received that is referenced to be matched to the invoice.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_ID | P | F | Y | NUMERIC (10) | Unique invoice number. |

---

## Table: INVC_MATCH_WKSHT

**Description:** This table will contain one row for each invoice/receipt/SKU combination in the system that matches or potentially matches.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_ID | P | F | Y | NUMERIC (10) | Unique invoice number. |
| 2 | ITEM | P | F | Y | VARCHAR (25) | Unique identifier for the item. |
| 3 | INVC_UNIT_COST | P | F | Y | NUMERIC (20,4) | Unit cost that the SKU being matched to this shipment has been invoiced at, as entered by the user. This field will be held in the invoice currency. |
| 4 | SHIPMENT | P |  | Y | NUMERIC (12) | Shipment number matching or potentially matching the invoice. |
| 5 | SEQ_NO | P |  | Y | NUMERIC (10) | Required for uniqueness. Shipment may have multiple cartons associated, but carton is not a part of primary key. |
| 6 | CARTON |  |  |  | VARCHAR (20) | Carton in which the SKU matching the invoice is shipped. If the SKU is not shipped in a carton, this field will be assigned a value of 0. |
| 7 | INVC_MATCH_QTY |  |  |  | NUMERIC (12,4) | Quantity of the invoice that should be matched to this receipt. This field is informational only. If populated, it will sum up to the invc_qty on INVC_DETAIL across all detail lines. |
| 8 | MATCH_TO_COST |  |  |  | NUMERIC (20,4) | Unit cost that the invoice will be matched to on the shipment. This will directly reference back to the ORDSKU_INVC_COST table if it is populated, or the SHIPSKU unit_cost if not. This field will be held in the invoice currency. |
| 9 | MATCH_TO_QTY |  |  |  | NUMERIC (12,4) | Quantity that the invoice will be matched to on the shipment. This will reference back to the ORDSKU_INVC_COST table if it is populated, or the SKIPSKU table if not. |
| 10 | MATCH_TO_SEQ_NO |  |  |  | NUMERIC (10) | Sequence number of the ORDSKU_INVC_COST line that the invoice worksheet line is associated with. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_INVC_MATCH_WKSHT|PK||||INVC_ID|ASC|
||||||ITEM|ASC|
||||||INVC_UNIT_COST|ASC|
||||||SHIPMENT|ASC|
||||||SEQ_NO|ASC|
|INVC_MATCH_WKSHT_I1|||||SHIPMENT|ASC|

---

## Table: INVC_MATCH_WKSHT_TEMP

**Description:** This table will temporarily store invoice/item records from the INVC_MATCH_WKSHT table as the unit cost is updated on INVC_DETAIL to avoid any foreign key violations.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_ID |  |  |  | NUMERIC (10) | Unique invoice number |
| 2 | ITEM |  |  |  | VARCHAR (25) | Unique identifier for the item |
| 3 | INVC_UNIT_COST |  |  |  | NUMERIC (20,4) | Unit cost that the Item being matched to this shipment has been invoiced at, as entered by the user. This field will be held in the invoice currency. |
| 4 | SHIPMENT |  |  |  | NUMERIC (12) | Shipment number matching or potentially matching the invoice. |
| 5 | SEQ_NO |  |  |  | NUMERIC (10) | Contains a unique sequence number for the record. |
| 6 | CARTON |  |  |  | VARCHAR (20) | Carton in which the Item matching the invoice is shipped. If the Item is not shipped in a carton, this field will be assigned a value of 0. |
| 7 | INVC_MATCH_QTY |  |  |  | NUMERIC (12,4) | Quantity of the invoice that should be matched to this receipt. This field is informational only. If populated, it will sum up to the invc_qty on INVC_DETAIL across all detail lines. |
| 8 | MATCH_TO_COST |  |  |  | NUMERIC (20,4) | Unit cost that the invoice will be matched to on the shipment. This will directly reference back to the ORDLOC_INVC_COST table if it is populated, or the SHIPSKU unit_cost if not. This field will be held in the invoice currency. |
| 9 | MATCH_TO_QTY |  |  |  | NUMERIC (12,4) | Quantity that the invoice will be matched to on the shipment. This will reference back to the ORDLOC_INVC_COST table if it is populated, or the SKIPSKU table if not. |
| 10 | MATCH_TO_SEQ_NO |  |  |  | NUMERIC (10) | Sequence number of the ORDLOC_INVC_COST line that the invoice |

---

## Table: INVC_MERCH_VAT

**Description:** This table will hold VAT cost codes and the total amount of an invoice each code is applied to.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_ID | P | F | Y | NUMERIC (10) | Unique invoice number. |
| 2 | VAT_CODE | P | F | Y | VARCHAR (6) | Code identifying the VAT rate that should be applied to the cost amount entered in the total_cost_excl_vat field. |
| 3 | TOTAL_COST_EXCL_VAT |  |  | Y | NUMERIC (20,4) | Cost of the merchandise that will be charged VAT based on the vat_code specified. This field will be held in the invoice currency. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_INVC_MERCH_VAT|PK||||INVC_ID|ASC|
||||||VAT_CODE|ASC|
|INVC_MERCH_VAT_I1|||||VAT_CODE|ASC|

---

## Table: INVC_NON_MERCH

**Description:** This table will hold various user-defined non-merchandise costs associated with an invoice.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_ID | P | F | Y | NUMERIC (10) | Unique invoice number. |
| 2 | NON_MERCH_CODE | P | F | Y | VARCHAR (6) | Code identifying the non-merchandise cost being added to the invoice. These codes will be held on the code tables under the code type IMNM. |
| 3 | NON_MERCH_AMT |  |  | Y | NUMERIC (20,4) | Amount of the non-merchandise cost, specified by the non-merchandise code, that has been invoiced for. This field will be held in the invoice currency. |
| 4 | VAT_CODE |  | F |  | VARCHAR (6) | Code identifying the VAT rate that should be applied to the non_merch_amt entered. |
| 5 | SERVICE_PERF_IND |  |  | Y | VARCHAR (1) | Indicates if a service non-merchandise cost has actually been performed. Valid values are Y (service has been performed) or N (service has not been performed or non-merchandise cost is not a service cost). |
| 6 | STORE |  |  |  | NUMERIC (10) | Indicates the store at which the service was performed. It is optional and will only be populated for service non-merchandise lines. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_INVC_NON_MERCH|PK||||INVC_ID|ASC|
||||||NON_MERCH_CODE|ASC|
|INVC_NON_MERCH_I2|||||NON_MERCH_CODE|ASC|
|INVC_NON_MERCH_I1|||||VAT_CODE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_INVC_NON_MERCH_SVC_PRF_IND|SERVICE_PERF_IND in ('Y','N')<br>|
|Column Level|SERVICE_PERF_IND||

---

## Table: INVC_NON_MERCH_TEMP

**Description:** This table will be used to temporarily hold invoice non-merchandise lines when an invoice is being entered into the quick order entry screen.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_ID | P |  | Y | NUMERIC (10) | Unique invoice number. |
| 2 | NON_MERCH_CODE | P |  | Y | VARCHAR (6) | Code identifying a non-merchandise cost that can be added to an invoice. |
| 3 | NON_MERCH_AMT |  |  | Y | NUMERIC (20,4) | Amount of the non-merchandise cost, specified by the non-merchandise code, that has been invoiced for. This field will be held in the invoice currency. |
| 4 | VAT_CODE |  |  |  | VARCHAR (6) | Code identifying the VAT rate that should be applied to the non_merch_amt entered. |
| 5 | SERVICE_PERF_IND |  |  | Y | VARCHAR (1) | Indicates if a service non-merchandise cost has actually been performed. Valid values are Y (service has been performed) or N (service has not been performed or non-merchandise cost is not a service cost). |
| 6 | STORE |  |  |  | NUMERIC (10) | Indicates the store at which the service was performed. It is optional and will only be populated for service non-merchandise lines. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_INVC_NON_MERCH_TEMP|PK||||INVC_ID|ASC|
||||||NON_MERCH_CODE|ASC|

---

## Table: INVC_TOLERANCE

**Description:** This table will hold the difference between the invoiced cost and the recieved cost.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_ID | P | F | Y | NUMERIC (10) | Unique invoice number, generated from a sequence. |
| 2 | SEQ_NO | P |  | Y | NUMERIC (4) | Contains a generated sequence number used to ensure uniqueness. |
| 3 | ITEM |  | F |  | VARCHAR (25) | Contains a unique identifier for the item |
| 4 | TOTAL_COST |  |  | Y | NUMERIC (20,4) | Contains the difference between the invoiced cost and the received cost. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_INVC_TOLERANCE|PK||||INVC_ID|ASC|
||||||SEQ_NO|ASC|
|INVC_TOLERANCE_I1|||||ITEM|ASC|

---

## Table: INVC_XREF

**Description:** This table will hold the numbers of orders associated with the invoice. These orders will be used to determine if incoming shipments should automatically be matched to the invoice.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | INVC_ID |  | F | Y | NUMERIC (10) | Unique invoice number. |
| 2 | ORDER_NO |  | F |  | NUMERIC (12) | Order number with receipts that should match the invoice. |
| 3 | SHIPMENT |  |  |  | NUMERIC (12) | Shipment referenced to be matched to the invoice. |
| 4 | ASN |  |  |  | VARCHAR (30) | ASN referenced to be matched to the invoice. |
| 5 | LOCATION |  |  |  | NUMERIC (10) | Location referenced to be matched to the invoice. Location cannot have a value if order_no is NULL. |
| 6 | LOC_TYPE |  |  |  | VARCHAR (1) | Type of the location referenced to be matched to the invoice. Loc_type cannot have a value if location is NULL. |
| 7 | APPLY_TO_FUTURE_IND |  |  | Y | VARCHAR (1) | Indicates whether or not the records criteria should be used to associate incoming shipments with the invoice. For example, a value of Y for a record with only an order number would result in all shipments for that order, regardless of when they are received, being associated with the invoice until it is completely matched. Valid values are Y or N. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|INVC_XREF_I3|||||SHIPMENT|ASC|
|INVC_XREF_I2|||||INVC_ID|ASC|
|INVC_XREF_I1|||||ORDER_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_INVC_XREF_APPLY_TO_FUT_IND|apply_to_future_ind in ('Y', 'N')<br>|
||CHK_INVC_XREF_LOC_TYPE|loc_type in ('S', 'W')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
|Column Level|LOC_TYPE||
||APPLY_TO_FUTURE_IND||

---

## Table: MISSING_DOC

**Description:** This table will hold the missing documents for the Transportation and Customs Entry modules.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | MISSING_DOC_KEY | P |  | Y | NUMERIC (10) | This column will hold the system generated sequence that will uniquely identify a record. |
| 2 | TRANSPORTATION_ID |  |  |  | NUMERIC (10) | If the missing document is attached to the Transportation - Order/Item level this column will hold the TRANSPORTATION_ID. If this column is not NULL then the CE_ID column will be NULL. |
| 3 | CE_ID |  |  |  | NUMERIC (10) | If the missing document is attached at the Customs Entry - Order/Item level this column will hold the CE_ID. If this column is not NULL then the TRANSPORTATION_ID will be NULL. |
| 4 | DOC_ID |  | F | Y | NUMERIC (6) | This column will hold the id of the missing document. |
| 5 | VESSEL_ID |  |  |  | VARCHAR (20) | Contains vessel or other vehicle identification. |
| 6 | VOYAGE_FLT_ID |  |  |  | VARCHAR (10) | Contains voyage or flight number. |
| 7 | ESTIMATED_DEPART_DATE |  |  |  | Date | Estimated date of departure for the goods leaving the port of lading. |
| 8 | ORDER_NO |  |  |  | NUMERIC (12) | Contains the purchase order number from which the item was originated. |
| 9 | ITEM |  |  |  | VARCHAR (25) | Contains the item number. |
| 10 | RECEIVED_DATE |  |  |  | Date | This column will hold the date of the receipt of the missing document. |
| 11 | COMMENTS |  |  |  | VARCHAR (2000) | This column will hold the users comments on the missing document. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_MISSING_DOC|PK||||MISSING_DOC_KEY|ASC|
|UK_MISSING_DOC|UK||||TRANSPORTATION_ID|ASC|
||||||CE_ID|ASC|
||||||DOC_ID|ASC|
||||||VESSEL_ID|ASC|
||||||VOYAGE_FLT_ID|ASC|
||||||ESTIMATED_DEPART_DATE|ASC|
||||||ORDER_NO|ASC|
||||||ITEM|ASC|
|MISSING_DOC_I1|||||DOC_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_MISSING_DOC_TRANS_ID|(transportation_id is NULL and ce_id is NOT NULL) OR (transportation_id is NOT NULL and ce_id is NULL)<br>|

---

## Table: NON_MERCH_CODE_COMP

**Description:** This table will provide a cross-reference to identify which invoice non-merchandise code represents each landed cost component. When invoices are automatically created from obligations or customs entries, landed cost components will be rolled up into the specified non-merchandise cost bucket on the invoice.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | NON_MERCH_CODE | P | F | Y | VARCHAR (6) | Code identifying a non-merchandise cost that can be added to an invoice. |
| 2 | COMP_ID | P |  | Y | VARCHAR (10) | Code identifying a landed cost component that will be invoiced under the specified non-merchandise code. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_NON_MERCH_CODE_COMP|PK||||NON_MERCH_CODE|ASC|
||||||COMP_ID|ASC|

---

## Table: NON_MERCH_CODE_HEAD

**Description:** This table will hold codes for all non-merchandise lines used within invoice matching. Codes can be customized by the user, with the exception of the freight code and tax code, which should not be changed.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | NON_MERCH_CODE | P |  | Y | VARCHAR (6) | Code identifying a non-merchandise cost that can be added to an invoice. |
| 2 | SERVICE_IND |  |  | Y | VARCHAR (1) | Indicates whether or not the non-merchandise cost code represents cost for a service (e.g. window washing, shelf stocking, snow shoveling). When a service line is added to an invoice for a supplier that requires service performed confirmation, the invoice cannot be approved until all services have been confirmed. |
| 3 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_NON_MERCH_CODE_HEAD|PK||||NON_MERCH_CODE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_NON_MERCH_CODE_HD_SVC_IND|SERVICE_IND in ('N')|
|Column Level|SERVICE_IND||

---

## Table: NON_MERCH_CODE_HEAD_TL

**Description:** This table will hold codes for all non-merchandise lines in all languages.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | NON_MERCH_CODE | P | F | Y | VARCHAR (6) | Code identifying a non-merchandise cost that can be added to an invoice. |
| 2 | LANG | P | F | Y | NUMERIC (6) | Contains the number which uniquely identifies a language. |
| 3 | NON_MERCH_CODE_DESC |  |  | Y | VARCHAR (120) | Description of the non-merchandise cost code in a given language. |
| 4 | ORIG_LANG_IND |  |  | Y | VARCHAR (1) | Indicates if the description is in the original language entered for the non-merchandise cost code . It is set to 'Y' when the first record is written to the table for the non-merchandise cost code . |
| 5 | REVIEWED_IND |  |  | Y | VARCHAR (1) | Indicates if the description needs to be reviewed for translation. It is set to 'N' when the description in the original language is inserted or updated. We assume that clients will regularly run reports on all strings that are not reviewed (i.e. reviewed_ind = 'N'). When translation either provides a new string, or OKs that the existing string is correct, the reviewed_ind should be set to 'Y'. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_NON_MERCH_CODE_HEAD_TL|PK||||NON_MERCH_CODE|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_NON_MERC_CD_HD_TL_ORIG_IND|ORIG_LANG_IND IN ('Y','N')<br>|
|Column Level|REVIEWED_IND||

---

## Table: POP_TERMS_DEF

**Description:** This table will hold the proof of performance terms for a given deal, deal/deal component or deal/deal component/deal item-loc combination. These terms are defined by the deal partner that offers the deal. Proof of performance terms are never required by the application (although they may be required by certain deal partners).

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | POP_DEF_SEQ_NO | P |  | Y | NUMERIC (10) | Deal proof of performance term ID number. This field is required by the database. This number is uniquely generated for each record by a database sequence. |
| 2 | DEAL_ID |  |  | Y | NUMERIC (10) | Unique deal number, generated from a sequence. This field is required by the database. |
| 3 | DEAL_DETAIL_ID |  |  |  | NUMERIC (10) | Deal component ID number, uniquely sequenced within each deal. |
| 4 | DEAL_ITEMLOC_SEQ_NO |  |  |  | NUMERIC (10) | Sequence number that uniquely identifies each item/location line within the deal component. |
| 5 | DEAL_SUB_ITEM |  |  |  | VARCHAR (25) | Specific transaction level (or below) item whose proof of performance is being measured. This can be populated when the deal itself is on a case UPC but the proof of performance is on an individual selling unit. |
| 6 | POP_TYPE |  |  | Y | VARCHAR (6) | Code that identifies the proof of performance type (i.e. term is that the item must be displayed on an end cap for 28 days - the pop_type is code E for end cap display). Valid values for this field are stored in the code_type = PPT. This field is required by the database. |
| 7 | POP_VALUE |  |  |  | NUMERIC (4) | Value that describes the term of the proof of performance type (i.e. term is that the item must be displayed on an end cap for 28 days - the pop_value is 28). This field is required by the database if the record has a pop_value_type. |
| 8 | POP_VALUE_TYPE |  |  |  | VARCHAR (6) | Value that describes the type of the pop_value (i.e. term is that the item must be displayed on an end cap for 28 days - the pop_value_type is the code D for days). Valid values for this field are stored in the code_type = PPVT. This field is required by the database if the record has a pop_value. |
| 9 | VEND_REC_START_DATE |  |  |  | Date | This column holds the date that the vendor recommends that the POP begin. |
| 10 | VEND_REC_END_DATE |  |  |  | Date | This column holds the date that the vendor recommends that the POP end. |
| 11 | PLAN_START_DATE |  |  |  | Date | This column holds the date that the merchandiser/category manager plans to begin the POP. |
| 12 | PLAN_END_DATE |  |  |  | Date | This column holds the date that the merchandiser/category manager plans to end the POP. |
| 13 | COMMENT_DESC |  |  |  | VARCHAR (2000) | Free-form comments. |
| 14 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time can be used for auditing purposes. This value should only be populated on insert - it should never be updated. This field is required by the database. |
| 15 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This date/time can be used for auditing purposes. This field is required by the database. |
| 16 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This date/time can be used for auditing purposes. This field is required by the database. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_POP_TERMS_DEF|PK||||POP_DEF_SEQ_NO|ASC|

---

## Table: POP_TERMS_FULFILLMENT

**Description:** This table will hold the proof of performance fulfillment information. Data in this table is for information/reporting purposes only.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | POP_DEF_SEQ_NO | P |  | Y | NUMERIC (10) | Deal proof of performance term ID number. This field is required by the database. This number can be used to tie the proof of performance definition to its fulfillment. |
| 2 | POP_FULFILL_SEQ_NO | P |  | Y | NUMERIC (10) | Instance of the proof of performance fulfillment (i.e. POP is that an item must be advertised three times during the month of July - three records will be required for one pop_def_seq_no). The values in this column will be sequenced for each pop_def_seq_no. |
| 3 | PROMOTION |  |  |  | NUMERIC (10) | This column holds the RMS promotion number that is associated with the proof of performance. This field is always optional. |
| 4 | START_DATE |  |  |  | Date | First date of the proof of performance. |
| 5 | END_DATE |  |  |  | Date | Last date of the proof of performance. |
| 6 | COMMENT_DESC |  |  |  | VARCHAR (2000) | Free-form comments. |
| 7 | CREATE_DATETIME |  |  | Y | Date | Date/time stamp of when the record was created. This date/time can be used for auditing purposes. This value should only be populated on insert - it should never be updated. This field is required by the database. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | Holds the Oracle user-id of the user who most recently updated this record. This date/time can be used for auditing purposes. This field is required by the database. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | Holds the date time stamp of the most recent update by the last_update_id. This date/time can be used for auditing purposes. This field is required by the database. |

---

## Table: TERMS_DETAIL

**Description:** This table is to create a hierarchical table structure to enhance performance for integration with 3rd party finance systems.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TERMS | P |  | Y | VARCHAR (15) | Contains a number uniquely identifying the supplier terms. |
| 2 | TERMS_SEQ | P |  | Y | NUMERIC (10) | Order sequence in which to apply the discount percent. Used as part of the detail line unique identifier. |
| 3 | DUEDAYS |  |  |  | NUMERIC (3) | Contains the number of days until payment is due. |
| 4 | DUE_MAX_AMOUNT |  |  | Y | NUMERIC (12,4) | Maximum payment amound due by a certain date |
| 5 | DUE_DOM |  |  |  | NUMERIC (2) | Day of month used to calculate due date of invoice payment line. |
| 6 | DUE_MM_FWD |  |  |  | NUMERIC (3) | Number of months ahead used to calculate due date of invoice payment line. |
| 7 | DISCDAYS |  |  |  | NUMERIC (3) | Contains the number of days in which payment must be made in order to receive the discount. |
| 8 | PERCENT |  |  | Y | NUMERIC (12,4) | Contains the percent of discount if payment is made within the specified time frame. |
| 9 | DISC_DOM |  |  |  | NUMERIC (2) | Day of month used to calculate discount date for invoice payment line |
| 10 | DISC_MM_FWD |  |  |  | NUMERIC (3) | Number of months ahead to calculate discount date for invoice payment line. |
| 11 | FIXED_DATE |  |  |  | Date | Fixed due date. |
| 12 | ENABLED_FLAG |  |  | Y | VARCHAR (1) | Indicates whether the Payment terms are valid or invalid within the respective application. The values would be either (Y)es or (N)o. This column will be simply maintained in the table for information and not to be displayed in RMS Forms for Oracle Retail 10.0. |
| 13 | START_DATE_ACTIVE |  |  |  | Date | Indicates the date for assigning an active date to the Payment Terms. This column will be simply maintained in the table for information and not to be displayed in RMS Forms for Oracle Retail 10.0. |
| 14 | END_DATE_ACTIVE |  |  |  | Date | Indicates the date for assigning an inactive date to the Payment Terms. This column will be simply maintained in the table for information and not to be displayed in RMS Forms for Oracle Retail 10.0. |
| 15 | CUTOFF_DAY |  |  | Y | NUMERIC (2) | Day of the month after which Oracle Payables schedules payment using the day after the current month. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TERMS_DETAIL|PK||||TERMS|ASC|
||||||TERMS_SEQ|ASC|

---

## Table: TERMS_HEAD

**Description:** This table is to create a hierarchical table structure to enhance performance for integration with 3rd party finance systems.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TERMS | P |  | Y | VARCHAR (15) | Contains a number uniquely identifying the supplier terms. |
| 2 | RANK |  |  | Y | NUMERIC (10) | Unique rank to rate invoice payment terms against purchase order terms (header table). |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TERMS_HEAD|PK||||TERMS|ASC|

---

## Table: TERMS_HEAD_TL

**Description:** This table holds the translated descriptions of supplier terms in all languages.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TERMS | P | F | Y | VARCHAR (15) | Contains a number uniquely identifying the supplier terms. |
| 2 | LANG | P | F | Y | NUMERIC (6) | Contains the number which uniquely identifies a language. |
| 3 | TERMS_CODE |  |  | Y | VARCHAR (50 ) | Indicates the Alphanumeric representation of Term Name which acts as the Term code in Oracle Financials. |
| 4 | TERMS_DESC |  |  | Y | VARCHAR (240 ) | Contains a description of the supplier terms. For example: 2.5% 30 days. |
| 5 | ORIG_LANG_IND |  |  | Y | VARCHAR (1 ) | Indicates if the description is in the original language entered for the freight terms code. It is set to 'Y' when the first record is written to the table for the freight terms code. |
| 6 | REVIEWED_IND |  |  | Y | VARCHAR (1 ) | Indicates if the description needs to be reviewed for translation. It is set to 'N' when the description in the original language is inserted or updated. We assume that clients will regularly run reports on all strings that are not reviewed (i.e. reviewed_ind = 'N'). When translation either provides a new string, or OKs that the existing string is correct, the reviewed_ind should be set to 'Y'. |
| 7 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 8 | CREATE_ID |  |  | Y | VARCHAR (30 ) | This field contains the user that created the record. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 10 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30 ) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_TERMS_HEAD_TL|PK||||TERMS|ASC|
||||||LANG|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_TTL_ORIG_LANG_IND|ORIG_LANG_IND IN ('N','Y')<br>|
||CHK_TTL_REVIEWED_IND|REVIEWED_IND IN ('N','Y')<br>|

---

## Table: VENDINVC_TEMP

**Description:** this will be use by the vendinvc.pc batch program.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DEAL_ID |  |  | Y | NUMERIC (10) | The deal ID for which the invoice is being raised. |
| 2 | DEAL_DETAIL_ID |  |  | Y | NUMERIC (10) | The deal component id of the deal for which the invoice is being raised. |
| 3 | ITEM |  |  | Y | VARCHAR (25) | This is the item associated to the deal. |
| 4 | LOCATION |  |  | Y | NUMERIC (10) | This is the location associated to the deal. |
| 5 | LOC_TYPE |  |  | Y | VARCHAR (1) | This is the location type of the location associated to the deal. |
| 6 | ORDER_NO |  |  |  | NUMERIC (12) | This is the order number associated to the deal. |
| 7 | ACTUAL_TURNOVER_UNITS |  |  |  | NUMERIC (12,4) | This is the actuals for the deal component for the item location for that reporting period in Units. |
| 8 | ACTUAL_TURNOVER_REVENUE |  |  |  | NUMERIC (20,4) | This is the actuals for the deal component for the item location for that reporting period in revenue. |
| 9 | ACTUAL_INCOME |  |  |  | NUMERIC (20,4) | This is the income for the deal component for the item location for that period. |
| 10 | REPORTING_DATE |  |  | Y | Date | The date which identifies each reporting period. |
| 11 | BILL_BACK_PERIOD |  |  |  | VARCHAR (6) | This identifies the bill-back period for the deal component. This field will only be populated for billing types of BB. Valid billing periods will be held on the codes table under a new code type of DLBP. Valid values are W for week, M for month or Q for Quarter and A for Annual. |
| 12 | DEAL_REPORTING_LEVEL |  |  |  | VARCHAR (6) | This will determine periods and the frequency of the deal income accrual reporting. Valid values are W for week, M for month or Q for Quarter - these will be held on the codes table under a new code type of DLRL. |
| 13 | ACTIVE_DATE |  |  | Y | Date | This is the date the deal will become active. This date will determine when deal components begin to be factored into item costs. |
| 14 | CLOSE_DATE |  |  |  | Date | This is the date the deal will end. This date determines when deal components are no longer factored into item costs. It is optional for annual deals, required for promotional deals. It will be left NULL for PO-specific deals. |
| 15 | PARTNER_ID |  |  |  | VARCHAR (10) | This is the level of supplier hierarchy (e.g. manufacturer, distributor or wholesaler), set up as a partner in the PARTNER table, used for assigning rebates by a level other than supplier. Rebates at this level will include all eligible supplier/item/country records assigned to this supplier hierarchy level. |
| 16 | SUPPLIER |  |  |  | NUMERIC (10) | This is the supplier associated to the deal. |
| 17 | PARTNER_TYPE |  |  |  | VARCHAR (6) | This is the type of the partner the deal applies to. Valid values are S1 for supplier hierarchy level 1 (e.g. manufacturer), S2 for supplier hierarchy level 2 (e.g. distributor) and S3 for supplier hierarchy level 3 (e.g. wholesaler). Descriptions of these codes will be held on the codes table under a code_type of SUHL. |
| 18 | CURRENCY_CODE |  |  | Y | VARCHAR (3) | The currency code of the deals currency. All costs on the deal will be held in this currency. |
| 19 | BILL_BACK_METHOD |  |  |  | VARCHAR (6) | This will determine the bill back method. It will be required for bill back deals only. Valid values are Credit note or Debit note - these will be held on the codes table under a new code type of DLBM. |
| 20 | INVOICE_PROCESSING_LOGIC |  |  |  | VARCHAR (6) | This will determine if the credit notes or debit notes created should be created manually or require manual intervention and also if negative amounts should be included. Valid values are AA for Automatic All values, MA for Manual All Values, AP Automatic Positive values only, MA Manual Positive values only, NO - no invoice processing - these will be held on the codes table under a new code type of DLIP. |
| 21 | INCLUDE_VAT_IND |  |  | Y | VARCHAR (1) | Indicates if VAT will be included in the billing information. Valid values are Y for yes or N for no. |
| 22 | BBD_ADD_REP_DAYS |  |  |  | NUMERIC (3) | This column will give the number of extra reporting days that should be added to the Deal_actuals_forecast table to cater to the late postings of the transactions after the deal close date. |
| 23 | BILL_TO_LOC |  |  |  | NUMERIC (10) | This contains the Import ID of the order associated to the deal if it is an import order. Otherwise, this will be the deal location. |
| 24 | BILL_TO_LOC_TYPE |  |  |  | VARCHAR (1) | This contains the Import type of the order associated to the deal if it is an import order. Otherwise, this will be the deal location type. |
