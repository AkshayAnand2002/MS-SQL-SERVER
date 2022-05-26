--Return	the	FirstName	and	LastName	columns	from	Person.Person	where	the	
--FirstName	column	is	equal	to	“Mark”
---SELECT FirstName, LastName
---FROM Person.Person
---WHERE FirstName = 'Mark'
-- Find	the	top	100	rows	from	Production.Product	where	the	ListPrice	is	not	equal	to	0.00
---SELECT TOP 100 *
---FROM Production.Product
---WHERE ListPrice <> 0.00
--Return	all	rows	and	columns	from	the	view	HumanResources.vEmployee	where	the	
--employee’s	last	name	starts	with	a	letter	less	than	“D”
---SELECT *
---FROM HumanResources.vEmployee
---WHERE LastName < 'D'
--Using	the	Sales.vIndividualCustomer	view,	find	all	customers	with	a	
--CountryRegionName	equal	to	“Australia”	or	all	customers	who	have	a	
--PhoneNumberType	equal	to	“Cell”	and	an	EmailPromotion	column	value	equal	to	0.		
--(Hint:	the	correct	query	requires	the	use	of	parentheses	in	your	WHERE	clause)
---SELECT * 
---FROM Sales.vIndividualCustomer 
---WHERE CountryRegionName = 'Australia' OR 
---(PhoneNumberType = 'Cell' AND EmailPromotion = 0)
--Return	the	FirstName	and	LastName	columns	from	the	view	
--Sales.vIndividualCustomer	where	the	LastName	is	equal	to	“Smith”.		Give	the	
--column	alias	“Customer	First	Name”	and	“Customer	Last	Name”	to	the	FirstName	
--and	LastName	columns	respectively.
---SELECT
---FirstName AS "Customer	First	Name",
---LastName AS "Customer	Last	Name"
---FROM Sales.vIndividualCustomer
---WHERE LastName = 'Smith'
--Find	all	employees	from	the	view	HumanResources.vEmployeeDepartment	who	
--have	a	Department	column	value	in	the	list	of:	“Executive”,	“Tool	Design”,	and	
--“Engineering”.		Complete	this	query	twice	– once	using	the	IN	operator	in	the	
--WHERE	clause	and	a	second	time	using	multiple	OR	operators.
---SELECT * 
---FROM HumanResources.vEmployeeDepartment
---WHERE Department IN ('Executive','Tool Design','Engineering')
---SELECT * 
---FROM HumanResources.vEmployeeDepartment
---WHERE Department = 'Executive' OR Department = 'Tool Design' OR Department = 'Engineering'
--Retrieve	the	top	500	rows	from	the	HumanResources.Employee	table.		Return	the	
--NationalIDNumber,	JobTitle	and	BirthDate	columns.		Give	the	NationalIDNumber	
--column	an	alias,	“SSN”,	and	the	JobTitle	column	an	alias,	“Job	Title”
---SELECT TOP 500
---NationalIDNumber AS SSN,
---JobTitle AS [Job Title],
---BirthDate
---FROM HumanResources.Employee
-- Return	the	top	50	percent	of	rows	and	all	columns	from	the	Sales.Customer	table
---SELECT TOP 50 PERCENT *
---FROM Sales.Customer
--Return	the	Name	column	from the Production.vProductAndDescription view.		Give	
--this	column	an	alias	“Product’s	Name”.
---SELECT Name AS [Product's Name]
---FROM Production.vProductAndDescription
-- Return	the	top	1500 rows	and	columns	from	the	view	named Sales.vPersonDemographics
---SELECT TOP 1500	*
---FROM Sales.vPersonDemographics
/*1) Using	the	Person.Person	and	Person.Password	tables,	INNER	JOIN	the	two	tables	
using	the	BusinessEntityID	column	and	return	the	FirstName	and	LastName	
columns	from	Person.Person	and	then	PasswordHash	column	from	
Person.Password*/
--SELECT
--P.FirstName,
--P.LastName,
--PP.PasswordHash
--FROM Person.Person P
--INNER JOIN Person.[Password] PP
--ON PP.BusinessEntityID = P.BusinessEntityID
/*2) Join	the	HumanResources.Employee	and	the	
HumanResources.EmployeeDepartmentHistory	tables	together	via	an	INNER	JOIN	
using	the	BusinessEntityID	column.		Return	the	BusinessEntityID,	
NationalIDNumber	and	JobTitle	columns	from	HumanResources.Employee	and	the	
DepartmentID,	StartDate,	and	EndDate	columns	from	
HumanResources.EmployeeDepartmentHistory.		Notice	the	number	of	rows	
returned.		Why	is	the	row	count	what	it	is?*/
--SELECT
--E.BusinessEntityID,
--E.NationalIDNumber,
--E.JobTitle,
--EDH.DepartmentID,
--EDH.StartDate,
--EDH.EndDate
--FROM HumanResources.Employee E
--INNER JOIN  HumanResources.EmployeeDepartmentHistory EDH
--ON E.BusinessEntityID = EDH.BusinessEntityID
/*
Since	the	HumanResources.Employee	table	has	290	rows,	you	might	expect the	INNER	JOIN	
of	that	table	with	HumanResources.EmployeeDepartmentHistory	would	have	no	more	than	
290	rows.		However,	there	are	multiple	instances	of	a	few	BusinessEntityID	values	in	
HumanResources.EmployeeDepartmentHistory.		Instead	of	matching	a	single row	from	
HumanResources.Employee	to	a	single	row	in	
HumanResources.EmployeeDepartmentHistory,	a	row	in	HumanResources.Employee	is	
matching	to	potentially	two	rows.		This	means	that	multiple	rows	are	returned	for	the	
duplicate	BusinessEntityID	values.		The lowest	level	of	detail	of	uniqueness	is	often	referred	
to	as	the	grain of	a	table.		Making	sure	that	your	joins	account	for	potential	grain	differences	
is	critical	to	produce	proper	queries.
*/
/*3) Expand	upon	the	query	used	in	question	1.	Using	the	existing	query,	add	another	
INNER	JOIN	to	the	Person.EmailAddress	table	and	include	the	EmailAddress	column	
in	your	select	statement.*/
--SELECT
--P.FirstName,
--P.LastName,
--PP.PasswordHash,
--E.EmailAddress
--FROM Person.Person P
--INNER JOIN Person.[Password] PP
--ON PP.BusinessEntityID = P.BusinessEntityID
--INNER JOIN Person.EmailAddress E
--ON E.BusinessEntityID = P.BusinessEntityID
/* 4) Using	the	Book,	BookAuthor	and	Author	tables,	join	them	together	so	that	you	
return	the	Title	and	ISBN	columns	from	Book	and	the	AuthorName	column	from	
Author.		(Hint:	You	must	start	with	the	BookAuthor	table	in	your	FROM	clause	even	
though	we	will	not	be	returning	any	columns	from	this	table)*/
--SELECT
--B.Title,
--B.ISBN,
--A.AuthorName
--FROM BookAuthor BA
--INNER JOIN Book B
--ON B.BookID = BA.BookID
--INNER JOIN Author A
--ON A.AuthorID = BA.AuthorID
/*
5) Using	the	query	from	example	4,	add	another	INNER	JOIN	that	joins	the	Publisher	
table	with	your	query.		Return	the	PublisherName	column	from	this	table.		So,	you	
should	return	the	Title	and	ISBN	columns	from	Book,	the	AuthorName	column	from	
Author,	and	the	PublisherName	column	from	Publisher.		(Hint:	this	will	require	
three	separate	INNER	JOINs)
*/
--SELECT
--B.Title,
--B.ISBN,
--A.AuthorName,
--P.PublisherName
--FROM BookAuthor BA
--INNER JOIN Book B
--ON B.BookID = BA.BookID
--INNER JOIN Author A
--ON A.AuthorID = BA.AuthorID
--INNER JOIN Publisher P
--ON P.PublisherID = B.PublisherID
/* From	the	Sales.vIndividualCustomer	view,	return	the	FirstName,	LastName	and	
CountryRegionName	columns	for	those	rows	with a	CountryRegionName	that	is	
either	“United	States”	or	“France”.		Sort	the	results	by	the	CountryRegionName	
column	in	ascending	order.	*/
/*SELECT
FirstName,
LastName,
CountryRegionName
FROM Sales.vIndividualCustomer
WHERE CountryRegionName IN ('United	States', 'France')
ORDER BY CountryRegionName
*/
/* From	the	Sales.vStoreWithDemographics	view,	return	the	Name,	AnnualSales,	
YearOpened,	SquareFeet,	and	NumberEmployees	columns.		Give	the	SquareFeet	
column	the	alias	“Store	Size”	and	the	NumberEmployees	column	the	alias	“Total	
Employees”.		Return	only	those	rows	with	AnnualSales	greater	than	1,000,000	and	
with	NumberEmployees	greater	than	or	equal	to	45.		Order	your	results by	the	
“Store	Size”	alias	in	descending	order	and	then	by	the	“Total	Employees”	alias	in	
descending	order.*/
/*
SELECT
Name,
AnnualSales,
YearOpened,
SquareFeet AS [Store	Size],
NumberEmployees AS [Total	Employees]
FROM Sales.vStoreWithDemographics
WHERE AnnualSales > 1000000
AND NumberEmployees >= 45
ORDER BY [Store	Size] DESC, [Total	Employees] DESC
*/
/*Find	all	customers	from	the	view	Sales.vIndividualCustomer	whose	LastName	is	
either	“Lopez”,	“Martin”,	or	“Wood”	and	whose	FirstName	starts	with	any	letter	
between	“C”	and	“L”	in	the	alphabet.	(Hint:	multiple	wildcard	characters	will	be	used	
in	this	query)
*/
/*
SELECT *
FROM Sales.vIndividualCustomer
WHERE LastName IN ('Lopez', 'Martin', 'Wood') AND
FirstName LIKE '[C-L]%'
*/
/*Find	all	customers	from	the	view	Sales.vIndividualCustomer	whose	LastName	starts	
with	the	letter	“R”.		(Hint:	a	wildcard	character	can	assist	you	with	this	query)*/
/*
SELECT *
FROM Sales.vIndividualCustomer
WHERE LastName LIKE 'R%'*/
/* Return	all	columns	from	the	Sales.SalesOrderHeader	table	for	all	sales	that	are	
associated	with	a	sales	person.		That	is,	return	all	rows	where	the	SalesPersonID	
column	does	not	contain	a	NULL	value.*/
/*
SELECT *
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL
*/
/*Return	the	SalesPersonID	and	TotalDue	columns	from	Sales.SalesOrderHeader	for	
all	sales	that	do	not	have	a	NULL	value	in	the	SalesPersonID	column	and	whose	
TotalDue	value	exceeds	$70,000.
*/
/*
SELECT
SalesPersonID,
TotalDue
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL
AND TotalDue > 70000
*/
/*Using	HumanResources.vEmployeeDepartment,	find	all	employees	who	have	a	
StartDate	between	July	1,	2000	and	June	30,	2002.		Complete	this	query	twice	– once	
using	the	BETWEEN	operator	and	then	by	using	a	combination	of	the	“greater	than	
or	equal	to” and	“less	than	or	equal	to” operators.*/
/*
SELECT *
FROM HumanResources.vEmployeeDepartment
WHERE StartDate BETWEEN '7/1/2000' AND '6/30/2002'
SELECT *
FROM HumanResources.vEmployeeDepartment
WHERE StartDate >= '7/1/2000' AND StartDate <= '6/30/2002'
*/
/* Execute a literal select statement that returns your name.*/
--SELECT 'FirstName LastName'
/* Write the literal select statement that evaluates the product of 7 and 4.*/
---SELECT 7*4
--Write a literal select statement that returns the phrase “Brewster’s SQL Training 
--Class”. (Hint: note the single apostrophe in the string)
--SELECT 'Brewster''s SQL Training Class'
/*Execute a literal SELECT statement that returns the phrase “Day 1 of Training” in 
one column and the result of 5*3 in another column.*/
--SELECT 'Day 1 of Training', 5*3
--Write the literal select statement that takes the difference of 7 and 4 then multiplies that difference by 8.--SELECT (7-4)*8/* Find	the	total	sales	by	territory	for	all	rows	in	the	Sales.SalesOrderHeader	table.		
Return	only	those	territories	that	have	exceeded	$10	million	in	historical	sales.		
Return	the	total	sales	and	the	TerritoryID	column.*/
/*SELECT
TerritoryID,
SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
GROUP BY TerritoryID
HAVING SUM(TotalDue) > 10000000
*/
/* Using	the	query	from	the	previous	question,	join	to	the	Sales.SalesTerritory	table	
and	replace	the	TerritoryID	column	with	the	territory’s	name.*/
/*SELECT
ST.Name AS TerritoryName,
SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader SOH
LEFT OUTER JOIN Sales.SalesTerritory ST
ON ST.TerritoryID = SOH.TerritoryID
GROUP BY ST.Name
HAVING SUM(TotalDue) > 10000000
*/
/*Using	the	Production.Product	table,	find	how	many	products	are	associated	with	
each	color.		Ignore	all	rows	where	the	color	has	a	NULL	value.		Once	grouped,	return	
to	the	results	only	those	colors	that	had	at	least	20	products	with	that color.*/
/*
SELECT
Color,
COUNT(*) AS ProductCount
FROM Production.Product
WHERE Color IS NOT NULL
GROUP BY Color
HAVING COUNT(*) >= 20
*/
/*Starting	with	the	Sales.SalesOrderHeader	table,	join	to	the	Sales.SalesOrderDetail	
table.		This	table	contains	the	line	item	details	associated	with	each	sale.		From	
Sales.SalesOrderDetail,	join	to	the	Production.Product	table.		Return	the	Name	
column	from	Production.Product	and	assign	it	the	column	alias	“Product	Name”.		
For	each	product,	find	out	how	many	of	each	product	was	ordered	for	all	orders	that	
occurred	in	2006.		Only	output	those	products	where	at	least	200	were	ordered.*/
/*
SELECT
P.Name AS [Product	Name],
SUM(SOD.OrderQty) AS ProductOrderCount
FROM Sales.SalesOrderHeader SOH
INNER JOIN Sales.SalesOrderDetail SOD
ON SOD.SalesOrderID = SOH.SalesOrderID
INNER JOIN Production.Product P
ON P.ProductID = SOD.ProductID
WHERE SOH.OrderDate BETWEEN '1/1/2006' AND '12/31/2006'
GROUP BY P.Name
HAVING SUM(SOD.OrderQty) >= 200
*/
/* Find	the	first	and	last	name	of	each	customer	who	has	placed	at	least	6	orders	
between	July	1,	2005	and	December	31,	2006.		Order	your	results	by	the	number	of	
orders	placed	in	descending	order.		(Hint:	You	will	need	to	join	to	three	tables	–
Sales.SalesOrderHeader,	Sales.Customer,	and	Person.Person.		You	will	use	every	
clause	to	complete	this	query).*/
/*
SELECT
P.FirstName,
P.LastName,
COUNT(*) AS OrdersPlaced
FROM Sales.SalesOrderHeader SOH
INNER JOIN Sales.Customer C
ON C.CustomerID = SOH.CustomerID
INNER JOIN Person.Person P
ON P.BusinessEntityID = C.PersonID
WHERE OrderDate BETWEEN '7/1/2005' AND '12/31/2006'
GROUP BY P.FirstName, P.LastName
HAVING COUNT(*) >= 6
ORDER BY OrdersPlaced DESC
*/
/* Using	Sales.SalesOrderHeader,	how	many	sales	occurred	in	each	territory	between	
July	1,	2005	and	December	31,	2006?		Order	the	results	by	the	sale	count	in	
descending	order.*/
/*
SELECT
TerritoryID,
COUNT(*) AS SalesCount
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '7/1/2005' AND '12/31/2006'
GROUP BY TerritoryID
*/
/* Expanding	on	the	previous	example,	group	the	results	not	by	the	TerritoryID	but	by	
the	name	of	the	territory	(found	in	the	Sales.SalesTerritory	table).*/
/*
SELECT
ST.Name AS TerritoryName,
COUNT(*) AS SalesCount
FROM Sales.SalesOrderHeader SOH
LEFT OUTER JOIN Sales.SalesTerritory ST
ON ST.TerritoryID = SOH.TerritoryID
WHERE OrderDate BETWEEN '7/1/2005' AND '12/31/2006'
GROUP BY ST.Name
*/
/* Using	only	one	query,	find	out	how	many	products	in	Production.Product	are	the	
color	“red”	and	how	many	are	“black”.*/
/*
SELECT
Color,
COUNT(*) AS ProductCount
FROM Production.Product
WHERE Color IN ('Red', 'Black')
GROUP BY Color
*/
/* Using	the	Book,	BookAuthor,	Author	and/or	Publisher	tables,	identify	how	many	
books	each	author	either	wrote	or	co-authored.*/
/*
SELECT
A.AuthorName,
COUNT(*) AS BookCount
FROM BookAuthor BA
INNER JOIN Author A
ON A.AuthorID = BA.AuthorID
GROUP BY A.AuthorName
*/
-- In	the	Person.Person	table,	how	many	people	are	associated	with	each	PersonType?
/*
SELECT
PersonType,
COUNT(*) AS PersonCount
FROM Person.Person
GROUP BY PersonType
*/