IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ';',
			 FIRST_ROW = 02, --remove txt file header
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'dataengudacity_dataengudacity_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [dataengudacity_dataengudacity_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://dataengudacity@dataengudacity.dfs.core.windows.net'--, 
		--TYPE = HADOOP --Serveless do not support
	)

CREATE EXTERNAL TABLE dbo.staging_trip (
	[Trip_Id] nvarchar(4000),
	[rideable_type] nvarchar(4000),
	[Started_At] varchar(50),
	[Ended_At] varchar(50),
	[Start_Station_Id] nvarchar(4000),
	[End_Station_Id] nvarchar(4000),
	[Member_Id] bigint
	)
	WITH (
	LOCATION = 'trip.txt',
	DATA_SOURCE = [dataengudacity_dataengudacity_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO