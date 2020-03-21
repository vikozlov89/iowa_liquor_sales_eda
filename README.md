# EDA

Data source: [iowa_liqor_sales](https://console.cloud.google.com/marketplace/details/iowa-department-of-commerce/iowa-liquor-sales) 

This dataset contains every wholesale purchase of liquor in the State of Iowa by retailers for sale to individuals since January 1, 2012. The State of Iowa controls the wholesale distribution of liquor intended for retail sale, which means this dataset offers a complete view of retail liquor sales in the entire state. The dataset contains every wholesale order of liquor by all grocery stores, liquor stores, convenience stores, etc., with details about the store and location, the exact liquor brand and size, and the number of bottles ordered.

In addition to being an excellent dataset for analyzing liquor sales, this is a large and clean public dataset of retail sales data. It can be used to explore problems like stockout prediction, retail demand forecasting, and other retail supply chain problems.

## Data structure

The dataset has 24 fields:
* **15** string fields
* **5** float fields
* **3** int fields
* **1** date field

|Field|Data Type|Mode|Description|
|---|---|---|---|
|invoice_and_item_number|STRING|NULLABLE|Concatenated invoice and line number associated with the liquor order. This provides a unique identifier for the individual liquor products included in the store order.|
|date|DATE|NULLABLE|Date of order|
|store_number|STRING|NULLABLE|Unique number assigned to the store who ordered the liquor.|
|store_name|STRING|NULLABLE|Name of store who ordered the liquor.|
|address|STRING|NULLABLE|Address of store who ordered the liquor.|
|city|STRING|NULLABLE|City where the store who ordered the liquor is located|
|zip_code|STRING|NULLABLE|Zip code where the store who ordered the liquor is located|
|store_location|STRING|NULLABLE|Location of store who ordered the liquor. The Address, City, State and Zip Code are geocoded to provide geographic coordinates. \nAccuracy of geocoding is dependent on how well the address is interpreted and the completeness of the reference data used.|
|county_number|STRING|NULLABLE|Iowa county number for the county where store who ordered the liquor is located|
|county|STRING|NULLABLE|County where the store who ordered the liquor is located|
|category|STRING|NULLABLE|Category code associated with the liquor ordered|
|category_name|STRING|NULLABLE|Category of the liquor ordered.|
|vendor_number|STRING|NULLABLE|The vendor number of the company for the brand of liquor ordered|
|vendor_name|STRING|NULLABLE|The vendor name of the company for the brand of liquor ordered|
|item_number|STRING|NULLABLE|Item number for the individual liquor product ordered.|
|item_description|STRING|NULLABLE|Description of the individual liquor product ordered.|
|pack|INTEGER|NULLABLE|The number of bottles in a case for the liquor ordered|
|bottle_volume_ml|INTEGER|NULLABLE|Volume of each liquor bottle ordered in milliliters.|
|state_bottle_cost|FLOAT|NULLABLE|The amount that Alcoholic Beverages Division paid for each bottle of liquor ordered|
|state_bottle_retail|FLOAT|NULLABLE|The amount the store paid for each bottle of liquor ordered|
|bottles_sold|INTEGER|NULLABLE|The number of bottles of liquor ordered by the store|
|sale_dollars|FLOAT|NULLABLE|Total cost of liquor order (number of bottles multiplied by the state bottle retail)|
|volume_sold_liters|FLOAT|NULLABLE|Total volume of liquor ordered in liters. (i.e. (Bottle Volume (ml) x Bottles Sold)/1,000)|
|volume_sold_gallons|FLOAT|NULLABLE|Total volume of liquor ordered in gallons. (i.e. (Bottle Volume (ml) x Bottles Sold)/3785.411784)|

## Initial Data Exploration

