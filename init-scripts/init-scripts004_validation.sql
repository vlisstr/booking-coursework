CREATE OR REPLACE FUNCTION check_copy_availability() RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT IsAvailable FROM Copy WHERE CopyID = NEW.CopyID) = FALSE THEN
        RAISE EXCEPTION 'Книга вже видана іншому читачу';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_availability
BEFORE INSERT ON Loan
FOR EACH ROW
EXECUTE FUNCTION check_copy_availability();