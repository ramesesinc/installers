[getList]
SELECT 
	rq.*,
	rqt.name AS requirementtype_name 
FROM rpt_requirement rq
	INNER JOIN rpt_requirement_type rqt ON rq.requirementtypeid = rqt.objid 
WHERE rqt.name LIKE $P{searchtext} OR rq.value_txnno LIKE $P{searchtext}	
ORDER BY rqt.sortorder 


[deleteRequirements]
DELETE FROM rpt_requirement WHERE refid = $P{refid}

[getRequirements]
SELECT 
	rq.*,
	rqt.name AS requirementtype_name 
FROM rpt_requirement rq
	INNER JOIN rpt_requirement_type rqt ON rq.requirementtypeid = rqt.objid 
WHERE rq.refid = $P{refid}
ORDER BY rqt.sortorder 


[getUncompliedRequirements]
SELECT rq.*
FROM rpt_requirement rq
WHERE rq.refid = $P{refid} 
  AND complied = 0
