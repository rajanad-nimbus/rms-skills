# RMS Sales Audit Store Day Balances Datamodel - Physical Data Model Reference

## Table: SA_BALANCE_GROUP

**Description:** This table will hold the high-level information for transactions grouped at the defined balancing level.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE_DAY_SEQ_NO | P | F | Y | NUMERIC (20) | Contains the unique identifier of a Store / Business Date combination. |
| 2 | BAL_GROUP_SEQ_NO | P |  | Y | NUMERIC (20) | The unique identifier for a group of transactions. |
| 3 | REGISTER |  |  |  | VARCHAR (5) | Register number the transactions were processed at. Populated on this table when the balancing level selected is register. Else populated on sa_tran_head for each tran. |
| 4 | CASHIER |  |  |  | VARCHAR (10) | Cashier number of the cashier who entered the transaction. Populated on this table when the balancing level selected is cashier. Else populated on sa_tran_head for each tran. |
| 5 | START_DATETIME |  |  |  | Date | Contains the Starting Date and Time of the Cashier or Register. The Start and End Date/Time fields represent a shift. |
| 6 | END_DATETIME |  |  |  | Date | Contains the Ending Date and Time of the Cashier or Register. The Start and End Date/Time fields represent a shift. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_BALANCE_GROUP|PK||||STORE_DAY_SEQ_NO|ASC|
||||||BAL_GROUP_SEQ_NO|ASC|
|SA_BALANCE_GROUP_I1|||||STORE_DAY_SEQ_NO|ASC|
||||||CASHIER|ASC|

---

## Table: SA_BANK_ACH

**Description:** This table will contain totals for each PARTNER combination that has an entry in SA_STORE_ACH for a day. It will be used to hold the bank information to be exported for ACH. The information on this table will be exported by the program saexpach.pc.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PARTNER_TYPE | P | F | Y | VARCHAR (6) | Specifies the type of partner. |
| 2 | PARTNER_ID | P | F | Y | VARCHAR (10) | Unique identifying number for a partner within the system. |
| 3 | BANK_ACCT_NO | P |  | Y | VARCHAR (16) | Contains the account that the ACH is taking money from. |
| 4 | BUSINESS_DATE | P |  | Y | Date | Date for which the data comes from. |
| 5 | NEXT_DAY_ACH_AMT |  |  |  | NUMERIC (20,4) | Total days ACH amount to be reported to the bank. |
| 6 | NEXT_DAY_MAN_ACH_ADJ |  |  |  | NUMERIC (20,4) | Total days adjustment for missing deposits, NSF, and bank fees to be reported to the bank. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_BANK_ACH|PK||||PARTNER_TYPE|ASC|
||||||PARTNER_ID|ASC|
||||||BANK_ACCT_NO|ASC|
||||||BUSINESS_DATE|ASC|

---

## Table: SA_BANK_STORE

**Description:** This table contains detail information about the bank.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PARTNER_TYPE | P | F | Y | VARCHAR (6) | This field contains the type of partner. This field will always have a type of Bank (BK). |
| 2 | PARTNER_ID | P | F | Y | VARCHAR (10) | This field contains the identification code of the partner. |
| 3 | STORE | P | F | Y | NUMERIC (10) | This field contains the store to which the bank is associated. |
| 4 | MIN_BAL |  |  |  | NUMERIC (20,4) | This field contains the minimum balance (in partners currency) required by the bank. |
| 5 | CURRENT_BAL |  |  |  | NUMERIC (20,4) | Contains the banks current balance (in partners currency.) |
| 6 | EXP_FORMAT |  |  |  | VARCHAR (20) | This field contains the expected format of any data that is to be transmitted to the bank. |
| 7 | BANK_ACCT_NO |  |  | Y | VARCHAR (16) | This field contains the stores account number. |
| 8 | ROUTING_NO |  |  | Y | NUMERIC (9) | This field contains the routing number for the bank account. |
| 9 | CONSOLIDATING_IND |  |  | Y | VARCHAR (1) | Indicates if this account is being consolidated. Valid values are Y (yes) and N (no). |
| 10 | ACCT_TYPE |  |  | Y | VARCHAR (1) | Indicates whether the account is a savings or checking account. Valid values are C (checking) and S (savings). |

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_BANK_ACCT_TYPE|ACCT_TYPE IN ('C','S')<br>|
||CHK_SA_BANK_ATTRIB_PARTNER_TYP|partner_type = 'BK'<br>|
||CHK_SA_BANK_CONSOLIDATING_IND|CONSOLIDATING_IND IN ('Y','N')<br>|
|Column Level|PARTNER_TYPE||
||CONSOLIDATING_IND||
||ACCT_TYPE||

