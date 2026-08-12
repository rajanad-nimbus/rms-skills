# RMS Return to Vendor (RTV) - Operations, Batch Jobs & RIB Integration Guide

## Excerpts from Operations Guide 1 - Batch Job Designs

## **Transfers, Allocation, and RTV**

Transfers, Allocations and Return to Vendor (RTV) transactions move inventory among
locations. The majority of processing associated with these transactions occurs through
the user interface and near real time RIB integration with Oracle Retail Store Inventory
Management (SIM) and Oracle Retail Warehouse Management System (RWMS).
However, RMS does use a variety of batch programs to maintain the data related to these
transactions.



---

### **mrtrtv (Create Return to Vendor for Mass Return Transfer)**

|Module Name|mrtrtv.pc|
|---|---|
|**Description**|Create Return To Vendor for Mass<br>Return Transfer|
|**Functional Area**|Transfers, Allocations and RTVs|
|**Module Type**|Business Processing|
|**Module Technology**|ProC|
|**Catalog ID**|RMS275|
|**Runtime Parameters**||



Operations Guide, Volume 1 - Batch Overviews and Designs **253**


mrtrtv (Create Return to Vendor for Mass Return Transfer)


Design Overview

This batch program creates RTVs for approved mass return transfers that require an RTV
to be created automatically and have an RTV create date earlier than or equal to the
current date. RTVs are created in either Input or Approved status, depending on how the
MRT was created. The program will then set the status of all processed MRTs to ‘R’ in
the MRT table, which indicates that the RTVs have been created.


---

### **mrtprg (Purge Aged Mass Return Transfers and RTV)**

|Module Name|mrtprg.pc|
|---|---|
|**Description**|Purge Aged Mass Return Transfers and<br>RTVs|
|**Functional Area**|Transfers, Allocations and RTVs|
|**Module Type**|Admin|
|**Module Technology**|ProC|
|**Catalog ID**|RMS274|
|**Runtime Parameters**||



---

### **rtvprg (Purge Aged Returns to Vendors)**

|Module Name|rtvprg.pc|
|---|---|
|**Description**|Purge Aged Returns to Vendors|
|**Functional Area**|Transfers, Allocations and RTVs|
|**Module Type**|Admin|
|**Module Technology**|ProC|
|**Catalog ID**|RMS320|
|**Runtime Parameters**||



=========================================

## Excerpts from Operations Guide 2 - RIB Integration

### **RTV Request Publication API**


---

#### **Package name: RMSMFM_RTVREQ** **Spec file name: rmsmfm_rtvreqs.pls** **Body file name: rmsmfm_rtvreqb.pls**


**Function Level Description – ADDTOQ**

```
        ADDTOQ (O_error_msg IN OUT VARCHAR2,
            I_message_type IN  VARCHAR2,
            I_rtv_order_no IN  RTV_HEAD.RTV_ORDER_NO%TYPE,

            I_status    IN  RTV_HEAD.STATUS_IND%TYPE,
            I_rtv_seq_no  IN  RTV_DETAIL.SEQ_NO%TYPE,
            I_item     IN  RTV_DETAIL.ITEM%TYPE,
            I_publish_ind IN  RTV_DETAIL.PUBLISH_IND%TYPE)

```

There are some tasks relating to streamlining the queue clean up process that need to
occur in ADDTOQ. The goal is to have at most one record on the queue for business
transactions up until their initial publication.


        - For header level insert messages (HDR_ADD), inserts a record in the
RTVREQ_PUB_INFO table. The published flag is set to ‘N’. The correct thread for the
business transaction is calculated and written. Calls API_LIBRARY.RIB_SETTINGS


Publication Designs **81**


RTV Request Publication API


to get the number of threads used for the publisher. Using the number of threads,
and the business object id, calculates the thread value.


        - For all records except header level inserts (HDR_ADD), the thread_no,
initial_approval_ind, and shipped_ind are queried from the RTVREQ_PUB_INFO
table.


        - If the business transaction has not been approved (initial_approval_ind = ‘N’) or it
has already been shipped (shipped_ind = ‘Y’) and the triggering message is one of
DTL_ADD, DTL_UPD, DTL_DEL, HDR_DEL, no processing will take place and the
function exits.


        - For detail level messages deletes (DTL_DEL), the system only needs one (the most
recent) record per detail in the RTVREQ_MFQUEUE. Any previous records that exist
on the RTVREQ_MFQUEUE for the record that has been passed are deleted. If the
publish_ind is ‘N’, the DTL_DEL message is not added to the queue.


        - For detail level message deletes (DTL_UPD), the system only needs one DTL_UPD
