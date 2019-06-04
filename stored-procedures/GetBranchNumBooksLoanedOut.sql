use [LibraryMS]
go

--sample query 5
--returns a list of the number of books loaned out from each branch on date @asOfDate
create procedure GetBranchNumBooksLoanedOut

@asOfDate date --for example '2019-06-01'

as
	select
	t2.BranchName as 'Branch Name',
	t1.[Num Books Loaned Out]
	from
	(select
	t1.BranchID,
	count(t1.BookID) as 'Num Books Loaned Out'
	from Book_Loans as t1
	where cast(@asOfDate as date) between cast(t1.DateOut as date) and cast(t1.DateDue as date)
	group by t1.BranchID
	) as t1
	inner join Library_Branch as t2 on t2.BranchID = t1.BranchID
	order by t2.BranchName
	;
go