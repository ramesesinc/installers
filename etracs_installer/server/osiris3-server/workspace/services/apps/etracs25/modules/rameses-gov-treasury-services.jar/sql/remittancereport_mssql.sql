[getRCDCollectionType]
select  
  cr.formno,
  case when min(ch.objid) is null then min( cr.receiptno) else null end as fromseries, 
  case when min(ch.objid) is null then max(cr.receiptno) else null end as toseries, 
  sum( case when crv.objid is null then cr.amount else 0.0 end ) as amount 
from remittance_cashreceipt rc 
   inner join cashreceipt cr on rc.objid = cr.objid 
   left join cashreceipt_void crv on crv.receiptid = cr.objid 
   left join cashticket ch on ch.objid = cr.formno 
where remittanceid=$P{remittanceid}
group by cr.formno, cr.controlid 


[getRCDCollectionSummaries]
select  
  ('AF#' + a.objid +  ': ' + min(ct.title) + '-' + min(ri.fund_title) )  as particulars, 
  sum( case when crv.objid is null then cri.amount else 0.0 end ) as amount 
from remittance_cashreceipt rc 
   inner join cashreceipt cr on rc.objid = cr.objid 
   left join cashreceipt_void crv on crv.receiptid = cr.objid 
   inner join collectionform a on a.objid = cr.formno 
   inner join collectiontype ct on ct.objid = cr.collectiontype_objid 
   inner join cashreceiptitem cri on cri.receiptid = cr.objid
   inner join revenueitem ri on ri.objid = cri.item_objid 
where remittanceid=$P{remittanceid}
group by a.objid, ct.objid, ri.fund_title


[getRCDOtherPayment]
select  pc.particulars, pc.amount 
from remittance_cashreceipt rc 
   inner join cashreceipt cr on rc.objid = cr.objid 
   inner join cashreceiptpayment_check pc on pc.receiptid = rc.objid 
   left join cashreceipt_void crv on crv.receiptid = cr.objid 
where remittanceid=$P{remittanceid}
	and crv.objid is null 


[getNonCashPayments]
SELECT cc.*
FROM remittance r
	INNER JOIN remittance_cashreceipt rc ON r.objid = rc.remittanceid
	INNER JOIN cashreceiptpayment_check cc ON rc.objid = cc.receiptid 
WHERE r.objid = $P{remittanceid}
  AND NOT EXISTS(SELECT * FROM cashreceipt_void WHERE receiptid = cc.receiptid)
ORDER BY cc.bank, cc.checkno   
  

[getReceiptsByRemittanceCollectionType]
select 
  cr.formno as afid, cr.receiptno as serialno, cr.txndate, paidby,
  case when cv.objid is null then ISNULL( ct.title, cr.collectiontype_name) else '***VOIDED***' END AS collectiontype, 
  case when cv.objid is null then cr.amount else 0.0 END AS amount
from remittance_cashreceipt rem 
   inner join cashreceipt cr on cr.objid = rem.objid 
   left join cashreceipt_void cv on cv.receiptid = cr.objid 
   left join collectiontype ct on ct.objid = cr.collectiontype_objid 
where rem.remittanceid=$P{remittanceid} and cr.collectiontype_objid  like $P{collectiontypeid}
ORDER BY afid, serialno 

[getReceiptsByRemittanceFund]
select 
  cr.formno as afid, 
  cr.txndate, ri.fund_title as fundname, cr.remarks as remarks, 
  case when ch.objid is null then cr.receiptno else null end as serialno, 
  case when cv.objid is null then cr.paidby else '***VOIDED***' END AS payer,
  case when cv.objid is null then cri.item_title else '***VOIDED***' END AS particulars,
  case when cv.objid is null then cr.paidbyaddress else '' END AS payeraddress,
  case when cv.objid is null then cri.amount else 0.0 END AS amount
from remittance_cashreceipt rem 
   inner join cashreceipt cr on cr.objid = rem.objid 
   left join cashticket ch on ch.objid = cr.formno 
   left join cashreceipt_void cv on cv.receiptid = cr.objid 
   inner join cashreceiptitem cri on cri.receiptid = cr.objid 
   inner join revenueitem ri on ri.objid = cri.item_objid
where rem.remittanceid=$P{remittanceid} and ri.fund_objid like $P{fundid}
ORDER BY afid, serialno, payer 

