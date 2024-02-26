rm(list = ls())

library(fredr)
library(tidyverse)
library(ggplot2)

api_key <- "7117fda5eaa8c0a455f4e336afce12ed"

fredr_set_key(api_key)

# Retrieving data for "CSUSHPINSA"
csushpinsa_data <- fredr(
  series_id = "CSUSHPINSA",
  observation_start = as.Date("1990-01-01"),
  observation_end = as.Date("2000-01-01")
)

# Retrieving data for "UNRATE" within a specific time range
unrate_data <- fredr(
  series_id = "UNRATE",
  observation_start = as.Date("1990-01-01"),
  observation_end = as.Date("2000-01-01")
)

# Retrieving data for "AUTHNOTT"
authnott_data <- fredr(
  series_id = "AUTHNOTT",
  observation_start = as.Date("1990-01-01"),
  observation_end = as.Date("2000-01-01")
  )

# Combine data
combined_data <- bind_rows(csushpinsa_data, unrate_data, authnott_data)

# Plotting
combined_data %>%
  ggplot(aes(x = date, y = value, color = series_id)) +
  geom_line() +
  labs(title = "Multiple Economic Indicators",
       x = "Year",
       y = "Change") +
  theme_minimal()

print(combined_data)
