# RMS Customer & CRM - Operations, Batch Jobs & RIB Integration Guide

## Excerpts from Operations Guide 1 - Batch Job Designs

### **Customer Support**


To contact Oracle Customer Support, access My Oracle Support at the following URL:


[https://support.oracle.com](https://support.oracle.com/)


When contacting Customer Support, please provide the following:

        - Product version and program/module name


        - Functional and technical description of the problem (include business impact)


        - Detailed step-by-step instructions to re-create

        - Exact error message received

        - Screen shots of each step you take


---

### **customer_order_purge.ksh (Purge Aged Customer Orders)**

|Module Name|customer_order_purge.ksh|
|---|---|
|**Description**|Purge Aged Customer Orders|
|**Functional Area**|Purchase Orders|
|**Module Type**|Admin|
|**Module Technology**|ksh|
|**Catalog ID**|RMS205|



Operations Guide, Volume 1 - Batch Overviews and Designs **243**


customer_order_purge.ksh (Purge Aged Customer Orders)


---

#### **Customers** **Costing**



---

### **fcustomerupload (Franchise Customer Upload)**

|Module Name|fcustomerupload.ksh|
|---|---|
|**Description**|Franchise Customers Upload|
|**Functional Area**|Franchise Management<br>|
|**Module Type**|Integration|
|**Module Technology**|ksh<br>|
|**Integration Catalog ID**|RMS126|
|**Runtime Parameters**|DB Connection and Input File name|



**422** Oracle Retail Merchandising System


fcustomerupload (Franchise Customer Upload)


---

### **fcustomerprocess (Process Uploaded Franchise Customers and Customer** **Groups)**

|Module Name|fcustomerprocess.ksh|
|---|---|
|**Description**|Process Uploaded Franchise Customers and Customer Groups|
|**Functional Area**|Franchise Management|
|**Module Type**|Business Processing|
|**Module Technology**|ksh<br>|
|**Integration Catalog ID**|RMS492|



**426** Oracle Retail Merchandising System


fcustomerprocess (Process Uploaded Franchise Customers and Customer Groups)


=========================================

## Excerpts from Operations Guide 2 - RIB Integration

### **Customer Support**


To contact Oracle Customer Support, access My Oracle Support at the following URL:
[https://support.oracle.com](https://support.oracle.com/)


When contacting Customer Support, please provide the following:

        - Product version and program/module name


        - Functional and technical description of the problem (include business impact)


        - Detailed step-by-step instructions to re-create


        - Exact error message received


        - Screen shots of each step you take


---

### **Customer Order Fulfillment Confirmation Publication API**


---

#### **Package name: RMSMFM_ORDCUST**


**Spec file name: rmsmfm_ordcusts.pls**


**Body file name: rmsmfm_ordcustb.pls**


**Package Specification – Global Variables**

```
        FAMILY    RIB_SETTINGS.FAMILY%TYPE := 'fulfilordcfm';

        LP_cre_type  RIB_TYPE_SETTINGS.TYPE%TYPE := 'fulfilordcfmcre';

```

**Function Level Description – ADDTOQ**

```
        ADDTOQ(O_error_message IN OUT  RTK_ERRORS.RTK_TEXT%TYPE,
        I_message_type  IN    ORDCUST_PUB_INFO.MESSAGE_TYPE%TYPE,
        I_ordcust_no   IN    ORDCUST.ORDCUST_NO%TYPE)

```

        - A trigger on the ORDCUST_PUB_TEMP table will call this function to add the
customer order number to the ORDCUST_PUB_INFO table for publishing to the RIB.
Only the create message type (‘fulfilordcfmcre’) is supported.


        - Validate all the input parameters to this function against NULL. If any has NULL
value then return from the function with the appropriate error message.

        - Insert a record in the ORDCUST_PUB_INFO table. The published flag will be set to
‘U’. The correct thread for the business transaction will be calculated and written.
Call API_LIBRARY. GET_RIB_SETTINGS to get the number of threads used for the
publisher. Using the number of threads, and the business object ID (for example,
customer order number) calculate the thread value.


**Function Level Description – GETNXT**

```
        GETNXT(O_status_code   IN OUT  VARCHAR2,

        O_error_message  IN OUT  VARCHAR2,

        O_message_type  IN OUT  VARCHAR2,

        O_message     IN OUT  RIB_OBJECT,

        O_bus_obj_id   IN OUT  RIB_BUSOBJID_TBL,

        O_routing_info  IN OUT  RIB_ROUTINGINFO_TBL,

        I_num_threads   IN    NUMBER DEFAULT 1,

        I_thread_val   IN    NUMBER DEFAULT 1)

```

Initialize LP_error_status to API_CODES.HOSPITAL at the beginning of GETNXT.


**22** Oracle Retail Merchandising System


Customer Order Fulfillment Confirmation Publication API


The RIB calls GETNXT to get messages. It performs a cursor loop on the unpublished
records on the ORDCUST_PUB_INFO table (pub_status = ‘U’). It should only need to
execute one loop iteration in most cases. For each record retrieved, GETNXT gets the
following:

**1.** A lock of the queue table (ORDCUST_PUB_INFO) for the current business object.
The lock is obtained by calling the function LOCK_THE_BLOCK. If the record for the
current business object is locked, the current message is skipped.


**2.** The information from the ORDCUST_PUB_INFO table is passed to
PROCESS_QUEUE_RECORD. PROCESS_QUEUE_RECORD will build the RIB
Object message to pass back to the RIB. If PROCESS_QUEUE_RECORD does not run
successfully, GETNXT raises an exception.


**3.** If any exception is raised in GETNXT, including the exception raised by an
unsuccessful call to PROCESS_QUEUE_RECORD, HANDLE_ERRORS is called.


**4.** Unconditionally exit from the loop after the successful processing of
PROCESS_QUEUE_RECORD function, assuming the confirmation message is
published successfully.

The loop will need to execute more than once if the record is locked on the queue table
for the current business object.


**Function Level Description – PUB_RETRY**

```
PUB_RETRY(O_status_code   IN OUT  VARCHAR2,
O_error_message  IN OUT  VARCHAR2,
O_message_type  IN OUT  VARCHAR2,
O_message     IN OUT  RIB_OBJECT,
O_bus_obj_id   IN OUT  RIB_BUSOBJID_TBL,
O_routing_info  IN OUT  RIB_ROUTINGINFO_TBL,
I_ref_object   IN    RIB_OBJECT)

```

This procedure republishes the entity that failed to be published before. It is the same as
GETNXT except that the record on ORDCUST_PUB_INFO to be published must match
the passed in sequence number contained in the ROUTING_INFO.


**Function Level Description – PROCESS_QUEUE_RECORD (local)**

```
PROCESS_QUEUE_RECORD(

    O_error_message IN OUT     RTK_ERRORS.RTK_TEXT%TYPE,
    O_message    IN OUT NOCOPY RIB_OBJECT,
    O_routing_info  IN OUT NOCOPY RIB_ROUTINGINFO_TBL,
    I_ordcust_no   IN ORDCUST_PUB_INFO.ORDCUST_NO%TYPE,
    I_seq_no     IN ORDCUST_PUB_INFO.SEQ_NO%TYPE)

```

This function controls the building of Oracle Objects given the business transaction’s key
values and a message type. It contains all of the shared processing between GETNXT and
PUB_RETRY.


- The correct thread for the business transaction will be calculated and written. Call
API_LIBRARY. GET_RIB_SETTINGS to get the number of threads used for the
publisher. Using the number of threads, and the business object ID (for example,
customer order number), calculate the thread value.


- Build the header and detail object by calling BUILD_MSG_OBJECT.

- Update the pub_status to ‘P’ for the current record in the ORDCUST_PUB_INFO
table.


- Delete the current record in the ORDCUST_PUB_TEMP table.


- Set LP_error_status to API_CODES.UNHANDLED_ERROR before any DML
statements.


Publication Designs **23**


Customer Order Fulfillment Confirmation Publication API


No routing information will be included since all published messages will go to OMS
and no other applications.


**Function Level Description – BUILD_MSG_OBJECT (local)**

Take all necessary data from the ORDCUST, ORDCUST_DETAIL, ORDHEAD,
ORDLOC, TSFHEAD, and TSFDETAIL tables and put into a
“RIB_FulfilOrdCfmDesc_REC” object.


**Function Level Description – LOCK_THE_BLOCK (local)**

This function locks the record for the current business object. This is to ensure that
GETNXT does not wait on any business processes that currently have the queue table
locked and have not committed.


**Function Level Description – HANDLE_ERRORS (local)**


HANDLE_ERRORS is called from GETNXT and PUB_RETRY when an exception is
raised.


If the error is a non-fatal error, GETNXT passes the sequence number of the driving
ORDCUST_PUB_INFO record back to the RIB in the ROUTING_INFO. It sends back a
status of ‘H’ - Hospital to the RIB as well. It then updates the status of the queue record
to ‘H’, so that it will not get picked up again by the driving cursor in GETNXT.


If the error is a fatal error, a status of ‘E’ - Error is returned to the RIB.


The error is considered non-fatal if no DML has occurred yet. Whenever DML has
occurred, then the global variable LP_error_status is flipped from ‘H’ to ‘E’.


---

### **Customer Order Fulfillment Service**


---

### **Customer Order Item Substitution Service**


=========================================

## Excerpts from Operations Guide 3 - Technical Architecture

### **Customer Support**


To contact Oracle Customer Support, access My Oracle Support at the following URL:

[https://support.oracle.com](https://support.oracle.com/)

When contacting Customer Support, please provide the following:

        - Product version and program/module name

        - Functional and technical description of the problem (include business impact)

        - Detailed step-by-step instructions to re-create

        - Exact error message received

        - Screen shots of each step you take
