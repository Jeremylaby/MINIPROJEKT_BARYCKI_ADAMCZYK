create definer = root@`%` view ActiveReservations as
select `MiniDb`.`Reservations`.`reservation_id` AS `reservation_id`,
       `MiniDb`.`Reservations`.`client_id`      AS `client_id`,
       `MiniDb`.`Reservations`.`flat_id`        AS `flat_id`,
       `MiniDb`.`Reservations`.`status`         AS `status`,
       `MiniDb`.`Reservations`.`people_count`   AS `people_count`,
       `MiniDb`.`Reservations`.`date_from`      AS `date_from`,
       `MiniDb`.`Reservations`.`date_to`        AS `date_to`,
       `MiniDb`.`Reservations`.`price`          AS `price`
from `MiniDb`.`Reservations`
where ((`MiniDb`.`Reservations`.`status` = 1) and
       ((`MiniDb`.`Reservations`.`date_from` >= curdate()) or (`MiniDb`.`Reservations`.`date_to` >= curdate())));

