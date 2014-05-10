[getList]
SELECT r.*, 'POSTED' AS state FROM remoteserverdata  r ORDER BY r.objid 
 
[getCollectionTypes]
SELECT * FROM collectiontype ORDER BY formno, name 


[getUserMemberships]
SELECT * FROM sys_usergroup_member WHERE user_objid = $P{userid}

[getUserCashBooks]
SELECT * FROM cashbook WHERE subacct_objid = $P{userid}

[getFunds]
SELECT * FROM fund


[insertUserMembership]
INSERT INTO sys_usergroup_member(
   objid
  ,state
  ,usergroupid
  ,user_objid
  ,user_username
  ,user_firstname
  ,user_lastname
  ,org_objid
  ,org_name
  ,org_orgclass
  ,securitygroupid
  ,exclude
  ,displayname
  ,jobtitle
  ,usertxncode)
VALUES (
   $P{objid}
  ,$P{state}
  ,$P{usergroupid}
  ,$P{user_objid}
  ,$P{user_username}
  ,$P{user_firstname}
  ,$P{user_lastname}
  ,$P{org_objid}
  ,$P{org_name}
  ,$P{org_orgclass}
  ,$P{securitygroupid}
  ,$P{exclude}
  ,$P{displayname}
  ,$P{jobtitle}
  ,$P{usertxncode}
)


[insertFund]
INSERT INTO fund(
   objid
  ,parentid
  ,state
  ,code
  ,title
  ,type
  ,special
)
VALUES (
  $P{objid}
  ,$P{parentid}
  ,$P{state}
  ,$P{code}
  ,$P{title}
  ,$P{type}
  ,$P{special}
)
