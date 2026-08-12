# RMS Tariffs & Customs Duties - Functional User Guide Workflows & Reports

## Excerpts from Functional User Guide (Workflows & Reports)

##### **Oracle® Retail Operational Insights**

User Guide


Release 16.0


**E80752-01**


December 2016


Oracle® Retail Operational Insights User Guide, Release 16.0


E80752-01


Copyright © 2016, Oracle and/or its affiliates. All rights reserved.


Primary Author: Seema Kamat


Contributing Author: Nathan Young and Ken Ramoska


This software and related documentation are provided under a license agreement containing restrictions on
use and disclosure and are protected by intellectual property laws. Except as expressly permitted in your
license agreement or allowed by law, you may not use, copy, reproduce, translate, broadcast, modify, license,
transmit, distribute, exhibit, perform, publish, or display any part, in any form, or by any means. Reverse
engineering, disassembly, or decompilation of this software, unless required by law for interoperability, is
prohibited.


The information contained herein is subject to change without notice and is not warranted to be error-free. If
you find any errors, please report them to us in writing.


If this is software or related documentation that is delivered to the U.S. Government or anyone licensing it
on behalf of the U.S. Government, then the following notice is applicable:


U.S. GOVERNMENT END USERS: Oracle programs, including any operating system, integrated software,
any programs installed on the hardware, and/or documentation, delivered to U.S. Government end users
are "commercial computer software" pursuant to the applicable Federal Acquisition Regulation and
agency-specific supplemental regulations. As such, use, duplication, disclosure, modification, and
adaptation of the programs, including any operating system, integrated software, any programs installed on
the hardware, and/or documentation, shall be subject to license terms and license restrictions applicable to
the programs. No other rights are granted to the U.S. Government.


This software or hardware is developed for general use in a variety of information management
applications. It is not developed or intended for use in any inherently dangerous applications, including
applications that may create a risk of personal injury. If you use this software or hardware in dangerous
applications, then you shall be responsible to take all appropriate fail-safe, backup, redundancy, and other
measures to ensure its safe use. Oracle Corporation and its affiliates disclaim any liability for any damages
caused by use of this software or hardware in dangerous applications.


Oracle and Java are registered trademarks of Oracle and/or its affiliates. Other names may be trademarks of
their respective owners.


Intel and Intel Xeon are trademarks or registered trademarks of Intel Corporation. All SPARC trademarks
are used under license and are trademarks or registered trademarks of SPARC International, Inc. AMD,
Opteron, the AMD logo, and the AMD Opteron logo are trademarks or registered trademarks of Advanced
Micro Devices. UNIX is a registered trademark of The Open Group.


This software or hardware and documentation may provide access to or information about content,
products, and services from third parties. Oracle Corporation and its affiliates are not responsible for and
expressly disclaim all warranties of any kind with respect to third-party content, products, and services
unless otherwise set forth in an applicable agreement between you and Oracle. Oracle Corporation and its
affiliates will not be responsible for any loss, costs, or damages incurred due to your access to or use of
third-party content, products, or services, except as set forth in an applicable agreement between you and
Oracle.


**Value-Added Reseller (VAR) Language**


**Oracle Retail VAR Applications**


The following restrictions and provisions only apply to the programs referred to in this section and licensed
to you. You acknowledge that the programs may contain third party software (VAR applications) licensed to
Oracle. Depending upon your product and its version number, the VAR applications may include:


(i) the **MicroStrategy** Components developed and licensed by MicroStrategy Services Corporation
(MicroStrategy) of McLean, Virginia to Oracle and imbedded in the MicroStrategy for Oracle Retail Data
Warehouse and MicroStrategy for Oracle Retail Planning & Optimization applications.


(ii) the **Wavelink** component developed and licensed by Wavelink Corporation (Wavelink) of Kirkland,
Washington, to Oracle and imbedded in Oracle Retail Mobile Store Inventory Management.


