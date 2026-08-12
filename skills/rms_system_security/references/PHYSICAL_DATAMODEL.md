# RMS System Security & Permissions Datamodel - Physical Data Model Reference

## Table: SECURITY_CONFIG_OPTIONS

**Description:** Table that contains attributes that are used to setup security parameters within RMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DATA_LEVEL_SECURITY_IND |  |  | Y | VARCHAR (1) | Indicates if data level security is enabled in RMS. |
| 2 | DIFF_GROUP_MERCH_LEVEL_CODE |  |  | Y | VARCHAR (1) | Indicates the merchandise hierarchy level (e.g. division) at which data level security will be controlled for Diff Groups. |
| 3 | SEASON_MERCH_LEVEL_CODE |  |  | Y | VARCHAR (1) | Indicates the merchandise hierarchy level (e.g. division) at which data level security will be controlled for Seasons. |
| 4 | TICKET_TYPE_MERCH_LEVEL_CODE |  |  | Y | VARCHAR (1) | Indicates the merchandise hierarchy level (e.g. division) at which data level security will be controlled for Ticket Types. |
| 5 | UDA_MERCH_LEVEL_CODE |  |  | Y | VARCHAR (1) | Indicates the merchandise hierarchy level (e.g. division) at which data level security will be controlled for UDAs. |
| 6 | DIFF_GROUP_ORG_LEVEL_CODE |  |  | Y | VARCHAR (1) | Indicates the organizational hierarchy level (e.g. region) at which data level security will be controlled for Diff Groups. |
| 7 | SEASON_ORG_LEVEL_CODE |  |  | Y | VARCHAR (1) | Indicates the organizational hierarchy level (e.g. region) at which data level security will be controlled for Seasons. |
| 8 | TICKET_TYPE_ORG_LEVEL_CODE |  |  | Y | VARCHAR (1) | Indicates the organizational hierarchy level (e.g. region) at which data level security will be controlled for Ticket Types. |
| 9 | UDA_ORG_LEVEL_CODE |  |  | Y | VARCHAR (1) | Indicates the organizational hierarchy level (e.g. region) at which data level security will be controlled for UDAs. |
| 10 | SKULIST_ORG_LEVEL_CODE |  |  | Y | VARCHAR (1) | Indicates the organizational hierarchy level (e.g. region) at which data level security will be controlled for Item Lists. |
| 11 | LOC_LIST_ORG_LEVEL_CODE |  |  | Y | VARCHAR (1) | Indicates the organizational hierarchy level (e.g. region) at which data level security will be controlled for Location Lists. |
| 12 | LOC_TRAIT_ORG_LEVEL_CODE |  |  | Y | VARCHAR (1) | Indicates the organizational hierarchy level (e.g. region) at which data level security will be controlled for Location Traits. |
| 13 | CREATE_ID |  |  |  | VARCHAR (30) | Stores the Oracle username of the one who inserted the first record. This field is required by the database. |
| 14 | CREATE_DATETIME |  |  |  | Date | The date and time of when the record was created in the table. This value should only be populated on insert - it should never be updated. |
| 15 | LAST_UPDATE_ID |  |  |  | VARCHAR (30) | The Oracle username of the one who most recently updated this record. |
| 16 | LAST_UPDATE_DATETIME |  |  |  | Date | The date time stamp of the most recent update by the user. |

---

## Table: SEC_GROUP

**Description:** This table will be used to store group attributes.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | GROUP_ID | P |  | Y | NUMERIC (4) | Contains the unique identifier associated with the group. |
| 2 | GROUP_NAME |  |  | Y | VARCHAR (40) | Contains the name of the security group. |
| 3 | ROLE |  |  |  | VARCHAR (30) | This field contains the role that a client wants to assign to this group. This field is referenced in the code type ROLE. There are no pre-defined values for this field and it is completely user-defined. This field does not have any functionality linking it to Oracle Roles or any other type of roles used within the RMS. This field is used within the regionality dialogue for searching and reporting capabilities. |
| 4 | COMMENTS |  |  |  | VARCHAR (2000) | Comments. |
| 5 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 6 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SEC_GROUP|PK||||GROUP_ID|ASC|

---

