[getLookup]
SELECT DISTINCT a.* FROM 
(
	SELECT r.objid, r.code, r.title
	FROM revenueitem_attribute ba 
	INNER JOIN revenueitem r ON ba.revitemid=r.objid 
	WHERE ba.account_objid = $P{taxfeetype}
	AND r.code LIKE $P{searchtext}
UNION
	SELECT r.objid, r.code, r.title
	FROM revenueitem_attribute ba 
	INNER JOIN revenueitem r ON ba.revitemid=r.objid 
	WHERE ba.account_objid = $P{taxfeetype}
	AND r.title LIKE $P{searchtext}
) a ORDER BY a.code

[findAccount]
SELECT r.objid, r.code, r.title, ba.account_objid AS taxfeetype
FROM revenueitem_attribute ba 
INNER JOIN revenueitem r ON ba.revitemid=r.objid 
WHERE ba.attribute_objid='businessaccounttype'   
AND r.objid = $P{objid}

[getLookupByDepartment]
SELECT a.* FROM 
(SELECT r.objid, r.code, r.title
INNER JOIN revenueitem r ON ba.objid=r.objid 
WHERE r.org_objid = $P{department}) a



