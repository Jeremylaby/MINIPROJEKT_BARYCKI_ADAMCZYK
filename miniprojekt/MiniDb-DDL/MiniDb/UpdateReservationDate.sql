create
    definer = root@`%` procedure UpdateReservationDate(IN reservationId int, IN clientId int, IN newDateFrom date,
                                                       IN newDateTo date)
BEGIN
    DECLARE flatId INT;
    DECLARE roomPricePerDay DECIMAL(10,2);
    DECLARE newNights INT;
    DECLARE oldDateFrom DATE;
    DECLARE oldDateTo DATE;
    IF (SELECT status FROM Reservations WHERE reservation_id=reservationId)=0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You cannot update cancelled reservation';
    end if;
    CALL CheckReservationOwner(clientId,reservationId);
    SELECT flat_id, date_from, date_to INTO flatId, oldDateFrom, oldDateTo
    FROM Reservations
    WHERE reservation_id = reservationId;
    SELECT  price_for_day INTO roomPricePerDay FROM Flats WHERE flat_id = flatId;
    IF EXISTS (
        SELECT 1 FROM Reservations
        WHERE flat_id = flatId AND  (date_to > newDateFrom AND date_from < newDateTo) AND status=1 AND NOT reservation_id=reservationId
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The room is not available for the selected dates.';
    END IF;
    SET newNights = DATEDIFF(newDateTo, newDateFrom);
    UPDATE Reservations
    SET date_from = newDateFrom, date_to = newDateTo, price = roomPricePerDay * newNights
    WHERE reservation_id = reservationId;
END;

grant execute on procedure UpdateReservationDate to client;

