
[getItemsForPayment]
SELECT 
	t.rptledgerid, t.tdno, 
	t.lastyearpaid, t.lastqtrpaid,
	t.fromyear, 
	(SELECT MIN(CASE WHEN qtr = 0 THEN fromqtr ELSE qtr END) FROM rptbill_ledger_item WHERE rptledgerid = t.rptledgerid AND year = t.fromyear) AS fromqtr,
	t.toyear AS toyear,
	(SELECT MAX(CASE WHEN qtr = 0 THEN toqtr ELSE qtr END) FROM rptbill_ledger_item WHERE rptledgerid = t.rptledgerid AND year = t.toyear) AS toqtr,
	SUM(t.basic) AS totalbasic,
	SUM(t.sef) AS totalsef,
	SUM(t.firecode) AS totalfirecode,
	SUM(t.basic + t.firecode) AS totalgeneral,
	SUM(t.basic + t.sef + t.firecode) AS amount,
  t.partialled 
FROM (
	SELECT
		rl.objid AS rptledgerid, 
		rl.lastyearpaid,
		rl.lastqtrpaid,
		f.tdno, 
		MAX(bi.partialled) AS partialled,
		MIN(bi.year) AS fromyear,
		MAX(bi.year) AS toyear,
		SUM(bi.basic - bi.basicdisc + bi.basicint) AS basic,
		SUM(bi.sef - bi.sefdisc + sefint) AS sef,
		SUM(bi.firecode) AS firecode 
	FROM rptledger rl
		INNER JOIN rptbill_ledger_item bi ON rl.objid = bi.rptledgerid
		INNER JOIN faas f ON rl.faasid = f.objid 
		INNER JOIN rpu r ON f.rpuid = r.objid 
	WHERE  ${filters}
	  AND rl.state = 'APPROVED'
	  AND r.taxable = 1
	GROUP BY rl.objid, f.tdno, rl.lastyearpaid, rl.lastqtrpaid
) t
GROUP BY t.rptledgerid, t.lastyearpaid, t.lastqtrpaid, t.tdno, t.fromyear, t.toyear, t.partialled



[getItemsForPaymentByBill]
SELECT 
	t.rptledgerid, t.tdno, 
	t.lastyearpaid, t.lastqtrpaid,
	t.billid,
	t.fromyear, 
	(SELECT MIN(CASE WHEN qtr = 0 THEN fromqtr ELSE qtr END) FROM rptbill_ledger_item WHERE rptledgerid = t.rptledgerid AND year = t.fromyear) AS fromqtr,
	$P{billtoyear}  AS toyear,
	(SELECT MAX(CASE WHEN qtr = 0 THEN toqtr ELSE qtr END) FROM rptbill_ledger_item WHERE rptledgerid = t.rptledgerid AND year = t.toyear) AS toqtr,
	SUM(t.basic) AS totalbasic,
	SUM(t.sef) AS totalsef,
	SUM(t.firecode) AS totalfirecode,
	SUM(t.basic + t.firecode) AS totalgeneral,
	SUM(t.basic + t.sef + t.firecode) AS amount
FROM (
	SELECT
		rb.objid AS billid,
		rl.objid AS rptledgerid, 
		rl.lastyearpaid,
		rl.lastqtrpaid,
		f.tdno, 
		MIN(bi.year) AS fromyear,
		MAX(bi.year) AS toyear,
		SUM(bi.basic - basicdisc + basicint) AS basic,
		SUM(bi.sef - sefdisc + sefint) AS sef,
		SUM(bi.firecode) AS firecode 
	FROM rptbill rb
		INNER JOIN rptbill_ledger rbl ON rb.objid = rbl.rptbillid 
		INNER JOIN rptledger rl ON rbl.rptledgerid = rl.objid 
		INNER JOIN rptbill_ledger_item bi ON rl.objid = bi.rptledgerid
		INNER JOIN faas f ON rl.faasid = f.objid 
		INNER JOIN rpu r ON f.rpuid = r.objid 
	WHERE rb.objid = $P{billid}
	  AND rl.state = 'APPROVED'
	  AND r.taxable = 1
	GROUP BY rb.objid, rl.objid, f.tdno, rl.lastyearpaid, rl.lastqtrpaid
) t
GROUP BY t.billid, t.rptledgerid, t.lastyearpaid, t.lastqtrpaid, t.tdno, t.fromyear, t.toyear 



