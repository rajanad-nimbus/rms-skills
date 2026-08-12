# RMS Store Allocations - System Options & Implementation Configurations

## Excerpts from Implementation Guide (System Options & Setup)

### **Oracle Retail Allocation**


A retailer's most important asset is its inventory. Oracle Retail Allocation helps
retailers determine the inventory requirements at the item, store/warehouse, and
week level using real time inventory information. The system calculates individual
store or warehouse need based on parameters you set - whether it's the characteristics
of the product, the location, or the category. The result is an allocation tailored to each
destination location’s unique need.


Oracle Retail Allocation allows you to allocate either in advance of the order's arrival
or at the last minute to leverage real-time sales and inventory information. And when
you do allocate, the system provides you the flexibility of basing your allocation on
many different methods such as: merchandise sales plans, receipt plans, forecast
demand and sales history.


---

#### **RMS and Allocation**


RMS provides the following to Allocation:


**5-12** Product Title/BookTitle as a Variable


RMS Integration with Other Applications


- Foundation Data is essential to all areas of Allocation including valid locations to
allocate to and from, location groupings, and valid merchandise hierarchies to
allocate within.


- Item-Allocations are generated at the item location level so it is necessary that the
Allocation application understand what items and item/locations are eligible in
the system.


- Purchase Order-One of the sources from which a user can allocate. Allocation
relies on RMS to provide Purchase Order information.


- Transfer-One of the sources from which a user can allocate. Allocation relies on
RMS to provide Transfer information.


- Bill Of Lading (BOL)-One of the sources from which a user can allocate. Allocation
relies on RMS to provide BOL information.


- Advance Shipment Notices (ASN)-One of the sources from which a user can
allocate. Allocation relies on RMS to provide ASN information.


- Inventory-In order to determine the correct need at an item location level before
performing an allocation the application needs visibility to the current on hand
inventory at each location being allocated to. Allocation relies on RMS to provide
inventory information at the item/location level.


- Sales Information-Allocation can use historical sales, forecast sales, and plan sales
in order to determine the need at an item/location level for an allocation.
Allocation interfaces this information in from external planning system to an
Allocation table.


Allocation provides the following to RMS/RTM/ReSA:


- Foundation Data is essential to all parts of invoice matching including valid
locations for Invoices to be implemented at, valid suppliers to receive invoices
from, and supplier addresses to send credits and debits based on invoice matching
results.


- Item is essential to the invoice matching process as item information ensures that
invoices being received are valid for the business. For example an item received
on an invoice is carried by the client, is supplied by the supplier who sent the
invoice, and is carried in the locations for which the item was received.


- Purchase Orders are used by Invoice Matching to facilitate the invoice matching
process which is performed at the purchase order location level.


- Shipments-Shipment information is used by Invoice Matching to determine if a
PO has been received yet which affects the matching algorithm used by the
AutoMatch batch program in Invoice Matching.


- Deals and Rebate-Invoice Matching creates credit memos, debit memos, and credit
requests based on deal and rebate information in RMS for processing by the
financial (AP) system. This is performed by the ComplexDealUpload and
FixedDealUpload batch processes that read from RMS staging tables.


Invoice Matching provides the following to RMS:


- Invoice Matching results for shipments-Shipment records are updated with the
invoice matching results from the invoice match process (this involves updating
the match status and quantity matched of the shipments in question). The
matching process is handled by the AutoMatch batch process in Invoice Match
which attempts to match all invoices in ready-to-match, unresolved, or
multi-unresolved status.


Oracle Retail Merchandising System **5-13**


RMS Integration with Other Applications


           - Receiver Cost Adjustments-An API is executed when invoice matching
discrepancies are resolved through a receiver cost adjustment. The API updates
the purchase order, shipment, and potentially the item cost in RMS, depending on
the reason code action used.


           - Receiver Unit Adjustments-An API is executed when invoice matching
discrepancies are resolved through a Receiver Unit Adjustment. The API updates
the purchase order and shipment in RMS to complete the transaction.


           - Closing unmatched shipments-Invoice matching closes the invoice matching
status for shipments in RMS after a set period of time (defined by the client in
system options). This updates the invoice matching status of the shipment on the
shipment table in RMS. This process is managed by the ReceiptWriteOff batch

program.


---

## Oracle Retail Allocation 8

This chapter provides an overview of Oracle Retail Allocation.


---

### **Information Maintained by Allocation**


The following information is maintained in the Allocation application:


**Standard Allocations**         - Oracle Retail Allocation provides the customer a number of
sources from which to allocate products. These sources include:


           - Purchase Orders


           - Advanced Shipment Notifications (ASN)


           - Transfers


           - Bill of Lading (BOL)


           - Warehouse inventory


           - Approved warehouse-to-warehouse allocations


Customers have more access and control to existing transactions as a result of the
different item sources, which results in increased supply chain efficiency.


**What if Allocations**         - These allocations are similar to the standard ones with the
exception that it is assumed that these have an infinite amount of product available to
allocate. This allows a customer to determine the true need for the locations being
allocated to, and they can choose to create a purchase order based on the allocation to
fulfill the need. The user can also enter a finite available quantity during the creation
of a 'what if' allocation, in which case this value gets treated as an upper cutoff.


