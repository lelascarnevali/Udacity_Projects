IF OBJECT_ID('dbo.NYC_Payroll_Summary') IS NOT NULL
BEGIN
    DROP EXTERNAL TABLE [dbo].[NYC_Payroll_Summary]
END

CREATE EXTERNAL TABLE [dbo].[NYC_Payroll_Summary](
[FiscalYear] [int] NULL,
[AgencyName] [varchar](50) NULL,
[TotalPaid] [float] NULL
)
WITH (
    LOCATION = '/dirstaging', -- Diretório específico no DataLake Gen2
    DATA_SOURCE = [dataengudacity_dataengudacity_dfs_core_windows_net], -- Sua fonte de dados externa
    FILE_FORMAT = [SynapseDelimitedTextFormat] -- Formato de arquivo externo
)