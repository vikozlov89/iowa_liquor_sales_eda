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
|invoice_and_item_number|STRING|NULLABLE|Concatenated invoice and line number associated with the liquor order. This provide    
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

Basic stats by variables achieved by [this query](https://github.com/vikozlov89/iowa_liquor_sales_eda/blob/master/scripts/sql/query_basic_columns_stats.sql)) allows to state the following:

* there is no problems with the key field, no duplicates or nulls (the deeper look shows that there is a small set (6 values: '3068313', '3789000', '3818000', '3818001', '4295S05', '4697000') of incorrectly filled keys)
* there are null values in such fields as city, address, zip code, county
* there are more store names than store numbers so there are either stores with the same nombers and different names or typos in store names or stores may change names without changing numbers
* there are surprisingly high values of max_bottle_volume_ml of 378 liters per bottle. 

|series_name|Stats|
|-----|-----|
|total_rows|18098417|
|distinct_invoice_and_item_number_values|18098417|
|days_tracked|1980|
|earliest_day_tracked|03.01.2012|
|latest_day_tracked|28.02.2020|
|time_period_tracked|2978|
|date_filled|1|
|store_numbers_countd|2330|
|store_numbers_filled|1|
|store_names_countd|2480|
|store_names_filled|1|
|address_countd|3584|
|address_filled|0,99559060883612|
|city_countd|832|
|city_filled|0,995590664089572|
|zip_code_countd|488|
|zip_code_filled|0,995588177684269|
|store_location_countd|1871|
|store_location_filled|0,903527197986431|
|county_number_countd|108|
|county_number_filled|0,991346922772306|
|county_countd|201|
|county_filled|0,991347033279208|
|category_countd|106|
|category_filled|0,999081853401874|
|category_name_countd|129|
|category_name_filled|0,998636179064721|
|vendor_number_countd|342|
|vendor_number_filled|0,999999723732744|
|vendor_name_countd|464|
|vendor_name_filled|0,999999834239646|
|item_number_countd|9102|
|item_number_filled|1|
|item_description_countd|8120|
|item_description_filled|1|
|pack_countd|27|
|pack_filled|1|
|avg_pack_size|12,2910451781501|
|min_pack_size|1|
|max_pack_size|336|
|stddev_pack|7,62950297286668|
|bottle_volume_ml_countd|55|
|bottle_volume_ml_filled|1|
|avg_bottle_volume_ml|917,057641063303|
|min_bottle_volume_ml|0|
|max_bottle_volume_ml|378000|
|stddev_bottle_volume_ml|674,450837992696|
|state_bottle_cost_filled|0,999999447465488|
|avg_state_bottle_cost|9,85801608119433|
|min_state_bottle_cost|0|
|max_state_bottle_cost|7680|
|stddev_state_bottle_cost|10,8431440687489|
|state_bottle_retail_filled|0,999999447465488|
|avg_state_bottle_retail|14,8027574780476|
|min_state_bottle_retail|0|
|max_state_bottle_retail|11520|
|stddev_state_bottle_retail|16,2646247750979|
|bottles_sold_countd|560|
|bottles_sold_filled|1|
|avg_bottles_sold|10,223405947603|
|min_bottles_sold|0|
|max_bottles_sold|15000|
|stddev_bottles_sold|27,2122449302559|
|sale_dollars_countd|27683|
|sale_dollars_filled|0,999999447465488|
|avg_sale_dollars|133,50086629779|
|min_sale_dollars|0|
|max_sale_dollars|279557,28|
|stddev_sale_dollars|456,331459703946|
|volume_sold_liters_countd|1272|
|volume_sold_liters_filled|1|
|avg_volume_sold_liters|9,11123815911634|
|min_volume_sold_liters|0|
|max_volume_sold_liters|15000|
|stddev_volume_sold_liters|32,8672607096162|
|volume_sold_gallons_countd|1498|
|volume_sold_gallons_filled|1|
|avg_volume_sold_gallons|2,40594910206787|
|min_volume_sold_gallons|0|
|max_volume_sold_gallons|3962,58|
|stddev_volume_sold_gallons|8,68265730109842|

To analyze data deeper we should make a sample. We can't just draw random rows as it will ignore the structure of invoices. So we have to get random invoices.

All invoice_and_item_number_values field values consist of three parts:

Invoice letter (S or I), invoice number (6 digits), item number (5 digits):

*S* *037317* *00008*

So to get random invoices we just will separate the invoice number by taking 7 chars from the left.
There are 290 rows of 18 millions with invoice numbers filled incorrectly with incorrect length and witout the first letter.

After having the invoice number field we can draw a random sample of 20% of invoices (script and some analysis [here](https://github.com/vikozlov89/iowa_liquor_sales_eda/blob/master/notebooks/Random Sample Creation.ipynb))

We should take into account that after the 26.08.2016 only some rare invoices are present and data after this date must be treated as incorrect.

![Unique Invoices Per Day](https://github.com/vikozlov89/iowa_liquor_sales_eda/blob/master/img/unique_invoices_per_day.png)

Some basic analysis you may find here (unfortunately, I have lack of time and can't finish the job properly, but I thing you may find my skills useful after taking a look at this [notebook](https://github.com/vikozlov89/iowa_liquor_sales_eda/blob/master/notebooks/Basic Analysis.ipynb)).

you may find data for analysis [here](https://drive.google.com/file/d/1AEPjMmqzP98xDKDP4eIgRonaVFMmVZYx/view?usp=sharing). Just copy it to data/processed folder




