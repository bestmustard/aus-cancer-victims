library(rstanarm)

data <- read.csv("cancer_deaths_data.csv")
yearly_totals <- data %>%
  group_by(Year) %>%
  summarise(TotalDeaths = sum(Number_of_Deaths))

model <- stan_glm(TotalDeaths ~ Year, data = yearly_totals, family = gaussian(), chains = 2, iter = 2000)

summary(model)