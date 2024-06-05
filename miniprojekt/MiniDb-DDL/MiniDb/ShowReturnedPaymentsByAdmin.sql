create
    definer = root@`%` procedure ShowReturnedPaymentsByAdmin(IN adminId int)
BEGIN
    SELECT p.reservation_id,p.amount,p.amount,p.date FROM Payments p WHERE p.admin_id=adminId ORDER BY p.date;
end;

