[getList]
SELECT 
	rl.*,
	f.tdno, f.txntype_objid,
	f.taxpayer_objid, f.taxpayer_name, f.taxpayer_address,
	f.owner_name, f.owner_address,
	f.prevtdno, f.prevpin, f.prevowner, f.prevmv, f.prevav,
	rpu.rputype, rpu.ry, rpu.fullpin, rpu.taxable,
	rpu.totalmv, rpu.totalav, rpu.totalareaha, rpu.totalareasqm, 
	rp.surveyno,rp.cadastrallotno,
	b.name AS barangay_name
FROM faas f 
	INNER JOIN rpu rpu ON f.rpuid = rpu.objid
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid
	INNER JOIN barangay b ON rp.barangayid = b.objid 
	INNER JOIN rptledger rl ON rl.faasid = f.objid 
WHERE 1=1
${filters}	


[findById]
SELECT 
	rl.*,
	f.tdno, f.txntype_objid,
	f.taxpayer_objid, f.taxpayer_name, f.taxpayer_address,
	f.owner_name, f.owner_address,
	f.prevtdno, f.prevpin, f.prevowner, f.prevmv, f.prevav,
	rpu.rputype, rpu.ry, rpu.fullpin, rpu.taxable,
	rpu.totalmv, rpu.totalav, rpu.totalareaha, rpu.totalareasqm, 
	rp.surveyno,rp.cadastrallotno,
	b.name AS barangay_name
FROM rptledger rl 
	INNER JOIN faas f ON rl.faasid = f.objid
	INNER JOIN rpu rpu ON f.rpuid = rpu.objid
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid
	INNER JOIN barangay b ON rp.barangayid = b.objid 
WHERE rl.objid = $P{objid}
ORDER BY rl.state, f.tdno 


	
[findApprovedLedgerByFaasId]
SELECT rl.* , r.taxable 
FROM rptledger rl 
	INNER JOIN faas f ON rl.faasid = f.objid 
	INNER JOIN rpu r ON f.rpuid = r.objid 
WHERE rl.faasid = $P{faasid} AND rl.state = 'APPROVED' 


[findLedgerByFaasId]	
SELECT * FROM rptledger WHERE faasid = $P{faasid} 


[getLedgerFaases]
SELECT rlf.*,
	pc.code AS classification_code,
	pc.name AS classification_name,
	pc1.code AS actualuse_code,
	pc1.name AS actualuse_name
FROM rptledgerfaas rlf
	INNER JOIN propertyclassification pc ON rlf.classification_objid = pc.objid 
	LEFT JOIN propertyclassification pc1 ON rlf.actualuse_objid = pc1.objid 
WHERE rlf.rptledgerid = $P{rptledgerid} 
ORDER BY rlf.fromyear, rlf.tdno   DESC 

[findLedgerFaasByFaasId]
SELECT rlf.*,
	pc.code AS classification_code,
	pc.name AS classification_name,
	pc1.code AS actualuse_code,
	pc1.name AS actualuse_name
FROM rptledgerfaas rlf
	INNER JOIN propertyclassification pc ON rlf.classification_objid = pc.objid 
	LEFT JOIN propertyclassification pc1 ON rlf.actualuse_objid = pc1.objid 
WHERE rlf.rptledgerid =  $P{rptledgerid} 
  AND $P{yr} >= rlf.fromyear 
  AND $P{yr} <= (CASE WHEN rlf.toyear = 0 THEN $P{yr} ELSE rlf.toyear END)
  AND rlf.state ='APPROVED'


[getLedgerBillItems]
SELECT
	rl.objid AS rptledgerid,  lf.tdno, bi.year, lf.assessedvalue, 
	SUM(bi.basic) AS basic, 
	SUM(bi.basicint) AS basicint, 
	SUM(bi.basicdisc) AS basicdisc, 
	SUM(bi.sef) AS sef, 
	SUM(bi.sefint) AS sefint, 
	SUM(bi.sefdisc) AS sefdisc, 
	SUM(bi.firecode) AS firecode,

	SUM(bi.basic -  bi.basicdisc + bi.basicint + 
	    bi.sef - bi.sefdisc + bi.sefint +	bi.firecode
   ) AS total 
FROM rptledger rl
	INNER JOIN rptledgerfaas lf ON rl.objid = lf.rptledgerid
	INNER JOIN rptbill_ledger_item bi ON rl.objid = bi.rptledgerid 
WHERE rl.objid = $P{rptledgerid} 
GROUP BY rl.objid, lf.tdno, bi.year, lf.assessedvalue
ORDER BY bi.year DESC 



[closePreviousFaasToYearAndQtr]
UPDATE rptledgerfaas SET
	toyear = $P{toyear},
	toqtr  = $P{toqtr}
WHERE objid <> $P{objid} AND rptledgerid = $P{rptledgerid}	AND toyear = 0 


[updateLedgerLastItemYear]
UPDATE rptledger SET 
	lastitemyear = $P{lastitemyear},
	nextbilldate = NULL
WHERE objid = $P{objid}	


[clearNextBillDateByLedger]
UPDATE rptledger SET 
	nextbilldate = NULL 
WHERE objid = $P{objid} 
  AND state = 'APPROVED'

[clearNextBillDate]
UPDATE rptledger SET 
	nextbilldate = NULL 
WHERE state = 'APPROVED'



