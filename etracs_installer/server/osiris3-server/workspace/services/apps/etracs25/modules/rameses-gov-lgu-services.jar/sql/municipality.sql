[lookup]
SELECT *
FROM municipality b 
WHERE b.name LIKE $P{name}  OR b.parentid LIKE $P{parentid}
ORDER BY b.name 

[changeState]
UPDATE municipality SET 
	state=$P{newstate} 
WHERE 
	objid=$P{objid} AND state=$P{oldstate} 


[getById]
SELECT * FROM municipality WHERE objid = $P{objid}