[insertPaidOnlineItems]
INSERT INTO cashreceiptitem_rpt_online
(
	objid,
	rptreceiptid,
	rptledgerid,
	rptledgerfaasid,
	year,
	qtr,
	fromqtr,
	toqtr,
	basic,
	basicint,
	basicdisc,
	sef,
	sefint,
	sefdisc,
	firecode,
	revperiod,
	basicnet,
	sefnet,
	total,
	partialled
)
SELECT
	bi.objid,
	$P{rptreceiptid},
	bi.rptledgerid,
	bi.rptledgerfaasid,
	bi.year,
	bi.qtr,
	bi.fromqtr,
	bi.toqtr,
	bi.basic,
	bi.basicint,
	bi.basicdisc,
	bi.sef,
	bi.sefint,
	bi.sefdisc,
	bi.firecode,
	bi.revperiod,
	bi.basicnet,
	bi.sefnet,
	bi.total,
	partialled
FROM rptledger rl
		INNER JOIN rptbill_ledger_item bi ON rl.objid = bi.rptledgerid
WHERE rl.objid = $P{rptledgerid}
  


[insertPaidOnlineAccounts]
INSERT INTO cashreceiptitem_rpt_account
(
	objid,
	rptreceiptid,
	rptledgerid,
	revperiod,
	revtype,
	item_objid,
	amount,
	sharetype
)
SELECT
	ba.objid,
	$P{rptreceiptid},
	ba.rptledgerid,
	ba.revperiod,
	ba.revtype,
	ba.item_objid,
	ba.amount,
	ba.sharetype
FROM rptledger rl
		INNER JOIN rptbill_ledger_account ba ON rl.objid = ba.rptledgerid
WHERE rl.objid = $P{rptledgerid}  




[deletePaidOnlineItems]  
DELETE FROM rptbill_ledger_item WHERE rptledgerid = $P{rptledgerid} 


[deletePaidOnlineAccounts]  
DELETE FROM rptbill_ledger_account WHERE rptledgerid = $P{rptledgerid} 


[deleteRptBillLedgers]
DELETE FROM rptbill_ledger WHERE rptbillid = $P{billid}


[deleteRptBill]
DELETE FROM rptbill WHERE objid = $P{billid}



[updateLedgerYearQtrPaid]
UPDATE rptledger SET 
	lastyearpaid = $P{toyear},
	lastqtrpaid = $P{toqtr},
	partialbasic = CASE WHEN lastyearpaid = $P{toyear} AND lastqtrpaid = $P{toqtr} 
						THEN partialbasic + $P{partialbasic} 
						ELSE $P{partialbasic} 
					END,
	partialbasicint = CASE WHEN lastyearpaid = $P{toyear} AND lastqtrpaid = $P{toqtr} 
						THEN partialbasicint + $P{partialbasicint} 
						ELSE $P{partialbasicint} 
					END,
	partialbasicdisc = CASE WHEN lastyearpaid = $P{toyear} AND lastqtrpaid = $P{toqtr} 
						THEN partialbasicdisc + $P{partialbasicdisc} 
						ELSE $P{partialbasicdisc} 
					END,
	partialsef = CASE WHEN lastyearpaid = $P{toyear} AND lastqtrpaid = $P{toqtr} 
						THEN partialsef + $P{partialsef} 
						ELSE $P{partialsef} 
					END,
	partialsefint = CASE WHEN lastyearpaid = $P{toyear} AND lastqtrpaid = $P{toqtr} 
						THEN partialsefint + $P{partialsefint} 
						ELSE $P{partialsefint} 
					END,
	partialsefdisc = CASE WHEN lastyearpaid = $P{toyear} AND lastqtrpaid = $P{toqtr} 
						THEN partialsefdisc + $P{partialsefdisc} 
						ELSE $P{partialsefdisc} 
					END,
	partialledyear = $P{partialledyear},
	partialledqtr  = $P{partialledqtr},
	lastbilledyear = $P{lastbilledyear},
	lastbilledqtr  = $P{lastbilledqtr}
