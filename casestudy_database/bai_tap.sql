CREATE DATABASE demo_bt;
USE demo_bt;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 `name` varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);

insert into users(`name`, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(`name`, email, country) values('Kante','kante@che.uk','Kenia');

DELIMITER $$
CREATE PROCEDURE display_user()
BEGIN
    SELECT *
    FROM users;
END; $$
DELIMITER ;

call display_user();

DELIMITER $$
CREATE PROCEDURE delete_user_by_id(in in_id int)
BEGIN
    DELETE FROM users
    WHERE id = in_id;
END; $$
DELIMITER ;

call delete_user_by_id();

DELIMITER $$
CREATE PROCEDURE update_user(in in_id int, in in_name varchar(45), in in_email varchar(45), in in_country varchar(45))
BEGIN
    update users
    SET `name` = in_name, email = in_email, country = in_country
    WHERE id = in_id;
END; $$
DELIMITER ;

call update_user();

create table Permision(
id int(11) primary key,
name varchar(50)
);

 
create table User_Permision(
permision_id int(11),
user_id int(11)
);

insert into Permision(id, name) values(1, 'add');

insert into Permision(id, name) values(2, 'edit');

insert into Permision(id, name) values(3, 'delete');

insert into Permision(id, name) values(4, 'view');