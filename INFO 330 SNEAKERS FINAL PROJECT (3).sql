/* Creating the DDL for INFO_330B_Proj_SNEAKERHEADS DATABASE */

CREATE DATABASE INFO_330B_Proj_SNEAKERHEADS

USE INFO_330B_Proj_SNEAKERHEADS

CREATE TABLE tblUSER (
 UserID INT IDENTITY(1,1) PRIMARY KEY,
 UserFname VARCHAR(50),
 UserLname VARCHAR(50),
 UserEmail VARCHAR(70)
)

CREATE TABLE tblPHONE (
 UserPhoneID INT IDENTITY(1,1) PRIMARY KEY,
 UserPhone VARCHAR(20)
)

CREATE TABLE tblUSER_PHONE (
 UserID INT REFERENCES tblUSER(UserID),
 UserPhoneID INT REFERENCES tblPHONE(UserPhoneID),
 PRIMARY KEY(UserID, UserPhoneID)
)

CREATE TABLE tblPAYMENTMETHOD (
 PaymentID INT IDENTITY(1,1) PRIMARY KEY,
 PaymentMethod VARCHAR(50),  -- American Express, Visa, Mastercard
 UserID INT REFERENCES tblUSER(UserID)
)

CREATE TABLE tblORDER (
 OrderID INT IDENTITY(1,1) PRIMARY KEY,
 OrderType VARCHAR(15), -- which website they purchased from. We will be using Goat, StockX, Grailed, SSense, FarFetch.
 UserID INT REFERENCES tblUSER(UserID)
)

CREATE TABLE tblRESELLER (
 ResellerID INT IDENTITY(1,1) PRIMARY KEY,
 ResellerFname VARCHAR(50),
 ResellerLname VARCHAR(50),
 ResellerEmail VARCHAR(75),
 ResellerWebsite VARCHAR(75) -- For Example: StockX.com, Goat.com, Grailed.com, ssense.com, FarFetch.com
)

CREATE TABLE tblBRAND (
 BrandID INT IDENTITY(1,1) PRIMARY KEY,
 BrandName VARCHAR(50)
)

CREATE TABLE tblPRODUCT (
 ProductID INT IDENTITY(1,1) PRIMARY KEY,
 ProductName VARCHAR(50), -- Types of Air Jordan, Types of SB Dunk Low, Types of AirForce and many more.
 ProductDesc VARCHAR(100), -- Name of the Shoes. For example: Air Force 1 Low Travis Scott.
 BrandID INT REFERENCES tblBRAND(BrandID)
)

CREATE TABLE tblPRODUCT_TYPE (
ProductTypeID INT IDENTITY(1,1) PRIMARY KEY,
 ProductColor VARCHAR(20), 
 ProductSize VARCHAR(20),
 ProductCondition VARCHAR(20), -- For example: New, Like New Used, Damagedly Used
 Price MONEY,
 ProductID INT REFERENCES tblPRODUCT(ProductID),
 ResellerID INT REFERENCES tblRESELLER(ResellerID),
 OrderID INT REFERENCES tblORDER(OrderID)
)

CREATE TABLE tblRATING (
 RatingID INT IDENTITY(1,1) PRIMARY KEY,
 RatingStar INT, -- We will use /5 stars boundary limit. For example: 1, 2, 3, 4, 5.
 RatingDesc VARCHAR(100), -- We will use 5 conditions. For example: Perfect, Excellent, Good, Average, Poor.
 UserID INT REFERENCES tblUSER(UserID),
 ResellerID INT REFERENCES tblRESELLER(ResellerID)
)


/* Populating the DDL with data through Stored Procedures */

-- Insert 10 rows of data to tblUSER without worrying foreign keys
-- create INSERT STORED PROCEDURE tblUSER (by Ash Srikanth)
GO
CREATE OR ALTER PROCEDURE insert_USER
@user_FName VARCHAR(50),
@user_LName VARCHAR(50),
@user_email VARCHAR(70)
AS BEGIN
INSERT INTO tblUSER(UserFName, UserLName, UserEmail) 
VALUES (@user_FName, @user_LName, @user_email);
END;

-- execute stored procedure
GO
EXEC insert_USER
@user_FName = 'Michael',
@user_LName = 'Song',
@user_email = 'Michaels@gmail.com'

GO
EXEC insert_USER
@user_FName = 'Arsya',
@user_LName = 'Amal',
@user_email = 'Arsyaa@gmail.com'

GO
EXEC insert_USER
@user_FName = 'John',
@user_LName = 'Keri',
@user_email = 'Johnkeri@gmail.com'

GO
EXEC insert_USER
@user_FName = 'Sanji',
@user_LName = 'Lee',
@user_email = 'Sanjilee@gmail.com'

GO
EXEC insert_USER
@user_FName = 'Christoper',
@user_LName = 'Max',
@user_email = 'Cmax@gmail.com'

GO
EXEC insert_USER
@user_FName = 'Anthony',
@user_LName = 'Har',
@user_email = 'Anthonyhar@gmail.com'

GO
EXEC insert_USER
@user_FName = 'Kathleen',
@user_LName = 'Chang',
@user_email = 'Kchang@gmail.com'

GO
EXEC insert_USER
@user_FName = 'Zorro',
@user_LName = 'Jung',
@user_email = 'Zjung@gmail.com'

