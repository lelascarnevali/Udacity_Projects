IF OBJECT_ID('dbo.dim_rider') IS NOT NULL
BEGIN
    DROP EXTERNAL TABLE dbo.dim_rider
END

CREATE EXTERNAL TABLE [dbo].[dim_rider] WITH(
    LOCATION = 'DW/dim_rider',
    DATA_SOURCE = [dataengudacity_dataengudacity_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (

    SELECT
        Rider_Id as id_rider,
        First_Name as nm_first_name,
        Last_Name as nm_last_name,
        CONVERT(Date, Birthday) as dt_birthday,
        Is_member as bl_is_member,
        CONVERT(Date, Account_start_date) as dt_account_start,
        CONVERT(Date, Account_end_date) as dt_account_end
    FROM
        dbo.staging_rider

);

Go