[getLedgerCredits]
SELECT x.*
FROM (
	SELECT 
		receiptno,
		receiptdate,
		paidby_name,
		paidby_address, 
		collector,
		'CAPTURE' AS txnmode,
		period,
		basic,
		basicint,
		basicdisc,
		sef,
		sefint,
		sefdisc,
		firecode,
		amount,
		fromyear
	FROM rptreceipt_capture rc 
	WHERE rptledgerid = $P{rptledgerid}	

	UNION ALL

	SELECT 
		t.receiptno,
		t.receiptdate,
		t.paidby_name,
		t.paidby_address, 
		t.collector,
		'ONLINE' AS txnmode,
		CASE
			WHEN MIN(t.fromyear) = MAX(t.toyear) AND MIN(t.fromqtr) = 1 AND MAX(t.toqtr) = 4 
				THEN 'FULL ' + MAX(t.toyear)
			WHEN MIN(t.fromyear) = MAX(t.toyear) AND MIN(t.fromqtr) = MAX(t.toqtr)
				THEN MAX(t.toqtr) + 'Q, ' + MAX(t.toyear)
			WHEN MIN(t.fromyear) = MAX(t.toyear) 
				THEN MIN(t.fromqtr) + MAX(t.toqtr) + 'Q, ' + MAX(t.toyear)

			WHEN MIN(t.fromqtr) = 1 AND MAX(t.toqtr) = 4
				THEN 'FULL ' + MIN(t.fromyear) + '-' + MAX(t.toyear)
			WHEN MIN(t.fromqtr) = 1 AND MAX(t.toqtr) <> 4
				THEN MIN(t.fromyear) + '-' + MAX(t.toqtr) + 'Q,' + MAX(t.toyear)
			WHEN MIN(t.fromqtr) <> 1 AND MAX(t.toqtr) = 4
				THEN MIN(t.fromqtr) + 'Q,' + MIN(t.fromyear) + '-' + MAX(t.toyear)
			ELSE
				MIN(t.fromqtr) + 'Q,' + MIN(t.fromyear) + '-' + MAX(t.toqtr) + 'Q,' + MAX(t.toyear)
		END AS period,
		SUM(t.basic) AS basic,
		SUM(t.basicint) AS basicint,
		SUM(t.basicdisc) AS basicdisc,
		SUM(t.sef) AS sef,
		SUM(t.sefint) AS sefint,
		SUM(t.sefdisc) AS sefdisc,
		SUM(t.firecode) AS firecode,
		SUM(t.amount) AS amount,
		MIN(fromyear) AS fromyear
	FROM (
		SELECT 
			cr.receiptno,
			cr.receiptdate,
			cr.paidby AS paidby_name,
			cr.paidbyaddress AS paidby_address,
			cr.collector_name AS collector,
			MIN(cri.year) AS fromyear,
			MIN(CASE WHEN cri.qtr = 0 THEN 1 ELSE cri.qtr END ) AS fromqtr,
			MAX(cri.year) AS toyear,
			MAX(CASE WHEN cri.qtr = 0 THEN 4 ELSE cri.qtr END) AS toqtr,
			SUM(cri.basic) AS basic,
			SUM(cri.basicint) AS basicint,
			SUM(cri.basicdisc) AS basicdisc,
			SUM(cri.sef) AS sef,
			SUM(cri.sefint) AS sefint,
			SUM(cri.sefdisc) AS sefdisc,
			SUM(cri.firecode) AS firecode,
			SUM(
				cri.basic + cri.basicint - cri.basicdisc + 
				cri.sef + cri.sefint - cri.sefdisc + cri.firecode
			) AS amount
		FROM cashreceipt_rpt crr
			INNER JOIN cashreceipt cr ON crr.objid = cr.objid 
			INNER JOIN cashreceiptitem_rpt_online cri ON cr.objid = cri.rptreceiptid 	
			LEFT JOIN cashreceipt_void cv ON cr.objid = cv.objid
		WHERE cri.rptledgerid = $P{rptledgerid}	
		  AND cv.objid IS NULL 
		GROUP BY  
			cr.receiptno,
			cr.receiptdate,
			cr.paidby,
			cr.paidbyaddress,
			cr.collector_name, 
			cri.year 
	) t		
	GROUP BY 		
		t.receiptno,
		t.receiptdate,
		t.paidby_name,
		t.paidby_address,
		t.collector,
		t.fromyear 
) x 
ORDER BY x.receiptdate DESC 








[approveLedgerFaas]
UPDATE rptledgerfaas SET state = 'APPROVED' WHERE objid = $P{objid}


[updateLastYearQtrPaid]
UPDATE rptledger SET lastyearpaid = $P{toyear}, lastqtrpaid = $P{toqtr} WHERE objid = $P{rptledgerid}


[updateState]
UPDATE rptledger SET state = $P{state} WHERE objid = $P{objid}



[fixLedgerInfo]
UPDATE rptledger SET 
	lastyearpaid = $P{lastyearpaid}, 
	lastqtrpaid = $P{lastqtrpaid},
	partialledyear = $P{partialledyear},
	partialledqtr = $P{partialledqtr},
	lastbilledyear = null,
	lastbilledqtr = null,
	partialbasic = $P{partialbasic},
	partialbasicint = $P{partialbasicint},
	partialbasicdisc = $P{partialbasicdisc},
	partialsef = $P{partialsef},
	partialsefint = $P{partialsefint},
	partialsefdisc = $P{partialsefdisc}
WHERE objid = $P{rptledgerid}

[resetLastBilledInfo]
UPDATE rptledger SET 
	lastbilledyear = null,
	lastbilledqtr = null
WHERE objid = $P{rptledgerid}