GO
EXEC insert_USER
@user_FName = 'Chopper',
@user_LName = 'Mu',
@user_email = 'Choppermu@gmail.com'

GO
EXEC insert_USER
@user_FName = 'Catherine',
@user_LName = 'Sukehiro',
@user_email = 'Catherinesukehiro@gmail.com'


-- Insert 13 rows of data to tblPHONE without worrying foreign keys
-- create INSERT STORED PROCEDURE tblPHONE (by Ash Srikanth)
GO
CREATE OR ALTER PROCEDURE insert_PHONE
@user_phone VARCHAR(20)
AS BEGIN
INSERT INTO tblPHONE(UserPhone)
VALUES (@user_phone);
END;

-- execute stored procedure
GO
EXEC insert_PHONE
@user_phone = '206-536-6592'

GO
EXEC insert_PHONE
@user_phone = '206-535-5599'

GO
EXEC insert_PHONE
@user_phone = '206-425-1021'

GO
EXEC insert_PHONE
@user_phone = '206-656-2981'

GO
EXEC insert_PHONE
@user_phone = '506-111-2121'

GO
EXEC insert_PHONE
@user_phone = '506-222-3322'

GO
EXEC insert_PHONE
@user_phone = '209-423-4244'

GO
EXEC insert_PHONE
@user_phone = '209-121-6211'

GO
EXEC insert_PHONE
@user_phone = '209-781-2122'

GO
EXEC insert_PHONE
@user_phone = '209-445-8567'

GO
EXEC insert_PHONE
@user_phone = '262-129-9178'

GO
EXEC insert_PHONE
@user_phone = '218-624-1296'

GO
EXEC insert_PHONE
@user_phone = '218-491-7436'

-- Insert 10 rows of data to tblRESELLER without worrying foreign keys
-- create INSERT STORED PROCEDURE tblRESELLER (by Michael Lie)
GO
CREATE OR ALTER PROCEDURE INSERT_INTO_RESELLER
@ResellerFName VARCHAR(50),
@ResellerLName VARCHAR(50),
@ResellerEmail VARCHAR(75),
@ResellerWebsite VARCHAR(75)
AS
INSERT INTO tblRESELLER
VALUES (@ResellerFName, @ResellerLName, @ResellerEmail, @ResellerWebsite)

-- execute stored procedure
GO
EXEC INSERT_INTO_RESELLER
@ResellerFName = 'Anthony',
@ResellerLName = 'Woo',
@ResellerEmail = 'AnthonyWoo@gmail.com',
@ResellerWebsite = 'StockX.com'

GO
EXEC INSERT_INTO_RESELLER
@ResellerFName = 'Michael',
@ResellerLName = 'Lie',
@ResellerEmail = 'MichaelLie@gmail.com',
@ResellerWebsite = 'StockX.com'

GO
EXEC INSERT_INTO_RESELLER
@ResellerFName = 'Miranda',
@ResellerLName = 'Song',
@ResellerEmail = 'MirandaSong@gmail.com',
@ResellerWebsite = 'Grailed.com'

GO
EXEC INSERT_INTO_RESELLER
@ResellerFName = 'Iqbar',
@ResellerLName = 'Sanap',
@ResellerEmail = 'IqbarSanap@gmail.com',
@ResellerWebsite = 'StockX.com'

GO
EXEC INSERT_INTO_RESELLER
@ResellerFName = 'Kevin',
@ResellerLName = 'Ginting',
@ResellerEmail = 'KevinGinting@yahoo.com',
@ResellerWebsite = 'Goat.com'

GO
EXEC INSERT_INTO_RESELLER
@ResellerFName = 'Jenny',
@ResellerLName = 'Jun',
@ResellerEmail = 'JennyJun@gmail.com',
@ResellerWebsite = 'ssense.com'

GO
EXEC INSERT_INTO_RESELLER
@ResellerFName = 'Sofia',
@ResellerLName = 'Jun',
@ResellerEmail = 'SofiaJun@gmail.com',
@ResellerWebsite = 'FarFetch.com'

GO
EXEC INSERT_INTO_RESELLER
@ResellerFName = 'Charlotte',
@ResellerLName = 'Martinkus',
@ResellerEmail = 'CMartinkus@yahoo.com',
@ResellerWebsite = 'ssense.com'

GO
EXEC INSERT_INTO_RESELLER
@ResellerFName = 'Bryan',
@ResellerLName = 'Polin',
@ResellerEmail = 'BryanP@gmail.com',
@ResellerWebsite = 'Goat.com'

GO
EXEC INSERT_INTO_RESELLER
@ResellerFName = 'Nico',
@ResellerLName = 'Robin',
@ResellerEmail = 'NicoRobin@yahoo.com',
@ResellerWebsite = 'StockX.com'

-- Insert 13 rows of data to tblUSER_PHONE with UserID and UserPhoneID foreign keys
-- create INSERT STORED PROCEDURE FOR tblUSERPHONE (by Ash Srikanth)
GO
CREATE OR ALTER PROCEDURE insert_USER_PHONE
@user_ID INT,
@user_phone_ID INT
AS 
DECLARE @userID INT, @userphone_ID INT
 
SET @userID = (SELECT UserID FROM tblUSER
               WHERE UserID = @user_id
)
 
SET @userphone_ID = (SELECT UserPhoneID FROM tblPHONE
               WHERE UserPhoneID = @user_phone_ID
)
 
