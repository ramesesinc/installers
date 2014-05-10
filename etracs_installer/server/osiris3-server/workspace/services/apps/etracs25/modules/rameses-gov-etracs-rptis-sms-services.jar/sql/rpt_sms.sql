[findFaasByTdNo]
SELECT f.objid, f.state, rl.objid AS rptledgerid 
FROM faas f
	LEFT JOIN rptledger rl ON f.objid = rl.faasid 
WHERE tdno = $P{refno}


[findRegisteredFaasByTdNo]
SELECT f.tdno, f.state, rp.cadastrallotno, r.totalmv, r.totalav, 
	rl.objid AS rptledgerid,
	rl.lastyearpaid, rl.lastqtrpaid
FROM rpt_sms_registration s
	INNER JOIN rptledger rl ON s.refid = rl.objid 
	INNER JOIN faas f ON f.objid = rl.faasid 
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid 
WHERE f.tdno = $P{refno}
  AND s.phoneno = $P{phoneno}
  

 [getRegisteredFaasesByPhoneNo]
 SELECT f.tdno, f.state, rp.cadastrallotno, r.totalmv, r.totalav ,
 	rl.objid AS rptledgerid,
	rl.lastyearpaid, rl.lastqtrpaid
FROM rpt_sms_registration s
	INNER JOIN rptledger rl ON s.refid = rl.objid 
	INNER JOIN faas f ON f.objid = rl.faasid 
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid 
WHERE s.phoneno = $P{phoneno}


[enroll]
INSERT INTO rpt_sms_registration 
	(phoneno, refid, dtregistered)
VALUES
	($P{phoneno}, $P{refid}, GETDATE())


[deleteRegisteredTdNo]		
DELETE FROM rpt_sms_registration 
WHERE refid IN (
	SELECT rl.objid 
	FROM rptledger rl 
		INNER JOIN faas f ON rl.faasid = f.objid 
		INNER JOIN rpt_sms_registration s ON rl.objid = s.refid 
	WHERE f.tdno = $P{refno}
	  AND s.phoneno = $P{phoneno}
)


[deleteAllRegistration]
DELETE FROM rpt_sms_registration WHERE phoneno = $P{phoneno}




[findTrackingInfo]
SELECT * FROM rpttracking WHERE trackingno =$P{refno}

[findRegisteredTracking]
SELECT t.*
FROM rpt_sms_registration s
	INNER JOIN rpttracking t ON s.refid = t.objid 
WHERE t.trackingno = $P{refno}


[getPhones]
SELECT *
FROM rpt_sms_registration
WHERE refid = $P{refid}