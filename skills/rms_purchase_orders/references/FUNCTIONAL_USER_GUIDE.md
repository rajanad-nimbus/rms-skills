# RMS Purchase Orders - Functional User Guide Workflows & Reports

## Excerpts from Functional User Guide (Workflows & Reports)

#### **Buyer Dashboard**


This dashboard is intended to be used by buyers in a retail organization. A Buyer
generally focuses on managing sales and margin.


This dashboard has following filters:


          - Basic


**–**
Department*


**–** Class


**–** Subclass


**–**
Supplier Site


          - Advanced


**–** Store


**–** Brand


**–**
Country of Sourcing


**–** Order Context


**Note:**


               - The fields marked with an asterisk (*) are mandatory.


               - The fields marked with two asterisk (**) denotes at least one field
is mandatory.


**Viewing Buyer Dashboard**
To view the buyer dashboard:


**1.** From the Tasks menu select **Reports**           - **Buyer Dashboard** . The Buyer Dashboard
window appears.


**2.** The following sections includes the Buyer Dashboard reports.


**Sales Report**
This report shows the sales and margin information of the top ten items by sales or
margin for the user specified filter criteria. You can choose to see this information for
today or week to date days. It gives you the visibility to value and unit sales of items,
proportion of top ten items, proportion of top ten items' sales and margin to total sales
and margin of chosen filter criteria. For every item it shows various other information
such as VPN, Cost and Retail and image in the information pane contextually. To
determine top ten items by sales/margin, the level of item considered is item
parent/diff aggregate wherever applicable otherwise level 1 (transaction item). For a
parent item with diff aggregation defined, sales/margin data of applicable diffs would
be summed up accordingly and displayed. All monetary values shown in the report
are in the primary currency of the retailer. There are no direct actions from the report.


Pre-defined Operational Insights Reports **2-35**


Predefined OI Reports for Oracle Retail Merchandising System (RMS)


_**Figure 2–49**_ _**Sales Report - Buyer Dashboard**_


**Early/Late Shipments Report**
This report shows the orders with shipments that have potential issues, such as ASN
not received, Late/Early Shipments, OTB Date breach window for a particular
department, class, and subclass over the next 8 weeks. OTB Date Breach happens on
orders where the shipment Estimated Arrival Date is either too close to OTB date or
either beginning or end of week or already breached the OTB date. It can have two
scenarios - one for when the date needs to move back (OTB Shift In) and one where it
needs to move out (OTB Shift Out). Orders where Estimated Arrival Date is before
‘Not Before Date’ are classified as Early Shipment and if the Estimated Arrival Date of
an order is after ‘Not After Date’, it is classified as Late Shipment.


With the help of this report, the buyer can make a preemptive and informed decision
to update the Not After Date, Not Before Date, and OTB EOW dates for the order.


_**Figure 2–50**_ _**Early/Late Shipments Report - Buyer Dashboard**_


**Open to Buy Report**
This report summarizes the open to buy position for a particular department, class, or
subclass over the next 8 weeks. It is intended to give a buyer visibility to where they
are over and under bought for their area, and will work in conjunction with the
Early/Late Shipments report to help a buyer understand how late or early shipments
may impact their OTB. The bars in the chart give visibility to the value of orders for
the department, class, subclass, and date that have been received and approved. The
line in the Gantt chart represents the budget.


**2-36** Oracle Retail Operational Insights User Guide


Predefined OI Reports for Oracle Retail Merchandising System (RMS)


_**Figure 2–51**_ _**Open to Buy Report - Buyer Dashboard**_


**Orders Pending Approval Report**
This report shows the orders in 'Submitted' or 'Submitted and 'Worksheet' status,
based on the system level parameters that need to be reviewed by the buyer for
approval or rejection. The orders shown in the table are limited by total cost or retail
values that are inside the configurable user's threshold, as defined in RMS.


You can approve or reject one or more orders from the dashboard or launch In-context
to see the details in the order. Rejecting an order will bring the order back to
'Worksheet' status. You have the option to add/edit comments while rejecting orders
in the 'Reject Order' popup. This popup appears only when rejecting a single order. In
case multiple orders are being rejected together, that will be done without a popup.
Worksheet orders can be approved using the Approve action on the report.


The orders are listed as a tabular report with information related to the order. This
includes order number, supplier, NBD, NAD, Total Order Cost/Retail, Created by, and
order comments (optional column).


Only users with the 'Approve Purchase Orders' privilege are able to approve an order.
For rejecting an order, the 'Maintain Purchase Orders' privilege is required. The Order
Number is hyperlinked to navigate to the Order Details window in edit mode if the
user has the maintain privilege, else view mode.


_**Figure 2–52**_ _**Orders Pending Approval Report**_


---

#### **Inbound Purchase Orders Report**


The Inbound Purchase Orders report shows details about inbound purchase order
shipments for a specified time range and location. The warehouse can use this report
along with the Open PO report to aid in creating schedules.


---

#### **Viewing Inbound Purchase Orders Report**


To view the inbound purchase orders report:


**1.** From the Tasks menu, select **Reports**           - **Inventory**           - **Inbound Purchase Orders** .
The Inbound Purchase Orders Report window appears.


_**Figure 3–14**_ _**Inbound Purchase Orders Report**_
