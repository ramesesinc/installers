[getIssuancesOnHand]
SELECT 
   afid, 
   currentseries as startseries,
   endseries as endseries,
   qtybalance
FROM 
   afserial_inventory 
WHERE respcenter_objid = $P{issuetoid}
AND qtybalance > 0
UNION ALL
SELECT 
   afid, 
   NULL as startseries,
   NULL as endseries,
   qtybalance
FROM 
   cashticket_inventory 
WHERE respcenter_objid = $P{issuetoid}
AND qtybalance > 0







