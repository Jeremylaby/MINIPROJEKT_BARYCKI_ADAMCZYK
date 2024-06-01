create definer = root@`%` view ReservationsToRefund as
select `r`.`reservation_id` AS `reservation_id`,
       `r`.`client_id`      AS `client_id`,
       `r`.`flat_id`        AS `flat_id`,
       sum(`p`.`amount`)    AS `to_return`,
       `r`.`status`         AS `status`
from (`MiniDb`.`Reservations` `r` join `MiniDb`.`Payments` `p` on ((`r`.`reservation_id` = `p`.`reservation_id`)))
where (`r`.`status` = 0)
group by `r`.`reservation_id`, `r`.`client_id`, `r`.`flat_id`, `r`.`status`
having (`to_return` <> 0);

