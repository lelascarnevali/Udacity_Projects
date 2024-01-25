IF OBJECT_ID('dbo.dim_date') IS NOT NULL
BEGIN
    DROP EXTERNAL TABLE dbo.dim_date
END

CREATE EXTERNAL TABLE [dbo].[dim_date] WITH(
    LOCATION = 'DW/dim_date',
    DATA_SOURCE = [dataengudacity_dataengudacity_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (

    SELECT 
        CONVERT(INT, CONVERT(VARCHAR, dt_date, 112)) id_date,
        dt_date,
        MONTH(dt_date) AS nr_month,
        DATEPART(QUARTER, dt_date) AS nr_quarter,
        YEAR(dt_date) AS nr_year,
        DATEPART(WEEKDAY, dt_date) AS nr_day_week,
        DAY(dt_date) AS nr_day_month,
        DATEPART(DAYOFYEAR, dt_date) AS nr_day_year 
    FROM dbo.staging_date 

);

Go