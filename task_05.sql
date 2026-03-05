
/*ejercicio 1*/

/*ejercicio 2*/
insert into classicmodels.payments(customerNumber, checkNumber, paymentDate, amount) 
values(124,'H123','2024-02-06',845.00);

insert into classicmodels.payments(customerNumber, checkNumber, paymentDate, amount) 
values(151,'H124','2024-02-07',70.00);

insert into classicmodels.payments(customerNumber, checkNumber, paymentDate, amount) 
values(112,'H125','2024-02-05',1024.00);

/*ejercicio 3*/

update classicmodels.customers set city='Girona', addressLine1='43 State St', 	postalCode='17001' 
 where customerNumber=141;

update classicmodels.customers set city='Lleida', addressLine1='2 Walls St', 	postalCode='25002'  
where customerNumber=124;

update classicmodels.customers set city='Tarragona', addressLine1='46 Marlborough 	Rd.', 	postalCode='43003'  
where customerNumber=119;

/*ejercicio 4*/

update classicmodels.orders set  shippedDate= curdate(), status='Cancelled', comments='Order cancelled due to delay' where orderNumber = 
(select orderNumber from(select orderNumber from orders where shippedDate ='2003-09-24')as sub_consulta);

/*ejercicio 5*/

update classicmodels.products set productName=(concat(productName,' (',productCode,')')) where productName ='Trains';

/*ejercicio 6*/

update classicmodels.products set buyPrice = (buyprice*0.02), MSRP=(MSRP*0.02) where quantityInStock>500;

/*ejercicio 7*/

delete from classicmodels.payments where customerNumber in (select c.customerNumber from customers c join employees e on c.salesRepEmployeeNumber= e.employeeNumber where e.lastName ='Patterson');


/*ejercicio 8*/

delete from classicsmodels.customers where customerNumber  in(select c.customerNumber 
from customers c left join payments p on c.customerNumber=p.customerNumber where p.customerNumber is null) ;

/*ejercicio 9*/
insert into classicmodels.employees(employeeNumber, lastName, firstName, extension, email, officeCode, jobTitle) 
select customerNumber+2000, contactLastName, contactFirstName, 'x0000', 'new@company.com','1', 'Sales Rep' from classicmodels.customers;

/*ejercicio 10*/

update classicmodels.orders set shippedDate=curdate(), status='Canceled', 
comments='Order cancelled by management' where customerNumber in
(select customerNumber from classicmodels.customers where contactFirstName ='Elizabeth' and contactLastName='Lincoln' );

