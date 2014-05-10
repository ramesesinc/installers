[getList]
SELECT * FROM stockrequest 
WHERE itemclass='AF' 

[getLookup]
SELECT * FROM stockrequest 
WHERE itemclass='AF' 
AND reqtype=$P{reqtype} 
AND (
	reqno LIKE $P{reqno}
	OR 
	requester_name LIKE $P{requester}
)	
AND state='OPEN'
