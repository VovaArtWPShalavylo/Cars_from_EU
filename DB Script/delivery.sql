create table cars.delivery(
	delivery_id int Primary key,
	location_id_from int,
	location_id_to int,
	method varchar(30),
	price varchar(20),
	insurance varchar(10),
	arrival_time varchar(20)
	)
