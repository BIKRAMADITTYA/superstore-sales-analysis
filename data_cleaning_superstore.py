import pandas as pd
import numpy as np


# Load all sheets
df_order= pd.read_csv(r"C:\Users\admin\Desktop\Superstore dataset\orders.csv")
df_people= pd.read_csv(r"C:\Users\admin\Desktop\Superstore dataset\people.csv")
df_returns= pd.read_csv(r"C:\Users\admin\Desktop\Superstore dataset\returns.csv")   


# Check for missing values
print("Missing values before filling:\n", df_order.isnull().sum())

print("Missing values before filling:\n", df_returns.isnull().sum())

#Check which rows have missing Postal Codes
missing_postal = df_order[df_order['Postal Code'].isnull()]
print(missing_postal[['Order ID', 'City', 'State', 'Postal Code']])


# Fill missing Postal Codes with a default value
df_order['Postal Code'] = df_order['Postal Code'].fillna('05401')



# Check for missing values after filling
print("Missing values After filling:\n", df_order.isnull().sum())

# Save the cleaned DataFrame to a new CSV file
df_order.to_csv(r"C:\Users\admin\Desktop\Superstore dataset\orders_cleaned.csv", index=False)


