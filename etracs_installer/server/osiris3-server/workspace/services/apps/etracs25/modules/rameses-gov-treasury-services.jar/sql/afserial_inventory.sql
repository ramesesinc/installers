[getList]
SELECT * FROM afserial_inventory 
WHERE afid=$P{afid} 
ORDER BY currentseries, currentstub

[getDetails]
SELECT * FROM afserial_inventory_detail 
WHERE controlid=$P{controlid} 
ORDER BY refdate

[findAllAvailable]
SELECT 
   ac.objid AS controlid,  
   ac.afid,
   ac.currentseries as startseries,
   ac.endseries as endseries,
   ac.currentstub as startstub,
   ac.endstub as endstub,
   ac.prefix,
   ac.suffix,
   ac.unit,
   ac.qtybalance,
   ac.cost 
FROM afserial_inventory ac
   inner join afserial_inventory_detail ad on ad.controlid = ac.objid and ad.lineno=1
WHERE ac.afid=$P{afid} 
AND ac.respcenter_objid = 'AFO'
AND ac.qtybalance > 0
ORDER BY ad.txndate, ac.currentseries

[getAFSerialDetails]
select   
   MIN(ai.startseries) as startseries,
   max(ai.endseries) as endseries, 
   MIN(ai.startstub) as startstub,
   MAX(ai.endstub) as endstub,
   SUM(ai.qtyin) as qtyissued
from afserial_inventory_detail d 
   inner join afserial_inventory ai on d.controlid = ai.objid
where d.refid=$P{stockissueid}
   AND ai.afid=$P{afid}
   and ai.respcenter_type = 'COLLECTOR'
