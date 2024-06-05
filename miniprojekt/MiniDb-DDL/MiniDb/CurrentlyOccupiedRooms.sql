create definer = root@`%` view CurrentlyOccupiedRooms as
select `f`.`flat_id`     AS `flat_id`,
       `f`.`flat_number` AS `flat_number`,
       `r`.`client_id`   AS `client_id`,
       `r`.`date_from`   AS `date_from`,
       `r`.`date_to`     AS `date_to`
from (`MiniDb`.`Flats` `f` join `MiniDb`.`Reservations` `r` on ((`f`.`flat_id` = `r`.`flat_id`)))
where ((`r`.`date_from` <= curdate()) and (`r`.`date_to` >= curdate()) and (`r`.`status` = 1));

