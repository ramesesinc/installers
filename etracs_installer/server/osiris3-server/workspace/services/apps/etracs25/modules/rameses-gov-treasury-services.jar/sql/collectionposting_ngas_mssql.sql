
[getOpenDeposits]
SELECT bd.objid, bd.txnno, bd.dtposted, bd.cashier_name, bd.cashier_title, bd.amount 
FROM bankdeposit bd
   LEFT JOIN ngas_revenue_deposit d ON bd.objid = d.objid 
WHERE bd.dtposted <=  $P{adjtxndate}
  AND d.objid IS NULL 
ORDER BY bd.txnno   


[getOpenMigratedRemittances]
SELECT r.objid, r.txnno, r.dtposted, r.collector_name, r.collector_title, r.amount 
FROM tracs_remittance r
   LEFT JOIN ngas_revenue_remittance nr ON r.objid = nr.objid 
WHERE r.dtposted <=  $P{adjtxndate}
  AND nr.objid IS NULL 
ORDER BY r.txnno   



[insertRevenue]
INSERT INTO ngas_revenue (
   objid,
   state,
   type,
   txndate,
   dtposted,
   postedby_objid,
   postedby_name,
   postedby_title,
   amount
)  
VALUES (
   $P{objid},
   $P{state},
   $P{type},
   $P{txndate},
   $P{dtposted},
   $P{postedby_objid},
   $P{postedby_name},
   $P{postedby_title},
   $P{amount}
)

[insertDeposit]
INSERT INTO ngas_revenue_deposit 
   (objid, parentid)
VALUES
   ($P{objid}, $P{parentid})


[insertTracsRemittance]
INSERT INTO ngas_revenue_remittance 
   (objid, parentid)
VALUES   
   ($P{objid}, $P{parentid})


[insertRevenueItems]
INSERT INTO ngas_revenueitem (
   objid,
   parentid,
   refid,
   refsource,
   refno,
   refdate,
   item_objid,
   fund_objid,
   acct_objid,
   subacct_objid,
   collectiontype_objid,
   amount,
   remittanceid,
   liquidationid,
   depositid
)
SELECT 
   cri.objid,
   $P{parentid} AS parentid,
   cri.receiptid AS refid,
   'CashReceipt' AS  refsource,
   cr.receiptno AS refno,
   cr.txndate AS refdate,
   cri.item_objid,
   ri.fund_objid,
   acct.objid AS acct_objid,
   sacct.objid AS subacct_objid,
   cr.collectiontype_objid,
   cri.amount,
   rc.remittanceid,
   lr.liquidationid,
   $P{objid} AS depositid
FROM cashreceipt cr 
   INNER JOIN cashreceiptitem cri ON cr.objid = cri.receiptid 
   INNER JOIN revenueitem ri ON cri.item_objid = ri.objid 
   INNER JOIN remittance_cashreceipt rc ON cr.objid = rc.objid 
   INNER JOIN liquidation_remittance lr ON rc.remittanceid = lr.objid 
   LEFT JOIN revenueitem_account acct ON ri.objid = acct.objid
   LEFT JOIN revenueitem_subaccount sacct ON ri.objid = sacct.objid
WHERE cr.objid IN (
   SELECT rc.objid
   FROM remittance_cashreceipt rc 
   WHERE rc.remittanceid IN(
      SELECT 
         lr.objid
      FROM liquidation_remittance lr
      WHERE lr.liquidationid IN (
         SELECT DISTINCT l.liquidationid
         FROM liquidation_cashier_fund l
            INNER JOIN bankdeposit_liquidation bl ON l.objid = bl.objid
         WHERE bl.bankdepositid = $P{objid}   
      )
   )
)



[insertTracsRevenueItems]
INSERT INTO ngas_revenueitem (
   objid,
   parentid,
   refid,
   refsource,
   refno,
   refdate,
   item_objid,
   fund_objid,
   acct_objid,
   subacct_objid,
   collectiontype_objid,
   amount,
   remittanceid,
   liquidationid,
   depositid
)
SELECT 
   cri.objid,
   $P{parentid} AS parentid,
   cri.receiptid AS refid,
   'CashReceipt' AS  refsource,
   cr.receiptno AS refno,
   cr.receiptdate AS refdate,
   cri.item_objid,
   ri.fund_objid,
   acct.objid AS acct_objid,
   sacct.objid AS subacct_objid,
   cr.collectiontype_objid,
   cri.amount,
   tr.objid AS remittanceid,
   null AS liquidationid,
   NULL AS depositid
FROM tracs_remittance tr 
   INNER JOIN tracs_cashreceipt cr ON tr.objid = cr.remittanceid
    INNER JOIN tracs_cashreceiptitem cri ON cr.objid = cri.receiptid 
    INNER JOIN revenueitem ri ON cri.item_objid = ri.objid 
    LEFT JOIN revenueitem_account acct ON ri.objid = acct.objid
    LEFT JOIN revenueitem_subaccount sacct ON ri.objid = sacct.objid   
WHERE tr.objid = $P{objid}




[getDeposits]
SELECT bd.objid, bd.txnno, bd.dtposted, bd.cashier_name, bd.cashier_title, bd.amount 
FROM ngas_revenue nr
   INNER JOIN ngas_revenue_deposit nrd ON nr.objid = nrd.parentid
   INNER JOIN bankdeposit bd ON nrd.objid = bd.objid 
WHERE nr.objid = $P{objid}
ORDER BY bd.txnno   


[getMigratedRemittances]
SELECT r.objid, r.txnno, r.dtposted, r.collector_name, r.collector_title, r.amount 
FROM ngas_revenue nr
   INNER JOIN ngas_revenue_remittance nrd ON nr.objid = nrd.parentid
   INNER JOIN tracs_remittance r ON nrd.objid = r.objid 
WHERE nr.objid = $P{objid}
ORDER BY r.txnno  

