IF OBJECT_ID('dbo.staging_date') IS NOT NULL
BEGIN
    DROP EXTERNAL TABLE dbo.staging_date
END

CREATE EXTERNAL TABLE [dbo].[staging_date] WITH(
    LOCATION = 'staging_date',
    DATA_SOURCE = [dataengudacity_dataengudacity_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (

    SELECT DISTINCT CONVERT(Date, Birthday) AS dt_date FROM dbo.staging_rider
    UNION
    SELECT DISTINCT CONVERT(Date, PaymentDate) AS dt_date FROM dbo.staging_payment
    UNION 
    SELECT DISTINCT CONVERT(Date, Account_start_date) AS dt_date FROM dbo.staging_rider
    UNION 
    SELECT DISTINCT CONVERT(Date, Account_end_date) AS dt_date FROM dbo.staging_rider
    UNION 
    SELECT DISTINCT CONVERT(Date, Started_At) AS dt_date FROM dbo.staging_trip
    UNION 
    SELECT DISTINCT CONVERT(Date, Ended_At) AS dt_date FROM dbo.staging_trip
);