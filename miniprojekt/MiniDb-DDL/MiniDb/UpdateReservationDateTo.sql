create
    definer = root@`%` procedure UpdateReservationDateTo(IN reservationId int, IN clientId int, IN newDateTo date)
BEGIN
    DECLARE dateFrom DATE;
    SELECT date_from INTO dateFrom FROM Reservations WHERE reservation_id=reservationId;
    CALL UpdateReservationDate(reservationId,clientId, dateFrom,newDateTo);
end;

grant execute on procedure UpdateReservationDateTo to client;

