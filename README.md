# 📊 Superstore Sales Analysis Project

An end-to-end data analytics project using **Python**, **MySQL**, and **Power BI** to uncover actionable business insights from the Superstore dataset.

---

## 🔄 Project Workflow

1. ✅ Data cleaning and preprocessing using Python
2. ✅ SQL database creation, analysis, and business insights
3. ✅ Interactive dashboard development using Power BI (connected via ODBC)

---

## 🛠️ Tools & Technologies Used

- **Python** – Data cleaning and transformation (`pandas`, `numpy`)
- **MySQL** – Data loading and SQL-based analytics
- **Power BI** – Dashboard visualization and reporting
- **Excel** – Source dataset
- **ODBC** – Power BI to MySQL integration

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

## 🔄 ETL Process Overview

This project followed a manual ETL (Extract, Transform, Load) pipeline using Python and MySQL:

- **Extract**: Raw Excel files (`orders`, `returns`, `people`) were read using `pandas`.
- **Transform**:
  - Missing values handled (e.g. filled 11 missing postal codes with '05401')
  - Data normalized and grouped by key metrics (product, region, time)
- **Load**:
  - Cleaned dataset exported to `orders_cleaned.csv`
  - Loaded into MySQL for further analysis via SQL queries and joins

The cleaned data was then used as a source for Power BI dashboard creation.
---


## 🗃️ SQL Analysis Achievements

Performed SQL analysis using MySQL on cleaned Superstore data to uncover key business insights. The following are some key highlights from the queries:

### 📌 Key Insights Extracted:

- 🔝 **Top 10 Products by Sales**
- 🧑‍💼 **Top 10 Customers by Profit**
- 🗺️ **State & Region-wise Sales and Profit Distribution**
- 📆 **Monthly and Yearly Sales & Profit Trends (2016-2019)**
- 🔁 **Return Rate Analysis by Sub-Category and Manager**
- 🏆 **Top Performing Managers** based on region-wise profit and sales
- 📦 **Most Returned Sub-Categories**
- 💼 **Profit Contribution % by State**
- 📉 **Total Quantity, Sales, Profit** 
- 🔄 **Join Analysis:**  
  - `orders_cleaned` ⬌ `returns` — to analyze returned orders  
  - `orders_cleaned` ⬌ `people` — to identify regional managers  
  - All 3 tables joined for holistic sales-return-manager overview

📂 View Full SQL File:  
➡️ [`Superstore_Database.sql`](https://github.com/BIKRAMADITTYA/superstore-sales-analysis/blob/main/Superstore_Database.sql)


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
## 🎓 What I Learned

- Built end-to-end ETL and BI workflow from raw Excel to final dashboard
- Improved skills in data profiling, SQL joins, and visual storytelling
- Gained hands-on experience in integrating Power BI with SQL

---
## 📈 Key Takeaways

* Efficient data cleaning helped resolve inconsistencies.
* SQL queries extracted valuable performance metrics.
* Power BI dashboard provided powerful business insights.
* Integrated returns and manager analysis enhanced decision-making.

---
🧑‍💻 Developed by: Bikramadittya Nandan
🔗 LinkedIn: linkedin.com/in/bikramadittya-nandan-7b6285151
📂 Project Repository: Superstore Sales Analysis
