# RMS Item Master & Product Attributes - System Options & Implementation Configurations

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

---

#### **Diff Type**

System Default name: RPM_SYSTEM_OPTIONS_DEF.DEF_PRICE_CHANGE_DIFF_
TYPE

This field holds a value for the desired default item level in the pricing event dialogs.

Valid values and default value are dependent on the Diff Values set up in RMS.

=========================================

### **Diff ID**

To create a Diff ID in RMS, navigate and select **Items > Diffs > Diff Group/Diff IDs** .

RIB Validation: Validate the details in RIB.

        - Diffs Publisher in RIB-RMS

        - Diffs Subscriber in RIB-SIM

When the Diff ID is available in both publisher and subscriber, it will be available in SIM.
