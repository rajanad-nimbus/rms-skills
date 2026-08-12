# RMS Costing, Landed Cost & Expenses - System Options & Implementation Configurations

## Excerpts from Implementation Guide (System Options & Setup)

### **Landed Cost**

Landed cost is the total cost of an item received from a vendor inclusive of the supplier
cost and all costs associated with moving the item from the supplier's warehouse or
factory to the purchase order receiving location. RTM facilitates the setting up of
various cost components, associating them to the purchase orders, calculating the
estimated landed costs at the time of purchase order creation. It also facilitates the
tracking and booking of the actual costs after the receipt process.


Estimated Landed Cost (ELC) is composed of cost components from the Supplier,
Trading Partners, Item and Origin Country, which are brought together during
Purchase Order (PO) creation to develop an estimate of costs associated with
purchasing a particular item on the current PO.


The components of landed cost are defined using Expenses, Assessments, and
Computation Value Bases (CVBs).


---

### **Actual Landed Costs**


RTM helps to track the actual landed cost incurred when buying an import item. The
module reports variances between estimated and actual landed costs by cost
component and shipment. The Actual Landed Cost (ALC) dialogs provide the
flexibility to view information about actual and estimated landed costs for any item on
a purchase order or invoice obligation. The information can be organized by
obligation, obligation cost component, shipment, or location. Duties, fees and taxes are
posted directly to the Actual Landed Cost module bypassing the obligations
maintenance process. While finalizing the ALC at a purchase order level, the user can
also choose whether or not to update weighted average cost (WAC) for each purchase
order. For those circumstances where goods might be partially or completely
processed through a distribution center to another location prior to assembly and
calculation of ALC, it might be more accurate to have WAC be determined by ELC to
stand rather than updating it with an ELC/ALC variance.
