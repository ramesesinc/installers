[getStructures]
SELECT 
  bs.*,
  s.code AS structure_code,
  s.name AS structure_name,
  m.code AS material_code,
  m.name AS material_name 
FROM bldgstructure bs 
  LEFT JOIN structure s ON bs.structure_objid = s.objid 
  LEFT JOIN material m ON bs.material_objid = m.objid 
WHERE bs.bldgrpuid = $P{objid}  

[getBldgUses]
SELECT 
  bu.*,
  bal.code AS  actualuse_code,
  bal.name AS actualuse_name
FROM bldguse bu
  INNER JOIN bldgassesslevel bal ON bu.actualuse_objid = bal.objid 
WHERE bu.bldgrpuid = $P{bldgrpuid}


[getFloors]
SELECT * FROM bldgfloor WHERE bldguseid = $P{bldguseid}  ORDER BY floorno 

[getAdditionalItems]
SELECT bfa.*,
  bi.code AS additionalitem_code,
  bi.name AS additionalitem_name,
  bi.expr AS additionalitem_expr,
  bi.unit AS additionalitem_unit
FROM bldgflooradditional bfa 
  INNER JOIN bldgadditionalitem bi ON bfa.additionalitem_objid = bi.objid 
WHERE bfa.bldgfloorid = $P{bldgfloorid}


[getAdditionalItemParams]
SELECT a.*,
  p.name AS param_name,
  p.caption AS param_caption,
  p.paramtype AS param_type,
  p.maxvalue AS param_maxvalue,
  p.minvalue AS param_minvalue
FROM bldgflooradditionalparam a
  INNER JOIN rptparameter p ON a.param_objid = p.objid 
WHERE a.bldgflooradditionalid = $P{bldgflooradditionalid}




[deleteAllParams]
DELETE FROM bldgflooradditionalparam WHERE bldgrpuid = $P{objid}

[deleteAllFloorAdditionals]
DELETE FROM bldgflooradditional WHERE bldgrpuid = $P{objid}

[deleteAllFloors]
DELETE FROM bldgfloor WHERE bldgrpuid = $P{objid}

[deleteAllUses]
DELETE FROM bldguse WHERE bldgrpuid = $P{objid}

[deleteAllStructures]
DELETE FROM bldgstructure WHERE bldgrpuid = $P{objid}