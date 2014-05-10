[getList]
SELECT * 
FROM rptcertification
where 1=1 ${filters}
ORDER BY txnno DESC


[insertLandHoldingItems]
INSERT INTO rptcertificationitem (rptcertificationid,refid)
SELECT 
	$P{rptcertificationid},
	f.objid 
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN barangay b ON rp.barangayid = b.objid 
WHERE f.taxpayer_objid	= $P{taxpayerid}
  AND f.state = 'CURRENT' 
  AND r.rputype = 'land'


[insertLandHoldingWithImprovementItems]
INSERT INTO rptcertificationitem (rptcertificationid,refid)
SELECT 
	$P{rptcertificationid},
	f.objid 
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN barangay b ON rp.barangayid = b.objid 
WHERE f.taxpayer_objid	= $P{taxpayerid}
  AND f.state = 'CURRENT' 
  AND r.rputype = 'land'
  AND EXISTS( SELECT * 
  			  FROM faas f 
  			  	INNER JOIN rpu rpu ON f.rpuid = rpu.objid 
  			  WHERE f.realpropertyid = r.realpropertyid 
  			    AND f.state = 'CURRENT' 
  			    AND rpu.rputype <> 'land'
  			)

[insertLandHoldingWithNoImprovementItems]
INSERT INTO rptcertificationitem (rptcertificationid,refid)
SELECT 
	$P{rptcertificationid},
	f.objid 
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN barangay b ON rp.barangayid = b.objid 
WHERE f.taxpayer_objid	= $P{taxpayerid}
  AND f.state = 'CURRENT' 
  AND r.rputype = 'land'
  AND NOT EXISTS( SELECT * FROM rpu 
  			  WHERE realpropertyid = r.realpropertyid 
  			    AND state = 'CURRENT' 
  			    AND rputype <> 'land'
  			)


[getLandHoldingItems]
SELECT 
	f.tdno,
	f.taxpayer_name, 
	f.owner_name, 
	f.titleno,	
	pc.code AS classcode, 
	pc.name AS classname,
	rp.cadastrallotno,
	b.name AS barangay, 
	r.totalareaha AS totalareaha,
	r.totalareasqm AS totalareasqm,
	r.totalav,
	r.totalmv, 
	rp.surveyno
FROM rptcertificationitem rci 
	INNER JOIN faas f ON rci.refid = f.objid 
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN barangay b ON rp.barangayid = b.objid 
WHERE rci.rptcertificationid = $P{rptcertificationid}
ORDER BY f.tdno, r.fullpin

[insertMultipleItems]
INSERT INTO rptcertificationitem (rptcertificationid,refid)
SELECT 
	$P{rptcertificationid},
	f.objid 
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN barangay b ON rp.barangayid = b.objid 
WHERE f.taxpayer_objid	= $P{taxpayerid}
  AND f.state = 'CURRENT' 


[getMultipleItems]
SELECT 
	f.tdno,
	f.taxpayer_name, 
	f.owner_name, 
	f.titleno,	
	pc.code AS classcode, 
	pc.name AS classname,
	rp.cadastrallotno,
	b.name AS barangay, 
	r.rputype, 
	r.totalareaha AS totalareaha,
	r.totalareasqm AS totalareasqm,
	r.totalav,
	r.totalmv, 
	rp.surveyno
FROM rptcertificationitem rci 
	INNER JOIN faas f ON rci.refid = f.objid 
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN barangay b ON rp.barangayid = b.objid 
WHERE rci.rptcertificationid = $P{rptcertificationid}  
ORDER BY r.fullpin


[getFaasInfo]
SELECT 
	f.tdno, f.titleno, f.titledate, 
	pc.code AS classcode, 
	pc.name AS classname, 
	r.ry, r.realpropertyid, r.rputype, r.fullpin, r.totalmv, r.totalav,
	r.totalareasqm, r.totalareaha,
	rp.barangayid, rp.cadastrallotno, rp.blockno, rp.surveyno,
	b.name AS barangay_name
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN barangay b ON rp.barangayid = b.objid 
WHERE f.objid = $P{faasid}


[getAnnotation]
SELECT objid, txnno
FROM faasannotation
WHERE faasid = $P{faasid} 
  AND STATE = 'APPROVED'


[getProperties]
SELECT objid FROM faas WHERE taxpayer_objid = $P{taxpayerid} AND state = 'CURRENT'


[findImprovementCount]
SELECT 
	COUNT(*) AS improvcount
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
WHERE f.objid = $P{faasid}
  AND f.state = 'CURRENT' 
  AND r.rputype = 'land'
  AND EXISTS( SELECT * FROM faas xf 
  				INNER JOIN rpu xr ON xf.rpuid = xr.objid 
  			  WHERE xr.realpropertyid = r.realpropertyid 
  			    AND xf.state = 'CURRENT' 
  			    AND xr.rputype <> 'land'
  			)


[getLandItems]
SELECT 
	f.tdno,
	f.taxpayer_name, 
	f.owner_name, 
	f.titleno,	
	pc.code AS classcode, 
	pc.name AS classname,
	rp.cadastrallotno,
	b.name AS barangay, 
	r.totalareaha AS totalareaha,
	r.totalareasqm AS totalareasqm,
	r.totalav,
	r.totalmv, 
	rp.surveyno
FROM rptcertificationitem rci 
	INNER JOIN faas f ON rci.refid = f.objid 
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN barangay b ON rp.barangayid = b.objid 
WHERE rci.rptcertificationid = $P{rptcertificationid}
ORDER BY r.fullpin





[insertLandWithNoImprovement]
INSERT INTO rptcertificationitem (rptcertificationid,refid)
SELECT 
	$P{rptcertificationid},
	f.objid 
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN barangay b ON rp.barangayid = b.objid 
WHERE f.objid = $P{faasid} 


[insertLandImprovement]
INSERT INTO rptcertificationitem (rptcertificationid,refid)
SELECT 
	$P{rptcertificationid},
	f.objid 
FROM faas f 
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN barangay b ON rp.barangayid = b.objid 
WHERE f.state = 'CURRENT'
  AND r.rputype <> 'land' 
  AND EXISTS(
	SELECT xf.objid FROM faas xf 
		INNER JOIN rpu xr ON xf.rpuid = xr.objid 
	WHERE xf.objid = $P{faasid}
	  AND xr.realpropertyid = r.realpropertyid 
  )


[findFaasById]
SELECT 
	f.tdno,
	f.owner_name,
	b.name AS barangay
FROM faas f 
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid 
	INNER JOIN barangay b ON rp.barangayid = b.objid 
WHERE f.objid = $P{faasid}