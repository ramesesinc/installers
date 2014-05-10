[getMiscRpuItems]
SELECT
  mri.*,
  miv.expr AS miv_expr,
  mi.code AS miscitem_code,
  mi.name AS miscitem_name
FROM miscrpuitem mri
  INNER JOIN miscitemvalue miv ON mri.miv_objid = miv.objid 
  INNER JOIN miscitem mi ON mri.miscitem_objid = mi.objid 
WHERE mri.miscrpuid = $P{objid} 


[getMiscRpuItemParams]
SELECT
  mr.*,
  p.name AS param_name,
  p.caption AS param_caption,
  p.paramtype AS param_type,
  p.maxvalue AS param_maxvalue,
  p.minvalue AS param_minvalue
FROM miscrpuitem_rptparameter mr
  INNER JOIN rptparameter p ON mr.param_objid = p.objid
WHERE mr.miscrpuitemid = $P{miscrpuitemid}


[deleteAllMiscRpuItems]
DELETE FROM miscrpuitem WHERE miscrpuid = $P{objid}


[deleteAllParams]
DELETE FROM miscrpuitem_rptparameter WHERE miscrpuid =  $P{objid}