---

## Table: SA_COMB_TOTAL

**Description:** This table contains the details about the totals that are combined to create a combined total.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TOTAL_ID | P | F | Y | VARCHAR (10) | User entered id to uniquely identify the total being calculated. |
| 2 | TOTAL_REV_NO | P | F | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the total being calculated. This number will increment as a user edits an existing total calculation definition. |
| 3 | DETAIL_SEQ_NO | P |  | Y | NUMERIC (3) | Component of the combined total - used to make a unique primary key. |
| 4 | DETAIL_TOTAL_ID |  |  | Y | VARCHAR (10) | Total summed in this combined total. |
| 5 | DETAIL_TOTAL_REV_NO |  |  | Y | NUMERIC (3) | Revision of the total referenced in this combined total. |
| 6 | TOTAL_OPERATOR |  |  | Y | VARCHAR (1) | Operator used to combine this total to other totals in the combined total. Valid values for this field are defined on the codes tables with a code type of OPER. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_COMB_TOTAL|PK||||TOTAL_ID|ASC|
||||||TOTAL_REV_NO|ASC|
||||||DETAIL_SEQ_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_COMB_TOTAL_TOTAL_OPER|total_operator in ('+','-')<br>|
|Column Level|TOTAL_OPERATOR||

---

## Table: SA_POS_VALUE

**Description:** This table contains the pos value for a given total_value_seq_no and value_rev_no.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P | F | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | TOTAL_SEQ_NO | P | F | Y | NUMERIC (20) | Identifies the unique result set for this total id, total revision, store/day, Balancing group and index values. |
| 4 | VALUE_REV_NO | P |  | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the total being calculated. The sequence that populates this value will also populate the value_rev_no fields on the sa_sys_calc_value, sa_store_value and sa_hq_value tables. |
| 5 | POS_VALUE |  |  | Y | NUMERIC (20,4) | Value for the total reported by the POS. |
| 6 | TOTAL_REV_NO |  |  | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the total being calculated. This number will increment as a user edits an existing total calculation defintion. |
| 7 | UPDATE_ID |  |  | Y | VARCHAR (30) | ID of the user that has updated the value. |
| 8 | UPDATE_DATETIME |  |  | Y | Date | Date and timestamp of the value update. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_POS_VALUE|PK||||TOTAL_SEQ_NO|ASC|
||||||VALUE_REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_POS_VALUE_I1|||||TOTAL_SEQ_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_POS_VALUE|UN||||TOTAL_SEQ_NO|ASC|
||||||VALUE_REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|

---

## Table: SA_POS_VALUE_WKSHT

**Description:** The table will hold the pos uploaded values produced by totals that have not been approved.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P | F | Y | NUMERIC (10) | Store number to be used for table partitioning. |
| 2 | DAY | P | F | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | TOTAL_SEQ_NO | P | F | Y | NUMERIC (20) | Identifies the unique result set for this total id, total revision, store/day, Balancing group and index values. |
| 4 | VALUE_REV_NO | P |  | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the total being calculated. The sequence that populates this value will also populate the value_rev_no fields on the sa_sys_calc_value, sa_store_value and sa_hq_value tables. |
| 5 | POS_VALUE |  |  | Y | NUMERIC (20,4) | Value for the total reported by the POS |
| 6 | TOTAL_REV_NO |  |  | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the total being calculated. This number will increment as a user edits an existing total calculation defintion. |
| 7 | UPDATE_ID |  |  | Y | VARCHAR (30) | ID of the user that has updated the value. |
| 8 | UPDATE_DATETIME |  |  | Y | Date | Date and timestamp of the value update. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_POS_VALUE_WKSHT|PK||||TOTAL_SEQ_NO|ASC|
||||||VALUE_REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_POS_VALUE_WKSHT_I1|||||TOTAL_SEQ_NO|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
||||||STORE|ASC|
||||||DAY|ASC|
|PK_SA_POS_VALUE_WKSHT|UN||||TOTAL_SEQ_NO|ASC|
||||||VALUE_REV_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|

