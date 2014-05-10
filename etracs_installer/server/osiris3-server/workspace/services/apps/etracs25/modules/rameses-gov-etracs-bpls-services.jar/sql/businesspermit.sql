[getList]
SELECT DISTINCT p.*  
FROM 
(
	SELECT objid,permitno,version,dtissued,bin,tradename,businessaddress_text,ownername,expirydate,state 
	FROM businesspermit
	WHERE ownername LIKE $P{searchtext}
UNION 
	SELECT objid,permitno,version,dtissued,bin,tradename,businessaddress_text,ownername,expirydate,state 
	FROM businesspermit
	WHERE tradename LIKE $P{searchtext}
UNION
	SELECT objid,permitno,version,dtissued,bin,tradename,businessaddress_text,ownername,expirydate,state 
	FROM businesspermit
	WHERE permitno LIKE $P{searchtext}
) p
WHERE NOT(p.objid IS NULL)
${filter}
ORDER BY p.dtissued


[getPermitLobs]
SELECT p.*
FROM business_lob p
WHERE p.businessid = $P{businessid} 

[getPayments]
SELECT 
    bp.refno AS orno, 
    bp.refdate AS ordate, 
    bp.amount,
    bp.payoption,
    bp.qtr
FROM bppayment bp
INNER JOIN business b ON bp.businessid=b.objid
WHERE businessid=$P{businessid} AND YEAR(bp.refdate)=$P{activeyear}
AND bp.voided = 0

[findPermitByYear]
SELECT permitno, version FROM businesspermit WHERE businessid=$P{businessid} AND activeyear=$P{activeyear}

[updatePermit]
UPDATE business SET currentpermitid = $P{permitid} WHERE objid=$P{objid}

[findActivePermit]
SELECT objid, permitno, version, expirydate, dtissued, permittype 
FROM businesspermit 
WHERE businessid=$P{businessid} 
AND state='ACTIVE' 
AND activeyear=$P{activeyear}

[deactivatePermit]
UPDATE businesspermit SET state='INACTIVE' WHERE businessid=$P{businessid}
