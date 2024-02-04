# US Accidents between 2016-2023

## About the Dataset

The dataset consists of accidents in USA between 2016 and 2023. The data is present in Kaggle and can be found in "https://www.kaggle.com/datasets/sobhanmoosavi/us-accidents/data". The Kaggle data also leverages APIs to procure weather related information such as precipitation, temperature, windchill, etc.

Apart from this, APIs are used in order to procure the live traffic incidents in USA. For this process, the data is taken from MapQuest API. Once the API is set up, and a request is given to it, the API returns the following :
1. lat - Latitude
2. lng - Longitude
3. type - Incident type
4. severity - Severity of the incident (0-4 with 4 being highest)
5. eventCode - Standard Alert-C event codes
6. impacting - Indicates if traffic is impacted
7. startTime - Start time of the incident
8. endTime - End time of the incident
9. shortDesc - Short description of the incident
10. fullDesc - Full description of the incident
11. iconURL - Displaying the incident
12. distance - The length of the road affected by the accident (optional)
13. delayFromTypical - Delay from typical conditions (optional) in minutes
14. delayFromFreeFlow - Delay from free flowing conditions (optional) in minutes
15. tmcs - List of Traffic Message Channels (optional)

## Data Cleaning 

In the cleaning process, the main task was to clean the 500k x 47 data post a quick sanity check. The main processes were the following -
1. Column Removal : Columns which had only one unique value, or had a large percentage of null values were removed. Similarly columns that do not fit the problem statement or might not be suitable for modeling are also removed.
2. Column Formatting : All the column names are in camel case and are thus changed to normal lower case. Since we primarily deal with timestamp, we ensure it is properly formatted and we extract the time based features such as hour, dayofweek, month_name, etc. from them
3. Missing Value Treatment : There were three main ways in which missing values have been treated -
    a. For categorical columns which had missing values, it was replaced with a class "Unavailable"
    b. For continuous variables, a rule based method was leveraged in order to impute the missing values. This treatment was done at a county-month level
    c. For the remainder of missing values, they were replaced with 0s

## Exploratory Data Analysis

For the EDA process, various packages are used to analyze the data. Primarily, Seaborn is leveraged to plot the data and Folium is used extensively while analysing geospatial data (latitude and longitude). 
The EDA primarily focused on answering questions pertaining to accident patterns across months, seasons, dayofweek as well as hotspots. Accident hotspots were detected through the use of Folium and this was further extended to perform a deep dive on the accidents happening at Colorado