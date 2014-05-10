[getUnmappedBarangays]
SELECT objid AS barangayid, name  AS barangay, indexno 
FROM barangay b
WHERE NOT EXISTS(SELECT * FROM brgy_taxaccount_mapping WHERE barangayid = b.objid)
ORDER BY indexno 

[getMappings]
SELECT 
	bm.*,
	b.name AS barangay,
	b.indexno,
	prior.title AS prioracct_title, 
	priorint.title AS priorintacct_title,
	prev.title AS prevacct_title, 
	prevint.title AS previntacct_title,
	curr.title AS curracct_title, 
	currint.title AS currintacct_title,
	adv.title AS advacct_title, 
	advint.title AS advintacct_title
FROM brgy_taxaccount_mapping bm
	INNER JOIN barangay b ON bm.barangayid = b.objid 
	INNER JOIN revenueitem prior ON bm.prioracct_objid = prior.objid 
	INNER JOIN revenueitem priorint ON bm.priorintacct_objid = priorint.objid 
	INNER JOIN revenueitem prev ON bm.prevacct_objid = prev.objid 
	INNER JOIN revenueitem prevint ON bm.previntacct_objid = prevint.objid 
	INNER JOIN revenueitem curr ON bm.curracct_objid = curr.objid 
	INNER JOIN revenueitem currint ON bm.currintacct_objid = currint.objid 
	INNER JOIN revenueitem adv ON bm.advacct_objid = adv.objid 
	INNER JOIN revenueitem advint ON bm.advintacct_objid = advint.objid 
ORDER BY b.indexno