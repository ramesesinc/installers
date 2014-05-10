[getList]
SELECT 
	f.*,
	rpu.rputype,
	rpu.ry,
	rpu.fullpin ,
	rpu.taxable,
	rpu.totalareaha,
	rpu.totalareasqm,
	rpu.totalbmv,
	rpu.totalmv,
	rpu.totalav,
	rp.section,
	rp.parcel,
	rp.surveyno,
	rp.cadastrallotno,
	rp.blockno,
	rp.claimno,
	b.name AS barangay_name,
	pc.code AS classification_code,
	t.trackingno
FROM faas f
	LEFT JOIN rpu rpu ON f.rpuid = rpu.objid
	LEFT  JOIN realproperty rp ON f.realpropertyid = rp.objid
	LEFT JOIN barangay b ON rp.barangayid = b.objid 
	LEFT JOIN propertyclassification pc ON rpu.classification_objid = pc.objid 
	LEFT JOIN rpttracking t ON f.objid = t.objid 
WHERE 1=1
${filters}


[findById]
SELECT  
	f.*,
	rpu.rputype AS rpu_rputype,
	rpu.ry AS rpu_ry,
	rpu.objid AS rpu_objid, 
	rpu.suffix AS rpu_suffix, 
	rpu.fullpin AS rpu_fullpin,
	rpu.taxable AS rpu_taxable,
	rpu.totalmv AS rpu_totalmv,
	rpu.totalav AS rpu_totalav,
	rpu.reclassed AS rpu_reclassed,
	rpu.realpropertyid AS rpu_realpropertyid,
	pc.objid AS rpu_classification_objid,
	pc.code AS rpu_classification_code,
	rp.objid AS rp_objid,
	rp.ry AS rp_ry,
	rp.pin AS rp_pin,
	rp.surveyno AS rp_surveyno,
	rp.cadastrallotno AS rp_cadastrallotno,
	rp.blockno AS rp_blockno,
	rp.purok AS rp_purok,
	rp.street AS rp_street,
	rp.north AS rp_north,
	rp.south AS rp_south,
	rp.east AS rp_east,
	rp.west AS rp_west,
	b.name AS rp_barangay_name,
	b.objid AS rp_barangay_objid,
	b.parentid AS rp_barangay_parentid,
	t.trackingno,
	CASE WHEN task.taskid IS NULL THEN null ELSE task.action END AS taskaction,
	CASE WHEN task.taskid IS NULL THEN null ELSE task.msg END AS taskmsg
FROM faas f
	LEFT JOIN rpu rpu ON f.rpuid = rpu.objid
	LEFT JOIN propertyclassification pc ON rpu.classification_objid = pc.objid 
	INNER  JOIN realproperty rp ON f.realpropertyid = rp.objid
	INNER JOIN barangay b ON rp.barangayid = b.objid 
	LEFT JOIN rpttracking t ON f.objid = t.objid 
	LEFT JOIN rpttask task ON f.objid = task.objid AND task.enddate IS NULL 
WHERE f.objid = $P{objid}



[findByTdNo]
SELECT  
	f.*,
	rpu.rputype AS rpu_rputype,
	rpu.ry AS rpu_ry,
	rpu.objid AS rpu_objid, 
	rpu.suffix AS rpu_suffix, 
	rpu.fullpin AS rpu_fullpin,
	rpu.taxable AS rpu_taxable,
	rpu.totalmv AS rpu_totalmv,
	rpu.totalav AS rpu_totalav,
	rpu.reclassed AS rpu_reclassed,
	rpu.realpropertyid AS rpu_realpropertyid,
	pc.objid AS rpu_classification_objid,
	pc.code AS rpu_classification_code,
	rp.objid AS rp_objid,
	rp.pin AS rp_pin,
	rp.surveyno AS rp_surveyno,
	rp.cadastrallotno AS rp_cadastrallotno,
	rp.blockno AS rp_blockno,
	rp.purok AS rp_purok,
	rp.street AS rp_street,
	rp.north AS rp_north,
	rp.south AS rp_south,
	rp.east AS rp_east,
	rp.west AS rp_west,
	b.name AS rp_barangay_name,
	b.objid AS rp_barangay_objid,
	b.parentid AS rp_barangay_parentid
FROM faas f
	INNER JOIN rpu rpu ON f.rpuid = rpu.objid
	INNER JOIN propertyclassification pc ON rpu.classification_objid = pc.objid 
	INNER  JOIN realproperty rp ON f.realpropertyid = rp.objid
	INNER JOIN barangay b ON rp.barangayid = b.objid 
WHERE f.objid = $P{objid}


[getFaasIds]
select
  f.objid, f.tdno
from faas f  
  inner join rpu r on r.objid = f.rpuid 
  inner join realproperty rp on rp.objid = r.realpropertyid 
where f.state like $P{state}
	and r.ry = $P{revisionyear} 
	and rp.barangayid = $P{barangayid}
	and rp.section like $P{section} 
order by r.fullpin 


[getPreviousFaases]
SELECT pf.*, f.rpuid AS prevrpuid
FROM previousfaas pf
INNER JOIN faas f ON pf.prevfaasid = f.objid 
WHERE faasid = $P{faasid}


[getBackTaxes]
SELECT * FROM faasbacktax WHERE faasid = $P{faasid} ORDER BY effectivityyear DESC 


[cancelFaas]
UPDATE faas SET 
	state = 'CANCELLED',
	cancelreason = $P{cancelreason},
	canceldate   = $P{canceldate},
	cancelledbytdnos = CONCAT(CASE WHEN cancelledbytdnos IS NULL OR LENGTH(TRIM(cancelledbytdnos)) = 0 THEN '' ELSE cancelledbytdnos END, ', ', $P{cancelledbytdnos}),
	cancelledtimestamp = $P{cancelledtimestamp}