[getSerialReceiptsByRemittanceFund]
select 
  cr.formno as afid, cr.receiptno as serialno, cr.txndate, ri.fund_title as fundname, 
  cr.paidby as payer, cri.item_title as particulars, 
  case when cv.objid is null then cri.amount else 0.0 end as amount 
from remittance_cashreceipt rem 
   inner join cashreceipt cr on cr.objid = rem.objid 
   left join cashreceipt_void cv on cv.receiptid = cr.objid 
   inner join collectionform a on a.objid = cr.formno 
   inner join cashreceiptitem cri on cri.receiptid = cr.objid 
   inner join revenueitem ri on ri.objid = cri.item_objid
where rem.remittanceid=$P{remittanceid} 
  and ri.fund_objid like $P{fundid} 
  and a.formtype='serial'
ORDER BY afid, particulars, serialno 

[getNonSerialReceiptDetailsByFund]
select 
  cr.formno as afid, null as serialno, cr.txndate, ri.fund_title as fundname, 
  cr.paidby as payer, cri.item_title as particulars, 
  case when cv.objid is null then cri.amount else 0.0 end as amount 
from remittance_cashreceipt rem 
   inner join cashreceipt cr on cr.objid = rem.objid 
   left join cashreceipt_void cv on cv.receiptid = cr.objid 
   inner join collectionform a on a.objid = cr.formno 
   inner join cashreceiptitem cri on cri.receiptid = cr.objid 
   inner join revenueitem ri on ri.objid = cri.item_objid
where rem.remittanceid=$P{remittanceid} 
  and ri.fund_objid like $P{fundid} 
  and a.formtype='cashticket'
ORDER BY afid, particulars, serialno 


[getRevenueItemSummaryByFund]
select 
  ri.fund_title as fundname, cri.item_objid as acctid, cri.item_title as acctname,
  min(cri.item_code) as acctcode, sum( cri.amount ) as amount 
from remittance_cashreceipt rem 
   inner join cashreceipt cr on cr.objid = rem.objid 
   left join cashreceipt_void cv on cv.receiptid = cr.objid 
   inner join cashreceiptitem cri on cri.receiptid = cr.objid 
   inner join revenueitem ri on ri.objid = cri.item_objid
where rem.remittanceid=$P{remittanceid} 
  and ri.fund_objid like $P{fundid} and cv.objid is null 
group by ri.fund_title, cri.item_objid , cri.item_title 
order by fundname, acctcode  

[getBrgyShares]
select 
  min(b.name) as barangayname, SUM( cri.basic + cri.basicint - cri.basicdisc ) as netbasic, 
  SUM( cri.lgushare + cri.lguintshare) as lgushare, sum( cri.brgyshare + brgyintshare) as brgyshare 
from remittance_cashreceipt rc
inner join cashreceipt c on c.objid= rc.objid
inner join cashreceiptitem_rpt cri on cri.rptreceiptid = c.objid
inner join barangay b on b.objid = cri.barangayid 
left join cashreceipt_void cv on cv.receiptid = c.objid 
where rc.remittanceid=$P{remittanceid} 
  and cv.objid IS NULL 
group by cri.barangayid 
order by barangayname 


[getDistinctAccountSRE]
select 
  distinct sre.objid, sre.code as acctcode, sre.title as accttitle 
from remittance_cashreceipt rem 
   inner join cashreceipt cr on cr.objid = rem.objid 
   inner join cashreceiptitem cri on cri.receiptid = cr.objid 
   inner join revenueitem ri on ri.objid = cri.item_objid 
   LEFT JOIN revenueitem_attribute attr ON ri.objid = attr.revitemid  and attr.attribute_objid='srestandard'
   LEFT JOIN sreaccount sre on sre.objid = attr.account_objid 
where rem.remittanceid=$P{remittanceid} 
ORDER BY acctcode

[getSummaryOfCollectionSRE]
select 
  cr.formno as afid, case when min(ch.objid) is null then cr.receiptno else null end as serialno, 
  case when crv.objid is null then cr.paidby else '*** VOIDED ***' end as paidby, 
  min(cr.txndate) as txndate, ${columnsql} 
  case when crv.objid is null then 0 else 1 end as voided 
