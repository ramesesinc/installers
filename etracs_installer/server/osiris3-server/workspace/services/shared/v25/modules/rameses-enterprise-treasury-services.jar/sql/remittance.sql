[getList]
SELECT r.*,
CASE WHEN lr.objid IS NULL THEN 0 ELSE 1 END AS liquidated 
FROM remittance r
LEFT JOIN liquidation_remittance lr ON r.objid=lr.objid 
WHERE r.collector_objid like $P{collectorid} 
	and r.txnno like $P{searchtext}
ORDER BY r.collector_name, r.txnno DESC 

[getListBySeries]
SELECT distinct r.*,
CASE WHEN lr.objid IS NULL THEN 0 ELSE 1 END AS liquidated 
FROM remittance r 
INNER JOIN remittance_cashreceipt rc on rc.remittanceid = r.objid
inner join cashreceipt c on c.objid = rc.objid 
LEFT JOIN liquidation_remittance lr ON r.objid=lr.objid 
WHERE r.collector_objid like $P{collectorid}  
  and c.receiptno like $P{searchtext} 
ORDER BY r.collector_name, r.txnno DESC 

[getListByCollector]
SELECT r.*,
CASE WHEN lr.objid IS NULL THEN 0 ELSE 1 END AS liquidated 
FROM remittance r 
LEFT JOIN liquidation_remittance lr ON r.objid=lr.objid 
WHERE r.collector_name like $P{searchtext} 
ORDER BY r.collector_name, r.txnno DESC 

[getUnremittedForCollector]
SELECT c.formno, c.collector_objid, c.controlid, 
  MIN(series) as startseries, 
  MAX(series) as endseries,
  SUM( CASE WHEN c.state = 'POSTED' then 1 else 0 end ) as qty ,  
  SUM( CASE WHEN c.state = 'CANCELLED' then 1 else 0 end ) as cqty , 
  SUM(CASE WHEN v.objid IS NULL THEN c.amount ELSE 0 END) AS amount,
  SUM(CASE WHEN v.objid IS NULL THEN c.totalcash-c.cashchange ELSE 0 END) AS totalcash,
  SUM(CASE WHEN v.objid IS NULL THEN c.totalnoncash ELSE 0 END) AS totalnoncash
FROM cashreceipt c 
LEFT JOIN remittance_cashreceipt r ON c.objid=r.objid
LEFT JOIN cashreceipt_void v ON c.objid=v.receiptid
WHERE r.objid IS NULL
and c.receiptdate < $P{txndate}
AND c.state in  ('POSTED', 'CANCELLED') 
AND c.collector_objid = $P{collectorid}
GROUP by c.collector_objid, c.formno, c.controlid

[getUnremittedCancelSeries]
SELECT 
  cs.*, c.series 
FROM cashreceipt c 
INNER JOIN cashreceipt_cancelseries cs on cs.receiptid = c.objid
LEFT JOIN remittance_cashreceipt r ON c.objid=r.objid
WHERE r.objid IS NULL
AND c.state = 'CANCELLED' 
AND c.collector_objid = $P{collectorid}
and c.controlid = $P{controlid}

[getUnremittedTotals]
SELECT COUNT(*) AS itemcount, 
SUM( CASE WHEN v.objid IS NULL THEN c.amount ELSE 0 END ) AS totals
FROM cashreceipt c 
LEFT JOIN remittance_cashreceipt r ON c.objid=r.objid
LEFT JOIN cashreceipt_void v ON c.objid=v.receiptid
WHERE r.objid IS NULL
and c.receiptdate < $P{txndate}
AND c.state = 'POSTED'
AND c.collector_objid = $P{collectorid}
GROUP by c.collector_objid

