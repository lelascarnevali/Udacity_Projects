# Udacity Project - Data Engineering with Azure

## Data Integration Pipelines for NYC Payroll Data Analytics

### Instructions: Create and Configure Resources

#### Project Instructions
For this project, you'll do your work in the Azure Portal, using several Azure resources including:

Azure Data Lake Gen2
Azure SQL DB
Azure Data Factory
Azure Synapse Analytics

Instructions for using a temporary Azure account to complete the project are on the previous page.

When you submit your project, it will be assessed against this [project rubric](https://learn.udacity.com/rubric/5487). Take a moment to review it now and periodically throughout the project to make sure you're meeting the requirements.

#### Project Data
Download these [.csv files](https://video.udacity-data.com/topher/2022/May/6283aff5_data-nyc-payroll/data-nyc-payroll.zip) that ***provide the data for the project***.

#### Step 1: Prepare the Data Infrastructure
Setup Data and Resources in Azure

**1.Create the data lake and upload data**

Log into your temporary Azure account (instructions on the previous page) and create the following resources. Please use the provided resource group to create each resource. You will use these resources for the whole project, in all of the steps, so you'll only need to create one of each:

Create an Azure Data Lake Storage Gen2 (storage account) and associated storage container resource named **adlsnycpayroll-yourfirstname-lastintial**.

In the Azure Data Lake Gen2 creation flow, go to Advanced tab and ensure below options are checked:

Require secure transfer for REST API operations
* Allow enabling anonymous access on individual containers
* Enable storage account key access
* Default to Microsoft Entra authorization in the Azure portal
* Enable hierarchical namespace

Create three directories in this storage container named

* **dirpayrollfiles**
* **dirhistoryfiles**
* **dirstaging**

*dirstaging* will be used by the pipelines we will create as part of the project to store staging data for integration with Azure Synapse. This will be discussed in further pages

Upload these files from the [project data](https://video.udacity-data.com/topher/2022/May/6283aff5_data-nyc-payroll/data-nyc-payroll.zip) to the **dirpayrollfiles** folder

* EmpMaster.csv
* AgencyMaster.csv
* TitleMaster.csv
* nycpayroll_2021.csv

Upload this file (historical data) from the [project data](https://video.udacity-data.com/topher/2022/May/6283aff5_data-nyc-payroll/data-nyc-payroll.zip) to the **dirhistoryfiles** folder

* nycpayroll_2020.csv

***Solution***


```
 az storage account create --name dataengudacity --resource-group ODL-DataEng-255714 --location eastus --sku Standard_LRS --kind StorageV2 --enable-hierarchical-namespace true --allow-blob-public-access true

 az storage container create --name dataengudacity --account-name dataengudacity

 az storage blob directory create --account-name dataengudacity --container-name dataengudacity --directory-path dirpayrollfiles

 az storage blob directory create --account-name dataengudacity --container-name dataengudacity --directory-path dirhistoryfiles

 az storage blob directory create --account-name dataengudacity --container-name dataengudacity --directory-path dirstaging

 az storage blob upload --account-name dataengudacity --container-name dataengudacity --name dirhistoryfiles/nycpayroll_2020.csv --type block --file Data/nycpayroll_2020.csv --auth-mode login

 az storage blob upload --account-name dataengudacity --container-name dataengudacity --name dirpayrollfiles/EmpMaster.csv --type block --file Data/EmpMaster.csv --auth-mode login

 az storage blob upload --account-name dataengudacity --container-name dataengudacity --name dirpayrollfiles/AgencyMaster.csv --type block --file Data/AgencyMaster.csv --auth-mode login

 az storage blob upload --account-name dataengudacity --container-name dataengudacity --name dirpayrollfiles/TitleMaster.csv --type block --file Data/TitleMaster.csv --auth-mode login

 az storage blob upload --account-name dataengudacity --container-name dataengudacity --name dirpayrollfiles/nycpayroll_2021.csv --type block --file Data/nycpayroll_2021.csv --auth-mode login
 ```
 <br>

 <img src="images/Step1_Data_Lake_Gen2_creation.png" alt="dimension model" width="800">