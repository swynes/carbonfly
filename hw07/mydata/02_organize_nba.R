library(ggplot2)
library(dplyr)
library(stringr)


nba_points <- read.csv("nbapoints.csv")
head(nba_points)

#True shooting percentage is a more accurate reflection of a player's shooting ability
#than number of points. I therefore use existing data to create a column with this stat
nba_points$TS <- (nba_points$PS.Gâ../(2*(nba_points$FGA+(0.44*nba_points$FTA)))) 


#I don't want the data overly influenced by outliers so I remove individuals who have
#played less than half a season

nba_points <- nba_points %>% 
  filter(G>41)

#The Salary provided has a $ and thousands are delineated by commas
#I use the stringr package to remove all non-alpha/numeric characters from SALARY
  nba_points$SALARY <- str_replace_all(nba_points$SALARY, "[^[:alnum:]]", "")

#Salary is character so we need to transform it to numeric
typeof(nba_points$SALARY)

nba_points$SALARY <- as.numeric(nba_points$SALARY)

typeof(nba_points$SALARY)
  
nba_points %>% 
  na.omit() %>% 
  ggplot(aes(x=TS, y=SALARY))+
  geom_point()