INSERT INTO tblUSER_PHONE (UserID, UserPhoneID) VALUES (@user_ID, @user_phone_ID);

-- execute stored procedure
GO
EXEC insert_USER_PHONE
@user_ID = 1,
@user_phone_ID = 1

GO
EXEC insert_USER_PHONE
@user_ID = 1,
@user_phone_ID = 2

GO
EXEC insert_USER_PHONE
@user_ID = 2,
@user_phone_ID = 3

GO
EXEC insert_USER_PHONE
@user_ID = 2,
@user_phone_ID = 4

GO
EXEC insert_USER_PHONE
@user_ID = 3,
@user_phone_ID = 5

GO
EXEC insert_USER_PHONE
@user_ID = 4,
@user_phone_ID = 6

GO
EXEC insert_USER_PHONE
@user_ID = 5,
@user_phone_ID = 7

GO
EXEC insert_USER_PHONE
@user_ID = 5,
@user_phone_ID = 8

GO
EXEC insert_USER_PHONE
@user_ID = 6,
@user_phone_ID = 9

GO
EXEC insert_USER_PHONE
@user_ID = 7,
@user_phone_ID = 10

GO
EXEC insert_USER_PHONE
@user_ID = 8,
@user_phone_ID = 11

GO
EXEC insert_USER_PHONE
@user_ID = 9,
@user_phone_ID = 12

GO
EXEC insert_USER_PHONE
@user_ID = 10,
@user_phone_ID = 13

-- Insert 10 rows of data to tblBRAND without worrying foreign key
-- create INSERT STORED PROCEDURE FOR tblBRAND (by Viru Repalle)
GO
CREATE OR ALTER PROCEDURE insert_brands
@brand_name VARCHAR(50)
AS
INSERT INTO tblBRAND(BrandName)
VALUES (@brand_name)
 
 
-- execute stored procedure
GO
EXECUTE insert_brands 'Nike'

GO
EXECUTE insert_brands 'Adidas'

GO
EXECUTE insert_brands 'Converse'

GO
EXECUTE insert_brands 'Jordan'

GO
EXECUTE insert_brands 'Off-White'

GO
EXECUTE insert_brands 'Gucci'

GO
EXECUTE insert_brands 'Supreme'

GO
EXECUTE insert_brands 'Yeezy'

GO
EXECUTE insert_brands 'Vans'

GO
EXECUTE insert_brands 'New Balance'

-- insert 10 rows of data to tblPRODUCT with BrandID as foreign key (by Viru Repalle)
-- small stored procedure to get BrandID 
GO
CREATE OR ALTER PROCEDURE getBrandID
@BrandName VARCHAR(50),
@BrandID INT OUTPUT
AS
SET @BrandID = (SELECT BrandID FROM tblBRAND
WHERE BrandName = @BrandName)

-- create main stored procedure
GO
CREATE OR ALTER PROCEDURE INSERT_INTO_BRAND
@i_ProductName VARCHAR(50),
@i_ProductDesc VARCHAR(100),
@i_BrandName VARCHAR(50)
AS
DECLARE @i_B_ID INT

EXEC getBrandID
@BrandName = @i_BrandName,
@BrandID = @i_B_ID OUTPUT

BEGIN TRAN T1
INSERT INTO tblPRODUCT (ProductName, ProductDesc, BrandID)
VALUES (@i_ProductName, @i_ProductDesc, @i_B_ID)
COMMIT TRAN T1

-- execute main stored procedure
EXEC INSERT_INTO_BRAND
@i_ProductName = 'Air Force 1',
@i_ProductDesc = 'Nike classic basketball sneaker',
@i_BrandName = 'Nike'

EXEC INSERT_INTO_BRAND
@i_ProductName = 'Dunk Low',
@i_ProductDesc = 'Cultural icon reinvented through new releases and collaborations',
@i_BrandName = 'Nike'

EXEC INSERT_INTO_BRAND
@i_ProductName = 'Ultraboost',
@i_ProductDesc = 'Running shoe and style icon',
@i_BrandName = 'Adidas'

EXEC INSERT_INTO_BRAND
@i_ProductName = 'Chuck Taylor High',
@i_ProductDesc = 'Basketball shoe turned a classic canvas',
@i_BrandName = 'Converse'

EXEC INSERT_INTO_BRAND
@i_ProductName = 'Chuck Taylor Low',
@i_ProductDesc = 'Sleeker profile of the High',
@i_BrandName = 'Converse'

EXEC INSERT_INTO_BRAND
@i_ProductName = 'Air Jordan 11',
@i_ProductDesc = 'Futuristic profile',
@i_BrandName = 'Jordan'

EXEC INSERT_INTO_BRAND
@i_ProductName = 'Jordan 1 Mid',
@i_ProductDesc = 'Air Jordan perfect lifestyle shoe',
@i_BrandName = 'Jordan'

EXEC INSERT_INTO_BRAND
@i_ProductName = 'Yeezy Boost 350',
@i_ProductDesc = 'Designed by Mr. West',
@i_BrandName = 'Yeezy'

EXEC INSERT_INTO_BRAND
@i_ProductName = 'Yeezy Slides 350',
@i_ProductDesc = 'Designed by Mr. West',
@i_BrandName = 'Yeezy'

