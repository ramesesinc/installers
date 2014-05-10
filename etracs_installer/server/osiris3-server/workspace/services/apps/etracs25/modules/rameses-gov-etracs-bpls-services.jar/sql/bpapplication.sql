[getList]
SELECT DISTINCT b.*  
FROM 
(
	SELECT ba.objid,ba.owner_name,ba.businessname,ba.businessaddress_text,ba.appyear,b.bin,
	ba.appno, ba.apptype, bt.state AS appstate, ba.dtfiled AS appdate,
    bp.permitno, bp.expirydate, bt.assignee_objid, bt.assignee_name, bt.startdate, ba.state 
	FROM bpapplication ba 
	INNER JOIN business b ON b.objid=ba.businessid
    LEFT JOIN bpapplication_task bt ON bt.objid=ba.task_objid
    LEFT JOIN businesspermit bp ON bp.businessid=b.objid
	WHERE ba.owner_name LIKE $P{searchtext} 
UNION 
	SELECT ba.objid,ba.owner_name,ba.businessname,ba.businessaddress_text,ba.appyear,b.bin,
	ba.appno, ba.apptype, bt.state AS appstate, ba.dtfiled AS appdate,
    bp.permitno, bp.expirydate, bt.assignee_objid, bt.assignee_name, bt.startdate, ba.state 
	FROM bpapplication ba 
	INNER JOIN business b ON b.objid=ba.businessid
    LEFT JOIN bpapplication_task bt ON bt.objid=ba.task_objid
    LEFT JOIN businesspermit bp ON bp.businessid=b.objid
    WHERE ba.businessname LIKE $P{searchtext}
UNION
	SELECT ba.objid,ba.owner_name,ba.businessname,ba.businessaddress_text,ba.appyear,b.bin,
	ba.appno, ba.apptype, bt.state AS appstate, ba.dtfiled AS appdate,
    bp.permitno, bp.expirydate, bt.assignee_objid, bt.assignee_name, bt.startdate, ba.state 
	FROM bpapplication ba 
	INNER JOIN business b ON b.objid=ba.businessid
    LEFT JOIN bpapplication_task bt ON bt.objid=ba.task_objid
    LEFT JOIN businesspermit bp ON bp.businessid=b.objid
	WHERE b.bin LIKE $P{searchtext}
) b
WHERE NOT(b.objid IS NULL)
${filter}
ORDER BY b.startdate

[getOpenTaskList]
SELECT DISTINCT b.*  
FROM 
(
	SELECT ba.objid,ba.owner_name,ba.businessname,ba.businessaddress_text,ba.appyear,xb.bin,
	ba.appno, ba.apptype, bt.state AS appstate, ba.dtfiled AS appdate,
    bt.assignee_objid, bt.assignee_name, bt.startdate, bt.message 
    FROM bpapplication ba
    INNER JOIN business xb ON ba.objid=xb.currentapplicationid
    INNER JOIN bpapplication_task bt ON bt.applicationid=ba.objid
    WHERE ba.owner_name LIKE $P{searchtext} AND bt.enddate IS NULL AND NOT(ba.state = 'CANCELLED')
UNION 
	SELECT ba.objid,ba.owner_name,ba.businessname,ba.businessaddress_text,ba.appyear,xb.bin,
	ba.appno, ba.apptype, bt.state AS appstate, ba.dtfiled AS appdate,
    bt.assignee_objid, bt.assignee_name, bt.startdate, bt.message 
    FROM bpapplication ba
    INNER JOIN business xb ON ba.objid=xb.currentapplicationid
    INNER JOIN bpapplication_task bt ON bt.applicationid=ba.objid
    WHERE ba.businessname LIKE $P{searchtext}  AND bt.enddate IS NULL AND NOT(ba.state = 'CANCELLED')
UNION
	SELECT ba.objid,ba.owner_name,ba.businessname,ba.businessaddress_text,ba.appyear,xb.bin,
	ba.appno, ba.apptype, bt.state AS appstate, ba.dtfiled AS appdate,
    bt.assignee_objid, bt.assignee_name, bt.startdate, bt.message 
    FROM bpapplication ba
    INNER JOIN business xb ON ba.objid=xb.currentapplicationid
    INNER JOIN bpapplication_task bt ON bt.applicationid=ba.objid
    WHERE xb.bin LIKE $P{searchtext}  AND bt.enddate IS NULL AND NOT(ba.state = 'CANCELLED')
) b
WHERE NOT(b.objid IS NULL)
${filter}
ORDER BY b.startdate

#######################################
# find By BIN
#######################################
[findByBIN]
SELECT currentapplicationid AS objid FROM business WHERE bin=$P{bin}

[findByApp]
SELECT objid FROM bpapplication WHERE appno=$P{appno}

[findBIN]
SELECT bin FROM business WHERE objid=$P{businessid}

#######################################
# used for retrieving the application
#######################################
[getTaxfees]
SELECT br.*, r.code AS account_code, br.taxfeetype AS account_taxfeetype 
FROM bpreceivable br 
INNER JOIN revenueitem r ON  r.objid=br.account_objid 
WHERE br.applicationid=$P{objid} 

[getRequirements]
SELECT bpr.*, br.type, bd.*  
FROM bpapplication_requirement bpr
INNER JOIN businessrequirement br ON bpr.refid=br.objid
LEFT JOIN  bpapplication_requirement_data bd ON bd.objid=br.objid
WHERE bpr.applicationid=$P{objid}

[getDocRequirements]
SELECT * 
FROM bpapplication_requirement_data b
WHERE b.objid=$P{objid}

#######################################
# workflow
#######################################
[getOpenSubTasks]
SELECT * FROM bpapplication_task
WHERE parentid=$P{taskid} AND enddate IS NULL

[updateTask]
UPDATE bpapplication SET task_objid=$P{taskid} WHERE objid=$P{objid}

[findCurrentStatus]
SELECT state FROM bpapplication WHERE objid=$P{objid}

[findAssessedBy]
SELECT u.lastname, u.firstname, u.jobtitle, u.objid   
FROM bpapplication ba 
LEFT JOIN sys_user u ON u.objid=ba.assessedby_objid
WHERE ba.objid=$P{objid} 

[findApprovedBy]
SELECT approvedby_name FROM bpapplication WHERE objid=$P{objid} 

[updateAssessedBy]
UPDATE bpapplication SET 
assessedby_objid=$P{userid}, assessedby_name=$P{username}
WHERE objid=$P{objid} 

[updateApprovedBy]
UPDATE bpapplication SET 
approvedby_objid=$P{userid}, approvedby_name=$P{username}
WHERE objid=$P{objid} 

[getApproverList]
SELECT  u.objid, u.name, ug.role, ug.domain
FROM sys_usergroup_member sgm
INNER JOIN sys_user u ON u.objid=sgm.user_objid
INNER JOIN sys_usergroup ug ON ug.objid=sgm.usergroup_objid
WHERE ug.domain='BPLS' AND ug.role='APPROVER' 
ORDER BY u.name

[findCurrentTaskid]
SELECT task_objid AS taskid FROM bpapplication WHERE objid=$P{objid}

[closeCurrentTask]
UPDATE bpapplication SET task_objid = NULL, dtreleased=$P{dtreleased} 
WHERE objid=$P{objid}

[changeState]
UPDATE bpapplication SET state = $P{state} WHERE objid = $P{objid}

[getTaskList]
SELECT * FROM bpapplication_task WHERE applicationid=$P{objid} ORDER BY startdate ASC

[findApplicationPermit]
SELECT * FROM businesspermit WHERE applicationid=$P{objid} AND state='ACTIVE'