[getList]
SELECT * FROM bankdeposit b 
where b.cashier_objid like $P{cashierid}
	and b.txnno like $P{searchtext} 
order by dtposted desc 

[getListByLiquidationNo]
SELECT distinct b.* FROM bankdeposit b
	inner join bankdeposit_liquidation bl on bl.bankdepositid = b.objid 
	inner join liquidation_cashier_fund lcf on lcf.objid = bl.objid
	inner join liquidation l on lcf.liquidationid = l.objid 
where b.cashier_objid like $P{cashierid}
	and l.txnno like $P{searchtext} 
order by b.dtposted desc 

[getUndepositedLiquidation]
SELECT  distinct 
	l.objid, 
	l.txnno as liquidationno,
	l.dtposted as liquidationdate,
	l.liquidatingofficer_objid, 
	l.liquidatingofficer_name, 	
	l.liquidatingofficer_title, 
	l.amount
FROM liquidation l
INNER JOIN liquidation_cashier_fund lcf ON lcf.liquidationid=l.objid
LEFT JOIN bankdeposit_liquidation bdl ON bdl.objid=lcf.objid
WHERE lcf.cashier_objid = $P{cashierid}
	and l.state = 'OPEN'
AND bdl.objid IS NULL


[getUndeposited]
SELECT  lcf.objid, 
	l.txnno as liquidationno,
	l.dtposted as liquidationdate,
	lcf.fund_objid,
	lcf.fund_title,
	liquidatingofficer_objid, 
	liquidatingofficer_name, 	
	liquidatingofficer_title, 
	lcf.amount
FROM liquidation_cashier_fund lcf
INNER JOIN liquidation l ON lcf.liquidationid=l.objid
LEFT JOIN bankdeposit_liquidation bdl ON bdl.objid=lcf.objid
WHERE l.objid in ( ${liquidationids} )
	and l.state = 'OPEN'
AND bdl.objid IS NULL

[getUndepositedByFund]
SELECT a.fund_objid,
       a.fund_title,
       SUM(a.amount) AS amount
FROM
( SELECT  
	lcf.fund_objid,
	lcf.fund_title,
	lcf.amount
FROM liquidation l
INNER JOIN liquidation_cashier_fund lcf ON lcf.liquidationid=l.objid
LEFT JOIN bankdeposit_liquidation bdl ON bdl.objid=lcf.objid
WHERE l.state = 'OPEN'
AND l.objid in ( ${liquidationids} )
AND bdl.objid IS NULL) a
GROUP BY a.fund_objid, a.fund_title

[getUndepositedChecks]
SELECT DISTINCT
crp.objid, crp.checkno, crp.particulars, crp.amount  
FROM   liquidation l  
INNER JOIN liquidation_checkpayment lc ON lc.liquidationid=l.objid 
INNER JOIN cashreceiptpayment_check crp ON crp.objid=lc.objid
LEFT JOIN bankdeposit_entry_check bec on bec.objid = crp.objid
LEFT JOIN cashreceipt_void cv ON crp.receiptid = cv.receiptid 
WHERE l.objid  in ( ${liquidationids} )
	 AND l.state = 'OPEN'
	 and bec.objid is null 
AND cv.objid IS NULL 

[getUndepositedChecksByFund]
SELECT DISTINCT
crp.objid, crp.checkno, crp.particulars, crp.amount  
FROM  liquidation_cashier_fund lcf  
INNER JOIN liquidation_checkpayment lc ON lc.liquidationfundid=lcf.objid
inner join liquidation l on l.objid = lcf.liquidationid 
INNER JOIN cashreceiptpayment_check crp ON crp.objid=lc.objid 
LEFT JOIN bankdeposit_entry_check bec on bec.objid = crp.objid
LEFT JOIN cashreceipt_void cv ON crp.receiptid = cv.receiptid 
WHERE lcf.cashier_objid=$P{cashierid}
	AND lcf.fund_objid in ( ${fundids} )
	and l.state = 'OPEN'
	and bec.objid is null 
AND cv.objid IS NULL 

[getDepositSummaries]
SELECT 
	 be.*,ba.fund_objid, ba.fund_code, ba.fund_title,
	 ba.bank_code, ba.bank_name, ba.bank_objid, b.branchname, ba.accttype, 
	 ba.cashreport, ba.cashbreakdownreport, ba.checkreport, ba.checkbreakdownreport
FROM bankdeposit_entry be
	INNER JOIN bankaccount ba ON be.bankaccount_objid = ba.objid
	left join bank b on b.objid = ba.bank_objid 
WHERE be.parentid = $P{objid}
ORDER BY ba.fund_title 

[getDepositedChecks]
select 
	crp.* 
from bankdeposit_entry_check bec
  inner join cashreceiptpayment_check crp on crp.objid = bec.objid 
where bec.parentid=$P{objid} 
order by crp.bank 


[getFundSummaries]
SELECT a.fund_objid,
       a.fund_title,
       SUM(a.amount) AS amount
FROM
( SELECT  
	lcf.fund_objid,
	lcf.fund_title,
	lcf.amount
FROM bankdeposit_liquidation bdl 
	INNER JOIN liquidation_cashier_fund lcf ON bdl.objid=lcf.objid
	INNER JOIN liquidation l ON lcf.liquidationid=l.objid
WHERE bdl.bankdepositid = $P{objid}
) a 
GROUP BY a.fund_objid, a.fund_title

[getPostedLiquidations]
SELECT  lcf.objid, 
	l.txnno as liquidationno,
	l.dtposted as liquidationdate,
	lcf.fund_objid,
	lcf.fund_title,
	l.liquidatingofficer_objid, 
	l.liquidatingofficer_name, 	
	l.liquidatingofficer_title, 
	lcf.amount
FROM bankdeposit_liquidation bdl 
INNER join liquidation_cashier_fund lcf on lcf.objid = bdl.objid 
INNER JOIN liquidation l ON lcf.liquidationid=l.objid
WHERE bdl.bankdepositid=$P{objid}



[findFundByBankEntryId]
SELECT ba.fund_objid AS objid, ba.fund_title AS title
FROM bankdeposit_entry be
	INNER JOIN bankaccount ba ON be.bankaccount_objid = ba.objid 
WHERE be.objid = $P{objid}	


[getBankAccountsByFund]
SELECT * FROM bankaccount WHERE fund_objid = $P{objid}