EXEC INSERT_INTO_BRAND
@i_ProductName = 'New Balance 550',
@i_ProductDesc = 'Recently gained popularity',
@i_BrandName = 'New Balance'


-- insert 10 rows of data to tblPAYMENTMETHOD with UserID foreign key (by Michael Lie)
-- small stored procedure to get UserID
GO
CREATE OR ALTER PROCEDURE getUserID
@UserFName VARCHAR(50),
@UserLName VARCHAR(50),
@UserEmail VARCHAR(70),
@UserID INT OUTPUT
AS
SET @UserID = (SELECT UserID FROM tblUSER
WHERE UserFName = @UserFName
AND UserLName = @UserLName
AND UserEmail = @UserEmail)

-- create main stored procedure
GO
CREATE OR ALTER PROCEDURE INSERT_INTO_PAYMENTMETHOD
@i_PaymentMethod VARCHAR(50),
@i_UserFName VARCHAR(50),
@i_UserLName VARCHAR(50),
@i_UserEmail VARCHAR(70)
AS
DECLARE @i_U_ID INT

EXEC getUserID
@UserFName = @i_UserFName,
@UserLName = @i_UserLName,
@UserEmail = @i_UserEmail,
@UserID = @i_U_ID OUTPUT 

BEGIN TRAN T1
INSERT INTO tblPAYMENTMETHOD (PaymentMethod, UserID)
VALUES (@i_PaymentMethod, @i_U_ID)
COMMIT TRAN T1

-- execute stored procedure
EXEC INSERT_INTO_PAYMENTMETHOD
@i_PaymentMethod = 'American Express',
@i_UserFName = 'Michael',
@i_UserLName = 'Song',
@i_UserEmail = 'Michaels@gmail.com'

EXEC INSERT_INTO_PAYMENTMETHOD
@i_PaymentMethod = 'American Express',
@i_UserFName = 'Arsya',
@i_UserLName = 'Amal',
@i_UserEmail = 'Arsyaa@gmail.com'

EXEC INSERT_INTO_PAYMENTMETHOD
@i_PaymentMethod = 'Visa',
@i_UserFName = 'John',
@i_UserLName = 'Keri',
@i_UserEmail = 'Johnkeri@gmail.com'

EXEC INSERT_INTO_PAYMENTMETHOD
@i_PaymentMethod = 'Visa',
@i_UserFName = 'Sanji',
@i_UserLName = 'Lee',
@i_UserEmail = 'Sanjilee@gmail.com'

EXEC INSERT_INTO_PAYMENTMETHOD
@i_PaymentMethod = 'Visa',
@i_UserFName = 'Christoper',
@i_UserLName = 'Max',
@i_UserEmail = 'Cmax@gmail.com'

EXEC INSERT_INTO_PAYMENTMETHOD
@i_PaymentMethod = 'Visa',
@i_UserFName = 'Anthony',
@i_UserLName = 'Har',
@i_UserEmail = 'Anthonyhar@gmail.com'

EXEC INSERT_INTO_PAYMENTMETHOD
@i_PaymentMethod = 'Visa',
@i_UserFName = 'Kathleen',
@i_UserLName = 'Chang',
@i_UserEmail = 'Kchang@gmail.com'

EXEC INSERT_INTO_PAYMENTMETHOD
@i_PaymentMethod = 'Mastercard',
@i_UserFName = 'Zorro',
@i_UserLName = 'Jung',
@i_UserEmail = 'Zjung@gmail.com'

EXEC INSERT_INTO_PAYMENTMETHOD
@i_PaymentMethod = 'Mastercard',
@i_UserFName = 'Chopper',
@i_UserLName = 'Mu',
@i_UserEmail = 'Choppermu@gmail.com'

EXEC INSERT_INTO_PAYMENTMETHOD
@i_PaymentMethod = 'Mastercard',
@i_UserFName = 'Catherine',
@i_UserLName = 'Sukehiro',
@i_UserEmail = 'Catherinesukehiro@gmail.com'


-- insert 10 rows of data to tblORDER with PaymentID foreign key (by Michael Lie)
-- re-use small stored procedure to get UserID
-- create main stored procedure
GO
CREATE OR ALTER PROCEDURE INSERT_INTO_ORDER
@i_OrderType VARCHAR(15),
@i_UserFName VARCHAR(50),
@i_UserLName VARCHAR(50),
@i_UserEmail VARCHAR(70)
AS
DECLARE @i_U_ID INT

EXEC getUserID
@UserFName = @i_UserFName,
@UserLName = @i_UserLName,
@UserEmail = @i_UserEmail,
@UserID = @i_U_ID OUTPUT 

BEGIN TRAN T1
INSERT INTO tblORDER (OrderType, UserID)
VALUES (@i_OrderType, @i_U_ID)
COMMIT TRAN T1

-- execute stored procedure
EXEC INSERT_INTO_ORDER
@i_OrderType = 'Goat',
@i_UserFName = 'Michael',
@i_UserLName = 'Song',
@i_UserEmail = 'Michaels@gmail.com'

EXEC INSERT_INTO_ORDER
@i_OrderType = 'ssense',
@i_UserFName = 'Arsya',
@i_UserLName = 'Amal',
@i_UserEmail = 'Arsyaa@gmail.com'

EXEC INSERT_INTO_ORDER
@i_OrderType = 'Goat',
@i_UserFName = 'John',
@i_UserLName = 'Keri',
@i_UserEmail = 'Johnkeri@gmail.com'

