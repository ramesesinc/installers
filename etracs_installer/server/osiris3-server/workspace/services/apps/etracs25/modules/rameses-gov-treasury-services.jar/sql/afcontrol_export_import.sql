[findAfSerialControl]
SELECT * FROM afserial_control WHERE controlid = $P{controlid}

[findAfSerialInventory]
SELECT * FROM afserial_inventory WHERE objid = $P{controlid}

[getAfSerialInventoryDetails]
SELECT d.* FROM afserial_inventory_detail d
WHERE d.controlid = $P{controlid}
  AND NOT EXISTS(
    SELECT * FROM remittance_afserial WHERE objid = d.objid 
  )


[updateAfSerialModeToRemote]
UPDATE afserial_control SET txnmode = 'REMOTE' WHERE controlid = $P{controlid}



[getCashTickets]
SELECT * FROM
(SELECT 
   cc.objid AS issuanceid, 
   cc.objid,
   cc.controlid,  
   ac.afid AS formno,
   cc.qtybalance,
   ct.denomination,
   cc.qtybalance * ct.denomination AS amtbalance,
   CASE WHEN  cc.assignee_objid IS NULL THEN ac.respcenter_objid ELSE cc.assignee_objid END AS ownerid
FROM cashticket_control cc 
INNER JOIN cashticket_inventory ac ON cc.controlid=ac.objid
INNER JOIN cashticket ct ON ct.objid=ac.afid
WHERE cc.qtybalance > 0) a
WHERE a.ownerid = $P{ownerid}



[findCashTicketControl]
SELECT * FROM cashticket_control WHERE controlid = $P{controlid}

[findCashTicketInventory]
SELECT * FROM cashticket_inventory WHERE objid = $P{controlid}

[getCashTicketInventoryDetails]
SELECT ctd.* 
FROM cashticket_inventory_detail ctd
WHERE ctd.controlid = $P{controlid}
  AND NOT EXISTS(
    SELECT * FROM remittance_cashticket WHERE objid = ctd.objid
   )

[findCashTicketInventoryDetailCount]
SELECT COUNT(*) AS cnt FROM cashticket_inventory_detail WHERE controlid = $P{controlid}


[insertAfSerialControl]
INSERT INTO afserial_control(
	  controlid
	 ,txnmode
	 ,assignee_objid
	 ,assignee_name
	 ,currentseries
	 ,qtyissued
	 ,active
	 ,org_objid
	 ,org_name
 )
 VALUES (
	  $P{controlid}
	 ,$P{txnmode}
	 ,$P{assignee_objid}
	 ,$P{assignee_name}
	 ,$P{currentseries}
	 ,$P{qtyissued}
	 ,$P{active}
	 ,$P{org_objid}
	 ,$P{org_name}
)
  

[insertAfSerialInventory]
INSERT INTO afserial_inventory(
  objid
  ,afid
  ,respcenter_objid
  ,respcenter_name
  ,respcenter_type
  ,startseries
  ,endseries
  ,currentseries
  ,startstub
  ,endstub
  ,currentstub
  ,prefix
  ,suffix
  ,unit
  ,qtyin
  ,qtyout
  ,qtycancelled
  ,qtybalance
  ,currentlineno
 )
VALUES (
   $P{objid}
  ,$P{afid}
  ,$P{respcenter_objid}
  ,$P{respcenter_name}
  ,$P{respcenter_type}
  ,$P{startseries}
  ,$P{endseries}
  ,$P{currentseries}
  ,$P{startstub}
  ,$P{endstub}
  ,$P{currentstub}
  ,$P{prefix}
  ,$P{suffix}
  ,$P{unit}
  ,$P{qtyin}
  ,$P{qtyout}
  ,$P{qtycancelled}
  ,$P{qtybalance}
  ,$P{currentlineno}
)
           

