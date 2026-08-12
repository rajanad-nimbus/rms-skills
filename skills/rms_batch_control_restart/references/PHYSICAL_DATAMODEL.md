# RMS Batch Control & Restart Recovery Datamodel - Physical Data Model Reference

## Table: RESTART_BOOKMARK

**Description:** When a restart/recovery program thread is currently active, its state is started or aborted, a record for it will exist on the restart_bookmark table. Restart/recovery initialization logic inserts the record into the table for a program thread. The restart/recovery commit process updates the record with restart information: a concatenated string of key values for table processing, a file pointer value for file processing, and application context information such as counters and accumulators. The restart/recovery closing process will delete the program thread record if the program finishes successfully. In the event of a restart, the program thread information on this table will allow the process to begin from the last commit point.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RESTART_NAME | P | F | Y | VARCHAR (50) | This field contains the name that identifies the restart program that was run. |
| 2 | THREAD_VAL | P | F | Y | NUMERIC (10) | This field contains the thread number that defines the subset of data the given restart name processed. |
| 3 | BOOKMARK_STRING |  |  |  | VARCHAR (255) | This field contains the character string of the last record that was committed. |
| 4 | APPLICATION_IMAGE |  |  |  | VARCHAR (1000) | This field contains the application parameters from the last save point. |
| 5 | OUT_FILE_STRING |  |  |  | VARCHAR (255) | This field contains the concatenated file pointers of all the output files from the last commit point of the current process. It is used to fseek to the right restart points for all the output files. |
| 6 | NON_FATAL_ERR_FLAG |  |  |  | VARCHAR (1) | This field indicates whether non-fatal errors have occurred for the current process. It reflects the value of the batch global gi_non_fatal_err_flag. |
| 7 | NUM_COMMITS |  |  |  | NUMERIC (12) | This field contains the number of commits for the current process. The possible last commit when restart/recovery is closed is not counted. |
| 8 | AVG_TIME_BTWN_COMMITS |  |  |  | NUMERIC (12) | This field contains the average time between commits for the current process. The possible last commit when restart/recovery is closed is not counted. |

---

## Table: RESTART_CONTROL

**Description:** This table is the master table in the restart/recovery table set. One record will exist on this table for each batch program that is run with restart/recovery login in place (probably all programs with the exception of EDI related programs). The restart/recovery process uses this table to determine the total number of threads used for each batch program as well as the driver for the threading(multi-processing) logic.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | PROGRAM_NAME | P |  | Y | VARCHAR (25) | This field contains the batch program name. |
| 2 | PROGRAM_DESC |  |  |  | VARCHAR (120) | This field contains a description of the batch program. |
| 3 | DRIVER_NAME |  |  | Y | VARCHAR (25) | This field contains the driver name which will define the types of values fed to the driving cursor. Each driver name uses a different cursor, which are defined in the restart views. |
| 4 | NUM_THREADS |  |  | Y | NUMERIC (10) | This field contains the number of threads used for the current process. |
| 5 | UPDATE_ALLOWED |  |  | Y | VARCHAR (2) | This field indicates whether the user can update thread numbers or if it is done programmatically. |
| 6 | PROCESS_FLAG |  |  | Y | VARCHAR (1) | This field indicates whether this process is table based (T) or file based (F). |
| 7 | COMMIT_MAX_CTR |  |  | Y | NUMERIC (6) | This field contains the numeric maximum value for the counter before a commit occurs. |
| 8 | LOCK_WAIT_TIME |  |  |  | NUMERIC (6) | Contains the number of seconds between the last and the next lock retry. |
| 9 | RETRY_MAX_CTR |  |  |  | NUMERIC (10) | Contains the maximum number of lock retry. |

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_RESTART_CON_DRIVER_NAME|DRIVER_NAME IN ('ALLOC', 'CLEARANCE', 'CONTRACT_NO', 'COST_CHANGE',<br>'DEPT', 'PRICE_CHANGE','PROMOTION', 'RECLASS', 'STORE',<br>'STORE_WH', 'SUPPLIER', 'TRANSFER', 'TSFALLOC', 'WH',<br>'ZONE_GROUP_ID', 'NONE', 'VAT_REGION','SHIPMENT', 'LOC_LIST','ALL_LOCATIONS','DEAL',<br>'PARTITION_POSITION','WFORDER','WFRETURN','ORDER')<br>|
||CHK_RESTART_CON_NUM_THRDS|NUM_THREADS > 0<br>|
||CHK_RESTART_CON_PCS_FLG|PROCESS_FLAG IN('F', 'T')<br>|
||CHK_RESTART_CON_UPD_ALLWD|UPDATE_ALLOWED IN ('Y','N')<br>|
|Column Level|DRIVER_NAME||
||NUM_THREADS||
||UPDATE_ALLOWED||
||PROCESS_FLAG||