## Table: SEC_GROUP_LOC_MATRIX

**Description:** This table will be used to store the group location security attributes.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COLUMN_CODE |  |  | Y | VARCHAR (6) | Contains a 6 digit code which identifies the functional area to which the security applies. |
| 2 | GROUP_ID |  | F | Y | NUMERIC (4) | Contains the unique identifier associated with the group. |
| 3 | REGION |  | F |  | NUMERIC (10) | Contains the unique number identifying the region in the organisational hierarchy. |
| 4 | DISTRICT |  | F |  | NUMERIC (10) | Contains the unique number identifying the district in the organisational hierarchy. |
| 5 | STORE |  | F |  | NUMERIC (10) | Contains the unique number identifying the store in the organisational hierarchy. |
| 6 | WH |  | F |  | NUMERIC (10) | Contains the unique number identifying the warehouse in the organisational hierarchy. |
| 7 | SELECT_IND |  |  | Y | VARCHAR (1) | Value of this column indicates whether the user has select privileges. |
| 8 | UPDATE_IND |  |  | Y | VARCHAR (1) | Value of this column indicates whether the user has insert, update and delete privileges. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|UK_SEC_GROUP_LOC_MATRIX|UK||||COLUMN_CODE|ASC|
||||||GROUP_ID|ASC|
||||||REGION|ASC|
||||||DISTRICT|ASC|
||||||STORE|ASC|
||||||WH|ASC|





|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|SEC_GROUP_LOC_MATRIX_I5|||||WH|ASC|
|SEC_GROUP_LOC_MATRIX_I1|||||GROUP_ID|ASC|
|SEC_GROUP_LOC_MATRIX_I4|||||STORE|ASC|
|SEC_GROUP_LOC_MATRIX_I3|||||DISTRICT|ASC|
|SEC_GROUP_LOC_MATRIX_I2|||||REGION|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SEC_GRP_LOC_MAT_DIST_REGN|district is NULL or (district is NOT NULL and region is NOT NULL)<br>|
||CHK_SEC_GRP_LOC_MAT_SELECT|select_ind in ('Y','N')<br>|
||CHK_SEC_GRP_LOC_MAT_STORE_DIST|store is NULL or (store is NOT NULL and district is NOT NULL)<br>|
||CHK_SEC_GRP_LOC_MAT_UPDATE|update_ind in ('Y','N')<br>|
||CHK_SEC_GRP_LOC_MAT_UPD_SEL|(update_ind != 'Y') or (update_ind = 'Y' and select_ind = 'Y')<br>|
|Column Level|SELECT_IND||
||UPDATE_IND||

---

## Table: SEC_USER

