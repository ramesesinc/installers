#----------------------------------------
# PlantTreeRySetting
#----------------------------------------
[getList]
SELECT * FROM planttreerysetting 
${filter}
ORDER BY ry 


[deleteAssessLevels]
DELETE FROM planttreeassesslevel WHERE planttreerysettingid = $P{objid}


[deleteUnitValues]
DELETE FROM planttreeunitvalue WHERE planttreerysettingid = $P{objid}


[deleteRySettingLgus]
DELETE FROM rysetting_lgu WHERE rysettingid = $P{objid} 



[getAssessLevels]
SELECT pal.*
FROM planttreeassesslevel pal 
WHERE pal.planttreerysettingid = $P{planttreerysettingid}


[getUnitValues]
SELECT
	puv.*,
	pt.code AS planttree_code,
	pt.name AS planttree_name
FROM planttreeunitvalue puv
	INNER JOIN planttree pt ON puv.planttree_objid = pt.objid
WHERE puv.planttreerysettingid  = $P{planttreerysettingid}
  AND puv.planttree_objid = $P{planttree_objid}



[getIdByRy]
SELECT objid FROM planttreerysetting WHERE ry = $P{ry} 


[checkDuplicate]
SELECT objid 
FROM planttreerysetting 
WHERE objid <> $P{objid} AND ry = $P{ry} 