EXEC INSERT_INTO_ORDER
@i_OrderType = 'StockX',
@i_UserFName = 'Sanji',
@i_UserLName = 'Lee',
@i_UserEmail = 'Sanjilee@gmail.com'

EXEC INSERT_INTO_ORDER
@i_OrderType = 'StockX',
@i_UserFName = 'Christoper',
@i_UserLName = 'Max',
@i_UserEmail = 'Cmax@gmail.com'

EXEC INSERT_INTO_ORDER
@i_OrderType = 'StockX',
@i_UserFName = 'Anthony',
@i_UserLName = 'Har',
@i_UserEmail = 'Anthonyhar@gmail.com'

EXEC INSERT_INTO_ORDER
@i_OrderType = 'StockX',
@i_UserFName = 'Kathleen',
@i_UserLName = 'Chang',
@i_UserEmail = 'Kchang@gmail.com'

EXEC INSERT_INTO_ORDER
@i_OrderType = 'StockX',
@i_UserFName = 'Zorro',
@i_UserLName = 'Jung',
@i_UserEmail = 'Zjung@gmail.com'

EXEC INSERT_INTO_ORDER
@i_OrderType = 'FarFetch',
@i_UserFName = 'Chopper',
@i_UserLName = 'Mu',
@i_UserEmail = 'Choppermu@gmail.com'

EXEC INSERT_INTO_ORDER
@i_OrderType = 'Grailed',
@i_UserFName = 'Catherine',
@i_UserLName = 'Sukehiro',
@i_UserEmail = 'Catherinesukehiro@gmail.com'


-- insert 10 rows of data to tblPRODUCT_TYPE with ProductID, ResellerID, OrderID foreign keys (by Viru Repalle)
-- create stored procedure
GO
CREATE OR ALTER PROCEDURE insert_product_type
@color VARCHAR(25),
@ProductSize VARCHAR(20),
@condition VARCHAR(25),
@price  MONEY,
@product_id INT,
@reseller_id INT,
@order_id INT
 
AS BEGIN
SET NOCOUNT ON;
 
INSERT INTO tblPRODUCT_TYPE(ProductColor, ProductSize, ProductCondition, Price, ProductID, ResellerID, OrderID)
VALUES (@color, @ProductSize, @condition, @price, @product_id, @reseller_id, @order_id)

END;

-- execute stored procedure
EXECUTE insert_product_type 'White', 'US10', 'New', 100, 1, 1, 1
EXECUTE insert_product_type 'Black', 'US10', 'New', 120, 3, 1, 3
EXECUTE insert_product_type 'Black', 'US10', 'Used', 200, 4, 2, 2
EXECUTE insert_product_type 'Gray', 'US8', 'Used', 250, 4, 3, 4
EXECUTE insert_product_type 'Velvet', 'US7', 'New', 200, 2, 2, 5
EXECUTE insert_product_type 'White', 'US12', 'New', 100, 6, 4, 6
EXECUTE insert_product_type 'Green', 'US13', 'New', 120, 7, 5, 7
EXECUTE insert_product_type 'Black', 'US10', 'Used', 250, 8, 6, 8
EXECUTE insert_product_type 'Gray', 'US10', 'Used', 250, 9, 7, 9
EXECUTE insert_product_type 'Pink', 'US11', 'New', 2000, 10, 8, 10


-- insert 10 rows of data to tblRATING with UserID, ResellerID foreign keys (by Michael Lie)
-- re-use small stored procedure getUserID

-- small stored procedure to get ResellerID
GO
CREATE OR ALTER PROCEDURE getResellerID
@ResellerFName VARCHAR(50),
@ResellerLName VARCHAR(50),
@ResellerID INT OUTPUT
AS
SET @ResellerID = (SELECT ResellerID FROM tblRESELLER
WHERE ResellerFName = @ResellerFName
AND ResellerLName = @ResellerLName)

-- create main stored procedure
GO
CREATE OR ALTER PROCEDURE INSERT_INTO_RATING
@i_RatingStar INT,
@i_RatingDesc VARCHAR(100),
@i_UserFName VARCHAR(50),
@i_UserLName VARCHAR(50),
@i_UserEmail VARCHAR(70),
@i_ResellerFName VARCHAR(50),
@i_ResellerLName VARCHAR(50)
AS
DECLARE @i_U_ID INT, @i_R_ID INT

EXEC getUserID
@UserFName = @i_UserFName,
@UserLName = @i_UserLName,
@UserEmail = @i_UserEmail,
@UserID = @i_U_ID OUTPUT

EXEC getResellerID
@ResellerFName = @i_ResellerFName,
@ResellerLName = @i_ResellerLName,
@ResellerID = @i_R_ID OUTPUT

BEGIN TRAN T1
INSERT INTO tblRATING (RatingStar, RatingDesc, UserID, ResellerID)
VALUES (@i_RatingStar, @i_RatingDesc, @i_U_ID, @i_R_ID)
COMMIT TRAN T1

SELECT * FROM tblUSER
-- execute stored procedure
EXEC INSERT_INTO_RATING
@i_RatingStar = 5,
@i_RatingDesc = 'Perfect Service and quality',
@i_UserFName = 'Michael',
@i_UserLName = 'Song',
@i_UserEmail = 'Michaels@gmail.com',
@i_ResellerFName = 'Anthony',
@i_ResellerLName = 'Woo'

