########################################################
# BusinessInfoService
########################################################
[getList]
SELECT DISTINCT b.*  
FROM 
(
	SELECT xb.objid,xb.state,xb.owner_name,xb.businessname,xb.businessaddress_text,xb.activeyear,xb.bin,
    bp.permitno, bp.expirydate, bp.state AS permitstate, bp.version 
	FROM business xb
    LEFT JOIN businesspermit bp ON bp.businessid=xb.objid
	WHERE xb.owner_name LIKE $P{searchtext} AND (bp.objid IS NULL OR bp.state='ACTIVE')
UNION 
    SELECT xb.objid,xb.state,xb.owner_name,xb.businessname,xb.businessaddress_text,xb.activeyear,xb.bin,
    bp.permitno, bp.expirydate, bp.state AS permitstate, bp.version
    FROM business xb
    LEFT JOIN businesspermit bp ON bp.businessid=xb.objid
	WHERE xb.businessname LIKE $P{searchtext} AND (bp.objid IS NULL OR bp.state='ACTIVE')
UNION
    SELECT xb.objid,xb.state,xb.owner_name,xb.businessname,xb.businessaddress_text,xb.activeyear,xb.bin,
    bp.permitno, bp.expirydate, bp.state AS permitstate, bp.version
    FROM business xb
    LEFT JOIN businesspermit bp ON bp.businessid=xb.objid
	WHERE xb.bin LIKE $P{searchtext} AND (bp.objid IS NULL OR bp.state='ACTIVE')
) b
WHERE NOT(b.objid IS NULL)
${filter}
ORDER BY b.bin

[getLookup]
SELECT 
	b.objid,
    b.businessname,
    b.businessaddress_text, 
    b.owner_name,
    b.owner_objid,
    b.bin,
    b.activeyear,
    b.state,
    b.currentapplicationid,
    ba.objid AS applicationid,
    ba.appno AS appno,
    ba.apptype AS apptype,
    bt.state AS appstate
FROM business b
LEFT JOIN bpapplication ba ON b.currentapplicationid=ba.objid
LEFT JOIN bpapplication_task bt ON ba.task_objid=bt.objid
WHERE  NOT(b.state = 'RETIRED')
${filter} 
ORDER BY b.businessname

########################################################
# CashReceiptService related 
#########################################################
[findByBIN]
SELECT * FROM business WHERE bin=$P{bin}

[findByBINForReceipt]
SELECT objid, owner_name, owner_objid, businessname, businessaddress_text, 
currentapplicationid AS applicationid, objid AS businessid  
FROM business WHERE bin=$P{bin}

[findByAppnoForReceipt]
SELECT b.objid, b.owner_name, b.owner_objid, b.businessname, b.businessaddress_text, 
bp.objid as applicationid, b.objid AS businessid  
FROM business b
INNER JOIN bpapplication bp ON b.objid=bp.businessid  
WHERE bp.appno = $P{appno}

[getBusinessesByOwner]
SELECT b.objid, b.owner_name, b.businessname, 
b.bin, b.objid AS businessid,
b.businessaddress_text, 
b.currentapplicationid AS applicationid 
FROM business b 
WHERE b.owner_objid=$P{ownerid}

[activate]
UPDATE business SET state = 'ACTIVE', qtrpaid=${qtr} WHERE objid = $P{objid}

########################################################
# BusinessNameVerificationService
#########################################################
[getListForVerification]
SELECT objid,state,owner_name,businessname,businessaddress_text,activeyear
FROM business 
WHERE businessname LIKE $P{businessname}
ORDER BY businessname

########################################################
# BusinessInfoService
#########################################################
[getLobs]
SELECT 
    bl.*, 
    lc.name AS classification_name, 
    lc.objid as classification_objid   
FROM business_lob bl
INNER JOIN business b ON b.objid=bl.businessid
INNER JOIN lob ON bl.lobid=lob.objid
INNER JOIN lobclassification lc ON lob.classification_objid=lc.objid 
WHERE bl.businessid = $P{objid} 

[getAppInfos]
SELECT bi.*, 
b.caption  AS attribute_caption, 
b.datatype AS attribute_datatype, 
b.sortorder AS attribute_sortorder,
b.category AS attribute_category,
b.handler AS attribute_handler
FROM business_info bi 
INNER JOIN businessvariable b ON b.objid=bi.attribute_objid
WHERE bi.businessid=$P{objid}
ORDER BY b.category, b.sortorder 

[getActiveAssessmentInfos]
SELECT bi.*, 
bv.caption  AS attribute_caption, 
bv.datatype AS attribute_datatype, 
bv.sortorder AS attribute_sortorder,
bv.category AS attribute_category,
bv.handler AS attribute_handler
FROM business_assessment_info bi 
INNER JOIN business b ON bi.businessid=b.objid
INNER JOIN businessvariable bv ON bv.objid=bi.attribute_objid
WHERE bi.businessid=$P{objid} 
ORDER BY bv.category, bv.sortorder 

################################################
# BusinessInfoService.create and changeState
################################################
[removeInfos]
DELETE FROM business_info WHERE businessid=$P{objid}

[removeLOB]
DELETE FROM business_lob WHERE businessid=$P{objid}

[removeAssessmentInfos]
DELETE FROM business_assessment_info WHERE businessid=$P{objid}

[updateActiveStatus]
UPDATE business 
SET activeyear=$P{year},apptype='RENEW' 
WHERE objid=$P{objid}

[changeState]
UPDATE business SET state = $P{state} WHERE objid = $P{objid}

################################################################
# BusinessRenewalService. Used for checking if there is balance
################################################################
[findIfBusinessHasBalance]
SELECT 1
FROM bpreceivable 
WHERE businessid=$P{objid}
AND amount-amtpaid-discount > 0

[updatePermit]
UPDATE business SET currentpermitid = $P{permitid} WHERE objid=$P{objid}

[updatePIN]
UPDATE business SET pin=$P{pin} WHERE objid=$P{objid}


[getRedflags]
SELECT * FROM business_redflag WHERE businessid=$P{businessid} ORDER BY dtposted DESC

[removeBusinessLOB]
DELETE FROM business_lob WHERE businessid=$P{objid} AND applicationid IS NULL

[getBusinessLOB]
SELECT * FROM business_lob WHERE businessid=$P{objid}

[getApplicationList]
SELECT * FROM bpapplication WHERE businessid=$P{objid} ORDER BY appno 
