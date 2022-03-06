--QUESTION 5:
-- Compute some statistics about categories of products
-- Details: Get the number of products, average unit price (rounded to 2 decimal places), minimum unit price, maximum unit
-- price, and total units on order for categories containing greater than 10 products.
-- Order by Category Id . Your output should look like Beverages|12|37.98|4.5|263.5|60


--NOTES:
-- The ROUND() function rounds a number to a specified number of decimal places.
-- The GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".
-- The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.
-- The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

SELECT CategoryName
     , COUNT(*) AS CategoryCount
     , ROUND(AVG(UnitPrice), 2) AS AvgUnitPrice
     , MIN(UnitPrice) AS MinUnitPrice
     , MAX(UnitPrice) AS MaxUnitPrice
     , SUM(UnitsOnOrder) AS TotalUnitsOnOrder
FROM Product INNER JOIN Category on CategoryId = Category.Id
GROUP BY CategoryId
HAVING CategoryCount > 10
ORDER BY CategoryId;

--OUTPUT:
-- Beverages|12|37.98|4.5|263.5|60
-- Condiments|12|23.06|10|43.9|170
-- Confections|13|25.16|9.2|81|180
-- Seafood|12|20.68|6|62.5|120