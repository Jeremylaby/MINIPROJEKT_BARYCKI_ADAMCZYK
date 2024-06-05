create
    definer = root@`%` procedure UpdateReservationDateFrom(IN reservationId int, IN clientId int, IN newDateFrom date)
BEGIN
    DECLARE dateTo DATE;
    SELECT date_to INTO dateTo FROM Reservations WHERE reservation_id=reservationId;
    CALL UpdateReservationDate(reservationId,clientId, newDateFrom,DateTo);
end;

grant execute on procedure UpdateReservationDateFrom to client;

