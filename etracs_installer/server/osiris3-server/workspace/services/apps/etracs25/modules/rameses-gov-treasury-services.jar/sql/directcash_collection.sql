[getList]
SELECT * FROM directcash_collection WHERE refno LIKE $P{searchtext} ORDER BY refdate DESC 

[getItems]
SELECT 
	dci.*,
	ri.code AS item_code,
	ri.title AS item_title
FROM directcash_collection_item dci 
	INNER JOIN revenueitem ri ON dci.item_objid = ri.objid 
WHERE dci.parentid = $P{objid}	 


[approve]
UPDATE directcash_collection SET state = 'APPROVED' WHERE objid = $P{objid} AND state = 'DRAFT'


[getReportData]
SELECT
	dc.refno, dc.refdate,
	ri.code, ri.title, dci.amount
FROM directcash_collection dc
	INNER JOIN directcash_collection_item dci ON dc.objid = dci.parentid
	INNER JOIN revenueitem ri ON dci.item_objid = ri.objid
WHERE dc.refdate between $P{fromdate} and $P{todate}
  AND dc.state = 'APPROVED' 
  AND ri.objid LIKE $P{acctid}
ORDER BY dc.refdate , ri.code 