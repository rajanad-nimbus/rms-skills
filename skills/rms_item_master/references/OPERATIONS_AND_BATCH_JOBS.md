# RMS Item Master & Product Attributes - Operations, Batch Jobs & RIB Integration Guide

## Excerpts from Operations Guide 1 - Batch Job Designs

### **supcnstr (Scale Purchase Orders Based on Supplier Constraints)**

|Module Name|supcnstr.pc|
|---|---|
|**Description**|Scale Purchase Orders Based on<br>Supplier Constraints|
|**Functional Area**|Purchase Orders|
|**Module Type**|Business Processing|
|**Module Technology**|ProC|
|**Catalog ID**|RMS368|



---

### **hstbld_diff (Weekly Sales History Rollup by Diff)**

|Module Name|hstbld_diff.pc|
|---|---|
|**Description**|Weekly Sales History Rollup by Diff|
|**Functional Area**|Sales History|
|**Module Type**|Business Processing|
|**Module Technology**|ProC|
|**Catalog ID**|RMS240|



---

### **hstbldmth_diff (Monthly Sales History Rollup By Diffs)**

|Module Name|hstbldmth_diff.pc|
|---|---|
|**Description**|Monthly Sales History Rollup by Diffs|
|**Functional Area**|Sales History|
|**Module Type**|Business Processing|
|**Module Technology**|ProC|
|**Catalog ID**|RMS242|



---

### **hstprg_diff (Purge Aged Sales History by Diff)**

|Module Name|hstprg_diff.pc|
|---|---|
|**Description**|Purge Aged Sales History by Diff|
|**Functional Area**|Sales History|
|**Module Type**|Admin|
|**Module Technology**|ProC|
|**Catalog ID**|RMS245|
|**Runtime Parameters**||



---

### **export_diffs.ksh (Extraction of differentiators data defined for a** **differentiator type)**

|or type)|Col2|
|---|---|
|Module|export_diffs.ksh|
|Description|Extraction of differentiator’s data defined for a<br>differentiator type.|
|Functional Area|Foundation|
|Module Type|Integration|
|Module Technology|ksh|
|Catalog ID|256|
|Runtime Parameters|Database connection and mode of extract (‘full’<br>or ‘delta’)|



=========================================

## Excerpts from Operations Guide 2 - RIB Integration

### **Differentiator Groups Publication API**


---

### **Differentiator ID Publication API**


---

### **UDA Publication API**


---

### **Diff Group Subscription API**


---

### **Diff ID Subscription API**


=========================================

## Excerpts from Operations Guide 3 - Technical Architecture

### **Diff ID**

To create a Diff ID in RMS, navigate and select **Items > Diffs > Diff Group/Diff IDs** .


RIB Validation: Validate the details in RIB.


        - Diffs Publisher in RIB-RMS


        - Diffs Subscriber in RIB-SIM


When the Diff ID is available in both publisher and subscriber, it will be available in SIM.
