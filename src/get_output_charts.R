library(dplyr)
library(ggplot2)
library(plotly)

# Function to create a scatter plot (Median Age vs. Selected Variable)
get_scatter_plot <- function(df, y_var) {
  if (nrow(df) == 0) {
    stop("The filtered data frame is empty, cannot create scatter plot.")
  }
  
  plot <- ggplot(df, aes(x = `Median age`, y = !!sym(y_var))) +
    geom_point() +
    ggtitle(paste("Median Age vs.", y_var)) +
    xlab("Median Age") +
    ylab(y_var) +
    theme_minimal()
  
  return(plot)
}

# Function to create the Area Plot (Cumulative Dependency Trend)
get_area_plot <- function(df, dependency_column) {
  if (nrow(df) == 0) {
    stop("The filtered data frame is empty, cannot create area plot.")
  }
  
  df_cumulative <- df %>%
    mutate(
      `Total Dependency (%)` = `Child dependency (%)` + `Elderly dependency (%)`,
      `Child Dependency %` = (`Child dependency (%)` / `Total Dependency (%)`) * 100,
      `Elderly Dependency %` = (`Elderly dependency (%)` / `Total Dependency (%)`) * 100
    ) %>%
    arrange(Year)
  
  plot <- ggplot(df_cumulative, aes(x = Year)) +
    geom_bar(aes(y = !!sym(dependency_column), fill = dependency_column), stat = "identity") +
    ggtitle("Cumulative Dependency Trends Over Time") +
    xlab("Year") + ylab("Dependency (%)") +
    theme_minimal() +
    scale_fill_manual(
      values = c(
        "Child Dependency" = "#c3860d", 
        "Elderly Dependency" = "#c42e2e"
      )
    ) +
    theme(legend.position = "top") +
    scale_y_continuous(labels = scales::percent_format(scale = 1)) # Format y-axis as percentage
  
  return(plot)
}