**Description:** This table holds the database user id and the application user id associated with a security user. It is to ensure that users that have access to multiple applications will have access to the same RMS data in all applications, regardless of which user login id is used.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | USER_SEQ | P |  | Y | NUMERIC<br>(15) | This is a sequence generated number that uniquely identifies a security user. |
| 2 | DATABASE_USER_ID |  |  |  | VARCHAR (30<br>BYTE) | This column holds the database user login id assigned to the security user. It is used to login to applications like RMS. All database user ids must be defined on the USER_ATTRIB table. |
| 3 | APPLICATION_USER_ID |  |  |  | VARCHAR (30<br>BYTE) | This column holds the application user id set up in enterprise LDAP for the security user. |
| 4 | CREATE_ID |  |  | Y | VARCHAR (30<br>BYTE) | This column holds the user id created the record. |
| 5 | CREATE_DATETIME |  |  | Y | Date (7) | This column holds the timestamp when the record is created. |
| 6 | MANAGER |  | F |  | NUMERIC<br>(15) | This field holds the user_seq of the manager for the application. Manager should be entered as a user earlier on. |
| 7 | RMS_USER_IND |  |  | Y | VARCHAR (1 | This field will indicate whether the user is a RMS User. Valid values are Y/N. |
| 8 | RESA_USER_IND |  |  | Y | VARCHAR (1<br>BYTE) | This field will indicate whether the user is a ReSA User. Valid values are Y/N. |
| 9 | REIM_USER_IND |  |  | Y | VARCHAR (1<br>BYTE) | This field will indicate whether the user is a ReIM User. Valid values are Y/N. |
| 10 | ALLOCATION_USER_IND |  |  | Y | VARCHAR (1<br>BYTE) | This field will indicate whether the user is an Allocation User. Valid values are Y/N. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SEC_USER|PK||||USER_SEQ|ASC|
|SEU_APP_USER_UK|UK||||APPLICATION_USER_ID|ASC|
|SEU_DB_USER_UK|UK||||DATABASE_USER_ID|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_SEC_USER_RMS_USER_IND|RMS_USER_IND IN ('Y','N')<br>|
||CHK_SEC_USER_RESA_USER_IND|RESA_USER_IND IN ('Y','N')<br>|
||CHK_SEC_USER_REIM_USER_IND|REIM_USER_IND IN ('Y','N')<br>|
||CHK_SEC_USER_ALLOC_USER_IND|ALLOCATION_USER_IND IN ('Y','N')<br>|

---

## Table: SEC_USER_GROUP

**Description:** This table holds the security group a security user belongs to.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | GROUP_ID | P | F | Y | NUMERIC (4) | This column holds the security group the security user belongs to. It references the group id defined on the SEC_GROUP table. |
| 2 | USER_SEQ | P | F | Y | NUMERIC (15) | This column holds the security user assigned to the security group. It references the user sequence defined on the SEC_USER table. |
| 3 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the user id created the record. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This column holds the timestamp when the record is created. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SEC_USER_GROUP|PK||||GROUP_ID|ASC|
||||||USER_SEQ|ASC|
|SEC_USER_GROUP_I1|||||USER_SEQ|ASC|

---

## Table: SEC_USER_ROLE

**Description:** This table holds the roles a security user belongs to.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ROLE | P | F | Y | VARCHAR (30 BYTE) | This field contains the role the user belongs to. |
| 2 | USER_SEQ | P | F | Y | NUMERIC (15) | This filed holds the user assigned to the role. It references the user sequence defined on the SEC_USER table. |
| 3 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the user id created the record. |
| 4 | CREATE_DATETIME |  |  | Y | Date | This column holds the timestamp when the record is created. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_SEC_USER_ROLE|PK||||ROLE|ASC|
||||||USER_SEQ|ASC|

---

## Table: USER_ATTRIB

**Description:** This table is used to store user attributes.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | USER_ID | P |  | Y | VARCHAR (30) | Contains the unique identifier for the user. |
| 2 | USER_NAME |  |  | Y | VARCHAR (120) | Contains the name of the user. |
| 3 | LANG |  | F | Y | NUMERIC (6) | Contains the language that the Oracle user prefers to use in Oracle Retail. |
| 4 | STORE_DEFAULT |  |  |  | NUMERIC (10) | Contains the default store for the user. |
| 5 | USER_PHONE |  |  |  | VARCHAR (20) | Contains the telephone number of the user. |
| 6 | USER_FAX |  |  |  | VARCHAR (20) | Contains the fax number of the user. |
| 7 | USER_PAGER |  |  |  | VARCHAR (20) | Contains the pager number of the user. |
| 8 | USER_EMAIL |  |  |  | VARCHAR (250) | Contains the email address for the user. |
| 9 | DEFAULT_PRINTER |  |  |  | VARCHAR (20) | stores users default printer... valid values found on printer_head.printer |
| 10 | CREATE_ID |  |  | Y | VARCHAR (30) | This column holds the User id of the user who created the record. |
| 11 | CREATE_DATETIME |  |  | Y | Date | This column holds the record creation date. |

---

## Table: USER_DOMAIN

**Description:** This table is used to determine which domains, or external databases, users are authorized to access. These relationships are used when executing external systems with multiple database instances from Oracle Retail. This table is populated during installation of the system and must be maintained by the database administrator.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | USER_ID | P |  | Y | VARCHAR (30) | This field contains a valid Oracle User ID for a Oracle Retail user. |
| 2 | DOMAIN_ID | P | F | Y | NUMERIC (3) | This field contains the domain number for the domain the specified user has access to. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_USER_DOMAIN|PK||||USER_ID|ASC|
||||||DOMAIN_ID|ASC|
|USER_DOMAIN_I1|||||DOMAIN_ID|ASC|
