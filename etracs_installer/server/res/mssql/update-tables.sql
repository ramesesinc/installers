USE [@dbname]
GO

UPDATE sys_var SET value='@lgupin' WHERE name='lgu_objid'
UPDATE sys_var SET value='@lgutype' WHERE name='lgu_type'
UPDATE sys_var SET value='@lguname' WHERE name='lgu_name'
go



if ( (select convert(varchar(50),value) from sys_var where name='lgu_type') = 'city' )
begin

	DELETE FROM barangay
	DELETE FROM district
	DELETE FROM city
	DELETE FROM sys_org

	INSERT [dbo].[sys_orgclass] ([name], [title], [parentclass], [handler]) VALUES (N'BARANGAY', N'Barangay', N'DISTRICT', 'barangay')
	INSERT [dbo].[sys_orgclass] ([name], [title], [parentclass], [handler]) VALUES (N'CITY', N'City', NULL, NULL)
	INSERT [dbo].[sys_orgclass] ([name], [title], [parentclass], [handler]) VALUES (N'DISTRICT', N'District', NULL, NULL)
	INSERT [dbo].[sys_orgclass] ([name], [title], [parentclass], [handler]) VALUES (N'HOSPITAL', N'Hospital', NULL, NULL)
	INSERT [dbo].[sys_orgclass] ([name], [title], [parentclass], [handler]) VALUES (N'WATERWORKS', N'Water works', NULL, NULL)


	INSERT [dbo].[city] ([objid], [state], [indexno], [pin], [name]) 
	VALUES (N'@lgupin', N'DRAFT', N'@lguindexno', N'@lgupin', N'@lguname');

	INSERT [dbo].[sys_org] ([objid], [name], [orgclass], [parent_objid], [parent_orgclass], [code], [root]) 
	VALUES (N'@lgupin', N'@lguname', N'@lgutype', NULL, NULL, N'@lgupin', 1);
end 

if ( (select convert(varchar(50),value) from sys_var where name='lgu_type') = 'municipality' )
begin
	DELETE FROM barangay;
	DELETE FROM province;
	DELETE FROM municipality;
	DELETE FROM sys_org;

	INSERT [dbo].[sys_orgclass] ([name], [title], [parentclass], [handler]) 
	VALUES (N'BARANGAY', N'Barangay', N'MUNICIPALITY', 'barangay');

	INSERT [dbo].[sys_orgclass] ([name], [title], [parentclass], [handler]) 
	VALUES (N'MUNICIPALITY', N'Municipality', NULL, NULL);

	INSERT [dbo].[sys_orgclass] ([name], [title], [parentclass], [handler]) 
	VALUES (N'WATERWORKS', N'Water works', NULL, NULL);

	INSERT [dbo].[sys_org] ([objid], [name], [orgclass], [parent_objid], [parent_orgclass], [code], [root]) 
	VALUES (N'@lgupin', N'@provincename', N'PROVINCE', NULL, NULL, N'', 0);

	INSERT [dbo].[province] ([objid], [state], [indexno], [pin], [name]) 
	VALUES (N'@lgupin', N'DRAFT', N'@provinceindexno', N'@provincepin', N'@provincename');


	INSERT [dbo].[municipality] ([objid], [state], [indexno], [pin], [name],[parentid]) 
	VALUES (N'@lgupin', N'DRAFT', N'@lguindexno', N'@lgupin', N'@lguname', N'@provincepin');

	INSERT [dbo].[sys_org] ([objid], [name], [orgclass], [parent_objid], [parent_orgclass], [code], [root]) 
	VALUES (N'@lgupin', N'@lguname', N'MUNICIPALITY', N'@provincepin', N'PROVINCE', N'@lgupin', 1);
end 