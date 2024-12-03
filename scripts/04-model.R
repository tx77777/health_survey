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

# Fit a  bayesian linear model
bayesian_model <- stan_glm(
  y ~ x1 + x2 + x4 + x3,
  data = data,
  family = gaussian(),
  prior = normal(0, 2.5),
  prior_intercept = normal(0, 5),
  chains = 4,
  iter = 2000,
  seed = 123
)

# Display the summary of the model
summary(bayesian_model)

# Optional: Plot the effects to visualize the model results
plot(bayesian_model)

#### Save model ####
saveRDS(
  bayesian_model,
  file = "/Users/zhouttonyy/Desktop/health_priority-main/models/health_priority_model.rds"
)

