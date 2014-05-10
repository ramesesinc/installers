[deleteRptBillLedgerItem]
DELETE FROM rptbill_ledger_item WHERE rptledgerid = $P{rptledgerid}

[deleteRptBillLedgerAccount]
DELETE FROM rptbill_ledger_account WHERE rptledgerid = $P{rptledgerid}


[findOpenLedgerById]
SELECT 
	rl.objid,
	rl.lastyearpaid,
	rl.lastqtrpaid,
	rl.firstqtrpaidontime,
	rl.qtrlypaymentpaidontime,
	rl.faasid, 
	f.tdno,
	f.taxpayer_objid, 
	f.taxpayer_name, 
	f.taxpayer_address, 
	f.owner_name,
	f.administrator_name,
	r.rputype,
	r.fullpin,
	r.totalareaha,
	r.totalareasqm,
	r.totalav,
	r.taxable,
	b.name AS barangay,
	b.objid AS barangayid,
	rp.cadastrallotno,
	rp.barangayid,
	pc.code AS classcode,
	rl.partialbasic, 
	rl.partialbasicint,
	rl.partialbasicdisc, 
	rl.partialsef, 
	rl.partialsefint,
	rl.partialsefdisc,
	CASE
		WHEN (rl.partialbasic > 0 OR rl.partialsef > 0) AND rl.lastqtrpaid = 4 THEN rl.lastyearpaid
		WHEN rl.lastqtrpaid = 4 THEN rl.lastyearpaid + 1 
		ELSE rl.lastyearpaid 
	END	AS fromyear,
	CASE
		WHEN (rl.partialbasic > 0 OR rl.partialsef > 0) AND rl.lastqtrpaid = 4 THEN 1
		WHEN (rl.partialbasic > 0 OR rl.partialsef > 0) AND rl.lastqtrpaid <> 4 THEN rl.lastqtrpaid 
		WHEN rl.lastqtrpaid = 4 THEN 1 
		ELSE rl.lastqtrpaid + 1 
	END AS fromqtr,
	CASE 
		WHEN rl.nextbilldate IS NULL OR rl.nextbilldate <= GETDATE() THEN 1 
		WHEN rl.lastbilledyear IS NULL OR rl.lastbilledqtr IS NULL THEN 1 
		WHEN rl.lastbilledyear <> $P{billtoyear} OR rl.lastbilledqtr <> $P{billtoqtr} THEN 1
		ELSE 0
	END AS recalcbill
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN realproperty rp ON r.realpropertyid = rp.objid 
	INNER JOIN barangay b ON rp.barangayid = b.objid 
	INNER JOIN rptledger rl ON f.objid = rl.faasid
WHERE rl.objid = $P{rptledgerid}
 AND rl.state = 'APPROVED'
 AND r.taxable = 1 
 AND ( rl.lastyearpaid < $P{billtoyear} OR rl.partialbasic > 0.0 OR (rl.lastyearpaid = $P{billtoyear} AND rl.lastqtrpaid < $P{billtoqtr}))


[getLedgerFaases]
SELECT rlf.* 
FROM rptledger rl
	INNER JOIN rptledgerfaas rlf ON rl.objid = rlf.rptledgerid
WHERE rl.objid =  $P{rptledgerid}
  AND rlf.state = 'APPROVED' 
ORDER BY rlf.fromyear   


[findBillByBarcode]
SELECT * FROM rptbill  WHERE barcode = $P{barcodeid}


[findCollectionTypeByBarcodeKey]
SELECT * FROM collectiontype WHERE barcodekey = $P{barcodekey}
  

[getBillLedgers]  
SELECT * FROM rptbill_ledger WHERE rptbillid = $P{objid}



[findBrgyTaxAccountMapping]
SELECT 
	bam.*, 
	prior.title AS prioracct_title, 
	priorint.title AS priorintacct_title,
	prev.title AS prevacct_title, 
	prevint.title AS previntacct_title,
	curr.title AS curracct_title, 
	currint.title AS currintacct_title,
	adv.title AS advacct_title, 
	advint.title AS advintacct_title
FROM brgy_taxaccount_mapping bam 
	INNER JOIN revenueitem prior ON bam.prioracct_objid = prior.objid 
	INNER JOIN revenueitem priorint ON bam.priorintacct_objid = priorint.objid 
	INNER JOIN revenueitem prev ON bam.prevacct_objid = prev.objid 
	INNER JOIN revenueitem prevint ON bam.previntacct_objid = prevint.objid 
	INNER JOIN revenueitem curr ON bam.curracct_objid = curr.objid 
	INNER JOIN revenueitem currint ON bam.currintacct_objid = currint.objid 
	INNER JOIN revenueitem adv ON bam.advacct_objid = adv.objid 
	INNER JOIN revenueitem advint ON bam.advintacct_objid = advint.objid 
WHERE bam.barangayid = $P{barangayid}



[getBilledLedgers]
SELECT 
	rl.objid,
	rl.lastyearpaid,
	rl.lastqtrpaid,
	rl.faasid, 
	rl.nextbilldate,
	f.tdno,
	r.rputype,
	r.fullpin,
	r.totalareaha,
	r.totalareasqm,
	r.totalav,
	b.name AS barangay,
	rp.cadastrallotno,
	rp.barangayid,
	pc.code AS classcode,
	rl.lastbilledyear,
	rl.lastbilledqtr,
	CASE WHEN rl.partialbasic > 0 THEN 1 ELSE 0 END AS partialled,
	CASE WHEN rl.nextbilldate <= GETDATE() THEN 1 ELSE 0 END AS expired,
	CASE 
		WHEN rl.nextbilldate <= GETDATE() THEN 1 
		WHEN rl.partialbasic > 0 THEN 1
		WHEN rl.lastbilledyear IS NULL OR rl.lastbilledqtr IS NULL THEN 1 
		WHEN rl.lastbilledyear <> $P{billtoyear} OR rl.lastbilledqtr <> $P{billtoqtr} THEN 1
		ELSE 0
	END AS recalcbill
FROM rptledger rl 
	INNER JOIN faas f ON rl.faasid = f.objid 
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON r.realpropertyid = rp.objid 
	INNER JOIN barangay b ON rp.barangayid = b.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
WHERE ${filters}
 AND rl.state = 'APPROVED'
 AND r.taxable = 1 
 AND (rl.lastyearpaid < $P{billtoyear} OR ( rl.lastyearpaid = $P{billtoyear} AND rl.lastqtrpaid < $P{billtoqtr}))
ORDER BY f.tdno  



[getIncentivesByLedgerId]
SELECT *
FROM rpttaxincentive_item
WHERE rptledgerid = $P{rptledgerid}


[findExpiry]
SELECT expirydate,expirytype 
FROM rptexpiry 
WHERE iqtr=$P{qtr} AND iyear=$P{year}
AND expirydate >= $P{date}
ORDER BY expirydate ASC



[updateLedgerNextBillDate]
UPDATE rptledger SET
	nextbilldate = $P{nextbilldate},
	lastbilledyear = $P{toyear},
	lastbilledqtr = $P{toqtr}
WHERE objid = $P{rptledgerid}