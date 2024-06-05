create definer = root@`%` view ReservationsToRefund as
select `r`.`reservation_id` AS `reservation_id`,
       `r`.`client_id`      AS `client_id`,
       `r`.`date_from`      AS `date_from`,
       `r`.`date_to`        AS `date_to`,
       (case
            when ((`r`.`status` = 0) and (coalesce(sum(`p`.`amount`), 0) <> 0)) then coalesce(sum(`p`.`amount`), 0)
            when (`r`.`status` = 1) then coalesce((sum(`p`.`amount`) - `r`.`price`), 0)
            else 0 end)     AS `to_return`,
       `r`.`status`         AS `status`
from (`MiniDb`.`Reservations` `r` left join `MiniDb`.`Payments` `p` on ((`r`.`reservation_id` = `p`.`reservation_id`)))
group by `r`.`reservation_id`, `r`.`client_id`, `r`.`date_from`, `r`.`date_to`, `r`.`status`
having (`to_return` > 0);