(the most recent) record per detail in the RTVREQ_MFQUEUE. Any previous
DTL_UPD records that exist on the RTVREQ_MFQUEUE for the record that has been
passed are deleted. The system does not want to delete any detail inserts that exist on
the queue for the detail. The system ensures subscribers are not passed a detail
modification message for a detail that they do not yet have.


        - For header level delete messages (HDR_DEL), deletes every record in the queue for
the business transaction.


        - For header level update message (HDR_UPD), updates the
RTVREQ_PUB_INFO.INITIAL_APPROVAL_IND to ‘Y’ if the business transaction is
in approved status (status of ‘10’).


        - For header level update message (HDR_UPD), updates the
RTVREQ_PUB_INFO.SHIPPED_IND to ‘Y’ if the business transaction is in shipped
status (status of ‘15’).


        - For all records except header level inserts (HDR_ADD), inserts a record into the
RTVREQ_MFQUEUE.


**Function Level Description – GETNXT**

```
        GETNXT (O_status_code  OUT VARCHAR2,
            O_error_msg  OUT VARCHAR2,
            O_message_type  OUT VARCHAR2,
            O_message  OUT RIB_OBJECT,
            O_bus_obj_id OUT RIB_BUSOBJID_TBL,
            O_routing_info  OUT RIB_ROUTINGINFO_TBL,
            I_num_threads IN  NUMBER DEFAULT 1,

            I_thread_val IN  NUMBER DEFAULT 1)

```

LP_error_status is initialized to API_CODES.HOSPITAL at the beginning of GETNXT.


The RIB calls GETNXT to get messages. It performs a cursor loop on the unpublished
records on the RTVREQ_MFQUEUE table (PUB_STATUS = ‘U’). It only needs to execute
one loop iteration in most cases. For each record retrieved, GETNXT gets the following:


**1.** A lock of the queue table for the current business object. The lock is obtained by
calling the function LOCK_THE_BLOCK. If there are any records on the queue for
the current business object that are already locked, the current message is skipped.


**2.** The published indicator from the RTVREQ_PUB_INFO table.


**3.** A check for records on the queue with a status of ‘H’ospital. If there are any such
records for the current business object, GETNXT raises an exception to send the
current message to the Hospital.

The loop executes more than one iteration in the following cases:


**82** Oracle Retail Merchandising System


RTV Request Publication API


**1.** When a header delete message exists on the queue for a business object that has not
been initially published. In this case, it removes the header delete message from the
queue and loops again.


**2.** The queue is locked for the current business object.

The information from the RTVREQ_MFQUEUE and RTVREQ_PUB_INFO table is passed
to PROCESS_QUEUE_RECORD. PROCESS_QUEUE_RECORD builds the Oracle Object
message to pass back to the RIB. If PROCESS_QUEUE_RECORD does not run
successfully, GETNXT raises an exception.


If any exception is raised in GETNXT, including the exception raised by an unsuccessful
call to PROCESS_QUEUE_RECORD, HANDLE_ERRORS is called.


**Function Level Description – PUB_RETRY**

```
PUB_RETRY(O_status_code     OUT   VARCHAR2,
O_error_msg      OUT   VARCHAR2,
O_message_type  IN OUT   VARCHAR2,
O_message       OUT   RIB_OBJECT,
O_bus_obj_id   IN OUT   RIB_BUSOBJID_TBL,
O_routing_info  IN OUT   RIB_ROUTINGINFO_TBL,
I_REF_OBJECT   IN      RIB_OBJECT)

```

This procedure republishes the entity that failed to be published before. It is the same as
GETNXT except that the record on RTVREQ_MFQUEUE to be published must match the
passed in sequence number contained in the ROUTING_INFO.


**Function Level Description – PROCESS_QUEUE_RECORD (local)**

This function controls the building of Oracle Objects given the business transaction’s key
values and a message type. It contains all of the shared processing between GETNXT and
PUB_RETRY.


It checks to see if the business object is being published for the first time. If the
published_ind on the PUB_INFO table is ‘N’ or ‘I’, the business object is being published
for the first time. If so, calls MAKE_CREATE.


