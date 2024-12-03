#### Preamble ####
# Purpose: Create GLM on cleaned data
# Author: Qizhou Xie
# Date: 23 November 2024
# Contact: qizhou.xie@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(dplyr)

#### Read data ####
cleaned_health_priority <- read_parquet("/Users/zhouttonyy/Desktop/health_priority-main/data/analysis_data/cleaned_health_priority.parquet")

### Model data ####
data <- cleaned_health_priority %>%
  select(Value, Age_Group, Sex, Reference_Date, Geography) %>%
  rename(y = Value, x1 = Age_Group, x2 = Sex, x3 = Reference_Date, x4 = Geography)

#fit a standard linear model
linear_model <- lm(y~ x1 + x2 + x3 + x4, data = data)

# Display the summary of the model
summary(linear_model)

plot(linear_model)

#### Save model ####
saveRDS(
  linear_model,
  file = "/Users/zhouttonyy/Desktop/health_priority-main/models/standaed_linear_model.rds"
)
