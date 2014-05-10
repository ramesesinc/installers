[getList]
SELECT 
	c.*,
	rp.pin AS rp_pin,
	r.totalareaha AS rpu_totalareaha,
	r.totalareasqm AS rpu_totalareasqm,
	CASE WHEN t.trackingno IS NULL THEN c.txnno ELSE t.trackingno END AS trackingno
FROM consolidation c
	LEFT JOIN rpu r ON c.newrpuid = r.objid 
	LEFT JOIN realproperty rp ON c.newrpid = rp.objid 
	LEFT JOIN rpttracking t ON c.objid = t.objid 
where 1=1 ${filters}	
ORDER BY c.txnno DESC 



[findById]
SELECT c.*,
	r.ry AS rpu_ry, 
	r.objid AS rpu_objid, 
	r.totalareaha AS rpu_totalareaha, 
	r.totalareasqm AS rpu_totalareasqm, 
	r.fullpin AS rpu_fullpin, 
	r.rputype AS rpu_rputype, 
	r.totalmv AS rpu_totalmv, 
	r.totalav AS rpu_totalav, 
	pc.code AS rpu_classfication_code,
	pc.name AS rpu_classification_name,

	rp.objid AS rp_objid,
	rp.pin AS rp_pin,
	rp.ry AS rp_ry,
	rp.surveyno AS rp_surveyno,
	rp.cadastrallotno AS rp_cadastrallotno,
	rp.blockno AS rp_blockno,
	rp.lgutype AS rp_lgutype, 
	rp.barangayid AS rp_barangayid, 
	rp.claimno AS rp_claimno,
	t.trackingno,
	CASE WHEN task.taskid IS NULL THEN null ELSE task.action END AS taskaction,
	CASE WHEN task.taskid IS NULL THEN null ELSE task.msg END AS taskmsg
FROM consolidation c
	LEFT JOIN faas f ON c.newfaasid = f.objid 
	LEFT JOIN realproperty rp ON c.newrpid = rp.objid 
	LEFT JOIN rpu r ON c.newrpuid = r.objid 
	LEFT JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	LEFT JOIN rpttracking t ON c.objid = t.objid 
	LEFT JOIN rpttask task ON c.objid = task.objid AND task.enddate IS NULL 
WHERE c.objid = $P{objid}	


[getConsolidatedLands]
SELECT cl.*,
	f.tdno AS faas_tdno,
	f.owner_name AS faas_owner_name, 
	r.realpropertyid AS rpu_realpropertyid,
	r.fullpin AS rpu_fullpin,
	r.totalmv AS rpu_totalmv,
	r.totalav AS rpu_totalav,
	r.totalareaha AS rpu_totalareaha,
	r.totalareasqm AS rpu_totalareasqm,
	rp.barangayid
FROM consolidatedland cl
	INNER JOIN faas f ON cl.landfaasid = f.objid 
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid 
WHERE cl.consolidationid = $P{consolidationid}
ORDER BY r.fullpin 


[findDuplicateConsolidatedLand]
SELECT * FROM consolidatedland 
WHERE consolidationid = $P{consolidationid} AND landfaasid = $P{landfaasid}


[getAffectedRpus]
SELECT 
	car.*,
	f.state AS prevstate,
	f.tdno AS prevtdno,
	r.suffix AS prevsuffix,
	r.fullpin AS prevfullpin,
	r.rputype 
FROM consolidationaffectedrpu car
	INNER JOIN faas f ON car.prevfaasid = f.objid 
	INNER JOIN rpu r ON f.rpuid = r.objid
WHERE car.consolidationid = $P{consolidationid}	

[getAffectedRpusWithNoPin]
SELECT 
	car.*,
	f.tdno AS prevtdno
FROM consolidationaffectedrpu car
	INNER JOIN faas f ON car.prevfaasid = f.objid 
WHERE car.consolidationid = $P{objid}	
  AND car.newrpid IS NULL 


[getAffectedRpusByConsolidatedLandId]
SELECT 
	r.objid,
	r.rputype 
FROM consolidationaffectedrpu car
	INNER JOIN rpu r ON car.newrpuid = r.objid 
WHERE car.landfaasid = $P{landfaasid}


[getAffectedRpusByConsolidatedLand]
SELECT 
	f.objid AS objid,
	$P{consolidationid} AS consolidationid,
	f.objid AS prevfaasid,
	r.objid AS prevrpuid, 
	r.suffix AS newsuffix,
	r.rputype,
	fl.objid AS landfaasid
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN rpu rl ON r.realpropertyid = rl.realpropertyid
	INNER JOIN faas fl ON rl.objid = fl.rpuid 	
