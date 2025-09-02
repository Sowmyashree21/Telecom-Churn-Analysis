CREATE DATABASE churn;
USE churn;

SELECT * FROM customer_data
LIMIT 10;

SELECT COUNT(*) FROM customer_data;

SELECT Gender, COUNT(Gender) AS TotalCount,
COUNT(Gender) * 100.0 / (SELECT COUNT(*) FROM customer_data) AS Percentage
FROM customer_data
GROUP BY Gender;

SELECT Contract, COUNT(Contract) AS TotalCount,
COUNT(Contract) * 100.0 / (SELECT COUNT(*) FROM customer_data) AS Percentage
FROM customer_data
GROUP BY Contract;

SELECT Customer_Status, COUNT(Customer_Status) AS TotalCount, SUM(Total_Revenue) AS TotalRevenue,
SUM(Total_Revenue)/(SELECT SUM(Total_Revenue) FROM customer_data) * 100 AS RevenuePercent
FROM customer_data
GROUP BY Customer_Status;

SELECT State, COUNT(State) AS ToatlCount,
COUNT(State) * 100.0 / (SELECT COUNT(*) FROM customer_data) AS Percentage
FROM customer_data
GROUP BY State
ORDER BY Percentage DESC;

SELECT DISTINCT Internet_Type
FROM customer_data;

-- Checking for empty/blank strings 
SELECT 
    SUM(CASE WHEN Customer_ID IS NULL OR Customer_ID = '' THEN 1 ELSE 0 END) AS Customer_ID_NullOrEmpty_Count,
    SUM(CASE WHEN Gender IS NULL OR Gender = '' THEN 1 ELSE 0 END) AS Gender_NullOrEmpty_Count,
    SUM(CASE WHEN Age IS NULL OR Age = '' THEN 1 ELSE 0 END) AS Age_NullOrEmpty_Count,
    SUM(CASE WHEN Married IS NULL OR Married = '' THEN 1 ELSE 0 END) AS Married_NullOrEmpty_Count,
    SUM(CASE WHEN State IS NULL OR State = '' THEN 1 ELSE 0 END) AS State_NullOrEmpty_Count,
    SUM(CASE WHEN Number_of_Referrals IS NULL OR Number_of_Referrals = '' THEN 1 ELSE 0 END) AS Number_of_Referrals_NullOrEmpty_Count,
    SUM(CASE WHEN Tenure_in_Months IS NULL OR Tenure_in_Months = '' THEN 1 ELSE 0 END) AS Tenure_in_Months_NullOrEmpty_Count,
    SUM(CASE WHEN Value_Deal IS NULL OR Value_Deal = '' THEN 1 ELSE 0 END) AS Value_Deal_NullOrEmpty_Count,
    SUM(CASE WHEN Phone_Service IS NULL OR Phone_Service = '' THEN 1 ELSE 0 END) AS Phone_Service_NullOrEmpty_Count,
    SUM(CASE WHEN Multiple_Lines IS NULL OR Multiple_Lines = '' THEN 1 ELSE 0 END) AS Multiple_Lines_NullOrEmpty_Count,
    SUM(CASE WHEN Internet_Service IS NULL OR Internet_Service = '' THEN 1 ELSE 0 END) AS Internet_Service_NullOrEmpty_Count,
    SUM(CASE WHEN Internet_Type IS NULL OR Internet_Type = '' THEN 1 ELSE 0 END) AS Internet_Type_NullOrEmpty_Count,
    SUM(CASE WHEN Online_Security IS NULL OR Online_Security = '' THEN 1 ELSE 0 END) AS Online_Security_NullOrEmpty_Count,
    SUM(CASE WHEN Online_Backup IS NULL OR Online_Backup = '' THEN 1 ELSE 0 END) AS Online_Backup_NullOrEmpty_Count,
    SUM(CASE WHEN Device_Protection_Plan IS NULL OR Device_Protection_Plan = '' THEN 1 ELSE 0 END) AS Device_Protection_Plan_NullOrEmpty_Count,
    SUM(CASE WHEN Premium_Support IS NULL OR Premium_Support = '' THEN 1 ELSE 0 END) AS Premium_Support_NullOrEmpty_Count,
    SUM(CASE WHEN Streaming_TV IS NULL OR Streaming_TV = '' THEN 1 ELSE 0 END) AS Streaming_TV_NullOrEmpty_Count,
    SUM(CASE WHEN Streaming_Movies IS NULL OR Streaming_Movies = '' THEN 1 ELSE 0 END) AS Streaming_Movies_NullOrEmpty_Count,
    SUM(CASE WHEN Streaming_Music IS NULL OR Streaming_Music = '' THEN 1 ELSE 0 END) AS Streaming_Music_NullOrEmpty_Count,
    SUM(CASE WHEN Unlimited_Data IS NULL OR Unlimited_Data = '' THEN 1 ELSE 0 END) AS Unlimited_Data_NullOrEmpty_Count,
    SUM(CASE WHEN Contract IS NULL OR Contract = '' THEN 1 ELSE 0 END) AS Contract_NullOrEmpty_Count,
    SUM(CASE WHEN Paperless_Billing IS NULL OR Paperless_Billing = '' THEN 1 ELSE 0 END) AS Paperless_Billing_NullOrEmpty_Count,
    SUM(CASE WHEN Payment_Method IS NULL OR Payment_Method = '' THEN 1 ELSE 0 END) AS Payment_Method_NullOrEmpty_Count,
    SUM(CASE WHEN Monthly_Charge IS NULL OR Monthly_Charge = '' THEN 1 ELSE 0 END) AS Monthly_Charge_NullOrEmpty_Count,
    SUM(CASE WHEN Total_Charges IS NULL OR Total_Charges = '' THEN 1 ELSE 0 END) AS Total_Charges_NullOrEmpty_Count,
    SUM(CASE WHEN Total_Refunds IS NULL OR Total_Refunds = '' THEN 1 ELSE 0 END) AS Total_Refunds_NullOrEmpty_Count,
    SUM(CASE WHEN Total_Extra_Data_Charges IS NULL OR Total_Extra_Data_Charges = '' THEN 1 ELSE 0 END) AS Total_Extra_Data_Charges_NullOrEmpty_Count,
    SUM(CASE WHEN Total_Long_Distance_Charges IS NULL OR Total_Long_Distance_Charges = '' THEN 1 ELSE 0 END) AS Total_Long_Distance_Charges_NullOrEmpty_Count,
    SUM(CASE WHEN Total_Revenue IS NULL OR Total_Revenue = '' THEN 1 ELSE 0 END) AS Total_Revenue_NullOrEmpty_Count,
    SUM(CASE WHEN Customer_Status IS NULL OR Customer_Status = '' THEN 1 ELSE 0 END) AS Customer_Status_NullOrEmpty_Count,
    SUM(CASE WHEN Churn_Category IS NULL OR Churn_Category = '' THEN 1 ELSE 0 END) AS Churn_Category_NullOrEmpty_Count,
    SUM(CASE WHEN Churn_Reason IS NULL OR Churn_Reason = '' THEN 1 ELSE 0 END) AS Churn_Reason_NullOrEmpty_Count
