# RMS Inventory & Stocktake - Operations, Batch Jobs & RIB Integration Guide

## Excerpts from Operations Guide 1 - Batch Job Designs

### **edidlprd (Download Sales and Stock On Hand From RMS to Suppliers)**

|Module Name|edidlprd.pc|
|---|---|
|**Description**|Download Sales and Stock On Hand From RMS to<br>Suppliers|
|**Functional Area**|Inventory|
|**Module Type**|Integration|
|**Module Technology**|ProC|
|**Catalog ID**|RMS47|
|**Runtime Parameters**||



---

### **invaprg (Purge Aged Inventory Adjustments)**

|Module Name|invaprg.pc|
|---|---|
|**Description**|Purge Aged Inventory Adjustments|
|**Functional Area**|Inventory|
|**Module Type**|Admin|
|**Module Technology**|ProC|
|**Catalog ID**|RMS251|
|**Runtime Parameters**||



**242** Oracle Retail Merchandising System


customer_order_purge.ksh (Purge Aged Customer Orders)


---

### **hstmthupd (Monthly Stock on Hand, Retail and Average Cost Values** **Update)**

|Module Name|hstmthupd.pc|
|---|---|
|**Description**|Monthly Stock on Hand, Retail and<br>Average Cost Values Update|
|**Functional Area**|Sales History|
|**Module Type**|Business Processing|
|**Module Technology**|ProC|
|**Catalog ID**|RMS158|
|**Runtime Parameters**||



---

### **hstwkupd (Weekly Stock on Hand and Retail Value Update for** **Item/Location)**

|on)|Col2|
|---|---|
|**Module Name**|hstwkupd.pc|
|**Description**|Weekly Stock on Hand and Retail Value<br>Update for Item/Location|
|**Functional Area**|Sales History|
|**Module Type**|Business Processing|
|**Module Technology**|ProC|
|**Catalog ID**|RMS159|
|**Runtime Parameters**||



---

### **stkvar (Update Stock On Hand Based on Stock Count Results)**

|Module Name|stkvar.pc|
|---|---|
|**Description**|Update Stock On Hand Based on Stock Count<br>Results|



**310** Oracle Retail Merchandising System


stkvar (Update Stock On Hand Based on Stock Count Results)

|Module Name|stkvar.pc|
|---|---|
|**Functional Area**|Stock Counts|
|**Module Type**|Business Processing|
|**Module Technology**|ProC|
|**Catalog ID**|RMS363|
|**Runtime Parameters**||



=========================================

## Excerpts from Operations Guide 2 - RIB Integration

### **Inventory Adjustment Subscription**


=========================================

## Excerpts from Operations Guide 3 - Technical Architecture

### **Inventory Adjustment Reason**


You can add, change, and delete reason codes used for inventory adjustments. In
addition to showing the reasons for inventory adjustments, the reason code specifies how
inventory adjustments affect stock on hand, unavailable inventory, or customer order
reserve inventory.


**Note:** The Reason Codes created in SIM must be mapped to
the RMS Inventory Adjustment Reason Codes.


**236** Oracle Retail Merchandising System


Diff ID


---

#### **Adding Inventory Adjustment Reason in SIM**


To add an Inventory Adjustment Reason in SIM:

**1.** Navigate and select **Admin**          - **Setup**          - **Inv. Adj. Reason** . >The Inventory Adjustment
Reason Maintenance window opens.


**2.** Click **Add** .


**3.** Enter ID: 123.


**4.** Description: Test Inventory Reason Code.


**5.** The UI must be check.


**6.** Select **Stock on Hand** from the Disposition dropdown list.


**7.** Click **Done** .


**8.** Validate the database in the INV_ADJUSTMENT_REASON table.


**9.** When the Inventory reason code is set up in SIM, it must be mapped to RMS.


---

#### **Mapping Inventory Adjustment Reason in RMS**


To map Inventory Adjustment Reasons in RMS:

**1.** Navigate to Foundation Data  Data Loading  Upload.

**2.** In Upload Data, select Inventory from the Template Type choice list.

**3.** Select Inventory Status and Adjustment Reasons from the Template list of values.
The Process Description field gets auto-populated.

**4.** Click on the Browse button and select the data file with the Inventory Adjustment
Reason values.


**5.** Click **Upload** to upload the values in the file into RMS. An information message will
appear to confirm that the upload was processed successfully. Click OK on the
information message.


**6.** Click **Done** to close the screen.


**Database Validation**


**Functionality** **SIM Table** **RMS Table**



Inventory Adjustment
Reason



INV_ADJUSTMENT_REAS
ON



INV_ADJ_REASON



---

#### **Inventory Adjustment**


Inventory adjustments that you enter in SIM are supplied to the merchandising system to
adjust stock levels and maintain perpetual inventory. Inventory adjustments increment
or decrement inventory levels such as Stock on Hand and unavailable inventory.

Each inventory adjustment contains a reason code that determines the disposition of the
inventory being adjusted. For example, inventory removed for repair is added to the
unavailable inventory and the Stock on Hand is decreased. When the items are returned
to inventory, unavailable inventory is decreased and the Stock on Hand is increased.

**1.** Log in to SIM with the store where you need to do the inventory adjustment.

**2.** Navigate and select Inv Mgmt > Inventory Adjustment.


**3.** Click **Create** .


**4.** Enter the item number in the Item field.


**5.** Update the UOM, Quantity, and Reason.


**6.** Click **Done** .


Enter UINs for an Inventory Adjustment

If an item requires a serial number type UIN, the Quantity field is disabled on the
Inventory Adjustment Detail window.


**244** Oracle Retail Merchandising System
