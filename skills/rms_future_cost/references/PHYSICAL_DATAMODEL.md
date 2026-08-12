# RMS Future Cost Engine Datamodel - Physical Data Model Reference

## Table: FUTURE_COST

**Description:** This table holds estimated costs of items on future dates. Applicable deals, pending price changes, and pending reclassifications are considered when calculating the future costs. The costs on this table are based on the targeted level for each deal component and the default costing bracket.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | The item of the future_cost record. |
| 2 | SUPPLIER | P |  | Y | NUMERIC (10) | The supplier of the future_cost record. |
| 3 | ORIGIN_COUNTRY_ID | P |  | Y | VARCHAR (3) | The origin country of the future_cost record. |
| 4 | LOCATION | P |  | Y | NUMERIC (10) | The location of the future_cost record. |
| 5 | LOC_TYPE |  |  |  | VARCHAR (1) | The location type of the future_cost record. S - store, W - warehouse. |
| 6 | ACTIVE_DATE | P |  | Y | Date | Date that the item/supplier/country/location combinations costs becomes active. |
| 7 | BASE_COST |  |  | Y | NUMERIC (20,4) | Base cost of the SKU/supplier/country at the given location. This is the same cost that is on the item_supp_country table. |
| 8 | NET_COST |  |  | Y | NUMERIC (20,4) | Net cost of the SKU/supplier/country at the given location. This is the base cost minus any deal components designated as applying to net cost on DEAL_DETAIL. |
| 9 | NET_NET_COST |  |  | Y | NUMERIC (20,4) | Net net cost of the SKU/supplier/country at the given location. This is the net cost minus any deal components designated as applying to net net cost on DEAL_DETAIL. |
| 10 | DEAD_NET_NET_COST |  |  | Y | NUMERIC (20,4) | Dead net net cost of the SKU/supplier/country at the given location. This is the net net cost minus any deal components designated as applying to dead net net cost on DEAL_DETAIL. |
| 11 | PRICING_COST |  |  |  | NUMERIC (20,4) | Cost to be used to in pricing reviews. Pricing cost is the cost that will be interfaced with Oracle Price Management for use in pricing decisions. |
| 12 | CALC_DATE |  |  | Y | Date | Date the cost was last calculated. |
| 13 | START_IND |  |  |  | VARCHAR (1) | This value is Y if this record in future_cost is the start date of a cost event or holds N if this record in future_cost is the reset date of a cost event. |
| 14 | ACQUISITION_COST |  |  |  | NUMERIC (20,4) | Items base cost at the items primary supplier/country and source wh minus any deal pass through values |
| 15 | ELC_AMT |  |  |  | NUMERIC (20,4) | Amount attributed to expenses, assessments, and up charges. |
| 16 | PRIMARY_SUPP_COUNTRY_IND |  |  |  | VARCHAR (1) | Indicates if the records is the primary supplier and country for the item/location combination. |
| 17 | CURRENCY_CODE |  |  |  | VARCHAR (3) | Contains a code which uniquely identifies the type of currency. |
| 18 | DIVISION |  |  | Y | NUMERIC (4) | Contains the number which uniquely identifies the division of the company. |
| 19 | GROUP_NO |  |  | Y | NUMERIC (4) | Contains the number which uniquely identifies the group. |
| 20 | DEPT |  |  | Y | NUMERIC (4) | Contains the number which uniquely identifies the department. |
| 21 | CLASS |  |  | Y | NUMERIC (4) | Contains the number which uniquely identifies the class. |
| 22 | SUBCLASS |  |  | Y | NUMERIC (4) | Contains the number which uniquely identifies the subclass. |
| 23 | ITEM_PARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group at the level above the item. This value must exist as an item in another row on the item_master table. |
| 24 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group two levels above the item. This value must exist as both an item and an item parent in another row on the item_master table. |
| 25 | DIFF_1 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 26 | DIFF_2 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 27 | DIFF_3 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 28 | DIFF_4 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 29 | CHAIN |  |  |  | NUMERIC (10) | Contains the number which uniquely identifies the chain. |
| 30 | AREA |  |  |  | NUMERIC (10) | Contains the number which uniquely identifies the area. |
| 31 | REGION |  |  |  | NUMERIC (10) | Contains the number which uniquely identifies the region. |
| 32 | DISTRICT |  |  |  | NUMERIC (10) | Contains the number which uniquely identifies the district |
| 33 | SUPP_HIER_LVL_1 |  |  |  | VARCHAR (10) | Highest level of supplier hierarchy (e.g. manufacturer). This will be used for assigning rebates that come from a level in the supply chain that is higher than the supplier. |
| 34 | SUPP_HIER_LVL_2 |  |  |  | VARCHAR (10) | Second highest level of supplier hierarchy. Rebates at this level will include all eligible supplier/item/country/loc records assigned to this supplier hierarchy level. |
| 35 | SUPP_HIER_LVL_3 |  |  |  | VARCHAR (10) | Third highest level of supplier hierarchy, used for assigning rebates by a level other than supplier. Rebates at this level will include all eligible supplier/item/country/loc records assigned to this supplier hierarchy level. |
| 36 | RECLASS_NO |  |  |  | NUMERIC (4) | Identifies the reclassification that affected the costs for the sku/supplier/country/location/active date combination. |
| 37 | COST_CHANGE |  |  |  | NUMERIC (8) | Identifies the cost change that affected the costs for the sku/supplier/country/location/active date combination. |
| 38 | SIMPLE_PACK_IND |  |  |  | VARCHAR (1) | Indicates if pack item is a simple pack or not. This field will only be available if the item is a pack item. A simple pack is an item whose components are all the same item (i.e. a six pack of cola, etc). Valid values are: Y = Yes, this item is a simple pack N = No, this item is not a simple pack |
| 39 | PRIMARY_COST_PACK |  |  |  | VARCHAR (25) | This field contains an item number that is a simple pack containing the item in the item column for this record. If populated, the cost of the future cost table will be driven from the simple pack and the deals and cost changes for the simple pack. |
| 40 | PRIMARY_COST_PACK_QTY |  |  |  | NUMERIC (12,4) | This field contain the quantity of the component item for the primary cost pack. |
| 41 | STORE_TYPE |  |  |  | VARCHAR (1) | This column will indiate the type of the store. This will have a value only if the location type is a store. Valid values are,F - Franchise, C- Company |
| 42 | COSTING_LOC |  |  |  | NUMERIC (10) | This column will give the costing location for the franchise location.The costs for franchise location will be derived from the costing location base cost. |
| 43 | TEMPL_ID |  |  |  | NUMERIC (10) | This field will give the franchise cost buildup template to be applied on the item to arrive at the pricing cost. |
| 44 | PASSTHRU_PCT |  |  |  | NUMERIC (12,4) | Percentage of the suppliers off-invoice deals that will be passed from source wh to the customer store. |
| 45 | NEGOTIATED_ITEM_COST |  |  |  | NUMERIC (20,4) | Holds the supplier negotiated item cost. |
| 46 | EXTENDED_BASE_COST |  |  |  | NUMERIC (20,4) | Holds the extended base cost of the item. Extended base cost is the cost inclusive of all the taxes that affect the weighted average cost (WAC). |
| 47 | WAC_TAX |  |  |  | NUMERIC (20,4) | Holds the tax on the weighted average cost. |
| 48 | DEFAULT_COSTING_TYPE |  |  |  | VARCHAR (6) | Indicates the cost used to compute values in cost-related fields for this table. Valid values are, Base Cost (BC) and Negotiated Item Cost (NIC). |