FROM customer_data;

CREATE TABLE customer_new AS
SELECT 
    Customer_ID,
    Gender,
    Age,
    Married,
    State,
    Number_of_Referrals,
    Tenure_in_Months,
    IFNULL(NULLIF(Value_Deal, ''), 'None') AS Value_Deal,
    Phone_Service,
    IFNULL(NULLIF(Multiple_Lines, ''), 'No') AS Multiple_Lines,
    Internet_Service,
    IFNULL(NULLIF(Internet_Type, ''), 'None') AS Internet_Type,
    IFNULL(NULLIF(Online_Security, ''), 'No') AS Online_Security,
    IFNULL(NULLIF(Online_Backup, ''), 'No') AS Online_Backup,
    IFNULL(NULLIF(Device_Protection_Plan, ''), 'No') AS Device_Protection_Plan,
    IFNULL(NULLIF(Premium_Support, ''), 'No') AS Premium_Support,
    IFNULL(NULLIF(Streaming_TV, ''), 'No') AS Streaming_TV,
    IFNULL(NULLIF(Streaming_Movies, ''), 'No') AS Streaming_Movies,
    IFNULL(NULLIF(Streaming_Music, ''), 'No') AS Streaming_Music,
    IFNULL(NULLIF(Unlimited_Data, ''), 'No') AS Unlimited_Data,
    Contract,
    Paperless_Billing,
    Payment_Method,
    Monthly_Charge,
    Total_Charges,
    Total_Refunds,
    Total_Extra_Data_Charges,
    Total_Long_Distance_Charges,
    Total_Revenue,
    Customer_Status,
    IFNULL(NULLIF(Churn_Category, ''), 'Others') AS Churn_Category,
    IFNULL(NULLIF(Churn_Reason, ''), 'Others') AS Churn_Reason
FROM customer_data;

SELECT * FROM customer_new
LIMIT 10;

CREATE VIEW vw_ChurnData AS
	SELECT * FROM customer_new 
    WHERE Customer_Status IN('Churned', 'Stayed');
    
CREATE VIEW vw_JoinData AS
	SELECT * FROM customer_new 
    WHERE Customer_Status = 'Joined';
