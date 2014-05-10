[getList]
select a.* from (
  select 
    afc.controlid as objid, afi.afid, afi.respcenter_name as respcentername, afi.startseries, afi.endseries,
    afi.startstub as stubno, 'SERIAL' as aftype, afi.qtyin as qtyreceived, (afi.qtyin - afc.qtyissued) as balance, 
    afc.currentseries, afc.txnmode, af.serieslength, afc.assignee_name as assigneename 
  from afserial_control afc 
    inner join afserial_inventory afi on afc.controlid = afi.objid 
    inner join afserial af on af.objid = afi.afid 
  where afc.currentseries <= afi.endseries
      and afi.respcenter_objid like $P{collectorid} 

  union

  select 
    afc.controlid as objid, afi.afid, afi.respcenter_name as respcentername, null as startseries, null as endseries,
    null as stubno, 'CASHTICKET' as aftype, afc.qtyin as qtyreceived, afc.qtybalance as balance, 
    null as currentseries, 'ONLINE' AS txnmode, 0 as serieslength, afc.assignee_name as assigneename
  from cashticket_control afc 
    inner join cashticket_inventory afi on afc.controlid = afi.objid 
  where afc.qtybalance > 0
      and afi.respcenter_objid like $P{collectorid} 
  ) a 

