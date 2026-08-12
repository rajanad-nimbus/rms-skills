# RMS Stock Ledger & Financial Accounting - System Options & Implementation Configurations

#### **Stock Ledger**

The stock ledger in RMS records the financial results of the merchandising processes
such as buying, selling, price changes, and transfers. All of these transactions are
recorded in the RMS stock ledger and rolled up to the subclass/location level for days,
weeks, and months, depending on calendar settings. The aggregate levels in the stock
ledger are used to measure inventory amounts and merchandise profitability. The
stock ledger is mainly used for reporting purposes; however, there is some online
visibility as well.

The stock ledger supports multiple currencies. All transaction-level information is
stored in the local currency of the store or warehouse where the transaction occurred.
As transaction-level information is rolled up to the aggregated levels in the stock
ledger, records are kept in local currency and converted to primary currency. This
allows corporate reporting to be performed in the primary currency of the company,
while still providing visibility by location to the profitability in the local currency.

The stock ledger supports both the retail and cost methods of accounting. The cost
method can use standard cost or average cost, depending on how the system is
configured. The stock ledger supports both the retail (4-5-4) and the normal
(Gregorian) calendar. If the retail calendar is used, data is maintained by the 4-5-4
month and the week. If the normal calendar is used, data is maintained only by the
Gregorian month. Data can also be maintained daily using the retail (4-5-4) or normal
(Gregorian) calendar.

RMS supports multiple sets of books. Clients that use multiple sets of books assign
RMS locations to a particular set of books defined in an external financial system.
Changes to the stock ledger affect the set of books with which a particular transaction
is associated.

RMS Integration with Other Applications

=========================================

#### **Oracle Application Development Framework (ADF)**

The Oracle Application Development Framework (ADF) supports organizations in
building cutting-edge rich enterprise business applications that can be customized and
personalized in all dimensions. Customizations are global changes, visible to all users
that are performed by an administrator. Personalization is user-made changes that are
only visible to the person making the change. ADF is based on the Java Enterprise
Edition platform.

**Model View Controller (MVC) Architectural Pattern**

Applications built using ADF follow a Model-View-Controller (MVC) architectural
pattern. The goal of the MVC pattern is to clearly separate the application’s functionality
into a set of cooperating components.

ADF provide a set of components that realize the goals of each part of MVC pattern.

        - Model is realized by the ADF Bindings Layer

        - Controller is realized by the ADF Controller Layer

        - View is realized by the ADF Faces Layer

Technical Architecture **3**

Overview

        - ADF Business components and other backend components that sit below the model
layer are called Business Services.

**ADF Security**

        - Standards-based (Oracle Platform Security Services (OPSS)) security framework with
default roles and permissions.

        - Tools to generate the file-based identity store (for both Oracle Internet Directory and
AD) based on the framework.

        - Tools to migrate the file-based security store in to the database for QA and
production environments.

        - Reference implementation for clients to manage the security based on their business
needs.

        - OPSS-based batch security framework (RAF).

        - Tools/documentation to implement centralized logout in SSO (Oracle Access
Management (OAM)) environments.

**ADF View (ADFv)**

The View layer provides the user interface to the application. The view layer uses HTML,
rich Java components or XML and its variations to render the user interface. JSF based
tag libraries are used for displaying the UI.

**ADF Controller (ADFc)**

The ADF Controller layer controls the application's flow. Web based applications are
composed of multiple web pages with dynamic content. The controller layer manages the
flow between these pages. Different models can be used when building this later. The
most prominent architecture for Java-based web applications relies on a servlet that acts
as the controller. The Apache Jakarta Struts controller, an open source framework
controller, is the de facto standard for Java-based web systems. Oracle ADF uses the
Struts controller to manage the flow of web applications.

**ADF Business Components (ADFbc)**

The business service layer manages the interaction with a data persistence layer. It
provides services as data persistence, object/relational mapping, transaction
management and business logic execution.

