library(tidyverse)
library(plotly)
library(gganimate)

data <- readRDS("../data/kaunas.rds")

# 1. Histograma

hist(data$numInsured, breaks = 1000)

data %>%
  filter(numInsured < 500) %>%
  ggplot(aes(x = numInsured)) +
  geom_histogram(bins = 100)

# 2. Top 5 imones pagal darbuotojus

top5 <- data %>%
  group_by(name) %>%
  # group_by(.[[3]]) %>%
  summarise(dsk = max(numInsured)) %>%
  arrange(desc(dsk)) %>%
  head(5)

top5

p <- data %>%
  filter(name %in% top5$name) %>%
  mutate(month = ym(month)) %>%
  ggplot(aes(x = month, y = numInsured, color = name)) +
  geom_line()

# Plotly

ggplotly(p)

# Animate

p_animate <- p +
  transition_reveal(month)

animate(p_animate, nframes = 50, duration = 5, width = 800, height = 600)
p_animated
anim_save("../img/animated_plot.gif", animation = p_animated)


