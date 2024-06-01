create table Flats
(
    flat_id       int auto_increment
        primary key,
    floor         int         not null,
    flat_number   int         not null,
    size          int         not null,
    rooms_count   int         not null,
    is_bathroom   tinyint(1)  not null,
    is_kitchen    tinyint(1)  not null,
    price_for_day float(5, 2) not null,
    description   text        not null,
    constraint Flats_ak_1
        unique (flat_number)
);

