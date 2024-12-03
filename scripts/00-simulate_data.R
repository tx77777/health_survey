#### Preamble ####
# Purpose: Simulates an analysis dataset about the aerial bombing campaigns against Germany
# Author: Qizhou Xie
# Date: 23 November 2024
# Contact: qizhou.xie@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


# Load necessary library
library(dplyr)

# Define the number of rows for the simulation
n <- 100

# Simulate data
data_sim <- data.frame(
  REF_DATE = sample(2015:2024, n, replace = TRUE),
  GEO = sample(c("Canada (excluding territories)", "Canada", "Province A", "Province B"), n, replace = TRUE),
  DGUID = NA,
  Age_group = sample(c("Total, 12 years and over", "12-17 years", "18-34 years", "35-54 years", "55 years and over"), n, replace = TRUE),
  Sex = sample(c("Both sexes", "Male", "Female"), n, replace = TRUE),
  Indicators = sample(c("Perceived health, very good or excellent", "Perceived mental health, very good or excellent", "Smoking status, current smoker"), n, replace = TRUE),
  Characteristics = sample(c("Number of persons", "Low 95% confidence interval, number of persons", "High 95% confidence interval, number of persons", "Percent", "Low 95% confidence interval, percent", "High 95% confidence interval, percent"), n, replace = TRUE),
  UOM = sample(c("Number", "Percent"), n, replace = TRUE),
  UOM_ID = sample(c(223, 239), n, replace = TRUE),
  SCALAR_FACTOR = "units",
  SCALAR_ID = 0,
  VECTOR = paste0("v", sample(110787543:110787600, n, replace = TRUE)),
  COORDINATE = paste0(1, ".", sample(1:9, n, replace = TRUE), ".", sample(1:9, n, replace = TRUE), ".", sample(1:9, n, replace = TRUE), ".", sample(1:9, n, replace = TRUE)),
  VALUE = round(runif(n, min = 1000000, max = 20000000), 1),
  STATUS = NA,
  SYMBOL = NA,
  TERMINATED = NA,
  DECIMALS = sample(0:1, n, replace = TRUE)
)

# Display the simulated data
print(head(data_sim))


