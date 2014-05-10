[getList]
SELECT * FROM businessrequirement

[getLookup]
SELECT * FROM businessrequirement WHERE code LIKE $P{searchtext}

[findReq]
SELECT * FROM businessrequirement WHERE objid=$P{objid}

[getDepartments]
SELECT objid, department, 'forassessment' AS state  
FROM businessrequirement 
WHERE type='WORKFLOW'

[getOpenApplicationsList]
SELECT DISTINCT bp.* 
FROM bpapplication bp
INNER JOIN business_application_requirement br ON bp.objid=br.parentid
INNER JOIN businessrequirement r ON r.objid=br.refid
WHERE r.department = $P{department} AND bp.state = $P{state}


[sgetOpenApplicationsList]
SELECT bp.* 
FROM bpapplication bp
WHERE bp.state = $P{state}
AND EXISTS ( 
	SELECT * FROM business_application_requirement WHERE parentid=bp.objid AND status='pending' 
)

[getOpenFeeRequirements]
SELECT bp.objid, br.code, br.account_code, br.account_objid, br.account_title, bp.status    
FROM business_application_requirement bp
INNER JOIN businessrequirement br ON bp.refid=br.objid AND br.type='OTHERFEE' 
WHERE  bp.parentid=$P{objid} AND NOT(status='completed')

[getCompletedFeeRequirements]
SELECT bp.objid, bt.account_title, bt.account_code, bt.account_code, bt.amount     
FROM business_application_requirement bp
INNER JOIN bpapplication_taxfee bt ON bp.objid=bt.refid  
WHERE  bp.parentid=$P{objid} 

[updateCompletedFeeRequirement]
UPDATE business_application_requirement 
SET status='completed', completedby_objid=$P{userid}, completedby_name=$P{username},
dtcompleted=$P{dtcompleted}, remarks=$P{remarks} 
WHERE objid=$P{objid}


