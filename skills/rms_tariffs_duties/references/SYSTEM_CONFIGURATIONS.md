# RMS Tariffs & Customs Duties - System Options & Implementation Configurations

### **Operational Insights**

Oracle Retail Operational Insights dashboards and reports provide pervasive business
intelligence. To provide a seamless user experience, they are designed to be embedded
within RMS application.

The RMS_OI_SYSTEM_OPTIONS table drives the configuration parameters for RMS
Operational Insights Dashboards and reports. Default values are populated by seed
data script during installation and can be changed later according to the customer
requirements. Values for these parameters can also be defined at Department level
using the RMS_ OI_DEPT_OPTIONS table. Department level values take precedence
over the system level configuration.

**Report Name** **System Option Definition** **Column Name**

Cumulative
Markon

Variance

Cumulative
Markon

Variance

**Department**
**Level?**

No

Yes

Variance
threshold

Minimum

Variance %

A count of
subclass/locations
with variance higher
that this number
would result in tile
turning Yellow or Red.

Configuration used to
compare the CMO %
of displayed month to
the department
budgeted intake %.

FA_CUM_
MARKON_VAR_
CRITICAL_CNT

FA_CUM_
MARKON_MIN_
VAR_PCT

Operational Insights

**Department**
**Report Name** **System Option Definition** **Column Name** **Level?**

Number of days
between beginning of
week and Estimated
Arrival Date to
determine if an order
qualifies as an OTB
Shift In issue.

Number of days
between Estimated
Arrival Date and OTB
End of Week date to
determine if an order
qualifies as an OTB
Shift Out issue.

B_NUM_DAYS_
BOW_EAD

B_NUM_DAYS_
EAD_OTB

B_NUM_DAYS_
NAD_EOW

No

No

No

Early/Late
Shipments

Early/Late
Shipments

Early/Late
Shipments

Early/Late
Shipments

Incomplete
Items

Incomplete
Items

Incomplete
Items

Incomplete
Items

Beginning of
Week to
Estimated
Arrival Date

Duration

Estimated
Arrival Date to
Open to Buy
Date Duration

Import
Attributes

Not After Date
to End of Week
Duration Number of days
between Not After
Date and End of Week

Duration.

Display OTB
for Reports

This configuration
allows the user to
decide whether OTB
should be shown in

reports.

B_OTB_IND No

Dimensions Possible Values:
Required, Optional
and No.

This will determine
whether the report
will show dimension
details.

HTS Possible Values:
Required, Optional
and No

This will determine
whether the report
will show item HTS
details.

Images Possible Values:
Required, Optional
and No

This will determine
whether the report
will show item image
details.

DS_SHOW_
INCOMP_ITEM_
DIMEN

DS_SHOW_
INCOMP_ITEM_
HTS

DS_SHOW_
INCOMP_ITEM_
IMAGES

DS_SHOW_
INCOMP_ITEM_
IMP_ATTR

Yes

Yes

Yes

Yes

Possible Values:
Required, Optional
and No

This will determine
whether the report
will show item import
details.

Oracle Retail Merchandising System **5-27**

Operational Insights

---

### **Operational Insights**

Oracle Retail Operational Insights dashboards and reports provide pervasive Business
Intelligence. To provide a seamless user experience, they are designed to be embedded
within Allocation application.

Operational Insights Dashboards and report does not require SSO for seamless
integration of dashboards and reports except when there is a contextual launch from
the report into a task flow of an external application. Such as in Allocations, there is a
link from the PO Arrivals report to open the order maintenance task flow in RMS.

For more information on security configuration and implementation, see the Oracle
Retail Merchandising Operations Management Security Guide.

The ALC_SYSTEM_OPTIONS_OI table drives the configuration parameters for the
Allocation Operational Insights dashboards reports and is present in the Allocation
application database schema. This following table describes the configuration
parameters for OI reports for Allocation:

**System Option** **Definition** **Column Name**

Need Calculation
Type

PO Allocation
Time threshold

The PO Arrival/Shipment Arrival report,
WH Inventory report and the Allocated to
Plan/Forecast have the ability to support
using either Forecast or Plan
data.Retailers should configure this
parameter based on the data that they
have available for their items and wish to
see in these reports.

Values - P (plan); F (forecast)

Number of days before the not after date
of the purchase order that the retailer
expects a quantity greater than the
'Percentage Allocated PO Threshold' to be
allocated.

NEED_CALC_TYPE

PO_ALC_TIME_
THRESHOLD

Oracle Retail Allocation **8-21**

Operational Insights

**System Option** **Definition** **Column Name**

Percentage
Allocated PO
Threshold

The percentage of the warehouse order
quantity against the given PO that is
expected to be allocated within the 'PO
Allocation Time Threshold' defined.

ALLOCATED_PO_
THRESHOLD

**8-22** Oracle® Retail Merchandising Implementation Guide
