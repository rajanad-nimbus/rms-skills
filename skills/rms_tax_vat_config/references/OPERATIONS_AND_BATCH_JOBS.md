# RMS Tax & VAT Configuration - Operations, Batch Jobs & RIB Integration Guide

### **vatdlxpl (Mass VAT Updates for Items/Locations)**

|Module Name|vatdlxpl.pc|
|---|---|
|**Description**|Mass VAT Updates for Items/Locations|
|**Functional Area**|Item Maintenance|
|**Module Type**|Business Processing|
|**Module Technology**|ProC|
|**Catalog ID**|RMS384|
|**Runtime Parameters**||

---

### **itmrsrvpurge (Purging expired item reservation records)**

|Module Name|itmrsrvpurge.ksh|
|---|---|
|**Description**|Main Processing of executing the staged pricing<br>events|
|**Functional Area**|Price change|
|**Module Type**|Business Processing|
|**Module Technology**|ksh|
|**Catalog ID**|RMS494|
|**Runtime Parameters**||

---

### **batch_rplapprvgtax.ksh (Update Replenishment Order Taxes)**

|Module Name|batch_rplapprvgtax.ksh|
|---|---|
|**Description**|Update Replenishment Order Taxes|
|**Functional Area**|Replenishment|
|**Module Type**|Business Processing|
|**Module Technology**|ksh|
|**Catalog ID**|RMS194|
|**Runtime Parameters**||

---

### **ordinvupld (Upload and Process Inventory Reservations from ReSA)**

|Module Name|ordinvupld.pc|
|---|---|
|**Description**|Upload and Process Inventory Reservations from<br>ReSA|
|**Functional Area**|RMS|
|**Module Type**|Integration|
|**Module Technology**|ProC|
|**Catalog ID**|RMS113|
|**Runtime Parameters**||

---

### **export_itemvat.ksh (Extraction of vat item data)**

|Module|export_itemvat.ksh|
|---|---|
|**Description**|Extraction of vat item data.|
|**Functional Area**|Foundation|
|**Module Type**|Integration|
|**Module Technology**|ksh|
|**Catalog ID**|RMS259|
|**Runtime Parameters**|Database connection and mode of extract (‘full’<br>or ‘delta’).<br>Threading indicator (Y/N).<br>With ‘full’ mode optional parameter (‘store’) for<br>single store file.|

**474** Oracle Retail Merchandising System

export_itemvat.ksh (Extraction of vat item data)

=========================================

### **Item Number Reservation Service API**
