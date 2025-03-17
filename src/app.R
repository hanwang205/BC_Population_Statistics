library(shiny)
library(shinydashboard)
library(plotly)
library(dplyr)
library(ggplot2)

# Source the functions for generating charts
source('./get_output_charts.R')

# UI for the Shiny App with Dashboard
ui <- dashboardPage(
  dashboardHeader(title = "BC Population Statistics Dashboard"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      
      # Year Slicer
      selectInput("Year", "Select a Year", choices = c("All Years", df$Year), selected = "All Years"),
      
      # Multiple year slicer (optional)
      selectizeInput("Year_multi", "Select Multiple Years", 
                     choices = df$Year, multiple = TRUE, 
                     options = list(placeholder = 'Select multiple years')),
      
      # Median Age Slider Input
      sliderInput(
        'median_age_range',
        'Select Median Age Range',
        min = min(df$`Median age`),
        max = max(df$`Median age`),
        value = c(min(df$`Median age`), max(df$`Median age`))
      ),
      
      # Select Y-axis variable for scatter plot
      selectInput(
        'y_col',
        'Select Variable for Scatter',
        choices = c("Life Expectancy" = "Life expectancy at birth", "Total Fertility Rate" = "Total fertility rate"),
        selected = 'Life Expectancy'
      ),
      
      # Dependency type selection for bar charts
      selectInput("dependency_type", "Select Dependency Type", 
                  choices = c("Total Dependency" = "Total dependency (%)", 
                              "Child Dependency" = "Child dependency (%)", 
                              "Elderly Dependency" = "Elderly dependency (%)"), 
                  selected = "Total dependency (%)")
    )
  ),
  
  # Body of the dashboard with the plot output area
  dashboardBody(
    fluidRow(
      # Box for the line chart (Population Trends Over Time)
      box(title = "Population Trends Over Time", plotOutput("plot1", height = 300)),
      box(title = "Scatter Plot", plotlyOutput("plot", height = 300))
    ),
    fluidRow(
      # Box for the area plot (Cumulative Dependency Trend)
      box(title = "Dependency Trends Over Time", plotOutput("area_plot", height = 300)) 
    )
  )
)

# Server logic for filtering data and rendering plots
server <- function(input, output) {
  
  # Reactive expression to filter data based on selected year(s)
  filtered_data <- reactive({
    if (input$Year == "All Years") {
      df
    } else {
      df %>% filter(Year == input$Year)
    }
  })
  
  # Output for a plot of selected data (Total Population Over Year - Line Chart)
  output$plot1 <- renderPlot({
    ggplot(filtered_data(), aes(x = Year, y = `Total population`)) +  # Use the Total population column
      geom_point(color = "blue", size = 1) +  # Line chart
      ggtitle("Total Population Over Time") +
      xlab("Year") + ylab("Total Population") +
      theme_minimal() 
  })
  
  # Output for Scatter plot (Median Age vs Selected Variable)
  output$plot <- renderPlotly({
    filtered_data <- df |> 
      filter(between(`Median age`, input$median_age_range[1], input$median_age_range[2]))
    
    ggplotly(
      ggplot(filtered_data, aes(x = `Median age`, y = !!sym(input$y_col))) +
        geom_point() +
        ggtitle("Scatter Plot: Median Age vs. Selected Variable") +
        xlab("Median Age") +
        ylab(input$y_col) +
        theme_minimal()
    )
  })
  
  # Output for the Area plot (Cumulative Dependency Trend)
  output$area_plot <- renderPlot({
    get_area_plot(filtered_data(), input$dependency_type)
  })
}

# Run the app
shinyApp(ui = ui, server = server)
