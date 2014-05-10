[getList]
SELECT * FROM cashticket_inventory 
WHERE afid=$P{afid} 
ORDER BY currentseries, currentstub

[getDetails]
SELECT * FROM cashticket_inventory_detail 
WHERE controlid=$P{controlid} 
ORDER BY refdate

[findControlByResponsibilityCenter]
SELECT *
FROM cashticket_inventory ac
WHERE ac.afid=$P{afid} 
AND ac.respcenter_objid=$P{respcenterid}

[findAllAvailable]
SELECT 
   ac.objid AS controlid,	
   ac.afid,
   ac.qtybalance,
   ac.currentstub as startstub,
   ac.endstub as endstub,
   ac.currentlineno as "lineno", 
   ac.cost 
FROM cashticket_inventory ac
WHERE ac.afid=$P{afid} 
AND ac.respcenter_objid='AFO'
AND ac.qtybalance > 0
ORDER BY ac.startstub 

[getCashticketDetails]
select 
	 d.qtyreceived as qtyissued,
	 d.remarks
from cashticket_inventory_detail d
	inner join cashticket_inventory ci on ci.objid = d.controlid 
where d.refid=$P{stockissueid}
	and ci.afid = $P{afid}
	and ci.respcenter_type = 'COLLECTOR'  
	