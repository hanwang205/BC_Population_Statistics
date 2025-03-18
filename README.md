# BC Population Statistics Dashboard"

## 📊 **For Dashboard Users**

### Motivation & Problem Solving

Population growth and demographic trends are crucial for shaping policies that address the future needs of British Columbia (BC). The **BC Population Statistics Dashboard** helps policymakers, researchers, and the public explore the province's demographic trends, including population size, life expectancy, median age, and dependency types. By visualizing this data, the dashboard helps identify key areas for policy action related to social services, health, and urban planning.

With this dashboard, you can explore:

- **Population Trends Over Time**: See how BC's total population has changed across the years.
- **Life Expectancy vs. Median Age**: Analyze how the life expectancy at birth compares with median age trends.
- **Dependency Trends**: Visualize the trends in child and elderly dependency percentages over time, helping to understand the aging population and the strain on social services.
  
The dashboard features:

- **Total Population Over Time**: A line chart displaying the total population of BC over the years. The chart allows users to explore growth patterns.
  
- **Scatter Plot (Life Expectancy vs. Median Age)**: A scatter plot that shows the relationship between median age and life expectancy, helping to analyze how aging populations impact life expectancy in BC.
  
- **Dependency Trends Over Time**: A stacked bar chart showing the child and elderly dependency ratios over the years. This feature highlights the potential for future demographic shifts.
  
- **Multiple Year Comparison**: Allows users to compare demographic trends across multiple years for a more granular view of population changes.

To get an idea of how the dashboard looks and functions, here’s a short demo of the app in action:  
![Demo GIF](img/demo.mp4)

### Need Help?

If you encounter any issues or have questions, please feel free to open an issue in the GitHub repository. We’re happy to assist!

---

## 🛠️ **For Developers and Contributors**

Thank you for considering contributing to the **BC Population Statistics Dashboard**! We welcome contributions to improve the project, whether it’s adding new features, fixing bugs, or improving documentation. Below is a guide to help you get started.

### Prerequisites

To run the app locally, you need to set up your environment with the required dependencies.

### Environment Setup

1. Clone the repository:

    ```bash
    git clone https://github.com/hanwang205/BC_Population_Statistics.git
    ```

2. Navigate to the project directory:

    ```bash
    cd BC_Population_Statistics
    ```

3. Create an environment using `renv` (for R packages):

    ```bash
    renv::restore()
    ```

4. Activate the environment:

    ```bash
    renv::activate()
    ```

### Running the Dashboard Locally

1. After activating the environment, run the app in RStudio by executing:

    ```r
    shiny::runApp()
    ```

2. The app will open in your default web browser.


### Issues & Pull Requests

If you encounter any issues while using the dashboard or have an idea for a new feature, feel free to open an issue or submit a pull request. Please follow the contributing guidelines and provide relevant information.

---

## 📄 **License**

The BC Population Statistics Dashboard is licensed under the MIT license. See the LICENSE file for more details.

---

## 👨‍💻 **Contributors**

- Han Wang

---

## 🔗 **References**

Data source: **BC Population Projections Dataset**  
Access the dataset [here](https://catalogue.data.gov.bc.ca/dataset/bc-population-projections).
