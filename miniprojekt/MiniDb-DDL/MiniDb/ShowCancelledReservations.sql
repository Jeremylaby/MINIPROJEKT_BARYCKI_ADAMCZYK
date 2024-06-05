create
    definer = root@`%` procedure ShowCancelledReservations(IN input_year int, IN input_month int)
BEGIN
    SELECT * FROM AllCancelledReservations
    WHERE
        YEAR(date_from) = input_year AND
        MONTH(date_from) = input_month;
END;

