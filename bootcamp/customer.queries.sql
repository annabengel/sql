SELECT * FROM customer
WHERE sales > 30000000
	and sales < 70000000
order by sales desc;

select name as 'Customer Name', sales as 'Total Sales'
	from customer;
    

