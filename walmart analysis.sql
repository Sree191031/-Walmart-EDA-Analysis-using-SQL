Select * from Walmart.dbo.walmart 

--DataSet Size
Select 
count(*) as Total_Rows
FROM dbo.walmart

SELECT COUNT(*) As Total_Colunms
FROM sys.columns
WHERE object_id = OBJECT_ID('dbo.walmart');

--1.Customer Segmentaion 
--A.Segment Customers Based on Demographic Data
SELECT 
    Age,
    Gender,
    Occupation,
    Marital_Status,
    COUNT(DISTINCT User_ID) AS Customer_Count,
    AVG(Purchase) AS Avg_Spend
FROM 
    dbo.walmart
GROUP BY 
    Age, Gender, Occupation, Marital_Status;

--B.Identify High-Spending Segments by Demographic
SELECT 
    Age,
    Gender,
    Product_Category,
    SUM(Purchase) AS Total_Spend
FROM 
    dbo.walmart
GROUP BY 
    Age, Gender, Product_Category
ORDER BY 
    Total_Spend DESC;


--2.Product Popularity
--A.Identify Most Purchased Products Overall
SELECT 
   TOP 10 Product_ID,
    COUNT(*) AS Purchase_Count
FROM 
    dbo.walmart
GROUP BY 
    Product_ID
ORDER BY 
    Purchase_Count DESC
--LIMIT 10;

--B.Most Purchased Products by Demographics
SELECT 
    Age,
    Gender,
    Product_ID,
    COUNT(*) AS Purchase_Count
FROM 
dbo.walmart
GROUP BY 
    Age, Gender, Product_ID
ORDER BY 
    Purchase_Count DESC;

--C.Top 10 by Age

SELECT 
    top 10  Product_ID,
    age,
    COUNT(*) AS Purchase_Count
FROM 
    dbo.walmart
GROUP BY 
    Age, Product_ID
ORDER BY 
    Age, Purchase_Count DESC

--D.Revenue Contribution by Product
SELECT 
    Product_ID,
    SUM(Purchase) AS Total_Revenue
FROM 
    dbo.walmart
GROUP BY 
    Product_ID
ORDER BY 
    Total_Revenue DESC;

--3.Sales By City Category

SELECT 
    City_Category,
    SUM(Purchase) AS Total_Sales,
    COUNT(DISTINCT User_ID) AS Unique_Customers
FROM 
   dbo.walmart
GROUP BY 
    City_Category
ORDER BY 
    Total_Sales DESC;

--A.Average Sales by city category

SELECT 
    City_Category,
    AVG(Purchase) AS Avg_Purchase_Value
FROM 
    dbo.walmart
GROUP BY 
    City_Category;

--B.Identify High Value Cities

SELECT 
    City_Category,
    SUM(Purchase) AS Total_Sales
FROM 
   dbo.walmart
GROUP BY 
    City_Category
ORDER BY 
    Total_Sales DESC;

--4.Purchase Pattern Based On Stay Duration

SELECT 
    Stay_In_Current_City_Years,
    AVG(Purchase) AS Avg_Purchase,
    COUNT(DISTINCT User_ID) AS Customer_Count
FROM 
  dbo.walmart
GROUP BY 
    Stay_In_Current_City_Years
ORDER BY 
    Customer_Count Desc;

--A.Loyality for long term esidents 

SELECT 
    Stay_In_Current_City_Years,
    COUNT(DISTINCT User_ID) AS Unique_Customers
FROM 
   dbo.walmart
GROUP BY 
    Stay_In_Current_City_Years;

--B.Average spending

SELECT 
    Stay_In_Current_City_Years,
    AVG(Purchase) AS Avg_Spend
FROM 
   dbo.walmart
GROUP BY 
    Stay_In_Current_City_Years
ORDER BY 
    Stay_In_Current_City_Years;

--C.Segmenting Customers based on there stay duration

SELECT City_Category, 
       CASE 
           WHEN Stay_In_Current_City_Years <= '2' THEN 'New'
           ELSE 'Long-Term'
       END AS Customer_Status,
       AVG(CAST(Purchase AS BIGINT)) AS Average_Purchase
FROM dbo.walmart
GROUP BY City_Category, 
         CASE 
             WHEN Stay_In_Current_City_Years <= '2' THEN 'New'
             ELSE 'Long-Term'
         END
ORDER BY City_Category, Customer_Status;