### Indexes

|Index Name|State|Functional|Spatial|Expression|Column Name|Sort<br>Order|
|---|---|---|---|---|---|---|
|PK_FUTURE_COST|PK||||ITEM|ASC|
||||||SUPPLIER|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
||||||LOCATION|ASC|
||||||ACTIVE_DATE|ASC|
|FUTURE_COST_I2|||||LOCATION|ASC|
||||||ACTIVE_DATE|ASC|
|FUTURE_COST_I1|||||PRIMARY_COST_PACK|ASC|
|FUTURE_COST_I3|||||COST_CHANGE|ASC|
|FUTURE_COST_I4|||||SUPPLIER|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
||||||LOCATION|ASC|
||||||ITEM|ASC|
||||||ITEM_PARENT|ASC|
|FUTURE_COST_I5|||||SUPPLIER|ASC|
||||||ORIGIN_COUNTRY_ID|ASC|
||||||LOCATION|ASC|
||||||ITEM|ASC|
||||||ITEM_PARENT|ASC|

---

## Table: FUTURE_COST_BUYGET_HELP_GTT

**Description:** this table is used during the processing of cost engine.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | FUTURE_COST_GTT_ROWID | P |  | Y | ROWID | rowid of the corresponding record on future_cost_gtt for this row. |
| 2 | DEAL_ID | P |  | Y | NUMERIC (10) | deal id found on deal_item_loc_explode_gtt. |
| 3 | DEAL_DETAIL_ID | P |  | Y | NUMERIC (10) | deal detail id found on deal_item_loc_explode_gtt. |
| 4 | OTHER_ITEM_UNIT_COST |  |  |  | NUMERIC (20,4) | unit cost of the get item of the deal. |

---

## Table: FUTURE_COST_COMP_GTT

**Description:** this table holds estimated component costs of items on future dates.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  |  | VARCHAR (25) | holds the item associated to the cost event. |
| 2 | SUPPLIER |  |  |  | NUMERIC (10) | holds the supplier associated to the cost event. |
| 3 | ORIGIN_COUNTRY_ID |  |  |  | VARCHAR (3) | holds the origin country id associated to the cost event. |
| 4 | LOCATION |  |  |  | NUMERIC (10) | holds the location associated to the cost event. can be a store or a warehouse. |
| 5 | ACTIVE_DATE |  |  |  | Date | date that the item/supplier/country/location combinations costs becomes active. |
| 6 | TEMPL_ID |  |  |  | NUMERIC (10) | franchise cost buildup template id. |
| 7 | COMP_ID |  |  |  | VARCHAR (10) | contains a specified code representing a specific expense or assessment found on the elc_comp table. |
| 8 | COMP_RATE |  |  |  | NUMERIC (20,4) | contains the rate to be charged against the calculation base. |
| 9 | PER_COUNT_UOM |  |  |  | VARCHAR (4) | contains the unit of measure in which the per count is specified. |
| 10 | PER_COUNT |  |  |  | NUMERIC (12,4) | contains a count indicating the amount of the per count unit of measure to which the rate applies. |
| 11 | VALUE |  |  |  | NUMERIC (20,4) | expense value |
| 12 | EXCHANGE_RATE |  |  |  | NUMERIC (20,10) | contains the exchange rate of the individual expense. |

