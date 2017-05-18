show databases;
use CSP;
show tables;

CREATE TABLE product(
id INT NOT NULL,
nam VARCHAR(100) NOT NULL,
cond VARCHAR(40) NOT NULL,
price INT NOT NULL,
category VARCHAR(100) NOT NULL,
image VARCHAR(40) NOT NULL
);


select * from Registration;
select * from product;
select * from CustOrder;
delete from product;	

drop table product;

Create database BlueWings_DB;
use BlueWings_DB;

create table Flight_Info
	(
	Fid varchar(5) PRIMARY KEY NOT NULL, 
	Fsource varchar(100) NOT NULL, 
	Fdestination varchar(100) NOT NULL,
	Fdep varchar(40) NOT NULL,
	Farrival varchar(40) NOT NULL, 
	Ftype varchar(100) NOT NULL,
	Fcost DECIMAL(8,3) NOT NULL,
	Fcapacity INT NOT NULL
	);
    
INSERT INTO flight_info
	(Fid,
	Fsource,
	Fdestination,
	Fdep,
	Farrival,
	Ftype,
	Fcost_E,
	Fcapacity,
    Fcost_B)
	VALUES
	("A136","Bakersfield","San Jose","11:00 AM","01:30 PM","Domestic",360,150,460),
	("A137","San Jose","Bakersfield","09:30 AM","11:30 AM","Domestic",350,120,350),
	("A138","San Jose","Bakersfield","01:30 PM","03:30 PM","Domestic",390,150,490),
	("A139","Bakersfield","San Jose","05:30 PM","07:30 PM","Domestic",400,150,500),	
	("A140","New Orleans","Columbus","06:30 AM","09:30 AM","Domestic",280,150,380),
	("A141","Columbus","New Orleans","08:00 AM","11:30 AM","Domestic",270,150,370),
	("A142","New Orleans","Columbus","05:30 PM","08:30 PM","Domestic",290,150,390),
	("A143","Columbus","New Orleans","06:45 PM","10:15 PM","Domestic",270,150,370),
    ("A144","Springfield","Boulder City","11:00 AM","01:30 PM","Domestic",360,150,460),
	("A145","Boulder City","Springfield","09:30 AM","11:30 AM","Domestic",350,120,350),
	("A146","Boulder City","Springfield","01:30 PM","03:30 PM","Domestic",390,150,490),
	("A147","Springfield","Boulder City","05:30 PM","07:30 PM","Domestic",400,150,500),	
	("A148","Syracuse","Santa Fe","06:30 AM","09:30 AM","Domestic",280,150,380),
	("A149","Santa Fe","Syracuse","08:00 AM","11:30 AM","Domestic",270,150,370),
	("A150","Santa Fe","Syracuse","05:30 PM","08:30 PM","Domestic",290,150,390);
    

INSERT INTO flight_info
	(Fid,
	Fsource,
	Fdestination,
	Fdep,
	Farrival,
	Ftype,
	Fcost_E,
	Fcapacity,
    Fcost_B)
	VALUES
	("A133","Boston","Bohemia-NY","11:00 AM","01:30 PM","Domestic",360,150,460),
	("A134","New York","Cincinatti-CI","09:30 AM","11:30 AM","Domestic",350,120,450);	

CREATE TABLE user_details
(
 Fname varchar(255), 
 Lname varchar(255),  
 email varchar(255),  
 uname varchar(255) PRIMARY KEY, 
 pass varchar(255), 
 u_type varchar(255)
 );
 
 CREATE TABLE flight_count
(
 Fid varchar(255), 
 Date date,  
 Capacity INT,
 Occupied INT
 );
 
 CREATE TABLE order_detail
(
 Fid varchar(255), 
 Bid varchar(255), 
 Uid varchar(255),
 Fsource varchar(255), 
 Fdestination varchar(255),
 Fdep varchar(40) NOT NULL,
 Farrival varchar(40) NOT NULL, 
 Ftype varchar(100) NOT NULL,
 Totcost DECIMAL(8,3) NOT NULL,
 Passengers INT,
 Ddate date,  
 Rdate date
 );
 
  CREATE TABLE booking_detail
