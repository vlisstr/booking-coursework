CREATE INDEX idx_book_title ON Book(Title);
CREATE INDEX idx_member_email ON Member(Email);
CREATE INDEX idx_loan_dates ON Loan(LoanDate, DueDate);