WHERE objid = $P{objid}


[cancelRpu]
UPDATE rpu SET state = 'CANCELLED' WHERE objid = $P{objid}




#---------------------------------------------------------
#
#  LOOKUP SUPPORT
#
#---------------------------------------------------------
[lookupFaas]
SELECT 
	f.*,
	pc.code AS classification_code, 
	pc.code AS classcode, 
	pc.name AS classification_name, 
	pc.name AS classname, 
	r.ry, r.realpropertyid, r.rputype, r.fullpin, r.totalmv, r.totalav,
	r.totalareasqm, r.totalareaha,
	rp.barangayid, rp.cadastrallotno, rp.blockno, rp.surveyno,
	b.name AS barangay_name,
	t.trackingno
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid 
	INNER JOIN barangay b ON rp.barangayid = b.objid 
	LEFT JOIN rpttracking t ON f.objid = t.objid 
where 1=1 ${filters}	
ORDER BY f.tdno 


[getLandImprovementIds]
SELECT fi.objid 
FROM faas fl 
	INNER JOIN rpu lr ON fl.rpuid = lr.objid 
	INNER JOIN rpu ri ON lr.realpropertyid = ri.realpropertyid
	INNER JOIN faas fi ON ri.objid = fi.rpuid 
WHERE fl.objid = $P{landfaasid}
  AND ri.rputype <> 'land' 
  AND fi.state = 'CURRENT'


[findLguIndexInfo]  
SELECT
	b.indexno as barangayindex,
	case when c.objid is not null then c.indexno else p.indexno end as provcityindex,
	case when d.objid is not null then d.indexno else m.indexno end as munidistrictindex
FROM barangay b
	left join district d on b.parentid = d.objid
	left join city c on d.parentid = c.objid 
	left join municipality m on b.parentid = m.objid 
	left join province p on m.parentid = p.objid 
where b.objid = $P{barangayid}	



[updateFaasState]
UPDATE faas SET state = $P{state} WHERE objid = $P{objid} 

[submitForApproval]
UPDATE faas SET state = $P{state} WHERE objid = $P{objid}

[approveFaas]
UPDATE faas SET 
	state = $P{state}, utdno = $P{utdno}, tdno = $P{tdno}, dtapproved = $P{dtapproved} 
WHERE objid = $P{objid}  
  AND state IN ('FORAPPROVAL', 'PENDING', 'INTERIM')


[updateRpuMasterInfo]
UPDATE faas f, rpu r, rpumaster rm SET 
	rm.currentfaasid = f.objid,
	rm.currentrpuid = f.rpuid 
WHERE f.objid = $P{objid}
  AND f.rpuid = r.objid 
  AND r.rpumasterid = rm.objid 
  


[findRealProperty]
SELECT rp.*, f.objid AS faasid, f.tdno
FROM realproperty rp 
	LEFT JOIN faas f ON rp.objid = f.realpropertyid 
WHERE rp.pin = $P{pin} 
  AND rp.ry = $P{ry}

[findRpu]  
SELECT r.*, f.objid AS faasid, f.tdno
FROM rpu r
	LEFT JOIN faas f ON r.objid = f.rpuid
WHERE r.fullpin = $P{fullpin} 
  AND r.ry = $P{ry}
  AND r.rputype = $P{rputype}

[getLandReference]
select
	r.fullpin, r.totalareasqm, f.owner_name, f.tdno, rp.cadastrallotno 
 from rpu r 
	inner join faas f on f.rpuid = r.objid 
	inner join realproperty rp on rp.objid = r.realpropertyid 
where r.objid=$P{landrpuid} and r.rputype ='land'


[findState]   
SELECT state FROM faas WHERE objid = $P{objid}



[findOpenRealProperty]
SELECT rp.objid 
FROM realproperty rp
	LEFT JOIN faas f ON rp.objid = f.realpropertyid
WHERE rp.pin = $P{pin}
  AND rp.state NOT IN ('CURRENT', 'CANCELLED')
  AND rp.claimno = $P{claimno}
  AND f.objid IS NULL


[findOpenRpu]
SELECT rpu.objid 
FROM rpu rpu
	LEFT JOIN faas f ON rpu.objid = f.rpuid
WHERE rpu.realpropertyid = $P{realpropertyid}
  AND rpu.state NOT IN ('CURRENT', 'CANCELLED')
  AND rpu.rputype = $P{rputype}
  AND f.objid IS NULL



[getHistory]
SELECT 
	f.*,
	prpu.rputype,
	prpu.ry,
	prpu.fullpin ,
	prpu.taxable,
	prpu.totalareaha,
	prpu.totalareasqm,
	prpu.totalbmv,
	prpu.totalmv,
	prpu.totalav,
	rp.section,
	rp.parcel,
	rp.surveyno,
	rp.cadastrallotno,
	rp.blockno,
	rp.claimno,
	b.name AS barangay_name,
	pc.code AS classification_code
FROM faas cf
	INNER JOIN rpu rpu ON cf.rpuid = rpu.objid
	INNER JOIN rpu prpu ON rpu.rpumasterid = prpu.rpumasterid
	INNER JOIN faas f ON prpu.objid = f.rpuid 
	INNER JOIN realproperty rp ON f.realpropertyid = rp.objid
	INNER JOIN barangay b ON rp.barangayid = b.objid 
	INNER JOIN propertyclassification pc ON rpu.classification_objid = pc.objid 
WHERE cf.objid = $P{faasid}
  AND IFNULL(cf.tdno,'') <> f.tdno 
ORDER BY f.tdno DESC 


[getTxnTypes]
SELECT * FROM faas_txntype