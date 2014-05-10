[findCollectionTypeByRevType]
SELECT ct.* 
FROM collectiontype ct
	INNER JOIN specialaccountsetting s ON ct.objid = s.collectiontypeid
WHERE ct.formno = $P{formno}	
  AND s.revtype = $P{revtype}
	

[findRevenueItem]	
SELECT ri.*, s.amount
FROM revenueitem ri
	INNER JOIN specialaccountsetting s ON ri.objid = s.item_objid
	INNER JOIN collectiontype ct ON s.collectiontypeid = ct.objid 
WHERE ct.formno = $P{formno}
  AND s.revtype = $P{revtype}

