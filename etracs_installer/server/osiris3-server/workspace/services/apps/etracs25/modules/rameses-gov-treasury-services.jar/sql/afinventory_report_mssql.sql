[getAFInventoryReport]
select bt.*
from (
   SELECT 
        t.objid, 
        t.afid,
        t.costperstub, 
        t.minlineno, 
        CASE WHEN t.receivedstartseries IS NULL THEN (((md.endingendseries - md.endingstartseries) + 1) / a.qty) ELSE (t.qtyreceived / a.qty) END AS qtyreceived,
        CASE WHEN t.receivedstartseries IS NULL THEN (((md.endingendseries - md.endingstartseries) + 1) / a.qty) * t.costperstub ELSE (t.qtyreceived / a.qty) * t.costperstub END AS qtyreceivedcost,
        CASE WHEN t.receivedstartseries IS NULL
          THEN ( convert(varchar(20), md.endingstartseries) + ' - ' +  convert(varchar(20),md.endingendseries))
          ELSE (  convert(varchar(20),t.receivedstartseries) + ' - ' +  convert(varchar(20),t.receivedendseries))
         END AS receivedseries,
        (t.qtyissued / a.qty) as qtyissued, 
        ((t.qtyissued / a.qty) * t.costperstub) as qtyissuedcost,
        ( convert(varchar(20),t.issuedstartseries) + ' - ' + convert(varchar(20),t.issuedendseries) ) as issuedseries, 
        case when xd.endingstartseries is null then 0 else (((xd.endingendseries - xd.endingstartseries ) +1) / a.qty) end as qtyending, 
        ((((xd.endingendseries - xd.endingstartseries ) +1) / a.qty) * t.costperstub) as qtyendingcost,
        ( convert(varchar(20),xd.endingstartseries) + '-' + convert(varchar(20),xd.endingendseries) ) as endingseries,
        t.tcost, (t.tcost - ((t.qtyissued / a.qty) * t.costperstub)) as gaincost
      FROM (
         SELECT
           ai.objid, 
           ai.respcenter_name,
           ai.afid,
           SUM(aid.qtyreceived) AS qtyreceived,
           MIN(aid.receivedstartseries) AS receivedstartseries,
           MAX(aid.receivedendseries) AS receivedendseries,
           SUM(aid.qtyissued) AS qtyissued,
           MIN(aid.issuedstartseries) AS issuedstartseries,
           MAX(aid.issuedendseries) AS issuedendseries,
           MAX([lineno]) AS maxlineno,
           MIN([lineno]) AS minlineno, 
           min( ai.cost) as costperstub, 
           sum( aid.cost) as tcost 
         FROM afserial_inventory ai
           inner join afserial_inventory_detail aid ON ai.objid = aid.controlid 
         WHERE ai.respcenter_type = 'AFO' 
          AND YEAR(aid.refdate) = $P{year}
          AND MONTH(aid.refdate) = $P{month}
         GROUP BY ai.objid, ai.respcenter_name, ai.afid   
        ) t
        inner join stockitem_unit a on a.itemid = t.afid 
        LEFT JOIN afserial_inventory_detail xd ON t.objid = xd.controlid 
        left JOIN afserial_inventory_detail md ON t.objid = md.controlid and md.[lineno] = ( t.minlineno -1) 
      WHERE t.maxlineno = xd.[lineno] 

   union 

   SELECT 
        t.objid, 
        t.afid,
        t.costperstub, 
        t.minlineno, 
        case when t.qtyreceived= 0 then  (md.qtyreceived / a.qty) else (t.qtyreceived /a.qty) end AS qtyreceived,
        case when t.qtyreceived= 0 then  (md.qtyreceived / a.qty) * t.costperstub  else (t.qtyreceived /a.qty) * t.costperstub end AS qtyreceivedcost,
        null AS receivedseries,
        (t.qtyissued / a.qty) as qtyissued, 
        ((t.qtyissued / a.qty) * t.costperstub) as qtyissuedcost,
        null as issuedseries, 
        (xd.qtyending / a.qty) as qtyending,
        ((xd.qtyending / a.qty) * t.costperstub) as qtyendingcost,
        null as endingseries,
        t.tcost, 0.0 as gaincost
      FROM (
         SELECT
           ai.objid, 
           ai.respcenter_name,
           ai.afid,
           SUM(aid.qtyreceived) AS qtyreceived,
           SUM(aid.qtyissued) AS qtyissued,
           MAX([lineno]) AS maxlineno,
           MIN([lineno]) AS minlineno, 
           min( ai.cost) as costperstub, 
           sum( aid.cost) as tcost 
         FROM cashticket_inventory ai
           inner join cashticket_inventory_detail aid ON ai.objid = aid.controlid 
         WHERE ai.respcenter_type = 'AFO' 
          AND YEAR(aid.refdate) = $P{year}
          AND MONTH(aid.refdate) = $P{month} 
         GROUP BY ai.objid, ai.respcenter_name, ai.afid   
        ) t
        inner join stockitem_unit a on a.itemid = t.afid 
        LEFT JOIN cashticket_inventory_detail xd ON t.objid = xd.controlid 
        left JOIN cashticket_inventory_detail md ON t.objid = md.controlid and md.[lineno] = ( t.minlineno -1) 
      WHERE t.maxlineno = xd.[lineno] 
   ) bt 