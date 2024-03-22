library(tidyverse)
library(stringr)
# https://www.kaggle.com/prasertk/defense-contractors-market-cap-revenue-earning?select=defense+contractor.csv

data <- read_csv("../data/defense.csv")
readLines("../data/defense.csv", 2)

data %>%
  mutate(market_cap = as.numeric(trimws(str_remove_all(`Market cap`, "B|\\$")))) %>%
  filter(Year == "2022") %>%
  group_by(Country) %>%
  summarise(n = sum(market_cap)) %>%
  mutate(Country = fct_reorder(Country, n)) %>%
  ggplot(aes(x = Country, y = n)) +
  geom_col() + 
  ylab("Market Cap") +
  theme_classic()

ggsave("../img/defence.png")


  
