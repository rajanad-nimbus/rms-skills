# RMS Import Management & Customs - Operations, Batch Jobs & RIB Integration Guide

### **batch_depchrgupd (Apply Pending Up-Charge Cost Component Changes** **to Departments)**

|ents)|Col2|
|---|---|
|**Module Name**|batch_depchrgupd.ksh|
|**Description**|Apply Pending Up-Charge Cost<br>Component Changes to Departments|
|**Functional Area**|Foundation Data|
|**Module Type**|Business Processing|
|**Module Technology**|ksh|
|**Catalog ID**|RMS186|
|**Runtime Parameters**||

---

### **hstbld (Weekly Sales History Rollup by Department, Class, and Subclass)**

|Module Name|hstbld.pc|
|---|---|
|**Description**|Weekly Sales History Rollup by<br>Department, Class, and Subclass|
|**Functional Area**|Sales History|
|**Module Type**|Business Processing|
|**Module Technology**|ProC|
|**Catalog ID**|RMS239|
|**Runtime Parameters**||

---

### **hstbldmth (Monthly Sales History Rollup By Department, Class And** **Subclass)**

|Module Name|hstbldmth.pc|
|---|---|
|**Description**|Monthly Sales History Rollup by<br>Department, Class, and Subclass|
|**Functional Area**|Sales History|
|**Module Type**|Business Processing|
|**Module Technology**|ProC|
|**Catalog ID**|RMS241|

---

### **Simplified RTM Configuration**

Simplified RTM is a simplified version of the Oracle Retail product suite targeted at midtier retailers. The Simplified Oracle Retail Merchandising Operations Management
applications support basic retail processes needed by a mid-tier retailer. Advanced
features are turned-off through system parameters, with the goal to reduce
implementation complexity and enabling faster implementation and lower total cost of
ownership.

The Simplified RTM Indicator is set in the system_options table during the installation of
RMS. If the system_option parameter is enabled, then the following RTM functionality is
not available in the application:

        - Setting up RTM specific Freight Type, Freight Size and Standard Carrier Alpha
Codes (SCAC)

        - Letter of Credit functionality

        - Transportation functionality

        - Customs Entry functionality

        - Obligation Maintenance

        - Actual Landed Costs

Operations Guide, Volume 1 - Batch Overviews and Designs **317**

Batch Design Summary

If both the Simplified RTM indicator and the Import indicator are enabled, then some
import related functionality is available in RMS. With this setup, the retailer has the
option to setup HTS data for classification of merchandise and for the calculation of
duties, fee and taxes. The retailer can also choose Letter of Credit as a payment option at
the Purchase Order header level, but all other related LC functionality is not available. It
is assumed that the retailer is using some other external system for LC processing.

If the import indicator is not enabled then no RTM functionality is available in the
application. See the RMS Installation Guide for additional information on setting the
value of the system_options table.

---

#### **Simplified RTM Batch Program Notes**

When Simplified RTM is enabled (RTM Simplified Indicator is enabled) then the
following batch programs need to be turned off from the integrated batch schedule.

        - lcadnld

        - lcupld

        - lcup798

        - lcmdnld

        - cednld

        - tranupld

The following Perl scripts should also be turned off from the integrated batch schedule

        - lcmt700

        - lcmt707

        - lcmt730

        - lcmt798

When both the RTM simplified indicator and import indicator is enabled then the
following batch program needs to be turned on in the integrated batch schedule.

        - htsupld

=========================================

#### **Department Search**

**Business Overview**

This service retrieves departments with ID or name matching search string.

**Service Type**

Get

ReSTful Web Service Implementation for RMS **305**

RMS Common Services

**ReST URL**

/Common/departmentSearch?searchString={searchString}&pageSize={pageSize}&page
Number={pageNumber}

**Input Parameters**

**Parameter Name** **Required** **Description** **Valid values**

searchString Yes search string for department Id or Name

PageSize No Maximum number of records to retrieve per

page

PageNumber No Result page to retrieve

**Output**

        - Department

        - Name

        - Total Record Count

        - Next Page URL

        - Previous Page URL

**Table Impact**

**TABLE** **SELECT** **INSERT** **UPDATE** **DELETE**

V_DEPS Yes No No No

---

#### **Department Load**

**Business Overview**

This service retrieves departments’ name of input IDs.

**Service Type**

Get

**ReST URL**

/Common/departmentLoad?departments={departments}

**Input Parameters**

**Parameter Name** **Required** **Description** **Valid values**

departments Yes Comma Seperated values for
Departments

**Output**

        - Department

        - Name

**306** Oracle Retail Merchandising System

Create Inventory Transfer Services

**Table Impact**

**TABLE** **SELECT** **INSERT** **UPDATE** **DELETE**

V_DEPS Yes No No No
