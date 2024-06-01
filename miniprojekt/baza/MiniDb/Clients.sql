create table Clients
(
    client_id    int auto_increment
        primary key,
    firstname    text         not null,
    lastname     text         not null,
    email        varchar(320) not null,
    phone_number varchar(15)  not null,
    password     varchar(100) not null,
    constraint Clients_ak_1
        unique (email)
);

