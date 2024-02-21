IF OBJECT_ID('dbo.dim_station') IS NOT NULL
BEGIN
    DROP EXTERNAL TABLE dbo.dim_station
END

CREATE EXTERNAL TABLE [dbo].[dim_station] WITH(
    LOCATION = 'DW/dim_station',
    DATA_SOURCE = [dataengudacity_dataengudacity_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (

    SELECT
        [Station_ID] as id_station,
        [Name] as nm_station,
        [Latitude] as nr_latitude,
        [Longitude] as nr_longitude
    FROM
        dbo.staging_station

);

Go