WHERE objid = $P{rptledgerid}	




[getCollectionsByCount]
SELECT 
	cr.receiptno, 
	CASE WHEN cv.objid IS NULL THEN cr.amount  ELSE 0.0 END AS amount,
	CASE WHEN cv.objid IS NULL THEN 0  ELSE 1 END AS voided
FROM cashreceipt cr 
	LEFT JOIN cashreceipt_void cv ON cr.objid = cv.receiptid 
	LEFT JOIN remittance_cashreceipt rc ON cr.objid = rc.objid 
WHERE cr.collector_objid = $P{userid}
  AND rc.objid IS NULL 
ORDER BY cr.txndate DESC   



[getItemsForPrinting]
SELECT
	t.rptledgerid,
	t.tdno,
	(SELECT owner_name FROM faas WHERE objid = t.faasid ) AS owner_name, 
	t.rputype,
	t.totalav, t.fullpin,
	t.cadastrallotno,
	t.classcode,
	t.totalareasqm,
	t.barangay, 
	CONCAT(
		CASE
		WHEN t.fromyear = t.toyear AND t.fromqtr = 1 AND t.toqtr = 4 
			THEN CONCAT('FULL ', t.toyear)
		WHEN t.fromyear = t.toyear AND t.fromqtr = t.toqtr
			THEN CONCAT(t.toqtr, 'Q, ', t.toyear)
		WHEN t.fromyear = t.toyear 
			THEN CONCAT(t.fromqtr, t.toqtr, 'Q, ', t.toyear)

		WHEN t.fromqtr = 1 AND t.toqtr = 4
			THEN CONCAT('FULL ', t.fromyear, '-', t.toyear)
		WHEN t.fromqtr = 1 AND t.toqtr <> 4
			THEN CONCAT(t.fromyear, '-', t.toqtr, 'Q,', t.toyear)
		WHEN t.fromqtr <> 1 AND t.toqtr = 4
			THEN CONCAT(t.fromqtr, 'Q,', t.fromyear, '-', t.toyear)
		ELSE
			CONCAT(t.fromqtr, 'Q,', t.fromyear, '-', t.toqtr, 'Q,', t.toyear)
		END,
		(CASE WHEN t.partialled = 0 THEN '' ELSE '*P*' END)
	) AS period,
	SUM(t.basic) AS basic, 
	SUM(t.basicdisc) AS basicdisc, 
	SUM(t.basicint) AS basicint, 
	SUM(t.basicdp) AS basicdp, 
	SUM(t.basicnet) AS basicnet,
	SUM(t.sef) AS sef,  
	SUM(t.sefdisc) AS sefdisc, 
	SUM(t.sefint) AS sefint, 
	SUM(t.sefdp) AS sefdp, 
	SUM(t.sefnet) AS sefnet,
	SUM(t.firecode) AS firecode,
	SUM(t.amount) AS amount
