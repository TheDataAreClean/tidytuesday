# Load required packages
library(tidytuesdayR)
library(tidyverse)
library(ggthemes)

# Load the #TidyTuesday dataset
## Read Week 38 Data
tuesdata <- tidytuesdayR::tt_load(2020, week = 38)

## Select the kids dataset
kids <- tuesdata$kids

# Explore
## Review the data structure
glimpse(kids)

## List of variables
unique(kids$variable)

# Scope the dataset
## K12 Education Spending Trends
k12 <-kids %>%
  # Filter K12 values
  filter(variable == "PK12ed") %>%
  # Select fields required
  select(state, variable, year, inf_adj_perchild)

## Plot the states
ggplot(k12, aes(x = year, y = inf_adj_perchild, color = variable)) +
  geom_line() + facet_wrap(~ state, scales = "free_y") + theme_clean() +
  theme(axis.text.x = element_text(size = 5))

## Save the plot
ggsave("2020/week-38/plots/k12.png", plot = last_plot())

## higher Education / unemployment Spending Trends
emp <-kids %>%
  # Filter K12 values
  filter(variable == "highered" | variable == "unemp") %>%
  # Select fields required
  select(state, variable, year, inf_adj_perchild)

## Plot the states
ggplot(emp, aes(x = year, y = inf_adj_perchild, color = variable)) +
  geom_line() + facet_wrap(~ state) + theme_clean() +
  theme(axis.text.x = element_text(size = 5))

## Save the plot
ggsave("2020/week-38/plots/emp.png", plot = last_plot())
