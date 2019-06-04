use [LibraryMS]
go

--sample query 6
--returns a list of borrowers with more than @numBooksOut booked checked out on date @asOfDate
create procedure GetBorrowersWithMoreThanXBooksCheckedOut

@numBooksOut int = 5,
@asOfDate date --for example '2019-06-05'

as
	select
	t1.CardID,
	t2.[Name],
	t2.[Address],
	t2.Phone,
	t1.[Number of Books Out]
	from
	(select
	t1.CardID,
	count(t1.BookID) as 'Number of Books Out'
	from Book_Loans as t1
	where cast(@asOfDate as date) between cast(t1.DateOut as date) and cast(t1.DateDue as date)
	group by t1.CardID
	having count(t1.BookID) > @numBooksOut) as t1
	inner join Borrowers as t2 on t2.CardID = t1.CardID
	;
go