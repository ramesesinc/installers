[getList]
SELECT *
FROM assessmentnotice
where 1=1 ${filters}
ORDER BY txnno DESC 


[getItems]
SELECT 
	ni.*,
	f.effectivityyear,
	f.effectivityqtr, 
	f.tdno,
	ts.dtsigned , 
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
	b.name AS barangay,
	pc.code AS classcode
FROM assessmentnoticeitem ni 
	INNER JOIN faas f ON ni.faasid = f.objid 
	LEFT JOIN txnsignatory ts on ts.refid = f.objid and ts.type='APPROVER'
	INNER JOIN rpu rpu ON f.rpuid = rpu.objid
	INNER JOIN propertyclassification pc ON rpu.classification_objid = pc.objid
	LEFT JOIN realproperty rp ON f.realpropertyid = rp.objid
	LEFT JOIN barangay b ON rp.barangayid = b.objid 
WHERE ni.assessmentnoticeid = $P{assessmentnoticeid}

[getApprovedFaasList]
SELECT 
	f.objid AS faasid,
	f.effectivityyear,
	f.effectivityqtr,
	f.tdno,
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
	b.name AS barangay,
	pc.code AS classcode
FROM faas f 
	INNER JOIN rpu rpu ON f.rpuid = rpu.objid
	INNER JOIN propertyclassification pc ON rpu.classification_objid = pc.objid
	LEFT JOIN realproperty rp ON f.realpropertyid = rp.objid
	LEFT JOIN barangay b ON rp.barangayid = b.objid 
WHERE f.taxpayer_objid = $P{taxpayerid}
  AND f.state = 'CURRENT'


[getFaasById]
SELECT 
	f.objid AS faasid,
	f.effectivityyear,
	f.effectivityqtr,
	f.tdno,
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
	b.name AS barangay,
	pc.code AS classcode
FROM faas f 
	INNER JOIN rpu rpu ON f.rpuid = rpu.objid
	INNER JOIN propertyclassification pc ON rpu.classification_objid = pc.objid
	LEFT JOIN realproperty rp ON f.realpropertyid = rp.objid
	LEFT JOIN barangay b ON rp.barangayid = b.objid 
WHERE f.objid = $P{faasid}
  AND f.state = 'CURRENT'

[getTaxpayerList]  
select distinct f.taxpayer_objid as objid,
	 f.taxpayer_name as name, 
	f.taxpayer_address as address 
from faas f 
 inner join rpu r on f.rpuid = r.objid 
 inner join realproperty rp on rp.objid = r.realpropertyid 
where f.state='CURRENT' 
	and r.ry=$P{revisionyear}
	and rp.barangayid like $P{barangayid}
	and rp.section like $P{section}  

[getTaxpayerPropertyListForBatch]  
select f.objid 
from faas f 
 inner join rpu r on f.rpuid = r.objid 
 inner join realproperty rp on rp.objid = r.realpropertyid 
where f.state='CURRENT' 
	and r.ry=$P{revisionyear}
	and rp.barangayid like $P{barangayid}
	and rp.section like $P{section}