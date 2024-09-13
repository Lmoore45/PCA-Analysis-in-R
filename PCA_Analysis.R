# Load necessary libraries
library(FactoMineR)
library(ggplot2)
library(factoextra)
library(dplyr)

# Data Preparation
# Replace the file path with your own data file location
data <- read.csv("/Users/yourname/path/to/your/data.csv")

# Select relevant columns for PCA
metadata <- data[, c('Adaptive_Score', 'pH', 'total_c', 'maom_c', 'pom_c', 'total_n', 'maom_n', 'pom_n', 'fmaoc', 'c_n_ratio', 'Richness', 'Evenness', 'Shannons')]

# Ensure all columns are numeric and remove rows with NA values
metadata[metadata == "#N/A"] <- NA
metadata <- na.omit(metadata)

# Perform PCA using FactoMineR
pca_results <- PCA(metadata, scale.unit = TRUE, graph = FALSE)

# Visualize the eigenvalues/variances (Scree plot) to determine the number of principal components to consider
fviz_eig(pca_results)

# Extract and check the results for variables to ensure they are captured correctly
var_results <- get_pca_var(pca_results)
print(var_results)  # This will help confirm that the variable names and data are intact

# Visualizing variables on the factor map
fviz_pca_var(pca_results, col.var = "black",  # Color for variable vectors
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),  # Colors for gradient by contribution
             repel = TRUE,  # Avoid text overlapping
             labelsize = 4,  # Adjust label size for readability
             arrowsize = 0.5  # Adjust size of arrows for better visualization
)

# Visualizing contributions of variables to the principal components
fviz_contrib(pca_results, choice = "var", axes = 1)  # Contributions to PC1
fviz_contrib(pca_results, choice = "var", axes = 2)  # Contributions to PC2

# Create a biplot of individuals and variables
fviz_pca_biplot(pca_results,
                col.ind = "dodgerblue3",    # Color for individuals
                col.var = "darkorange2",     # Color for variables
                repel = TRUE,  # Enable repel to avoid overlap
                arrowsize = 0.5,  # Adjust arrow size
                pointsize = 2,  # Adjust point size
                labelsize = 4,  # Adjust label size
                geom.ind = "point"  # Show individuals as points
)

# Create a PCA biplot grouped by 'Practice' (replace 'Practice' with relevant grouping variable in your data)
fviz_pca_biplot(pca_results,
                col.ind = data$Practice,  # Color points by Practice
                palette = "Set4",  # Use a nice color palette
                col.var = "#4D4D4D",  # Color for variables
                repel = TRUE,  # Enable repel to avoid overlap
                label = "var",  # Only label variables
                arrowsize = 0.5,  # Adjust arrow size
                pointsize = 2,  # Adjust point size
                pointshape = 19,  # Keep same shape for points
                labelsize = 5  # Adjust label size for variables
) + labs(color = "Practice")  # Add title to the legend


