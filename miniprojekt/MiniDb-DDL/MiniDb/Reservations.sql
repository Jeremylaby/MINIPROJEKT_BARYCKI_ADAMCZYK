create table Reservations
(
    reservation_id int auto_increment
        primary key,
    client_id      int            not null,
    flat_id        int            not null,
    status         int            not null,
    people_count   int            not null,
    date_from      date           not null,
    date_to        date           not null,
    price          decimal(10, 2) not null,
    constraint Reservations_Clients
        foreign key (client_id) references Clients (client_id),
    constraint Reservations_Flats
        foreign key (flat_id) references Flats (flat_id)
);