--D.What is the trend of Purchase amounts for User_IDs who have increased their Stay_In_Current_City_Years?
SELECT User_ID, Stay_In_Current_City_Years, SUM(Purchase) AS Total_Purchase
FROM dbo.walmart
GROUP BY User_ID, Stay_In_Current_City_Years
ORDER BY User_ID, Stay_In_Current_City_Years;

--5.Average Purchase Value Analysis
--A.Average Purchase Amount per Customer

SELECT 
    User_ID,
    AVG(Purchase) AS Avg_Purchase_Value
FROM 
   dbo.walmart
GROUP BY 
    User_ID
ORDER BY 
    Avg_Purchase_Value DESC;

--B.Average Purcahse on per product Category
SELECT 
    Product_Category,
    AVG(Purchase) AS Avg_Purchase_Value
FROM 
   dbo.walmart
GROUP BY 
    Product_Category
ORDER BY 
    Avg_Purchase_Value DESC;

--C.Average Purchase Amount on Age Group 

SELECT 
    Age,
    AVG(Purchase) AS Avg_Purchase_Value
FROM 
   dbo.walmart
GROUP BY 
    Age
ORDER BY 
    Avg_Purchase_Value DESC;

--D.Avg purchase value on age grp and occupation

SELECT 
    Occupation,
    Age,
    AVG(Purchase) AS Avg_Spend
FROM 
   dbo.walmart
GROUP BY 
    Occupation, Age
ORDER BY 
    Avg_Spend DESC;


--E.High value customer segment 
SELECT 
    User_ID,
    AVG(CAST(Purchase as BIGINT)) AS Avg_Spend
FROM 
    dbo.walmart
GROUP BY 
    User_ID
HAVING 
   AVG(CAST(Purchase as BIGINT))> (SELECT AVG(CAST(Purchase as BIGINT)) FROM dbo.walmart);

--6.Gender based Sales Analysis
SELECT 
    Gender,
    Product_Category,
    AVG(Purchase) AS Avg_Spend,
    SUM(Purchase) AS Total_Spend
FROM 
   dbo.walmart
GROUP BY 
    Gender, Product_Category
ORDER BY 
    Gender, Total_Spend DESC;

--A.Top Categories by Gender

--What are the top Product_Category preferences for each Age group?
--Are there shifts in Product_Category preferences as customers age?

SELECT 
    Gender,
    Product_Category,
    COUNT(*) AS Purchase_Count
FROM 
    dbo.walmart
GROUP BY 
    Gender, Product_Category
ORDER BY 
    Gender, Purchase_Count DESC;

--B.Average Spend per Category by Gender

--Which Product_Category has the highest average Purchase among different Gender groups

SELECT 
    Gender,
    Product_Category,
    AVG(Purchase) AS Avg_Spend
FROM 
    dbo.walmart
GROUP BY 
    Gender, Product_Category
ORDER BY 
    Gender, Avg_Spend DESC;

--C.Understanding the Impact of Customer Age Progression on Spending Patterns

--How does the average Purchase amount change as customers move from one Age group to another?

SELECT Age, AVG(Purchase) AS Average_Purchase
FROM dbo.walmart
GROUP BY Age
ORDER BY Age;

--7.Product Category Insights

SELECT 
    Product_Category,
    SUM(Purchase) AS Total_Revenue,
    AVG(Purchase) AS Avg_Spend,
    COUNT(DISTINCT User_ID) AS Unique_Customers
FROM 
   dbo.walmart
GROUP BY 
    Product_Category
ORDER BY 
    Total_Revenue DESC;

--A.High Revenue Categories:

SELECT 
    Product_Category,
    SUM(Purchase) AS Total_Revenue
FROM 
    dbo.walmart
GROUP BY 
    Product_Category
ORDER BY 
    Total_Revenue DESC;

--B.Category Spending by Demographic:

SELECT 
    Age,
    Gender,
    Product_Category,
    SUM(Purchase) AS Total_Spend
FROM 
    dbo.walmart
GROUP BY 
    Age, Gender, Product_Category
ORDER BY 
    Total_Spend DESC;

--C.High-Spend Customers Top 10% High-Spend Customers:

SELECT TOP (
    SELECT CAST(COUNT(*) * 0.1 AS INT)
    FROM (SELECT DISTINCT User_ID FROM dbo.walmart) AS UserCount
) 
    User_ID,
    SUM(Purchase) AS Total_Spend
FROM 
    dbo.walmart
GROUP BY 
    User_ID
ORDER BY 
    Total_Spend DESC;

--Alternative Solution using NTILE Window Function 

