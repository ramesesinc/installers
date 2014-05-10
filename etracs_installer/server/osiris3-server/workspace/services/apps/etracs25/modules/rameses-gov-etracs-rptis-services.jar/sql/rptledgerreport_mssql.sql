[getDelinquentLedgers]
SELECT
	t.objid,
	f.tdno,
	r.rputype,
	r.fullpin,
	r.totalareasqm,
	r.totalav,
	b.name AS barangay,
	SUM(t.amtdue) AS amtdue,
	CASE
		WHEN MIN(t.fromyear) = MAX(t.toyear) AND MIN(t.fromqtr) = 1 AND MAX(t.toqtr) = 4 
			THEN 'FULL ' + CONVERT(VARCHAR(4),MAX(t.toyear))
		WHEN MIN(t.fromyear) = MAX(t.toyear) AND MIN(t.fromqtr) = MAX(t.toqtr)
			THEN CONVERT(VARCHAR(1),MAX(t.toqtr)) + 'Q, ' + CONVERT(VARCHAR(4),MAX(t.toyear))
		WHEN MIN(t.fromyear) = MAX(t.toyear) 
			THEN CONVERT(VARCHAR(1),MIN(t.fromqtr)) + CONVERT(VARCHAR(1),MAX(t.toqtr)) + 'Q, ' + CONVERT(VARCHAR(4),MAX(t.toyear))

		WHEN MIN(t.fromqtr) = 1 AND MAX(t.toqtr) = 4
			THEN 'FULL ' + CONVERT(VARCHAR(4),MIN(t.fromyear)) + '-' + CONVERT(VARCHAR(4),MAX(t.toyear))
		WHEN MIN(t.fromqtr) = 1 AND MAX(t.toqtr) <> 4
			THEN CONVERT(VARCHAR(4),MIN(t.fromyear)) + '-' + CONVERT(VARCHAR(1),MAX(t.toqtr)) + 'Q,' + CONVERT(VARCHAR(4),MAX(t.toyear))
		WHEN MIN(t.fromqtr) <> 1 AND MAX(t.toqtr) = 4
			THEN CONVERT(VARCHAR(1),MIN(t.fromqtr)) + 'Q,' + CONVERT(VARCHAR(4),MIN(t.fromyear)) + '-' + CONVERT(VARCHAR(4),MAX(t.toyear))
		ELSE
			CONVERT(VARCHAR(1),MIN(t.fromqtr)) + 'Q,' + CONVERT(VARCHAR(4),MIN(t.fromyear)) + '-' + CONVERT(VARCHAR(1),MAX(t.toqtr)) + 'Q,' + CONVERT(VARCHAR(4),MAX(t.toyear))
	END AS period
FROM faas f
	INNER JOIN rpu r ON f.rpuid = r.objid
	INNER JOIN realproperty rp ON r.realpropertyid = rp.objid
	INNER JOIN barangay b ON rp.barangayid = b.objid,
	(
		SELECT 
			x.*,
			(SELECT MIN(CASE WHEN qtr = 0 THEN fromqtr ELSE qtr END) FROM rptbill_ledger_item WHERE rptledgerid = x.objid AND year = x.fromyear) AS fromqtr,
			(SELECT MAX(CASE WHEN qtr = 0 THEN toqtr ELSE qtr END) FROM rptbill_ledger_item WHERE rptledgerid = x.objid AND year = x.fromyear) AS toqtr
		FROM (
			SELECT
				rl.objid,
				rl.faasid,
				MIN(bi.year) AS  fromyear,
				MAX(bi.year) AS toyear,
				SUM(bi.basic + bi.basicint - bi.basicdisc + bi.sef + bi.sefint - bi.sefdisc + bi.firecode
				) AS amtdue
			FROM rptledger rl
				INNER JOIN rptbill_ledger_item bi ON rl.objid = bi.rptledgerid
				INNER JOIN faas f ON rl.faasid = f.objid 
			WHERE ${filters}
			  AND rl.state = 'APPROVED'
			  AND bi.year <= $P{cy}
			GROUP BY rl.objid, rl.faasid 
		)x	
	) t
WHERE f.objid = t.faasid 
GROUP BY 
	t.objid,
	f.tdno,
	r.rputype,
	r.fullpin,
	r.totalareasqm,
	r.totalav,
	b.name
ORDER BY f.tdno 