WHERE r.realpropertyid = $P{realpropertyid}
  AND r.rputype <> 'land' 
  AND rl.rputype = 'land'
  AND f.state <> 'CANCELLED' 
  AND fl.state = 'CURRENT'
  AND NOT EXISTS(SELECT * FROM consolidationaffectedrpu WHERE prevfaasid = f.objid )




[getNewlyCreatedAffectedRpus]
SELECT 
	f.objid AS objid,
	$P{consolidationid} AS consolidationid,
	f.objid AS prevfaasid,
	r.objid AS prevrpuid, 
	r.suffix AS newsuffix,
	r.rputype,
	fl.objid AS landfaasid
FROM consolidatedland cl
	INNER JOIN rpu r ON cl.rpid = r.realpropertyid
	INNER JOIN faas f ON  r.objid = f.rpuid 
	INNER JOIN rpu rl ON cl.rpid = rl.realpropertyid
	INNER JOIN faas fl ON rl.objid = fl.rpuid 
WHERE cl.consolidationid = $P{consolidationid}
  AND r.rputype <> 'land' 
  AND rl.rputype = 'land'
  AND f.state <> 'CANCELLED' 
  AND fl.state = 'CURRENT'
  AND NOT EXISTS(SELECT * FROM consolidationaffectedrpu WHERE prevfaasid = f.objid )
ORDER BY rputype 


[deleteAffectedRpuByLandFaasId]
DELETE FROM consolidationaffectedrpu WHERE landfaasid = $P{landfaasid}


[deleteAffectedRpuByPrevFaasId]
DELETE FROM consolidationaffectedrpu WHERE prevfaasid = $P{prevfaasid}

  
[findTotalConsolidatedLandArea]  
SELECT SUM( r.totalareasqm ) AS totalareasqm 
FROM consolidatedland cl
	INNER JOIN rpu r on cl.rpuid = r.objid 
WHERE cl.consolidationid = $P{consolidationid}


[setConsolidationFaasId]
UPDATE consolidation SET newfaasid = $P{newfaasid} WHERE objid = $P{objid}


[clearConsolidationFaasId]
UPDATE consolidation SET newfaasid = null WHERE objid = $P{objid}


[clearAffectedRpuNewFaasId]
UPDATE consolidationaffectedrpu SET newfaasid = null WHERE objid = $P{objid}




[approveConsolidation]
UPDATE cs SET
	cs.state = 'APPROVED'
FROM consolidation cs
	INNER JOIN faas f ON cs.newfaasid = f.objid  
WHERE cs.objid = $P{objid}


[cancelRealProperty]
UPDATE realproperty SET state = 'CANCELLED' WHERE objid = $P{objid}

[cancelLandLedger]
UPDATE rptledger SET state = 'CANCELLED' WHERE faasid = $P{faasid}






#===============================================================
#
#  ASYNCHRONOUS APPROVAL SUPPORT 
#
#================================================================

[findFaasByNewRpuId]
SELECT 
	r.ry AS rpu_ry, 
	rp.barangayid AS rp_barangay_objid
FROM rpu r 
	INNER JOIN realproperty rp ON r.realpropertyid = rp.objid 
WHERE r.objid =  $P{newrpuid}	


[updateConsolidationNewTdNo]
UPDATE consolidation SET 
	newtdno = $P{newtdno}, newutdno = $P{newutdno}
WHERE objid =$P{objid}	

[updateConsolidationNewFaasId]
UPDATE consolidation SET 
	newfaasid = $P{newfaasid}
WHERE objid =$P{objid}	


[updateAffectedNewTdNo]
UPDATE consolidationaffectedrpu SET 
	newtdno = $P{newtdno}, newutdno = $P{newutdno}
WHERE objid =$P{objid}	






[findBarangayId]
SELECT rp.barangayid
FROM consolidation c
	LEFT JOIN realproperty rp ON c.newrpid = rp.objid 
WHERE c.objid = $P{objid}	




[getFaasListing]
SELECT 
	f.objid, 
	f.tdno, 
	r.rputype,
	r.fullpin 
FROM faas f 
	INNER JOIN rpu r ON f.rpuid = r.objid 
WHERE f.objid in (	
	SELECT c.newfaasid
	FROM consolidation c
	WHERE c.objid = $P{objid}

	UNION ALL

	SELECT arpu.newfaasid
	FROM consolidation c
		INNER JOIN consolidationaffectedrpu arpu ON c.objid = arpu.consolidationid
	WHERE c.objid = $P{objid}
)
ORDER BY f.tdno 