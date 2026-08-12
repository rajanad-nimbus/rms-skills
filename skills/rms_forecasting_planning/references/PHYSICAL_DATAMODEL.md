# RMS Sales Forecasting & Planning Datamodel - Physical Data Model Reference

## Table: DAILY_ITEM_FORECAST

**Description:** Holds the day/item level forecasted information from the RDF extractions. This table will hold all item types. This table should be partitioned according to the domain level. While the development environment will create this table with a generic set-up, the exact partitioning scheme will be individual to the client. There should be at least one partition per domain_id.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | Contains the number that uniquely identifies a stock-keeping unit for which forecasts are being kept. |
| 2 | LOC | P |  | Y | NUMERIC (10) | Contains the location corresponding to the forecast information for the sku. |
| 3 | DATA_DATE | P |  | Y | Date | Contains the date that the forecasts are being held for. |
| 4 | DOMAIN_ID | P |  | Y | NUMERIC (3) | Contains the unique number representing the domain |
| 5 | FORECAST_SALES |  |  | Y | NUMERIC (12,4) | This field contains the forecasted sales for the given sku/store/date combination. |
| 6 | FORECAST_STD_DEV |  |  |  | NUMERIC (12,4) | This field contains the standard deviation value for the given sku/store/date combination. This value represents the confidence level in the sales forecast. This field is used in the safety stock calculations for the Dynamic replenishment method. |

---

## Table: FORECAST_REBUILD

**Description:** This table contains one record for each forecasted SKU/store relationship that was sent to Oracle Retail from Oracle Retail Demand Forecasting (RDF). The records in this table are summarized by dept/class/subclass and store for the purposes of rolling up specific records in this department, class and subclass sales history tables.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | DOMAIN_ID | P |  | Y | NUMERIC (3) | This field contains the unique number representing the domain. This domain number is used when interfacing data to external systems using domains. |

---

## Table: IF_RPM_SMOOTHED_AVG

**Description:** This table is used by the Oracle Retail Price Management module (RPM) to assist in the calculation of price index information. It provides a place to store daily smoothed average data at an item/store level. The price index calculation modules will read off this table and delete the read data to ensure that the table does not grow out of proportion. This table must be populated manually.

### Columns
| No | Column Name | PK | FK | Mandatory | Data Type | Description |
|---|---|---|---|---|---|---|
| 1 | ITEM | P |  | Y | VARCHAR (25) | This field stores the item for which the smoothed average data applies to. |
| 2 | STORE | P |  | Y | NUMERIC (10) | This field stores the store for which the smoothed average data applies to. |
| 3 | MON_SMOOTHED_AVG |  |  | Y | NUMERIC (12,4) | This field stores the smoothed average data for the item/store on Monday. |
| 4 | MON_COUNTER |  |  | Y | NUMERIC (5) | Indicates the weight of the current mon_smoothed_avg value and will be compared when maintaining the smoothed average. |
| 5 | TUE_SMOOTHED_AVG |  |  | Y | NUMERIC (12,4) | This field stores the smoothed average data for the item/store on Tuesday. |
| 6 | TUE_COUNTER |  |  | Y | NUMERIC (5) | Indicates the weight of the current tue_smoothed_avg value and will be compared when maintaining the smoothed average. |
| 7 | WED_SMOOTHED_AVG |  |  | Y | NUMERIC (12,4) | This field stores the smoothed average data for the item/store on Wednesday. |
| 8 | WED_COUNTER |  |  | Y | NUMERIC (5) | Indicates the weight of the current wed_smoothed_avg value and will be compared when maintaining the smoothed average. |
| 9 | THU_SMOOTHED_AVG |  |  | Y | NUMERIC (12,4) | This field stores the smoothed average data for the item/store on Thursday. |
| 10 | THU_COUNTER |  |  | Y | NUMERIC (5) | Indicates the weight of the current thu_smoothed_avg value and will be compared when maintaining the smoothed average. |
| 11 | FRI_SMOOTHED_AVG |  |  | Y | NUMERIC (12,4) | This field stores the smoothed average data for the item/store on Friday. |
| 12 | FRI_COUNTER |  |  | Y | NUMERIC (5) | Indicates the weight of the current fri_smoothed_avg value and will be compared when maintaining the smoothed average. |
| 13 | SAT_SMOOTHED_AVG |  |  | Y | NUMERIC (12,4) | This field stores the smoothed average data for the item/store on Saturday. |
| 14 | SAT_COUNTER |  |  | Y | NUMERIC (5) | Indicates the weight of the current sat_smoothed_avg value and will be compared when maintaining the smoothed average. |
| 15 | SUN_SMOOTHED_AVG |  |  | Y | NUMERIC (12,4) | This field stores the smoothed average data for the item/store on Sunday. |
| 16 | SUN_COUNTER |  |  | Y | NUMERIC (5) | Indicates the weight of the current sun_smoothed_avg value and will be compared when maintaining the smoothed average. |
| 17 | TOTAL_SMOOTHED_AVG |  |  | Y | NUMERIC (12,4) | The sum of the smoothed averages for this store and item. |
