create table dbo.species(
id integer not null,
temp_preferences varchar(1) check(temp_preferences in('+', '-')),
temp_limit integer not null,
  unique(id)
);

create table dbo.ponds (
id integer not null,
temperature integer not null,
city varchar(10),
unique(id)
);

create table dbo.ducks (
id integer not null,
name varchar(10),
species_id integer not null,
pond_id integer not null,
unique(id)
);

INSERT Into species VALUES (30, '+', 15);
INSERT Into species VALUES (40, '-', 20);
INSERT Into species VALUES (50, '-', 31);

INSERT Into ponds VALUES (1, 13, 'Oregon');
INSERT Into ponds VALUES (2, 31, 'Oregano');
INSERT Into ponds VALUES (3, 25, 'Test Lake');


INSERT Into ducks VALUES (1, 'Martin', 50,2 );
INSERT Into ducks VALUES (3, 'Bruno', 30,1 );
INSERT Into ducks VALUES (9, 'Ignacio', 40,2 );
INSERT Into ducks VALUES (27, 'Hedwig', 40,1 );
INSERT Into ducks VALUES (81, 'Marina', 30,2 );

truncate table species
truncate table ponds
truncate table ducks