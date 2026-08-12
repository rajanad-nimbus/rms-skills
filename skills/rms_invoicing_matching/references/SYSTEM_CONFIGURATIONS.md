# RMS Invoice Matching (ReIM) - System Options & Implementation Configurations

## Excerpts from Implementation Guide (System Options & Setup)

### **Oracle Retail Invoice Matching**


Invoice matching is a control procedure designed to ensure that the retailer pays the
negotiated cost for actual quantities received.


ReIM supports the invoice verification process with accuracy and efficiency, focusing
resources on exception management. ReIM accepts electronic invoice data uploads
through Electronic Data Interchange (EDI) and provides rapid online summary entry
of invoices. ReIM supports automated and online processes that allow one or more
invoices to be matched against one or more receipts. When the cost and quantities of
an invoice are matched within tolerance, the invoice is ready for payment and staged
to a table to be extracted to the accounts payable application.


If a cost or quantity difference between the invoice and receipts is outside tolerance, a
discrepancy is recognized and must be resolved. A flexible resolution process allows
discrepancies to be directed to the most appropriate user group for disposition.
Reviewers can assign one or more reason codes that they are authorized to use to
resolve the discrepancy.


Each reason code is associated with a type of action (for example, create chargeback or
receiver cost adjustment). Many reason codes can be associated with a particular
action type, allowing more granular reporting. Actions drive document creation and
EDI downloads to suppliers, inventory adjustments, and accounting activities. Actions
also allow an invoice to be extracted by a retailer and posted for payment.


---

#### **Integration with Oracle Retail Invoice Matching**


RTM, RMS, and ReIM share the same database schema.


**Customs Entry Record -** Confirmation of the customs entry record inserts an approved
non-merchandise invoice record into the Invoice Matching staging tables for extract
and uploads into ReIM.


**Obligations Entry -** Approving an obligation inserts an approved non-merchandise
invoice record into the Invoice Matching staging tables for extract and upload into
ReIM.


---

#### **Integration with Oracle Retail Invoice Matching**


In the normal course of business, payments are made to vendors at the store level.
Payments for merchandise purchases done at store level are booked against a
corresponding merchandise invoice. Payments of non-merchandise purchases or
miscellaneous services availed at the store are booked against a corresponding
non-merchandise invoice. These transactions are passed from the POS/OMS to ReSA
as specially designated PAID OUT transactions (sub-transaction type of EV - Expense
Vendor or MV - Merchandise Vendor). All these invoices are assumed paid. The batch
program SAEXPIM transfers the PAID OUT type of transactions to the Invoice
Matching staging tables.


The batch program SAEXPIM is also used for escheatment processing. Unclaimed
monies of outstanding, non-expiring vouchers are totaled after a defined period of
time from the date of issuance of the voucher and posted to the Invoice Matching
staging tables as a non-merchandise invoice by SAEXPIM. The unclaimed amount is
paid out as income to the issuing Retailer. In some U.S. states, it is paid out to the state
(based on configuration). ReSA determines who receives this income and accordingly
posts a non-merchandise invoice for the partner. These invoices are assumed not paid.


The batch job EDIDLINV is used to extract the invoices from the Oracle Retail Invoice
Matching (ReIM) staging tables and load as EDI invoices to ReIM.


---

#### **Allocation and ReIM**


No information is exchanged.


---

## **Oracle Retail Invoice Matching**


This chapter is an overview of Oracle Retail Invoice Matching (ReIM).


=========================================

## Excerpts from Operations Guide 3 (System Configurations)

#### **ReIM Data Setup and Configuration**


This section describes setup considerations for ReIM data.


**System Options**

As part of the RMS system options setup script, set the following options as indicated:


        - FINANCIAL_AP =A


**Chart of Accounts Setup**

The chart of accounts is set up manually in Oracle Retail applications and in Oracle
General Ledger. All account combinations are set up in each Set Of Books. Account
validation is done while executing Financial Posting batch .


**Segment Mapping**

The retailer determines how many segments are populated. Up to 20 account segments
can be specified. The following is an example of how segments are mapped between the
ReIM transaction table and Oracle General Ledger:


**ReIM Segments** **Oracle General Ledger Chart of**
**Accounts**


Segment 1 PRODUCT


Segment 2 ACCOUNT


Segment 3 ALTACCT


Segment 4 OPERATING_UNIT


Segment 5 FUND_CODE


Segment 6 DEPTID


Segment 7 PROGRAM_CODE


Segment 8 CLASS_FLD


Segment 9 BUDGET_REF


**254** Oracle Retail Merchandising System


Data Setup


**ReIM Segments** **Oracle General Ledger Chart of**
**Accounts**


Segment 10 BUSINESS_UNIT_PC


Segment 11 PROJECT_ID


Segment 12 ACTIVITY_ID


Segment 13 RESOURCE_TYPE


Segment 14 RESOURCE_CATEGORY


Segment 15 RESOURCE_SUB_CAT


Segment 16 CHARTFIELD1


Segment 17 CHARTFIELD2


Segment 18 CHARTFIELD3


Segment 19 AFFILIATE


Segment 20 AFFILIATE_INTRA1


If any one of the values in the 20 segments does not match the Oracle General Ledger, the
account combination is considered as invalid. The following error message is added to
IM_POSTING_DOC_ERRORS table “One or more accounts subjected to posting is
invalid”.