**ScheduledAllocations**         - Manually re-creating allocations that have the same criteria
requires time. Oracle Retail Allocation allows users to define an allocation and
schedule it to be automatically re-created on specific dates and time until the end date
is met, warehouse stock is depleted, or threshold is met.


**Allocation Templates**         - Oracle Retail Allocation users can create standard templates to
apply to allocations to save time. Two types of templates can be created: allocation
location groups and policy.


**Policies**          - Oracle Retail Allocation requires the selection of a policy for the calculation
of an allocation. The policy defines the source of the data used in the calculation of the
allocation and other parameters that are used in the calculation.


**Advanced Need Determining Calculations**        - Allocations are calculated in real time by
advanced internal algorithms that calculate store or warehouse need based on the
policy parameters established by the customer and the current perpetual inventory
and sales for the items being allocated.


Oracle Retail Allocation **8-1**


Implementation Considerations


**Split Allocations**         - Oracle Retail Allocation allows users to react to changes (such as
short ships, delays, and cancelled product) by splitting an allocation. Using this
functionality, users can split one or many items off from an existing allocation and
onto a new allocation of their own.


---

#### **Allocation Item Types**


The way items are classified in Allocation is different from RMS and most of the
enterprise. The ALC_ITEM_TYPE is best explained with examples. This is not the
exhaustive list of possible combinations, but is instead an illustration of possibilities.
When examples of the data in the item_master table are presented, please be aware
that the example only shows a small subset of the columns on the table. Not all items
in the ITEM_MASTER table will be considered by Allocation. Thus, not all items in
ITEM_MASTER will have the ALC_ITEM_TYPE column populated.


**ALC_ITEM_TYPES**


           - Staple Item (ST)


           - Sellable Pack (SELLPACK)


           - Style (STYLE)


           - Fashion Item (FA)


           - Fashion SKU (FASHIONSKU)


           - Pack Component (PACKCOMP)


           - Non-sellable Fashion Simple Pack (NSFSP)


           - Non-sellable Staple Simple Pack (NSSSP)


           - Non-sellable Staple Complex Pack (NSSCP)


           - Non-sellable Fashion Multi-color Pack (NSFMCP)


           - Non-sellable Fashion Single Color Pack (NSFSCP)


**Staple Item**
A one level item is not related to any other items.



**Item**


**(ID, not**
**null)**



**Item_level**


**(not null)**



**Item_**
**parent**


**(nullable)**



**Item_**
**grandparent**


**(nullable)**



**ALC_**
**ITEM_**
**TYPE**



**Tran_level**


**(not null)** **Diff_1** **Diff_2**



**ITEM_**
**AGGREGA**
**TE_IND**



182920285 Null Null 1 1 Null Null N ST


Transaction level items of multiple level item families that have their aggregation
indicator marked as N.


**8-2** Oracle® Retail Merchandising Implementation Guide


Implementation Considerations



**Item_**
**grandparent**


**(nullable)**



**Item**


**(ID, not**
**null)**



**Item_**
**parent**


**(nullable)**



**Item_level**


**(not null)**



**ALC_**
**ITEM_**
**TYPE**



**Tran_level**


**(not null)** **Diff_1** **Diff_2**



**ITEM_**
**AGGREGATE**
**_IND**



100001393 Null Null 1 2 COLOR SIZE N


100001828 100001393 Null 2 2 RED SMALL N ST


100001561 100001393 Null 2 2 BLUE SMALL N ST


100075018 Null Null 1 3 null null N


100075026 100075018 Null 2 3 null null N


100075034 100075026 100075018 3 3 null null N ST


**Sellable Packs**

All pack items that have ITEM_MASTER.sellable_ind = Y are classified as Sellable
Packs in Allocation.



**Item**


**(ID, not null)**



**Item_level**


**(not null)**



**Tran_level**


**(not null)** **PACK_IND**



**SELLABLE_**
**IND**



**ALC_ITEM_**
**TYPE**



110919650 1 1 Y Y SELLPACK


110919649 1 1 Y Y SELLPACK


111394648 1 1 Y Y SELLPACK


**Fashion Item Families**

These are item families where the transaction level is 2 and the aggregation indicator
at level 1 is Y. Allocation introduces a new level between the level 1 item and the level
2 items. These intermediate level items (1.5) do not exist on the ITEM_MASTER table.


Level 1 items hold diff groups and level 2 items hold diffs in fashion item families



**Item_**
**level**


**(not**
**null)**



**DIFF_**
**2_**
**AGGRE**
**GATE_**
**IND**



**ALC_ITEM_**
**TYPE**



**Tran_**
**level**


**(not**
**null)** **Diff_1** **Diff_2**



**DIFF_**
**1_**
**AGGRE**
**GATE_**
**IND**



**Item**


**(ID, not**
**null)**



**Item_**
**parent**


**(nullable)**



**Item_**
**grandp**
