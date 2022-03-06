--QUESTION 6:
-- For each of the 8 discontinued products in the database, which customer made the first ever order for the product? Output
-- the customer's CompanyName and ContactName
-- Details: Print the following format, order by ProductName alphabetically:
-- Alice Mutton|Consolidated Holdings|Elizabeth Brown

SELECT pname, CompanyName, ContactName
FROM (
    SELECT pname, min(OrderDate), CompanyName, ContactName
      FROM (
            SELECT Id AS pid, ProductName AS pname 
            FROM Product 
            WHERE Discontinued != 0
        ) as discontinued
      INNER JOIN OrderDetail on ProductId = pid
      INNER JOIN 'Order' on 'Order'.Id = OrderDetail.OrderId
      INNER JOIN Customer on CustomerId = Customer.Id
      GROUP BY pid
)
ORDER BY pname ASC;

--OUTPUT:
-- Alice Mutton|Consolidated Holdings|Elizabeth Brown
-- Chef Anton's Gumbo Mix|Piccolo und mehr|Georg Pipps
-- Guaraná Fantástica|Piccolo und mehr|Georg Pipps
-- Mishi Kobe Niku|Old World Delicatessen|Rene Phillips
-- Perth Pasties|Piccolo und mehr|Georg Pipps
-- Rössle Sauerkraut|Piccolo und mehr|Georg Pipps
-- Singaporean Hokkien Fried Mee|Vins et alcools Chevalier|Paul Henriot
-- Thüringer Rostbratwurst|Piccolo und mehr|Georg Pipps