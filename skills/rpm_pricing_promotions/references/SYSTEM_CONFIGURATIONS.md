# RMS Pricing & Promotions - System Options & Implementation Configurations

#### **RMS and RPM**

RMS Integration with Other Applications

- Wastage

- Sub-transaction level items

- Primary variant relationships

- Variable weight PLU

- Store business day

- Code types

- Error codes

- Store POS

- Tender type

- Merchant code types

- Partner vendors

- Supplier vendors

- Employee IDs

- Banner IDs

Along with the reference files, the following files are generated:

- Promotions File - This file contains RPM promotions.

- Currency File - This file contains valid currency codes in RMS.

- Warehouse File - This file contains valid physical warehouses from RMS.

- Inventory Status File - This file contains valid inventory status values from RMS.

All clean and audited sales and returns data is extracted from ReSA into a POSU file
by the batch program SAEXPRMS. All sale and return transactions that do not have
RMS errors are extracted into the file. The sales audit system options parameter work
unit controls the export of data into files in case of the presence of RMS errors in the
POS/OMS transaction data. The shell scripts UPLOADSALES.KSH and
SALESPROCESS.KSH will load the data from the POSU file into the RMS tables.

RPM exists on the same database schema as RMS which allows information to be
shared between applications through direct database reads, package calls, and batch
processes. RPM uses APIs to facilitate the exchange of information with RMS.

RPM provides the following to RMS:

- Regular Price Event Approval/Modification/Deletion-Regular price event
creation, modification, or deletion triggers a call to an RMS API to generate (or
remove if deleting) the ticket request information.

- Price Event Execution- For regular, promotional, or clearance price events that end
or are set to go into effect, the PriceEventExecutionBatch owns the process. When
the pricing event has been processed by the batch program it updates
item/location pricing in RMS by interfacing with the RMSSUB_PRICECHANGE
API in RMS.

- Initial Pricing-Initial pricing for items in RMS is dependent upon the primary zone
group for the item defined in RPM and characteristics of that zone group. These
characteristics include markup percent, markup percent type, and pricing guides.

Oracle Retail Merchandising System **5-11**

RMS Integration with Other Applications

RPM provides this information to RMS through an API (MERCH_ RETAIL_API_
SQL).

           - Deal Creation- For Price Changes and Clearances, RPM creates new details under
existing deals. Promotions can create new deals in addition to creating details
under existing deals. When this occurs RPM uses an RMS API (PM_DEALS_API_
SQL) to create the deal in RMS.

RMS provides the following to RPM:

           - Foundation Data is essential to RPM functionality. To successfully set up price
changes RPM requires RMS merchandise hierarchy, organizational hierarchy, and
suppliers. RPM is able to access this information through the RMS database.

           - Item-Price changes created in RPM ultimately relate to an item/location within
RMS. RPM must know all eligible items currently in the merchandising system,
the locations at which they are eligible (item/location relationships) in any status
and the suppliers associated with the items. RPM can access this information
through the RMS database.

           - Competitive Pricing Information-RPM has the ability to create price changes based
off competitive activity in the marketplace. RPM is able to access this information
through the RMS database.

           - Deals can be associated with price changes in RPM (including vendor funded
promotions). In order to associate a price change to an existing deal RPM needs
visibility to the deals currently available in the RMS system. RPM is able to access
this information through the RMS database.

           - Event Notification -To ensure appropriate processing, RPM must be notified of
certain events:

**–**
Store/Warehouse Creation-A zone structure must be added to RPM when new
stores and warehouses are created in RMS. To do this RMS provides RPM with
the store and/or virtual warehouse being added, its pricing location, and its
currency (to ensure it is the same as the zone it is being added to). A
store/virtual warehouse creation event in RMS triggers an API call to RPM to
perform the necessary processing.

**–**
Item/Location Creation-When new item/location relationships are
established, RPM must verify that no future retail records currently exist,
create an initial future retail record (for sellable items), and determine if there
are existing price changes that would affect the item resulting in a future retail
record for the price change as well. An item/location creation event in RMS
triggers data to be staged in RPM so that it is picked up for the batch
processing.

**–**
Item Modification is used to notify RPM when an item is reclassified. The
details of the reclassification are written to an item modification table in RPM
for the next batch processing run. An item modification creation event in RMS
triggers an API call to RPM to perform the necessary processing.

**–**
Department Creation is used to notify RPM when new departments are
created in RMS. RPM creates aggregation-level information for the new
department using predefined system defaults. A department creation event in
RMS triggers an API call to RPM to perform the necessary processing.

---

#### **Allocation and RPM**

RPM provides the following to Allocation:

           - **Future retail**           - Oracle Retail Allocation has the ability to get a real time price from
RPM with which it is directly integrated. Allocation uses this data to provide the
future retail price values of the set of items present in the entire allocation (based
on their quantities). In addition, you can access future retail price values by item
and by location.

           - **Promotions**           - You can associate active or future promotions present in RPM while
creating an allocation.

Allocation provides no information to RPM.

---

#### **Invoice Matching and RPM**

Information is not shared between these applications.

---

### **RPM in the Oracle Retail Footprint**

The following flowchart illustrates the position of RPM in relation to other Oracle
Retail modules:

_**Figure 10–1 RPM Illustrated as Part of the Oracle Retail Footprint**_

---

### **Price and Promotion Data**

This section of the document provides details that pertain to all types of price events
and helps provide insight on how to optimize and configure data to improve
functionality in RPM.

=========================================

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
