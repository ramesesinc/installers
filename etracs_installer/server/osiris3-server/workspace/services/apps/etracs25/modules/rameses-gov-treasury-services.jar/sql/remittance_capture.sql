[getList]
SELECT r.*,
CASE WHEN lr.objid IS NULL THEN 0 ELSE 1 END AS liquidated 
FROM remittance r
LEFT JOIN liquidation_remittance lr ON r.objid=lr.objid
WHERE r.txnno like $P{txnno}
	and r.state = 'CAPTURE'
ORDER BY r.collector_name, r.txnno DESC 


[getCapturedCollections]
select
	MIN(bc.formno) as formno,  min(c.collector_objid) as collector_objid, bc.objid, 
	bc.controlid,  MIN(c.receiptno) as sstartseries,  MAX(c.receiptno) as sendseries, 
	MIN(c.series) as startseries,  MAX(c.series) as endseries, 
	SUM(CASE WHEN v.objid IS NULL THEN c.amount ELSE 0 END) AS amount,
 	SUM(CASE WHEN v.objid IS NULL THEN c.totalcash-c.cashchange ELSE 0 END) AS totalcash,
   SUM(CASE WHEN v.objid IS NULL THEN c.totalnoncash ELSE 0 END) AS totalnoncash
from batchcapture_collection bc 
  inner join batchcapture_collection_entry bi on bc.objid = bi.parentid 
  inner join cashreceipt c on c.objid = bi.objid 
  LEFT JOIN cashreceipt_void v ON c.objid=v.receiptid
  left join remittance_cashreceipt rc on rc.objid = c.objid 
where bc.state = 'POSTED' 
 and rc.objid is null 
 and bc.collector_objid =  $P{collectorid}  
group by bc.objid, bc.controlid    

union 

select 
	c.formno, c.collector_objid, c.objid, c.controlid, c.receiptno as sstartseries, 
	c.receiptno as sendseries, null as startseries, null as endseries, 
	CASE WHEN v.objid IS NULL THEN c.amount ELSE 0 END AS amount,
 	CASE WHEN v.objid IS NULL THEN c.totalcash-c.cashchange ELSE 0 END AS totalcash,
    CASE WHEN v.objid IS NULL THEN c.totalnoncash ELSE 0 END AS totalnoncash	
from cashreceipt c 
	LEFT JOIN cashreceipt_void v ON c.objid=v.receiptid
	 left join remittance_cashreceipt rc on rc.objid = c.objid 
where state = 'CAPTURED' 
	and formtype='cashticket'
	and rc.objid is null 
	and collector_objid= $P{collectorid}  


[collectReceipts]
INSERT INTO remittance_cashreceipt (objid, remittanceid)
SELECT c.objid, $P{remittanceid} 
FROM cashreceipt c 
LEFT JOIN remittance_cashreceipt r ON c.objid=r.objid
WHERE r.objid IS NULL 
	and c.controlid = $P{controlid}
	and c.series between $P{startseries} and $P{endseries}

[collectCashticket]
INSERT INTO remittance_cashreceipt (objid, remittanceid)
SELECT c.objid, $P{remittanceid} 
FROM cashreceipt c 
LEFT JOIN remittance_cashreceipt r ON c.objid=r.objid
WHERE r.objid IS NULL 
	and c.objid = $P{objid}

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
	and cash.controlid = $P{controlid}
	and cash.series between $P{startseries} and $P{endseries}	


[getUnremittedReceipts]
select
	c.formno, c.receiptno, c.paidby, c.receiptdate,
	CASE WHEN v.objid IS NULL THEN c.amount ELSE 0 END AS amount,
	CASE WHEN v.objid IS NULL THEN 0 ELSE 1 END AS voided,
	c.user_name as subcollector_name 
from batchcapture_collection bc 
  inner join batchcapture_collection_entry bi on bc.objid = bi.parentid 
  inner join cashreceipt c on c.objid = bi.objid 
  left join remittance_cashreceipt rc on rc.objid = c.objid 
  LEFT JOIN cashreceipt_void v ON c.objid=v.receiptid
where bc.objid = $P{objid}

union 

SELECT
	c.formno, c.receiptno, c.paidby, c.receiptdate,
	CASE WHEN v.objid IS NULL THEN c.amount ELSE 0 END AS amount,
	CASE WHEN v.objid IS NULL THEN 0 ELSE 1 END AS voided,
	c.user_name as subcollector_name 
from cashreceipt c 
	LEFT JOIN cashreceipt_void v ON c.objid=v.receiptid 
where c.objid=$P{objid}


[getUnremittedChecks]
SELECT 
crp.objid, crp.checkno, crp.particulars, 
CASE WHEN cv.objid IS NULL THEN crp.amount ELSE 0 END AS amount,
CASE WHEN cv.objid IS NULL THEN 0 ELSE 1 END AS voided,
cash.user_name as  subcollector_name
from batchcapture_collection bc 
  	inner join batchcapture_collection_entry bi on bc.objid = bi.parentid 
	inner join cashreceipt cash on cash.objid = bi.objid 
	INNER JOIN cashreceiptpayment_check crp ON crp.receiptid=cash.objid
	LEFT JOIN cashreceipt_void cv ON crp.receiptid = cv.receiptid
	LEFT JOIN remittance_cashreceipt rc ON rc.objid=cash.objid
WHERE bc.objid=$P{objid}

[getCollectors]
select 
	distinct collector_objid as objid, 
	collector_name as name, collector_title as title 
from batchcapture_collection
where state = 'POSTED' 

union 

select 
	distinct c.collector_objid as objid, 
	c.collector_name as name, c.collector_title as title 
from cashreceipt c 
	left join remittance_cashreceipt rc on c.objid = rc.objid 
where c.state = 'CAPTURED' 
	and rc.objid is null 
	and c.formno in ('CT2', 'CT5')

[updateRemittanceAF]
INSERT INTO remittance_afserial (objid,remittanceid)
SELECT ad.objid, $P{remittanceid} 
FROM afserial_inventory_detail ad
INNER JOIN afserial_inventory ai ON ai.objid=ad.controlid
LEFT JOIN remittance_afserial af ON af.objid=ad.objid
WHERE ai.objid = $P{controlid}
AND af.objid IS NULL

[updateRemittanceCashTicket]
INSERT INTO remittance_cashticket (objid,remittanceid)
SELECT ad.objid, $P{remittanceid} 
FROM cashticket_inventory_detail ad
INNER JOIN cashticket_inventory ai ON ai.objid=ad.controlid
LEFT JOIN remittance_cashticket af ON af.objid=ad.objid
WHERE ai.objid = $P{controlid}
AND af.objid IS NULL