EXEC INSERT_INTO_RATING
@i_RatingStar = 5,
@i_RatingDesc = 'Perfect Service and quality',
@i_UserFName = 'John',
@i_UserLName = 'Keri',
@i_UserEmail = 'Johnkeri@gmail.com',
@i_ResellerFName = 'Anthony',
@i_ResellerLName = 'Woo'

EXEC INSERT_INTO_RATING
@i_RatingStar = 2,
@i_RatingDesc = 'Average Service and quality',
@i_UserFName = 'Arsya',
@i_UserLName = 'Amal',
@i_UserEmail = 'Arsyaa@gmail.com',
@i_ResellerFName = 'Michael',
@i_ResellerLName = 'Lie'

EXEC INSERT_INTO_RATING
@i_RatingStar = 3,
@i_RatingDesc = 'Good Service and quality',
@i_UserFName = 'Sanji',
@i_UserLName = 'Lee',
@i_UserEmail = 'Sanjilee@gmail.com',
@i_ResellerFName = 'Miranda',
@i_ResellerLName = 'Song'

EXEC INSERT_INTO_RATING
@i_RatingStar = 2,
@i_RatingDesc = 'Average Service and quality',
@i_UserFName = 'Christoper',
@i_UserLName = 'Max',
@i_UserEmail = 'Cmax@gmail.com',
@i_ResellerFName = 'Michael',
@i_ResellerLName = 'Lie'

EXEC INSERT_INTO_RATING
@i_RatingStar = 1,
@i_RatingDesc = 'Poor Service and quality',
@i_UserFName = 'Anthony',
@i_UserLName = 'Har',
@i_UserEmail = 'Anthonyhar@gmail.com',
@i_ResellerFName = 'Iqbar',
@i_ResellerLName = 'Sanap'

EXEC INSERT_INTO_RATING
@i_RatingStar = 1,
@i_RatingDesc = 'Poor Service and quality',
@i_UserFName = 'Kathleen',
@i_UserLName = 'Chang',
@i_UserEmail = 'Kchang@gmail.com',
@i_ResellerFName = 'Kevin',
@i_ResellerLName = 'Ginting'

EXEC INSERT_INTO_RATING
@i_RatingStar = 4,
@i_RatingDesc = 'Excellent Service and quality',
@i_UserFName = 'Zorro',
@i_UserLName = 'Jung',
@i_UserEmail = 'Zjung@gmail.com',
@i_ResellerFName = 'Jenny',
@i_ResellerLName = 'Jun'

EXEC INSERT_INTO_RATING
@i_RatingStar = 4,
@i_RatingDesc = 'Excellent Service and quality',
@i_UserFName = 'Chopper',
@i_UserLName = 'Mu',
@i_UserEmail = 'Choppermu@gmail.com',
@i_ResellerFName = 'Sofia',
@i_ResellerLName = 'Jun'

EXEC INSERT_INTO_RATING
@i_RatingStar = 3,
@i_RatingDesc = 'Good Service and quality',
@i_UserFName = 'Catherine',
@i_UserLName = 'Sukehiro',
@i_UserEmail = 'Catherinesukehiro@gmail.com',
@i_ResellerFName = 'Charlotte',
@i_ResellerLName = 'Martinkus'

/* Business Rules that leverage user-defined functions (UDFs) by Michael Lie */ 
/* 1.  No customer/user can place an order with emails into the database without containing "@", listed by user emails. */
-- create a User-Defined Function (UDF) for the conditions above
GO
CREATE OR ALTER FUNCTION fn_user_email_restrict ()
RETURNS INT
AS
BEGIN
DECLARE @ret INT
IF EXISTS(SELECT *, COUNT(*) AS NumOfOrders
          FROM tblUSER u
          JOIN tblORDER o ON u.UserID = o.UserID
          WHERE u.UserEmail LIKE '%' + '@' + '%'
          GROUP BY u.UserEmail)
SET @ret = 1
RETURN @ret
END


-- create the CHECK CONSTRAINT on the UDF above
GO
ALTER TABLE tblORDER WITH NOCHECK
ADD CONSTRAINT check_user_email_to_order
CHECK(dbo.fn_user_email_restrict() = 0)


-- confirm the CHECK CONSTRAINT with parameter values that trigger the CHECK CONSTRAINT
EXEC INSERT_INTO_ORDER
@i_OrderType = 'ssense',
@i_UserFName = 'Arsya',
@i_UserLName = 'Amal',
@i_UserEmail = 'Arsyaagmail.com'

/* Explanation: The business constraint that is created here meant to keep track of valid emails of each user or customer. Since this is an online sneaker database that
requires emails of each user to complete an order of transation as well as to be able to be uniquely identified by notifying them through their emails regarding the orders
that they made. This is a crucial thing which if an email doesn't contain @ then the email is not valid and most of the times users need to be reminded through a CHECK CONSTRAINT
whether they have validly inputted the right format of an email. */


/* 2. No reseller can receive a rating less than 1 star and more than 5 star from any customer/user. */
-- create a User-Defined Function (UDF) for the conditions above
GO
CREATE OR ALTER FUNCTION fn_reseller_user_ratingstar_restrict()
RETURNS INT
AS
BEGIN
DECLARE @ret INT = 0
IF EXISTS(SELECT * FROM tblRESELLER re
          JOIN tblRATING ra ON re.ResellerID = ra.ResellerID
          JOIN tblUSER u ON ra.UserID = u.UserID
          WHERE (ra.RatingStar < 1) OR (ra.RatingStar > 5))
