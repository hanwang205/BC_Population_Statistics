library(dplyr)
library(readxl)

clean_data <- function(file_path) {
  # Load the data from Excel file, skipping the first 3 rows
  data <- read_excel(file_path, sheet = "Table 1", skip = 4)
  
  # Clean the data: Keep only the first 77 rows, remove NAs, convert Total population to numeric, and multiply by 1000
  df <- data %>%
    head(77) %>%
    na.omit() %>%
    mutate(
      `Total population (000s)` = as.numeric(`Total population (000s)`), # Ensure the column is numeric
      `Total population` = `Total population (000s)` * 1000,  # Multiply by 1000 to convert to total population
      `Life expectancy at birth` = as.numeric(`Life expectancy at birth`),
      `Total fertility rate` = as.numeric(`Total fertility rate`),
      `Life expectancy at birth` = round(`Life expectancy at birth`, 3), # Round Life expectancy at birth to 3 decimals
      `Total fertility rate` = round(`Total fertility rate`, 3)
    ) %>%
    filter(Year >= 2000 & Year <= 2023) %>%
    arrange(Year)  # Sort years in ascending order
  
  return(df)
}

# Call the function to clean the data and store it in a variable
cleaned_df <- clean_data('data/raw/1971-table_2023_estimates_-_2024-2046_projections.xlsx')

# Save the cleaned dataframe to a CSV file in the "data/clean/" folder
write.csv(cleaned_df, "data/clean/cleaned_population_data.csv", row.names = FALSE)

