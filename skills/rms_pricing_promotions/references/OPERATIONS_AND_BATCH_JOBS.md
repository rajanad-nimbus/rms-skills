# RMS Pricing & Promotions - Operations, Batch Jobs & RIB Integration Guide

## Excerpts from Operations Guide 1 - Batch Job Designs

### **fc_pricechg (Use Pending Price Changes to Drive Recalculation of Pricing** **Cost for some Franchise Item/Locations)**

|Module Name|fc_pricechg.ksh|
|---|---|
|**Description**|Use Pending Price Changes to Drive<br>Recalculation of Pricing Cost for some<br>Franchise Item/Locations|
|**Functional Area**|Future Cost|
|**Module Type**|Business Processing|
|**Module Technology**|ksh|
|**Integration Catalog ID**|N/A|
|**Runtime Parameters**||



---

### **distropcpub (Stage Regular Price Changes on Open Allocations/Transfers** **so Publishing Sends New Retail to Subscribing Applications)**

|Module Name|distropcpub.pc|
|---|---|
|**Description**|Stage Regular Price Changes on Open<br>Allocations/Transfers so Publishing<br>Sends New Retail to Subscribing<br>Applications|
|**Functional Area**|Transfers, Allocations, and RTV|
|**Module Type**|Integration|
|**Module Technology**|ProC|
|**Integration Catalog ID**|RMS216|
|**Runtime Parameters**||



---

### **rpmmovavg (Maintain Smoothed, Moving Average Sales History for RPM)**

|Module Name|rpmmovavg.pc|
|---|---|
|**Description**|Maintain Smoothed, Moving Average<br>Sales History for RPM|
|**Functional Area**|Sales History|
|**Module Type**|Business Processing|
|**Module Technology**|ProC|
|**Catalog ID**|RMS319|
|**Runtime Parameters**||



Operations Guide, Volume 1 - Batch Overviews and Designs **285**


rpmmovavg (Maintain Smoothed, Moving Average Sales History for RPM)


=========================================

## Excerpts from Operations Guide 3 - Technical Architecture

#### **Price Change**


Using the Price Change function, you can request price changes for items at your store.
Price changes are set in the pricing system. The pricing system might be in Oracle Retail
Price Management (RPM) or another application.

You can request price changes only for items for which you can control prices. This is
controlled by an indicator at the store (location) level. Your price change requests are
submitted to the pricing system, where they may be approved or rejected. After a price
change is approved in the pricing system, a price change event is sent from the pricing
system to SIM.

A price change request that is approved in the pricing system creates a pricing event that
is sent back to SIM. For an approved price change, you can print labels and tickets for the
re-priced items.


**Creating Price Change**

You can request price changes for those items for which you are allowed to make pricing
changes at the store (location) level. For these items, you can request changes to retail,
promotion, or clearance pricing.


**246** Oracle Retail Merchandising System


Transactions


The request is sent to the pricing system, where it may be approved or rejected. Your
price change requests are checked for possible conflicts. You cannot request price
changes for items involved in complex promotions (such as buy one, get one free). You
cannot request multiple price changes on the same day. Your request may be rejected if it
conflicts with any other pricing events.

To create price change and promotions in SIM:

**1.** Navigate and select **Inv Mgmt** - **Price Change** .

**2.** Enter search criteria to limit the price change requests that you want displayed, and
click **Search** .


**3.** Click **Create** .


**4.** Enter Item, start date, price change description and new price.

**5.** For clearance or promotion, select end date.

**6.** Click **Done** and accept the warning message.

RIB Validations: When the price is completed, a message is sent to ORPM using RIB as
interface.


- PRCCHGREQ_PUBLISHER in RIB-SIM


SIM DATABASE VALIDATION


- ITEM_PRICE : ID_ITM, EFFECTIVE_DATE, UNIT_RETAIL, STATUS.


Integrating RMS with Store Inventory Management **247**
