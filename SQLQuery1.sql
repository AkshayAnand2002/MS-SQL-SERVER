--Retrieve	all	rows	from	the	HumanResources.Employee	table.	Return	only	the	NationalIDNumber	column.
---SELECT NationalIDNumber 
---FROM HumanResources.Employee
--Retrieve	all	rows	from	the	HumanResources.Employee	table.	Return	the	NationalIDNumber	and	JobTitle	columns.
---SELECT NationalIDNumber,JobTitle 
--FROM HumanResources.Employee
--Get Total No. of rows in table.
---SELECT COUNT(*) AS COUNT_TOTAL
---FROM HumanResources.Employee
--Retrieve	the	top	20	percent	of	rows	from	the	HumanResources.Employee	table.		
--Return	the	NationalIDNumber,	JobTitle	and	BirthDate	columns.
---SELECT TOP 20 PERCENT 
---NationalIDNumber , JobTitle , BirthDate
---FROM HumanResources.Employee
-- Using	the	Person.Person	and	Person.Password	tables,	INNER	JOIN	the	two	tables	
--using	the	BusinessEntityID	column	and	return	the	FirstName	and	LastName	
--columns	from	Person.Person	and	then	PasswordHash	column	from	
--Person.Password
---SELECT
---P.FirstName,
---P.LastName,
---PP.PasswordHash
---FROM Person.Person P 
---INNER JOIN Person.[Password] PP
---ON PP.BusinessEntityID = P.BusinessEntityID
--Return	the	BusinessEntityID	and	SalesYTD	column	from	Sales.SalesPerson.		Join	this	
--table	to	the	Sales.SalesTerritory	table	in	such	a	way	that	every	in	Sales.SalesPerson	
--will	be	returned	regardless	of	whether	or	not	they	are	assigned	to	a	territory.		Also,	
--return	the	Name	column	from	Sales.SalesTerritory.		Give	this	column	the	column	
--alias	�Territory	Name�.
---SELECT
---SP.BusinessEntityID,
---SP.SalesYTD,
---ST.Name AS [TerritoryName]
---FROM Sales.SalesPerson SP
---LEFT OUTER JOIN Sales.SalesTerritory ST
---ON ST.TerritoryID = SP.TerritoryID
-- How	many	rows	are	in	the	Person.Person	table?		Use	an	aggregate	function	NOT	�SELECT	*�.
---SELECT COUNT(*)
---FROM Person.Person
--How	many	rows	in	the	Person.Person	table	do	not	have	a	NULL	value	in	the	MiddleName	column?
---SELECT COUNT(MiddleName)
---FROM Person.Person
--What	is	the	average	StandardCost	(located	in	Production.Product)	for	each	product	where	the	StandardCost	is	greater	than	$0.00?
---SELECT AVG(StandardCost)
---From Production.Product
---WHERE StandardCost > 0
--What	is	the	average	Freight	amount	for	each	sale	(found	in	Sales.SalesOrderHeader)	where	the	sale	took	place	in	TerritoryID	4?
---SELECT AVG(Freight)
---FROM Sales.SalesOrderHeader
---WHERE TerritoryID=4
-- How	expensive	is	the	most	expensive	product,	by	ListPrice,	in	the	table Production.Product?
---SELECT MAX(ListPrice)
---FROM Production.Product
-- Join	the	Production.Product	table	and	the	Production.ProductInventory	table	for	
--only	the	products	that	appear	in	both	table.		Use	the	ProductID	as	the	joining	
--column.		Production.ProductInventory	contains	the	quantity	of	each	product	
--(several	rows	can	appear	for	each	product	to	indicate	the	product	appears	in	
--multiple	locations).		Your	goal	is	to	determine	how	much	money	we	would	earn	if	
--we	sold	every	product	for	its	list	price for	each	product	with	a	ListPrice	greater	than	
--$0.		That	is,	if	you	summed	the	product	of	each	product�s	inventory	by	its	list	price,	
--what	would	that	value	be?		(Hint:	This	is	intentionally	challenging.		You	must	use	an	
--aggregate	function	with	a	mathematical	expression	to	accomplish	your	goal)
---SELECT SUM(P.ListPrice * I.Quantity)
---FROM Production.Product P
---INNER JOIN Production.ProductInventory I
---ON I.ProductID = P.ProductID
---WHERE P.ListPrice > 0
--From	the	HumanResources.vEmployeeDepartment	view,	return	the	FirstName,	
--LastName	and	JobTitle	columns. Sort	the	results	by	the	FirstName	column	in	
--ascending	order.
---SELECT 
---FirstName , 
---LastName , 
---JobTitle 
---FROM HumanResources.vEmployeeDepartment
---ORDER BY FirstName ASC
--1) Return	the	BusinessEntityID	and	SalesYTD	column	from	Sales.SalesPerson.		Join	this	
--table	to	the	Sales.SalesTerritory	table	in	such	a	way	that	every	in	Sales.SalesPerson	
--will	be	returned	regardless	of	whether	or	not	they	are	assigned	to	a	territory.		Also,	
--return	the	Name	column	from	Sales.SalesTerritory.		Give	this	column	the	column	
--alias	�Territory	Name�.
--2) Using	the	previous	example	as	your	foundation,	join	to	the	Person.Person	table	to	
--return	the	sales	person�s	first	name	and	last	name.		Now,	only	include	those	rows	
--where	the	territory�s	name	is	either	�Northeast�	or	�Central�
---BELOW IS THE ANSWER FOR 2)
---SELECT
---P.FirstName,
---P.LastName,
---SP.BusinessEntityID,
---SP.SalesYTD,
---ST.Name AS [Territory	Name]
---FROM Sales.SalesPerson SP
---LEFT OUTER JOIN Sales.SalesTerritory ST
---ON ST.TerritoryID = SP.TerritoryID
---INNER JOIN Person.Person P
---ON P.BusinessEntityID = SP.BusinessEntityID
---WHERE ST.Name IN ('Northeast', 'Central')
---ANSWER FOR 1)
---SELECT
---SP.BusinessEntityID,
---SP.SalesYTD,
---ST.Name AS [Territory	Name]
---FROM Sales.SalesPerson SP
---LEFT OUTER JOIN Sales.SalesTerritory ST
---ON ST.TerritoryID = SP.TerritoryID
--Return	the	Name	and	ListPrice	columns from	Production.Product.		For	each	product,	
--regardless	of	whether	or	not	it	has	an	assigned	ProductSubcategoryID,	return	the	
--Name	column	from	Product.ProductSubcategory	for	each	product.		Then,	return	the	
--Name	column	from	Production.ProductCategory	for	each	row.		Give	the	Name	
--column	from	Production.Product	the	alias	�ProductName�,	the	Name	column	from	
--Production.ProductSubcategory	the	alias	�ProductSubcategoryName�,	and	the	Name	
--column	from	Production.ProductCategory	the	alias	�ProductCategoryName�.		Order	
--the	results	by	the	�ProductCategoryName�	in	descending	order	and	then	the	
--�ProductSubcategoryName�	in	ascending	order.
---SELECT
---P.Name,
---P.ListPrice,
---SC.Name AS ProductSubcategoryName,
---C.Name AS ProductCategoryName
---FROM Production.Product P
---LEFT OUTER JOIN Production.ProductSubcategory SC
---ON SC.ProductSubcategoryID = P.ProductSubcategoryID
---LEFT OUTER JOIN Production.ProductCategory C
---ON C.ProductCategoryID = SC.ProductCategoryID
---ORDER BY ProductCategoryName DESC , ProductSubcategoryName ASC
--sort the	results	by	the	FirstName	column	in	
--ascending	order	and	then	by	the	LastName	column	in	descending	order From	the	HumanResources.vEmployeeDepartment	view.
---SELECT
---FirstName,
---LastName,
---JobTitle
---FROM HumanResources.vEmployeeDepartment
---ORDER BY FirstName, LastName DESC
--From	the	Sales.vIndividualCustomer	view,	return	the	FirstName,	LastName	and	
--CountryRegionName	columns.		Sort	the	results	by	the	CountryRegionName	column.		
--Use	the	column	ordinal	in	the	ORDER	BY	clause.
---SELECT
---FirstName,
---LastName,
---CountryRegionName
---FROM Sales.vIndividualCustomer
---ORDER BY 3
--From	the	Sales.vIndividualCustomer	view,	return	the	FirstName,	LastName	and	
--CountryRegionName	columns	for	those	rows	with a	CountryRegionName	that	is	
--either	�United	States�	or	�France�.		Sort	the	results	by	the	CountryRegionName	
--column	in	ascending	order.	
---SELECT
---FirstName,
---LastName,
---CountryRegionName
---FROM Sales.vIndividualCustomer
---WHERE CountryRegionName IN ('United	States', 'France')
---ORDER BY CountryRegionName
--From	the	Sales.vStoreWithDemographics	view,	return	the	Name,	AnnualSales,	
--YearOpened,	SquareFeet,	and	NumberEmployees	columns.		Give	the	SquareFeet	
--column	the	alias	�Store	Size�	and	the	NumberEmployees	column	the	alias	�Total	
--Employees�.		Return	only	those	rows	with	AnnualSales	greater	than	1,000,000	and	
--with	NumberEmployees	greater	than	or	equal	to	45.		Order	your	results by	the	
--�Store	Size�	alias	in	descending	order	and	then	by	the	�Total	Employees�	alias	in	
--descending	order.
---SELECT
---Name,
---AnnualSales,
---YearOpened,
---SquareFeet AS [StoreSize],
---NumberEmployees AS [Total Employees]
---FROM Sales.vStoreWithDemographics
---WHERE AnnualSales > 1000000
---AND NumberEmployees >=45
---ORDER BY [StoreSize] DESC , [Total Employees] DESC
--Return	the	FirstName	and	LastName	columns	from	Person.Person	where	the	
--FirstName	column	is	equal	to	�Mark�
---SELECT FirstName, LastName
---FROM Person.Person
---WHERE FirstName = 'Mark'