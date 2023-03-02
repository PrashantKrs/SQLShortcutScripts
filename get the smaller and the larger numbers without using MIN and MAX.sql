
--self join to get the smaller and the larger numbers without using MIN and MAX
SELECT Smaller.Numbers, Larger.Numbers 
FROM Compare as Larger JOIN Compare AS Smaller 
ON Smaller.Numbers < Larger.Numbers