create
    definer = root@`%` procedure FindAvailableFlats(IN startDate date, IN endDate date, IN numPeople int,
                                                    IN withKitchen tinyint(1))
BEGIN

    SELECT f.flat_id, f.flat_number, f.size, f.is_kitchen,f.description,f.price_for_day
    FROM Flats f
    WHERE f.size >= numPeople AND (
          (withKitchen = 1 AND f.is_kitchen = 1)
          OR
          (withKitchen = 0)
      )
        AND f.flat_id NOT IN (
            SELECT r.flat_id
            FROM ActiveReservations r
            WHERE (r.date_from < endDate AND r.date_to > startDate)
        );
END;

grant execute on procedure FindAvailableFlats to client;

