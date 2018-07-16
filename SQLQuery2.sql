insert into Country values ('Ukraine')
go

insert into Authors values
	('Shon', 'Egerds', 6)
go

select * from books
go
------------ LessOn 1 --------------
create view Autors_From (A_FirstName, A_LastName, NameCountry)
as
select distinct Authors.FirstName, Authors.LastName, Country.NameCountry
from Authors, Country, Shops
where 
Authors.ID_COUNTRY = Country.ID_Country
and
Shops.ID_country = Country.ID_Country
go

select * from Autors_From
go
------------ CoMpleCt --------------

------------ LessOn 2 --------------
select books.NameBook, Themes.NameTheme, Max(Books.Price)
from Books, Themes
where
themes.NameTheme = 'Программирование'
and
Books.Id_theme = Themes.ID_theme
and 
books.price = (select max(books.price) from books)
group by books.NameBook, Themes.NameTheme, Books.Price
go
