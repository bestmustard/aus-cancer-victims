# load libraries
library(dplyr)
library(ggplot2)

# read simulated data
data <- read.csv("cancer_deaths_data.csv")

# 1. Total deaths yearly
total_deaths_year <- data %>%
  group_by(Year) %>%
  summarise(Total_Deaths = sum(Number_of_Deaths))

# 2. Deaths by cancer type
deaths_by_cancer <- data %>%
  group_by(Cancer_Type) %>%
  summarise(Total_Deaths = sum(Number_of_Deaths))

# 3. Average deaths per age group
avg_deaths_age_group <- data %>%
  group_by(Age_Group) %>%
  summarise(Average_Deaths = mean(Number_of_Deaths))

# 4. Deaths by hospital
deaths_by_hospital <- data %>%
  group_by(Hospital_Name) %>%
  summarise(Total_Deaths = sum(Number_of_Deaths))

# 5. Deaths by gender
deaths_by_gender <- data %>%
  group_by(Gender) %>%
  summarise(Total_Deaths = sum(Number_of_Deaths))

# 6. Trend of lung cancer deaths
lung_cancer_trend <- data %>%
  filter(Cancer_Type == "Lung") %>%
  group_by(Year) %>%
  summarise(Total_Deaths = sum(Number_of_Deaths))

# 7. Change in deaths over time by hospital
deaths_trend_by_hospital <- data %>%
  group_by(Hospital_Name, Year) %>%
  summarise(Total_Deaths = sum(Number_of_Deaths))

# 8. Death records by cancer type and gender
deaths_by_cancer_gender <- data %>%
  group_by(Cancer_Type, Gender) %>%
  summarise(Total_Records = n())

# mode calculator
Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

# 9. Most common age group per cancer type
common_age_group_by_cancer <- data %>%
  group_by(Cancer_Type) %>%
  summarise(Common_Age_Group = toString(Mode(Age_Group)))

# 10. Year with the highest number of deaths for each age group
highest_death_year_by_age_group <- data %>%
  group_by(Age_Group) %>%
  summarise(Year_with_Highest_Deaths = Year[which.max(Number_of_Deaths)])

