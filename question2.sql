--QUESTION 2
--: Get all unique ShipNames from the Order table that contain a hyphen '-' .
--  In addition, get all the characters preceding the (first) hyphen. 
--  Return ship names alphabetically. Your first row

-- Notes:
-- SUBSTR(string, start, length) or SUBSTR(string FROM start FOR length)
-- INSTR( The string that will be searched, The string to search for in string1. If string2 is not found, this function returns 0)

SELECT DISTINCT ShipName, substr(ShipName, 0, instr(ShipName, '-')) as PreHyphen
FROM 'Order'
WHERE ShipName LIKE '%-%'
ORDER BY ShipName ASC;

--OUTPUT:
-- Bottom-Dollar Markets|Bottom
-- Chop-suey Chinese|Chop
-- GROSELLA-Restaurante|GROSELLA
-- HILARION-Abastos|HILARION
-- Hungry Owl All-Night Grocers|Hungry Owl All
-- LILA-Supermercado|LILA
-- LINO-Delicateses|LINO
-- QUICK-Stop|QUICK
-- Save-a-lot Markets|Save