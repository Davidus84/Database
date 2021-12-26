
/* #29  Produce various reports to show which products are the best sellers (Both in quantity and total profit)*/

select ProductSupply.Quantity, ProductSupply.ProductID, SUM(ActualPrice*ProductSupply.Quantity) 
from ProductSupply, ProductPrice, SoldVia
where SoldDate > '2020-01-02' and SoldDate< '2021-11-12' and ProductSupply.ProductID = 'T236';



/* #21 Show what the total value of all inventory in stock is.  Show me the SQL  */

select sum(Quantity*ActualPrice +  StockQuantity*ActualPrice)
from ProductSupply, ProductPrice;



/* #28 Show how much it would cost if all the products that needed to be reordered were actually ordered - Need to see SQL, maybe use View.  Inquiry only no updates */

select sum(ActualPrice*Quantity)
from ProductPrice, ProductSupply
where Quantity <= ReOrderPoint;







/*## 7 'Like': Query to retrieve records for products who product name contains phrase 'plates'

select	*
from	Product
where	ProductName LIKE '%Plates%';

/* ##7 Aggregate: How many products does store offer for sale */

select COUNT(*) from Product;


/* Group by: For each customer , retrieve the CustomerID value and the total number of items bought within all sales 
transactions */

select CustomerID, SUM(Quantity)
from CustomerBought
Group By CustomerID ;

/***  *** */
/* Use Nested queries with IN - For each product whose items were sold in more than one sales transaction, 
retrieve the product id, product name and product price */

select ProductID, ProductName, ActualPrice
from Product
where ProductID IN
 (select ProductID
  from SoldVia
  Group by ProductID
  HAVING SUM(Quantity) > 4);
  
  /* ?????   **/
  /* Use some  Joins in a report showing inventory by area and quantity */

select StoreArea, ProductName, Quantity, StockQuantity
from Product, ProductSupply
group by StoreArea;



/* ** Having problems with drop statement ***/

/* Alter 1-2 Tables to add additional columns or to change existing columns - Review SQL */

alter TABLE SalesAssociateContactInformation ADD
	Discord	 char(20);

alter TABLE SalesAssociateContactInformation DROP (Discord);



/* Use at least 1  Check clause - Show me SQL with CHECK clause */

create TABLE Shoes
(BrandID VARCHAR (4), size int CHECK (size <=13),
PRIMARY key (BrandID));

INSERT into Shoes VALUES ('A313', 13);
INSERT into Shoes VALUES ('B122', 11);
INSERT into Shoes VALUES ('C315', 10);
INSERT into Shoes VALUES ('A312', 16);


/* Demonstrate using Trigger - Show me SQL for Trigger 

CREATE TRIGGER ProductInsertTrigger
	BEFORE INSERT ON Product
FOR EACH ROW
BEGIN
	DECLARE totalShelf INT DEFAULT 0;
    select COUNT(*)(DISTINCT shelf) INTO totalShelf
    from Product
    where shelf = new.shelf;
    if (totalShelf >= 10) then
		set new.shelf = NULL;
	end if;
end; */

/*  ????? to many entries */
/* Show the exact store location of any given product and quantity available.  What Area, Isle and shelf.  
Be able to change the Product and run query and Show Table with Data */

select ProductName, Quantity, StoreArea, Aisle, Shelf
from Product, ProductSupply
where ProductName = 'Paper towels'; 



/* Show how much was sold in a given day, week or month  by a given associate */

select sum(Quantity)
from SalesAssociate, SoldVia
where SalesAssociate.SalesAssociateID = 'E113' and SoldDate = '2020-05-19';

select sum(Quantity)
from SalesAssociate, SoldVia
where SalesAssociate.SalesAssociateID = 'E113' and SoldDate >= '2020-05-19'and SoldDate <= '2020-05-26';


/* How much was sold in the Store by day, week, month (with 1,2 or 3 queries) */

select sum(Quantity)
from CustomerBought
where BoughtDate = '2021-07-07';

select sum(Quantity)   
from CustomerBought
where BoughtDate >= '2020-05-08' and BoughtDate <= '2020-05-15';

select sum(Quantity)
from CustomerBought
where BoughtDate >= '2021-10-15' and BoughtDate <=  '2021-10-25';


/* Show all active managers   NOPE */

select sa.FirstName, sa.LastName, sah.Start_date, sappn.MobilePhone
from 	SalesAssociate sa, SalesAssociatePrimaryPhoneNumber sappn, SalesAssociateHistory sah
where sah.EmploymentStatus = 'Department Manager' or sah.EmploymentStatus = 'Store Manager' and sah.Termination_code = null;




/* List out all terminated associates and the reason they were terminated */

select distinct SalesAssociateID, Termination_reason
from SalesAssociateHistory
where Termination_code = 'A' or Termination_code = 'F';


/* Do a price increase for some types of products.  Will need to actually execute the update */

update	ProductPrice
set 	SalesPrice = 4.5
where	ProductID = 'T230';


/*Show what the total value of all inventory in stock is.  Show me the SQL */

select (ProductPrice*Quantitiy + ProductPrice*StockQuantity) AS Total_value
from 



/* 23. Add emergency  contact information to existing associate */

INSERT INTO SalesAssociateEmergencyContact VALUES ('Mike Davis', '571-222-4562',	'Brother',	'E103');


/* 24. Update some personal information on Associates.  EX) Change Wage or mark as terminated */

update SalesAssociate
set Birthdate = '2002-05-19'
where SalesAssociateID = 'E113';


/* 25. Show all the products with similar color or weight.  Be able to run for other color or weight */

select *
from Product
where ProductName LIKE '%Barbell%';



/* 26. Show all the products that are red, yellow and green (I only want to see these 3 colors)  */

select *
from Product
where Color like 'red' or Color like 'yellow' or Color like 'green';



/* 27. Produce a list of products that need to be ordered  (Make sure only a small subset of products need to be re-ordered)  */

select ProductID
from ProductSupply
where Quantity <= ReOrderPoint;



/*Show how much it would cost if all the products that needed to be reordered were actually ordered -
 Need to see SQL, maybe use View.  Inquiry only no updates	30	*/
 
 create view Products_need_reordering AS
 select 
 from Product, ProducePrice
 where (Quantity <= ReOrderPoint) 