create database iii;
use iii;
create table Customers (
    cId int primary key auto_increment,
    cName varchar(100),
    cphone varchar(50),
    cEmail varchar(100),
    cAddress varchar (100),
    unique(cPhone));

create table Suppliers (
    supId int primary key auto_increment,
    supName varchar(100),
    supPhone varchar(50),
    supAddress varchar (100),
    unique(supPhone));

create table Products (
    pId int primary key auto_increment,
    pNum int(11),
    pName varchar(100),
    unitPrice int(11),
    supId int(11),
    unique(pNum); 
    foreign key (supId) references Suppliers(supId));

create table Orders (
    ordId int primary key auto_increment,
    ordNum int(11),
    cId int(11),
    unique(ordNum),
    foreign key (cId) references Customers(cId));

create table OrderDetails (
    odId int primary key auto_increment,
    ordNum int (11),
    pId int(11),
    realPrice int (11),
    quantity int (11),
    foreign key (ordNum) references Orders(ordNum),
    foreign key (pId) references Products(pId));

\d # 
create procedure addCustomer(
    newName varchar(100),
    newPhone varchar(50),
    newEmail varchar(100),
    newAddress varchar(100))
begin
    declare continue handler for sqlstate '23000'
    begin
        select 'Error';
    end;
    insert into Customers (cName,cphone,cEmail,cAddress) 
    values (newName,newPhone,newEmail,newAddress);
    select 'Success';
end #
\d;

\d # 
create procedure deleteCustomer(delId int)
begin
    delete from Customers where cId = delId;
end #
\d;

\d # 
create procedure updateCustomer( 
    newName varchar(100),
    newPhone varchar(50),
    newEmail varchar(100),
    newAddress varchar(100),
    updateID int)
begin
    set @name = newName;
    set @phone = newPhone;
    set @email = newEmail;
    set @address = newAddress;
    set @id = updateID;
    set @query = 'update Customers set cName=?,cPhone=?,cEmail=?,
        cAddress=? where cId = ?';
    prepare stmt from @query ;
    execute stmt using @name ,@phone ,@email ,@address ,@id ;
end #
\d;

\d #
create procedure searchCustomer(in kw varchar(100))
begin
    set @key = concat('%',kw ,'%') COLLATE utf8_unicode_ci;
    set @query = 'select * from Customers where cname like ? or cphone like ?';
    prepare stmt from @query;
    execute stmt using @key ,@key;
end #
\d;

\d # 
create procedure addSupplier(
    newName varchar(100),
    newPhone varchar(50),
    newAddress varchar(100))
begin
    declare continue handler for sqlstate '23000'
    begin
        select 'Error';
    end;
    insert into Suppliers (supName,supPhone,supAddress) 
    values (newName,newPhone,newAddress);
    select 'Success';
end #
\d;

\d # 
create procedure deleteSupplier(delId int)
begin
    delete from Suppliers where supId = delId;
end #
\d;

\d # 
create procedure updateSupplier( 
    newName varchar(100),
    newPhone varchar(50),
    newAddress varchar(100),
    updateID int)
begin
    set @name = newName;
    set @phone = newPhone;
    set @address = newAddress;
    set @id = updateID;
    set @query = 'update Suppliers set supName=?,supPhone=?,
        supAddress=? where supId = ?';
    prepare stmt from @query ;
    execute stmt using @name ,@phone ,@address ,@id ;
end #
\d;

\d #
create procedure searchSupplier(in kw varchar(100))
begin
    set @key = concat('%',kw ,'%') COLLATE utf8_unicode_ci;
    set @query = 'select * from Suppliers where supname like ? or supphone like ?';
    prepare stmt from @query;
    execute stmt using @key ,@key;
end #
\d;

\d # 
create procedure addProduct(
    newNum int,
    newName varchar(100),
    Price int,
    newsupId int)
begin
    declare continue handler for sqlstate '23000'
    begin
        select 'Error';
    end;
    insert into Products (pNum,pName,unitPrice,supId) 
    values (newNum,newName,Price,newsupId);
    select 'Success';
end #
\d;

\d # 
create procedure deleteProduct(delId int)
begin
   delete from Products where pId = delId;
end #
\d;

\d #
create procedure updateProduct(
    newNum int,
    newName varchar(100),
    newPrice int,
    newsupId int,
    updateID int)
begin
    set @num = newNum;
    set @name = newName;
    set @price = newPrice;
    set @supid = newsupId;
    set @id = updateID;
    set @query = 'update Products set pNum=?,pName=?,unitPrice=?,
        supId=? where pId = ?';
    prepare stmt from @query ;
    execute stmt using @num ,@name ,@price ,@supId ,@id ;
end #
\d;

\d # 
create procedure addOrders(
    newOrdNum int,
    newCId int)
begin
   insert into Orders (ordNum,cId) values (newOrdNum,newCId);
end #
\d;

\d # 
create procedure deleteOrders(deleteOrdNum int)
begin
   delete from Orders where ordNum = deleteOrdNum;
end #
\d;
