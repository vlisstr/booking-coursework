CREATE OR REPLACE FUNCTION calculate_fine() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.ReturnDate > NEW.DueDate THEN
        NEW.FineAmount := (NEW.ReturnDate - NEW.DueDate) * 10;
    ELSE
        NEW.FineAmount := 0;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_calculate_fine
BEFORE UPDATE ON Loan
FOR EACH ROW
EXECUTE FUNCTION calculate_fine();