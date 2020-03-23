SELECT 'Stats' as series_name
     , count(invoice_and_item_number) total_rows
     , count(distinct invoice_and_item_number) distinct_invoice_and_item_number_values
     , count(distinct date) days_tracked
     , min(date) earliest_day_tracked
     , max(date) latest_day_tracked
     , date_diff(max(date),min(date),DAY) time_period_tracked
     , count(date) * 1.0 / count(invoice_and_item_number) date_filled
     , count(distinct store_number) store_numbers_countd
     , count(store_number) *1.0 / count(invoice_and_item_number) store_numbers_filled
     , count(distinct store_name) store_names_countd
     , count(store_name) *1.0 / count(invoice_and_item_number) store_names_filled
     , count(distinct address) address_countd
     , count(address) *1.0 / count(invoice_and_item_number) address_filled
     , count(distinct city) city_countd
     , count(city) *1.0 / count(invoice_and_item_number) city_filled
     , count(distinct zip_code) zip_code_countd
     , count(zip_code) *1.0 / count(invoice_and_item_number) zip_code_filled
     , count(distinct store_location) store_location_countd
     , count(store_location) *1.0 / count(invoice_and_item_number) store_location_filled
     , count(distinct county_number) county_number_countd
     , count(county_number) *1.0 / count(invoice_and_item_number) county_number_filled
     , count(distinct county) county_countd
     , count(county) *1.0 / count(invoice_and_item_number) county_filled
     , count(distinct category) category_countd
     , count(category) *1.0 / count(invoice_and_item_number) category_filled
     , count(distinct category_name) category_name_countd
     , count(category_name) *1.0 / count(invoice_and_item_number) category_name_filled
     , count(distinct vendor_number) vendor_number_countd
     , count(vendor_number) *1.0 / count(invoice_and_item_number) vendor_number_filled
     , count(distinct vendor_name) vendor_name_countd
     , count(vendor_name) *1.0 / count(invoice_and_item_number) vendor_name_filled
     , count(distinct item_number) item_number_countd
     , count(item_number) *1.0 / count(invoice_and_item_number) item_number_filled
     , count(distinct item_description) item_description_countd
     , count(item_description) *1.0 / count(invoice_and_item_number) item_description_filled
     
     , count(distinct pack) pack_countd
     , count(pack) *1.0 / count(invoice_and_item_number) pack_filled
     , avg(pack*1.0) avg_pack_size
     , min(pack*1.0) min_pack_size
     , max(pack*1.0) max_pack_size
     , STDDEV_SAMP(pack*1.0) stddev_pack
         
     , count(distinct bottle_volume_ml) bottle_volume_ml_countd
     , count(bottle_volume_ml) *1.0 / count(invoice_and_item_number) bottle_volume_ml_filled
     , avg(bottle_volume_ml*1.0) avg_bottle_volume_ml
     , min(bottle_volume_ml*1.0) min_bottle_volume_ml
     , max(bottle_volume_ml*1.0) max_bottle_volume_ml
     , STDDEV_SAMP(bottle_volume_ml*1.0) stddev_bottle_volume_ml
     

     , count(state_bottle_cost) *1.0 / count(invoice_and_item_number) state_bottle_cost_filled
     , avg(state_bottle_cost*1.0) avg_state_bottle_cost
     , min(state_bottle_cost*1.0) min_state_bottle_cost
     , max(state_bottle_cost*1.0) max_state_bottle_cost
     , STDDEV_SAMP(state_bottle_cost*1.0) stddev_state_bottle_cost
 

     , count(state_bottle_retail) *1.0 / count(invoice_and_item_number) state_bottle_retail_filled
     , avg(state_bottle_retail*1.0) avg_state_bottle_retail
     , min(state_bottle_retail*1.0) min_state_bottle_retail
     , max(state_bottle_retail*1.0) max_state_bottle_retail
     , STDDEV_SAMP(state_bottle_retail*1.0) stddev_state_bottle_retail
 
     , count(distinct bottles_sold) bottles_sold_countd
     , count(bottles_sold) *1.0 / count(invoice_and_item_number) bottles_sold_filled
     , avg(bottles_sold*1.0) avg_bottles_sold
     , min(bottles_sold*1.0) min_bottles_sold
     , max(bottles_sold*1.0) max_bottles_sold
     , STDDEV_SAMP(bottles_sold*1.0) stddev_bottles_sold
 
     , count(distinct sale_dollars) sale_dollars_countd
     , count(sale_dollars) *1.0 / count(invoice_and_item_number) sale_dollars_filled
     , avg(sale_dollars*1.0) avg_sale_dollars
     , min(sale_dollars*1.0) min_sale_dollars
     , max(sale_dollars*1.0) max_sale_dollars
     , STDDEV_SAMP(sale_dollars*1.0) stddev_sale_dollars
 
     , count(distinct volume_sold_liters) volume_sold_liters_countd
     , count(volume_sold_liters) *1.0 / count(invoice_and_item_number) volume_sold_liters_filled
     , avg(volume_sold_liters*1.0) avg_volume_sold_liters
     , min(volume_sold_liters*1.0) min_volume_sold_liters
     , max(volume_sold_liters*1.0) max_volume_sold_liters
     , STDDEV_SAMP(volume_sold_liters*1.0) stddev_volume_sold_liters
 
     , count(distinct volume_sold_gallons) volume_sold_gallons_countd
     , count(volume_sold_gallons) *1.0 / count(invoice_and_item_number) volume_sold_gallons_filled
     , avg(volume_sold_gallons*1.0) avg_volume_sold_gallons
     , min(volume_sold_gallons*1.0) min_volume_sold_gallons
     , max(volume_sold_gallons*1.0) max_volume_sold_gallons
     , STDDEV_SAMP(volume_sold_gallons*1.0) stddev_volume_sold_gallons
 FROM `bigquery-public-data.iowa_liquor_sales.sales`
 GROUP BY 1