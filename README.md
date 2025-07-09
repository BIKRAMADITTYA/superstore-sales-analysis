# 📊 Superstore Sales Analysis Project

An end-to-end data analytics project using **Python**, **MySQL**, and **Power BI** to uncover actionable business insights from the Superstore dataset.

---

## 🔄 Project Workflow

1. ✅ Data cleaning and preprocessing using Python
2. ✅ SQL database creation, analysis, and business insights
3. ✅ Interactive dashboard development using Power BI (connected via ODBC)

---

## 📁 Project Files

| File | Description |
|------|-------------|
| [`Superstore Dataset(RAW).xlsx`](https://github.com/BIKRAMADITTYA/superstore-sales-analysis/blob/main/Superstore%20Dataset(RAW).xlsx) | Raw Excel dataset |
| [`data_cleaning_superstore.py`](https://github.com/BIKRAMADITTYA/superstore-sales-analysis/blob/main/data_cleaning_superstore.py) | Python script for cleaning and export |
| [`orders_cleaned.csv`](https://github.com/BIKRAMADITTYA/superstore-sales-analysis/blob/main/orders_cleaned.csv) | Cleaned dataset after preprocessing |
| [`people.csv`](https://github.com/BIKRAMADITTYA/superstore-sales-analysis/blob/main/people.csv), [`returns.csv`](https://github.com/BIKRAMADITTYA/superstore-sales-analysis/blob/main/returns.csv) | Lookup and return tables |
| [`Superstore_Database.sql`](https://github.com/BIKRAMADITTYA/superstore-sales-analysis/blob/main/Superstore_Database.sql) | SQL queries and schema |
| [`Superstore_Sales_Analysis Dashboard.pbix`](https://github.com/BIKRAMADITTYA/superstore-sales-analysis/blob/main/Superstore_Sales_Analysis%20Dashboard.pbix) | Power BI dashboard file |
| ![Dashboard Screenshot](https://github.com/BIKRAMADITTYA/superstore-sales-analysis/blob/main/Superstore%20Data%20Analysis%20Dashboard.png?raw=true) | Final dashboard preview |


---

## 🧹 Data Cleaning: Missing Value Handling

Python was used to clean the raw dataset. The only missing values were in the `Postal Code` column. All missing postal codes from Burlington, Vermont were filled with the default value `05401`.

### 📄 Code Snippet:

```python
import pandas as pd

# Load data
df_order = pd.read_csv("orders.csv")
df_people = pd.read_csv("people.csv")
df_returns = pd.read_csv("returns.csv")

# Check missing values
print("Missing values before filling:\n", df_order.isnull().sum())

# Fill missing postal code
df_order['Postal Code'] = df_order['Postal Code'].fillna('05401')

# Confirm missing values handled
print("Missing values after filling:\n", df_order.isnull().sum())

# Save cleaned data
df_order.to_csv("orders_cleaned.csv", index=False)
```

### 🔢 Output:

**Before Filling:** `Postal Code`: 11 missing values
**After Filling:** All missing values resolved (0 remaining)

---

## 📃 SQL Analysis Highlights

The cleaned data was imported into **MySQL** and explored with SQL queries. Key analysis included:

* 📌 **Top 10 Products** by Sales and Profit
* 📍 **State & Region-wise Sales and Profit**
* 📆 **Monthly and Yearly Sales Trends**
* 🔄 **Returned Orders Analysis** (joins with returns table)
* 👨‍💼 **Manager-wise Performance** (joins with people table)

🔹 [View SQL Script](https://github.com/BIKRAMADITTYA/superstore-sales-analysis/blob/main/Superstore_Database.sql)

---

## 📊 Power BI Dashboard

The dashboard was created using Power BI connected to MySQL via ODBC.

### 📅 Dashboard Features

* 📆 Monthly Sales & Profit trends (2016–2019)
* 🛍️ Top 10 products by sales
* 🗺️ State-wise performance map
* 📦 Sales by ship mode
* 🧑‍💼 Manager-wise regional filter
* 🎯 KPI cards: Total Sales & Profit
* 🔁 Return rate insights (SQL-based)
* 📊 Category-wise sales breakdown
* 🧠 Year selection slicer
* 📈 Monthly profit margin trend
* 📌 Fully interactive & responsive visuals
* 🖼️ Clean dark-themed layout


### 🧩 Download Dashboard:

➡️ **[Download Power BI Dashboard (.pbix)](https://github.com/BIKRAMADITTYA/superstore-sales-analysis/blob/main/Superstore_Sales_Analysis%20Dashboard.pbix)**


### 📸 Dashboard Screenshot:

![Superstore Data Analysis Dashboard](https://github.com/BIKRAMADITTYA/superstore-sales-analysis/blob/main/Superstore%20Data%20Analysis%20Dashboard.png?raw=true)

---

## 📈 Key Takeaways

* Efficient data cleaning helped resolve inconsistencies.
* SQL queries extracted valuable performance metrics.
* Power BI dashboard provided powerful business insights.
* Integrated returns and manager analysis enhanced decision-making.

---

**Author:** [Bikramadittya Nandan](https://github.com/BIKRAMADITTYA)

**Repository:** [Superstore Sales Analysis](https://github.com/BIKRAMADITTYA/superstore-sales-analysis)
