# Create sample data
set.seed(123) # For reproducibility
temperature <- c(rep("4C", 8), rep("10C", 8), rep("25C", 8)) # 8 replicates per group
log_cfu <- c(rnorm(8, mean=3.5, sd=0.3), rnorm(8, mean=4.2, sd=0.3), rnorm(8, mean=6.0, sd=0.3)) # Log CFU/g
data <- data.frame(Temperature = as.factor(temperature), Log_CFU = log_cfu)

# View the first few rows
head(data)

