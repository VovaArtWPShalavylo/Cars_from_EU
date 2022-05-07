create table cars.customers(
	Customer_id int not null primary key,
	Name varchar(50),
	Surname varchar (50),
	Date_of_birth Date,
	Phone_number varchar (20),
	Location_id int foreign key references cars.location(location_id),
	IPN varchar (50),
	Passport_number varchar (9),
	Passport_date_of_expiry date,
	Authority varchar (4)
)