from remittance_cashreceipt rem 
   inner join cashreceipt cr on cr.objid = rem.objid 
   left join cashticket ch on ch.objid = cr.formno 
   left join cashreceipt_void crv on crv.receiptid = cr.objid 
   inner join cashreceiptitem cri on cri.receiptid = cr.objid 
   inner join revenueitem ri on ri.objid = cri.item_objid 
   LEFT JOIN revenueitem_attribute attr ON ri.objid = attr.revitemid  and attr.attribute_objid='srestandard'
   LEFT JOIN sreaccount a on a.objid = attr.account_objid 
where rem.remittanceid=$P{remittanceid} 
GROUP BY cr.formno, cr.receiptno, cr.paidby, crv.objid
ORDER BY afid, serialno 


[getDistinctAccountNGAS]
select 
  distinct n.objid, n.code as acctcode, n.title as accttitle 
from remittance_cashreceipt rem 
   inner join cashreceipt cr on cr.objid = rem.objid 
   inner join cashreceiptitem cri on cri.receiptid = cr.objid 
   inner join revenueitem ri on ri.objid = cri.item_objid 
   LEFT JOIN revenueitem_attribute attr ON ri.objid = attr.revitemid  and attr.attribute_objid='ngasstandard'
   LEFT JOIN account n on n.objid = attr.account_objid 
where rem.remittanceid=$P{remittanceid}
ORDER BY acctcode

[getSummaryOfCollectionNGAS]
select 
  cr.formno as afid, case when min(ch.objid) is null then cr.receiptno else null end as serialno, 
  case when crv.objid is null then cr.paidby else '*** VOIDED ***' end as paidby, 
  min(cr.txndate) as txndate, ${columnsql}
  case when crv.objid is null then 0 else 1 end as voided 
from remittance_cashreceipt rem 
   inner join cashreceipt cr on cr.objid = rem.objid 
   left join cashticket ch on ch.objid = cr.formno 
   left join cashreceipt_void crv on crv.receiptid = cr.objid 
   inner join cashreceiptitem cri on cri.receiptid = cr.objid 
   inner join revenueitem ri on ri.objid = cri.item_objid 
   LEFT JOIN revenueitem_attribute attr ON ri.objid = attr.revitemid  and attr.attribute_objid='ngasstandard'
   LEFT JOIN account a on a.objid = attr.account_objid 
where rem.remittanceid=$P{remittanceid}
GROUP BY cr.formno, cr.receiptno, cr.paidby, crv.objid
ORDER BY afid, serialno 

[getFundlist]
select 
  distinct ri.fund_objid as objid, ri.fund_title as title 
from remittance_cashreceipt rc 
  inner join cashreceipt cr on rc.objid = cr.objid 
  inner join cashreceiptitem cri on cri.receiptid = cr.objid 
  inner join revenueitem ri on ri.objid = cri.item_objid 
where rc.remittanceid=$P{remittanceid}

[getCollectionType]
select 
  distinct ct.objid, ct.title 
from remittance_cashreceipt rc 
  inner join cashreceipt cr on rc.objid = cr.objid 
  inner join collectiontype ct on ct.objid = cr.collectiontype_objid 
where rc.remittanceid=$P{remittanceid}  





