use showroom;
create table Products(
 id int primary key auto_increment,
     productCode int(8),
    productName varchar(50),
     productPrice int(20),
    productAmount int(11),
     productDescription varchar(255),
    productStatus varchar(50));
    
    insert into Products(productCode,productName,productPrice,productAmount,productDescription,productStatus)
     values (1001,'TV',10000000,300000,'Tra gop','Da Ban'),
    (2002,'Tu Lanh',50000000,20000000,'Tra gop','Da thanh toan xong'),
     (3001,'TV',10000000,300000,'Tra gop','Da Ban'),
     (4001,'TV',10000000,300000,'Tra gop','Da Ban'),
     (5002,'Tu Lanh',5000000,3000000,'Tra gop','Da Thanh toan xong'),
     (6003,'May Giat',10000000,10000000,'Thanh toan het','Da giao hang thanh cong');
     describe Products;
     select * from products;
	
     create unique index idx_proCode on products(productCode);
     create index idx_codeName on products(productCode,productName);	
     explain select * from products where productCode = 6003;
     create view test_view as select productCode, productName, productPrice, productStatus from products;
     select * from test_view;
     delete from test_view where productCode = 1001;
     alter view test_view as select productCode, productName, productPrice, productStatus 
     from products where productStatus = 'Da ban';
     select * from test_view;
     drop view test_view;
     delimiter //
     create procedure findAll()
     begin
     select*from products;
     end;//
     delimiter //
     call findAll();
     
	delimiter //
    create procedure addProduct(In productCode int(8),
    In productName varchar(50),
     In productPrice int(20),
    In productAmount int(11),
     In productDescription varchar(255),
    In productStatus varchar(50))
    begin 
    insert into products values (productCode,productName,productPrice,productAmount,productDescription,productStatus);
    end;//
    delimiter //
    
    delimiter //
    create procedure editProduct( In productCode int(8), In productName varchar(50),
     In productPrice int(20),
    In productAmount int(11),
     In productDescription varchar(255),
    In productStatus varchar(50))
    begin
	update products set products.productName = productName, products.productPrice = productPrice,
    products.productAmount = productAmount, products.productDescription = productDescription, products.productStatus = productStatus
    where products.productCode = productCode;
    end; //
    delimiter //
    call findAll();
    call editProduct(2002, 'Dien thoai',10000,20000,'cho luon','het hang');
    
    delimiter /
    create procedure deletePro( in id int)
    begin 
    delete from products where productCode = id;
    end /
    call findAll();
    call deletePro(2002);
     
     