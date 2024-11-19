USE Walmart;  -- Switch to the desired database

SELECT Product_ID,Purchase_Count,Age
INTO Top10Product_ID
FROM ( SELECT 
   TOP 10 Product_ID,Age,
    COUNT(*) AS Purchase_Count
FROM 
    dbo.walmart
GROUP BY 
    Product_ID,Age
ORDER BY 
    Purchase_Count DESC ) t

DROP TABLE  Top10Product_ID

SELECT *
INTO Prod_Tot_Revenue
FROM (
SELECT 
  Distinct Product_ID,
    SUM(Purchase) AS Total_Revenue,
    RANK() OVER (ORDER BY SUM(Purchase) DESC) AS Revenue_Rank
FROM 
    dbo.walmart
GROUP BY 
    Product_ID
	)T

DROP TABLE  Prod_Tot_Revenue
SELECT *
INTO Products_Demographics
FROM (
SELECT 
    Age,
    Gender,
    Product_ID,
    COUNT(*) AS Purchase_Count
FROM 
dbo.walmart
GROUP BY 
    Age, Gender, Product_ID
--ORDER BY Purchase_Count DESC
	) t
DROP Table Products_Demographics
