# Udacity Project - Data Engineering with Azure

## Building an Azure Data Warehouse for Bike Share Data Analytics


### **Project Overview**

Divvy is a bike sharing program in Chicago, Illinois USA that allows riders to purchase a pass at a kiosk or use a mobile application to unlock a bike at stations around the city and use the bike for a specified amount of time. The bikes can be returned to the same station or to another station. The City of Chicago makes the anonymized bike trip data publicly available for projects like this where we can analyze the data.

Since the data from Divvy are anonymous, we have created fake rider and account profiles along with fake payment data to go along with the data from Divvy. The dataset looks like this:

<img src="images/data-model.png" alt="data model" width="1000">

### The goal of this project is to develop a data warehouse solution using Azure Synapse Analytics. You will:

* `Design a star schema` based on the business outcomes listed below;
* `Import the data` into Synapse;
* `Transform the data` into the star schema;
* `View the reports` from Analytics.

### The business outcomes you are designing for are as follows:
1. Analyze how much time is spent per ride
    * Based on date and time factors such as day of week and time of day
    * Based on which station is the starting and / or ending station
    * Based on age of the rider at time of the ride
    * Based on whether the rider is a member or a casual rider
2. Analyze how much money is spent
    * Per month, quarter, year
    * Per member, based on the age of the rider at account start
3. EXTRA CREDIT - Analyze how much money is spent per member
    * Based on how many rides the rider averages per month
    * Based on how many minutes the rider spends on a bike per month


## Project Tasks

### Task 1: Create your Azure resources

* Create an Azure Database for PostgreSQL.
* Create an Azure Synapse workspace. 
* Use the built-in serverless SQL pool and database within the Synapse workspace

**Result**

### Task 2: Design a star schema

You are being provided a relational schema that describes the data as it exists in PostgreSQL. In addition, you have been given a set of business requirements related to the data warehouse. You are being asked to design a star schema using fact and dimension tables.

**Result**

<img src="images/dimensional-model.jpeg" alt="dimension model" width="1000">

### Task 3: Create the data in PostgreSQL
To prepare your environment for this project, you first must create the data in PostgreSQL. This will simulate the production environment where the data is being used in the OLTP system. This can be done using the Python script provided for you in Github: [`ProjectDataToPostgres.py`](https://github.com/udacity/Azure-Data-Warehouse-Project/tree/main/starter)

1. Download the script file and place it in a folder where you can run a Python script
2. [Download the data files](https://video.udacity-data.com/topher/2022/March/622a5fc6_azure-data-warehouse-projectdatafiles/azure-data-warehouse-projectdatafiles.zip)  from the classroom resources 
3. Open the script file in VS Code and add the host, username, and password information for your PostgreSQL database
4. Run the script and verify that all four data files are copied/uploaded into PostgreSQL

You can verify this data exists by using pgAdmin or a similar PostgreSQL data tool.

**Result**



### Task 4: EXTRACT the data from PostgreSQL
In your Azure Synapse workspace, you will use the ingest wizard to create a one-time pipeline that ingests the data from PostgreSQL into Azure Blob Storage. This will result in all four tables being represented as text files in Blob Storage, ready for loading into the data warehouse.

**Result**

### Task 5: LOAD the data into external tables in the data warehouse
Once in Blob storage, the files will be shown in the data lake node in the Synapse Workspace. From here, you can use the script-generating function to load the data from blob storage into external staging tables in the data warehouse you created using the serverless SQL Pool.

**Result**

## License

[License](LICENSE.txt)
