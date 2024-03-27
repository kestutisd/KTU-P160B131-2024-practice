library(tidyverse)
library(plotly)
library(gganimate)
library(htmlwidgets)

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

p_animated <- animate(p_animate, nframes = 50, duration = 5, width = 1600, height = 1000)
p_animated
anim_save("../img/animated_plot.gif", animation = p_animated)

# 3 uzduotis

top_eco <- data %>%
  group_by(ecoActCode) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(20)
top_eco

agg_data <- data %>%
  filter(ecoActCode %in% top_eco$ecoActCode) %>%
  group_by(ecoActName, name) %>%
  summarise(avgWage = mean(avgWage, na.rm = TRUE), numInsured = mean(numInsured))

pp <- ggplot(agg_data, aes(x = avgWage, y = numInsured, color = ecoActName, label = name)) +
  geom_point(alpha = 0.3, na.rm = TRUE) +
  geom_smooth(method = "glm", se = TRUE, na.rm = TRUE, color = "black", fill = "blue", alpha = 0.1) +
  theme_minimal() +
  guides(color = "none")
ggplotly(pp)
plotly_obj <- ggplotly(pp)
saveWidget(plotly_obj, file = "../img/plot.html", selfcontained = TRUE)
