create
    definer = root@`%` procedure FindAvailableFlats(IN startDate date, IN endDate date, IN numPeople int,
                                                    IN withKitchen tinyint(1))
BEGIN
    -- Wybieranie mieszkań, które są dostępne w podanym terminie
    SELECT f.flat_id, f.flat_number, f.size, f.is_kitchen,f.description,f.price_for_day
    FROM Flats f
    WHERE f.size >= numPeople AND f.is_kitchen = withKitchen
        AND f.flat_id NOT IN (
            SELECT r.flat_id
            FROM ActiveReservations r
            WHERE (r.date_from < endDate AND r.date_to > startDate)
        );
END;