FROM ( 
	SELECT
		cri.rptledgerid,
		f.objid AS faasid,
		f.tdno,
		r.rputype,
		r.totalav, r.fullpin,
		r.totalareasqm,
		rp.cadastrallotno,
		pc.code AS classcode,
		b.name AS barangay,
		MIN(cri.year) AS fromyear,
		(SELECT MIN(CASE WHEN qtr = 0 THEN fromqtr ELSE qtr END)  FROM cashreceiptitem_rpt_online WHERE rptreceiptid = cri.rptreceiptid AND rptledgerid = cri.rptledgerid AND YEAR = MIN(cri.year) ) AS fromqtr,
		MAX(cri.year) AS toyear,
		(SELECT MAX(CASE WHEN qtr = 0 THEN toqtr ELSE qtr END) FROM cashreceiptitem_rpt_online WHERE rptreceiptid = cri.rptreceiptid AND  rptledgerid = cri.rptledgerid AND YEAR = MAX(cri.year) ) AS toqtr,
		SUM(basic) AS basic,
		SUM(basicint) AS basicint,
		SUM(basicdisc) AS basicdisc,
		SUM(basicint - basicdisc) AS basicdp,
		SUM(basic + basicint - basicdisc) AS basicnet,
		SUM(sef) AS sef,
		SUM(sefint) AS sefint,
		SUM(sefdisc) AS sefdisc,
		SUM(sefint - sefdisc) AS sefdp,
		SUM(sef + sefint - sefdisc) AS sefnet,
		SUM(firecode) AS firecode,
		SUM(basic + basicint - basicdisc + sef + sefint - sefdisc ) AS amount,
		MAX(cri.partialled) AS partialled 
	FROM cashreceiptitem_rpt_online cri
		INNER JOIN rptledger rl ON cri.rptledgerid = rl.objid 
		INNER JOIN faas f ON rl.faasid = f.objid 
		INNER JOIN rpu r ON f.rpuid = r.objid 
		INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
		INNER JOIN realproperty rp ON r.realpropertyid = rp.objid 
		INNER JOIN barangay b ON rp.barangayid = b.objid 
	WHERE cri.rptreceiptid = $P{rptreceiptid}
	GROUP BY 
		cri.rptreceiptid,
		cri.rptledgerid, 
		f.objid,
		f.tdno, 
		r.rputype, r.totalav, r.fullpin, r.totalareasqm,
		rp.cadastrallotno,
		pc.code, b.name
	) t
GROUP BY 
		t.rptledgerid,
		t.faasid, 
		t.tdno,
		t.rputype,
		t.totalav, t.fullpin,
		t.cadastrallotno,
		t.classcode,
		t.barangay,
		t.totalareasqm,
		t.partialled,
		t.fromyear,
		t.fromqtr,
		t.toyear, 
		t.toqtr



[getNoLedgerItemsForPrinting]	
SELECT
	t.*,
	CONCAT(
		(SELECT MIN(CASE WHEN qtr = 0 THEN fromqtr ELSE qtr END) FROM cashreceiptitem_rpt_online WHERE rptreceiptid = t.rptreceiptid AND year = t.minyear),
		'Q,', t.minyear, ' - ',
		(SELECT MAX(CASE WHEN qtr = 0 THEN toqtr ELSE qtr END) FROM cashreceiptitem_rpt_online WHERE rptreceiptid = t.rptreceiptid AND year = t.maxyear), 
		'Q,', t.maxyear
	) AS	period 
FROM (
	SELECT
		cri.rptreceiptid,
		nl.tdno,
		cr.payer_name AS owner_name,
		nl.rputype,
		nl.originalav  AS totalav,
		nl.pin AS fullpin,
		nl.cadastrallotno AS cadastrallotno,
		nl.classification_objid AS classcode,
		b.name AS barangay,
		MIN(cri.year) AS minyear,
		MAX(cri.year) AS maxyear,
		SUM(basic) AS basic, 
		SUM(basicdisc) AS basicdisc, 
		SUM(basicint) AS basicint, 
		SUM(basicint - basicdisc) AS basicdp, 
		SUM(basic + basicint - basicdisc) AS basicnet,
		SUM(sef) AS sef,  
		SUM(sefdisc) AS sefdisc, 
		SUM(sefint) AS sefint, 
		SUM(sefint - sefdisc) AS sefdp, 
		SUM(sef + sefint - sefdisc) AS sefnet,
		SUM(firecode) AS firecode,
		SUM(basic + basicint- basicdisc + sef + sefint - sefdisc + firecode) AS amount
	FROM cashreceipt cr
		INNER JOIN cashreceiptitem_rpt_online cri ON cr.objid = cri.rptreceiptid
		INNER JOIN cashreceiptitem_rpt_noledger nl ON cri.objid = nl.objid 
		INNER JOIN barangay b ON nl.barangay_objid = b.objid 
	WHERE cr.objid = $P{objid}
	GROUP BY 
		cri.rptreceiptid,
		cr.payer_name,
		nl.tdno,
		nl.rputype,
		nl.originalav,
		nl.pin,
		nl.cadastrallotno,
		nl.classification_objid ,
		b.name
) t





