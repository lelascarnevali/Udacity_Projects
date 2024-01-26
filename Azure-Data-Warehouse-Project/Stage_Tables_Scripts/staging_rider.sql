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

CREATE EXTERNAL TABLE dbo.staging_rider (
	[Rider_Id] bigint,
	[First_Name] nvarchar(4000),
	[Last_Name] nvarchar(4000),
	[Address] nvarchar(4000),
	[Birthday] varchar(50),
	[Account_start_date] varchar(50),
	[Account_end_date] varchar(50),
	[Is_member] bit
	)
	WITH (
	LOCATION = 'rider.txt',
	DATA_SOURCE = [dataengudacity_dataengudacity_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO