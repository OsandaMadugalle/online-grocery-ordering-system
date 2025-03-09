create database gos;

create table admin(
	admin_id int auto_increment primary key,
    username varchar(50),
    first_name varchar(50),
    last_name varchar(50),
    phone varchar(50),
    email varchar(50),
    password varchar(50)
);

insert into admin
values(0,"Admin","Osanda","Madugalle","+94705531088","osandamadugalle@gmail.com","admin123"),
	(0,"test","Saman","Silva","+94705555555","saman@gmail.com","test@123");

select * from admin;
