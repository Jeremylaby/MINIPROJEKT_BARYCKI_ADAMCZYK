create
    definer = root@`%` procedure AddReservation(IN resClientId int, IN resFlatId int, IN resDateFrom date,
                                                IN resDateTo date, IN resPeopleCount int)
BEGIN
    DECLARE roomCapacity INT;
    DECLARE roomPricePerDay DECIMAL(10,2);
    DECLARE nights INT;

    SELECT size, price_for_day INTO roomCapacity, roomPricePerDay FROM Flats WHERE flat_id = resFlatId;
    IF resPeopleCount > roomCapacity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The number of people exceeds the room capacity.';
    END IF;
    CALL isRoomAvailable(resFlatId,resDateFrom,resDateTo);
    SET nights = DATEDIFF(resDateTo, resDateFrom);
    INSERT INTO Reservations (client_id, flat_id, date_from, date_to, people_count, status, price)
    VALUES (resClientId, resFlatId, resDateFrom, resDateTo, resPeopleCount, 1, roomPricePerDay * nights);

END;

grant execute on procedure AddReservation to client;