[getLedgersMinPaidYearAndQtr] 
SELECT 
	x.*,
	CASE WHEN x.qtr = 0 THEN x.fromqtr ELSE x.qtr END AS minqtr
FROM
(
	SELECT 
		t.*,
		MIN(ri.qtr) AS qtr,
		MIN(ri.fromqtr) AS fromqtr,
		MAX(ri.toqtr) AS toqtr
	FROM (
		SELECT 
			cr.rptreceiptid, 
			cr.rptledgerid, 
			c.txndate, 
			MIN(cr.year) AS minyear
		FROM cashreceiptitem_rpt_online cr 
			INNER JOIN cashreceipt c ON cr.rptreceiptid = c.objid 
		WHERE cr.rptreceiptid = $P{rptreceiptid}
		GROUP BY cr.rptreceiptid, cr.rptledgerid, c.txndate
	)t
	INNER JOIN cashreceiptitem_rpt_online ri ON t.rptreceiptid = ri.rptreceiptid AND t.minyear = ri.year 
	GROUP BY t.rptreceiptid, t.rptledgerid, t.minyear, t.txndate
) x	


[findLedgerPartialInfo]
SELECT * FROM rptledger WHERE objid = $P{rptledgerid}


[findReceiptPartialInfo]
SELECT 
	basic AS partialbasic, 
	basicdisc AS partialbasicdisc, 
	basicint AS partialbasicint, 
	sef AS partialsef, 
	sefdisc AS partialsefdisc, 
	sefint  AS partialsefint
FROM cashreceiptitem_rpt_online cr
WHERE cr.rptreceiptid = $P{rptreceiptid}
  AND cr.partialled = 1
  

[findPreviousReceipt]
SELECT cr.objid AS rptreceiptid, cr.txndate 
FROM cashreceipt cr 
	LEFT JOIN cashreceipt_void cv ON cr.objid = cv.receiptid 
	INNER JOIN cashreceiptitem_rpt_online cro ON cr.objid = cro.rptreceiptid 
WHERE cro.rptledgerid = $P{rptledgerid}
	AND cr.txndate < $P{txndate}
	AND cv.objid IS NULL 
ORDER BY cr.objid, cr.txndate DESC 
LIMIT 1





[resetVoidedLedgerInfo]
UPDATE rptledger SET 
	nextbilldate = null,
	lastyearpaid = $P{toyear},
	lastqtrpaid = $P{toqtr},
	partialbasic = $P{partialbasic},
	partialbasicint = $P{partialbasicint},
	partialbasicdisc = $P{partialbasicdisc},
	partialsef = $P{partialsef},
	partialsefint = $P{partialsefint},
	partialsefdisc = $P{partialsefdisc},
	partialledyear = $P{partialledyear},
	partialledqtr  = $P{partialledqtr},
	lastbilledyear = $P{lastbilledyear},
	lastbilledqtr  = $P{lastbilledqtr}
WHERE objid = $P{rptledgerid}	



[getSummarizedCashReceiptItems]
SELECT
	rb.objid AS item_objid,
	rb.code AS item_code, 
	rb.title AS item_title,
	rb.fund_objid AS item_fund_objid, rb.fund_code AS item_fund_code, rb.fund_title AS item_fund_title,
	SUM(ba.amount) AS amount
FROM rptledger rl
	INNER JOIN rptbill_ledger_account ba ON rl.objid = ba.rptledgerid
	INNER JOIN revenueitem rb ON ba.item_objid = rb.objid 
WHERE ${filter}
GROUP BY 
	rb.objid, rb.code, rb.title, rb.fund_objid,
	rb.fund_code, rb.fund_title


[findRevenueItemById]
SELECT 
	objid, code, title, 
	fund_objid, fund_code, fund_title
FROM revenueitem 
WHERE objid = $P{objid}