---

## Table: RESTART_PROGRAM_HISTORY

**Description:** The restart_program_history table will contain one record for every successfully completed program thread with restart/recovery logic. Upon the successful completion of a program thread, its record on the restart_program_status table will be inserted into the history table. Table purgings will be at user discretion.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RESTART_NAME |  |  | Y | VARCHAR (50) | This field contains the restart name for the program. Generally this field will be the same as the program name, but this field could contain additional information about the thread it is running for as well. |
| 2 | THREAD_VAL |  |  | Y | NUMERIC (10) | This field contains the thread number that defines the subset of data the given restart name will process. |
| 3 | START_TIME |  |  | Y | Date | This field contains the data and time that the program was last started. |
| 4 | PROGRAM_NAME |  |  | Y | VARCHAR (25) | This field contains the name of the batch program that is to be run. |
| 5 | NUM_THREADS |  |  | Y | NUMERIC (10) | Total number of threads (batch program processed) will be initiated for a given batch program during a given batch cycle. Will be used to determine what combination of total thread numbers and maximum logical units of work will be ideal for a clients data. |
| 6 | COMMIT_MAX_CTR |  |  | Y | NUMERIC (6) | This field contains the numeric maximum value for the counter before a commit occurs. |
| 7 | RESTART_TIME |  |  |  | Date | This field contains the date and time the program was restarted. |
| 8 | FINISH_TIME |  |  | Y | Date | This field contains the date and time the program was finished. |
| 9 | SHADOW_PID |  |  |  | NUMERIC (15) | This field contains the O/S process ID for the shadow process associated with the process. It is used to locate the session trace file. |
| 10 | SUCCESS_FLAG |  |  |  | VARCHAR (1) | This field indicates whether the process finished successfully. |
| 11 | NON_FATAL_ERR_FLAG |  |  |  | VARCHAR (1) | This field indicates whether non-fatal errors have occurred for the process. It reflects the value of the batch global gi_non_fatal_err_flag. |
| 12 | NUM_COMMITS |  |  |  | NUMERIC (12) | This field contains the total number of commits for the process. The possible last commit when restart/recovery is closed is not counted. |
| 13 | AVG_TIME_BTWN_COMMITS |  |  |  | NUMERIC (12) | This field contains the accumulated average time between commits for the process. The possible last commit when restart/recovery is closed is not counted. |
| 14 | LREAD |  |  |  | NUMERIC | Session logical reads. The sum of "db block gets" plus "consistent gets". This includes logical reads of database blocks from either the buffer cache or process private memory. |
| 15 | LWRITE |  |  |  | NUMERIC | Session logical writes. The sum of "db block changes" plus "consistent changes". |
| 16 | PREAD |  |  |  | NUMERIC | Physical reads. Total number of data blocks read from disk. |
| 17 | UGA_MAX |  |  |  | NUMERIC | Peak UGA (user global area) size for a session. |
| 18 | PGA_MAX |  |  |  | NUMERIC | Peak PGA (program global area) size for the session. |
| 19 | SQLNET_BYTES_FROM_CLIENT |  |  |  | NUMERIC | Total number of bytes received from the client over Oracle Net Services. |
| 20 | SQLNET_BYTES_TO_CLIENT |  |  |  | NUMERIC | Total number of bytes sent to the client from the foreground processes. |
| 21 | SQLNET_ROUNDTRIPS |  |  |  | NUMERIC | Total number of Oracle Net Services messages sent to and received from the client. |
| 22 | COMMITS |  |  |  | NUMERIC | Number of user commits. When a user commits a transaction, the redo generated that reflects the changes made to database blocks must be written to disk. Commits often represent the closest thing to a user transaction rate. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|RESTART_PROGRAM_HISTORY_I1|||||RESTART_NAME|ASC|
||||||THREAD_VAL|ASC|
||||||START_TIME|ASC|
|RESTART_PROGRAM_HISTORY_I2|||||START_TIME|ASC|

---

## Table: RESTART_PROGRAM_STATUS

