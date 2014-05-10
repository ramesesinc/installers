[getList]
SELECT 
	s.*,
	f.tdno AS tdno,
	f.tdno AS motherfaas_tdno,
	f.owner_name, 
	f.owner_address,
	r.totalareaha,
	r.totalareasqm,
	r.fullpin,
	r.totalmv, 
	r.totalav,
	rp.surveyno,
	rp.cadastrallotno,
	rp.blockno,
	pc.code AS classfication_code,
	pc.name AS classification_name,
	t.trackingno
FROM subdivision s
	INNER JOIN faas f ON s.motherfaasid = f.objid 
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON r.realpropertyid = rp.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	LEFT JOIN rpttracking t ON s.objid = t.objid 
WHERE s.state LIKE $P{state}
  AND (s.txnno LIKE $P{searchtext} OR f.tdno LIKE $P{searchtext} OR 
       f.owner_name LIKE $P{searchtext} OR r.fullpin LIKE $P{searchtext} OR t.trackingno LIKE $P{searchtext})
ORDER BY s.txnno        


[findSubdivisionById]
SELECT s.*,
	f.tdno AS motherfaas_tdno, 
	f.taxpayer_objid AS motherfaas_taxpayer_objid,
	f.taxpayer_name AS motherfaas_taxpayer_name,
	f.taxpayer_address AS motherfaas_taxpayer_address,
	f.owner_name AS motherfaas_owner_name,
	f.owner_address AS motherfaas_owner_address,
	f.lguid AS motherfaas_lguid, 
	f.txntype_objid AS motherfaas_txntype_objid,
	f.datacapture AS motherfaas_datacapture,
	r.ry AS motherfaas_ry, 
	r.objid AS motherfaas_rpuid, 
	r.totalareaha AS motherfaas_totalareaha, 
	r.totalareasqm AS motherfaas_totalareasqm, 
	r.fullpin AS motherfaas_fullpin, 
	r.rputype AS motherfaas_rputype, 
	r.totalmv AS motherfaas_totalmv, 
	r.totalav AS motherfaas_totalav, 
	rp.surveyno AS motherfaas_surveyno,
	rp.cadastrallotno AS motherfaas_cadastrallotno,
	rp.objid AS motherfaas_realpropertyid,
	rp.blockno AS motherfaas_blockno,
	rp.lgutype AS motherfaas_lgutype, 
	rp.barangayid AS motherfaas_barangayid, 
	rp.claimno AS motherfaas_claimno, 
	pc.code AS classfication_code,
	pc.name AS classification_name,
	t.trackingno,
	CASE WHEN task.taskid IS NULL THEN null ELSE task.action END AS taskaction,
	CASE WHEN task.taskid IS NULL THEN null ELSE task.msg END AS taskmsg
FROM subdivision s
	INNER JOIN faas f ON s.motherfaasid = f.objid 
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON r.realpropertyid = rp.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	LEFT JOIN rpttracking t ON s.objid = t.objid 
	LEFT JOIN rpttask task ON s.objid = task.objid AND task.enddate IS NULL 
WHERE s.objid = $P{objid}	



[deleteFaas]
DELETE FROM faas WHERE objid = $P{objid}


[getSubdividedLands]
SELECT sl.*,
	rp.objid AS rp_objid,
	rp.ry AS rp_ry,
	rp.state AS rp_state,
	rp.claimno AS rp_claimno,
	rp.cadastrallotno AS rp_cadastrallotno,
	rp.surveyno AS rp_surveyno,
	rp.north AS rp_north,
	rp.east AS rp_east,
	rp.west AS rp_west,
	rp.south AS rp_south,
	b.name AS rp_barangay_name,
	r.objid AS rpu_objid,
	r.rputype AS rpu_rputype,
	r.fullpin AS rpu_fullpin,
	r.totalareasqm AS rpu_totalareasqm,
	r.totalareaha AS rpu_totalareaha,
	r.totalav AS rpu_totalav,
	r.totalmv AS rpu_totalmv 
FROM subdividedland sl
	INNER JOIN realproperty rp ON sl.newrpid = rp.objid 
	INNER JOIN barangay b ON rp.barangayid = b.objid 
	LEFT JOIN rpu r ON sl.newrpuid = r.objid  
WHERE sl.subdivisionid = $P{subdivisionid}
ORDER BY sl.newpin 
	



[getAffectedRpus]
SELECT 
	sar.*,
	f.state AS prevstate,
	f.tdno AS prevtdno,
	f.taxpayer_objid,
	f.taxpayer_name,
	f.taxpayer_address,
	f.owner_name,
	f.owner_address,
	r.suffix AS prevsuffix,
	r.fullpin AS prevfullpin,
	r.rputype 
