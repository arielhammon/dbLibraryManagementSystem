use [LibraryMS]
go

--sample query 4
--returns a list of all book titles at branch @branchName due on @dueDate with borrower's name and address
create procedure GetBranchBooksDueOnDate

@branchName varchar(120),
@dueDate date --for example '2019-06-11'

as
	select
	t4.BookID as 'Book ID',
	t4.Title as 'Book Title',
	t3.[Name] as 'Borrower Name',
	t3.[Address] as 'Borrower Address'
	from
	Book_Loans as t1
	inner join Library_Branch as t2 on t2.BranchID = t1.BranchID
	inner join Borrowers as t3 on t3.CardID = t1.CardID
	inner join Books as t4 on t4.BookID = t1.BookID
	inner join Library_Branch as t5 on t5.BranchID = t1.BranchID
	where t1.DateDue = @dueDate 
	and t5.BranchName like '%' + @branchName + '%'
	;
go