**Description:** This table holds record keeping information about current program processes. The number of rows for a program on the status table will be equal to its num_threads value on the restart_control table. The table is modified during restart/recovery initialization and close logic. The restart/recovery initialization logic will assign the next available thread to a program based on the program status and restart flag. Once a thread has been assigned the program_status is updated to prevent the assignment of that thread to another process. Information will be logged on the current status of a given thread, as well as record keeping information such as operator and process timing information.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RESTART_NAME | P |  | Y | VARCHAR (50) | This field contains the restart name for the program. Generally this field will be the same as the program name, but this field could contain additional information about the thread it is running for as well. |
| 2 | THREAD_VAL | P |  | Y | NUMERIC (10) | This field contains the thread number that defines the subset of data the given restart name will process. |
| 3 | START_TIME |  |  |  | Date | This field contains the data and time that the program was last started. |
| 4 | PROGRAM_NAME |  | F | Y | VARCHAR (25) | This field contains the name of the batch program that is to be run. |
| 5 | PROGRAM_STATUS |  |  | Y | VARCHAR (25) | This field contains the valid status for the program. Valid values are: started aborted aborted in init aborted in process aborted in final completed ready for restart |
| 6 | RESTART_FLAG |  |  |  | VARCHAR (1) | This field contains the value of the restart flag. This field is automatically set to N after an abend. It must be manually set to Y for the program to restart. |
| 7 | RESTART_TIME |  |  |  | Date | This field contains the date and time that the program was restarted. |
| 8 | FINISH_TIME |  |  |  | Date | This programs contains the date and time the program last finished. |
| 9 | CURRENT_PID |  |  |  | NUMERIC (15) | This field contains the UNIX process ID that started the program. |
| 10 | CURRENT_OPERATOR_ID |  |  |  | VARCHAR (20) | This field contains the UNIX operator name that started the program. |
| 11 | ERR_MESSAGE |  |  |  | VARCHAR (255) | This field contains the record that caused the program abort and the associated error message. |
| 12 | CURRENT_ORACLE_SID |  |  |  | NUMERIC (15) | This field contains the Oracle SID for the session associated with the current process. |
| 13 | CURRENT_SHADOW_PID |  |  |  | NUMERIC (15) | This field contains the O/S process ID for the shadow process associated with the current process. It is used to locate the session trace file when a process is not finished successfully. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RESTART_PROGRAM_STATUS|PK||||RESTART_NAME|ASC|
||||||THREAD_VAL|ASC|
|RESTART_PROGRAM_STATUS_I1|||||PROGRAM_NAME|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_RSTR_PRGM_STAT_PROG_STAT|PROGRAM_STATUS IN ('started', 'aborted', 'aborted in init', 'aborted in process','aborted in final', 'completed', 'ready for start')<br>|
||CHK_RSTR_PRGM_STAT_RESTRFLG|RESTART_FLAG IN ('N', 'Y')<br>|
||CHK_RSTR_PRGM_STAT_THRDVAL|THREAD_VAL > 0<br>|
|Column Level|THREAD_VAL||






|Type|Column / Constraint Name|Details|
|---|---|---|
||PROGRAM_STATUS||
||RESTART_FLAG||

---

## Table: RETL_EXTRACT_DATES

**Description:** This table will hold the dates of various RETL extractions. The date listed will be the date of the most recentextraction.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | LAST_EXTR_CLOSED_POT_DATE |  |  | Y | Date | This column will hold the date of the most recent extraction of closure dates for AIP-generated purchase orders, allocations and transfers. |
| 2 | LAST_EXTR_RECEIVED_POT_DATE |  |  | Y | Date | This column will hold the date of the most recent quantity extraction. |

---

## Table: RMS_ASYNC_JOB

**Description:** This table holds a list of asynchronous jobs supported in RMS. Oracle Advanced Queuing (AQ) is used to manage asynchronous transactions in RMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | JOB_TYPE | P |  | Y | VARCHAR (30) | Identifies the name of the asynchronous job type. |
| 2 | JOB_DESCRIPTION |  |  | Y | VARCHAR (120) | Holds the description of the asynchronous job type. |
| 3 | QUEUE_TABLE |  |  | Y | VARCHAR (30) | Holds the name of the queue table for the asynchronous job. |
| 4 | QUEUE_NAME |  |  | Y | VARCHAR (30) | Holds the name of the queue for the asynchronous job. |
| 5 | RECIPIENT_NAME |  |  | Y | VARCHAR (30) | Holds the AQ recipient name for the asynchronous job. |
| 6 | QUEUE_PAYLOAD_TYPE |  |  | Y | VARCHAR (30) | Holds the data type of the payload used for the queue. |
| 7 | DEQUEUE_EVENT |  |  | Y | VARCHAR (100) | Holds the name of the procedure to be invoked in the dequeue process. |
| 8 | TASKFLOW_URL |  |  |  | VARCHAR (255 ) | This field will contain the ADF taskflow url which will be use by the alerts framework to launch the screen when the user clicks on the notification link. |
| 9 | NOTIFICATION_LAUNCH_IND |  |  | Y | VARCHAR (1 ) | This field will determine if the notification will be launchable or not. If is is launchable, the notification will become a link and launch the taskflow based on the taskflow_url. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RMS_ASYNC_JOB|PK||||JOB_TYPE|ASC|

### Constraints

