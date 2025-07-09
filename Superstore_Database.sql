CREATE DATABASE superstore;
USE superstore;

SHOW TABLES;

SELECT COUNT(*) FROM orders_cleaned;
SELECT COUNT(*) FROM People;
SELECT COUNT(*) FROM returns;


SELECT * FROM orders_cleaned LIMIT 5;
SELECT * FROM returns LIMIT 5;
SELECT * FROM people LIMIT 5;


DESCRIBE orders_cleaned;

-- A. Sales & Profit Analysis

-- Highest Sales by Category
SELECT 
    Category,
    ROUND (SUM(Sales)) AS Total_Sales
FROM orders_cleaned
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Total Sales, Profit, and Quantity
 SELECT 
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM orders_cleaned;

-- Top 10 Products by Sales
SELECT 
    `Product Name`, 
    SUM(Sales) AS Total_Sales
FROM orders_cleaned
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- State & Region Wise Sales & Profit
SELECT Region, State, 
        Sum(Sales) AS Total_Sales, 
        Sum(Profit) AS Total_Profit
FROM orders_cleaned
group by State, Region
ORDER By Region, Total_Sales DESC;

-- REGION wise Total Sales
SELECT Region, round(Sum(Sales),2) AS Total_Sales
FROM orders_Cleaned
GROUP BY Region
order by Total_Sales DESC;
	
--  Top 10 Customers by Profit
SELECT `Customer Name` , Sum(Profit) AS Total_Profit
FROM orders_Cleaned
group by `Customer Name`
order by Total_Profit DESC
Limit 10;

-- Max Profit per Product: 
 
SELECT `Product Name`,
max(Profit) AS Max_Profit
FROM orders_Cleaned
GROUP BY `Product Name`
order by Max_Profit  DESC
LIMIT 5;
   
-- Total Return   
   
SELECT count(`Order ID`)
FROM Returns;

-- Most Returned Sub-category
SELECT 
    `Sub-Category`, 
    COUNT(returns.`Order ID`)
FROM returns
JOIN orders_cleaned ON returns.`Order ID` = orders_cleaned.`Order ID`
GROUP BY `Sub-Category`
ORDER BY COUNT(returns.`Order ID`) DESC
LIMIT 5;

SELECT 
    YEAR(`Order Date`),
    ROUND(SUM(Sales), 2) AS Total_Sales ,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders_cleaned
GROUP BY YEAR(`Order Date`)
ORDER BY YEAR(`Order Date`);

--  Monthly Sales Trend
SELECT 
    DATE_FORMAT(`Order Date`, '%Y-%m') AS Order_Month,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders_cleaned
GROUP BY Order_Month
ORDER BY Order_Month;

-- Profit Contribution by State

SELECT 
 State,
 ROUND(sum(profit),2) AS Total_Profit,
 Round((SUM(Profit)  / (SELECT SUM(Profit) FROM  orders_cleaned)) *100,2) AS Profit_Contribution_Percent
 FROM orders_cleaned
 GROUP BY State
 ORDER BY Total_Profit DESC;

      
	                       -- Joins--
    
  -- Join orders with returns — to know which orders were returned  
    
SELECT 
    o.`Order ID`,
    o.`Product Name`,
    o.Profit,
    (SELECT COUNT(DISTINCT returns.`Order ID`)
     FROM returns ) AS Total_Returned_Orders
FROM orders_cleaned o
inner JOIN returns ON o.`Order ID` = returns.`Order ID`
order by o.profit DESC;

-- Join orders with people — to know the manager of each region

SELECT 
    o.`Order ID`,
    o.`Region`,
    p.`Person` AS Manager,
    o.`Sales`,
    o.`Profit`
FROM orders_cleaned o
LEFT JOIN people p ON o.`Region` = p.`Region`;

-- Join all three tables — orders + returns + manager

SELECT 
    o.`Order ID`,
    o.`Product Name`,
    o.`Region`,
    p.`Person` AS Manager,
    r.`Returned`,
    o.`Profit`
FROM orders_cleaned o
LEFT JOIN people p ON o.`Region` = p.`Region`
LEFT JOIN returns r ON o.`Order ID` = r.`Order ID`;

-- Top Performing Managers (Sales & Profit)

SELECT
 p.person AS Manager,
 SUM(o.Sales) AS Total_Sales,
 SUM(o.Profit) AS Total_Profit
 FROM orders_cleaned o
 JOIN People p ON O.Region=p.Region
 GROUP BY P.Person
 ORDER BY Total_Profit DESC;
 
 
 -- "Return Rate Analysis by Manager (Based on Region)

SELECT 
    p.Person AS Manager,
    COUNT(DISTINCT o.`Order ID`) AS Total_Orders,
    COUNT(DISTINCT r.`Order ID`) AS Returned_Orders,
    ROUND(COUNT(DISTINCT r.`Order ID`) / COUNT(DISTINCT o.`Order ID`) * 100, 2) AS Return_Rate_Percent
FROM orders_cleaned o
LEFT JOIN people p ON o.Region = p.Region
LEFT JOIN returns r ON o.`Order ID` = r.`Order ID`
GROUP BY p.Person
ORDER BY Return_Rate_Percent DESC;




