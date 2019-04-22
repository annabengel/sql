SELECT * FROM product;

select price, count(*) from mma.product
group by price;

select *, li.quantity*p.price as total from lineitem li
	join product p
    on li.productid = p.id;