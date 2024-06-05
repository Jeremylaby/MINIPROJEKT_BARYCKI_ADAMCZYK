create definer = root@`%` view AllCancelledReservations as
select `MiniDb`.`Reservations`.`reservation_id` AS `reservation_id`,
       `MiniDb`.`Reservations`.`client_id`      AS `client_id`,
       `MiniDb`.`Reservations`.`date_from`      AS `date_from`,
       `MiniDb`.`Reservations`.`date_to`        AS `date_to`,
       `MiniDb`.`Reservations`.`status`         AS `status`
from `MiniDb`.`Reservations`
where (`MiniDb`.`Reservations`.`status` = 0);