---

## Table: SA_STORE_DAY

**Description:** This table holds the status and details for each store/day combination. Store_day_ids are generated for each that is expected to be open store/day in the Store/Day creation batch process (sastdycr.pc). The status fields are updated by processes throughout the system as those processes import, load, total and audit data.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE_DAY_SEQ_NO | P |  | Y | NUMERIC (20) | This field will hold the unique identifier for a store/day combination. |
| 2 | BUSINESS_DATE |  |  | Y | Date | This field will hold the date for a store/day combination. |
| 3 | STORE |  |  | Y | NUMERIC (10) | This field will hold the store number for a store/day combination. |
| 4 | DAY |  |  | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 5 | INV_BUS_DATE_IND |  |  | Y | VARCHAR (1) | This field will indicate whether or not the business date is invalid. Valid values are Yes or No. |
| 6 | INV_STORE_IND |  |  | Y | VARCHAR (1) | This field will indicate whether or not the store is invalid. Valid values are Yes or No. |
| 7 | STORE_STATUS |  |  | Y | VARCHAR (6) | This field will hold the store level status for a given store/day. The valid values are W - worksheet, C - store is closed, and F - Fuel Closed. When the store_status is closed, store data can no longer be updated by store level personnel and must be edited at the head-quarters level. Decodes of the valid values are stored in the code type SASS. |
| 8 | STORE_CLOSED_DATETIME |  |  |  | Date | This field will hold the date on which the last change was made to the store/day at the store level. |
| 9 | DATA_STATUS |  |  | Y | VARCHAR (6) | This field will hold status of the data in relation to the database. Valid values are R- ready for import, L - data loaded into database, P - partial dataset loaded, F - full dataset loaded, and G - purging. Decodes of the valid values are stored in the code type SADS. |
| 10 | AUDIT_STATUS |  |  | Y | VARCHAR (6) | This field will hold status of the store/day data in relation to the auditing process. Decodes of the valid values are stored with the code type SAAS. |
| 11 | AUDIT_CHANGED_DATETIME |  |  |  | Date | This field will hold the date on which the last change was made to the store/day at the head quarters level. |
| 12 | FILES_LOADED |  |  |  | NUMERIC (10) | This column indicates the number of transaction data files that have been imported into sales audit for the store/day. |
| 13 | OMS_FILES_LOADED |  |  |  | NUMERIC (10) | This column indicates the number of transaction data files that have been imported from OMS system into sales audit for the store/day. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_STORE_DAY|PK||||STORE_DAY_SEQ_NO|ASC|
|SA_STORE_DAY_I3|||||DATA_STATUS|ASC|
|SA_STORE_DAY_I1|||||BUSINESS_DATE|ASC|
|PK_SA_STORE_DAY|UN||||STORE_DAY_SEQ_NO|ASC|
|SA_STORE_DAY_I4|||||STORE|ASC|
||||||DATA_STATUS|ASC|
|SA_STORE_DAY_I5|||||STORE|ASC|
||||||BUSINESS_DATE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_STORE_DAY_INV_STORE_IND|INV_STORE_IND IN ('N', 'Y')<br>|
||CHK_SA_STORE_DAY_STORE_STATUS|STORE_STATUS IN ('W', 'C', 'F')<br>|
||CHK_SA_STORE_DAY_AUDIT_STATUS|AUDIT_STATUS IN ('U','T','A','R','H')<br>|
|Column Level|INV_BUS_DATE_IND||
||INV_STORE_IND||
||STORE_STATUS||
||DATA_STATUS||
||AUDIT_STATUS||

