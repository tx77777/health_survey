#### Preamble ####
# Purpose: Tests
# Author: Qizhou Xie
# Date: 23 November 2023
# Contact: qizhou.xie@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Workspace setup ####
library(arrow)

#### Test data ####

# Read the data
data <- read_parquet("/Users/zhouttonyy/Desktop/health_priority-main/data/analysis_data/cleaned_health_priority.parquet")

# Check for correct columns
if (!all(c("Geography", "Age_group", "Sex", "Indicators", "Reference_Date") %in% names(data))) {
  stop("Data frame does not have the correct columns.")
}

# Check for correct types
if (!is.factor(data$Geography)) {
  stop("Geography is not a factor.")
}
if (!is.factor(data$Age_group)) {
  stop("Age_group is not a factor.")
}
if (!is.factor(data$Sex)) {
  stop("Sex is not a factor.")
}
if (!is.factor(data$Indicators)) {
  stop("Indicators is not factor.")
}
if (!is.numeric(data$Reference_Date)) {
  stop("Reference_Date is not an numeric.")
}

# Check for missing values
if (any(!complete.cases(data))) {
  stop("There are missing values in the data.")
}

# If the script gets to this point without stopping, all tests passed
print("All tests passed!")
