[getLiquidationInfo]
select 
  l.txnno, l.dtposted, l.liquidatingofficer_name, l.liquidatingofficer_title, 
  lc.fund_title, lc.cashier_name, su.jobtitle as cashier_title, lc.amount, l.cashbreakdown
from liquidation l  
   inner join liquidation_cashier_fund lc on lc.liquidationid = l.objid 
   inner join sys_user su on su.objid = lc.cashier_objid  
where l.objid =$P{liquidationid} 
  and lc.fund_objid =$P{fundname} 


[getRCDRemittances]
select 
    r.collector_name as collectorname, r.txnno, r.dtposted, rf.amount 
from liquidation_remittance lr 
inner join remittance r on r.objid = lr.objid
inner join remittance_fund rf ON rf.remittanceid=r.objid 
where lr.liquidationid = $P{liquidationid}  and rf.fund_objid  like $P{fundname} 
order by r.txnno 

[getRCDRemittancesSummary]
select 
    min(r.collector_name) as collectorname, min(r.txnno) as txnno, min(r.dtposted) as dtposted , min(r.amount) as amount 
from liquidation_remittance lr 
inner join remittance r on r.objid = lr.objid
where lr.liquidationid = $P{liquidationid}
group by lr.objid   
order by txnno 

[getRCDCollectionSummary]
select  
   lcf.fund_title   as particulars, lcf.amount as amount 
from liquidation_cashier_fund  lcf 
where lcf.liquidationid=$P{liquidationid} 
and lcf.fund_objid  like $P{fundname} 


[getRCDCollectionSummary_bak]
select  
  ( 'AF#' + a.objid +  ': ' + min(ct.title) + ' - ' + min(ri.fund_title) )  as particulars,  
  sum( case when crv.objid is null then cri.amount else 0.0 end ) as amount 
from liquidation_remittance  lr 
   inner join remittance_cashreceipt rc  on rc.remittanceid = lr.objid 
   inner join cashreceipt cr on rc.objid = cr.objid 
   left join cashreceipt_void crv on crv.receiptid = cr.objid 
   inner join collectionform a on a.objid = cr.formno 
   inner join collectiontype ct on ct.objid = cr.collectiontype_objid 
   inner join cashreceiptitem cri on cri.receiptid = cr.objid
   inner join revenueitem ri on ri.objid = cri.item_objid 
where lr.liquidationid=$P{liquidationid} and ri.fund_objid  like $P{fundname}
group by a.objid, ri.fund_objid, ct.objid

[getRCDSerialRemittedForms]
SELECT a.*, 
  (a.receivedendseries-a.receivedstartseries+1) AS qtyreceived,
  (a.beginendseries-a.beginstartseries+1) AS qtybegin,
  (a.issuedendseries-a.issuedstartseries+1) AS qtyissued,
  case when a.issuedendseries = a.endingstartseries then 0 
  else  (a.endingendseries-a.endingstartseries+1) end AS qtyending
FROM
(SELECT 
   ai.afid formno,   
   MIN( ad.receivedstartseries ) AS receivedstartseries,
   MAX( ad.receivedendseries ) AS receivedendseries,
   MAX( ad.beginstartseries ) AS beginstartseries,
   MAX( ad.beginendseries ) AS beginendseries,
   MIN( ad.issuedstartseries ) AS issuedstartseries,
   MAX( ad.issuedendseries ) AS issuedendseries,
   MAX( ad.endingstartseries ) AS endingstartseries,
   MAX( ad.endingendseries ) AS endingendseries
FROM afserial_inventory_detail ad 
INNER JOIN afserial_inventory ai ON ad.controlid=ai.objid
INNER JOIN remittance_afserial r ON r.objid=ad.objid
INNER join liquidation_remittance lr on lr.objid=r.remittanceid 
where lr.liquidationid=$P{liquidationid}
GROUP BY ai.afid, ad.controlid) a
order by a.formno, a.endingstartseries


[getRCDNonSerialRemittedForms]
SELECT a.*, 
    a.qtyreceived+a.qtybegin-a.qtyissued-a.qtycancelled AS qtyending,
    a.receivedamt+a.beginamt-a.issuedamt-a.cancelledamt AS endingamt
FROM
(SELECT 
   ai.afid AS formno,   
   SUM( ad.qtyreceived ) AS qtyreceived,
   sum( ad.qtyreceived * ch.denomination) as receivedamt,
   SUM( ad.qtybegin ) AS qtybegin,
   sum( ad.qtybegin * ch.denomination) as beginamt,
   SUM( ad.qtyissued ) AS qtyissued,
   sum( ad.qtyissued * ch.denomination) as issuedamt,
   SUM( ad.qtycancelled ) AS qtycancelled,  
   sum( ad.qtycancelled * ch.denomination) as cancelledamt
FROM cashticket_inventory_detail ad 
INNER JOIN cashticket_inventory ai ON ad.controlid=ai.objid
INNER JOIN remittance_cashticket r ON r.objid = ad.objid
INNER join liquidation_remittance lr on lr.objid=r.remittanceid 
INNER join cashticket ch on ch.objid = ai.afid 
where lr.liquidationid=$P{liquidationid} 
GROUP BY ai.afid) a

[getRCDOtherPayments]
select  'CHECK' as paytype, pc.particulars, cri.amount  as amount 
from liquidation_remittance  lr 
   inner join remittance_cashreceipt rc  on rc.remittanceid = lr.objid 
   inner join cashreceipt cr on rc.objid = cr.objid 
   inner join cashreceiptpayment_check pc on pc.receiptid = rc.objid 
   left join cashreceipt_void crv on crv.receiptid = cr.objid 
   inner join cashreceiptitem cri on cri.receiptid = cr.objid
   inner join revenueitem ri on ri.objid = cri.item_objid   
where lr.liquidationid=$P{liquidationid} and ri.fund_objid =$P{fundname} 
  and crv.objid is null 



[getLiquidationFundlist]
select fund_objid as fundid, fund_title as fundname 
from liquidation_cashier_fund 
where liquidationid=$P{liquidationid}

[getFundSummaries]
SELECT * FROM liquidation_cashier_fund WHERE liquidationid = $P{liquidationid}

[getLiquidationCashierList]
select 
  distinct f.cashier_name as name, su.jobtitle 
from liquidation_cashier_fund f 
  inner join sys_user su on su.objid = f.cashier_objid 
where liquidationid = $P{liquidationid} 