[getList]
SELECT * FROM sys_notification_group WHERE groupid=$P{groupid} ORDER BY dtfiled 

[findByPrimary]
SELECT * FROM sys_notification_group WHERE objid=$P{objid} 

[findByNotificationid]
SELECT * FROM sys_notification_group WHERE notificationid=$P{notificationid} 

