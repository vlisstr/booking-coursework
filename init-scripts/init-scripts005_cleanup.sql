CREATE OR REPLACE PROCEDURE archive_damaged_books()
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Copy 
    WHERE Condition = 'Damaged' AND IsAvailable = TRUE;
END;
$$;