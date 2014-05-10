[getList]
select 
 objid, afid, respcenter_objid, respcenter_name, startseries, endseries, 
 startstub, endstub, prefix, suffix, qtyin, qtyout, qtycancelled, qtybalance, 'SERIAL' as aftype  
from afserial_inventory 
where afid like $P{afid} and respcenter_objid like $P{respcenterobjid}
 
union 

select 
	objid, afid, respcenter_objid, respcenter_name, null as startseries, null as endseries,
	startstub, endstub, null as prefix, null as suffix, qtyin, qtyout, qtycancelled, qtybalance, 'CASHTICKET' as aftype
from cashticket_inventory 
where afid like $P{afid} and respcenter_objid like $P{respcenterobjid}
order by respcenter_objid 

[getDetailsSERIAL]
select  
   MIN( refdate) as refdate, MIN(refno) as refno, MIN( reftype) as reftype,
   MIN( receivedstartseries ) AS receivedstartseries, 
   MAX( receivedendseries ) AS receivedendseries, 
   MIN( qtyreceived) as qtyreceived,
   MAX( beginstartseries ) AS beginstartseries,
   MAX( beginendseries ) AS beginendseries,
   MAX( qtybegin) as qtybegin, 
   MAX( issuedstartseries ) AS issuedstartseries,
   MAX( issuedendseries ) AS issuedendseries,
   MAX( qtyissued) as qtyissued, 
   MAX( endingstartseries ) AS endingstartseries,
   MAX( endingendseries ) AS endingendseries, 	
   MAX( qtyending) as qtyending, 
   MAX( cancelledstartseries ) AS cancelledstartseries,
   MAX( cancelledendseries ) AS cancelledendseries, 
   MAX( qtycancelled) as qtycancelled, 
   min( remarks ) as remarks
from afserial_inventory_detail
where controlid=$P{controlid}
group by refid
order by min(txndate)


[getDetailsCASHTICKET]
select  
   MIN( refdate) as refdate, MIN(refno) as refno, MIN( reftype) as reftype, 
   SUM( qtyreceived ) AS qtyreceived,
   SUM( qtybegin ) AS qtybegin,
   SUM( qtyissued ) AS qtyissued,
   SUM( qtyending) AS qtyending,
   SUM( qtycancelled ) AS qtycancelled  
FROM cashticket_inventory_detail 
where controlid=$P{controlid}
group by refid 
order by MIN(txndate) 


[getRespCenters]
select distinct respcenter_objid as objid, respcenter_name as name from afserial_inventory 
union  
select distinct respcenter_objid as objid, respcenter_name as name from cashticket_inventory 