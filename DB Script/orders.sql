create table cars.orders(
  order_id int Primary key,
  customer_id int Foreign key references cars.customers(customer_id),
  car_id int Foreign key references cars.car(car_id),
  repair_id int Foreign key references cars.repair(repair_id),
  delivery_id int Foreign key references cars.delivery(delivery_id),
  total_price varchar(20)
  )
