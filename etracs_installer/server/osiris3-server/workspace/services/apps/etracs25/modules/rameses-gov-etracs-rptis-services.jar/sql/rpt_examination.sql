[findById]
SELECT * FROM examiner_finding WHERE objid = $P{objid}

[insertFinding]
INSERT INTO examiner_finding 
	(objid, findings)
VALUES 	
	($P{objid}, $P{findings})


[updateFinding]	
UPDATE examiner_finding SET findings = $P{findings} WHERE objid = $P{objid }