---

## Table: SA_STORE_DAY_READ_LOCK

**Description:** This table contains records for all locks on store/days currently held in Sales Audit. Only one writable lock may exist at any time (lock_type = W). If a writable lock exists, no read locks can be added. However, multiple read locks (lock_type = R) may exist at any time. All updating of this table in the system is handled by functions store_day_attrib_sql.get_lock and store_day_attrib_sql.release_lock. It is important for the correct functioning of the system that records on this table are not manually added, updated or deleted. However, in the event of a server or database crash, these records may have to be manually updated by the database administrator.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE_DAY_SEQ_NO | P | F | Y | NUMERIC (20) | This field will hold the unique identifier for a store/day combination. |
| 2 | LOCKED_BY_USER | P |  | Y | VARCHAR (30) | This field will hold the username of the user who has initiated the lock. If the lock occurs because of batch processing that is not initiated by a specific user, this field will contain SYSTEM as an identifier. |
| 3 | LOCKED_BY_PROCESS | P |  | Y | VARCHAR (30) | This field will hold the process name of the program that is locking the store/day. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_STORE_DAY_READ_LOCK|PK||||STORE_DAY_SEQ_NO|ASC|
||||||LOCKED_BY_USER|ASC|
||||||LOCKED_BY_PROCESS|ASC|

---

## Table: SA_STORE_DAY_WRITE_LOCK

**Description:** This table contains records for all write locks on store/days currently held in Sales Audit. All updating of this table in the system is handled by functions store_day_attrib_sql.get_lock and store_day_attrib_sql.release_lock. In the case of write locks, the function will attempt to update the column to itself, causing an Oracle lock to occur without any committing. This type of lock will be used in the interactive audit.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE_DAY_SEQ_NO | P |  | Y | NUMERIC (20) | This field will hold the unique identifier for a store/day combination. |

---

## Table: SA_TOTAL

**Description:** This table contains the the specific information for a total on a given store/day or store/day balancing level.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | STORE | P |  | Y | NUMERIC (10) | Store number to be used for table partitioning |
| 2 | DAY | P |  | Y | NUMERIC (3) | Day number to be used for table partitioning. This is derived from the sa_store_day.business_date column by calling the function SA_DATE_HASH. |
| 3 | TOTAL_SEQ_NO | P |  | Y | NUMERIC (20) | Identifies the unique result set for this total id, total revision, store/day, Balancing group and index values. |
| 4 | TOTAL_ID |  |  | Y | VARCHAR (10) | User entered id to uniquely identify the total being calculated. |
| 5 | STORE_DAY_SEQ_NO |  | F | Y | NUMERIC (20) | Identifies the unique store/day combination for which the total is being calculated. |
| 6 | BAL_GROUP_SEQ_NO |  | F | Y | NUMERIC (20) | Identifies the unique balancing group for which the total is being calculated |
| 7 | REF_NO1 |  |  |  | VARCHAR (30) | This field will contain the first referenece value by which the total is grouped. For example, if the total is grouped by department, this field will contain the department number that coreesponds to these values. |
| 8 | REF_NO2 |  |  |  | VARCHAR (30) | This field will contain the second referenece value by which the total is grouped. |
| 9 | REF_NO3 |  |  |  | VARCHAR (30) | This field will contain the third referenece value by which the total is grouped. |
| 10 | DISPLAY_ORDER |  |  | Y | VARCHAR (6) | Contains the order in which the totals should be displayed. |
| 11 | ERROR_IND |  |  | Y | VARCHAR (1) | Indicates whether or not an error is associated with the total. |
| 12 | STATUS |  |  | Y | VARCHAR (6) | This field will hold the status of the total. Valid Values are P - present in data set, D - deleted from data set. Valid values for this field can be found in the code type SAST. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_TOTAL|PK||||TOTAL_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|
|SA_TOTAL_I3|||||TOTAL_ID|ASC|
||||||STORE_DAY_SEQ_NO|ASC|
||||||BAL_GROUP_SEQ_NO|ASC|
||||||REF_NO1|ASC|
||||||REF_NO2|ASC|
||||||REF_NO3|ASC|
|SA_TOTAL_I2|||||STORE_DAY_SEQ_NO|ASC|
||||||BAL_GROUP_SEQ_NO|ASC|
|PK_SA_TOTAL|UN||||TOTAL_SEQ_NO|ASC|
||||||STORE|ASC|
||||||DAY|ASC|

