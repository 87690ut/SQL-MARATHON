-- ------------------------------------------------ DATA LOADING AND CLEANING ---------------------------------------------------------------------------------------
create database OLA;
use OLA;

create table OLA_Booking (Booking_Date datetime,
Booking_Time TIME,
Booking_ID varchar(20),
Booking_Status text,
Customer_ID varchar(20),
Vehicle_Type text,
Pickup_Location text,
Drop_Location text,
V_TAT int,
C_TAT int,
Cancelled_Rides_by_Customer text,
Cancelled_Rides_by_Driver text,
Incomplete_Rides text,
Incomplete_Rides_Reason text,
Booking_Value int,
Payment_Method text,
Ride_Distance int,
Driver_Rating varchar(20),
Customer_Rating varchar(20));

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Bookings.csv'
IGNORE INTO TABLE ola_booking
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

ALTER TABLE ola_booking MODIFY COLUMN V_TAT varchar(50);
alter table ola_booking modify column C_TAT varchar(50);
alter table ola_booking modify column Driver_Rating varchar(20);
alter table ola_booking modify column Customer_Rating varchar(50);

desc ola_booking;
truncate table ola_booking;

select count(*) from ola_booking where Booking_ID is NULL or Booking_ID = '';
 
set session sql_mode = '';

create table ola_booking_clean as select * from (select *,
row_number() over (partition by Booking_ID order by Booking_ID) as rn from OLA_Booking) as temp_table
where rn = 1;

alter table ola_booking_clean drop column rn;
drop table OLA_Booking;

rename table ola_booking_clean to OLA_Booking;

select count(*) from OLA_Booking;