(iii) the software component known as **Access Via™** licensed by Access Via of Seattle, Washington, and
imbedded in Oracle Retail Signs and Oracle Retail Labels and Tags.


(iv) the software component known as **Adobe Flex™** licensed by Adobe Systems Incorporated of San Jose,
California, and imbedded in Oracle Retail Promotion Planning & Optimization application.


You acknowledge and confirm that Oracle grants you use of only the object code of the VAR Applications.
Oracle will not deliver source code to the VAR Applications to you. Notwithstanding any other term or
condition of the agreement and this ordering document, you shall not cause or permit alteration of any VAR


Applications. For purposes of this section, "alteration" refers to all alterations, translations, upgrades,
enhancements, customizations or modifications of all or any portion of the VAR Applications including all
reconfigurations, reassembly or reverse assembly, re-engineering or reverse engineering and recompilations
or reverse compilations of the VAR Applications or any derivatives of the VAR Applications. You
acknowledge that it shall be a breach of the agreement to utilize the relationship, and/or confidential
information of the VAR Applications for purposes of competitive discovery.


The VAR Applications contain trade secrets of Oracle and Oracle's licensors and Customer shall not attempt,
cause, or permit the alteration, decompilation, reverse engineering, disassembly or other reduction of the
VAR Applications to a human perceivable form. Oracle reserves the right to replace, with functional
equivalent software, any of the VAR Applications in future releases of the applicable program.



---

## **Introducing Oracle Retail Operational** **Insights**


This chapter introduces the role of operational business intelligence in a retail
environment. It briefly describes the implementation of Operational Insights (OI)
reports for Oracle Retail Sales Audit (ReSA), Oracle Retail Allocation and Oracle Retail
Invoice Matching (ReIM), Oracle Retail Merchandising System (RMS) through Oracle
Application Development Framework (ADF).


---

### **Operational Insights Overview**


Operational Insights embeds business intelligence into the fabric of the business,
intertwining it with operational processes and applications that drive thousands of
daily decisions. In essence, Operational Insights merges analytical and operational
processes into a unified whole. Operational Insights delivers the right information to
the right people at the right time so that they can take action. This not only streamlines
processes and reduces costs, but also improves service and gives organizations a
competitive advantage in the marketplace.


Operational Insights provides a combination of dashboard and in-context reports in
the Merchandising ADF applications. Dashboard reports are role based reports
highlighting the area of focus for a user and in-context reports shows on selected
screens and provides further information to the task flow or entity on the screen.
Major benefits of OI to the user are:


          - Manage by exception


**–**
Dashboards highlight the areas of focus for a user


**–**
Help to prioritize work for the day


          - Increase user efficiency


**–** Resolve issues from the dashboard or


**–**
Take the user to the specific transaction for resolution


          - Contextual decision-making support


**–**
Contextual BI gives additional information to aid in decision-making


**–**
Notify a user of a key activity being completed


          - Configurability


**–**
Dashboards created for retailer-specific roles using Oracle Retail reports, or
custom reports


**–**
Flexibility to use data from multiple sources


Introducing Oracle Retail Operational Insights **1-1**


User Roles and Responsibilities


**–**
Dashboard filters allow users to configure their view


---

### **Operational Insights Language Options**


The reports are displayed in the same language as set up in the integrated
merchandise applications user preferences page. To set your preferred language access
the user preferences page by clicking user name > Preferences at the top of the home
page of the application.


The following languages are supported by Operational Insights:


          - Chinese (Simplified)


          - Chinese (Traditional)


          - Croatian


          - Dutch


          - English


          - French


          - German


          - Greek


          - Hungarian


          - Italian


          - Japanese


          - Korean


          - Polish


          - Portuguese (Brazilian)


          - Russian


          - Spanish


          - Swedish


          - Turkish


**1-2** Oracle Retail Operational Insights User Guide


OI Accessibility Options


---

## **Pre-defined Operational Insights Reports**


Predefined reports are packaged with Operational Insights and are available for ReSA,
Allocation, ReIM, and RMS as dashboard and In-context BI reports.
