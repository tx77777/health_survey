#### Preamble ####
# Purpose: Downloads and saves the data from
# Author: Qizhou Xie
# Date: 23 November 2024
# Contact: qizhou.xie@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Workspace setup ####
library(tidyverse)
library(arrow)


#### Download data ####
health_priority <-
  read_csv(
    here::here("/Users/zhouttonyy/Desktop/health_priority-main/data/raw_data/health_pri.csv"),
    show_col_types = FALSE
  )

#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
write_parquet(health_priority, "/Users/zhouttonyy/Desktop/health_priority-main/data/raw_data/health_priority.parquet")
write_csv(health_priority, "/Users/zhouttonyy/Desktop/health_priority-main/data/raw_data/health_priority.csv")
