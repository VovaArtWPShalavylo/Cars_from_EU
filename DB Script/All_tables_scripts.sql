create database cars_from_eu
create schema cars

create table cars.location(
  location_id int not null primary key,
  city varchar (50),
  country varchar (50),
  street varchar (50),
  building_number varchar (10)
)

create table cars.customers(
  Customer_id int not null primary key,
  Name varchar(50),
  Surname varchar (50),
  Date_of_birth varchar(25),
  Phone_number varchar (20),
  Location_id int foreign key references cars.location(location_id),
  IPN varchar (50),
  Passport_number varchar (9),
  Passport_date_of_expiry varchar(25),
  Authority varchar (4)
)


create table cars.car(
  car_id int primary key,
  brand varchar(50),
  model varchar(50),
  [year] varchar(10),
  body varchar (30),
  transmission varchar(30),
  fuel_type varchar(30),
  engine_capacity varchar(20),
  mileage varchar(25),
  color varchar (25),
  weight varchar(20),
  doors varchar(20),
  wheel_size varchar(20),
  vin_code varchar(40)
)

create table cars.delivery(
  delivery_id int Primary key,
  car_id int Foreign key references cars.car(car_id),
  location_id_from int,
  location_id_to int,
  method varchar(30),
  price varchar(20),
  insurance varchar(10),
  arrival_time varchar(20)
)

create table cars.customs_clearance(
  clearence_id int primary key,
  car_id int Foreign key references cars.car(car_id),
  customer_id int Foreign key references cars.customers(Customer_id),
  price varchar(20),
  license_plate varchar(20)
)

create table cars.repair(
  repair_id int Primary key,
  car_id int Foreign key references cars.car(car_id),
  damage_type varchar(40),
  price varchar(20),
)

create table cars.details(
  detail_id int Primary key,
  name varchar(30),
  price varchar(20)
)

create table cars.repair_details(
  repair_id int Foreign key references cars.repair(repair_id),
  detail_id int Foreign key references cars.details(detail_id),
  amount_of_details varchar (30)
)

create table cars.orders(
  order_id int Primary key,
  customer_id int Foreign key references cars.customers(customer_id),
  car_id int Foreign key references cars.car(car_id),
  repair_id int Foreign key references cars.repair(repair_id),
  delivery_id int Foreign key references cars.delivery(delivery_id),
  total_price varchar(20)
)