[getUnremittedReceipts]
SELECT c.formno, c.receiptno, c.paidby, c.receiptdate,
CASE WHEN v.objid IS NULL THEN c.amount ELSE 0 END AS amount,
CASE WHEN v.objid IS NULL THEN 0 ELSE 1 END AS voided,
c.subcollector_name
FROM cashreceipt c 
LEFT JOIN remittance_cashreceipt r ON c.objid=r.objid
LEFT JOIN cashreceipt_void v ON c.objid=v.receiptid
WHERE r.objid IS NULL
AND c.state = 'POSTED'
and c.txndate < $P{txndate}  
AND c.collector_objid = $P{collectorid}
ORDER BY c.receiptno

[getUnremittedChecks]
SELECT 
crp.objid, crp.checkno, crp.particulars, 
CASE WHEN cv.objid IS NULL THEN crp.amount ELSE 0 END AS amount,
CASE WHEN cv.objid IS NULL THEN 0 ELSE 1 END AS voided,
cash.subcollector_name
FROM cashreceipt cash 
INNER JOIN cashreceiptpayment_check crp ON crp.receiptid=cash.objid
LEFT JOIN cashreceipt_void cv ON crp.receiptid = cv.receiptid
LEFT JOIN remittance_cashreceipt rc ON rc.objid=cash.objid
WHERE rc.objid IS NULL 
and cash.receiptdate < $P{txndate} 
AND cash.state = 'POSTED'
AND cash.collector_objid = $P{collectorid}

[collectReceipts]
INSERT INTO remittance_cashreceipt (objid, remittanceid)
SELECT c.objid, $P{remittanceid} 
FROM cashreceipt c 
LEFT JOIN remittance_cashreceipt r ON c.objid=r.objid
WHERE r.objid IS NULL 
and c.receiptdate < $P{txndate} 
AND c.state in ('POSTED', 'CANCELLED')
AND c.collector_objid = $P{collectorid}


[collectChecks]
INSERT INTO remittance_checkpayment (objid, remittanceid, amount, voided )
SELECT 
crp.objid, $P{remittanceid}, crp.amount,   
CASE WHEN cv.objid IS NULL THEN 0 ELSE 1 END AS voided
FROM cashreceipt cash 
INNER JOIN cashreceiptpayment_check crp ON crp.receiptid=cash.objid
LEFT JOIN remittance_cashreceipt rc ON rc.objid=cash.objid
LEFT JOIN cashreceipt_void cv ON crp.receiptid = cv.receiptid
WHERE rc.remittanceid = $P{remittanceid}
AND cash.state = 'POSTED'
and cash.receiptdate < $P{txndate} 

[getRemittedFundTotals]
SELECT ri.fund_objid, ri.fund_title, SUM(chi.amount) AS amount
FROM remittance_cashreceipt c
INNER JOIN cashreceipt ch on c.objid = ch.objid 
INNER JOIN cashreceiptitem chi on chi.receiptid = ch.objid
INNER JOIN revenueitem ri on ri.objid = chi.item_objid
LEFT JOIN cashreceipt_void cv ON c.objid = cv.receiptid 
WHERE c.remittanceid = $P{remittanceid}
AND cv.objid IS NULL 
and ch.receiptdate < $P{txndate}
GROUP BY c.remittanceid, ri.fund_objid, ri.fund_title


[getRemittedChecks]
SELECT 
   crpc.checkno, crpc.particulars, 
   CASE WHEN rc.voided = 1 THEN 0 ELSE rc.amount END AS amount, 
   rc.voided
FROM remittance_checkpayment rc
INNER JOIN cashreceiptpayment_check crpc ON crpc.objid=rc.objid
WHERE rc.remittanceid  = $P{objid}

[getRemittedReceipts]
SELECT c.formno, c.receiptno, c.paidby, c.receiptdate,
CASE WHEN v.objid IS NULL THEN c.amount ELSE 0 END AS amount,
CASE WHEN v.objid IS NULL THEN 0 ELSE 1 END AS voided,
c.subcollector_name
FROM cashreceipt c 
LEFT JOIN remittance_cashreceipt r ON c.objid=r.objid
LEFT JOIN cashreceipt_void v ON c.objid=v.receiptid
WHERE r.remittanceid = $P{objid}
ORDER BY c.receiptno
