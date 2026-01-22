BEGIN;

INSERT INTO Loan (CopyID, MemberID, LoanDate, DueDate, FineAmount)
VALUES (1, 10, CURRENT_DATE, CURRENT_DATE + 14, 0);

UPDATE Copy SET IsAvailable = FALSE WHERE CopyID = 1;

COMMIT;