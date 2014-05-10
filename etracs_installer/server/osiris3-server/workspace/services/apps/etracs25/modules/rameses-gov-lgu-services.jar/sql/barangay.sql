[getList]
SELECT 
	b.objid, b.state, b.indexno, b.pin, b.name, b.oldpin, b.oldindexno, sb.code,
	sp.objid AS parent_objid, sp.name AS parent_name, sp.orgclass AS parent_orgclass,
	CASE WHEN p.objid IS NOT NULL THEN p.objid ELSE c.objid END AS provcity_objid,
	CASE WHEN p.objid IS NOT NULL THEN p.indexno ELSE c.indexno END AS provcity_indexno,
	CASE WHEN p.objid IS NOT NULL THEN p.name ELSE c.name END AS provcity_name,
	CASE WHEN m.objid IS NOT NULL THEN m.objid ELSE d.objid END AS munidistrict_objid,
	CASE WHEN m.objid IS NOT NULL THEN m.indexno ELSE d.indexno END AS munidistrict_indexno,
	CASE WHEN m.objid IS NOT NULL THEN m.name ELSE d.name END AS munidistrict_name
FROM barangay b 
INNER JOIN sys_org sb ON b.objid = sb.objid 
LEFT JOIN sys_org sp ON sb.parent_objid = sp.objid 
LEFT JOIN district d ON sp.objid = d.objid 
LEFT JOIN city c ON sp.parent_objid= c.objid 
LEFT JOIN municipality m ON sp.objid = m.objid 
LEFT JOIN province p ON sp.parent_objid = p.objid 
WHERE b.name LIKE $P{searchtext}
ORDER BY b.name 

[lookup]
SELECT 
	b.*,
	CASE WHEN p.objid IS NOT NULL THEN p.objid ELSE c.objid END AS provcity_objid,
	CASE WHEN p.objid IS NOT NULL THEN p.indexno ELSE c.indexno END AS provcity_indexno,
	CASE WHEN p.objid IS NOT NULL THEN p.name ELSE c.name END AS provcity_name,
	CASE WHEN m.objid IS NOT NULL THEN m.objid ELSE d.objid END AS munidistrict_objid,
	CASE WHEN m.objid IS NOT NULL THEN m.indexno ELSE d.indexno END AS munidistrict_indexno,
	CASE WHEN m.objid IS NOT NULL THEN m.name ELSE d.name END AS munidistrict_name
FROM 
(
	SELECT * FROM barangay b WHERE b.name LIKE $P{searchtext}
	UNION
	SELECT * FROM barangay b WHERE b.parentid =  $P{parentid}
) b
LEFT JOIN district d ON b.parentid = d.objid 
LEFT JOIN city c ON d.parentid = c.objid 
LEFT JOIN municipality m ON b.parentid = m.objid 
LEFT JOIN province p ON m.parentid = p.objid 
ORDER BY b.name 


[changeState]
UPDATE barangay SET 
	state=$P{newstate} 
WHERE 
	objid=$P{objid} AND state=$P{oldstate} 

[search]
SELECT 
	b.*,
	CASE WHEN p.objid IS NOT NULL THEN p.objid ELSE c.objid END AS provcity_objid,
	CASE WHEN p.objid IS NOT NULL THEN p.indexno ELSE c.indexno END AS provcity_indexno,
	CASE WHEN p.objid IS NOT NULL THEN p.name ELSE c.name END AS provcity_name,
	CASE WHEN m.objid IS NOT NULL THEN m.objid ELSE d.objid END AS munidistrict_objid,
	CASE WHEN m.objid IS NOT NULL THEN m.indexno ELSE d.indexno END AS munidistrict_indexno,
	CASE WHEN m.objid IS NOT NULL THEN m.name ELSE d.name END AS munidistrict_name
FROM barangay b
LEFT JOIN district d ON b.parentid = d.objid 
LEFT JOIN city c ON d.parentid = c.objid 
LEFT JOIN municipality m ON b.parentid = m.objid 
LEFT JOIN province p ON m.parentid = p.objid 
ORDER BY b.name 


[findById]
SELECT 
	b.*,
	CASE WHEN p.objid IS NOT NULL THEN p.objid ELSE c.objid END AS provcity_objid,
	CASE WHEN p.objid IS NOT NULL THEN p.indexno ELSE c.indexno END AS provcity_indexno,
	CASE WHEN p.objid IS NOT NULL THEN p.name ELSE c.name END AS provcity_name,
	CASE WHEN m.objid IS NOT NULL THEN m.objid ELSE d.objid END AS munidistrict_objid,
	CASE WHEN m.objid IS NOT NULL THEN m.indexno ELSE d.indexno END AS munidistrict_indexno,
	CASE WHEN m.objid IS NOT NULL THEN m.name ELSE d.name END AS munidistrict_name
FROM barangay b
LEFT JOIN district d ON b.parentid = d.objid 
LEFT JOIN city c ON d.parentid = c.objid 
LEFT JOIN municipality m ON b.parentid = m.objid 
LEFT JOIN province p ON m.parentid = p.objid 
WHERE b.objid = $P{objid}


[getListByParentid]
SELECT 
	b.*,
	CASE WHEN p.objid IS NOT NULL THEN p.objid ELSE c.objid END AS provcity_objid,
	CASE WHEN p.objid IS NOT NULL THEN p.indexno ELSE c.indexno END AS provcity_indexno,
	CASE WHEN p.objid IS NOT NULL THEN p.name ELSE c.name END AS provcity_name,
	CASE WHEN m.objid IS NOT NULL THEN m.objid ELSE d.objid END AS munidistrict_objid,
	CASE WHEN m.objid IS NOT NULL THEN m.indexno ELSE d.indexno END AS munidistrict_indexno,
	CASE WHEN m.objid IS NOT NULL THEN m.name ELSE d.name END AS munidistrict_name
FROM barangay b
LEFT JOIN district d ON b.parentid = d.objid 
LEFT JOIN city c ON d.parentid = c.objid 
LEFT JOIN municipality m ON b.parentid = m.objid 
LEFT JOIN province p ON m.parentid = p.objid 
WHERE b.parentid LIKE $P{parentid}  
ORDER BY b.name 