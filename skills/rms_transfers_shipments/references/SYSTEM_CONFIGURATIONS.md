# RMS Transfers & Shipments - System Options & Implementation Configurations

## Excerpts from Operations Guide 3 (System Configurations)

#### **Transfers**



Transactions


**Receiving the Order in SIM**

The Purchase Order is received with different combinations as given below:

**1.** Receive with Exact Quantity.

**2.** Under Receive Quantity.


**3.** Over Receive Quantity.

**4.** Receive with Damage Quantity.


**5.** PO On The FLY – In this scenario, the Purchase Order is created in SIM and not RMS.
This can be done based on the item and supplier’s detail, when we have the details in
SIM a PO is displayed.


Transfer implies to movement of goods from one location to another. Accordingly to
SIM, transfer is either store to store transfer or warehouse to store transfer. Transfers can
be generated in SIM also.


**Store To Store Transfer**

The Store to Store transfer is created for the movement of goods from Store A to Store B.


**RIB Validation:**

- Verify the Stock-Order/Transfer in Transfer_Publisher in RIB-RMS.

- Verify the Stock-Order/Transfer in StockOrder_Subscriber in RIB-SIM.


**Transfer Receiving**

To receive a transfer, select the receiving store in the SIM login form. For dispatching
transfer from store to store:


**1.** Log in to the correct **FROM** store.

**2.** Navigate and select > **Shipping** / **Receiving** - **Transfers** .

**3.** Double-click the record and update the quantity column with the unit which needs
to be transferred. The transfer functionality supports both overage and underage.

**4.** Click **Dispatch** and accept the warnings.

RIB Validation: When the dispatch is completed, a message is sent to RMS.


  - ASNOUT_PUBLISHER in RIB SIM


  - ASNOUT_SUBSCRIBER in RIB RMS


To receive the transfer from store to store:


**5.** Log in to the correct **TO** store.

**6.** Navigate and select **Shipping** / **Receiving** - **Transfers** .

**7.** Double-click the record and updates the quantity column with the unit which needs
to be transferred. The transfer functionality supports overage and underage.

**8.** Click **Receive All** and accept the warning.

**RIB Validation** : When the receiving is done, a message is sent to RMS. Verify the order
number in:


- Receiving_Publisher in RIB-SIM

- Receiving _Subscriber in RIB-RMS


Integrating RMS with Store Inventory Management **239**


Transactions


**RMS Database Validation**

        - Stock on Hand gets updated in ITEM_LOC_SOH table in RMS. Received quantity is
deducted from FROM store and added in TO store.


        - Tran code 37 and 38 is posted in TRAN_DATA table.


**Warehouse To Store Transfer**

In this case of transfer, the goods are moved from warehouse to another store. The user
must login to the receiving store to receive the transfer. Before receiving in SIM, the
transfer must to be shipped from the corresponding warehouse.


To receive the transfer from Warehouse to Store:


**1.** Log in to the correct **TO** store.

**2.** Navigate and select Shipping/Receiving > Warehouse Delivery.


**3.** Double-click the container ID which has received from Warehouse.


**4.** Edit quantities or record damages.

**5.** Click **Receive** . The status changes to Received.

**6.** Click **Confirm** and accept the warning message.

**RIB Validation:** When the transfer is received, a message is sent to RMS. Verify the order
number in:


        - Receiving_Publisher in RIB-SIM

        - Receiving _Subscriber in RIB-RMS


**RMS Database Validation:**

        - Stock on Hand gets updated in ITEM_LOC_SOH table in RMS. Received quantity is
deducted from FROM Warehouse and added in TO store.


        - Tran code 30 and 32 is posted in TRAN_DATA table.


**SIM Database Validation:**

        - STORE_ITEM_STOCK is increased in SOH for the store.


**Transfer On The Fly**

You can create the transfers from one store to another. No other transfers are possible.

**1.** Navigate and select Shipping/ **Receiving**          - **Transfer**          - **Create Transfer** .

**2.** Select **Transfer To store** from the dropdown.

**3.** Enter the item and shipped quantity.

**4.** Click **BOL** and select the pickup date.

**5.** Click **Dispatch** and accept the warning message.


To receive the transfer on the FLY:


**6.** The user must log in to the correct TO store.

**7.** Navigate and select Shipping/Receiving > Transfers.

**8.** Double-click on the record and updates the quantity column with the units which
needs to be transferred. The transfer functionality supports overage and underage.

**9.** Click **Receive All** and accept the warning in the pop up.

**10.** Click **Done** to save changes and confirm the transfer.

**RIB Validation** : When receiving is done, message is sent to RMS. Verify the order
number in:


        - Receiving_Publisher in RIB-SIM

        - Receiving _Subscriber in RIB-RMS


**240** Oracle Retail Merchandising System


Transactions


**RMS Database Validation**

        - Stock on Hand is updated in ITEM_LOC_SOH table in RMS. The received quantity is
deducted from FROM store and added in TO store.


        - Tran code 30, 32 and 22 is posted in TRAN_DATA table.


**Note:**


          - The Reason Codes created in SIM must be mapped to the RMS
Inventory Adjustment Reason Codes.


          - If the external ID is a number and the user is external it implies
that the transfer is generated in RMS.


          - If a transfer request is initiated in SIM this message is not
published in RMS or any other integrated application.


          - A transfer handles damaged quantities which in turn are put in
the non-sellable bucket in RMS.


          - Negative receiving though cannot be done nor can be
transferred.


          - We can also receive multiple times against the same transfer for
the expected quantity. This action will be allowed as long as the
transfer is open and not restricted by expected quantity.


          - While transferring we can also add items which were not part of
the original transfer but we cannot remove the original item
while we transfer as long as we have stock on hand.


          - Non ranged items can also be part of the transfer. These are
items which are not ranged to that particular location but it is
ranged by raising the transfer.
