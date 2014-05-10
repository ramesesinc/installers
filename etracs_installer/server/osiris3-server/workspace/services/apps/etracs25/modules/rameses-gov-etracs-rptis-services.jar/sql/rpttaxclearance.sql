[getInfo]
SELECT * FROM rpttaxclearance WHERE objid = $P{objid}

[insertTaxClearance]
INSERT INTO rpttaxclearance 
	(objid, year, qtr)
VALUES 
	($P{objid}, $P{year}, $P{qtr})


[getItems]
SELECT 
	rci.*,
	f.tdno,
	rpu.rputype,
	rpu.ry,
	rpu.fullpin ,
	rpu.taxable,
	rpu.totalareaha,
	rpu.totalareasqm,
	rpu.totalbmv,
	rpu.totalmv,
	rpu.totalav,
	rp.section,
	rp.parcel,
	rp.surveyno,
	rp.cadastrallotno,
	rp.blockno,
	rp.claimno,
	b.name AS barangay,
	pc.code AS classcode
FROM rptcertificationitem rci 
	INNER JOIN rptledger rl ON rci.refid = rl.objid 
	INNER JOIN faas f ON rl.faasid = f.objid 
	INNER JOIN rpu rpu ON f.rpuid = rpu.objid
	INNER JOIN propertyclassification pc ON rpu.classification_objid = pc.objid 
	LEFT JOIN realproperty rp ON f.realpropertyid = rp.objid
	LEFT JOIN barangay b ON rp.barangayid = b.objid 
WHERE rci.rptcertificationid = $P{rptcertificationid}



[getClearedLedgers]
SELECT 
	rl.objid AS refid,
	rl.lastyearpaid,
	rl.lastqtrpaid,
	f.tdno,
	rpu.rputype,
	rpu.ry,
	rpu.fullpin ,
	rpu.taxable,
	rpu.totalareaha,
	rpu.totalareasqm,
	rpu.totalbmv,
	rpu.totalmv,
	rpu.totalav,
	rp.section,
	rp.parcel,
	rp.surveyno,
	rp.cadastrallotno,
	rp.blockno,
	rp.claimno,
	b.name AS barangay,
	pc.code AS classcode
FROM rptledger rl
	INNER JOIN faas f ON rl.faasid = f.objid
	INNER JOIN rpu rpu ON f.rpuid = rpu.objid
	INNER JOIN propertyclassification pc ON rpu.classification_objid = pc.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid
	LEFT JOIN barangay b ON rp.barangayid = b.objid 
WHERE rl.state = 'APPROVED'
  AND f.taxpayer_objid = $P{taxpayerid}
  AND f.state = 'CURRENT'
  AND ( rl.lastyearpaid > $P{year} OR (rl.lastyearpaid = $P{year} AND rl.lastqtrpaid >= $P{qtr}))



[getPaymentInfo]
SELECT 
	xr.receiptno AS orno,
	xr.txndate AS ordate,
	SUM(ri.basic + ri.basicint - ri.basicdisc + ri.sef + ri.sefint - ri.sefdisc) AS oramount,
	CASE WHEN (MIN(ri.qtr) = 1 AND MAX(ri.qtr) = 4) OR ((MIN(ri.qtr) = 0 AND MAX(ri.qtr) = 0))
		THEN  CONCAT('FULL ', ri.year)
		ELSE
			CONCAT(MIN(ri.qtr), 'Q,', ri.year, ' - ', MAX(ri.qtr), 'Q,', ri.year) 
	END AS period
FROM rptcertificationitem rci 
	INNER JOIN rptledger rl ON rci.refid = rl.objid 
	INNER JOIN cashreceiptitem_rpt  ri ON rl.objid = ri.rptledgerid
	INNER JOIN cashreceipt xr ON ri.rptreceiptid = xr.objid 
	LEFT JOIN cashreceipt_void cv ON xr.objid = cv.objid 
WHERE rci.rptcertificationid = $P{rptcertificationid}
  AND ri.year = $P{year}
  AND ri.qtr <= $P{qtr}
  AND cv.objid IS NULL 
GROUP BY xr.receiptno, xr.txndate, ri.year

UNION

SELECT 
	rc.receiptno AS orno,
	rc.receiptdate AS ordate,
	SUM(rc.amount) AS oramount,
	CASE WHEN MIN(rc.fromqtr) = 1 AND MAX(rc.toqtr) = 4
		THEN  CONCAT('FULL ', rc.fromyear)
		ELSE
			CONCAT(MIN(rc.fromqtr), 'Q,', rc.fromyear,  ' - ', MAX(rc.toqtr), 'Q,', rc.toyear) 
	END AS period
FROM rptcertificationitem rci 
	INNER JOIN rptledger rl ON rci.refid = rl.objid 
	INNER JOIN rptreceipt_capture rc on rl.objid = rc.rptledgerid
WHERE rci.rptcertificationid = $P{rptcertificationid}
  AND rc.fromyear = $P{year}
  AND rc.toqtr <= $P{qtr}
GROUP BY rc.receiptno, rc.receiptdate, rc.fromyear, rc.toyear 