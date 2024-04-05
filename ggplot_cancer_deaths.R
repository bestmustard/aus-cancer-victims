library(ggplot2)
library(dplyr)

data <- read.csv("cancer_deaths_data.csv")
yearly_totals <- data %>%
  group_by(Year) %>%
  summarise(TotalDeaths = sum(Number_of_Deaths))

# Plot
ggplot(yearly_totals, aes(x = Year, y = TotalDeaths)) +
  geom_line(color = "blue", size = 1) + 
  geom_point(color = "red", size = 2) +
  theme_minimal() +
  labs(title = "Trend of Cancer-Related Deaths in Sydney's Major Hospitals (2004-2023)",
       x = "Year",
       y = "Number of Deaths")
