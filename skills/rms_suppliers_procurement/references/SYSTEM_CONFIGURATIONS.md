# RMS Suppliers & Procurement - System Options & Implementation Configurations

## Excerpts from Implementation Guide (System Options & Setup)

#### **Purchasing** **Contracts** **Deals**



Information Maintained by RMS


The Purchase Order module allows you to create and maintain purchase orders in a
variety of ways. It provides commitments to vendors for products in specific amounts
for specified locations. Purchase orders are created manually or automatically through
replenishment or from an external system. They can be created against entered
contracts and deals, or directly through direct store delivery or Vendor Managed
Inventory (VMI). RMS also provides the ability to maintain the items, locations, and
quantities ordered for Purchase Orders.


The contract dialog gives you the ability to create, maintain, submit, and approve
contracts. A contract is a legally binding agreement with a supplier to supply items at
a negotiated cost.


In RMS, the contracting functions fit closely with the replenishment and ordering
functions. The main functions of the Contracts window are to book manufacturing
time, track supplier availability and commitments, and match them with business
requirements. The main business benefit of contracting is to achieve supplier
involvement during the planning phase of a retailer's business.


Deals management allows you to create and maintain deals with partners or suppliers.
Deal partners can be suppliers, distributors, and manufacturers. Within a deal, clients
create deal components, specify the items for each deal component, and define
thresholds.


Components are deals or parts of deals that a retailer receives from a supplier. There
can be multiple components in a single deal. You must define thresholds to define the
quantity or amount that must be purchased or sold to receive the deal. RMS
components include off-invoice deals, rebates, vendor-funded promotions,
vendor-funded markdowns, and fixed deals.


You also define the items and locations for which the deal can be applied. You can
choose to include or exclude locations as necessary.


You also define the Proof Of Performance (POP) terms for a deal. POP terms are
defined by the deal vendor that offers the deal. For deals, POP terms are defined at the
deal, deal/component, or deal/component/item-location combination. For fixed
deals, POP terms are defined at the deal level.


The deal pass-through functionality allows a percentage of a deals discount to be
passed from a warehouse to a franchise store. This functionality applies to franchise
stores.


For clients that choose to use supplier sites with RMS, deals are managed at the
supplier parent level.



---

#### **Integration with External Partners**


RTM automates the international import transaction data. Four components of RTM:
Customs entry, harmonized tariff schedule, letter of credit, and transportation have
batch-processing modules that facilitate the flow of data between RTM and external
applications and files.


**Sharing the Letter of Credit Data with the Trading Partners**
Letter of credit batch modules process letter of credit applications and amendments to
banks, and upload confirmations, drawdown notifications, and related information
from banks. Letter of credit batch module downloads and uploads data in an
internationally recognized standard format called SWIFT (Society for Worldwide
Interbank Financial Telecommunications).


The batch program LCADNLD extracts approved letter of credit applications to banks.
The LCMT700 Perl script converts the LC applications from an RTM file format to the
SWIFT (MT 700) format.


The issuing bank sends the retailer a confirmation when it agrees to stand as guarantee
for the LC. The LCMT730 Perl script converts letter of credit confirmations from a
SWIFT format (MT730) to an RTM flat file format. The batch program LCUPLD
uploads the converted data from the table to the RTM database tables.


The issuing bank informs the retailer when credit draw downs are made against the
LC or when bank charges the retailer the bank fees. The LCMT798 Perl script converts
draw downs and bank fees data from a SWIFT file format to an RTM format. The batch
program LCUP798 uploads the converted data from the table to the RTM database
tables.


At times after a LC has been issued and confirmed, the retailer might want to make
amendments to the LC. An amendment to a LC is valid when all parties involved
agree to the new conditions and the agreement has been registered. Retailer initiated
amendments are extracted by the batch program LCMDNLD. The LCMT707 Perl
script converts the LC Amendments from an RTM file format to the SWIFT (MT707)
format.


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

#### **Invoice Matching and External Suppliers**


Invoice Matching gets invoices from external suppliers in one of two ways: EDI or
hardcopy. When EDI is used, the EdiInjector batch program is responsible for
uploading the invoice details from the vendor using a standardized file format. When
a hardcopy is used, the client needs to manually enter the invoice in the system before
matching can proceed.


Notification to suppliers of charge backs and requests for credit notes, as well as credit
memos is provided in a flat file extracted by EdiDownload batch process.


=========================================

## Excerpts from Operations Guide 3 (System Configurations)

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