WITH RankedUsers AS (
    SELECT 
        User_ID,
        SUM(Purchase) AS Total_Spend,
        NTILE(10) OVER (ORDER BY SUM(Purchase) DESC) AS PercentileRank
    FROM 
        dbo.walmart
    GROUP BY 
        User_ID
)
SELECT 
    User_ID,
    Total_Spend
FROM 
    RankedUsers
WHERE 
    PercentileRank = 1  -- Top 10% (Percentile 1)
ORDER BY 
    Total_Spend DESC;

--8.Impact oF Marital Status on spending

SELECT 
Marital_Status,
    AVG(CAST(Purchase AS BIGINT)) AS Avg_Spend,
    SUM(CAST(Purchase AS BIGINT)) AS Total_Spend,
    COUNT(DISTINCT User_ID) AS Unique_Customers
FROM 
    dbo.walmart
GROUP BY 
    Marital_Status
ORDER BY 
    Total_Spend DESC;

--A.What is the relationship between Marital_Status and average Purchase across different Product_Category?
SELECT Marital_Status, Product_Category, AVG(Purchase) AS Average_Purchase
FROM dbo.walmart
GROUP BY Marital_Status, Product_Category
ORDER BY Marital_Status, Average_Purchase DESC;

--B.AVERAGE SPEND ON MARTIAL STATUS 
SELECT 
    Marital_Status,
    Age,
    AVG(Purchase) AS Avg_Spend
FROM 
    dbo.walmart
GROUP BY 
    Marital_Status, Age
ORDER BY 
    Marital_Status, Age;

--9.Correlation between Occupation & Spending
SELECT 
    Occupation,
    AVG(Purchase) AS Avg_Spend,
    SUM(Purchase) AS Total_Spend
FROM 
   dbo.walmart
GROUP BY 
    Occupation
ORDER BY 
    Total_Spend DESC;

--A.Average Spend per Category by Occupation
SELECT 
    Occupation,
    Product_Category,
    AVG(Purchase) AS Avg_Spend
FROM 
    dbo.walmart
GROUP BY 
    Occupation, Product_Category
ORDER BY 
    Avg_Spend DESC;


--Evaluating Customer Satisfaction Using Proxy Metrics
--1.Repeat Purchase Analysis for High-Spend Customers
SELECT 
    Product_Category,
    Product_ID,
    COUNT(User_ID) AS Repeat_Purchase_Count
FROM 
    dbo.walmart
GROUP BY 
    Product_Category, Product_ID
HAVING 
    COUNT(User_ID)> 1
ORDER BY 
    Repeat_Purchase_Count DESC;

	
--A.Top 10 highest spenders
SELECT 
  TOP 10  User_ID,
    SUM(Purchase) AS Total_Spend
FROM 
   dbo.walmart
GROUP BY 
    User_ID
ORDER BY 
    Total_Spend DESC

--B.Repeate Product Purchase BY prdouct category

SELECT 
    Product_ID,
    Product_Category,
    COUNT(User_ID) AS Repeat_Purchase_Count
FROM 
    dbo.walmart
GROUP BY 
    Product_ID, Product_Category
HAVING 
   COUNT(User_ID) > 1
ORDER BY 
    Product_Category, Repeat_Purchase_Count DESC;

--C.Product Categories with Highest Repeat Purchases:

SELECT 
    Product_Category,
    COUNT(User_ID) AS Repeat_Purchase_Count
FROM 
    dbo.walmart
GROUP BY 
    Product_Category
HAVING 
    COUNT(User_ID)  > 1
ORDER BY 
    Repeat_Purchase_Count DESC;

--D.Top Products by Repeat Purchase Rate: Look at individual products that drive repeat purchases within each category.
SELECT 
    User_ID,
    Product_Category,
    COUNT(Product_ID) AS Repeat_Purchase_Count
FROM 
    dbo.walmart
GROUP BY 
    User_ID, Product_Category
HAVING 
    SUM(CAST(Purchase AS BIGINT)) > (SELECT AVG(CAST(Purchase AS BIGINT)) * 1.5 FROM dbo.walmart);  -- Adjust 1.5 multiplier as needed
 

--2.Customer Life Time value 
--A.Total Purchase Per user
SELECT 
    User_ID,
    SUM(Purchase) AS Total_Lifetime_Spend
FROM 
 dbo.walmart
GROUP BY 
    User_ID
ORDER BY 
    Total_Lifetime_Spend DESC;
--B Average Purchase per demographic group
SELECT 
    Age,
    Gender,
    Occupation,
    City_Category,
    AVG(Purchase) AS Average_Spend
FROM 
   dbo.walmart
