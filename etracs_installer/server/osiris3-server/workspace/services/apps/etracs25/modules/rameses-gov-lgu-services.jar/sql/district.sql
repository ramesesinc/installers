[getList]
SELECT b.objid, b.state, b.indexno, b.pin, b.name, 'DISTRICT' AS orgclass 
FROM district b 
WHERE b.name LIKE $P{name}  
ORDER BY b.name 

[lookup]
SELECT b.objid, b.state, b.indexno, b.pin, b.name, 'DISTRICT' AS orgclass  
FROM district b 
WHERE b.name LIKE $P{name}  
ORDER BY b.name 

[changeState]
UPDATE district SET 
	state=$P{newstate} 
WHERE 
	objid=$P{objid} AND state=$P{oldstate} 

[findById]
SELECT * FROM district WHERE objid = $P{objid}

[getListByParentid]
SELECT b.objid, b.state, b.indexno, b.pin, b.name 
FROM district b 
WHERE b.parentid = $P{parentid}  
ORDER BY b.name 