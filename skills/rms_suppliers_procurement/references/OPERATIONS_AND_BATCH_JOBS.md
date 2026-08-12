# RMS Suppliers & Procurement - Operations, Batch Jobs & RIB Integration Guide

#### **Integration Contract**

|ontract|Col2|
|---|---|
|**Integration Type**|Download from RMS|
|**File Name**|Determined by runtime parameter|
|**Integration Contract**|IntCon000107|

---

#### **Integration Contract**

N/A

Operations Guide, Volume 1 - Batch Overviews and Designs **55**

---

#### **Integration Contract**

**Integration Type** N/A

**File Name** N/A

**Integration Contract** N/A

---

#### **Integration Contract**

|ontract|Col2|
|---|---|
|**Integration Type**|Upload to RMS|
|**File Name**|N/A|
|**Integration Contract**|N/A|

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

=========================================

### **Partner Publication API**

---

### **Vendor Publication API**

---

### **Vendor Subscription API**

---

### **Supplier Service**

---

#### **Search Supplier**

**Business Overview**

Supplier search can be, by entering either full or partial supplier site ID (numeric) or by a
full or partial supplier site description in the search string.

Returned suppliers are constrained by the following criteria:

    - Only active supplier sites are returned.

    - When items are sent as input, then only supplier sites that are common amongst the
items are returned.

    - When locations are sent as input, then only suppliers that are valid for the Org Units
associated with the input locations are returned.

ReSTful Web Service Implementation for RMS **317**

Create Purchase Order Services

**Service Type**

Get

**ReST URL**

```
       /PurchaseOrders/supplier?supplierSearchString={supplierSearchStri

       ng}&locations={locations}&items={items}&pageSize={pageSize}&pageN

       umber={pageNumber}

```

**Input Parameters**

**Parameter Name** **Required** **Description**

SupplierSearchString Yes Search string for Supplier’s ID or Name.

Item No Comma Separated values for items.

Locations No Comma Separated values for locations.

PageSize No Maximum number of suppliers to retrieve

per page.

PageNumber No Result page to retrieve.

**Output**

Values of the following columns:

        - Supplier

        - Supplier Name

        - Supplier Currency

        - Terms

        - Default Item Lead Time

        - Supplier Item Table

              - Item

              Origin Country Id

              - Lead Time

        - Supplier Item Location Table

              - Item

              - Location

              Pickup Lead Time

        - Total Record Count

        - Next Page URL

        - Previous Page URL

**Table Impact**

**TABLE** **SELECT** **INSERT** **UPDATE** **DELETE**

ITEM_SUPPLIER Yes No No No

ITEM_SUPP_COUNTRY Yes No No No

ITEM_SUPP_COUNTRY_LOC Yes No No No

**318** Oracle Retail Merchandising System

Create Purchase Order Services

**TABLE** **SELECT** **INSERT** **UPDATE** **DELETE**

STORE Yes No No No

SUPS Yes No No No

V_SUPS Yes No No No

WH Yes No No No

=========================================

### **Supplier**

Supplier is created in RMS. The details of the supplier are sent to SIM through RIB.

RIB Validation: After successful execution of the batches, check for the stores in the RIB.

        - VENDOR_PUBLISHER in RIB-RMS

        - VENDOR_SUBSCRIBER in RIB-SIM

When RIB message shows as succeeded, the vendor will be available in the SIM.

---

#### **Return to Vendor**

Return to vendor can be created both in SIM and RMS.

**Initiating SIM in RTV**

Following the the steps to initiate SIM in RTV:

**1.** Select the correct store from the dropdown in the login page.

**2.** Navigate and select Main menu > Shipping/Receiving > Returns.

**3.** Click **Create** .

**4.** In the Return Type field, select **Supplier** from the dropdown.

**5.** Enter supplier, authorization number, item details, reason to return and quantity.

**6.** Click Dispatch.

**RIB Validation** : When the dispatch is done, message is sent to RMS

        - RTV_Publisher in RIB-SIM

        - RTV _Subscriber in RIB-RMS

A transfer (RTV) is created in RMS.

**RMS/SIM Database Validation**

        - Stock on hand gets updated in ITEM_LOC_SOH table in RMS (Inventory should be
reduced from SIM and RMS by correct quantity).

        - Tran code 24 is posted in TRAN_DATA table.

**Initiating RMS in RTV**

When a Return to vendor along with a mass return transfer is created in RMS, and is
returned back to vendor then it is called Return to Vendor.

Steps for creating Returns in SIM:

**1.** Select the correct store from the login form.

**2.** Navigate and select Main menu > Shipping/Receiving > Returns.

**3.** Select the transfer you need to return. (The user ID will be external along with the
external ID number which indicates that the transfer originated in RMS).

**4.** Double-click on the record which needs to be returned.

**5.** Update the quantity column with the units which need to be returned.

**6.** Click **Dispatch** and accept the warning message.

**RIB Validation:** When dispatch is completed, message is sent to RMS

        - RTV_PUBLISHER in RIB-SIM

        - RTV _SUBSCRIBER in RIB-RMS

**RMS/SIM Database Validation:**

Stock on hand gets updated in **ITEM_LOC_SOH** table in RMS (Inventory should be
reduced from SIM and RMS by correct quantity). Tran code 24 is posted in TRAN_DATA
table.

Integrating RMS with Store Inventory Management **243**

Transactions
