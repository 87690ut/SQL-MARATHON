SELECT * FROM ola.ola_booking;

-- 1. Retrieve all successful bookings.
CREATE VIEW Successful_Bookings AS
    SELECT 
        *
    FROM
        ola_booking
    WHERE
        Booking_Status = 'Success';

select * from Successful_Bookings;

-- 2. Find the average ride distance for each vehicle type.

CREATE VIEW Average_Distance AS
    SELECT 
        Vehicle_Type, AVG(Ride_Distance) AS Average_Distance
    FROM
        ola_booking
    GROUP BY Vehicle_Type;

SELECT 
    *
FROM
    Average_Distance;

-- 3. Get the total number of cancelled ride by customers.
CREATE VIEW Canceled_by_Customer AS
    SELECT 
        COUNT(*)
    FROM
        ola_booking
    WHERE
        Booking_Status = 'Canceled by Customer';

SELECT 
    *
FROM
    Canceled_by_Customer;

-- 4. List top 5 customers who booked the highest number of ride.
CREATE VIEW Top_Customers AS
    SELECT 
        Customer_ID, COUNT(Booking_ID) AS Total_Rides
    FROM
        ola_booking
    GROUP BY Customer_ID
    ORDER BY Total_Rides DESC
    LIMIT 5;

SELECT 
    *
FROM
    Top_Customers;

-- 5. Get the number of rides cancelled by driver due to personal & car related issue.
CREATE VIEW Canceled_ride_by_Driver AS
    SELECT 
        COUNT(Booking_ID)
    FROM
        ola_booking
    WHERE
        Cancelled_Rides_by_Driver = 'Personal & Car related issue';

SELECT 
    *
FROM
    Canceled_ride_by_Driver;

-- 6. Find the maximum and minimum drivers rating for Prime Sedan Bookings.

CREATE VIEW Max_Min_Rating AS
    SELECT 
        MAX(Driver_Rating) AS Max, MIN(Driver_Rating) AS Min
    FROM
        ola_booking
    WHERE
        Vehicle_Type = 'Prime Sedan'
            AND Driver_Rating != 'null';

SELECT 
    *
FROM
    Max_Min_Rating;

-- 7. Retrieve all rides where payment was made using UPI.
CREATE VIEW Payments_by_UPI AS
    SELECT 
        *
    FROM
        ola_booking
    WHERE
        Payment_Method = 'UPI';

SELECT 
    *
FROM
    Payments_by_UPI;

-- 8. Find the average customer rating per vehicle type.
CREATE VIEW AVERAGE_RATING AS
    SELECT 
        Vehicle_Type, AVG(Customer_Rating) AS Average_Rating
    FROM
        ola_booking
    WHERE
        Customer_Rating != 'null'
    GROUP BY Vehicle_Type;

SELECT 
    *
FROM
    AVERAGE_RATING;

-- 9. Calculate the total booking value of rides completed successfully.
CREATE VIEW Total_Values AS
    SELECT 
        SUM(Booking_Value) AS Total_Booking_Value
    FROM
        ola_booking
    WHERE
        Booking_Status = 'Success';

SELECT 
    *
FROM
    Total_Values;

-- 10. List all incomplete rides along with the reason.
CREATE VIEW Incomplete_Rides AS
    SELECT 
        Booking_ID, Incomplete_Rides_Reason
    FROM
        ola_booking
    WHERE
        Incomplete_Rides = 'Yes';

SELECT 
    *
FROM
    Incomplete_Rides;