---

## Table: FUTURE_COST_GTT

**Description:** this table is used during the processing of cost engine

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | the item of the future_cost record. |
| 2 | SUPPLIER | P |  | Y | NUMERIC (10) | the supplier of the future_cost record. |
| 3 | ORIGIN_COUNTRY_ID | P |  | Y | VARCHAR (3) | the origin_country_id of the future_cost record. |
| 4 | LOCATION | P |  | Y | NUMERIC (10) | the location of the future_cost record. |
| 5 | LOC_TYPE |  |  |  | VARCHAR (1) | the location type of the future_cost record. s - store, w - warehouse. |
| 6 | ACTIVE_DATE | P |  | Y | Date | date that the item/supplier/country/location combinations costs becomes active. |
| 7 | BASE_COST |  |  | Y | NUMERIC (20,4) | base cost of the sku/supplier/country at the given location. this is the same cost that is on the item_supp_country table. |
| 8 | NET_COST |  |  | Y | NUMERIC (20,4) | net cost of the sku/supplier/country at the given location. this is the base cost minus any deal components designated as applying to net cost on deal_detail. |
| 9 | NET_NET_COST |  |  | Y | NUMERIC (20,4) | net net cost of the sku/supplier/country at the given location. this is the net cost minus any deal components designated as applying to net net cost on deal_detail. |
| 10 | DEAD_NET_NET_COST |  |  | Y | NUMERIC (20,4) | dead net net cost of the sku/supplier/country at the given location. this is the net net cost minus any deal components designated as applying to dead net net cost on deal_detail. |
| 11 | PRICING_COST |  |  |  | NUMERIC (20,4) | cost to be used to in pricing reviews. pricing cost is the cost that will be interfaced with oracle price management for use in pricing decisions. |
| 12 | CALC_DATE |  |  | Y | Date | date the cost was last calculated. |
| 13 | START_IND |  |  |  | VARCHAR (1) | this value is y if this record in future_cost is the start date of a cost event or holds n if this record in future_cost is the reset date of a cost event. |
| 14 | ACQUISITION_COST |  |  |  | NUMERIC (20,4) | items base cost at the items primary supplier/country and source wh minus any deal pass through values |
| 15 | ELC_AMT |  |  |  | NUMERIC (20,4) | amount attributed to expenses, assessments, and up charges. |
| 16 | PRIMARY_SUPP_COUNTRY_IND |  |  |  | VARCHAR (1) | indicates if the records is the primary supplier and country for the item/location combination. |
| 17 | CURRENCY_CODE |  |  |  | VARCHAR (3) | contains a code which uniquely identifies the type of currency. |
| 18 | DIVISION |  |  | Y | NUMERIC (4) | contains the number which uniquely identifies the division of the company. |
| 19 | GROUP_NO |  |  | Y | NUMERIC (4) | contains the number which uniquely identifies the group. |
| 20 | DEPT |  |  | Y | NUMERIC (4) | contains the number which uniquely identifies the department. |
| 21 | CLASS |  |  | Y | NUMERIC (4) | contains the number which uniquely identifies the class. |
| 22 | SUBCLASS |  |  | Y | NUMERIC (4) | contains the number which uniquely identifies the subclass. |
| 23 | ITEM_PARENT |  |  |  | VARCHAR (25) | alphanumeric value that uniquely identifies the item/group at the level above the item. this value must exist as an item in another row on the item_master table. |
| 24 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | alphanumeric value that uniquely identifies the item/group two levels above the item. this value must exist as both an item and an item parent in another row on the item_master table. |
| 25 | DIFF_1 |  |  |  | VARCHAR (10) | diff_group or diff_id that differentiates the current item from its item_parent. for an item that is a parent, this field may be either a group (i.e. mens pant sizes) or a value (6 oz). for an item that is not a parent, this field may contain a value (34x34, red, etc.) valid values are found on the diff_group and diff_id tables. |
| 26 | DIFF_2 |  |  |  | VARCHAR (10) | diff_group or diff_id that differentiates the current item from its item_parent. for an item that is a parent, this field may be either a group (i.e. mens pant sizes) or a value (6 oz). for an item that is not a parent, this field may contain a value (34x34, red, etc.) valid values are found on the diff_group and diff_id tables. |
| 27 | DIFF_3 |  |  |  | VARCHAR (10) | diff_group or diff_id that differentiates the current item from its item_parent. for an item that is a parent, this field may be either a group (i.e. mens pant sizes) or a value (6 oz). for an item that is not a parent, |
| 28 | DIFF_4 |  |  |  | VARCHAR (10) | diff_group or diff_id that differentiates the current item from its item_parent. for an item that is a parent, this field may be either a group (i.e. mens pant sizes) or a value (6 oz). for an item that is not a parent, this field may contain a value (34x34, red, etc.) valid values are found on the diff_group and diff_id tables. |
| 29 | CHAIN |  |  |  | NUMERIC (10) | contains the number which uniquely identifies the chain. |
| 30 | AREA |  |  |  | NUMERIC (10) | contains the number which uniquely identifies the area. |
| 31 | REGION |  |  |  | NUMERIC (10) | contains the number which uniquely identifies the area. |
| 32 | DISTRICT |  |  |  | NUMERIC (10) | contains the number which uniquely identifies the district |
| 33 | SUPP_HIER_LVL_1 |  |  |  | VARCHAR (10) | highest level of supplier hierarchy (e.g. manufacturer). this will be used for assigning rebates that come from a level in the supply chain that is higher than the supplier. |
| 34 | SUPP_HIER_LVL_2 |  |  |  | VARCHAR (10) | second level of supplier hierarchy (e.g. manufacturer). this will be used for assigning rebates that come from a level in the supply chain that is higher than the supplier. |
| 35 | SUPP_HIER_LVL_3 |  |  |  | VARCHAR (10) | third highest level of supplier hierarchy, used for assigning rebates by a level other than supplier. rebates at this level will include all eligible supplier/item/country/loc records assigned to this supplier hierarchy level. |
| 36 | RECLASS_NO |  |  |  | NUMERIC (4) | identifies the reclassification that affected the costs for the sku/supplier/country/location/active date combination. |
| 37 | COST_CHANGE |  |  |  | NUMERIC (8) | identifies the cost change that affected the costs for the sku/supplier/country/location/active date combination. |
| 38 | SIMPLE_PACK_IND |  |  |  | VARCHAR (1) | indicates if pack item is a simple pack or not. this field will only be available if the item is a pack item. a simple pack is an item whose components are all the same item (i.e. a six pack of cola, etc). valid values are: y = yes, this item is a simple pack n = no, this item is not a simple packindicates if pack item is a simple pack or not. this field will only be available if the item is a pack item. a simple pack is an item whose components are all the same item (i.e. a six pack of cola, etc). valid values are: y = yes, this item is a simple pack n = no, this item is not a simple pack |
| 39 | PRIMARY_COST_PACK |  |  |  | VARCHAR (25) | this field contains an item number that is a simple pack containing the item in the item column for this record. if populated, the cost of the future cost table will be driven from the simple pack and the deals and cost changes for the simple pack. |
| 40 | PRIMARY_COST_PACK_QTY |  |  |  | NUMERIC (12,4) | this field contain the quantity of the component item for the primary cost pack. |
| 41 | STORE_TYPE |  |  |  | VARCHAR (1) | This column will indiate the type of the store. this will have a value only if the location type is a store. valid values are,f - franchise c- company. |
| 42 | COSTING_LOC |  |  |  | NUMERIC (10) | This column will give the costing location for the franchise location.The costs for franchise location will be derived from the costing location base cost. |
| 43 | TEMPL_ID |  |  |  | NUMERIC (10) | This column gives the template id which has applied to a franchise store for a certain time period . The template applied can be at item level / dept level of the franchise store . The pricing cost of the franchise store will be recalculated based on the template. |
| 44 | PASSTHRU_PCT |  |  |  | NUMERIC (12,4) | This column gives the pass thru percent of a deal which is given to the costing location of a franchise store to the franchise store. The acquisition cost of the franchise store will be recalculated based on this. |
| 45 | NEGOTIATED_ITEM_COST |  |  |  | NUMERIC (20,4) | holds the supplier negotiated item cost. |
| 46 | EXTENDED_BASE_COST |  |  |  | NUMERIC (20,4) | holds the extended base cost of the item. extended base cost is the cost inclusive of all the taxes that affect the wac. |
| 47 | WAC_TAX |  |  |  | NUMERIC (20,4) | holds the tax on the weighted average cost. |
| 48 | DEFAULT_COSTING_TYPE |  |  |  | VARCHAR (6) | indicates the cost used to compute values in cost-related fields for this table. valid values are, base cost (bc) and negotiated item cost (nic). |
| 49 | PROCESSING_SEQ_NO |  |  |  | NUMERIC (10) | processing sequence number |

