# RMS Replenishment Engine - System Options & Implementation Configurations

## Excerpts from Implementation Guide (System Options & Setup)

#### **Replenishment**


Automated replenishment constantly monitors inventory conditions. Based on
inventory conditions, purchase orders or transfers are created to fulfill consumer
demand.


Automated replenishment parameters are set up at the supplier, supplier/department,
and supplier/location or supplier/department/location level. These parameters
include:


           - Review cycle and order control


           - Due order processing


           - Investment buy attributes


           - Scaling constraints


           - Rounding attributes


           - Supplier minimums


           - Truck splitting constraints


Items can be set up for automated replenishment through the Item Maintenance
dialog, either individually or through item lists.


Automated replenishment also supports different methods to determining whether
purchase orders are created and quantities ordered. These replenishment methods are
applied at the item/location.


           - Constant is a stock-oriented method in which the item is replenished when the
inventory level falls below a specified level.


           - Min/Max is a stock-oriented method in which the item is replenished up to the
maximum when the inventory level falls below a specified minimum stock level.


           - Floating Point is a stock-oriented method in which the item is replenished when
the inventory level falls below a dynamic system-calculated maximum stock level.


           - Time Supply is a stock-oriented method in which replenishment is based on the
number of days of supply for the item a retailer wants in inventory. The Time
Supply method requires a forecasting system.


**5-6** Product Title/BookTitle as a Variable


Information Maintained by RMS


           - Time Supply Seasonal is the same as Time Supply, but it takes seasonality and
terminal stock into account. The Time Supply Seasonal method requires a
forecasting system.


           - Time Supply Issues is used only by warehouses, this is the same as Time Supply,
but it uses warehouse issues forecast rather than store sales forecast. The Time
Supply Issues method requires a forecasting system.


           - Dynamic is a method that controls inventory using dynamic calculations of order
point and order quantities based on a number of factors, including forecast sales
over order lead time, review lead time, inventory selling days, lost sales factor, and
safety stock. The Dynamic method requires a forecasting system.


           - Dynamic Seasonal is the same as Dynamic, but it takes seasonality and terminal
stock into account. The Dynamic Seasonal method requires a forecasting system.


           - Dynamic Issues is used by warehouses only, this is the same as Dynamic, but it
uses warehouse issues forecast rather than store sales forecast. The Dynamic Issues
method requires a forecasting system.


           - Store Orders is a method that allows replenishment to look at the store order need
quantity when determining the recommended order quantity.
