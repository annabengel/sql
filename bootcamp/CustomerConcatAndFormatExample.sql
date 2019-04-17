select name as 'Contact Name', 
	concat(city, ', ', state) as 'Location', 
	concat('$', format(sales, 2)) as 'Sales' 
from customer;