### Constraints

|Type|Column /<br>Constraint Name|Details|
|---|---|---|
|Column Level|ERROR_IND||

---

## Table: SA_TOTAL_HEAD

**Description:** This table contains the header level information for totals calculations in the system.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TOTAL_ID | P |  | Y | VARCHAR (10) | User entered id to uniquely identify the total being calculated. |
| 2 | TOTAL_REV_NO | P |  | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the total being calculated. This number will increment as a user edits an existing total calculation definition. |
| 3 | VR_ID |  |  |  | VARCHAR (15) | The metadata virtual row associated with the total. |
| 4 | VR_REV_NO |  |  |  | NUMERIC (3) | The revision of the metadata virtual row associated with the total. |
| 5 | TOTAL_DESC |  |  | Y | VARCHAR (255) | External name for the total created by the user. |
| 6 | TOTAL_TYPE |  |  | Y | VARCHAR (1) | Total type identifier used to determine whether the results of the total should be included in over/short calculations. |
| 7 | OS_GROUP |  |  |  | VARCHAR (1) | Over/Short group for the total. D is accounted for, B is accountable for. |
| 8 | OS_OPERATOR |  |  |  | VARCHAR (1) | Operator used to combine the total into the overall Over/Short. Valid values are + and -. |
| 9 | COMB_TOTAL_IND |  |  | Y | VARCHAR (1) | Indicates whether this definition refers to a total (composed of raw data from the database) or existing totals. Valid values are Y yes and N no. |
| 10 | TOTAL_CAT |  |  | Y | VARCHAR (6) | Total category identifier used to group similar totals. The valid values for this field are in the code_type SATC. |
| 11 | BAL_LEVEL |  |  | Y | VARCHAR (1) | Identifies the level (store or system balancing, which may also be either cashier or register) at which the total should be calculated and implies an implicit group by. The valid values are S (store), C (cashier) and R (register). |
| 12 | UPDATE_DATETIME |  |  | Y | Date | Contains the date and time the total calculation was initially created. Used to determine the order the calculations should occur. |
| 13 | UPDATE_ID |  |  | Y | VARCHAR (30) | Stored with each revision of the total. Allows the user to track who has edited total definitions. |
| 14 | COUNT_SUM_IND |  |  | Y | VARCHAR (1) | Indicated whether the total is a count of occurrences or a sum of values. |
| 15 | POS_IND |  |  | Y | VARCHAR (1) | Indicates that the total corresponds to the value polled from the POS. Valid values are Y - yes and N - no. |
| 16 | SYS_CALC_IND |  |  | Y | VARCHAR (1) | Indicates that the system should calculate a value for this total. Valid values are Y - yes and N - no. |
| 17 | STORE_UPDATE_IND |  |  | Y | VARCHAR (1) | Indicates that the total can be updated by store personnel. Valid values are Y - yes and N - no. |
| 18 | HQ_UPDATE_IND |  |  | Y | VARCHAR (1) | Indicates that the total can be updated by hq personnel. Valid values are Y - yes and N - no. |
| 19 | REQ_IND |  |  | Y | VARCHAR (1) | Indicates that the total is required by the system. Valid values are Y - yes and N - no. |
| 20 | WIZ_IND |  |  | Y | VARCHAR (1) | Indicates that the total will be defined using the totaling wizard. Valid values are Y - yes and N - no. |
| 21 | START_BUSINESS_DATE |  |  | Y | Date | Date this version of the total calculation definition becomes effective. |
| 22 | END_BUSINESS_DATE |  |  |  | Date | Date this version of the total calculation definition becomes ineffective. |
| 23 | GROUP_SEQ_NO1 |  |  |  | NUMERIC (3) | The field will contain the sequence of a the first grouping parm in a total. |
| 24 | REF_LABEL_CODE_1 |  |  |  | VARCHAR (6) | This field will contain the code in the code_type TRFL that should be the label of the first group by value on the Misc. Totals form. Valid values are in the code_type TRFL. |
| 25 | GROUP_SEQ_NO2 |  |  |  | NUMERIC (3) | The field will contain the sequence of a the second grouping parm in a total. |
| 26 | REF_LABEL_CODE_2 |  |  |  | VARCHAR (6) | This field will contain the code in the code_type TRFL that should be the label of the second group by value on the Misc. Totals form. Valid values are in the code_type TRFL. |
| 27 | GROUP_SEQ_NO3 |  |  |  | NUMERIC (3) | The field will contain the sequence of a the third grouping parm in a total. |
| 28 | REF_LABEL_CODE_3 |  |  |  | VARCHAR (6) | This field will contain the code in the code_type TRFL that should be the label of the third group by value on the Misc. Totals form. Valid values are in the code_type TRFL. |
| 29 | TOTAL_PARM_SEQ_NO |  |  | Y | NUMERIC (3) | Contains the sequence number of the parm in the total definition that is being counted or summed. |
| 30 | DISPLAY_ORDER |  |  | Y | VARCHAR (6) | Contains a code that corresponds to the order the total should be displayed in the over/short and miscellaneous totals forms. |
| 31 | STATUS |  |  |  | VARCHAR (6) | This field holds the status of the total. The status determines which table the total value will be written to. If the status is either worksheet or approved, the value will be written to the sa_sys_value_wksht or sa_pos_value_wksht tables. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_TOTAL_HEAD|PK||||TOTAL_ID|ASC|
||||||TOTAL_REV_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_TOTAL_HEAD_BAL_LEVEL|bal_level in ('C','R','S')<br>|
||CHK_SA_TOTAL_HEAD_COMB_TOT_IND|comb_total_ind in ('Y','N')<br>|






