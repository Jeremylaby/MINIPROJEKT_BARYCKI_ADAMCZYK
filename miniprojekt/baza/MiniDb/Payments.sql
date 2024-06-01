create table Payments
(
    payment_id     int auto_increment
        primary key,
    reservation_id int      not null,
    amount         int      not null,
    date           datetime not null,
    admin_id       int      null,
    constraint Payments_Admins
        foreign key (admin_id) references Admins (admin_id),
    constraint Payments_Reservations
        foreign key (reservation_id) references Reservations (reservation_id)
);

create index Payments_ak_1
    on Payments (reservation_id);

