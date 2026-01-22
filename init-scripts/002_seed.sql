CREATE VIEW PopularBooks AS
SELECT b.Title, COUNT(l.LoanID) as LoanCount
FROM Book b
JOIN Copy c ON b.BookID = c.BookID
JOIN Loan l ON c.CopyID = l.CopyID
GROUP BY b.Title
ORDER BY LoanCount DESC
LIMIT 5;

CREATE VIEW DebtorsList AS
SELECT m.FullName, m.Phone, b.Title, l.DueDate
FROM Member m
JOIN Loan l ON m.MemberID = l.MemberID
JOIN Copy c ON l.CopyID = c.CopyID
JOIN Book b ON c.BookID = b.BookID
WHERE l.ReturnDate IS NULL AND l.DueDate < CURRENT_DATE;