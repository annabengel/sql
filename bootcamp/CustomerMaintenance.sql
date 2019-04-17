select * from customer
	where name like '%A%.';
	-- or name like 'D%';
select * from customer
	where name like 'A%'
		and state = 'NJ';
        
-- Use a regular expression to return
-- all records with names starting with a vowel
Select * from customer
	where name REGEXP "^[aeiou].*";

select * from customer;
-- insert stmt
insert into customer values
(13, 'Fender', 'Scottsdale', 'AZ', 834472342, 1);

insert into customer values
(14, 'Gibson Guitars', 'Memphis', 'TN', 53654634653, 1);

insert into customer (Name, City, State, Sales, Active)
	values ('Ibanez', 'Bensalem', 'PA', 566635464, 1),
		('Ibanez', 'Bensalem', 'PA', 566635464, 1);
-- update statement
update customer 
	set name = 'Pearl', 
    city = 'Test',
    state = 'TE'
    where id = '16';

delete from customer
	where id = 16;

-- select using 'in' clause
select * from customer
	where id in (10, 11, 12);


    
    
    


        