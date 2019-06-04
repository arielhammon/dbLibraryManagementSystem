use [LibraryMS]
go

create procedure ExecSampleQueries
as
begin
	--sample query 1
	execute [dbo].[GetNumCopiesBookAtBranch] @bookTitle='Lost Tribe', @branchName='Sharp'

	--sample query 2
	execute [dbo].[GetNumCopiesBookAtEachBranch] @bookTitle='Lost Tribe'

	--sample query 3
	execute [dbo].[GetBorrowersWithNoBooksCheckedOut] @asOfDate='2019-6-15'

	--sample query 4
	execute [dbo].[GetBranchBooksDueOnDate] @branchName='Sharp', @dueDate='2019-06-11'

	--sample query 5
	execute [dbo].[GetBranchNumBooksLoanedOut] @asOfDate='2019-06-01'

	--sample query 6
	execute [dbo].[GetBorrowersWithMoreThanXBooksCheckedOut] @numBooksOut=5, @asOfDate='2019-6-5'

	--sample query 7
	execute [dbo].[GetCopiesByAuthorAndBranch] @authorName='King', @branchName='Central'
end
go