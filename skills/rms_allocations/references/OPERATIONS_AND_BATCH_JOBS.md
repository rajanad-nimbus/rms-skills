# RMS Store Allocations - Operations, Batch Jobs & RIB Integration Guide

### **batch_alloctsfupd (Update Allocation and Transfer Based on Changes to** **Up-Charges)**

|s)|Col2|
|---|---|
|**Module Name**|batch_alloctsfupd.ksh|
|**Description**|Update Allocation and Transfer Based on<br>Changes to Up-Charges|
|**Functional Area**|Foundation Data|
|**Module Type**|Business Processing|
|**Module Technology**|ksh|
|**Catalog ID**|RMS184|
|**Runtime Parameters**||

---

## **Transfers, Allocation, and RTV**

Transfers, Allocations and Return to Vendor (RTV) transactions move inventory among
locations. The majority of processing associated with these transactions occurs through
the user interface and near real time RIB integration with Oracle Retail Store Inventory
Management (SIM) and Oracle Retail Warehouse Management System (RWMS).
However, RMS does use a variety of batch programs to maintain the data related to these
transactions.

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

### **allocbt (Create Book Transfers for Allocations Between Warehouses in the**

|ical Warehouse)|Col2|
|---|---|
|**Module Name**|allocbt.ksh|
|**Description**|Create Book Transfers for Allocations Between<br>Warehouses in the Same Physical Warehouse|
|**Functional Area**|Inventory Movement|
|**Module Type**|Business Processing|
|**Module Technology**|ksh|
|**Catalog ID**|RMS175|
|**Runtime Parameters**||

**262** Oracle Retail Merchandising System

allocbt (Create Book Transfers for Allocations Between Warehouses in the Same Physical Warehouse)

---

### **rmse_aip_alloc_in_well (Extract of Allocations in the Well Quantities for** **AIP)**

|Module Name|rmse_aip_alloc_in_well.ksh|
|---|---|
|**Description**|Extract of Allocations in the Well<br>Quantities for AIP|
|**Functional Area**|Integration - AIP|
|**Module Type**|Integration|
|**Module Technology**|Ksh|
|**Catalog ID**|RMS20|
|**Runtime Parameters**||

**508** Oracle Retail Merchandising System

rmse_aip_alloc_in_well (Extract of Allocations in the Well Quantities for AIP)

=========================================

### **Allocations Publication API**

---

### **Allocation Subscription API**
