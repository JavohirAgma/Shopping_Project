create database shopping;

create table users(
                      id serial primary key,
                      name varchar,
                      gmail varchar not null unique ,
                      password varchar not null unique ,
                      username varchar not null unique ,
                      phone_number varchar not null ,
                      is_active boolean
);

create table user_role(
                          id serial primary key ,
                          role varchar
);

create table connection_role(
                                user_id int references users(id),
                                role_id int  references user_role(id)
);

insert into user_role (role) values('USER'),('CONSUMER'),('ADMIN');
insert into users (name ,gmail,password,username,phone_number,is_active) values ('Xushnud','xushnudxurramov@gmail.com','123','1xurramovv',976335259,true);
insert into connection_role (user_id, role_id)values (1,3);