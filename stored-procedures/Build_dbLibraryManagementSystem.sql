use [master]
go

create procedure [dbo].[build_LibraryMS] --build the Library Management System Database
as
begin
	DECLARE @dbname nvarchar(128)
	SET @dbname = N'LibraryMS'

	IF (NOT EXISTS (SELECT name 
		FROM master.dbo.sysdatabases 
		WHERE ('[' + name + ']' = @dbname 
		OR name = @dbname)))
	create database LibraryMS
	else
	print 'Database ' + @dbname + ' already exists.'

end
go