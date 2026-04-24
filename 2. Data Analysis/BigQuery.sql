---Question 1 - Where Clause 
"SELECT
    retail_sales.*
FROM
    `project-b066d2d0-fe5d-4df9-b27.1989_18.Retail_Sales` AS retail_sales
WHERE
    EXTRACT(YEAR FROM retail_sales.Date) = 2023
ORDER BY
    retail_sales.Date;"

----Question 2 - Filtering + Condition
"SELECT
    sales.`Transaction ID`,
    sales.Date,
    sales.`Customer ID`,
    sales.Gender,
    sales.Age,
    sales.`Product Category`,
    sales.Quantity,
    sales.`Price per Unit`,
    sales.`Total Amount`
FROM
    `project-b066d2d0-fe5d-4df9-b27.1989_18.Retail_Sales` AS sales
WHERE
    sales.`Total Amount` > (
        SELECT
            AVG(sub.`Total Amount`)
        FROM
            `project-b066d2d0-fe5d-4df9-b27.1989_18.Retail_Sales` AS sub
    )
ORDER BY
    sales.Date;"

-----Question 3 
"SELECT
    SUM(sales.`Total Amount`) AS Total_Revenue
  FROM
    `project-b066d2d0-fe5d-4df9-b27.1989_18.Retail_Sales` AS sales"

---Question 4
"SELECT DISTINCT
    `Retail_Sales`.`Product Category` AS Product_Category
FROM
    `project-b066d2d0-fe5d-4df9-b27.1989_18.Retail_Sales` AS Retail_Sales;"

----Question 5
"SELECT
  Retail_Sales.`Product Category` AS Product_Category,
  SUM(Retail_Sales.Quantity) AS Total_Quantity
FROM
  `project-b066d2d0-fe5d-4df9-b27.1989_18.Retail_Sales` AS Retail_Sales
GROUP BY
  Product_Category;"

----Question 6
"SELECT DISTINCT
    sales.`Customer ID`,
    sales.Age,
    CASE
        WHEN sales.Age < 30 THEN 'Youth'
        WHEN sales.Age BETWEEN 30 AND 59 THEN 'Adult'
        WHEN sales.Age >= 60 THEN 'Senior'
    END AS Age_Group
FROM
    `project-b066d2d0-fe5d-4df9-b27.1989_18.Retail_Sales` AS sales;"

----Question 7 
"SELECT
    Retail_Sales.Gender,
    COUNTIF(Retail_Sales.`Total Amount` > 500) AS High_Value_Transactions
  FROM
    `project-b066d2d0-fe5d-4df9-b27.1989_18.Retail_Sales` AS Retail_Sales
  GROUP BY
    Retail_Sales.Gender;"

----Question 8 
"SELECT
    Retail_Sales.`Product Category` AS Product_Category,
    SUM(Retail_Sales.`Total Amount`) AS Total_Revenue
FROM
    `project-b066d2d0-fe5d-4df9-b27.1989_18.Retail_Sales` AS Retail_Sales
GROUP BY
    Product_Category
HAVING
    Total_Revenue > 5000
ORDER BY
    Total_Revenue DESC;"

----Question 9
"SELECT
    Retail_Sales.`Transaction ID` AS Transaction_ID,
    Retail_Sales.`Price per Unit` AS Price_per_Unit,
    CASE
        WHEN Retail_Sales.`Price per Unit` < 50 THEN 'Cheap'
        WHEN Retail_Sales.`Price per Unit` BETWEEN 50 AND 200 THEN 'Moderate'
        WHEN Retail_Sales.`Price per Unit` > 200 THEN 'Expensive'
    END AS Unit_Cost_Category
FROM
    `project-b066d2d0-fe5d-4df9-b27.1989_18.Retail_Sales` AS Retail_Sales;"

----Question 10 
"SELECT
    retail_sales.`Customer ID`,
    retail_sales.`Age`,
    retail_sales.`Total Amount`,
    CASE
        WHEN retail_sales.`Total Amount` > 1000 THEN 'High'
        ELSE 'Low'
    END AS Spending_Level
FROM
    `project-b066d2d0-fe5d-4df9-b27.1989_18.Retail_Sales` AS retail_sales
WHERE
    retail_sales.`Age` >= 40;"