GROUP BY 
    Age, Gender, Occupation, City_Category;

--C.Frequency of Purchases per User
SELECT 
    User_ID,
    COUNT(Product_ID) AS Purchase_Frequency
FROM 
    dbo.walmart
GROUP BY 
    User_ID
ORDER BY 
    Purchase_Frequency DESC;
    
--3.Market Basket Analysis for Cross-Selling and Upselling Opportunities
--Frequent Product Pairs
SELECT 
    ws1.Product_ID AS Product_1,
    ws2.Product_ID AS Product_2,
    COUNT(*) AS Pair_Frequency
FROM 
    dbo.walmart ws1
JOIN 
   dbo.walmart ws2
ON 
    ws1.User_ID = ws2.User_ID AND ws1.Product_ID < ws2.Product_ID
GROUP BY 
    ws1.Product_ID, ws2.Product_ID
ORDER BY 
    Pair_Frequency DESC;
--Category Pair Frequency

--Top 5 Product_Category combinations frequently bought together?
SELECT 

    ws1.Product_Category AS Category_1,
    ws2.Product_Category AS Category_2,
    COUNT(*) AS Pair_Frequency
FROM 
    dbo.walmart ws1
JOIN 
    dbo.walmart ws2
ON 
    ws1.User_ID = ws2.User_ID AND ws1.Product_Category < ws2.Product_Category
GROUP BY 
    ws1.Product_Category, ws2.Product_Category
ORDER BY 
    Pair_Frequency DESC;

--Alternative solutions

SELECT  COUNT(*) AS Frequency ,a.Product_Category AS Category_A, b.Product_Category AS Category_B
FROM dbo.walmart a
JOIN dbo.walmart b ON a.User_ID = b.User_ID AND a.Product_Category < b.Product_Category
GROUP BY a.Product_Category, b.Product_Category
ORDER BY Frequency DESC

--4. Price Sensitivity Analysis by Product and Demographic
--a. Purchase Variation by Demographic

	SELECT 
    Age,
    Gender,
    City_Category,
    Product_Category,
    STDEV(CAST(Purchase AS BIGINT)) AS Purchase_Variation,
    AVG(CAST(Purchase AS BIGINT)) AS Average_Purchase
FROM 
  dbo.walmart
GROUP BY 
    Age, Gender, City_Category, Product_Category
ORDER BY 
    Purchase_Variation DESC;

--b. Category Spending by Demographic
	SELECT 
    Product_Category,
    Age,
    Gender,
    City_Category,
    AVG(CAST(Purchase AS BIGINT)) AS Average_Spend
FROM 
    dbo.walmart
GROUP BY 
    Product_Category, Age, Gender, City_Category
ORDER BY 
    Average_Spend DESC;

--5.Dynamic Customer Segmentation and Profiling
--A.RFM Segementation ((Recency, Frequency, Monetary Value))
SELECT 
    User_ID,
    -- MAX(Purchase_Date) AS Last_Purchase_Date,
    COUNT(Product_ID) AS Purchase_Frequency,
    SUM(Purchase) AS Monetary_Value
    -- DATEDIFF(CURRENT_DATE, MAX(Purchase_Date)) AS Recency
FROM 
    dbo.walmart
GROUP BY 
    User_ID
ORDER BY 
    Purchase_Frequency DESC, Monetary_Value DESC;

--B.Product Category Variety per User
SELECT 
    User_ID,
    COUNT(DISTINCT Product_Category) AS Category_Variety
FROM 
    dbo.walmart
GROUP BY 
    User_ID
ORDER BY 
    Category_Variety DESC;

--C.Segment User_IDs based on their Purchase frequency and total Purchase amount
SELECT User_ID,
       COUNT(*) AS Purchase_Frequency,
       SUM(Purchase) AS Total_Purchase
FROM dbo.walmart
GROUP BY User_ID
ORDER BY Total_Purchase DESC, Purchase_Frequency DESC;

--D.Distinct customer segments when grouped by Age, Occupation, and City_Category
SELECT Age, Occupation, City_Category, COUNT(DISTINCT User_ID) AS User_Count
FROM DBO.walmart
GROUP BY Age, Occupation, City_Category
ORDER BY User_Count DESC;

--E.Which segments have the highest Purchase amounts and how are they distributed across Marital_Status?
SELECT Age, Occupation, City_Category, Marital_Status, SUM(Purchase) AS Total_Purchase
FROM dbo.walmart
GROUP BY Age, Occupation, City_Category, Marital_Status
ORDER BY Total_Purchase DESC;