FROM subdivisionaffectedrpu sar
	INNER JOIN faas f ON sar.prevfaasid = f.objid 
	INNER JOIN rpu r ON f.rpuid = r.objid
WHERE sar.subdivisionid = $P{subdivisionid}	
ORDER BY r.fullpin


[getAffectedRpusForCreate]
SELECT 
	f.objid AS objid,
	$P{subdivisionid} AS subdivisionid,
	f.objid AS prevfaasid,
	r.objid AS prevrpuid, 
	r.suffix AS newsuffix,
	r.rputype 
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
WHERE r.realpropertyid = $P{realpropertyid}
  AND r.rputype <> 'land' 
  AND f.state <> 'CANCELLED' 
  AND NOT EXISTS(SELECT * FROM subdivisionaffectedrpu WHERE prevfaasid = f.objid )
ORDER BY rputype 


  
[clearAffectedRpuNewFaasId]
UPDATE subdivisionaffectedrpu SET newfaasid = null WHERE objid = $P{objid}

[clearSubdividedLandNewFaasId]
UPDATE subdividedland SET newfaasid = null WHERE objid = $P{objid}


[deleteAffectedRpuByPrevFaasId]
DELETE FROM subdivisionaffectedrpu WHERE prevfaasid = $P{prevfaasid}


[updateAffectedRpuRealPropertyId]
UPDATE rpu SET realpropertyid = $P{realpropertyid} WHERE objid = $P{rpuid}



#--------------------------------------------------------------------------------------------------
#
# APPROVED SUPPORT
#
#--------------------------------------------------------------------------------------------------
[approveSubdivision]
UPDATE subdivision SET state = 'APPROVED' WHERE objid = $P{objid}


[cancelRealProperty]
UPDATE realproperty SET state = 'CANCELLED' WHERE objid = $P{objid}

[cancelMotherLandLedger]
UPDATE rptledger SET state = 'CANCELLED' WHERE faasid = $P{faasid}



[updateSubdividedLandNewTdNo]
UPDATE sl SET
	sl.newtdno =	f.tdno 	
FROM subdividedland sl
	inner join faas f on sl.newfaasid = f.objid  
where subdivisionid = $P{subdivisionid}


[updateAffectedRpuNewTdNo]
UPDATE srpu SET
	srpu.newtdno =	f.tdno 	
FROM subdivisionaffectedrpu srpu
	inner join faas f on srpu.newfaasid = f.objid  
where subdivisionid = $P{subdivisionid}


[updateRpuFullPin]
UPDATE rpu SET fullpin = $P{fullpin} WHERE objid = $P{objid}





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


[updateLandNewTdNo]
UPDATE subdividedland SET 
	newtdno = $P{newtdno}, newutdno = $P{newutdno}
WHERE objid =$P{objid}	



[updateAffectedNewTdNo]
UPDATE subdivisionaffectedrpu SET 
	newtdno = $P{newtdno}, newutdno = $P{newutdno}
WHERE objid =$P{objid}	





[getAffectedRpuWithNoPin]
SELECT pf.tdno
FROM subdivisionaffectedrpu sr
	INNER JOIN faas pf ON sr.prevfaasid = pf.objid 
WHERE sr.subdivisionid = $P{objid}	
  AND sr.newrpid IS NULL 


[clearAffectedNewRpuRealPropertyId]
UPDATE r SET 
	r.realpropertyid = null 
FROM subdivisionaffectedrpu sr 
	INNER JOIN rpu r ON sr.newrpuid = r.objid 
 WHERE sr.subdividedlandid = $P{objid}


[clearAffectedRpuNewRealPropertyInfo]
UPDATE subdivisionaffectedrpu SET subdividedlandid = null, newrpid = null, newpin = null WHERE subdividedlandid = $P{objid}



[getFaasListing]
SELECT 
	f.objid, 
	f.tdno, 
	r.rputype,
	r.fullpin 
FROM faas f 
	INNER JOIN rpu r ON f.rpuid = r.objid 
WHERE f.objid in (	
	SELECT sl.newfaasid
	FROM subdivision s
		INNER JOIN subdividedland sl ON s.objid = sl.subdivisionid
	WHERE s.objid = $P{objid}

	UNION ALL


	SELECT arpu.newfaasid
	FROM subdivision s
		INNER JOIN subdivisionaffectedrpu arpu ON s.objid = arpu.subdivisionid
	WHERE s.objid = $P{objid}
)
ORDER BY f.tdno 