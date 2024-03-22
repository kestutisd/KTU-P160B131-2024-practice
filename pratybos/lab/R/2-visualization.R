library(tidyverse)

data <- readRDS("../data/kaunas.rds")

# 1. Histograma

hist(data$`Apdraustųjų skaičius (numInsured)`, breaks = 1000)

data %>%
  filter(`Apdraustųjų skaičius (numInsured)` < 500) %>%
  ggplot(aes(x = `Apdraustųjų skaičius (numInsured)`)) +
  geom_histogram(bins = 100)

# 2. Top 5 imones pagal darbuotojus

top5 <- data %>%
  group_by(`Pavadinimas (name)`) %>%
  # group_by(.[[3]]) %>%
  summarise(dsk = max(`Apdraustųjų skaičius (numInsured)`)) %>%
  arrange(desc(dsk)) %>%
  head(5)

top5
