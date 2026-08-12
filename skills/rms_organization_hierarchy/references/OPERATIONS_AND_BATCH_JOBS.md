# RMS Organization Hierarchy - Operations, Batch Jobs & RIB Integration Guide

## Excerpts from Operations Guide 1 - Batch Job Designs

### **schedprg (Purge Aged Store Ship Schedule)**

|Module Name|schedprg.pc|
|---|---|
|**Description**|Purge Aged Store Ship Schedule|
|**Functional Area**|Foundation Data|
|**Module Type**|Admin|
|**Module Technology**|ProC|
|**Catalog ID**|RMS356|
|**Runtime Parameters**||



---

### **reqext (ROQ Calculation and Distribution for Item/Locs Replenished from** **WH)**

|Module Name|reqext.pc|
|---|---|
|**Description**|ROQ Calculation and Distribution for Item/Locs<br>Replenished from WH|
|**Functional Area**|Replenishment|
|**Module Type**|Business Processing|
|**Module Technology**|ProC|
|**Catalog ID**|RMS310|
|**Runtime Parameters**||



---

### **allocbt (Create Book Transfers for Allocations Between Warehouses in the**

|ical Warehouse)|Col2|
|---|---|
|**Module Name**|allocbt.ksh|
|**Description**|Create Book Transfers for Allocations Between<br>Warehouses in the Same Physical Warehouse|
|**Functional Area**|Inventory Movement|
|**Module Type**|Business Processing|
|**Module Technology**|ksh|
|**Catalog ID**|RMS175|
|**Runtime Parameters**||



**262** Oracle Retail Merchandising System


allocbt (Create Book Transfers for Allocations Between Warehouses in the Same Physical Warehouse)


---

### **stockcountupload.ksh (Upload Stock Count Results from** **Stores/Warehouses)**

|ehouses)|Col2|
|---|---|
|**Module Name**|stockcountupload.ksh<br>|
|**Description**|Upload Stock Count Results from<br>Stores/Warehouses|
|**Functional Area**|Stock Count|
|**Module Type**|Integration|
|**Module Technology**|ksh|
|**Integration Catalog ID**|RMS153|
|**Runtime Parameters**||



---

## **Integration with Xstore**

This chapter contains information about the batch processes that related to the
integration of Xstore.

The integration of the Merchandising applications and the Xstore Suite consists of two
major data flows:

  - Foundation and price data from Oracle Retail Merchandising System (RMS) and
Oracle Retail Price Management (RPM) to Oracle Retail Xcenter and Xstore
Office


  - Point of Service transactions from Oracle Retail Xstore Point of Service to Oracle
Retail Sales Audit (ReSA).


In combination, these data flows represent the round trip of data between the stores and
headquarters. New items, other foundation data, and prices from headquarters are
communicated to Xstore. Sales and returns from Xstore are communicated to
Merchandising, where these transactions impact inventory. Merchandising further
integrates summarized sales and inventory information from Xstore to other Oracle
Retail applications, such as Planning and Analytics.



=========================================

## Excerpts from Operations Guide 2 - RIB Integration

#### **Functional Area**


Allocations


---

#### **Functional Area**


ASNOut


---

#### **Functional Area**


Foundation


---

#### **Functional Area**


Customer Order


---

#### **Functional Area**

Replenishment


=========================================

## Excerpts from Operations Guide 3 - Technical Architecture

## **Integrating RMS with Store Inventory** **Management**

Oracle Retail Store Inventory Management (ORSIM or SIM) is a Java based application
with multitier architecture. SIM assists store operation, tracking item and item inventory
with all the integrated systems.

SIM helps store personnel in performing the following in-store operations:

- Receiving merchandise from the warehouse or directly from the vendor.

- Replenishing and order stock.

- Requesting and implementing price changes.

- Managing physical inventories and performing stock count.

- Lookup for the detailed information about merchandise items, suppliers, containers,
and customer orders.


- Transferring or returning stock.

SIM function includes administration, shipping, receiving, inventory management,
lookups and reporting.

The administration function is performed either by the SIM administrator or the
Manager. The function includes:

- Setup and technical maintenance of SIM.

- Security setup to define SIM users and their roles.

- Setup and maintenance of serial numbers that are Unique Identification Numbers
(UIN) based.


The usage of serial numbers for item is an optional feature.

The inventory management function helps to maintain an accurate perpetual store
Inventory for the Stock Counts, Sequencing, Pick Lists, Item Requests, Store Orders, Price
Changes, and Ticketing.

The inventory management system provides detailed information about inventory items,
suppliers, containers and customer orders which are created in RMS. You can check for
the related information in parallel. For example, when you are checking for an item, the
supplier information of the item can also be viewed.

Using inventory management, you can perform lookup along with the other SIM tasks.
For example, lookup for an item while preparing an item request or lookup for a supplier
information when preparing the store order.

SIM includes many standard reports, which can be customized as per your requirement.
SIM uses Oracle BI Publisher as an interface for the SIM reports. The SIM reports are
custom designed as per the organizational requirement. The BI Publisher interface is also
customized to organize and present the reports available to the SIM users.

