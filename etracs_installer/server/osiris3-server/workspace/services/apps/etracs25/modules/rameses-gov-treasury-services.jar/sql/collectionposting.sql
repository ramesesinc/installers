[getList]
SELECT * 
FROM ngas_revenue 
WHERE txndate LIKE $P{searchtext} OR postedby_name LIKE $P{searchtext} 
ORDER BY txndate DESC 

