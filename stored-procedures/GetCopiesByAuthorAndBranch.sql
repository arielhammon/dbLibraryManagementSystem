use [LibraryMS]
go

--sample query 7
--returns a list of books by author @authorName located at branch @branchName and the number of copies
create procedure GetCopiesByAuthorAndBranch

@authorName varchar(120),
@branchName varchar(120)

as
	select
	t2.Title as 'Book Title',
	t3.AuthorName as 'Author Name',
	t4.BranchName as 'Branch Name',
	t1.Number_Of_Copies as 'Number of Copies'
	from
	Book_Copies as t1
	inner join Books as t2 on t2.BookID = t1.BookID
	inner join Book_Authors as t3 on t3.BookID = t1.BookID
	inner join Library_Branch as t4 on t4.BranchID = t1.BranchID
	where t3.AuthorName like '%' + @authorName + '%'
	and t4.BranchName like '%' + @branchName + '%'
	;
go