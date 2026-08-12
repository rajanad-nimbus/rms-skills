# RMS Import Management & Customs - System Options & Implementation Configurations

## Excerpts from Implementation Guide (System Options & Setup)

#### **RMS and RTM**


Oracle Retail Trade Management (RTM) and RMS share the same database instance.
When RTM is enabled in an RMS instance, certain import-specific data maintenance is
required for country, supplier, partners and items. These are directly updated into the
RMS database and subsequently used in RTM.


---

### **Letter of Credit**

A letter of credit (LC) is a bank instrument used by most retailers to finance purchase
of imported goods. LCs are a preferred method of international settlement because the
conditions of the purchase, such as required documents and special instructions are
detailed in the text of the LC and reviewed by the bank for compliance before the
release of payment. They provide importers with a secure method to pay for
merchandise and vendors with a secure method to receive payment for merchandise.
Letters of credit can be created and applied to purchase orders. Activity against the
letter of credit can also be tracked. When the goods are shipped and shipping
documents are available, the seller presents documents at the desk of the advising
bank, and if there are no discrepancies, collects the specified payment amount. The
advising bank debits the issuing bank for the amount of the negotiation as well as any
charges, and the issuing bank makes payment and notifies the retailer of the amount of
the principal draw down and associated charges.


RTM also supports the exchange of letter of credit (LC) information with a bank in the
internationally recognized Society for Worldwide Interbank Financial
Telecommunications (SWIFT) format.


---

### **Customs Entry**


The Customs Entry module manages entries of merchandise for clearance through
customs while providing the information required for government documentation and
reporting. Government duties, taxes and fees are calculated in accordance with the
country of import. Entry information is prepared for transmission to the customs
broker for entry submission. The Customs Entry module provides the ability to track
the arrival of a shipment at customs, the customs clearance or associated delays,
customs exams, and entry and liquidation payment amounts.


When the charges and assessments are complete, the retailer can choose to allocate the
costs to the actual landed cost module. When the customs entry is complete, the
custom entry record needs to be confirmed. Non-merchandise invoices are created
automatically from confirmed customs entries in the Oracle Retail Invoice Matching
application.


---

### **RTM Integration with Other Applications**


This section describes RTM integration with other application.


---

### **Simplified RTM Configuration**


RTM is a simplified version of Oracle Retail product suite targeted at mid-tier retailers.
The simplified Oracle Retail Merchandising Operations Management applications
support basic retail processes needed by a mid-tier retailer. Advanced features are
turned-off through system parameters, with the goal to reduce implementation
complexity and enabling faster implementation and lower total cost of ownership.


If the system option parameter Simplified RTM indicator is enabled, then the
following RTM functionality is not available in the application:


           - Setting up RTM-specific master data such as freight type, freight size, and
standard carrier alpha codes (SCAC)


           - Letter of credit functionality


           - Transportation functionality


           - Customs entry functionality


           - Obligation maintenance


           - Actual landed costs


If both the Simplified RTM indicator and the Import indicator are enabled, then some
import-related functionality is available in RMS. With this set up, the retailer has the
option to set up the HTS data and use it in the purchase order process. The retailer can
also choose letter of credit as a payment option in the Purchase Order header level, but
all other related LC functionality is not available. It is assumed that the retailer is using
some other external system for LC processing.


If the import indicator is not enabled, then no RTM functionality is available in the
application. For additional information on setting the value in a System
Configurations table, see _Oracle Retail Merchandising System Installation Guide_ .
