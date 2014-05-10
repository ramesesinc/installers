[createRpuMaster]
INSERT INTO rpumaster(objid, currentfaasid, currentrpuid) 
VALUES($P{objid}, $P{currentfaasid}, $P{currentrpuid})


[deleteRpuMaster]
DELETE FROM rpumaster WHERE objid = $P{objid}


[findDuplicateFullPin]
SELECT objid 
FROM rpu
WHERE objid <> $P{objid} AND ry = $P{ry} AND fullpin = $P{fullpin} 


[deleteRpu]
DELETE FROM rpu WHERE objid = $P{objid} AND state NOT IN ('CURRENT', 'CANCELLED')


[findRpuInfoById]
SELECT * FROM rpu WHERE objid = $P{objid}


[findLandRpuById]
SELECT *
FROM rpu 
WHERE objid = $P{objid}


[findLandRpuByRealPropertyId]
SELECT rpu.*
FROM rpu rpu
  INNER JOIN realproperty rp ON rpu.realpropertyid = rp.objid 
WHERE rpu.realpropertyid = $P{realpropertyid} 
  AND rpu.rputype = 'land' 


[updateRpuState]
UPDATE rpu SET state = $P{state} WHERE objid = $P{objid}


[updateBldgRpuLandRpuId]  
UPDATE bldgrpu b, rpu r SET 
  b.landrpuid = $P{landrpuid}
WHERE b.objid = r.objid 
  AND r.realpropertyid = $P{realpropertyid}
  AND r.state <> 'CANCELLED' 


[updateMachRpuLandRpuId]  
UPDATE machrpu m, rpu r SET 
  m.landrpuid = $P{landrpuid}
WHERE m.objid = r.objid 
  AND r.realpropertyid = $P{realpropertyid}
  AND r.state <> 'CANCELLED' 


[updatePlantTreeRpuLandRpuId]  
UPDATE planttreerpu p, rpu r SET 
  p.landrpuid = $P{landrpuid}
WHERE p.objid = r.objid 
  AND r.realpropertyid = $P{realpropertyid}
  AND r.state <> 'CANCELLED'   


[updateMiscRpuLandRpuId]  
UPDATE miscrpu m, rpu r  SET 
  m.landrpuid = $P{landrpuid}
WHERE m.objid = r.objid 
  AND r.realpropertyid = $P{realpropertyid}
  AND r.state <> 'CANCELLED'     
  


[getNextSuffixes]
SELECT 
  rputype,
  MAX(suffix +1) AS nextsuffix 
FROM rpu 
WHERE realpropertyid = $P{realpropertyid}
AND rputype <> 'land'
GROUP BY rputype 


[updateSuffix]
UPDATE rpu SET suffix = $P{suffix}, fullpin = $P{fullpin} WHERE objid = $P{objid}


  
[modifyPin]
update rpu set 
  fullpin=$P{newpin}, suffix=$P{suffix}
where objid=$P{rpuid}


[getLandImprovementsRpuByRealPropertyId]
SELECT rpu.*
FROM rpu rpu
  INNER JOIN realproperty rp ON rpu.realpropertyid = rp.objid 
WHERE rpu.realpropertyid = $P{realpropertyid} 
  AND rpu.rputype != 'land'   