[getOpenIssuanceList]
SELECT a.* FROM 
(	SELECT 
	ai.objid AS objid,	
	ai.startstub AS stub,
	CASE WHEN ac.currentseries IS NULL THEN ai.currentseries ELSE ac.currentseries END AS startseries,
	ai.endseries AS endseries,
	ac.txnmode AS txnmode,
	CASE WHEN ac.active IS NULL THEN 0 ELSE ac.active END  AS active,
	CASE WHEN ac.currentseries > ai.currentseries THEN 1 ELSE 0 END AS "open",
	ac.controlid,
	CASE WHEN ac.assignee_objid IS NULL THEN ai.respcenter_objid ELSE ac.assignee_objid END AS ownerid,
	CASE WHEN ac.assignee_objid IS NULL THEN 'COLLECTOR' ELSE 'SUBCOLLECTOR' END AS ownerrole
	FROM afserial_inventory ai
	LEFT JOIN afserial_control ac ON ac.controlid=ai.objid
	WHERE  ai.afid =  $P{af}
	AND ac.currentseries <= ai.endseries ) a
WHERE a.ownerid =  $P{userid} 
order by a.startseries 

[getCollectorOpenIssuanceList]
SELECT a.* FROM 
(	SELECT 
	ai.objid AS objid,	
	ai.startstub AS stub,
	CASE WHEN ac.currentseries IS NULL THEN ai.currentseries ELSE ac.currentseries END AS startseries,
	ai.endseries AS endseries,
	ac.txnmode AS txnmode,
	CASE WHEN ac.active IS NULL THEN 0 ELSE ac.active END  AS active,
	CASE WHEN ac.currentseries > ai.currentseries THEN 1 ELSE 0 END AS "open",
	ac.controlid,
	ac.assignee_name,
	CASE WHEN ac.assignee_objid IS NULL THEN ai.respcenter_objid ELSE ac.assignee_objid END AS ownerid,
	CASE WHEN ac.assignee_objid IS NULL THEN 'COLLECTOR' ELSE 'SUBCOLLECTOR' END AS ownerrole
	FROM afserial_inventory ai
	LEFT JOIN afserial_control ac ON ac.controlid=ai.objid
	WHERE  ai.afid =  $P{af} AND ai.respcenter_objid = $P{userid} 
	AND ac.currentseries <= ai.endseries ) a
ORDER BY a.startseries 

[getAssigneeIssuanceList]
SELECT 
ai.objid AS objid,	
ac.assignee_name,
ai.startstub AS stub,
ac.currentseries AS startseries,
ai.endseries AS endseries,
ac.txnmode,
ac.active AS active,
CASE WHEN ac.currentseries = ai.currentseries THEN 0 ELSE 1 END AS "open"
FROM afserial_inventory ai
INNER JOIN afserial_control ac ON ai.objid=ac.controlid
WHERE  ai.afid = $P{af} 
AND NOT(ac.assignee_objid IS NULL) 
AND ai.respcenter_objid = $P{userid}
and ac.currentseries <= ai.endseries 
ORDER BY ac.currentseries

[getAssigneeControlForBatchList]
SELECT a.* 
FROM 
(	SELECT DISTINCT 
	ai.objid AS controlid,	
	ai.prefix, 
	ai.suffix, 
	ai.currentstub,
	ac.currentseries,
	ac.currentseries as startseries,
	ai.endseries, 
	ai.currentstub AS stub,
	ac.assignee_objid AS ownerid,
	ai.respcenter_objid AS collector_objid,
	ai.respcenter_name AS collector_name,
	col.jobtitle AS collector_title,
	ac.assignee_objid AS subcollector_objid,
	ac.assignee_name AS subcollector_name,
	scol.jobtitle AS subcollector_title,
	af.serieslength
	FROM afserial_control ac 
	INNER JOIN  afserial_inventory ai ON ac.controlid=ai.objid
	INNER JOIN  afserial af on af.objid = ai.afid  
	inner join sys_user col on col.objid = ai.respcenter_objid
	left join sys_user scol on scol.objid = ac.assignee_objid 
	WHERE  ai.afid =  $P{formno}
	AND ac.txnmode = 'CAPTURE'
	AND ac.currentseries <= ai.endseries ) a
WHERE a.ownerid = $P{userid} and 
		( a.currentstub like $P{searchtext} or a.startseries like $P{searchtext} )


