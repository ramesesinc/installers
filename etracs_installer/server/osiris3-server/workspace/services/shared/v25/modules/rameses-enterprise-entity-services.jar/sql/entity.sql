[getList]
SELECT 
	e.objid, e.entityno, e.name, e.address_text, e.type, 
	a.type AS address_type, a.address1 AS address_address1, a.address2 AS address_address2, 
	a.barangay_objid AS address_barangay_objid, a.barangay_name AS address_barangay_name, 
	a.city AS address_city, a.municipality AS address_municipality, a.province AS address_province 
FROM entity e 
	LEFT JOIN entity_address a ON e.address_objid=a.objid 
WHERE e.entityname LIKE $P{searchtext}  
ORDER BY e.entityname 

[getLookup]
SELECT 
	e.objid, e.entityno, e.name, e.address_text, e.type, 
	a.type AS address_type, a.address1 AS address_address1, a.address2 AS address_address2, 
	a.barangay_objid AS address_barangay_objid, a.barangay_name AS address_barangay_name, 
	a.city AS address_city, a.municipality AS address_municipality, a.province AS address_province 
FROM entity e 
	LEFT JOIN entity_address a ON e.address_objid=a.objid 
WHERE e.entityname LIKE $P{searchtext} 
 ${filter} 
ORDER BY e.entityname 
