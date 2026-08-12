# RMS Purchase Orders - Operations, Batch Jobs & RIB Integration Guide

## Excerpts from Operations Guide 1 - Batch Job Designs

## **Purchase Order**


---

### **edidlord (Download of Purchase Orders from RMS to Suppliers)**

|Module Name|edidlord.pc|
|---|---|
|**Description**|Download of Purchase Order from RMS<br>to Suppliers|
|**Functional Area**|Purchase Order|
|**Module Type**|Integration|
|**Module Technology**|ProC|
|**Catalog ID**|RMS46|
|**Runtime Parameters**||



---

### **ediupack (Upload Purchase Order and Purchase Order Change** **Acknowledgements from Suppliers to RMS)**

|Module Name|ediupack.pc|
|---|---|
|**Description**|Upload Purchase Order and Purchase Order<br>Change Acknowledgements from Suppliers<br>to RMS|
|**Functional Area**|Purchase Orders|
|**Module Type**|Integration|
|**Module Technology**|ProC|
|**Catalog ID**|RMS48|
|**Runtime Parameters**||



---

### **vrplbld (Build Purchase Orders for Vendor Generated Orders)**

|Module Name|vrplbld.pc|
|---|---|
|**Description**|Build Purchase Orders for Vendor<br>Generated Orders|
|**Functional Area**|Purchase Orders|
|**Module Type**|Business Processing|
|**Module Technology**|ProC|
|**Integration Catalog ID**|RMS387|
|**Runtime Parameters**||



---

### **supcnstr (Scale Purchase Orders Based on Supplier Constraints)**

|Module Name|supcnstr.pc|
|---|---|
|**Description**|Scale Purchase Orders Based on<br>Supplier Constraints|
|**Functional Area**|Purchase Orders|
|**Module Type**|Business Processing|
|**Module Technology**|ProC|
|**Catalog ID**|RMS368|



=========================================

## Excerpts from Operations Guide 2 - RIB Integration

### **Create Purchase Order Services**


**Functional Area**


Procurement


**Business Overview**


The primary role of this service is to create purchase orders and send them to RMS.


---

#### **Create Purchase Order**


**Business Overview**

This Web service calls the existing RMS XOrder API directly with input parameters. For
more information on RMS XOrder API, see the sections addressing both the Store Order
Subscription API and the PO Subscription API.


ReSTful Web Service Implementation for RMS **325**


Create Purchase Order Services


**Service Type**

Post


**ReST URL**

```
       /PurchaseOrders

```

**Input Parameters**

```
       Example json RDO input:

        {

        "links" : [ ],
        "itemRDOs" : [ {

        "links" : [ ],
        "item" : null,
        "location" :null,
        "unitCost" : null,

        "referenceItem" : null,
        "originCountryId" : null,
        "suppPackSize" : null,
        "qtyOrdered" : null,
        "locationType" : null,
        "cancelInd" : null,

        "reInstateInd" : null,
        "hyperMediaContent" : {
        "linkRDO" : [ ]

        }

        } ],

        "orderNo" : null,
        "supplier" : null,
        "currencyCode" : null,
        "terms" : null,

        "notBeforeDate" : null,

        "notAfterDate" : null,

        "status" : "A",
        "writtenDate" : null,
        "origInd" : null,
        "user_id" : null,
        "dept" : null,
        "exchangeRate" : null,
        "includeOnOrdInd" : null,
        "ediPoInd" : null,
        "preMarkInd" : null,
        "comment" : null,

        "otbEowDate" : null,
        "hyperMediaContent" : {
        "linkRDO" : [ ]

        }

        }

```

**Output**


NA


**Table Impact**


For more information on RMS XOrder API, see the Store Order Subscription API and the
PO Subscription API sections.


**326** Oracle Retail Merchandising System


Recent Inventory Transfer Services


---

### **Recent Purchase Order Services**


---

#### **Purchase Order Status List**


**Business Overview**

Retrieves all valid purchase order statuses.


**Service Type**

Get


**ReST URL**

```
    /PurchaseOrders/recent/purchaseOrderStatusList

```

**Input Parameters**


No input.


**Output**


    - Status Code


ReSTful Web Service Implementation for RMS **335**


Recent Purchase Order Services


        - Code Description


        - Code Sequence


**Table Impact**


**TABLE** **SELECT** **INSERT** **UPDATE** **DELETE**


CODE_HEAD Yes No No No


CODE_DETAIL Yes No No No


---

#### **Search Purchase Order User ID**


**Business Overview**


This service retrieves a list of user IDs associated with creating a purchase order.


**Service Type**


Get


**ReST URL**

```
        /PurchaseOrders/recent/searchUserIds?searchString={searchString}&pageSize={pageSiz
        e}&pageNumber={pageNumber}

```

**Input Parameters**

Search String - Required


Page Size - Optional


Page Number - Optional


**Output**

        - ID


        - Total Record Count


        - Next Page URL


        - Previous Page URL


**Table Impact**


**TABLE** **SELECT** **INSERT** **UPDATE** **DELETE**


V_ORDHEAD Yes No No No


=========================================

## Excerpts from Operations Guide 3 - Technical Architecture

#### **Purchase Order**


To create a purchase order in RMS for a store you must navigate and select **Orders** 
**Create Order** . When the order is created and submitted, approve the Purchase Order
(PO). The order details is be sent to SIM successfully.

RIB Validation: When the purchase order is create, make sure to verify the order number
for the following:


        - ORDER_PUBLISHER in RIB-RMS


        - ORDER_SUBSCRIBER in RIB-SIM


**238** Oracle Retail Merchandising System
