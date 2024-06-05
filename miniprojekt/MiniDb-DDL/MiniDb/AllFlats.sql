create definer = root@`%` view AllFlats as
select `MiniDb`.`Flats`.`flat_id`       AS `flat_id`,
       `MiniDb`.`Flats`.`floor`         AS `floor`,
       `MiniDb`.`Flats`.`flat_number`   AS `flat_number`,
       `MiniDb`.`Flats`.`size`          AS `size`,
       `MiniDb`.`Flats`.`rooms_count`   AS `rooms_count`,
       `MiniDb`.`Flats`.`is_bathroom`   AS `is_bathroom`,
       `MiniDb`.`Flats`.`is_kitchen`    AS `is_kitchen`,
       `MiniDb`.`Flats`.`price_for_day` AS `price_for_day`,
       `MiniDb`.`Flats`.`description`   AS `description`
from `MiniDb`.`Flats`;

