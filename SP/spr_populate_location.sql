GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'cars.spr_Populate_location') AND type in (N'P', N'PC'))
  DROP PROCEDURE [cars].[spr_Populate_location]

GO
create procedure cars.spr_populate_location

	@NUMBEROFROWS int 
AS
Declare
	@loop int,
	@city varchar (50),
	@country varchar (50),
	@street varchar (50),
	@building_number varchar (10),
	@num_city int,
	@num int,
	@num_street int,
	@building_num int

set @loop = 1;

while @loop <= @NUMBEROFROWS
begin 
	SET @num = (round(rand()*13,0) + 1)
	set @num_city = (round(rand()*3,0)+1)
	set @country = (select choose(@num, 'Belgium','Spain', 'Portugal', 'France', 'Poland', 'Germany', 'Italy', 'Netherlands', 'Sweden', 'Austria', 'USA', 'Canada', 'Hungary', 'Ukraine' ))
	set @city = case
		when @country = 'Belgium' then (select choose(@num_city, 'Brussel', 'Schaarbeek', 'Anderlecht', 'Bruge'))
		when @country = 'Spain' then (select choose(@num_city, 'Madrid', 'Barcelona', 'Valencia', 'Sevilla'))
		when @country = 'Portugal' then (select choose(@num_city, 'Lisbon', 'Porto', 'Amadora', 'Braga'))
		when @country = 'France' then (select choose(@num_city, 'Paris', 'Marseille', 'Lyon', 'Toulouse'))
		when @country = 'Poland' then (select choose(@num_city, 'Warsaw', 'Krakow Country', 'Lodsz', 'Wroclaw'))
		when @country = 'Germany' then (select choose(@num_city, 'Berlin', 'Hamburg', 'Munich', 'Cologne'))
		when @country = 'Italy' then (select choose(@num_city, 'Rome', 'Milan', 'Napoli', 'Turin'))
		when @country = 'Netherlands' then (select choose(@num_city, 'Amsterdam', 'Rotterdam', 'The Hague', 'Utrecht'))
		when @country = 'Sweden' then (select choose(@num_city, 'Stockholm', 'Goeteborg', 'Malmoe', 'Uppsala'))
		when @country = 'Austria' then (select choose(@num_city, 'Vienna', 'Graz', 'Linz', 'Salzburg'))
		when @country = 'USA' then (select choose(@num_city, 'New York', 'Los Angeles', 'Chicago', 'Houston'))
		when @country = 'Canada' Then (select choose(@num_city, 'Toronto', 'Montreal', 'Vancouver', 'Calgary'))
		when @country = 'Hungary' then (select choose(@num_city, 'Budapest', 'Debrecen', 'Szeged', 'Miskolc'))
		when @country = 'Ukraine' then (select choose(@num_city, 'Kyiv', 'Kharkiv', 'Lviv', 'Odessa'))
		end;
	
	set @num_street = (round(rand()*19,0)+1)
	set @street = (select choose(@num_street, 'Main', 'Church', 'Main North', 'Main South', 'Elm', 'High', 'Washington', 'Park Avenue', 'Second', 'Wallnut', 'Chasenut', 'River', 'Center', 'Pine', 'Kr Country', 'Shevchenka', 'Miczkevicha', 'Bandera', 'Volodymyra', 'Sichovyh strilciv')) 
	set @building_num = (round(rand()*(300-2)+2,0))
	set @building_number = case
		when @building_num between 253 and 256 then (select concat(@building_num, 'a')) 
		when @building_num between 106 and 110 then (select concat(@building_num, 'b'))
		else (select concat(@building_num, ''))
		end;
	set @loop = @loop +1
	Insert into cars.location(
		location_id, 
		city,
		country,
		street,
		building_number
		)
	values(
		@loop,
		@city,
		@country,
		@street,
		@building_number
		)
end

exec cars.spr_polulate_location 100