SET @ret = 1
RETURN @ret
END

-- create the CHECK CONSTRAINT on the UDF above
GO
ALTER TABLE tblRATING WITH NOCHECK
ADD CONSTRAINT check_reseller_user_ratingstar_1_5
CHECK(dbo.fn_reseller_user_ratingstar_restrict() = 0)

-- confirm the CHECK CONSTRAINT with parameter values that trigger the CHECK CONSTRAINT
EXEC INSERT_INTO_RATING
@i_RatingStar = 0,
@i_RatingDesc = 'Very Poor Service and quality',
@i_UserFName = 'Anthony',
@i_UserLName = 'Har',
@i_UserEmail = 'Anthonyhar@gmail.com',
@i_ResellerFName = 'Iqbar',
@i_ResellerLName = 'Sanap'

/* Explanation: The business constraint that is created here meant to keep the RatingStar of a Reseller could receive and a User (Customer) could give stay bounded from 1 - 5 as
the standardized range of values among many online marketplaces. Since if negative values, zero values, and large positive values are allowed (RatingStar < 0) it would messed up 
the average RatingStar if anyone is trying to calculate for the average RatingStar for every Reseller and try to obtain the highest average rated reseller, which also goes well for 
the User (Customers) to not be able to provide RatingStar less than 1 and  greater than 5. (Michael Lie)*/


/* Business Rules that leverage user-defined functions (UDFs) by Ash Srikanth */ 
-- UDF #1: Prevent the User from inputting a negative price values in tblPRODUCT_TYPE
-- create UDF
GO
CREATE OR ALTER FUNCTION fn_negative_price
(@price MONEY)
RETURNS INT
AS BEGIN 
DECLARE @price_return AS MONEY
IF @price < 0
   SET @price_return = 1
ELSE
   SET @price_return = 0
 
RETURN @price_return
END
GO

-- create CHECK CONSTRAINT on tblPRODUCT_TYPE
GO
ALTER TABLE tblPRODUCT_TYPE WITH NOCHECK ADD CONSTRAINT check_negative_price
CHECK(dbo.fn_negative_price(Price) = 0)


-- UDF #2: Prevent the user from rating an order more than once
-- create UDF
GO
CREATE OR ALTER FUNCTION fn_rate_limit
(@user_ID INT,
@reseller_ID INT)
RETURNS INT
AS BEGIN
DECLARE @rating_exists INT = 0
IF NOT EXISTS (SELECT *
           FROM tblRATING
           WHERE UserID = @user_ID
           AND ResellerID = @reseller_ID)
           SET @rating_exists = 1
RETURN @rating_exists
END

-- create CHECK CONSTRAINT on tblRATING
GO
ALTER TABLE tblRATING WITH NOCHECK ADD CONSTRAINT check_rating_limit
CHECK (dbo.fn_rate_limit(UserID, ResellerID) = 1)


/* Business Rules that leverage user-defined functions (UDFs) by Viru Repalle */
-- UDF 1: No cash payment method is allowed on this database
GO
CREATE OR ALTER FUNCTION card_only()
RETURNS INT
AS
BEGIN
DECLARE @ret INT = 0
IF EXISTS (
   SELECT PaymentMethod
   FROM tblPAYMENTMETHOD
   WHERE PaymentMethod = 'Cash'
)
SET @ret = 1
RETURN @ret
END
GO

-- create CHECK CONSTRAINT on tblPAYMENTMETHOD
ALTER TABLE tblPAYMENTMETHOD WITH NOCHECK
ADD CONSTRAINT card_only_payment
CHECK(dbo.card_only() = 1)


-- create UDF 2: No shoe sizes below 7 is allowed
GO
CREATE OR ALTER FUNCTION check_size()
RETURNS INT
AS
BEGIN
DECLARE @ret INT = 0
IF EXISTS (
   SELECT ProductSize
   FROM tblPRODUCT_TYPE
   WHERE ProductSize < 7
)
SET @ret = 1
RETURN @ret
END
GO

-- create CHECK CONSTRAINT
ALTER TABLE tblPRODUCT_TYPE WITH NOCHECK
ADD CONSTRAINT check_size_1
CHECK(dbo.check_size() = 1)



/* SQL code for two complex queries by Michael Lie */
/* 1. List all of the resellers who have an average rating star of 3 or above and only sold shoes with new conditions.
Order them from highest to lowest, and return reseller first names in the result. */
SELECT AVG(ra.RatingStar) AS AverageRatingStar, re.ResellerFName
FROM tblRESELLER re
JOIN tblRATING ra ON re.ResellerID = ra.ResellerID
JOIN tblPRODUCT_TYPE pt ON re.ResellerID = pt.ResellerID
WHERE pt.ProductCondition = 'New' -- condition for resellers who only sold new shoes
GROUP BY re.ResellerFname -- list by reseller first names
HAVING AVG(ra.RatingStar) >= 3 -- condition only for resellers with higher or equal to 3 average rating stars
ORDER BY AverageRatingStar DESC -- ordering the average rating star from highest - lowest


