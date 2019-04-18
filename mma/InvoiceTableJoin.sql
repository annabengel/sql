SELECT * FROM lineitem, product, invoice;

SELECT i.ordernumber, i.customername, i.orderdate, p.code, p.description, p.price, l.Quantity
	From lineitem l
Inner Join Invoice i
	On l.invoiceid = i.id
Inner Join Product p
	On l.productid = p.id;
    