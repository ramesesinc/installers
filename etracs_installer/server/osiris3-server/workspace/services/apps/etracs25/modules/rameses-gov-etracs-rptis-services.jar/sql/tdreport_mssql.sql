[getTDInfo]
SELECT
	f.objid as faasid,
	f.*,
	rp.*,
	r.*,
	CASE WHEN p.objid IS NOT NULL THEN p.name ELSE c.name END AS parentlguname, 
	CASE WHEN p.objid IS NOT NULL THEN p.indexno ELSE c.indexno END AS parentlguindex,   
	CASE WHEN m.objid IS NOT NULL THEN m.name ELSE '' END AS lguname, 
	CASE WHEN m.objid IS NOT NULL THEN m.indexno ELSE d.indexno END AS lguindex,  
	b.name AS barangay,  
	b.indexno AS barangayindex, 
	et.code AS legalbasis, 
	ry.ordinanceno, ry.ordinancedate, ry.sangguniangname,
	t.trackingno 
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN barangay b ON rp.barangayid = b.objid 
	LEFT JOIN exemptiontype et ON r.exemptiontype_objid = et.objid 
	LEFT JOIN municipality m ON b.parentid = m.objid  
	LEFT JOIN district d ON b.parentid = d.objid 
	LEFT JOIN province p ON m.parentid = p.objid 
	LEFT JOIN city c ON d.parentid = c.objid 
	LEFT JOIN rysettinginfo ry on ry.ry = r.ry 
	LEFT JOIN rpttracking t ON f.objid = t.objid 
WHERE f.objid = $P{faasid}


[getAnnotationMemoranda]
SELECT memoranda, memoranda as annotationtext
FROM faasannotation 
WHERE faasid = $P{faasid} 
  AND state = 'APPROVED'


[getStandardLandAssessment]
SELECT 
	pc.name AS classification,
	lal.name AS actualuse,
	SUM(ld.area) AS area,
	ld.areatype,
	SUM(ld.marketvalue) AS marketvalue,
	ld.assesslevel,
	SUM(ld.assessedvalue) AS assessedvalue,
	SUM(ld.areasqm) AS areasqm,
	SUM(ld.areaha) AS areaha 
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN landrpu lr ON r.objid = lr.objid
	INNER JOIN landdetail ld ON lr.objid = ld.landrpuid 
	INNER JOIN landassesslevel lal ON ld.actualuse_objid = lal.objid 
WHERE f.objid = $P{faasid}
GROUP BY pc.name, lal.code, lal.name, ld.areatype, ld.assesslevel 

[getDetailedLandAssessment]
SELECT 
	pc.name AS classification,
	lal.name AS actualuse,
	ld.areatype,
	ld.assesslevel,
	spc.name AS specificclass,
	sub.name AS subclass,
	SUM(ld.area) AS area,	
	SUM(ld.marketvalue) AS marketvalue,
	SUM(ld.assessedvalue) AS assessedvalue,
	SUM(ld.areasqm) AS areasqm,
	SUM(ld.areaha) AS areaha 
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN landrpu lr ON r.objid = lr.objid
	INNER JOIN landdetail ld ON lr.objid = ld.landrpuid 
	INNER JOIN landassesslevel lal ON ld.actualuse_objid = lal.objid 
	INNER JOIN lcuvsubclass sub ON ld.subclass_objid = sub.objid 
	INNER JOIN lcuvspecificclass spc ON ld.specificclass_objid = spc.objid 
WHERE f.objid = $P{faasid}
GROUP BY pc.code, pc.name, lal.code, lal.name, ld.areatype, ld.assesslevel,
	spc.code, spc.name, sub.code, sub.name 


[getLandPlantTreeAssessment]
SELECT
	'PLANT/TREE' AS propertytype,
	pc.name AS classification,
	ptal.name AS actualuse,
	SUM(ptd.marketvalue) AS marketvalue,
	ptd.assesslevel,
	SUM(ptd.assessedvalue) AS assessedvalue
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN planttreedetail ptd ON r.objid = ptd.landrpuid 
	INNER JOIN planttreeassesslevel ptal ON ptd.actualuse_objid = ptal.objid 
	INNER JOIN planttree pt ON ptd.planttree_objid = pt.objid 
WHERE f.objid = $P{faasid}
GROUP BY pc.name, ptal.name, ptd.assesslevel



[getBldgInfo]
SELECT 
	br.*,
	(bt.name + ' - ' + bk.name) AS bldgdescription,
	bs.predominant
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN bldgrpu br ON r.objid = br.objid 
	INNER JOIN bldgtype bt ON br.bldgtype_objid = bt.objid
	INNER JOIN bldgkindbucc bucc ON br.bldgkindbucc_objid = bucc.objid
	INNER JOIN bldgkind bk ON bucc.bldgkind_objid = bk.objid 
	INNER JOIN bldgrysetting bs ON bt.bldgrysettingid = bs.objid 
