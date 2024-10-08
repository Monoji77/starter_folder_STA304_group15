#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(lubridate)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

# separating year and months
data <- raw_data %>%
  janitor::clean_names() %>%
  mutate(time_period = lubridate::ymd(paste(time_period, '01', sep='-')))

cleaned_data <- raw_data %>%
  janitor::clean_names() %>%
  mutate(time_period = lubridate::ym(time_period))


  
#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
