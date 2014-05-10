[getList]
SELECT r.* FROM 
(SELECT * FROM revenueitem  WHERE title LIKE $P{searchtext} 
UNION 
SELECT * FROM revenueitem WHERE code LIKE $P{searchtext}) r
ORDER BY r.code
 
[getAttributeTypes]
SELECT * FROM revenueitem_attribute_type 

[getAttributeList]
SELECT a.*, t.title AS attribute_title 
FROM revenueitem_attribute a 
LEFT JOIN revenueitem_attribute_type t ON a.attribute_objid=t.objid
WHERE a.revitemid = $P{objid}

[getMappingList]
SELECT r.objid,r.code,r.title,
a.account_objid, a.account_title, a.account_code, a.objid AS attributeid
FROM revenueitem r 
LEFT JOIN (
	SELECT * FROM revenueitem_attribute WHERE attribute_objid = $P{attributeid}
) a ON r.objid=a.revitemid
WHERE r.title LIKE $P{searchtext} 
ORDER BY r.code

[getMappingListByCode]
SELECT r.objid,r.code,r.title,
a.account_objid, a.account_title, a.account_code, a.objid AS attributeid
FROM revenueitem r 
LEFT JOIN (
	SELECT * FROM revenueitem_attribute WHERE attribute_objid = $P{attributeid}
) a ON r.objid=a.revitemid
WHERE r.code LIKE $P{searchtext} 
ORDER BY r.code

[changeState-approved]
UPDATE revenueitem SET state='APPROVED' WHERE objid=$P{objid} AND state='DRAFT'

[approve]
UPDATE revenueitem SET state='APPROVED' WHERE objid=$P{objid} AND state='DRAFT'

[updateCode]
UPDATE revenueitem SET code=$P{code}, title=$P{title} WHERE objid=$P{objid} 

[getLookup]
SELECT r.* FROM revenueitem r 
WHERE  (r.title LIKE $P{title}  OR r.code LIKE $P{code} ) 
	and r.state  = 'APPROVED' 
	${filter}
ORDER BY r.title

[findAccount]
SELECT r.objid, r.code, r.title, r.fund_objid, r.fund_code, r.fund_title 
FROM revenueitem r WHERE objid=$P{objid}

[getAccountColumns]
SELECT name, title, source, depends, lookuphandler from account_segment 
WHERE objectname = 'revenueitem' 
ORDER BY sortorder 

[getAccountList]
SELECT r.objid, r.code, r.title 
${columns}
FROM revenueitem r
${sources}
where (r.title LIKE $P{title}  or r.code LIKE $P{code} ) 
	and r.state  = 'APPROVED'
ORDER BY r.code

[deleteRevenueAccountMapping]
delete from revenueitem_attribute
where revitemid =$P{revitemid} 
	and attribute_objid=$P{attributeid}	