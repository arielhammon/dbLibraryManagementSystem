use [LibraryMS]
go

--sample query 3 uses LEFT OUTER JOIN with exclusion
--returns a list of all borrowers with no books checked out on date @asOfDate
--flaw in this sample database: it has no means of determining if a book has been kept past the due date or returned early
--consequently, this query assumes that books are checked out for the full term and returned on the due date
--this could be solved by adding a checked-in table to this sample database
create procedure GetBorrowersWithNoBooksCheckedOut

@asOfDate date --for example '2019-6-15'

as
	select
	t1.CardID as 'Card ID',
	t1.Name as 'Name of Borrower'
	from Borrowers as t1
	left join
	(select
	t2.CardID
	from Book_Loans as t1
	inner join Borrowers as t2 on t1.CardID = t2.CardID
	--where the book is checked out on @asOfDate
	where cast(t1.DateOut as date) <= cast(@asOfDate as date)
	and cast(t1.DateDue as date) >= cast(@asOfDate as date)
	group by t2.CardID
	) as t2 on t2.CardID = t1.CardID
	where t2.CardID is null
	;
go