create database shopping;

create table users(
                       id serial primary key,
                      name varchar,
                      gmail varchar not null unique ,
                      password varchar not null unique ,
                      username varchar not null unique ,
                      phone_number varchar not null
);

create table user_role(
   id serial primary key ,
   role varchar
);

create table connection_role(
     user_id int references users(id),
     role_id int  references user_role(id)
);