CREATE TABLE `invoice`(
	`invoice_id` int not null auto_increment unique,
    `car_id` int not null unique,
    `customer_id` int not null unique,
    primary key (`invoice_id`),
    foreign key (`customer_id`) References customer (`customer_id`),
    foreign key (`car_id`) references `car` (`car_id`)
);
insert into `invoice` values (97546824731568435, 382);
insert into `invoice` values (64387914687310290, 473);
insert into `invoice` values (39175462153587206, 147);

create table `sales_peep`(
	`speep_id` int not null auto_increment unique,
    `sfirst_name` varchar(50) not null,
    `slast_name` varchar(50) not null,
    `manager_id` int not null unique,
    primary key (`speep_id`)
);
insert into `sales_peep` values ("Kahkah", "Poupoo", 3);
insert into `sales_peep` values ("Tooty", "Fruity", 2);
insert into `sales_peep` values ("Iirep", "Uouff", 7);

create table `cars` (
	`car_id` int not null unique,
    `year` int not null,
    `make` varchar(20) not null,
    `model` varchar(20) not null,
    `sales_peep` int not null unique,
    primary key (`car_id`),
    foreign key (`sales_peep`) references `sales_peep` (`speep_id`)
);
insert into `cars` values (97546824731568435, 1999, "ChocoRunner", "Yellowbirdie", 2);
insert into `cars` values (64387914687310290, 2028, "Wayahead", "Superscience Turbo", 7);
insert into `cars` values (39175462153587206, 2015, "BIG OLE", "Syphon", 2);

create table `customer` (
	`customer_id` int not null unique,
    `first_name` varchar(50) not null,
    `last_name` varchar(50) not null,
    `credit_score` int null,
    `car_id` int unique not null,
    `invoice_id` int unique not null,
    primary key (`customer_id`),
    foreign key (`car_id`) references `cars` (`car_id`),
    foreign key (`invoice_id`) references `invoice` (`invoice_id`)
);
insert into `customer` values (382, "Cloud", "Strife", 679, 97546824731568435, 13);
insert into `customer` values (473, "Squall", "Leonart", 320, 39175462153587206, 207);
insert into `customer` values (147, "Zidane", "Tribal", 850, 64387914687310290, 8);

create table `service_tickets` (
	`st_id` int not null unique auto_increment,
    `car_id` int not null,
    `customer_id` int not null,
    `peep_id` int not null,
    primary key (`st_id`),
    foreign key (`car_id`) references `cars` (`car_id`),
    foreign key (`customer_id`) references `customer` (`customer_id`),
    foreign key (`peep_id`) references `mechanic_peep` (`peep_id`)
);
insert into `service_tickets` values (39175462153587206, 473, 19);
insert into `service_tickets` values (39175462153587206, 473, 26);
insert into `service_tickets` values (97546824731568435, 382, 19);

create table `service_history` (
	`service_record_id` int not null unique auto_increment,
    `peep_id` int not null,
    `customer_id` int not null,
    `st_id` int not null,
    `job_code` int not null,
    `total_price` decimal not null,
    primary key (`service_record_id`),
    foreign key (`peep_id`) references `mechanic_peep` (`peep_id`),
    foreign key (`customer_id`) references `customer` (`customer_id`),
    foreign key (`st_id`) references `service_tickets` (`st_id`),
    foreign key (`job_code`) references `job_code` (`job_code`)
);
insert into `service_history` values (19, 473, 1, 7, 3683.97);
insert into `service_history` values (19, 382, 3, 1, 59.99);
insert into `service_history` values (26, 473, 2, 3, 289.99);

create table `job_code` (
	`job_code` int not null unique,
    `job` varchar(300) not null,
    `price` decimal not null ,
    primary key (`job_code`)
);
insert into `job_code` values (1, "Standard Oil change. Full Synthetic", 59.99);
insert into `job_code` values (3, "Brake Overhaul", 289.99);
insert into `job_code` values (7, "Transmission full replacement", 3683.97);

create table `mechanic_peep` (
	`peep_id` int not null,
    `peep_name` varchar(100) not null,
    primary key (`peep_id`)
);
insert into `mechanic_peep` values (19, "Chocobo Larry");
insert into `mechanic_peep` values (26, "Ronald Wrench");
insert into `mechanic_peep` values (4, "Pilsbury Doughboy");

 