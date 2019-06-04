use LibraryMS
go

create procedure uspCreateTables_LibraryMS
as
begin
	------------------- Create Table Library_Branch ----------------------
	IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_NAME = 'Library_Branch'))
	create table Library_Branch (
		BranchID int primary key not null identity(1,1),
		BranchName varchar(120) not null,
		[Address] varchar(160) not null
	)
	else
	print 'Table Library_Branch already exists.'

	------------------- Create Table Publisher ----------------------
	IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_NAME = 'Publisher'))
	create table Publisher (
		PublisherName varchar(120) primary key not null,
		[Address] varchar(160) not null,
		Phone varchar(120) not null
	)
	else
	print 'Table Publisher already exists.'

	------------------- Create Table Books ----------------------
	IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_NAME = 'Books'))
	create table Books (
		BookID int primary key not null identity(1,1),
		Title varchar(120) not null,
		PublisherName varchar(120)
	)
	else
	print 'Table Books already exists.'

	------------------- Create Table Book_Authors ----------------------
	IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_NAME = 'Book_Authors'))
	create table Book_Authors (
		BookID int,
		AuthorName varchar(120)
	)
	else
	print 'Table Book_Authors already exists.'

	------------------- Create Table Book_Copies ----------------------
	IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_NAME = 'Book_Copies'))
	create table Book_Copies (
		BookID int,
		BranchID int,
		Number_Of_Copies int
	)
	else
	print 'Table Book_Copies already exists.'

	------------------- Create Table Book_Loans ----------------------
	IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_NAME = 'Book_Loans'))
	create table Book_Loans (
		BookID int,
		BranchID int,
		CardID int,
		DateOut date,
		DateDue date
	)
	else
	print 'Table Book_Loans already exists.'

	------------------- Create Table Borrowers ----------------------
	IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_NAME = 'Borrowers'))
	create table Borrowers (
		CardID int primary key not null identity(1,1),
		Name varchar(120),
		[Address] varchar(160),
		Phone varchar(120)
	)
	else
	print 'Table Borrowers already exists.'

	----------------- Add Foriegn Keys ------------------------
	alter table Books
		add constraint fk_Books_PublisherName foreign key (PublisherName)
		references Publisher (PublisherName)
		on delete cascade
		on update cascade

	alter table Book_Authors
		add constraint fk_BookAuthors_BookID foreign key (BookID)
		references Books (BookID)
		on delete cascade
		on update cascade

	alter table Book_Copies
		add constraint fk_BookCopies_BookID foreign key (BookID)
		references Books (BookID)
		on delete cascade
		on update cascade,
		constraint fk__BookCopies_BranchID foreign key (BranchID)
		references Library_Branch (BranchID)
		on delete cascade
		on update cascade

	alter table Book_Loans
		add constraint fk_BookLoans_BookID foreign key (BookID)
		references Books (BookID)
		on delete cascade
		on update cascade,
		constraint fk_BookLoans_BranchID foreign key (BranchID)
		references Library_Branch (BranchID)
		on delete cascade
		on update cascade,
		constraint fk_BookLoans_CardID foreign key (CardID)
		references Borrowers (CardID)
		on delete cascade
		on update cascade

end
go