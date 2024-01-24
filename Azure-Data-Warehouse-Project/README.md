# Udacity Project - Data Engineering with Azure
# Building an Azure Data Warehouse for Bike Share Data Analytics


## **Project Overview**

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


### Dependencies

In order to complete this project, you'll need to use these tools:

* Access to Microsoft Azure.
* Python to run the script to load data into a PostgreSQL database on Azure to simulate your OLTP data source
* An editor to work with the Python and SQL scripts, like Visual Studio Code

### Installation

Step by step explanation of how to get a dev environment running.

List out the steps

```
Give an example here
```

## Testing

Explain the steps needed to run any automated tests

### Break Down Tests

Explain what each test does and why

```
Examples here
```

## Project Instructions

This section should contain all the student deliverables for this project.

## Built With

* [Item1](www.item1.com) - Description of item
* [Item2](www.item2.com) - Description of item
* [Item3](www.item3.com) - Description of item

Include all items used to build project.

## License

[License](LICENSE.txt)