(
 Bid varchar(255), 
 Num INT,
 Name varchar(255),
 age INT, 
 sex varchar(255)
 );
 
INSERT INTO User_Details VALUES ("Gladson","Noel","Admin@gmail.com","Admin","admin","STR_MGR");


INSERT INTO flight_count
	(Fid,
	Date,
	Capacity,
	Occupied)
	VALUES
	("A121","2016-12-01",120,100),
	("A122","2016-12-02",150,100),
    ("A124","2016-12-01",120,100),
    ("A124","2016-12-02",120,100),
    ("A122","2016-12-01",120,100),
    ("A130","2016-12-02",120,100),
    ("A131","2016-12-02",120,100),
    ("A132","2016-12-02",120,100),
    ("A133","2016-12-02",120,100),
    ("A134","2016-12-02",120,100),
    ("A135","2016-12-02",120,100),
    ("A136","2016-12-02",120,100),
    ("A137","2016-12-02",120,100),
    ("A138","2016-12-02",120,100),
    ("A139","2016-12-02",120,100),
    ("A140","2016-12-02",120,100);


INSERT INTO order_detail
(Fid, 
 Bid, 
 Uid,
 Fsource, 
 Fdestination,
 Fdep,
 Farrival, 
 Ftype,
 Totcost,
 Passengers,
 Ddate,  
 Rdate)
	VALUES
	("A122","BBCA122","swag","Chicago","Boston","09:30 AM","11:30 AM","Domestic",360,1,"2016-11-01","2016-11-01"),
    ("A123","BBCA123","s","Chicago","Boston","09:30 AM","11:30 AM","Domestic",360,1,"2016-11-01","2016-11-01"),
    ("A126","BBCA126","swag","Chicago","New York","09:30 AM","11:30 AM","Domestic",360,1,"2016-11-01","2016-11-01"),
    ("A128","BBCA128","swag","Chicago","New York","09:30 AM","11:30 AM","Domestic",360,1,"2016-11-01","2016-11-01"),
    ("A121","BBCA121","s","Boston","Chicago","09:30 AM","11:30 AM","Domestic",360,1,"2016-11-01","2016-11-01");
 
 INSERT INTO booking_detail
(Bid,
 Num, 
 Name,
 age, 
 sex)
 VALUES
	("BBCA121",1,"Ram",45,"Male"),
	("BBCA121",2,"Sam",34,"Female"),
    ("BBCA121",3,"Tom",23,"Male");
 
ALTER TABLE flight_info
ADD Fcost_B decimal(8,3);

ALTER TABLE flight_info
change COLUMN  Fcost  Fcost_E decimal(8,3);

update flight_info set Fcost_B= Fcost_E +100 ;
    

select * from User_Details;
select * from flight_info;
select * from flight_count;
select * from order_detail;
select * from booking_detail;

delete from flight_info;
drop table booking_detail;



select * from (select a.Fid,a.Fsource,a.Fdestination,b.Date,a.Fdep,a.Farrival,a.Ftype,a.Fcost,(b.Capacity-b.Occupied) as Remaining 
from flight_info as a inner join flight_count as b
where a.Fid = b.Fid) as t where t.Date='2016-11-01' and t.Fsource='Boston-Logan' and t.Fdestination='Chicago-OHare' and t.Remaining >=7

 union select * from (select a.Fid,a.Fsource,a.Fdestination,b.Date,a.Fdep,a.Farrival,a.Ftype,a.Fcost,(b.Capacity-b.Occupied) as Remaining 
from flight_info as a inner join flight_count as b
on a.Fid = b.Fid) as t where t.Date='2016-11-02' and t.Fsource='Chicago-OHare' and t.Fdestination='Boston-Logan' and t.Remaining >=7;