[getAbstractOfRPTCollection] 
SELECT *
FROM (
  SELECT
    1 AS idx,
    CASE WHEN cv.objid IS NULL 
      THEN CONVERT(VARCHAR(1),MIN(CASE WHEN cri.qtr = 0 THEN 1 ELSE cri.qtr END)) + 'Q,' + CONVERT(VARCHAR(4),MIN(cri.year)) + ' - ' +
         CONVERT(VARCHAR(1),MAX(CASE WHEN cri.qtr = 0 THEN 4 ELSE cri.qtr END)) + 'Q,' + CONVERT(VARCHAR(4),MAX(cri.year))
      ELSE '' 
    END AS payperiod, 
    'BASIC' AS type, 
    cr.txndate AS ordate, 
    CASE WHEN cv.objid IS NULL THEN cr.payer_name ELSE '*** VOIDED ***' END AS taxpayername, 
    CASE WHEN cv.objid IS NULL THEN f.tdno ELSE '' END AS tdno, 
    cr.receiptno AS orno, 
    CASE WHEN m.name IS NULL THEN c.name ELSE m.name END AS municityname, 
    b.name AS barangay, 
    CASE WHEN cv.objid IS NULL  THEN pc.code ELSE '' END AS classification, 
    SUM(CASE WHEN cv.objid IS NULL  AND cri.revtype IN ('current','advance') THEN cri.basic ELSE 0.0 END) AS currentyear,
    SUM(CASE WHEN cv.objid IS NULL  AND cri.revtype IN ('previous','prior') THEN cri.basic ELSE 0.0 END) AS previousyear,
    SUM(CASE WHEN cv.objid IS NULL  THEN cri.basicdisc ELSE 0.0 END) AS discount,
    SUM(CASE WHEN cv.objid IS NULL  AND cri.revtype IN ('current','advance') THEN cri.basicint ELSE 0.0 END) AS penaltycurrent,
    SUM(CASE WHEN cv.objid IS NULL  AND cri.revtype IN ('previous','prior') THEN cri.basicint ELSE 0.0 END) AS penaltyprevious,
    SUM(cri.firecode) AS firecode 
  FROM remittance rem 
    INNER JOIN remittance_cashreceipt rc ON rem.objid = rc.remittanceid
    INNER JOIN cashreceipt cr ON rc.objid = cr.objid 
    LEFT JOIN cashreceipt_void cv ON cr.objid = cv.receiptid 
    INNER JOIN cashreceiptitem_rpt cri ON cr.objid = cri.rptreceiptid 
    INNER JOIN rptledger rl ON cri.rptledgerid = rl.objid 
    INNER JOIN faas f ON rl.faasid = f.objid 
    INNER JOIN rpu r ON f.rpuid = r.objid 
    INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
    INNER JOIN realproperty rp ON r.realpropertyid = rp.objid 
    INNER JOIN barangay b ON rp.barangayid = b.objid 
    LEFT JOIN district d ON b.parentid = d.objid 
    LEFT JOIN city c ON d.parentid = c.objid 
    LEFT JOIN municipality m ON b.parentid = m.objid 
  WHERE rem.objid =  $P{objid}
    AND cri.year <= $P{remyear}
  GROUP BY cr.objid, cr.txndate, cr.payer_name, cr.receiptno, rl.objid, f.tdno, b.name, pc.code, cv.objid, m.name, c.name 


  UNION ALL


  SELECT
    2 AS idx,
    CASE WHEN cv.objid IS NULL 
      THEN CONVERT(VARCHAR(1),MIN(CASE WHEN cri.qtr = 0 THEN 1 ELSE cri.qtr END)) + 'Q,' + CONVERT(VARCHAR(4),MIN(cri.year)) + ' - ' +
         CONVERT(VARCHAR(1),MAX(CASE WHEN cri.qtr = 0 THEN 4 ELSE cri.qtr END)) + 'Q,' + CONVERT(VARCHAR(4),MAX(cri.year))
      ELSE '' 
    END AS payperiod, 
    'SEF' AS type, 
    cr.txndate AS ordate, 
    CASE WHEN cv.objid IS NULL THEN cr.payer_name ELSE '*** VOIDED ***' END AS taxpayername, 
    CASE WHEN cv.objid IS NULL THEN f.tdno ELSE '' END AS tdno, 
    cr.receiptno AS orno, 
    CASE WHEN m.name IS NULL THEN c.name ELSE m.name END AS municityname, 
    b.name AS barangay, 
    CASE WHEN cv.objid IS NULL  THEN pc.code ELSE '' END AS classification, 
    SUM(CASE WHEN cv.objid IS NULL  AND cri.revtype IN ('current','advance') THEN cri.sef ELSE 0.0 END) AS currentyear,
    SUM(CASE WHEN cv.objid IS NULL  AND cri.revtype IN ('previous','prior') THEN cri.sef ELSE 0.0 END) AS previousyear,
    SUM(CASE WHEN cv.objid IS NULL  THEN cri.sefdisc ELSE 0.0 END) AS discount,
    SUM(CASE WHEN cv.objid IS NULL  AND cri.revtype IN ('current','advance') THEN cri.sefint ELSE 0.0 END) AS penaltycurrent,
    SUM(CASE WHEN cv.objid IS NULL  AND cri.revtype IN ('previous','prior') THEN cri.sefint ELSE 0.0 END) AS penaltyprevious,
    SUM(cri.firecode) AS firecode 
  FROM remittance rem 
    INNER JOIN remittance_cashreceipt rc ON rem.objid = rc.remittanceid
    INNER JOIN cashreceipt cr ON rc.objid = cr.objid 
    LEFT JOIN cashreceipt_void cv ON cr.objid = cv.receiptid 
    INNER JOIN cashreceiptitem_rpt cri ON cr.objid = cri.rptreceiptid 
    INNER JOIN rptledger rl ON cri.rptledgerid = rl.objid 
    INNER JOIN faas f ON rl.faasid = f.objid 
    INNER JOIN rpu r ON f.rpuid = r.objid 
    INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
    INNER JOIN realproperty rp ON r.realpropertyid = rp.objid 
    INNER JOIN barangay b ON rp.barangayid = b.objid 
    LEFT JOIN district d ON b.parentid = d.objid 
    LEFT JOIN city c ON d.parentid = c.objid 
    LEFT JOIN municipality m ON b.parentid = m.objid 
  WHERE rem.objid =   $P{objid}
    AND cri.year <= $P{remyear}
  GROUP BY cr.objid, cr.txndate, cr.payer_name, cr.receiptno, rl.objid, f.tdno, b.name, pc.code, cv.objid, m.name, c.name 

) t
ORDER BY t.municityname, t.idx, t.orno 