[findActiveControlForCashReceipt]
SELECT a.* 
FROM 
(	SELECT DISTINCT 
	ai.objid AS controlid,	
	ai.prefix, 
	ai.suffix, 
	ai.currentstub,
	ac.currentseries,
	ai.currentstub AS stub,
	CASE WHEN ac.assignee_objid IS NULL THEN ai.respcenter_objid ELSE ac.assignee_objid END AS ownerid,
	ai.respcenter_objid AS collector_objid,
	ai.respcenter_name AS collector_name,
	col.jobtitle AS collector_title,
	ac.assignee_objid AS subcollector_objid,
	ac.assignee_name AS subcollector_name,
	scol.jobtitle AS subcollector_title,
	af.serieslength 
	FROM afserial_control ac 
	INNER JOIN  afserial_inventory ai ON ac.controlid=ai.objid
	INNER JOIN  afserial af on af.objid = ai.afid  
	inner join sys_user col on col.objid = ai.respcenter_objid
	left join sys_user scol on scol.objid = ac.assignee_objid
	WHERE  ai.afid =  $P{afid}
	AND ac.active = 1
	AND ac.txnmode = $P{txnmode}
	AND ac.currentseries <= ai.endseries ) a
WHERE a.ownerid =  $P{userid}

[findActiveControlForActivation]
SELECT ac.controlid 
FROM afserial_control ac
INNER JOIN afserial_inventory ai ON ai.objid=ac.controlid
WHERE 
	(ac.assignee_objid =$P{userid} 
		OR (ai.respcenter_objid=$P{userid} AND ac.assignee_objid IS NULL )
     )
and ai.afid=$P{afid}
AND ac.txnmode = $P{txnmode}
AND ac.active=1

[findActiveControrForDeactivation]
select ac.controlid from afserial_control ac
 inner join afserial_inventory ai on ac.controlid = ai.objid 
where ac.controlid= $P{controlid} and ac.currentseries > ai.endseries

[createControl]
INSERT INTO afserial_control (controlid, txnmode,assignee_objid, assignee_name, currentseries,qtyissued,active)
SELECT objid, 'ONLINE', NULL, NULL, currentseries, 0,0
FROM afserial_inventory WHERE objid=$P{objid}

[activateControl]
INSERT INTO afserial_control (controlid, txnmode,assignee_objid, assignee_name, currentseries,qtyissued,active)
SELECT objid, $P{txnmode}, NULL, NULL, currentseries, 0,1
FROM afserial_inventory WHERE objid=$P{objid}

[reactivateControl]
UPDATE afserial_control 
SET active=1, txnmode=$P{txnmode} 
WHERE controlid=$P{objid}

[deactivateControl]
UPDATE afserial_control 
SET active = 0 
WHERE controlid=$P{objid}

[reactivateAssignSubcollector]
UPDATE afserial_control 
SET assignee_objid=$P{assigneeid},
   assignee_name=$P{assigneename}
WHERE controlid=$P{objid}   

[changeMode]
UPDATE afserial_control 
SET txnmode = $P{txnmode}
WHERE controlid=$P{objid}

[activateAssignSubcollector]
INSERT INTO afserial_control (controlid, txnmode,assignee_objid, assignee_name, currentseries,qtyissued,active)
SELECT objid, NULL, $P{assigneeid}, $P{assigneename}, currentseries, 0,1
FROM afserial_inventory WHERE objid=$P{objid}

[updateNextSeries]
UPDATE afserial_control 
SET currentseries = currentseries + 1,
qtyissued = qtyissued + 1
WHERE controlid = $P{controlid}

[closeAFControl]
UPDATE afserial_control SET 
	currentseries = $P{currentseries},
	active = 0, 
	txnmode =$P{txnmode} 
WHERE controlid = $P{controlid}

[findControlForBatch]
SELECT 
ac.controlid, 
ac.currentseries AS startseries,
ai.endseries AS endseries,
ai.startstub AS stub, 
ai.prefix,
ai.suffix, 
a.serieslength
FROM afserial_control ac
INNER JOIN afserial_inventory ai ON ai.objid=ac.controlid
INNER JOIN afserial a ON ai.afid=a.objid
WHERE ac.controlid = $P{controlid}

[unassignsubcollector]
update afserial_control set 
	assignee_name = null, assignee_objid = null, txnmode='ONLINE',  active = 0 
where controlid=$P{controlid} 
