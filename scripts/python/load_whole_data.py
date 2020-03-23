#!/usr/bin/env python
# coding: utf-8

# In[66]:


from google.cloud import bigquery
from google.oauth2 import service_account
import pandas as pd
import os
from datetime import datetime 


# Constants


MAX_N_ROWS_PER_FILE = 1_000_000 # max number of rows per one csv
PATH = os.path.join("..","..",'data','raw') # path to raw data folder
CREDS_PATH = os.path.join("..","..","misc","gc_creds.json") # path to a file with credentials



# Functions


def get_file_name(num):
    return os.path.join(PATH,f'data_{num}.csv')

def write_file(file,current_file_row_num,row_num):
    print("Writing file:")
    print("\tstart writing time:",datetime.now())
    pd.DataFrame(data).to_csv(file,index=False)
    print("\tstop writing time:",datetime.now())
    print("lines written:",current_file_row_num-1, "total written:", row_num)
    


# BigQuery Client creation

print("BigQuery Client creation")
credentials = service_account.Credentials.from_service_account_file(CREDS_PATH)
project_id = 'hadooplearning-222811'
client = bigquery.Client(credentials= credentials,project=project_id)

# Loading Data
print("Querying data")

sql = "SELECT * FROM `bigquery-public-data.iowa_liquor_sales.sales`"
query_job = client.query(sql)
rows = query_job.result()

print("Writing Data To Files")

data = []
file_num = 1
row_num = 0
current_file_row_num = 1
file = get_file_name(file_num)

for row in rows:
    
    data.append({k:v for k,v in row.items()})
    current_file_row_num += 1
    row_num += 1
    if current_file_row_num >= MAX_N_ROWS_PER_FILE:
        
        write_file(file,current_file_row_num,row_num)
        
        file_num += 1
        file = get_file_name(file_num)
        current_file_row_num = 1
        data = []
    
write_file(file,current_file_row_num,row_num)
        



