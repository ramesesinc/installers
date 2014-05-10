[getList]
SELECT * 
FROM rpt_requirement_type
WHERE (objid LIKE $P{seachtext} OR name LIKE $P{searchtext})
ORDER BY sortorder

[approve]
UPDATE rpt_requirement_type SET state = 'APPROVED' WHERE objid = $P{objid}
