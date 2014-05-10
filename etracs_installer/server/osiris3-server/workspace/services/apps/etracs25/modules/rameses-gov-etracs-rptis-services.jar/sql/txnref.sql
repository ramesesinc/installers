[insert]
INSERT INTO txnref (objid, refid, msg)
VALUES ($P{objid}, $P{refid}, $P{msg})


[delete]
DELETE FROM txnref WHERE refid = $P{refid}


[getByObjId]
SELECT * FROM txnref WHERE objid = $P{objid}

[getTxnRefByRefId]
SELECT * FROM txnref WHERE refid = $P{refid}