# RMS Organization Hierarchy - System Options & Implementation Configurations

#### **RMS and Xcenter/Xstore**

RMS provides the following to Xcenter/Xstore:

           - Foundation Data - This data is essential to the Xcenter/Xstore suite functionality.
This includes the following:

**–**
Full organizational hierarchy to support functionality such as rolling out new
keyboard configurations by region, etc.

**–**
Stores including their addresses

**–**
Full merchandise hierarchy to support Xcenter/Xstore reporting
functionalities.

**–**
Differentiators and differentiator groups to support functionality such as
looking up a sku by style/color.

           - Item - Item information is generated at both the corporate and location level
specific files and are sent to the Xcenter/Xstore application. Item information
being sent includes the Item header, Item/Location, VAT Item, and Related Item
information.

**Note:** The Oracle Retail Merchandising System interfaces can
integrate with other third party Point of Sale applications.

---

#### **Integration with Supply Chain Partners**

As the merchandise moves from manufacturers' warehouse/factory to the discharge
port at the import country, the supply chain partners share information with the
retailer in a specified file format. The batch program TRANUPLD uploads the
information provided in the files into the transportation tables in RTM/RMS database,
thus providing online visibility of the merchandise in the supply chain.

The files provided by the supply chain partners should be placed in the proper input
directory, so that the batch program TRANUPLD can pick up the file and process the
same. In case the files provided by the supply chain partners differ from the expected
file format, custom program must be written to convert the data from the original file
format to the required file format.

The following diagram illustrates the interaction between RTM and external agencies.

_**Figure 6–1 Interaction between RTM and External Agencies**_

**6-6** Oracle® Retail Merchandising Implementation Guide

Other Features

---

#### **Integration with Xstore Point-of-Service and Order Management System**

Sales, returns, and other transaction data are loaded into ReSA from a Point-of-Service
application, such as Oracle Retail Xstore, for in-store transactions and an Order
Management System, for ecommerce orders fulfilled from non-store locations. These
applications should provide a standard RTLog file. The RTLog data is loaded into
ReSA either in trickle mode or once a day. If the data is uploaded in trickle mode, then
corporate inventory reflects a more accurate intra-day stock position. The data from
the RTLog is loaded into ReSA using the batch program SAIMPTLOG for end-of-day.
If trickle processing is used the final RTLog for the day must include a count of all
RTLog files for the store/day.

---

#### **Integration with Store Inventory Management**

ReSA sends audited data to SIM which helps SIM to be synchronized with RMS with
respect to inventory levels. The batch program SAEXPSIM extracts information from
transactions with changed item quantities, item deletions, item addition, change in
item status to VOID, and change in transaction status to PVOID. This information in
the form of a file (SIMT) is uploaded and processed by SIM.

---

#### **Dynamic Area Differentials**

System Option name: RPM_SYSTEM_OPTIONS.DYNAMIC_AREA_DIFF_IND

Within the Area differential pricing strategy, this system option controls the ability to
modify a secondary zone retail price after a primary zone has been approved. If the
checkbox is checked (Y), the batch program Merchandise Extract will create all records,
both primary and secondary areas, in New status. If a proposed retail is not available
for the primary area, the secondary records should be calculated using the basis retail
of the primary area or competitor retail (whichever is lowest).The worksheet will
dynamically update the secondary locations based on changes to the primary location
and the user will be allowed to edit the secondary areas regardless of the status of the

Oracle Retail Price Management **10-55**

System Options

primary records. If the checkbox is not checked (N), the batch program Merchandise
Extract will create secondary locations in pending status and the user will not be
allowed to edit the secondary locations in the worksheet until the primary area has
been approved.

This system option is also responsible for controlling the ability to layer competitive
strategies onto an Area Differential Strategy. If the option is checked (Y) then a
competitor can be added to the area differential strategy for the secondary zones and
the suggested retail price will be the lower price of the two strategies Area Differential
and Competitive. The competitor information setup will not be applied in the Price
Change dialog when calculating the proposed retail for a secondary area. The
competitor information will only be used in the Merchandise Extract batch job and
worksheet functionality.

**Note:** The proposed retails are displayed based on the percent higher
or lower for the secondary locations.

Valid values: 0 - No (unchecked); 1 - Yes (checked)

Default value: 0 - No (unchecked)

=========================================

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
