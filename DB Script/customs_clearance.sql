create table cars.customs_clearance(
  clearence_id int primary key,
  car_id int Foreign key references cars.car(car_id),
  customer_id int Foreign key references cars.customers(Customer_id),
  price varchar(20),
  license_plate varchar(20)
  )