Segments 1 and 2 may be set up as dynamic at the Location level, or Segments 4 and 5
can be dynamic at the Department and Class level respectively. Segments defined as
dynamic are allowed to be null for certain types of Basic Transaction or Reason Code
cross-reference types. When a segment is null, the segment is assigned dynamically when
transactions are posted. (Non-dynamic segments cannot be blank). Validation applies to
the segment combination, not to individual segments.


**Note:** For Tran code TAP, each segment must have a value
regardless of whether the segment is dynamic.


The initial load for ReIM is run by Oracle E-Business Suite and includes the following
information:


  - Suppliers


  - Currency Rates


**Note:** The view, mv_currency_conversion_rates should be
refreshed once the initial loads of currencies from Oracle
General Ledger are loaded to ReIM.


**IM_SYSTEM_OPTIONS table setup**

To accommodate integration, the IM_SYSTEM_OPTOINS table should be configured
with the following properties.


**WS_FIN_ACC_VALID_URL**  - This attribute holds the URL for the financial account
validation web service.


**WS_FIN_ACC_VALID_CRED**  - This attribute indicates if the account validation web service
call is authenticated or not. Y means Authentication enabled. N means Authentication is
not enabled (See configuring web service credentials in weblogic server).


**WS_FIN_DRILL_FWD_URL**  - This attribute holds the URL for the financial drill forward
web service.


Integrating RMS with Oracle E-Business Suite Financials Using Oracle Retail Financial Integration **255**


Data Setup


**WS_FIN_DRILL_FWD_CRED**       - This attribute indicates if the drill forward web service call
is authenticated or not. Y means Authentication enabled. N means Authentication is not
enabled (See configuring web service credentials in weblogic server).


The above attributes are configured in the System Options screen.


**Configuring WebService Credentials in Weblogic Server Enterprise Manager:**


The credentials for the web service call are configured in the default domain credential
store of the weblogic server through the admin console.


**Create A Map:**


**256** Oracle Retail Merchandising System


ReIM Transactional Maintenance


**Creating Credentials:**


**Note:** Select the map as ReIM. The Key name should always
be WS-ALIAS. Any user name / password can be assigned
to the key


Reports are created by Business Intelligence Publisher for the following:

The URL for each report must be updated in the table,
RETAIL_SERVICE_REPORT_URL. The following table provides sample URLs.


---

### **ReIM Transactional Maintenance**


Integration to Oracle General Ledger includes a number of transactions, as described
below.


---

#### **ReIM Data Setup and Configuration**


This section describes setup considerations for ReIM data.


**System Options**

As part of the RMS system options setup script, set the following options as indicated:


        - FINANCIAL_AP =A


---

### **ReIM Transactional Maintenance**


Integration to PeopleSoft General Ledger includes a number of transactions, as described
below.


---

#### **Drilling Back to ReIM from PeopleSoft Enterprise Financials**


The following drill back options are available for viewing information within the ReIM
system:

Using Document ID, users can drill back to ReIM to view information related to a
voucher or payment. The report includes information from im_doc_head and
im_invoice_detail, the same data shown on the Document Maintenance Header screen
within ReIM.


Using the Receipt ID, users can drill back to view information from the Receipt Write-off
History screen. Receipt write-offs occur either when an open receipt is closed in ReIM or
if a receipt is purged in RMS before it is fully matched. Details come from the
IM_RWO_SHIPMENT_HIST and IM_RWO_SHIPSKU_HIST tables.


The function below determines which of the two ReIM reports to return to the user:

```
         REIM_REPORT_URL() 
         O_error_message   IN OUT   RTK_ERRORS.RTK_TEXT%TYPE
         O_rpt_url      IN OUT   RETAIL_SERVICE_REPORT_URL.URL%TYPE
         I_ref_key      IN     KEY_MAP_GL.REFERENCE_TRACE_ID%TYPE

```

The I_ref_key contains the reference ID, which ultimately determines the type of report
required. The appropriate BI Publisher report URL is found on the
RETAIL_SERVICE_REPORT_URL table.


In general, if the reference ID has a prefix of RECEIPT, the report type (RS_CODE) is
RCPT. Otherwise, the report type is DOC. For example:


**Reference ID** **Report Type (RS_CODE)**


MRCHI#101 DOC


NMRCHI#102 DOC


RECEIPT#103 RCPT


The following is an example of a BI Publisher URL that is generated upon drilling back to
PeopleSoft Enterprise Financials for information on an invoice in ReIM, using Document
ID as the search parameter:

```
        http://mspdev6970vip:7777/BIPublisher/Guest/ReIM/13.0.3/doc/tsf_det.xdo
        ?doc_id=101

```

Where

```
        http://mspdev6970vip:7777/BIPublisher = the BI Publisher application server
        address and port

```

Guest/ReIM/13.0.3 = the directory/folder location

doc/tsf_det.xdo ? = report name (Document Report)

doc_id=101 = the parameter name and value (Document ID 101)


**274** Oracle Retail Merchandising System


Drilling Forward


The following is an example of an Oracle Business Intelligence Publisher URL that is
generated upon drilling back to PeopleSoft Enterprise Financials for information on an
invoice in ReIM, using Receipt ID as the search parameter:

```
         http://mspdev6970vip:7777/BIPublisher/Guest/ReIM/13.0.3/doc/tsf_det.xdo ?receipt_id=101

```

Where

```
        http://mspdev6970vip:7777/BIPublisher = the BI Publisher application server
        address and port

```

Guest/ReIM/13.0.3 = the directory/folder location

doc/tsf_det.xdo ? = report name (Receipt Report)

receipt_id=101 = the parameter name and value (Receipt ID 101)
