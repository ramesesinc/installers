[getList]
SELECT 
	t.*,
	DATEDIFF(mi, startdate, ISNULL(enddate,GETDATE())) AS duration
FROM rpttask t 
WHERE 1=1 
${filters}

[closeTask]
UPDATE rpttask SET 
	enddate = $P{enddate}
WHERE objid = $P{objid}	AND enddate IS NULL

[deleteTask]
DELETE FROM rpttask WHERE objid = $P{objid}


[findCurrentTask]
SELECT * FROM rpttask WHERE objid = $P{objid} AND enddate IS NULL 

[findCurrentTaskByAction]
SELECT * FROM rpttask WHERE objid = $P{objid} AND action=$P{action} AND enddate IS NULL 


[getListById]
SELECT 
	t.*,
	DATEDIFF(mi, startdate, ISNULL(enddate,GETDATE())) AS duration
FROM rpttask t 
WHERE objid = $P{objid}
ORDER BY startdate 


[findSenderTask]
SELECT * 
FROM rpttask 
WHERE objid = $P{objid}
  AND enddate IS NOT NULL
  AND action NOT LIKE 'assign%'
ORDER BY startdate DESC   


[getSenders]
SELECT 
	createdby_objid AS objid, createdby_name AS name, createdby_title AS title, action
FROM rpttask 
WHERE objid = $P{objid}
  AND action NOT LIKE 'assign%'
  AND action <> $P{currentaction}
ORDER BY startdate  DESC 
