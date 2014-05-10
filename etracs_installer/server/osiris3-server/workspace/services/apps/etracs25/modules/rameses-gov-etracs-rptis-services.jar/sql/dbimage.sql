[saveHeader]
INSERT INTO image_header
	(objid, refid, title, filesize, extension)
VALUES	
	($P{objid}, $P{refid}, $P{title}, $P{filesize}, $P{extension})


[deleteHeader]
DELETE FROM image_header WHERE objid = $P{objid}

[deleteAllHeaders]
DELETE FROM image_header WHERE refid = $P{refid}


[getImages]	
SELECT * FROM image_header WHERE refid = $P{refid} ORDER BY title 



[saveItem]
INSERT INTO image_chunk
	(objid, parentid, fileno, byte)
VALUES
	($P{objid}, $P{parentid}, $P{fileno}, $P{byte})	

[getItems]	
SELECT * FROM image_chunk WHERE parentid = $P{objid} ORDER BY fileno

[deleteItems]
DELETE FROM image_chunk WHERE parentid = $P{objid}

[deleteAllItems]
DELETE FROM image_chunk 
WHERE parentid IN (
	SELECT objid FROM image_header WHERE refid = $P{refid} 
)