--QUESTION 7
-- For the first 10 orders by CutomerId BLONP : get the Order's Id , OrderDate , previous OrderDate , and difference
-- between the previous and current. Return results ordered by OrderDate (ascending)
-- Details: The "previous" OrderDate for the first order should default to itself (lag time = 0). Use the julianday() function
-- for date arithmetic (example).
-- Use lag(expr, offset, default) for grabbing previous dates.
-- Please round the lag time to the nearest hundredth, formatted like
-- 17361|2012-09-19 12:13:21|2012-09-18 22:37:15|0.57

SELECT
     Id, OrderDate, PrevOrderDate, ROUND(julianday(OrderDate) - julianday(PrevOrderDate), 2)
FROM (
     SELECT Id, OrderDate, LAG(OrderDate, 1, OrderDate) OVER (ORDER BY OrderDate ASC) AS PrevOrderDate
     FROM 'Order' 
     WHERE CustomerId = 'BLONP'
     ORDER BY OrderDate ASC
     LIMIT 10
);

--OUTPUT: 
-- 16766|2012-07-22 23:11:15|2012-07-22 23:11:15|0.0
-- 10265|2012-07-25|2012-07-22 23:11:15|2.03
-- 12594|2012-08-16 12:35:15|2012-07-25|22.52
-- 20249|2012-08-16 16:52:23|2012-08-16 12:35:15|0.18
-- 20882|2012-08-18 19:11:48|2012-08-16 16:52:23|2.1
-- 18443|2012-08-28 05:34:03|2012-08-18 19:11:48|9.43
-- 10297|2012-09-04|2012-08-28 05:34:03|6.77
-- 11694|2012-09-17 00:27:14|2012-09-04|13.02
-- 25613|2012-09-18 22:37:15|2012-09-17 00:27:14|1.92
-- 17361|2012-09-19 12:13:21|2012-09-18 22:37:15|0.57