Business Components easily map the database object and extend it with business logic,
validation and so on.

The idea behind Business Components is to abstract the data layer from the view layer.
This is a key concept in the MVC pattern. Business Components will expose the interface
to the view layer by using an application module that contains the View Object. Those
view objects contain a specific usage of the data layer.

ADF Business Components implements the business service through the following set of
cooperating components:

        - Entity object – An entity object represents a row in a database table and simplifies
modifying its data by handling all data manipulation language (DML) operations for
you. It can encapsulate business logic for the row to ensure that your business rules
are consistently enforced. You associate an entity object with others to reflect
relationships in the underlying database schema to create a layer of business domain
objects to reuse in multiple applications.

**4** Oracle Retail Merchandising System

Overview

        - View object – A view object represents an SQL query. You use the full power of the
familiar SQL language to join, filter, sort, and aggregate data into the exact shape
required by the end-user task. This includes the ability to link a view object with
others to create master-detail hierarchies of any complexity. When end users modify
data in the user interface, view objects collaborate with entity objects to consistently
validate and save the changes.

        - Application module – An application module is the transactional component that UI
clients use to work with application data. It defines an updatable data model and
top-level procedures and functions (called service methods) related to a logical unit
of work related to an end-user task.

**ADF Model (ADFm)**

This component acts as the connector between the view and business logic layers.

The Model layer connects the Business Services to the objects that use them in the other
layers. Oracle ADF provides a Model layer implementation that sits on top of Business
Services, providing a single interface that can be used to access any type of Business
Services.

Developers get the same development experience when binding any type of Business
Service layer implementation to the view and Controller layers. The Model layer in
Oracle ADF served as the basis for JSR 227, A Standard Data binding & Data Access
Facility for J2EE.

**Oracle Metadata Services (MDS)**

The ability of an application to adapt to changes is a necessity that needs to be considered
in the application design and that should drive the selection of the development platform
and architecture. Flexible business applications must be able to adapt to organizational
changes, different end user preferences and changes in the supported business are
required.

MDS is the customization and personalization framework integral to Oracle Fusion
Middleware and a key differentiator of the Oracle development platform. MDS provides
a repository for storing metadata for applications, such as customizations and persisted
personalization files and configurations.

Retail Applications allow the following through MDS:

        - Personalization of saved searches through MDS.

        - Implicit personalization of few ADF UI attributes.

---

#### **RESTART_PROGRAM_STATUS**

The RESTART_PROGRAM_STATUS table is the table that holds record keeping
information about current program processes. The number of rows for a program on the
status table is equal to its NUM_THREADS value on the RESTART_CONTROL table.
The status table is modified during restart/recovery initialization and close logic. For
table-based processing, the restart/recovery initialization logic assigns the next available
thread to a program based on the program status and restart flag. For file-based
processing, the thread value is passed in from the input file name. When a thread is
assigned, the PROGRAM_STATUS is updated to prevent the assignment of that thread
to another process. Information is logged on the current status of a given thread, as well
as record keeping information such as operator and process timing information.

**RESTART_PROGRAM_STATUS**

( PK)RESTART_NAME varchar2 50 Program name

(PK)THREAD_VAL num 10 Thread counter

START_TIME date dd-mon-yy hh:mi:ss

PROGRAM_NAME varchar2 25 Program name

PROGRAM_STATUS varchar2 25 Started, aborted, aborted in init, aborted in
process, aborted in final, completed, ready for
start.

RESTART_FLAG varchar2 1 Automatically set to ‘N’ after abnormal end,
must be manually set to ‘Y’ for program to
restart.

RESTART_TIME date dd-mon-yy hh:mi:ss.

FINISH_TIME date dd-mon-yy hh:mi:ss.

CURRENT_PID num 15 Starting program ID.

CURRENT_OPERATOR_ID varchar2 20 Operator that started the program.

ERR_MESSAGE varchar2 255 Record that caused program abort and
associated error message.

