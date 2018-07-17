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
select * from Sales
go

select Books.NameBook, count(Books.ID_BOOK) from Books, Sales
where Books.ID_BOOK = sales.ID_BOOK
group by Books.NameBook
having count(Books.ID_BOOK)>all (select count(Books.ID_BOOK) from Books)
go