create table cars.repair(
  repair_id int Primary key,
  car_id int Foreign key references cars.car(car_id),
  damage_type varchar(40),
  price varchar(20),
  )
