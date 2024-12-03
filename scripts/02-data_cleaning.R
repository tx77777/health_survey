#### Preamble ####
# Purpose: Cleans the raw data to prepare for model
# Author: Qizhou Xie
# Date: 23 November 2024
# Contact: qizhou.xie@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
# Load necessary libraries
library(dplyr)

# Load the data
data <- read.csv("/Users/zhouttonyy/Desktop/health_priority-main/data/raw_data/health_priority.csv", stringsAsFactors = FALSE)

# Clean the data
cleaned_data <- data %>%
  # Remove rows with missing REF_DATE or GEO
  filter(!is.na(REF_DATE) & !is.na(GEO)) %>%
  # Remove unnecessary columns like DGUID, STATUS, SYMBOL, TERMINATED
  select(-DGUID, -STATUS, -SYMBOL, -TERMINATED) %>%
  # Rename columns to make them more readable
  rename(
    Reference_Date = REF_DATE,
    Geography = GEO,
    Age_Group = Age.group,
    Unit_Of_Measure = UOM,
    Unit_ID = UOM_ID,
    Scalar_Factor = SCALAR_FACTOR,
    Scalar_ID = SCALAR_ID,
    Value = VALUE
  ) %>%
  # Convert VALUE column to numeric (handling any non-numeric values)
  mutate(Value = as.numeric(Value)) %>%
  # Remove rows with NA in the Value column after conversion
  filter(!is.na(Value)) %>%
  # Filter rows where Unit_Of_Measure is 'Percent'
  filter(Unit_Of_Measure == "Percent") %>%
  # Remove duplicate rows if any
  distinct()

# Display the cleaned data
print(head(cleaned_data))

#### Save data ####
write_parquet(cleaned_data, "/Users/zhouttonyy/Desktop/health_priority-main/data/analysis_data/cleaned_health_priority.parquet")
write_csv(cleaned_data, "/Users/zhouttonyy/Desktop/health_priority-main/data/analysis_data/cleaned_health_priority.csv")
