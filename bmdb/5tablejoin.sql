SELECT * FROM actor
	WHERE gender = 'female'
		order by Firstname;
	
    Select * from actor;
    
    Select concat(a.firstname, ' ', a.lastname) as Actor, c.role, g.name, m.title, m.rating, m.director
    from actor a
    join movie m
    join credit c
		on c.actorid = a.id and c.movieid = m.id
	join genre g 
    join moviegenre mg
		on mg.movieid = m.id and mg.genreid = g.id
	Where g.name = 'comedy';
        
   
        
    