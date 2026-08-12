# RMS Replenishment Engine - Operations, Batch Jobs & RIB Integration Guide

## Excerpts from Operations Guide 1 - Batch Job Designs

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

### **cntrordb (Create Replenishment Orders for Item/Locations on Type B** **Contracts)**

|Module Name|cntrordb.pc|
|---|---|
|**Description**|Create Replenishment Orders for<br>Item/Locations on Type B Contracts|
|**Functional Area**|Contracts|
|**Module Type**|Business Processing|
|**Module Technology**|ProC|
|**Catalog ID**|RMS232|
|**Runtime Parameters**||



---

### **cntrprss (Apply Type A, C and D Contracts to Orders Created by** **Replenishment)**

|ment)|Col2|
|---|---|
|**Module Name**|cntrprss.pc|
|**Description**|Apply Type A, C & D Contracts to<br>Orders Created by Replenishment|
|**Functional Area**|Contracts|
|**Module Type**|Business Processing|
|**Module Technology**|ProC|
|**Catalog ID**|RMS202|
|**Runtime Parameters**||



---

## **Replenishment**

Replenishment is a complex business process that monitors stock levels and creates
transactions to ensure that stores and WHs have optimal stock levels.


RMS supports a number of Replenishment Methods. A Replenishment Method is
associated with each item/location being replenished. Each Replenishment Method uses
an optimized calculation to determine the correct stock orders to create. Depending on
the locations, inventory in the supply chain and other factors, these stock orders can be
either Purchase Orders sent to a supplier, Transfers of inventory from WH to store or
Allocations.


The main purpose of this chapter is to describe the batch processes involved in
Replenishment. There is some discussion of user interfaces and database tables involved
in the larger Replenishment business process to provide context for the batch processes,
but please be aware that the discussion in this chapter of user interfaces and tables not
exhaustive.


For additional information about Replenishment, see the Merchandising Functional
Library (Doc ID: 1585843.1). Note that the White Papers in this library are intended only
for reference and educational purposes and may not reflect the latest version of Oracle
Retail software.



---

#### **Replenishment Sub Processes**

Replenishment can be divided into four major sub-processes:











**1.** Establishment/Management of Replenishment Calculation Attributes


**a.** Replenishment Calculation Attributes drive how quantities will be calculated. A

number of UIs and batch processes maintain this data.


**2.** Calculation of Recommended Order Quantity (ROQ)

**a.** Complex processing determines the Recommended Order Quantity (ROQ) to

meet optimal stock level for item/locations based on current stock, forecasts,
history, Replenishment Calculation Attributes and other calculation inputs
(please note that the inputs and calculations vary depending on the
replenishment method selected for each item/location).


**b.** If a client uses Investment Buying, additional calculations are performed to

determine where additional profitable opportunistic purchases can be made.


**3.** Build Transactions to Replenish Inventory

**a.** Based on ROQ and Investment Buy, Purchase Orders, Allocations and Transfers

are created.


Operations Guide, Volume 1 - Batch Overviews and Designs **195**


Overview



**b.** Additional processing optimizes these transactions.


**4.** Cleanup of Replenishment Data


**a.** Cleanup processes purge aged data to ensure good performance.


**Establishment/Management of Replenishment Calculation Attributes**

Many user and batch processes combine to manage replenishment calculation attributes.


**1.** replsizeprofile.pc reconciles the size profiles in RMS and Allocations and refreshes

the size profile materialized view used in replenishment processing.


**2.** Users create or update assorted replenishment calculation attributes. Data defined

by end users includes the schedule the item/location should be reviewed and
item/location level attributes. Item/location level attribute changes are written to a
series of Replenishment Attribute Staging Tables.


**3.** rplatupd.pc moves information from the item and location level Replenishment

Attribute Staging Tables (repl_attr_update_item and repl_attr_update_loc) to the
Replenishment Attributes Working Table (repl_item_loc)


**4.** rilmaint.pc moves information from the item/loc level Replenishment Attribute

Staging Table (repl_item_loc_updates) to the Replenishment Attributes Working
Table (repl_item_loc)


**5.** repladj.pc updates the Replenishment Attributes Working Table (repl_item_loc) for

item/locations using the Floating Point Replenishment Method based on history.























**Calculation of Recommended Order Quantity (ROQ)**

Many user and batch processes combine to calculate ROQ. Item/Locations follow very
different paths through the calculation of ROQ depending on whether they are
replenished from inventory (WH to Store via transfer) or from suppliers (via Purchase
Order).


**1.** replroq.ksh determines working net inventory


**2.** batch_reqext.ksh multithreads reqext.pc


**196** Oracle Retail Merchandising System


Overview


**a.** reqext.pc uses calculated ROQ in rpl_net_inventory_tmp, franchise order

quantity on store_orders, and replenishment attributes to create transfer.
Adjusted ROQ is written to repl_results.


**Note:** Transfers generated by Replenishment will follow the
same integration, processing and admin described in the
‘Transfers, Allocations and Receiving’ described in this
volume. Transactions will also be published as described in
Volume 2 of the Operations Guide.


**3.** rplext.ksh uses replenishment attributes to determine ROQ for item/locs replenished

from suppliers. ROQ is written to repl_results. Working POs are written to
ord_temp.


**4.** If the customer uses Contracts, contracts are evaluated by cntrprss.pc. See the

chapter ‘Contracts’ in this guide for more information.

**5.** If the customer uses Investment buying

**a.** ibexpl.pc determines eligible investment buy opportunities

**b.** ibcalc.pc calculates recommended investment buys that will meet the target

return-on-investment



























**Build Transactions to Replenish Inventory**

Transactions are built based on ROQ. Additional jobs optimize the resulting POs,
Allocations and Transfers.


**1.** rplbld.pc uses ROQ and Investment Buy Results to build Orders


**2.** supcnstr.pc scales POs based on supplier constraints


Operations Guide, Volume 1 - Batch Overviews and Designs **197**


Overview



**3.** rplsplit.pc splits POs and Allocations to optimize truck loads


**4.** rplapprv.pc approves Purchase Orders and Allocations


**Note:** Once approved, Purchase Orders and Allocations
generated by Replenishment will follow the same
integration, processing and Admin described in the
‘Purchase Orders’ and ‘Transfers, Allocations and Receiving’
described in this volume. Transactions will also be
published as described in Volume 2 of the Operations Guide.


**5.** batch_rplapprvgtax.ksh updates tax information (only necessary for GTAX

implementations


**a.** repl_wf_order_sync.ksh creates appropriate franchise orders for approved

allocations created during replenishment













































**Cleanup Replenishment Data**


Replenishment creates large volumes of data. Several programs exist to purge
aged replenishment information. Regular purging ensures good batch
performance.


Note that all tables discussed in this chapter are not purged by replenishment
cleanup jobs. Many replenishment processes clean up their own working tables.
The POs, transfers and allocations created by replenishment are purged in their
own batch processes.


**1.** rplprg.pc purges aged ROQ and investment buy results.

**2.** rplahistprg.pc purges aged replenishment attribute history.

**3.** rplprg_month.pc purges ROQ and investment buy results.


**198** Oracle Retail Merchandising System
