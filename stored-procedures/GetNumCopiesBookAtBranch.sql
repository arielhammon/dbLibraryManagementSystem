use [LibraryMS]
go

--sample query 1
--returns the number of copies of book with title @BookTitle located at the branch with name @branchName
create procedure GetNumCopiesBookAtBranch

@bookTitle varchar(120) = '',
@branchName varchar(120) = ''

as
	select
	t2.Title as 'Book Title',
	t3.BranchName as 'Branch Name',
	t1.Number_Of_Copies as 'Number of Copies'
	from [dbo].[Book_Copies] as t1
	inner join [dbo].[Books] as t2 on t2.BookID = t1.BookID
	inner join [dbo].[Library_Branch] as t3 on t3.BranchID = t1.BranchID
	where t2.Title like '%' + @BookTitle + '%'
	and t3.BranchName like '%' + @branchName + '%'
	;
go