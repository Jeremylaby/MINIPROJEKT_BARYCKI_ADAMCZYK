create
    definer = root@`%` procedure CancelFutureReservation(IN clientID int, IN reservationID int)
BEGIN
    DECLARE startDate DATE;

    SELECT date_from INTO startDate FROM Reservations WHERE reservation_id = reservationID;
    CALL CheckReservationOwner(clientID,reservationID);
    IF startDate > CURDATE() THEN
        UPDATE Reservations SET status = 0 WHERE reservation_id = reservationID;
        SELECT 'Reservation cancelled successfully.' AS message;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot cancel past or current reservations.';
    END IF;
END;

grant execute on procedure CancelFutureReservation to client;

