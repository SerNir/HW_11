create table users
(
    id       bigserial,
    username varchar(30) not null unique,
    password varchar(80) not null,
    email    varchar(50) unique,
    primary key (id)
);

create table roles
(
    id   serial,
    name varchar(50) not null,
    primary key (id)
);

create table authority
(
    id   serial,
    name varchar(50) not null,
    primary key (id)
);

CREATE TABLE users_roles
(
    user_id bigint not null,
    role_id int    not null,
    primary key (user_id, role_id),
    foreign key (user_id) references users (id),
    foreign key (role_id) references roles (id)
);

CREATE TABLE users_authority
(
    user_id      bigint not null,
    authority_id int    not null,
    primary key (user_id, authority_id),
    foreign key (user_id) references users (id),
    foreign key (authority_id) references authority (id)
);

insert into roles (name)
values ('ROLE_USER'),
       ('ROLE_ADMIN');

insert into authority (name)
values ('CREATE_NEW_PRODUCT'),
       ('DELETE_PRODUCT');

insert into users (username, password, email)
values ('entity', '$2a$04$Fx/SX9.BAvtPlMyIIqqFx.hLY2Xp8nnhpzvEEVINvVpwIPbA3v/.i', 'entity@gmail.com');

insert into users_roles (user_id, role_id)
values (1, 1),
       (1, 2);

insert into users_authority (user_id, authority_id)
values (1, 1),
       (1, 2);