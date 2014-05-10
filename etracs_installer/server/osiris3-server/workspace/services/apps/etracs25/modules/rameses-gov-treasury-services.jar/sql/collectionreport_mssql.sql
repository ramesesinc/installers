[getRaafData]
 SELECT 
    t.afid,
    
    CASE WHEN t.receivedstartseries IS NULL THEN xd.qtyending ELSE NULL END AS qtybegin,
    CASE WHEN t.receivedstartseries IS NULL THEN xd.endingstartseries ELSE NULL END AS beginstartseries,
    CASE WHEN t.receivedendseries IS NULL THEN xd.endingendseries  ELSE NULL END AS beginendseries,
    
    t.qtyreceived,
    t.receivedstartseries,
    t.receivedendseries,
    
    t.qtyissued,
    t.issuedstartseries,
    t.issuedendseries,
    
    CASE WHEN t.issuedendseries = t.endingendseries THEN NULL ELSE t.qtyending END AS qtyending,
    CASE WHEN t.issuedendseries = t.endingendseries THEN NULL ELSE t.endingstartseries END AS endingstartseries,
    CASE WHEN t.issuedendseries = t.endingendseries THEN NULL ELSE t.endingendseries END AS endingendseries,
    
    CASE WHEN t.issuedendseries = t.endingendseries THEN 'CONSUMED' ELSE NULL END AS remarks
    
 FROM (
       SELECT
          ai.objid, 
          ai.respcenter_name,
          ai.afid,
          MAX(aid.qtybegin) AS qtybegin,
          MIN(aid.beginstartseries) AS beginstartseries,
          MAX(aid.beginendseries) AS beginendseries,
          SUM(aid.qtyreceived) AS qtyreceived,
          MIN(aid.receivedstartseries) AS receivedstartseries,
          MAX(aid.receivedendseries) AS receivedendseries,
          SUM(aid.qtyissued) AS qtyissued,
          MIN(aid.issuedstartseries) AS issuedstartseries,
          MAX(aid.issuedendseries) AS issuedendseries,
          MIN(aid.qtyending) AS qtyending,
          MAX(aid.endingstartseries) AS endingstartseries,
          MAX(aid.endingendseries) AS endingendseries,
          CASE WHEN MIN([lineno]) = 1 THEN 2 ELSE MIN(aid.[lineno]) END AS minlineno
       FROM afserial_inventory ai
          inner join afserial_inventory_detail aid ON ai.objid = aid.controlid 
       WHERE ai.respcenter_objid = $P{collectorid}        
         AND YEAR(aid.refdate) = $P{year}
         AND MONTH(aid.refdate) = $P{month}
       GROUP BY ai.objid, ai.respcenter_name, ai.afid   
    ) t
    LEFT JOIN afserial_inventory_detail xd ON t.objid = xd.controlid 
WHERE t.minlineno - 1 = xd.[lineno]
ORDER BY t.afid, t.receivedstartseries, t.beginstartseries
          
          


[getCashTicketRaafData]
 SELECT 
    x.afid,
    x.objid,
    CASE WHEN x.qtybegin = 0 THEN NULL ELSE x.qtybegin END AS qtybegin,
    CASE WHEN x.qtyreceived = 0 THEN NULL ELSE x.qtyreceived END AS qtyreceived,
    CASE WHEN x.qtyissued = 0 THEN NULL ELSE x.qtyissued END AS qtyissued,
    CASE WHEN x.qtyending = 0 THEN NULL ELSE x.qtyending END AS qtyending,
    CASE WHEN x.qtyending = 0 THEN 'CONSUMED' ELSE '' END AS remarks
 FROM (
    SELECT 
       t.*,
       (SELECT qtyending FROM cashticket_inventory_detail WHERE controlid = t.objid AND [lineno] = t.maxlineno) AS qtyending,
       (SELECT qtyending + qtyissued + qtybegin FROM cashticket_inventory_detail WHERE controlid = t.objid AND [lineno] = t.minlineno AND txntype <> 'ISSUE-RECEIPT') AS qtybegin
    FROM (
       SELECT 
         ci.respcenter_name AS name,
         ci.afid,
         ci.objid, 
         SUM(cid.qtyreceived) AS qtyreceived, 
         SUM(cid.qtyissued) AS qtyissued,
         MIN(cid.[lineno]) AS minlineno,
         MAX(cid.[lineno]) AS maxlineno
       FROM cashticket_inventory ci 
         INNER JOIN cashticket_inventory_detail cid ON ci.objid = cid.controlid
       WHERE ci.respcenter_type = $P{collectorid} 
        AND YEAR(cid.refdate) = $P{year}
        AND MONTH(cid.refdate) = $P{month}
       GROUP BY ci.objid, ci.respcenter_name, ci.afid, ci.currentlineno
    ) t   
 ) x
ORDER BY  x.afid  


[getCollectorFundList]
select 
  distinct rf.fund_objid as fundid, f.code, f.title 
from remittance r 
  inner join remittance_fund rf on rf.remittanceid = r.objid
  inner join fund f on f.objid = rf.fund_objid 
where r.dtposted between $P{fromdate} and $P{todate}
  and r.collector_objid = $P{collectorid} 

 [getCollectorDailyCollectionByFund] 
 select
  t.xdate, ${sqlqry} 
from (
  select 
    day(r.dtposted) as xdate, ${subqry} 
  from remittance r 
    inner join remittance_fund rf on rf.remittanceid = r.objid
    inner join fund f on f.objid = rf.fund_objid
    where r.dtposted between $P{fromdate} and $P{todate} 
      and r.collector_objid =  $P{collectorid} 
 ) t
group by t.xdate 
order by t.xdate 

