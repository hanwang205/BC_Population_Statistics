# BC-Population-Statistics

---
title: "BC Population Statistics Dashboard"
output: github_document
---

## Motivation

**Target Audience:** Data analysts, policymakers, and anyone interested in the demographic statistics of British Columbia (BC).

This app helps users explore the population statistics of BC, including trends over time for total population, life expectancy, median age, and dependency types. It enables users to filter data based on the year range, median age, and selected variables like life expectancy and fertility rates. The aim is to provide a tool for visualizing key population trends that can assist in policymaking, research, and strategic planning for the province's future.

------------------------------------------------------------------------

## App Description

This dashboard provides a range of interactive visualizations to explore the demographic trends of British Columbia. It includes:

-   **Population Trends Over Time:** A line plot of the total population over the years.
-   **Scatter Plot:** A scatter plot showing the relationship between median age and selected variables like life expectancy and fertility rates.
-   **Dependency Trends:** A bar chart visualizing the trends of child and elderly dependency over time.
-   **Top 10 Years by Total Population:** A card displaying the top 10 years based on the total population in BC.

The app allows users to filter data based on the year, median age, and other parameters to help them better understand the trends and relationships in the data.

[Here you can provide a link to a video demo or embed it directly if possible.]

------------------------------------------------------------------------

## Installation Instructions

### 1. Install Conda

If you don't have Conda installed, download and install Anaconda from [here](https://www.anaconda.com/products/individual).

### 2. Create a Conda Environment

Clone this repository and navigate to the project directory in your terminal. Then run the following command to create a Conda environment using the provided `environment.yml`:

```bash conda env create -f environment.yml

### 3. Activate the Conda Environment

After the environment is created, activate it by running:

```bash conda activate bc_population_dashboard

### 4. Open the App in RStudio

Once your environment is set up, open the project in RStudio and run the app:

Open the terminal in RStudio (Tools -\> Terminal -\> New Terminal). Make sure the environment is activated in the terminal. Run the following R code in the Console to launch the app: r Copy shiny::runApp("https://github.com/hanwang205/BC_Population_Statistics.git") The app should now be accessible in your web browser.

##App Features 
Year Slicer: Filter the data by year to analyze trends within specific periods. 
Multiple Year Slicer: Allows the user to select multiple years for comparison. 
Median Age Slider: Dynamically filter data based on a range of median ages. 
Scatter Plot: Select variables such as Life Expectancy or Total Fertility Rate for comparison with Median Age. 
Dependency Trends: Analyze child and elderly dependency as a percentage of total dependency over time. 
Top 10 Years by Total Population: View the top 10 years based on total population in BC.

## Data Source

The data for this dashboard is sourced from the BC Population Projections dataset. You can access the dataset at this link : <https://catalogue.data.gov.bc.ca/dataset/bc-population-projections>