|Type|Column / Constraint Name|Details|
|---|---|---|
|Table Level|CHK_RAJ_NOTIFCATION_LAUNCH_IND|NOTIFICATION_LAUNCH_IND IN ('Y','N')<br>|

---

## Table: RMS_ASYNC_RETRY

**Description:** Table that tracks each attempt to complete an asynchronous call. If the initial call is successful, there will only be one row for the rms_async_id with null in the error_message column. If the initial call is unsuccessful, there will be a row for each attempt with an error_message until the final successful call which will have null in the error_message.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RMS_ASYNC_ID | P | F | Y | NUMERIC (15) | Unique identifier for the asynchronous call. |
| 2 | RETRY_ATTEMPT_NUM | P |  | Y | NUMERIC (10) | Number of retry attempt. |
| 3 | ERROR_MESSAGE |  |  |  | VARCHAR (255) | Error message that causes the asynchronous call to fail. |
| 4 | RETRY_USER_ID |  |  | Y | VARCHAR (30) | User who kicked off the retry job initially. |
| 5 | RETRY_DATETIME |  |  | Y | Date | Time when the user kicked off the retry job. |
| 6 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | User who last created or updated the row. |
| 7 | LAST_UPDATE_DATETIME |  |  | Y | Date | Time of last creation or modification of the row. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RMS_ASYNC_RETRY|PK||||RMS_ASYNC_ID|ASC|
||||||RETRY_ATTEMPT_NUM|ASC|

---

## Table: RMS_ASYNC_STATUS

**Description:** Table that tracks each asynchronous call made in RMS.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | RMS_ASYNC_ID | P |  | Y | NUMERIC (15) | Unique identifier for the asynchronous call. |
| 2 | JOB_TYPE |  | F | Y | VARCHAR (30) | Type of the asynchronous call. It references the asynchronous job defined in RMS_ASYNC_JOB. |
| 3 | STATUS |  |  | Y | VARCHAR (6) | Status of the asynchronous call. Valid values are defined in the codes table for code type JBST: N (new), I (in progress), R (retry), E (completed with error), S (completed successfully). |
| 4 | START_STATE |  |  |  | VARCHAR (30) | The starting state of the entity the asynchronous transaction is being performed on. |
| 5 | END_STATE |  |  |  | VARCHAR (30) | The target state of the entity the asynchronous transaction is being performed on. |
| 6 | CREATE_ID |  |  | Y | VARCHAR (30) | User who kicked off the job initially. |
| 7 | CREATE_DATETIME |  |  | Y | Date | Time of initial kick-off of the job. |
| 8 | LAST_UPDATE_ID |  |  | Y | VARCHAR (30) | User who last created or updated the row. |
| 9 | LAST_UPDATE_DATETIME |  |  | Y | Date | Time of last creation or modification of the row. |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_RMS_ASYNC_STATUS|PK||||RMS_ASYNC_ID|ASC|

### Constraints

|Type|Column / Constraint<br>Name|Details|
|---|---|---|
|Table Level|CHK_RMS_ASYNC_STATUS|STATUS IN ('N', 'I', 'R', 'E', 'S')|






|Type|Column / Constraint<br>Name|Details|
|---|---|---|
||||
|Column Level|STATUS||

---

## Table: SEEDOBJ_MFQUEUE

**Description:** This table is needed to publish out Country and Currency data.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | SEQ_NO | P |  | Y | NUMERIC (15) | This is the sequence number |
| 2 | COUNTRY_ID |  |  |  | VARCHAR (3) | This is the country ID |
| 3 | COUNTRY_DESC |  |  |  | VARCHAR (120) | This is the country description |
| 4 | CURRENCY_CODE |  |  |  | VARCHAR (3) | This is the currency code |
| 5 | EFFECTIVE_DATE |  |  |  | Date | This is the effective date |
| 6 | EXCHANGE_TYPE |  |  |  | VARCHAR (1) | This is the exchange type |
| 7 | EXCHANGE_RATE |  |  |  | NUMERIC (20,10) | This is the exchange rate |
| 8 | MESSAGE_TYPE |  |  |  | VARCHAR (15) | This is the message type |
| 9 | THREAD_NO |  |  |  | NUMERIC (4) | This is the thread number |
| 10 | FAMILY |  |  |  | VARCHAR (30) | This is the family |
| 11 | CUSTOM_MESSAGE_TYPE |  |  |  | VARCHAR (1) | This is the custom message type |
| 12 | PUB_STATUS |  |  |  | VARCHAR (1) | This is the status |
| 13 | TRANSACTION_NUMBER |  |  |  | NUMERIC (15) | This is the transaction number |
| 14 | TRANSACTION_TIME_STAMP |  |  |  | Date | This is the transaction time stamp |