Otherwise,


If the record from RTVREQ_MFQUEUE table is a header update (HDR_UPD).


- Calls BUILD_HEADER_OBJECT to build the Oracle Object to publish to the RIB.
This will also populate the ROUTING_INFO.


- Updates RTVREQ_PUB_INFO with updated new header information


- Deletes the record from the RTVREQ_MFQUEUE table.


If the record from RTVREQ_MFQUEUE table is a detail add or update (DTL_ADD,
DTL_UPD).


- Calls BUILD_HEADER_OBJECT to build the header portion of the Oracle Object to
publish to the RIB. This also populates the ROUTING_INFO.


- Calls BUILD_DETAIL_CHANGE_OBJECTS to build the detail portion of the Oracle
Object. This also takes care of any RTVREQ_MFQUEUE deletes.


If the record from RTVREQ_MFQUEUE table is a detail delete (DTL_DEL).


- Calls BUILD_HEADER_OBJECT to build the header portion of the Oracle Object to
publish to the RIB. This also populates the ROUTING_INFO.


- Calls BUILD_DETAIL_DELETE_OBJECTS to build the detail portion of the Oracle
Object. This also takes care of any RTVREQ_MFQUEUE deletes.


Publication Designs **83**


RTV Request Publication API


**Function Level Description – MAKE_CREATE (local)**

This function is used to create the Oracle Object for the initial publication of a business
transaction.


        - Calls BUILD_HEADER_OBJECT to build the Oracle Object to publish to the RIB.
This also populates the ROUTING_INFO.

        - Calls BUILD_DETAIL_OBJECTS to get a table of detail level Oracle objects and a
table of RTVREQ_MFQUEUE rowids to delete.


        - Deletes records from the RTVREQ_MFQUEUE for all rowids returned by
BUILD_DETAIL_OBJECTS. Deletes are done by rowids instead of business
transaction keys to ensure that noting is deleted off the queue that has not been
published.

        - If the entire business transaction was added to the Oracle Object, also deletes the
RTVREQ_MFQUEUE record that was picked up by GETNXT. If the entire business
transaction was not published we need to leave something on the
RTVREQ_MFQUEUE to ensure that the rest of it is picked up by the next call to
GETNXT.


        - The header and detail level Oracle Objects are combined and returned.


**Function Level Description – BUILD_HEADER_OBJECT (local)**


Take all necessary data from RTV_HEAD table and put it into a
“RIB_RTVReqDesc_REC” and “RIB_RTVReqRef_REC” object.


Puts the location into the ROUTING_INFO.


**Function Level Description – BUILD_DETAIL_CHANGE_OBJECTS (local)**


Calls BUILD_DETAIL_OBJECTS.


BUILD_DETAIL_OBJECTS creates a table of RTVREQ_MFQUEUE ROWIDs to delete.
Deletes these records.


BUILD_DETAIL_OBJECTS creates a table of RTV_DETAIL ROWIDs to update. Updates
the PUBLISH_IND to Y for these records.


Make sure to set LP_error_status to API_CODES.UNHANDLED_ERROR before any
DML statements.


**Function Level Description – BUILD_DETAIL_OBJECTS (local)**


The function is responsible for building the detail level Oracle Objects. It builds as many
detail Oracle Object as it can given the passed in message type and business object keys.


If the function is being called from MAKE_CREATE:

        - Selects any unpublished detail records from the business transaction
(RTV_DETAIL.PUBLISH_IND will be ‘N’). Creates Oracle Objects for details that are
selected by calling BUILD_SINGLE_DETAIL.


        - Ensures that the PUBLISH_IND gets set to Y for each RTV_DETAIL record placed
into the Oracle Objects. A table of ROWIDs to update is created in
BUILD_DETAIL_OBJECTS. The actual update statement occurs in
BUILD_DETAIL_CHANGE_OBJECTS using this table of ROWIDS.


        - Ensures that RTVREQ_MFQUEUE is deleted from as needed. If there is more than
one RTVREQ_MFQUEUE record for a detail level record, makes sure they all get
deleted. The system only cares about current state, not every change. A table of
ROWIDs to delete is created in BUILD_DETAIL_OBJECTS. The actual delete
statement occurs in BUILD_DETAIL_CHANGE_OBJECTS using this table of
ROWIDS.



---

### **RTV Subscription API**