/* 2. Write down the SQL code to determine which Brands have a total selling greater than $500, new product condition of size US11 and "New"
as its starting shoe name with a pink color that also ..... order made through Grailed with (218) area code phone number. 
Return the Brand ID and name as well as the total selling of the shoes. Order your result from highest to lowest total selling shoes. */
-- create the first subquery
-- condition: Brands have a total selling greater than $500, new product condition of size US11 and "New" as its starting shoe name with a pink color.
/* SELECT b.BrandID, b.BrandName, SUM(pt.Price) AS TotalSelling
FROM tblBRAND b
JOIN tblPRODUCT p ON b.BrandID = p.BrandID
JOIN tblPRODUCT_TYPE pt ON p.ProductID = pt.ProductID
WHERE pt.ProductCondition = 'New'
AND pt.ProductSize = 'US11'
AND pt.ProductColor = 'Pink'
AND p.ProductName LIKE 'New%'
GROUP BY b.BrandID, b.BrandName
HAVING SUM(pt.Price) >= 500 */

-- create the second subquery
-- conditions: which Brands order made through Grailed with (218) area code phone number
/* SELECT b.BrandID, b.BrandName
FROM tblBRAND b
JOIN tblPRODUCT p ON b.BrandID = p.BrandID
JOIN tblPRODUCT_TYPE pt ON p.ProductID = pt.ProductID
JOIN tblORDER o ON pt.OrderID = o.OrderID
JOIN tblUSER u ON o.UserID = u.UserID
JOIN tblUSER_PHONE up ON u.UserID = up.UserID
JOIN tblPHONE ph ON up.UserPhoneID = ph.UserPhoneID
WHERE o.OrderType = 'Grailed'
AND ph.UserPhone LIKE '218%'
GROUP BY b.BrandID, b.BrandName */

-- combine both subqueries into one
SELECT A.BrandID, A.BrandName, A.TotalSelling
FROM (SELECT b.BrandID, b.BrandName, SUM(pt.Price) AS TotalSelling
FROM tblBRAND b
JOIN tblPRODUCT p ON b.BrandID = p.BrandID
JOIN tblPRODUCT_TYPE pt ON p.ProductID = pt.ProductID
WHERE pt.ProductCondition = 'New'
AND pt.ProductSize = 'US11'
AND pt.ProductColor = 'Pink'
AND p.ProductName LIKE 'New%'
GROUP BY b.BrandID, b.BrandName
HAVING SUM(pt.Price) >= 500) A,
    (SELECT b.BrandID, b.BrandName
FROM tblBRAND b
JOIN tblPRODUCT p ON b.BrandID = p.BrandID
JOIN tblPRODUCT_TYPE pt ON p.ProductID = pt.ProductID
JOIN tblORDER o ON pt.OrderID = o.OrderID
JOIN tblUSER u ON o.UserID = u.UserID
JOIN tblUSER_PHONE up ON u.UserID = up.UserID
JOIN tblPHONE ph ON up.UserPhoneID = ph.UserPhoneID
WHERE o.OrderType = 'Grailed'
AND ph.UserPhone LIKE '218%'
GROUP BY b.BrandID, b.BrandName) B
WHERE A.BrandID = B.BrandID
ORDER BY A.TotalSelling DESC


/* SQL code for two complex queries by Ash Srikanth */
-- Query #1: People that have bought Nikes with an American Express and gave them a 5 star review
SELECT u.UserFName, u.UserLName, RatingStar
FROM tblUSER u
JOIN tblPAYMENTMETHOD pm ON u.UserID = pm.UserID
JOIN tblRATING r ON u.UserID = r.UserID
JOIN tblRESELLER rs ON r.ResellerID = rs.ResellerID
JOIN tblPRODUCT_TYPE pt ON r.ResellerID = pt.ResellerID
JOIN tblPRODUCT p ON pt.ProductID = p.ProductID
JOIN tblBRAND b ON p.BrandID = b.BrandID
WHERE b.BrandName = 'Nike'
AND pm.PaymentMethod = 'American Express'
AND r.RatingStar = 5

-- Query #2: Find the 5 most expensive products, and their brands, in descending order
SELECT TOP 5 p.ProductName, pt.Price, b.BrandName
FROM tblPRODUCT p
JOIN tblPRODUCT_TYPE pt ON p.ProductID = pt.ProductID
JOIN tblBRAND b ON p.BrandID = b.BrandID
ORDER BY pt.Price DESC


/* SQL code for two complex queries by Viru Repalle */
-- Find the total price of listings for each unique brand
SELECT b.BrandName, SUM(pt.Price) AS TotalPrice, COUNT(pt.ProductTypeID) AS ProductsSold
FROM tblBRAND b
   JOIN tblPRODUCT p ON p.BrandID = b.BrandID
   JOIN tblPRODUCT_TYPE pt ON pt.ProductID = p.ProductID
GROUP BY b.BrandName
ORDER BY TotalPrice

-- Find the highest Average amount a resller has sold.
SELECT  TOP 1 ResellerFname, ResellerLname, SUM(pt.Price)/ COUNT(pt.ProductTypeID) AS AvgSold
FROM tblRESELLER r
   JOIN tblPRODUCT_TYPE pt ON pt.ResellerID = r.ResellerID
GROUP BY ResellerFname, ResellerLname
ORDER BY AvgSold DESC



