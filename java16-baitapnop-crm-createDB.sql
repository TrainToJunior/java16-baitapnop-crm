create database if not exists crm_app;
use crm_app;

create table if not exists roles(
	id tinyint auto_increment,
	role_name varchar(20),
    createDate timestamp,
    primary key (id)
);

create table if not exists users(
	id int auto_increment,
    fullname varchar(100),
    phone_number varchar(20),
    address varchar(100),
    email varchar(100),
    user_password varchar(100),    
    role_id tinyint,
	primary key (id)
);

create table if not exists jobs(
	id int auto_increment,
    job_name varchar(100),
    job_description varchar(100),
    user_created_id int,
    start_date timestamp,
	end_date timestamp,
	primary key (id)
);

create table if not exists tasks(
	id int auto_increment,
	task_name varchar(100),
    task_description varchar(100),
    start_date timestamp,
	end_date timestamp,
    user_id int,
    status_id tinyint,
    job_id int,
	primary key (id)
);

create table if not exists status(
	id tinyint auto_increment,
	status_name varchar(50),
    createDate timestamp,
	primary key (id)
);

alter table users add foreign key (role_id) references roles (id) on delete cascade;
alter table tasks add foreign key (user_id) references users (id) ON UPDATE CASCADE;
alter table tasks add foreign key (job_id) references jobs (id) on delete cascade;
alter table tasks add foreign key (status_id) references status (id) on delete cascade;

insert into roles (role_name, createDate)
values ('Admin',now());
insert into roles (role_name, createDate)
values ('Leader',now());
insert into roles (role_name, createDate)
values ('Member',now());

insert into users (fullname,phone_number,address,email, user_password,role_id)
values ('TrainToJunior','0792645118','Tân Bình','admin@gmail.com','1234','1');
insert into users (fullname,phone_number,address,email, user_password,role_id)
values ('Leader','0792645118','Quận 8','leader@gmail.com','1234','2');
insert into users (fullname,phone_number,address,email, user_password,role_id)
values ('Member','0792645118','Quận 1','member@gmail.com','1234','3');
insert into users (fullname,phone_number,address,email, user_password,role_id)
values ('Member1','0792645118','Quận 1','member1@gmail.com','1234','3');
insert into users (fullname,phone_number,address,email, user_password,role_id)
values ('Member2','0792645118','Quận 1','member2@gmail.com','1234','3');
insert into users (fullname,phone_number,address,email, user_password,role_id)
values ('Member3','0792645118','Quận 1','member3@gmail.com','1234','3');

insert into status (status_name, createDate)
values ('Đang thực hiện',now());
insert into status (status_name, createDate)
values ('Đã hoàn thành',now());
insert into status (status_name, createDate)
values ('Chưa bắt đầu',now());

insert into jobs (job_name,job_description,user_created_id, start_date,end_date)
values ('Module-User','Quản lý người dùng','1',now(),DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 1 WEEK));
insert into jobs (job_name,job_description,user_created_id, start_date,end_date)
values ('Module-Task','Quản lý công việc','1',now(),DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 1 WEEK));
insert into jobs (job_name,job_description,user_created_id, start_date,end_date)
values ('Module-Role','Quản lý quyền','1',now(),DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 1 WEEK));
insert into jobs (job_name,job_description,user_created_id, start_date,end_date)
values ('Module-Status','Quản lý trạng thái','1',now(),DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 1 WEEK));
insert into jobs (job_name,job_description,user_created_id, start_date,end_date)
values ('Module-Job','Quản lý dự án','1',now(),DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 1 WEEK));
insert into jobs (job_name,job_description, start_date,end_date)
values ('Module-Test','Kiểm tra code',now(),DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 1 WEEK));
insert into jobs (job_name,job_description,user_created_id, start_date,end_date)
values ('Module-All','Quản lý Tất cả','1',now(),DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 1 WEEK));


insert into tasks (task_name,task_description, start_date,end_date,user_id,status_id,job_id)
values ('Add insert object','add nút thêm người dùng',now(),DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 1 WEEK),'3','1','1');
insert into tasks (task_name,task_description, start_date,end_date,user_id,status_id,job_id)
values ('Add delete object','add nút xóa công việc',now(),DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 1 WEEK),'4','3','2');
insert into tasks (task_name,task_description, start_date,end_date,user_id,status_id,job_id)
values ('Add update object','add nút cập nhật dự án',now(),DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 1 WEEK),'5','2','5');
insert into tasks (task_name,task_description, start_date,end_date,user_id,status_id,job_id)
values ('Test role','kiểm tra phân quyền',now(),DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 1 WEEK),'4','1','3');
insert into tasks (task_name,task_description, start_date,end_date,user_id,status_id,job_id)
values ('Add status','add các trạng thái',now(),DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 1 WEEK),'3','1','4');



