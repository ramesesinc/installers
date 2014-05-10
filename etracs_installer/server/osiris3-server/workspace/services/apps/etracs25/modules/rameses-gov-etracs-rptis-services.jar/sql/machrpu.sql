[getMachUses]
SELECT 
  mu.*,
  mal.code AS actualuse_code,
  mal.name AS actualuse_name,
  mal.fixrate AS actualuse_fixrate,
  mal.rate AS actualuse_rate
FROM machuse mu
  INNER JOIN machassesslevel mal ON mu.actualuse_objid = mal.objid 
WHERE mu.machrpuid = $P{machrpuid}  


[getMachDetails]
SELECT
  md.*,
  m.code AS machine_code,
  m.name AS machine_name 
FROM machdetail md
  INNER JOIN machine m ON md.machine_objid = m.objid 
WHERE md.machuseid = $P{machuseid}  


[deleteAllMachDetails]
DELETE FROM machdetail WHERE machrpuid = $P{objid}


[deleteAllMachUses]
DELETE FROM machuse WHERE machrpuid = $P{objid}


[findMachRySetting]
SELECT * FROM machrysetting WHERE ry = $P{ry}