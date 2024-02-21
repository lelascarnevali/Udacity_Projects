IF OBJECT_ID('dbo.fact_payment') IS NOT NULL
BEGIN
    DROP EXTERNAL TABLE dbo.fact_payment
END

CREATE EXTERNAL TABLE [dbo].[fact_payment] WITH(
    LOCATION = 'DW/fact_payment',
    DATA_SOURCE = [dataengudacity_dataengudacity_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (

    SELECT
        CONVERT(VARCHAR, CONVERT(DATE, pay.PaymentDate), 112) as id_date,
        rid.Rider_id as id_rider,
        pay.Amount as vl_account_amount,
        DATEDIFF(YEAR, CONVERT(DATE, rid.Birthday), CONVERT(DATE, pay.PaymentDate))  as nr_rider_age
    FROM
        dbo.staging_payment pay
        JOIN dbo.staging_rider rid
        ON pay.AccountNumber = rid.Rider_id

);

Go