---

## Table: FUTURE_COST_ROLLFWD_CONTROL

**Description:** Program control table for the future cost engine roll forward package. List the function names and their execution order. The execution order ensures that the correct cost is applied when rolling forward the effect of events that affect cost across an item/supplier/country/location timeline.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ROLL_FORWARD_FUNCTION_NAME |  |  | Y | VARCHAR (62) | Function name in the future cost engine roll forward package (futurecostrollfwdb.pls). |
| 2 | DESCRIPTION |  |  |  | VARCHAR (255) | Function description. |
| 3 | EXECUTION_ORDER |  |  | Y | NUMERIC (4) | Number indicating the order of execution for the function. Order is ascending. |

---

## Table: FUTURE_COST_WF_HELPER_TEMP

**Description:** This is a temporary table to help the future_cost_temp table limit rows for franchise functionality.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID |  |  |  | NUMERIC (15) | The unique identifier of the cost event. |
| 2 | LOCATION |  |  |  | NUMERIC (10) | Holds the location associated to the cost event. Can be a store or a warehouse. |

---

## Table: FUTURE_COST_WORKING_GTT

**Description:** this table is used during the processing of cost engine.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM |  |  | Y | VARCHAR (25) | the item of the future_cost_working_gtt record. |
| 2 | SUPPLIER |  |  | Y | NUMERIC (10) | the supplier of the future_cost_working_gtt record. |
| 3 | ORIGIN_COUNTRY_ID |  |  | Y | VARCHAR (3) | the origin country of the future_cost_working_gtt record. |
| 4 | LOCATION |  |  | Y | NUMERIC (10) | the location of the future_cost_working_gtt record. |
| 5 | LOC_TYPE |  |  |  | VARCHAR (1) | the location type of the future_cost_working_gtt record. s - store, w - warehouse. |
| 6 | ACTIVE_DATE |  |  | Y | Date | date that the item/supplier/country/location combinations costs becomes active. |
| 7 | BASE_COST |  |  | Y | NUMERIC (20,4) | base cost of the sku/supplier/country at the given location. this is the same cost that is on the item_supp_country table. |
| 8 | NET_COST |  |  | Y | NUMERIC (20,4) | net cost of the sku/supplier/country at the given location. this is the base cost minus any deal components designated as applying to net cost on deal_detail. |
| 9 | NET_NET_COST |  |  | Y | NUMERIC (20,4) | net net cost of the sku/supplier/country at the given location. this is the net cost minus any deal components designated as applying to net net cost on deal_detail. |
| 10 | DEAD_NET_NET_COST |  |  | Y | NUMERIC (20,4) | dead net net cost of the sku/supplier/country at the given location. this is the net net cost minus any deal components designated as applying to dead net net cost on deal_detail. |
| 11 | ACQUISITION_COST |  |  |  | NUMERIC (20,4) | The Items base cost at the items primary supplier/country and source warehouse minus any deal pass through values. |
| 12 | PRICING_COST |  |  |  | NUMERIC (20,4) | cost to be used to in pricing reviews. pricing cost is the cost that will be interfaced with oracle price management for use in pricing decisions. |
| 13 | CALC_DATE |  |  | Y | Date | date the cost was last calculated. |
| 14 | START_IND |  |  |  | VARCHAR (1) | this value is y if this record in future_cost is the start date of a cost event or holds n if this record in future_cost is the reset date of a cost event. |
| 15 | PRIMARY_SUPP_COUNTRY_IND |  |  |  | VARCHAR (1) | indicates if the records is the primary supplier and country for the item/location combination. |
| 16 | CURRENCY_CODE |  |  |  | VARCHAR (3) | contains a code which uniquely identifies the type of currency. |
| 17 | ELC_AMT |  |  |  | NUMERIC (20,4) | amount attributed to expenses, assessments, and up charges. |
| 18 | PROCESSING_SEQ_NO |  |  |  | NUMERIC (10) | order by which the future cost engine roll forward process will process this row for the cost event. |
| 19 | DEAL_ID |  |  |  | NUMERIC (10) | unique deal number. |
| 20 | DEAL_DETAIL_ID |  |  |  | NUMERIC (10) | deal component id number. |
| 21 | DEAL_ACTIVE_DATE |  |  |  | Date | date the deal will become active. this date will determine when deal components begin to be factored into item costs. for a po-specific deal, the active_date will be the orders written date. |
| 22 | DEAL_CLOSE_DATE |  |  |  | Date | date the deal will/did end. this date determines when deal components are no longer factored into item costs. it is optional for annual deals, required for promotional deals. it will be left null for po-specific deals. |
| 23 | COST_APPL_IND |  |  |  | VARCHAR (6) | indicates what cost bucket the deal component should affect. valid values are n for net cost, nn for net net cost and dnn for dead net net cost. these values will be held on the codes tables under a code_type of dlca. it can only be null for an m-type deal (vendor funded markdown). |
| 24 | PRICE_COST_APPL_IND |  |  |  | VARCHAR (1) | identifies deal components that should be included when calculating a pricing cost. |
| 25 | DEAL_CLASS |  |  |  | VARCHAR (6) | identifies the calculation class of the deal component. valid values are cu for cumulative (discounts are added together and taken off as one lump sum),cs for cascade (discounts are taken one at a time with subsequent discounts taken off the result of the previous discount) and ex for exclusive (overrides all other discounts). ex type deal components are only valid for promotional deals. deal classes will be held on the codes table under a code type of dlcl. it can only be null for an m-type deal (vendor funded markdown). |
| 26 | THRESHOLD_VALUE_TYPE |  |  |  | VARCHAR (6) | identifies whether the discount values associated with the thresholds will be set up as qty values, currency amount values, percentages or fixed amounts. valid values are q for qty, a for currency amount, p for percentage or f for fixed amount. qty threshold deals are only allowed on off-invoice discounts. deal threshold value types will be held on the codes table under a code type of dll2. it can only be null for an m-type deal (vendor funded markdown). |
| 27 | BG_BUY_ITEM |  |  |  | VARCHAR (25) | identifies the item that must be purchased for a quantity threshold-type discount. this value is required for quantity threshold-type discounts. |
| 28 | BG_GET_TYPE |  |  |  | VARCHAR (6) | identifies the type of the get discount for a quantity threshold-type (buy/get) discount. valid values include x (free), p (percent), a (amount) and f (fixed amount). they are held on the codes table under a code type of dqgt. this value is required for quantity threshold deals. |
| 29 | BG_GET_VALUE |  |  |  | NUMERIC (20,4) | identifies the value of the get discount for a quantity threshold-type (buy/get) discount that is not a free goods deal. the type of the value is identified by the get type in the qty_thresh_get_type. this value is required for quantity threshold deals that are not a get type of free. |
| 30 | BG_BUY_QTY |  |  |  | NUMERIC (12,4) | identifies the quantity of the threshold buy item that must be ordered to qualify for the free item. this value is required for quantity threshold-type discounts. |
| 31 | BG_RECUR_IND |  |  |  | VARCHAR (1) | for buy/get free discounts, indicates if the quantity threshold discount is only for the first buy amt. purchased (e.g. for the first 10 purchased, get 1 free), or if a free item will be given for every multiple of the buy amt purchased on the order (e.g. for each 10 purchased, get 1 free). this value is required for quantity threshold-type discounts with a get type of free. valid values are y for yes or n for no. |
| 32 | BG_BUY_TARGET |  |  |  | NUMERIC (12,4) | indicates the targeted purchase level for all locs on a purchase order. this is the target level that will be used for future calculation of net cost. |
| 33 | BG_BUY_AVG_LOC |  |  |  | NUMERIC (12,4) | indicates the average targeted purchase level per location on the deal. this value will be used in future cost calculations. |
| 34 | BG_GET_ITEM |  |  |  | VARCHAR (25) | identifies the get item for a quantity threshold-type (buy/get) discount. this value is required for quantity threshold deals. |
| 35 | BG_GET_QTY |  |  |  | NUMERIC (12,4) | identifies the quantity of the identified get item that will be given at the specified get discount if the buy amt of the buy item is purchased. this value is required for quantity threshold-type discounts. |
| 36 | BG_FREE_ITEM_UNIT_COST |  |  |  | NUMERIC (20,4) | for buy/get free discounts, identifies the unit cost of the threshold free item that will be used in calculating the prorated qty. discount. it will default to the item/supplier cost, but can be modified based on the agreement with the supplier. it must be greater than zero as this is the cost that would normally be charged for the goods if no deal applied. |
| 37 | DEAL_HEAD_TYPE |  |  |  | VARCHAR (6) | type of the deal. valid values are a for annual deal, p for promotional deal, o for po-specific deal or m for vendor-funded markdown. deal types will be held on the codes table under a code type of dlht. |
| 38 | PARTNER_TYPE |  |  |  | VARCHAR (6) | type of the partner the deal applies to. valid values are s1 for supplier hierarchy level 1 (e.g. manufacturer), s2 for supplier hierarchy level 2 (e.g. distributor) and s3 for supplier hierarchy level 3 (e.g. franchiser). descriptions of these codes will be held on the codes table under a code_type of suhl. |
| 39 | PARTNER_ID |  |  |  | VARCHAR (10) | level of supplier hierarchy (e.g. manufacturer or distributor ), up as a partner in the partner table, used for assigning rebates by a level other than supplier.rebates at this level will include all eligible supplier/item/country records assigned to this supplier hierarchy level. |
| 40 | CREATE_DATETIME |  |  |  | Date | time and date the deal_item_loc_explode record was created. |
| 41 | DEAL_DETAIL_APPLICATION_ORDER |  |  |  | NUMERIC (10) | number indicating the order in which the deal component should be applied with respect to any other deal components applicable to the item within the deal. this number will be unique across all deal components within the deal. it can only be null for an m-type deal (vendor funded markdown). |
| 42 | THRESHOLD_VALUE |  |  |  | NUMERIC (20,4) | threshold value. |
| 43 | HELPER_GET_ITEM_UNIT_COST |  |  |  | NUMERIC (20,4) | helper field for roll forward process. holds the unit cost of the get item in a buy one get one deal component. |
| 44 | HELPER_BUY_ITEM_UNIT_COST |  |  |  | NUMERIC (20,4) | helper field for roll forward process. holds the unit cost of the buy item in a buy one get one deal component. |
| 45 | HELPER_GET_ITEM_UNIT_COST_INIT |  |  |  | NUMERIC (20,4) | helper field for roll forward process. holds the initial unit cost of the get item in a buy one get one deal component. |
| 46 | HELPER_NEW_GET_UNIT_COST_N |  |  |  | NUMERIC (20,4) | helper field for roll forward process. holds the net cost of the get item in a buy one get one deal component. |
| 47 | HELPER_NEW_BUY_UNIT_COST_N |  |  |  | NUMERIC (20,4) | helper field for roll forward process. holds the net cost of the buy item in a buy one get one deal component. |
| 48 | HELPER_NEW_GET_UNIT_COST_NN |  |  |  | NUMERIC (20,4) | helper field for roll forward process. holds the net net cost of the get item in a buy one get one deal component. |
| 49 | HELPER_NEW_BUY_UNIT_COST_NN |  |  |  | NUMERIC (20,4) | helper field for roll forward process. holds the net net cost of the buy item in a buy one get one deal component. |
| 50 | HELPER_NEW_GET_UNIT_COST_DNN |  |  |  | NUMERIC (20,4) | helper field for roll forward process. holds the dead net net cost of the get item in a buy one get one deal component. |
| 51 | HELPER_NEW_BUY_UNIT_COST_DNN |  |  |  | NUMERIC (20,4) | helper field for roll forward process. holds the dead net net cost of the buy item in a buy one get one deal component. |
| 52 | HELPER_NEW_ITEM_UNIT_COST |  |  |  | NUMERIC (20,4) | helper field for roll forward process. holds the items unit cost. |
| 53 | HELPER_GET_QTY |  |  |  | NUMERIC (20,4) | helper field for roll forward process. identifies the quantity of the identified get item that will be given at the specified get discount if the buy amt of the buy item is purchased. this value is required for quantity threshold-type discounts. |
| 54 | HELPER_BUY_QTY |  |  |  | NUMERIC (20,4) | helper field for roll forward process. identifies the quantity of the threshold buy item that must be ordered to qualify for the free item. this value is required for quantity threshold-type discounts. |
| 55 | HELPER_BUY_TARGET |  |  |  | NUMERIC (20,4) | helper field for roll forward process. indicates the targeted purchase level for all locs on a purchase order. this is the target level that will be used for future calculation of net cost. |
| 56 | HELPER_GET_TARGET |  |  |  | NUMERIC (20,4) | helper field for roll forward process. indicates the targeted purchase level for all locs on a purchase order. this is the target level that will be used for future calculation of net cost. |
| 57 | HELPER_THRESH_GET_QTY |  |  |  | NUMERIC (20,4) | helper field for roll forward process. holds the threshold quantity for the get item. |
| 58 | HELPER_TOTAL_DISCOUNT |  |  |  | NUMERIC (20,4) | helper field for roll forward process. calculated total discount for the item. |
| 59 | HELPER_GET_VALUE |  |  |  | NUMERIC (20,4) | helper field for roll forward process. identifies the value of the get discount for a quantity threshold-type (buy/get) discount that is not a free goods deal. the type of the value is identified by the get type in the qty_thresh_get_type. this value is required for quantity threshold deals that are not a get type of free. |
| 60 | HELPER_GET_DISCOUNT_SHARE |  |  |  | NUMERIC (20,4) | helper field for roll forward process. calculated discount for the get item. |
| 61 | HELPER_BUY_DISCOUNT_SHARE |  |  |  | NUMERIC (20,4) | helper field for roll forward process. calculated discount for the buy item. |
| 62 | HELPER_BUY_PLUS_GET_QTY |  |  |  | NUMERIC (20,4) | helper field for roll forward process. sum of qty_thresh_buy_qty and qty_thresh_get_qty |
| 63 | KEY_RANK_COUNT |  |  |  | NUMERIC (4) | result from count(1) function over a partitioned set of item, supplier, country, location and active date. |
| 64 | KEY_DAY_RANK |  |  |  | NUMERIC (4) | result for rank function over a partitioned set of item, supplier, country, location and active date ordered by deal_age_priority and deal_type_priority. |
| 65 | KEY_RANK |  |  |  | NUMERIC (4) | rank of the row taking into account cost_appl_ind, deal_type_priority, deal_age_priority, deal_detail_application_order and deal_id. |
| 66 | GET_FREE_DISCOUNT |  |  |  | NUMERIC (4) | This specifies how much percentage of the total discount should be apportioned from the get items unit cost for off invoice deals where the buy item is not same as the get item and QTY_THRESH_GET_TYPE is X. The remaining will be apportioned from the buy item unit cost. |
| 67 | NEGOTIATED_ITEM_COST |  |  |  | NUMERIC (20,4) | holds the supplier negotiated item cost. |
| 68 | EXTENDED_BASE_COST |  |  |  | NUMERIC (20,4) | holds the extended base cost of the item. extended base cost is the cost inclusive of all the taxes that affect the wac. |
| 69 | WAC_TAX |  |  |  | NUMERIC (20,4) | holds the tax on the weighted average cost. |
| 70 | DEFAULT_COSTING_TYPE |  |  |  | VARCHAR (6) | indicates the cost used to compute values in cost-related fields for this table. valid values are, base cost (bc) and negotiated item cost (nic). |