WHERE f.objid = $P{faasid}


[getPredominantAssessment]
SELECT 
	'BLDG' AS propertytype,
	pc.name AS classification,
	bal.name AS actualuse,
	br.assesslevel, 
	r.totalmv AS marketvalue,
	r.totalav AS assessedvalue,
	r.totalareasqm AS area
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN bldgrpu br ON r.objid = br.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN bldgassesslevel bal ON br.bldgassesslevel_objid = bal.objid 
WHERE f.objid = $P{faasid}	


[getDetailedAssessment]
SELECT 
	'BLDG' AS propertytype,
	pc.name AS classification,
	bal.name AS actualuse,
	bu.assesslevel, 
	bu.marketvalue,
	bu.assessedvalue,
	bu.area 
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN bldgrpu br ON r.objid = br.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN bldguse bu ON br.objid = bu.bldgrpuid 
	INNER JOIN bldgassesslevel bal ON bu.actualuse_objid = bal.objid 
WHERE f.objid = $P{faasid}	


[getMachines]
SELECT 
	m.name AS machinename
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN machrpu mr ON r.objid = mr.objid 
	INNER JOIN machuse mu ON mr.objid = mu.machrpuid 
	INNER JOIN machdetail md ON mu.objid = md.machuseid 
	INNER JOIN machine m ON md.machine_objid = m.objid 
WHERE f.objid = $P{faasid}	


[getMachineAssessment]
SELECT 
	'MACH' AS propertytype,
	pc.name AS classification,
	mal.name AS actualuse,
	mu.marketvalue,
	mu.assesslevel,
	mu.assessedvalue,
	mu.basemarketvalue,
	mu.assesslevel,
	mu.assessedvalue,
	0.0 AS area
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN machrpu mr ON r.objid = mr.objid 
	INNER JOIN machuse mu ON mr.objid = mu.machrpuid 
	INNER JOIN machassesslevel mal ON mu.actualuse_objid = mal.objid 
WHERE f.objid = $P{faasid}


[getMachineDetailedAssessment]
SELECT 
	'MACH' AS propertytype,
	pc.name AS classification,
	m.name AS machine,
	mal.name AS actualuse,
	md.depreciation,
	md.marketvalue,
	md.basemarketvalue,
	md.assesslevel,
	md.assessedvalue,
	mal.objid AS actualuseid,
	0.0 AS area,
	md.operationyear,
	md.replacementcost,
	md.brand,
	md.model
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN machrpu mr ON r.objid = mr.objid 
	INNER JOIN machuse mu ON mr.objid = mu.machrpuid 
	INNER JOIN machassesslevel mal ON mu.actualuse_objid = mal.objid 
	INNER JOIN machdetail md ON mu.objid = md.machuseid 
	INNER JOIN machine m ON md.machine_objid = m.objid
WHERE f.objid = $P{faasid}	


[getPlantTreeAssessment]
SELECT
	'PLANT/TREE' AS propertytype,
	pc.name AS classification,
	ptal.name AS actualuse,
	SUM(ptd.marketvalue) AS marketvalue,
	ptd.assesslevel,
	SUM(ptd.assessedvalue) AS assessedvalue 
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN planttreedetail ptd ON r.objid = ptd.planttreerpuid 
	INNER JOIN planttreeassesslevel ptal ON ptd.actualuse_objid = ptal.objid 
	INNER JOIN planttree pt ON ptd.planttree_objid = pt.objid 
WHERE f.objid = $P{faasid}
GROUP BY pc.name, ptal.name, ptd.assesslevel


[getMiscItems]
SELECT 
	mi.name 
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN miscrpu mr ON r.objid = mr.objid 
	INNER JOIN miscrpuitem mri ON mr.objid = mri.miscrpuid 
	INNER JOIN miscitem mi ON mri.miscitem_objid = mi.objid 
WHERE f.objid = $P{faasid}


[getMiscAssessment]
SELECT  
	'MISC' AS propertytype,
	pc.name AS classification,
	mal.name AS actualuse,
	SUM(mri.marketvalue) AS marketvalue,
	mri.assesslevel,
	SUM(mri.assessedvalue) AS assessedvalue
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN miscrpu mr ON r.objid = mr.objid 
	INNER JOIN miscassesslevel mal ON mr.actualuse_objid = mal.objid 
	INNER JOIN miscrpuitem mri ON mr.objid = mri.miscrpuid 
WHERE f.objid = $P{faasid}
GROUP BY pc.name, mal.name, mri.assesslevel 	
	

