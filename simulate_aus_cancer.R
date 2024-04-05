
library(dplyr)

# Reproducibility
set.seed(123)

n <- 1000
hospitals <- c("Sydney Hospital", "Royal Prince Alfred", "Westmead Hospital", "St Vincent's", "Children's Hospital")
years <- 2004:2023
cancer_types <- c("Lung", "Breast", "Colon", "Leukemia", "Skin")
age_groups <- c("0-18", "19-35", "36-50", "51-65", "66+")
genders <- c("Male", "Female", "Other")

# Simulate 
data <- data.frame(
  Hospital_Name = sample(hospitals, n, replace = TRUE),
  Year = sample(years, n, replace = TRUE),
  Cancer_Type = sample(cancer_types, n, replace = TRUE),
  Age_Group = sample(age_groups, n, replace = TRUE),
  Gender = sample(genders, n, replace = TRUE),
  Number_of_Deaths = sample(1:50, n, replace = TRUE) # sample 1 to 50 deaths
)

# Write csv
write.csv(data, "cancer_deaths_data.csv", row.names = FALSE)
