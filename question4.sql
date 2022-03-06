-- QUESTION 4
-- For each Shipper , find the percentage of orders which are late.
-- Details: An order is considered late if ShippedDate > RequiredDate . Print the following format, order by descending
-- precentage, rounded to the nearest hundredths, like United Package|23.44

SELECT CompanyName, round(delayCnt * 100.0 / cnt, 2) AS pct
FROM (
      SELECT ShipVia, COUNT(*) AS cnt 
      FROM 'Order'
      GROUP BY ShipVia
) AS totalCnt
INNER JOIN (
      SELECT ShipVia, COUNT(*) AS delaycnt 
      FROM 'Order'
      WHERE ShippedDate > RequiredDate 
      GROUP BY ShipVia
) AS delayCnt ON totalCnt.ShipVia = delayCnt.ShipVia
INNER JOIN Shipper on totalCnt.ShipVia = Shipper.Id
ORDER BY pct DESC;

--OUTPUT:
-- Federal Shipping|23.61
-- Speedy Express|23.46
-- United Package|23.44