[insertAfSerialInventoryDetails]
INSERT INTO afserial_inventory_detail(
  objid
  ,controlid
  ,lineno
  ,refid
  ,refno
  ,reftype
  ,refdate
  ,txndate
  ,txntype
  ,receivedstartseries
  ,receivedendseries
  ,beginstartseries
  ,beginendseries
  ,issuedstartseries
  ,issuedendseries
  ,endingstartseries
  ,endingendseries
  ,cancelledstartseries
  ,cancelledendseries
  ,qtyreceived
  ,qtybegin
  ,qtyissued
  ,qtyending
  ,qtycancelled
  ,remarks
)
VALUES (
   $P{objid}
  ,$P{controlid}
  ,$P{lineno}
  ,$P{refid}
  ,$P{refno}
  ,$P{reftype}
  ,$P{refdate}
  ,$P{txndate}
  ,$P{txntype}
  ,$P{receivedstartseries}
  ,$P{receivedendseries}
  ,$P{beginstartseries}
  ,$P{beginendseries}
  ,$P{issuedstartseries}
  ,$P{issuedendseries}
  ,$P{endingstartseries}
  ,$P{endingendseries}
  ,$P{cancelledstartseries}
  ,$P{cancelledendseries}
  ,$P{qtyreceived}
  ,$P{qtybegin}
  ,$P{qtyissued}
  ,$P{qtyending}
  ,$P{qtycancelled}
  ,$P{remarks}
)





[insertCashTicketInventory]
INSERT INTO cashticket_inventory(
  objid
  ,afid
  ,respcenter_objid
  ,respcenter_name
  ,respcenter_type
  ,startstub
  ,endstub
  ,currentstub
  ,qtyin
  ,qtyout
  ,qtycancelled
  ,qtybalance
  ,currentlineno
)
VALUES (
   $P{objid}
  ,$P{afid}
  ,$P{respcenter_objid}
  ,$P{respcenter_name}
  ,$P{respcenter_type}
  ,$P{startstub}
  ,$P{endstub}
  ,$P{currentstub}
  ,$P{qtyin}
  ,$P{qtyout}
  ,$P{qtycancelled}
  ,$P{qtybalance}
  ,$P{currentlineno}
)


[insertCashTicketControl]
INSERT INTO cashticket_control(
  objid
 ,controlid
 ,assignee_objid
 ,assignee_name
 ,qtyin
 ,qtyissued
 ,qtybalance
 ,org_objid
 ,org_name
)
VALUES(
  $P{objid}
 ,$P{controlid}
 ,$P{assignee_objid}
 ,$P{assignee_name}
 ,$P{qtyin}
 ,$P{qtyissued}
 ,$P{qtybalance}
 ,$P{org_objid}
 ,$P{org_name}
)


[updateCashTicketInventory]
UPDATE cashticket_inventory SET 
      qtyin = $P{qtyin}, 
      currentlineno = CASE WHEN currentlineno > $P{currentlineno} THEN currentlineno ELSE $P{currentlineno} END,
      qtybalance = $P{qtybalance}
 WHERE objid = $P{objid}


[updateCashTicketControl]
UPDATE cashticket_control SET 
      qtyin = $P{qtyin},
      qtybalance = $P{qtybalance} 
WHERE objid = $P{objid}



[insertCashTicketControlDetail]
INSERT INTO cashticket_inventory_detail(
      objid
      ,controlid
      ,lineno
      ,refid
      ,refno
      ,reftype
      ,refdate
      ,txndate
      ,txntype
      ,qtyreceived
      ,qtybegin
      ,qtyissued
      ,qtyending
      ,qtycancelled
      ,remarks
      ,remittanceid
)
VALUES (
       $P{objid}
      ,$P{controlid}
      ,$P{lineno}
      ,$P{refid}
      ,$P{refno}
      ,$P{reftype}
      ,$P{refdate}
      ,$P{txndate}
      ,$P{txntype}
      ,$P{qtyreceived}
      ,$P{qtybegin}
      ,$P{qtyissued}
      ,$P{qtyending}
      ,$P{qtycancelled}
      ,$P{remarks}
      ,$P{remittanceid}
)