CURRENT_ORACLE_SID num 15 Oracle SID for the session associated with the
current process.

Pro*C Restart and Recovery **187**

Table of Description and Definition

**RESTART_PROGRAM_STATUS**

CURRENT_SHADOW_PID [num ] 15 O/S process ID for the shadow process
associated with the current process. It is used
to locate the session trace file when a process is
not finished successfully.

---

#### **RESTART_PROGRAM_HISTORY**

The RESTART_PROGRAM_HISTORY table will contain one record for every
successfully completed program thread with restart/recovery logic. Upon the successful
completion of a program thread, its record on the RESTART_PROGRAM_STATUS table
will be inserted into the history table. Table purging will be at user discretion.

**RESTART_PROGRAM_HISTORY**

RESTART_NAME varchar2 50 Program name.

THREAD_VAL Num 10 Thread counter.

START_TIME Date dd-mon-yy hh:mi:ss.

PROGRAM_NAME varchar2 25 Program name.

NUM_THREADS Num 10 Number of threads.

COMMIT_MAX_CTR num 6 Numeric maximum value for counter
before commit occurs.

RESTART_TIME date dd-mon-yy hh:mi:ss.

FINISH_TIME date dd-mon-yy hh:mi:ss.

SHADOW_PID num 15 O/S process ID for the shadow process
associated with the process. It is used to
locate the session trace file.

SUCCESS_FLAG varchar2 1 Indicates whether the process finished
successfully (reserved for future use).

NON_FATAL_ERR_FLAG varchar2 1 Indicates whether non-fatal errors have
occurred for the process.

NUM_COMMITS num 12 Total number of commits for the process.
The possible last commit when
restart/recovery is closed is not counted.

AVG_TIME_BTWN_COMMITS num 12 Accumulated average time between
commits for the process. The possible last
commit when restart/recovery is closed is
not counted.

LREAD num Session logical reads. The sum of "db block
gets" plus "consistent gets". This includes
logical reads of database blocks from either
the buffer cache or process private

memory.

LWRITE num Session logical writes. The sum of "db
block changes" plus "consistent changes".

PREAD num Physical reads. Total number of data
blocks read from disk.

**188** Oracle Retail Merchandising System

Table of Description and Definition

**RESTART_PROGRAM_HISTORY**

UGA_MAX num Peak UGA (user global area) size for a
session.

PGA_MAX num Peak PGA (program global area) size for
the session.

SQLNET_BYTES_FROM_CLIENT  num Total number of bytes received from the
client over Oracle Net Services.

SQLNET_BYTES_TO_CLIENT     num Total number of bytes sent to the client
from the   foreground processes.

SQLNET_ROUNDTRIPS          num Total number of Oracle Net Services
messages sent to and received from the
client.

COMMITS num Number of user commits. When a user
commits a transaction, the redo generated
that reflects the changes made to database
blocks must be written to disk. Commits
often represent the closest thing to a user
transaction rate.

---

### **ksh Driven Batch Programs**

For ksh driven batch programs that call PL/SQL for its main processing logic, multithreading is also supported. An example of this type of batch job is ksh script
stockcountupload.ksh calling PL/SQL package CORESVC_STOCK_UPLOAD_SQL. The
threading configuration for each program is defined in table
RMS_PLSQL_BATCH_CONFIG (instead of RESTART_CONTROL for the ProC
programs). Column MAX_CONSURRENT_THREAD holds the maximum number of
concurrent threads. MAX_CHUNK_SIZE defines the commit size within each thread,
similar to the RESTART_CONTROL.COMMIT_MAX_CTR column.

Pro*C Multi-Threading **205**

---

## **RETL Program Overview for the RMS-RPAS** **Interface**

This chapter covers information about the Oracle Retail Extract Transform and Load
(RETL) program overview for the RMS and the RPAS interface. The RETL architecture is
mentioned along with the RETL program overview.