|Type|Column / Constraint Name|Details|
|---|---|---|
||CHK_SA_TOTAL_HEAD_COUNT_SUM_IN|count_sum_ind in ('C','S')<br>|
||CHK_SA_TOTAL_HEAD_HQ_UPDATE|hq_update_ind in ('Y','N')<br>|
||CHK_SA_TOTAL_HEAD_OS_GROUP|os_group in ('D','B')<br>|
||CHK_SA_TOTAL_HEAD_OS_OPERATOR|os_operator in ('+','-')<br>|
||CHK_SA_TOTAL_HEAD_POS_IND|pos_ind in ('Y','N')<br>|
||CHK_SA_TOTAL_HEAD_REQ_IND|req_ind in ('Y','N')<br>|
||CHK_SA_TOTAL_HEAD_STORE_UPDATE|store_update_ind in ('Y','N')<br>|
||CHK_SA_TOTAL_HEAD_SYS_CALC_IND|sys_calc_ind in ('Y','N')<br>|
||CHK_SA_TOTAL_HEAD_TOTAL_TYPE|total_type in ('O','M')<br>|
||CHK_SA_TOTAL_HEAD_WIZ_IND|wiz_ind in ('Y','N')<br>|
|Column Level|TOTAL_TYPE||
||OS_GROUP||
||OS_OPERATOR||
||COMB_TOTAL_IND||
||BAL_LEVEL||
||COUNT_SUM_IND||
||POS_IND||
||SYS_CALC_IND||
||STORE_UPDATE_IND||






|Type|Column / Constraint Name|Details|
|---|---|---|
||HQ_UPDATE_IND||
||REQ_IND||
||WIZ_IND||

---

## Table: SA_TOTAL_HEAD_TL