[getAbstractOfRPTCollectionAdvance] 
SELECT *
FROM (
  SELECT
    cri.year,
    1 AS idx,
    CASE WHEN cv.objid IS NULL 
      THEN CONVERT(VARCHAR(1),MIN(CASE WHEN cri.qtr = 0 THEN 1 ELSE cri.qtr END)) + 'Q,' + CONVERT(VARCHAR(4),MIN(cri.year)) + ' - ' +
         CONVERT(VARCHAR(1),MAX(CASE WHEN cri.qtr = 0 THEN 4 ELSE cri.qtr END)) + 'Q,' + CONVERT(VARCHAR(4),MAX(cri.year))
      ELSE '' 
    END AS payperiod, 
    'BASIC - ' + CONVERT(VARCHAR(4), cri.year) AS type, 
    cr.txndate AS ordate, 
    CASE WHEN cv.objid IS NULL THEN cr.payer_name ELSE '*** VOIDED ***' END AS taxpayername, 
    CASE WHEN cv.objid IS NULL THEN f.tdno ELSE '' END AS tdno, 
    cr.receiptno AS orno, 
    CASE WHEN m.name IS NULL THEN c.name ELSE m.name END AS municityname, 
    b.name AS barangay, 
    CASE WHEN cv.objid IS NULL  THEN pc.code ELSE '' END AS classification, 
    SUM(CASE WHEN cv.objid IS NULL  AND cri.revtype IN ('current','advance') THEN cri.basic ELSE 0.0 END) AS currentyear,
    SUM(CASE WHEN cv.objid IS NULL  AND cri.revtype IN ('previous','prior') THEN cri.basic ELSE 0.0 END) AS previousyear,
    SUM(CASE WHEN cv.objid IS NULL  THEN cri.basicdisc ELSE 0.0 END) AS discount,
    SUM(CASE WHEN cv.objid IS NULL  AND cri.revtype IN ('current','advance') THEN cri.basicint ELSE 0.0 END) AS penaltycurrent,
    SUM(CASE WHEN cv.objid IS NULL  AND cri.revtype IN ('previous','prior') THEN cri.basicint ELSE 0.0 END) AS penaltyprevious,
    SUM(cri.firecode) AS firecode 
  FROM remittance rem 
    INNER JOIN remittance_cashreceipt rc ON rem.objid = rc.remittanceid
    INNER JOIN cashreceipt cr ON rc.objid = cr.objid 
    LEFT JOIN cashreceipt_void cv ON cr.objid = cv.receiptid 
    INNER JOIN cashreceiptitem_rpt cri ON cr.objid = cri.rptreceiptid 
    INNER JOIN rptledger rl ON cri.rptledgerid = rl.objid 
    INNER JOIN faas f ON rl.faasid = f.objid 
    INNER JOIN rpu r ON f.rpuid = r.objid 
    INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
    INNER JOIN realproperty rp ON r.realpropertyid = rp.objid 
    INNER JOIN barangay b ON rp.barangayid = b.objid 
    LEFT JOIN district d ON b.parentid = d.objid 
    LEFT JOIN city c ON d.parentid = c.objid 
    LEFT JOIN municipality m ON b.parentid = m.objid 
  WHERE rem.objid =  $P{objid}
    AND cri.year > $P{remyear}
  GROUP BY cr.objid, cr.txndate, cr.payer_name, cr.receiptno, rl.objid, f.tdno, b.name, pc.code, cv.objid, m.name, c.name, cri.year 


  UNION ALL


  SELECT
    cri.year,
    2 AS idx,
    CASE WHEN cv.objid IS NULL 
      THEN CONVERT(VARCHAR(1),MIN(CASE WHEN cri.qtr = 0 THEN 1 ELSE cri.qtr END)) + 'Q,' + CONVERT(VARCHAR(4),MIN(cri.year)) + ' - ' +
         CONVERT(VARCHAR(1),MAX(CASE WHEN cri.qtr = 0 THEN 4 ELSE cri.qtr END)) + 'Q,' + CONVERT(VARCHAR(4),MAX(cri.year))
      ELSE '' 
    END AS payperiod, 
    'SEF - ' + CONVERT(VARCHAR(4), cri.year) AS type, 
    cr.txndate AS ordate, 
    CASE WHEN cv.objid IS NULL THEN cr.payer_name ELSE '*** VOIDED ***' END AS taxpayername, 
    CASE WHEN cv.objid IS NULL THEN f.tdno ELSE '' END AS tdno, 
    cr.receiptno AS orno, 
    CASE WHEN m.name IS NULL THEN c.name ELSE m.name END AS municityname, 
    b.name AS barangay, 
    CASE WHEN cv.objid IS NULL  THEN pc.code ELSE '' END AS classification, 
    SUM(CASE WHEN cv.objid IS NULL  AND cri.revtype IN ('current','advance') THEN cri.sef ELSE 0.0 END) AS currentyear,
    SUM(CASE WHEN cv.objid IS NULL  AND cri.revtype IN ('previous','prior') THEN cri.sef ELSE 0.0 END) AS previousyear,
    SUM(CASE WHEN cv.objid IS NULL  THEN cri.sefdisc ELSE 0.0 END) AS discount,
    SUM(CASE WHEN cv.objid IS NULL  AND cri.revtype IN ('current','advance') THEN cri.sefint ELSE 0.0 END) AS penaltycurrent,
    SUM(CASE WHEN cv.objid IS NULL  AND cri.revtype IN ('previous','prior') THEN cri.sefint ELSE 0.0 END) AS penaltyprevious,
    SUM(cri.firecode) AS firecode 
  FROM remittance rem 
    INNER JOIN remittance_cashreceipt rc ON rem.objid = rc.remittanceid
    INNER JOIN cashreceipt cr ON rc.objid = cr.objid 
    LEFT JOIN cashreceipt_void cv ON cr.objid = cv.receiptid 
    INNER JOIN cashreceiptitem_rpt cri ON cr.objid = cri.rptreceiptid 
    INNER JOIN rptledger rl ON cri.rptledgerid = rl.objid 
    INNER JOIN faas f ON rl.faasid = f.objid 
    INNER JOIN rpu r ON f.rpuid = r.objid 
    INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
    INNER JOIN realproperty rp ON r.realpropertyid = rp.objid 
    INNER JOIN barangay b ON rp.barangayid = b.objid 
    LEFT JOIN district d ON b.parentid = d.objid 
    LEFT JOIN city c ON d.parentid = c.objid 
    LEFT JOIN municipality m ON b.parentid = m.objid 
  WHERE rem.objid =   $P{objid}
    AND cri.year > $P{remyear}
  GROUP BY cr.objid, cr.txndate, cr.payer_name, cr.receiptno, rl.objid, f.tdno, b.name, pc.code, cv.objid, m.name, c.name, cri.year 

) t
ORDER BY t.municityname, t.year, t.idx, t.orno 



[getCashTicketCollectionSummaries]
SELECT 
  CASE WHEN subcollector_name IS NULL THEN cr.collector_name ELSE cr.subcollector_name END AS particulars,
  SUM(cr.amount) AS amount
FROM remittance rem
  INNER JOIN remittance_cashreceipt rc ON rem.objid = rc.remittanceid
  INNER JOIN cashreceipt cr ON rc.objid = cr.objid 
  LEFT JOIN cashreceipt_void cv ON cr.objid = cv.receiptid
  INNER JOIN cashreceipt_cashticket cc ON cr.objid = cc.objid
WHERE rem.objid = $P{objid} 
  AND cv.objid IS NULL 
GROUP BY cr.collector_name, cr.subcollector_name
  
