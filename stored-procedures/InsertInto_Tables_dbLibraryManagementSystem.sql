use [LibraryMS]
go

--initializes tables with hypothetical values
create procedure uspInsertInto_Tables_LibraryMS
as
begin

	insert into [dbo].[Library_Branch]
	(BranchName, Address)
	values
	('Sharpstown Branch Public Library', '1034 S. Longview Dr., Happy Valley, AH 30241'),
	('Central Branch Public Library', '734 E. State Street, Dry Lakes, AH 30651'),
	('Midvale Branch Public Library', '285 W. Washington Rd., Midvale, AH 30241'),
	('Crossroads Branch Public Library', '2710 N. Bench Drive, Crossroads, AH 30962')
	;

	insert into [dbo].[Publisher]
	(PublisherName, [Address], Phone)
	values
	('PublisherName','Address', 'Phone'),
	('Anchor Books','N/A, New York, www.anchorbooks.com', 'N/A'),
	('Berry Knoll Publishing','N/A, Arizona USA', 'N/A'),
	('Custom Imprints','482 Triple Way, Quincy, NY 20431', '221-523-5612'),
	('Doubleday','80 Strand, London, WC2R 0RL, England', 'N/A'),
	('Gideons','PO Box 140800, Nashville, TN 37214-0800', '615-564-5000'),
	('Harper Perennial','10 East 53rd Street, New York, NY 10022', 'N/A'),
	('Modern Library','N/A, New York, NY 10022', 'N/A'),
	('Oxford','Great Clarendon Street, Oxford OX2 6DP, England', 'N/A'),
	('Penguin Classics','80 Strand, London, WC2R 0RL, England', 'N/A'),
	('Penguin Portfolio','375 Hudson Street, New York, NY 10014', '212-572-2232'),
	('Picador USA','Cromwell Place, Hampshire International Business Park, Lime Tree Way, Basingstoke, RG24 8YJ, England', 'N/A'),
	('Scribner','1230 Avenue of the Americas, New York, NY 10020', '1-800-456-6798'),
	('Tom Doherty Associates','175 5th Ave, New York, NY 10010', '212-388-0100'),
	('Touchstone','1230 Avenue of the Americas, New York, NY 10020', '1-800-456-6798'),
	('Viking','80 Strand, London, WC2R 0RL, England', 'N/A'),
	('William Morrow','N/A, New York, NY 10007', 'N/A')
	;

	insert into [dbo].[Books]
	(Title, PublisherName)
	values
	('The Lost Tribe', 'Picador USA'),
	('Jack', 'Berry Knoll Publishing'),
	('Lost On Karma', 'Berry Knoll Publishing'),
	('The Better Angels Of Our Nature', 'Penguin Classics'),
	('The Bone Labyrinth', 'William Morrow'),
	('The Great Gatsby', 'Scribner'),
	('The Bible', 'Gideons'),
	('The Hunchback Of Notre Dame', 'Modern Library'),
	('The Grapes Of Wrath', 'Penguin Classics'),
	('Big Bang', 'Harper Perennial'),
	('Desire Of The Everlasting Hills', 'Anchor Books'),
	('The Trouble With Testosterone', 'Scribner'),
	('Pamela', 'Oxford'),
	('Joseph Andrews', 'Custom Imprints'),
	('A Beautiful Mind', 'Touchstone'),
	('Finding My Virginity', 'Penguin Portfolio'),
	('The Back Of The Napkin', 'Penguin Portfolio'),
	('Hamlet', 'Penguin Classics'),
	('Macbeth', 'Penguin Classics'),
	('Crime And Punishment', 'Penguin Classics'),
	('It', 'Viking'),
	('Pet Sematary', 'Doubleday'),
	('Freedom And Necessity', 'Tom Doherty Associates')
	;

	insert into [dbo].[Book_Authors]
	(BookID, AuthorName)
	values
	(1,'Mark Lee'),
	(2,'Ariel Hammon'),
	(3,'Ariel Hammon'),
	(4,'Steven Pinker'),
	(5,'James Rollins'),
	(6,'F. Scott Fitzgerald'),
	(7,'Various'),
	(8,'Victor Hugo'),
	(9,'John Steinbeck'),
	(10,'Simon Singh'),
	(11,'Thomas Cahill'),
	(12,'Robert M. Sapolksky'),
	(13,'Samuel Richardson'),
	(14,'Henry Fielding'),
	(15,'Sylvia Nasar'),
	(16,'Richard Branson'),
	(17,'Dan Roam'),
	(18,'William Shakespeare'),
	(19,'William Shakespeare'),
	(20,'Fyodor Dostoyevsky'),
	(21,'Stephen King'),
	(22,'Stephen King'),
	(23,'Steven Brust'),
	(23,'Emma Bull')
	;

	insert into [dbo].[Borrowers]
	(Name, Address, Phone)
	values
	('John Doe','123 W. Freemont St., Happy Valley, AH 30241', '423-842-4234'),
	('Jane Doe','123 W. Freemont St., Happy Valley, AH 30241', '423-842-4234'),
	('Mike Doe','533 S. Westminster Ave, Dry Lakes, AH 30651', '423-845-6372'),
	('Mindy Doe','533 S. Westminster Ave, Dry Lakes, AH 30651', '423-845-6372'),
	('Frank Kale','9834 S. Truman Show Road, Midvale, AH 30241', '423-862-1029'),
	('Cindy Kale','9834 S. Truman Show Road, Midvale, AH 30241', '423-862-1029'),
	('Loe Kale','672 W. Holiday Way, Crossroads, AH 30962', '423-831-0193'),
	('Moe Kale','672 W. Holiday Way, Crossroads, AH 30962', '423-831-0193'),
	('Cindy Lou Who','2137 S. Christmas Street, Happy Valley, AH 30241', '423-842-0010'),
	('Bruce Wayne','3710 N. Billion Acres Road, Crossroads, AH 30962', '423-831-9998')
	;

	insert into [dbo].[Book_Copies]
	(BookID, BranchID, Number_Of_Copies)
	values
	(1,1,1),
	(2,1,3),
	(3,1,2),
	(4,1,2),
	(5,1,1),
	(6,1,3),
	(7,1,3),
	(8,1,2),
	(9,1,2),
	(13,1,1),
	(14,1,2),
	(15,1,2),
	(16,1,2),
	(17,1,1),
	(18,1,3),
	(19,1,3),
	(20,1,2),
	(21,1,2),
	(22,1,2),
	(2,2,3),
	(3,2,2),
	(4,2,1),
	(6,2,3),
	(7,2,2),
	(8,2,1),
	(9,2,2),
	(12,2,1),
	(14,2,2),
	(15,2,1),
	(18,2,2),
	(19,2,2),
	(20,2,2),
	(21,2,2),
	(22,2,1),
	(23,2,1),
	(2,3,3),
	(3,3,2),
	(5,3,1),
	(6,3,3),
	(7,3,2),
	(9,3,2),
	(11,3,1),
	(12,3,1),
	(15,3,2),
	(16,3,2),
	(17,3,1),
	(18,3,3),
	(19,3,2),
	(20,3,2),
	(1,4,1),
	(2,4,3),
	(3,4,2),
	(4,4,3),
	(5,4,1),
	(6,4,3),
	(7,4,2),
	(8,4,1),
	(9,4,2),
	(10,4,1),
	(11,4,1),
	(12,4,1),
	(13,4,1),
	(14,4,2),
	(15,4,1),
	(16,4,2),
	(17,4,1),
	(18,4,3),
	(19,4,2),
	(20,4,2)
	;

	insert into [dbo].[Book_Loans]
	(BookID, BranchID, CardID, DateOut, DateDue)
	values
	(13,1,2,'2019-05-25','2019-06-08'),
	(15,1,2,'2019-05-25','2019-06-08'),
	(14,2,4,'2019-05-26','2019-06-09'),
	(15,2,4,'2019-05-26','2019-06-09'),
	(2,1,1,'2019-05-28','2019-06-11'),
	(3,3,1,'2019-05-10','2019-05-24'),
	(17,1,1,'2019-05-20','2019-06-03'),
	(3,2,2,'2019-05-17','2019-05-31'),
	(6,3,2,'2019-05-19','2019-06-02'),
	(9,2,2,'2019-05-31','2019-06-14'),
	(8,4,2,'2019-05-27','2019-06-10'),
	(15,3,2,'2019-05-11','2019-05-25'),
	(16,1,2,'2019-06-02','2019-06-16'),
	(19,2,2,'2019-05-03','2019-05-17'),
	(21,1,2,'2019-05-29','2019-06-12'),
	(2,4,3,'2019-05-30','2019-06-13'),
	(2,2,3,'2019-05-01','2019-05-15'),
	(3,3,3,'2019-05-03','2019-05-17'),
	(19,4,3,'2019-05-11','2019-05-25'),
	(5,4,3,'2019-05-18','2019-06-01'),
	(6,1,3,'2019-05-22','2019-06-05'),
	(12,2,3,'2019-05-02','2019-05-16'),
	(18,3,3,'2019-05-07','2019-05-21'),
	(20,1,3,'2019-06-03','2019-06-17'),
	(2,2,4,'2019-05-12','2019-05-26'),
	(3,2,4,'2019-05-29','2019-06-12'),
	(5,1,4,'2019-05-22','2019-06-05'),
	(9,4,4,'2019-05-29','2019-06-12'),
	(23,2,4,'2019-05-31','2019-06-14'),
	(3,4,5,'2019-05-10','2019-05-24'),
	(16,3,5,'2019-05-18','2019-06-01'),
	(18,4,5,'2019-05-01','2019-05-15'),
	(22,2,5,'2019-05-21','2019-06-04'),
	(2,3,6,'2019-05-02','2019-05-16'),
	(3,2,6,'2019-05-04','2019-05-18'),
	(12,4,6,'2019-05-05','2019-05-19'),
	(12,2,6,'2019-05-15','2019-05-29'),
	(19,2,6,'2019-05-23','2019-06-06'),
	(23,2,6,'2019-05-24','2019-06-07'),
	(2,2,7,'2019-05-01','2019-05-15'),
	(2,2,7,'2019-05-15','2019-05-29'),
	(2,2,7,'2019-05-29','2019-06-12'),
	(3,3,7,'2019-05-19','2019-06-02'),
	(7,3,7,'2019-05-28','2019-06-11'),
	(3,4,8,'2019-05-01','2019-05-15'),
	(4,4,8,'2019-05-30','2019-06-13'),
	(5,4,8,'2019-05-30','2019-06-13'),
	(11,4,8,'2019-05-26','2019-06-09'),
	(16,3,8,'2019-05-05','2019-05-19'),
	(2,4,9,'2019-05-13','2019-05-27'),
	(2,2,9,'2019-05-27','2019-06-10'),
	(2,3,9,'2019-06-10','2019-06-24'),
	(7,2,9,'2019-05-12','2019-05-26'),
	(3,2,10,'2019-05-25','2019-06-08'),
	(3,4,10,'2019-06-08','2019-06-22'),
	(3,2,10,'2019-06-22','2019-07-06'),
	(8,2,10,'2019-05-01','2019-05-15'),
	(19,1,10,'2019-05-27','2019-06-10'),
	(19,3,10,'2019-06-10','2019-06-24')
	;
end
go