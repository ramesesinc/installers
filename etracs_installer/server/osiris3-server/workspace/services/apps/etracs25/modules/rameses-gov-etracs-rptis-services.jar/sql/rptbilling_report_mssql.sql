[findLedgerbyId]
SELECT 
  rl.objid,
  rl.lastyearpaid,
  rl.lastqtrpaid,
  rl.firstqtrpaidontime,
  rl.qtrlypaymentpaidontime,
  rl.lastitemyear,
  rl.faasid, 
  rl.nextbilldate AS expirydate,
  DateAdd(d, -1, rl.nextbilldate) AS validuntil,
  f.tdno,
  f.prevtdno,  
  f.owner_name,
  f.administrator_name,
  r.rputype,
  r.fullpin,
  r.totalareaha,
  r.totalareasqm,
  r.totalav,
  b.name AS barangay,
  rp.cadastrallotno,
  rp.barangayid,
  pc.code AS classcode,
  CASE WHEN rl.lastqtrpaid = 4 THEN rl.lastyearpaid + 1 ELSE rl.lastyearpaid END AS fromyear,
  CASE WHEN rl.lastqtrpaid = 4 THEN 1 ELSE rl.lastqtrpaid + 1 END AS fromqtr
FROM faas f
  INNER JOIN rpu r ON f.rpuid = r.objid 
  INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
  INNER JOIN realproperty rp ON r.realpropertyid = rp.objid 
  INNER JOIN barangay b ON rp.barangayid = b.objid 
  INNER JOIN rptledger rl ON f.objid = rl.faasid
WHERE rl.objid = $P{rptledgerid}
  AND rl.state = 'APPROVED'
  AND r.taxable = 1 




[getBillingItems]
SELECT
  rlf.tdno,
  rlf.assessedvalue,
  rlf.assessedvalue AS originalav,
  CONVERT(VARCHAR(4),bi.year) + 
    CASE 
      WHEN bi.qtr > 0 THEN '-' + CONVERT(VARCHAR(1), bi.qtr) 
      WHEN bi.qtr = 0 AND bi.fromqtr = 1 AND bi.toqtr = 4 THEN '' 
      ELSE '-' + CONVERT(varchar(1), bi.fromqtr) + CONVERT(varchar(1), bi.toqtr)
    END 
  AS period,
  bi.basic AS basic, 
  bi.basicint AS basicint, 
  bi.basicdisc AS basicdisc, 
  bi.basicint - bi.basicdisc AS  basicdp,
  bi.basic - bi.basicdisc + bi.basicint AS basicnet,
  
  bi.sef AS sef, 
  bi.sefint AS sefint, 
  bi.sefdisc AS sefdisc, 
  bi.sefint - bi.sefdisc AS  sefdp,
  bi.sef - bi.sefdisc + bi.sefint AS sefnet,
  bi.firecode AS firecode,
  rl.barangayid
FROM rptledger rl 
  INNER JOIN rptbill_ledger_item bi ON rl.objid = bi.rptledgerid 
  INNER JOIN rptledgerfaas rlf ON bi.rptledgerfaasid = rlf.objid
WHERE rl.objid = $P{rptledgerid}
ORDER BY bi.year, bi.qtr   
  