---

## Table: FUTURE_COST_WORKSPACE

**Description:** This table holds estimated costs of items on future dates. It is used by the margin impact form for cost changes in RMS and serves as a worksheet that provides margin visibility for all locations ranged to the item/supplier/country.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | COST_EVENT_PROCESS_ID | P |  | Y | NUMERIC (15) | The unique identifier of the cost event. |
| 2 | ITEM | P |  | Y | VARCHAR (25) | The item of the future_cost record. |
| 3 | SUPPLIER | P |  | Y | NUMERIC (10) | The supplier of the future_cost record. |
| 4 | ORIGIN_COUNTRY_ID | P |  | Y | VARCHAR (3) | The origin country of the future_cost record. |
| 5 | LOCATION | P |  | Y | NUMERIC (10) | The location of the future_cost record. |
| 6 | LOC_TYPE |  |  |  | VARCHAR (1) | The location type of the future_cost record. S - store, W - warehouse. |
| 7 | ACTIVE_DATE | P |  | Y | Date | Date that the item/supplier/country/location combinations costs becomes active. |
| 8 | BASE_COST |  |  | Y | NUMERIC (20,4) | Base cost of the SKU/supplier/country at the given location. This is the same cost that is on the item_supp_country table. |
| 9 | NET_COST |  |  | Y | NUMERIC (20,4) | Net cost of the SKU/supplier/country at the given location. This is the base cost minus any deal components designated as applying to net cost on DEAL_DETAIL. |
| 10 | NET_NET_COST |  |  | Y | NUMERIC (20,4) | Net net cost of the SKU/supplier/country at the given location. This is the net cost minus any deal components designated as applying to net net cost on DEAL_DETAIL. |
| 11 | DEAD_NET_NET_COST |  |  | Y | NUMERIC (20,4) | Dead net net cost of the SKU/supplier/country at the given location. This is the net net cost minus any deal components designated as applying to dead net net cost on DEAL_DETAIL. |
| 12 | ACQUISITION_COST |  |  |  | NUMERIC (20,4) | Items base cost at the items primary supplier/country and source wh minus any deal pass through valueus |
| 13 | PRICING_COST |  |  |  | NUMERIC (20,4) | Cost to be used to in pricing reviews. Pricing cost is the cost that will be interfaced with Oracle Price Management for use in pricing decisions. |
| 14 | CALC_DATE |  |  | Y | Date | Date the cost was last calculated. |
| 15 | START_IND |  |  |  | VARCHAR (1) | This value is Y if this record in future_cost is the start date of a cost event or holds N if this record in future_cost is the reset date of a cost event. |
| 16 | PRIMARY_SUPP_COUNTRY_IND |  |  |  | VARCHAR (1) | Indicates if the records is the primary supplier and country for the item/location combination. |
| 17 | CURRENCY_CODE |  |  |  | VARCHAR (3) | Contains a code which uniquely identifies the type of currency. |
| 18 | ELC_AMOUNT |  |  |  | NUMERIC (20,4) | Amount attributed to expenses, assessments, and up charges. |
| 19 | DIVISION |  |  | Y | NUMERIC (4) | Contains the number which uniquely identifies the division of the company. |
| 20 | GROUP_NO |  |  | Y | NUMERIC (4) | Contains the number which uniquely identifies the group. |
| 21 | DEPT |  |  | Y | NUMERIC (4) | Contains the number which uniquely identifies the department. |
| 22 | CLASS |  |  | Y | NUMERIC (4) | Contains the number which uniquely identifies the class. |
| 23 | SUBCLASS |  |  | Y | NUMERIC (4) | Contains the number which uniquely identifies the subclass. |
| 24 | ITEM_PARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group at the level above the item. This value must exist as an item in another row on the item_master table. |
| 25 | ITEM_GRANDPARENT |  |  |  | VARCHAR (25) | Alphanumeric value that uniquely identifies the item/group two levels above the item. This value must exist as both an item and an item parent in another row on the item_master table. |
| 26 | DIFF_1 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 27 | DIFF_2 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 28 | DIFF_3 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 29 | DIFF_4 |  |  |  | VARCHAR (10) | Diff_group or diff_id that differentiates the current item from its item_parent. For an item that is a parent, this field may be either a group (i.e. Mens pant sizes) or a value (6 oz). For an item that is not a parent, this field may contain a value (34X34, Red, etc.) Valid values are found on the diff_group and diff_id tables. |
| 30 | CHAIN |  |  |  | NUMERIC (10) | Contains the number which uniquely identifies the chain. |
| 31 | AREA |  |  |  | NUMERIC (10) | Contains the number which uniquely identifies the area. |
| 32 | REGION |  |  |  | NUMERIC (10) | Contains the number which uniquely identifies the region. |
| 33 | DISTRICT |  |  |  | NUMERIC (10) | Contains the number which uniquely identifies the district |
| 34 | SUPP_HIER_LVL_1 |  |  |  | VARCHAR (10) | Highest level of supplier hierarchy (e.g. manufacturer). This will be used for assigning rebates that come from a level in the supply chain that is higher than the supplier. |
| 35 | SUPP_HIER_LVL_2 |  |  |  | VARCHAR (10) | Second highest level of supplier hierarchy. Rebates at this level will include all eligible supplier/item/country/loc records assigned to this supplier hierarchy level. |
| 36 | SUPP_HIER_LVL_3 |  |  |  | VARCHAR (10) | Third highest level of supplier hierarchy, used for assigning rebates by a level other than supplier. Rebates at this level will include all eligible supplier/item/country/loc records assigned to this supplier hierarchy level. |
| 37 | RECLASS_NO |  |  |  | NUMERIC (4) | Identifies the reclassification that affected the costs for the sku/supplier/country/location/active date combination. |
| 38 | COST_CHANGE |  |  |  | NUMERIC (8) | Identifies the cost change that affected the costs for the sku/supplier/country/location/active date combination. |