**Description:** This is the translation table for SA_TOTAL_HEAD table. The data in the base table is held in data integration langauge configured in SYSTEM_CONFIG_OPTIONS. The translated value in other languages are maintained in this table.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LANG | P | F | Y | NUMERIC (6) | This field contains the language in which the translated text is maintained. |
| 2 | TOTAL_ID | P | F | Y | VARCHAR (10) | User entered id to uniquely identify the total being calculated. |
| 3 | TOTAL_REV_NO | P | F | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the total being calculated. This number will increment as a user edits an existing total calculation definition. |
| 4 | TOTAL_DESC |  |  | Y | VARCHAR (255) | External name for the total created by the user. |
| 5 | CREATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is created. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that created the record. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | This field contains the timestamp when the record is last updated. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | This field contains the user that last updated the record. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_TOTAL_HEAD_TL|PK||||LANG|ASC|
||||||TOTAL_ID|ASC|
||||||TOTAL_REV_NO|ASC|

---

## Table: SA_TOTAL_LOC_TRAIT

**Description:** This table contains the location traits associated with a given total.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TOTAL_ID | P | F | Y | VARCHAR (10) | User entered id to uniquely identify the total being calculated. |
| 2 | TOTAL_REV_NO | P | F | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the total being calculated. This number will increment as a user edits an existing total calculation definition. |
| 3 | LOC_TRAIT | P | F | Y | NUMERIC (4) | Location trait for which the total is active. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_TOTAL_LOC_TRAIT|PK||||TOTAL_ID|ASC|
||||||TOTAL_REV_NO|ASC|
||||||LOC_TRAIT|ASC|
|SA_TOTAL_LOC_TRAIT_I1|||||LOC_TRAIT|ASC|

---

## Table: SA_TOTAL_RESTRICTIONS

**Description:** This table contains the restrictions that limit the application of totals calculations to various data sets.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TOTAL_ID | P | F | Y | VARCHAR (10) | User entered id to uniquely identify the total being calculated. |
| 2 | TOTAL_REV_NO | P | F | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the total being calculated. This number will increment as a user edits an existing total calculation definition. |
| 3 | RES_SEQ_NO | P |  | Y | NUMERIC (3) | Sequence number to ensure a primary key. |
| 4 | PARM_SEQ_NO_1 |  |  | Y | NUMERIC (3) | Identifies the parameter that drives the filtering condition. |
| 5 | RES_OPERATOR |  |  | Y | VARCHAR (6) | Contains the relational operators used in restriction statements. Valid values can be found on the codes table with the code_type SACO. |
| 6 | PARM_SEQ_NO_2 |  |  |  | NUMERIC (3) | Identifies the parm on the right hand side of the expression. |
| 7 | PARM_SEQ_NO_3 |  |  |  | NUMERIC (3) | Identifies the second parm on the right hand side of the expression (used only if the res_operator is between or not between). |
| 8 | RES_CONSTANT_2 |  |  |  | VARCHAR (500) | String specifying the right hand side of the comparison. |
| 9 | RES_CONSTANT_3 |  |  |  | VARCHAR (500) | String specifying the second part of the right hand side of the comparison (used only if the res_operator is between or not between). |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_TOTAL_RESTRICTIONS|PK||||TOTAL_ID|ASC|
||||||TOTAL_REV_NO|ASC|
||||||RES_SEQ_NO|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SA_TOTAL_RESTRICT_RES_OPER|res_operator in ('=','!=','<','>','<=','>=','IN','NOT IN','NULL','!NULL','B','NB')<br>|
|Column Level|RES_OPERATOR||

---

## Table: SA_TOTAL_USAGE

**Description:** This table contains the usages defined for a given total.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | TOTAL_ID | P | F | Y | VARCHAR (10) | User entered id to uniquely identify the total being calculated. |
| 2 | TOTAL_REV_NO | P | F | Y | NUMERIC (3) | Sequential number to uniquely identify the generation of the total being calculated. This number will increment as a user edits an existing total calculation definition. |
| 3 | USAGE_TYPE | P |  | Y | VARCHAR (6) | This field will hold a code from the code_type SAUT. This code will determine how the total should be used. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SA_TOTAL_USAGE|PK||||TOTAL_ID|ASC|
||||||TOTAL_REV_NO|ASC|
||||||USAGE_TYPE|ASC|
