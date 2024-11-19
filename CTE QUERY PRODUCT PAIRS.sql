CREATE TABLE Top_Product_Pairs (
    Product_1 INT,
    Product_2 INT,
    Pair_Frequency INT
);
WITH RankedPairs AS (
    SELECT 
        ws1.Product_ID AS Product_1,
        ws2.Product_ID AS Product_2,
        COUNT(*) AS Pair_Frequency,
        ROW_NUMBER() OVER (PARTITION BY ws1.Product_ID, ws2.Product_ID ORDER BY COUNT(*) DESC) AS RowNum
    FROM 
        dbo.walmart ws1
    JOIN 
        dbo.walmart ws2
    ON 
        ws1.User_ID = ws2.User_ID 
        AND ws1.Product_ID < ws2.Product_ID
    GROUP BY 
        ws1.Product_ID, ws2.Product_ID
)
INSERT INTO Top_Product_Pairs (Product_1, Product_2, Pair_Frequency)
SELECT 
    Product_1,
    Product_2,
    Pair_Frequency
FROM 
    RankedPairs
WHERE 
    RowNum <= 5;
