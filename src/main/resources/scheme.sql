create database shopping;

create table users(
                      id serial primary key,
                      name varchar,
                      gmail varchar not null unique ,
                      password varchar not null  ,
                      username varchar not null,
                      phone_number varchar not null unique ,
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
create table stores(
    id serial primary key ,
    name varchar unique not null ,
    ownerId int not null references users(id),
    isOpen boolean
);
create table products(
  id serial primary key,
  name varchar not null,
  description varchar not null,
  photoId varchar not null ,
  isOpen boolean,
   store_id int ,
  category varchar
);
drop table products;




insert into user_role (role) values('USER'),('CONSUMER'),('ADMIN');

insert into users (name ,gmail,password,username,phone_number,is_active) values ('Xushnud','xushnudxurramov@gmail.com','123','1xurramovv',976335259,true);
insert into connection_role (user_id, role_id)values (1,3);
