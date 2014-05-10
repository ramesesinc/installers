[getList]
SELECT * FROM sys_notification_user WHERE recipientid=$P{recipientid} ORDER BY dtfiled 

[findByPrimary]
SELECT * FROM sys_notification_user WHERE objid=$P{objid} 

[findByNotificationid]
SELECT * FROM sys_notification_user WHERE notificationid=$P{notificationid} 
