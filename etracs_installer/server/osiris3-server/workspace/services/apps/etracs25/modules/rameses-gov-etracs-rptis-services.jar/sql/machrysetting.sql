#----------------------------------------
# MachRySetting
#----------------------------------------
[getList]
SELECT * FROM machrysetting 
${filter}
ORDER BY ry 


[deleteRanges]
DELETE FROM machassesslevelrange WHERE machrysettingid = $P{objid} 

[deleteAssessLevels]
DELETE FROM machassesslevel WHERE machrysettingid = $P{objid} 

[deleteForexes]
DELETE FROM machforex WHERE machrysettingid = $P{objid} 

[deleteRySettingLgus]
DELETE FROM rysetting_lgu WHERE rysettingid = $P{objid} 


#----------------------------------------
# ASSESSLEVEL SUPPORT
#----------------------------------------
[getAssessLevels]
SELECT 
	mal.*, 
	pc.code AS classification_code,
	pc.name AS classification_name
FROM machassesslevel mal 
	INNER JOIN propertyclassification pc ON mal.classification_objid = pc.objid 
WHERE mal.machrysettingid = $P{machrysettingid} 
ORDER BY pc.orderno, mal.code 


[deleteRangeByAssessLevelId]
DELETE FROM machassesslevelrange WHERE machassesslevelid = $P{machassesslevelid}

[getAssessLevelRanges]
SELECT * FROM machassesslevelrange WHERE machassesslevelid = $P{machassesslevelid} ORDER BY mvfrom  


#----------------------------------------
# FOREX SUPPORT
#----------------------------------------

[getForexes]
SELECT * FROM machforex WHERE machrysettingid = $P{machrysettingid} ORDER BY year




[getIdByRy]
SELECT objid FROM machrysetting WHERE ry = $P{ry} 


[checkDuplicateSetting]
SELECT objid 
FROM machrysetting 
WHERE objid <> $P{objid} AND ry = $P{ry} 



