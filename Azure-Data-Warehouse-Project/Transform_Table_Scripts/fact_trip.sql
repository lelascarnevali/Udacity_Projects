IF OBJECT_ID('dbo.fact_trip') IS NOT NULL
BEGIN
    DROP EXTERNAL TABLE dbo.fact_trip
END

CREATE EXTERNAL TABLE [dbo].[fact_trip] WITH(
    LOCATION = 'DW/fact_trip',
    DATA_SOURCE = [dataengudacity_dataengudacity_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (

    SELECT
        CONVERT(VARCHAR, CONVERT(DATE, tri.Started_At), 112) as id_date_start,
        tri.Start_Station_Id as id_station_start,
        CONVERT(VARCHAR, CONVERT(DATE, tri.Ended_At), 112) as id_date_end,
        tri.End_Station_Id as id_station_end,
        Rider_Id as id_rider,
        DateDIFF(YEAR, CONVERT(DATE, rid.Birthday), CONVERT(DATE, tri.Started_At)) AS Rider_Age,
        DATEDIFF(MINUTE, CONVERT(DATETIME2, tri.Started_At), CONVERT(DATETIME2, tri.Ended_At)) AS nr_trip_minutes_duration
    FROM
        dbo.staging_trip AS tri
        JOIN dbo.staging_rider AS rid
        ON rid.Rider_Id = tri.Member_Id

);

Go