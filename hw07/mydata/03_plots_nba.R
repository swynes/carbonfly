library(corrplot)
library(ggplot2)
library(dplyr)
library(stringr)
library(cowplot)

nba_points <- read.csv("nbapoints.csv")
View(nba_points)
typeof(nba_points$Player)

nba_points$Pos <- nba_points %>% as.character(Pos)
head(nba_points)

library(scales)
library(viridis)

salary_plot <- nba_points %>% 
  na.omit() %>%
  mutate(SALARY=SALARY/1000000) %>% 
  filter(Rk!=272,Rk!=421) %>% #eliminate two players with unique, irrelevant positions
  ggplot(aes(x=MP, y=SALARY)) +
  scale_colour_viridis(option="inferno") +
  geom_point(aes(color=TRB)) +
  facet_wrap(~Pos)+
  geom_smooth() +
  labs(x="Minutes Played", y= "Salary (in millions)") +
  scale_y_continuous(labels=comma)

save_plot("salary_plot.png", salary_plot, base_aspect_ratio = 1.8)  


