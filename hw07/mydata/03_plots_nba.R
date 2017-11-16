library(corrplot)
library(ggplot2)
library(dplyr)
library(stringr)
library(cowplot)

nba_points2 <- read.csv("nba_points.csv")
View(nba_points2)
typeof(nba_points2$Player)

nba_points2$Pos <- nba_points2 %>% as.character(Pos)
head(nba_points2)

library(scales)
library(viridis)

salary_plot <- nba_points2 %>% 
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