All the location, item and supplier information are created in RMS whether it is ranged or
not ranged to a store, flows to SIM using the RIB Adapter.


Integrating RMS with Store Inventory Management **235**


Supplier


---

### **Warehouse**


When a warehouse is created in the RMS, the details of warehouse are sent to SIM
through RIB.


RIB Validation: After successful execution of the batches, check for the stores in the RIB.


        - WH_PUBLISHER in RIB-RMS


        - WH_SUBSCRIBER in RIB-SIM


When RIB message shows as succeeded, warehouse will be available in SIM.


---

### **SIM Store**


The SIM Store function allows you to set operating parameters for stores managed with
SIM. The Store is created in RMS and flows to SIM application.

RIB Validation: After successful creation of the stores, check for the stores message in the
RIB.


        - STORES_PUBLISHER in RIB-RMS


        - STORE_SUBSCRIBER in RIB-SIM


When RIB message shows as succeeded, the store is available in SIM.


---

#### **Return to Warehouse**


You can create, edit, and dispatch returns from the store to a company-owned
warehouse, or directly to a vendor. If there is unavailable stock for a returned item, you
have an option to use items from unavailable stock for the return. A completed
(dispatched) return decreases available Stock on Hand.

The store to warehouse transfer is created in RMS, which is displayed as a return to
warehouse in SIM. A similar transfer is created in SIM.


**Note:** Unless the return is dispatched from SIM, WMS
cannot see the transaction.


Integrating RMS with Store Inventory Management **241**


Transactions


**Creating Return to Warehouse in SIM**

To create a return to Warehouse in SIM:


**1.** Select the correct store from the dropdown in the Login page.

**2.** Navigate and select Shipping/Receiving > Returns.


**3.** Click **Create** .


**4.** In the Return Type field, select **Warehouse** from the dropdown.

**5.** Enter warehouse, inventory status, authorization number, item details, reason to
return and quantity.

**6.** Click Dispatch.

**7.** Click **Done** to save the changes.

**RIB Validation:** After dispatch is cleared, a message is sent to RMS.

Verify the order number in:


        - RTV_Publisher in RIB-SIM


        - RTV _Subscriber in RIB-RMS


A transfer (RTW) is created in RMS with **APPROVED** status.


**RMS/SIM Database Validation**

        - Stock on Hand gets updated in ITEM_LOC_SOH table in RMS. Inventory must be
reduced from SIM and RMS by correct quantity.

        - Tran code 30 and 32 is posted in TRAN_DATA table.


**Creating Return to Warehouse in RMS**

When initiated by RMS, a warehouse to store transfer is created in RMS, and is returned
back to warehouse then it is called Return to Warehouse.


RMS functionality includes, create a transfer, return to warehouse in RMS and APPROVE
it.


**RIB Validation:** When the dispatch is completed, a message is sent to RMS.


        - RTV_Publisher in RIB-RMS


        - RTV _Subscriber in RIB-SIM


        - Transfer_Publisher in RIB-RMS


**Dispatching in SIM**

To dispatch to SIM:

**1.** Select the correct store from the login form.

**2.** Navigate and select Shipping/Receiving > Returns.

**3.** Select the transfer you need to return. The user ID will be external along with the
external ID number which indicates that the transfer originated in RMS.


**4.** Double-click on the **Record** .


**5.** Update the quantity column with the unit which needs to be returned.

**6.** Click **Dispatch** and accept the warning message.

RIB Validation: When the dispatch is completed, a message is sent to RMS.


        - RTV_Publisher in RIB-SIM


        - RTV _Subscriber in RIB-RMS


**242** Oracle Retail Merchandising System


Transactions


**RMS/SIM Database Validation** :


        - Stock on Hand is updated in ITEM_LOC_SOH table in RMS. Inventory should be
reduced from SIM and RMS by correct quantity.

        - Tran code 30 and 32 is posted in TRAN_DATA table.


---

#### **Store Orders**



Store ordering allows to View, Create, Modify, and Approve orders to a supplier or
Transfer requests from a warehouse. Use store-level ordering to order items that are not
set up for automatic replenishment, when items run short, or demand increases.


**Creating a Store Order**

Create a store orders to replenish items for which you have the authority to place orders
from the store.


**1.** Log in to SIM with the correct store.

**2.** Navigate and select **Inv Mgmt** - **Store Orders** .


**3.** Click Create Order.


**4.** Specify a delivery date range.

**5.** Enter Item number, quantity, and UOM.

**6.** Click **Done** . Order is created in Pending Status.


**Approving a Store Order**


**1.** Log in to the SIM with the correct store.

**2.** Navigate and select **Inv Mgmt** - **Store Orders** .

**3.** Double-click on the store order to be approved.

**4.** Specify a delivery date range.

**5.** Click **Approve** . Order status is changed to Approved Status.


**Database Validation**


**Functionality** **SIM Table** **RMS Table**



Store Order PRINT_STORE_ORDER_ITE

M



STORE_ORDER



PRINT_STORE_ORDER N/A
