# PCA-Analysis-in-R

# Overview

This repository contains an R script and resources for performing **Principal Component Analysis (PCA)** on multivariate data. The script helps visualize relationships between variables and observations, making it especially useful for analyzing datasets with numerous interrelated variables. PCA is a powerful tool for reducing the dimensionality of complex datasets, allowing researchers to identify key patterns and trends.

## Why PCA?

PCA is a widely used method in data analysis to transform large datasets into a few uncorrelated variables called **principal components**. This method simplifies data interpretation while retaining as much variability as possible. For datasets that involve a variety of factors (e.g., soil health indicators, microbial metrics, environmental measurements), PCA can highlight which variables contribute the most to variation and help in visualizing groupings or trends within the data.

### Data Structuring

Proper structuring of the data is crucial for PCA:

- **Numeric Data**: PCA requires numeric input, so any non-numeric data must be excluded or converted before analysis.
- **Missing Data**: Missing values need to be handled by omitting rows or using an imputation method. The script provided ensures missing values are omitted.

### Repository Content

This repository contains one script that performs the complete PCA analysis, from preparing the data to visualizing the results.

- **PCA_Analysis.R**: This script includes all the steps necessary to run PCA on your dataset:
    - **Data Preparation**: Prepares and cleans the data by ensuring all columns are numeric and handling missing values.
    - **PCA Computation**: Runs PCA using the `FactoMineR` package.
    - **Visualization**: Creates visualizations such as scree plots, variable contribution plots, and PCA biplots, with optional color coding based on grouping variables (e.g., `Practice` or `Depth`).

Each section of the script is clearly commented to explain what each block of code is doing, making the analysis reproducible and easy to follow.

### Getting Started

To use this repository:

1. **Clone the repository** to your local machine.
2. **Install the required R libraries**:
    - Run the following commands in R to install the necessary packages:
```
install.packages("FactoMineR")
install.packages("factoextra")
install.packages("ggplot2")
install.packages("dplyr")
```

3. **Modify the file path**: Adjust the file path in the script to point to your dataset.
4. **Run the script**: The script will perform the following steps:
    - Read and clean your dataset.
    - Perform PCA on the selected numeric columns.
    - Generate visualizations (scree plots, biplots, and contribution plots).

### Results and Visualizations

Running the PCA script will generate several key outputs:

1. **Scree Plot**: Displays the percentage of variance explained by each principal component, helping you determine the number of components to retain.
2. **Variable Contribution Plots**: Shows the contribution of each variable to the principal components.
3. **Biplots**: Combines the variables and observations in a single plot to display relationships between them. You can also group observations by a variable such as `Practice` or `Depth`.

### Contributing

Contributions to improve the analysis or extend the script are welcome. Please fork the repository and submit pull requests with your enhancements.

## References

This script was adapted from the excellent tutorial on **Factoextra**:  
[Factoextra Tutorial](https://www.sthda.com/english/wiki/factoextra-r-package-easy-multivariate-data-analyses-and-elegant-visualization)
