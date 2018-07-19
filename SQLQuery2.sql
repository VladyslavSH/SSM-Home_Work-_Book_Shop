insert into Country values ('Ukraine')
go

insert into Authors values
	('Shon', 'Egerds', 6)
go

select * from books
go

insert into Sales values
( 11 , (select NameBook from books where id_book = 11 ), '2018-07-10',(select price from books where id_book = 11), 1 ,6),
( 11 , (select NameBook from books where id_book = 11 ), '2018-07-10',(select price from books where id_book = 11), 1 ,6),
( 11 , (select NameBook from books where id_book = 11 ), '2018-07-10',(select price from books where id_book = 11), 1 ,6),
( 11 , (select NameBook from books where id_book = 11 ), '2018-07-10',(select price from books where id_book = 11), 1 ,6)
go

insert into Books values
	( 'Супер Программирование',6, 14 , 1000.20,	'no pic',  '2018-02-05', 500 ),
	( 'Супер Программирование 2',6, 14 , 780.20,	'no pic',  '2018-02-05', 250 )

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
create view MaxPriceBook (NameBooks, NameThemes, Price)
as
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

select * from MaxPriceBook
go
------------ CoMpleCt --------------

------------ LessOn 3 --------------
alter view OrderByShops(NameShops, NameCountry, NameBooks, Price, Quantity, DateOfSale)
as
select top 100 Shops.NameShop, Country.NameCountry, Sales.NameBook, Sales.Price, Sales.Quantity, Sales.DateOfSale
from Shops, Country, Sales
where Shops.ID_COUNTRY = Country.ID_COUNTRY
and
Sales.ID_SHOP = Shops.ID_SHOP
order by 2, 1 desc 
go

select * from OrderByShops 
go
------------ CoMpleCt --------------

------------ LessOn 4 --------------
create view TopBook
as
select top 1 books.NameBook,  count(Sales.Price*Sales.Quantity) as 'count'  from books, Sales where books.ID_BOOK = Sales.ID_BOOK  group by books.NameBook order by 2 desc

select * from TopBook
go
------------ CoMpleCt --------------

------------ LessOn 5 --------------
create view AuthorsAB
as
select * from Authors where Authors.FirstName like '[АБ]%'
go

select * from AuthorsAB
go
------------ CoMpleCt --------------

------------ LessOn 6 --------------
select Shops.NameShop from Shops
where
Shops.ID_SHOP <> any (select Sales.ID_SHOP from Sales)
