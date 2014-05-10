[getBarangayList]
SELECT objid, name FROM barangay ORDER BY pin 


[getOpenLedgersByBarangay]
SELECT 
	rl.objid, rl.barangayid, f.tdno
FROM rptledger rl
	INNER JOIN faas f ON rl.faasid = f.objid 
WHERE barangayid = $P{barangayid}
  AND f.state = 'CURRENT'
  AND rl.state = 'APPROVED'
  AND (rl.lastyearpaid < $P{cy}  OR (rl.lastyearpaid = $P{cy} AND lastqtrpaid < 4))
  

[cleanup]
DELETE FROM report_rptdelinquency



[getDelinquentLedgers]
SELECT
	CONVERT(VARCHAR(3000),f.taxpayer_name) AS taxpayername,
	f.taxpayer_address AS taxpayeraddress,
	r.fullpin AS pin,
	f.tdno,
	pc.code AS classcode,
	r.rputype,
	b.name AS barangay,
	rl.lastyearpaid,
	rl.lastqtrpaid,
	b.objid,
	rr.*
FROM (
		SELECT 
			rptledgerid,
			dtgenerated,
			SUM(basic - basicdisc + basicint) AS basicnet,
			SUM(sef - sefdisc + sefint) AS sefnet,
			SUM(basic - basicdisc + basicint  + sef - sefdisc + sefint ) AS total
		FROM report_rptdelinquency rr
		WHERE barangayid = $P{objid}
		GROUP BY rptledgerid, dtgenerated 
	)rr
	INNER JOIN rptledger rl ON rr.rptledgerid = rl.objid 
	INNER JOIN faas f ON rl.faasid = f.objid 
	INNER JOIN rpu r ON f.rpuid = r.objid 
	INNER JOIN propertyclassification pc ON r.classification_objid = pc.objid
	INNER JOIN barangay b ON rl.barangayid = b.objid
ORDER BY r.fullpin 



