create table cars.repair_details(
  repair_id int Foreign key references cars.repair(repair_id),
  detail_id int Foreign key references cars.details(detail_id),
  amount_of_details varchar (30)
  )
