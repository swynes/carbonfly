
library(corrplot)
library(Hmisc)
library(ggplot2)
library(dplyr)
library(stringr)
library(tidyverse)
library(forcats)


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

  View(nba_points$SALARY)

#Salary is character so we need to transform it to numeric
typeof(nba_points$SALARY)

nba_points$SALARY <- as.numeric(nba_points$SALARY)

#Check that it worked
typeof(nba_points$SALARY)
  
#Graph some data to see that all of the changes don't cause issues
nba_points %>% 
  na.omit() %>% 
  ggplot(aes(x=TS, y=SALARY))+
  geom_point()

head(nba_points)

#https://rstudio-pubs-static.s3.amazonaws.com/240657_5157ff98e8204c358b2118fa69162e18.html

#Correlation coefficients

cor_TS <- cor.test(nba_points$TS, nba_points$SALARY, method = "pearson")
cor_MP <- cor.test(nba_points$MP, nba_points$SALARY, method = "pearson")
cor_STL <- cor.test(nba_points$STL, nba_points$SALARY, method = "pearson")
cor_BLK <- cor.test(nba_points$BLK, nba_points$SALARY, method = "pearson")
cor_TRB <- cor.test(nba_points$TRB, nba_points$SALARY, method = "pearson")

cor_TS
cor_MP
cor_STL
cor_BLK
cor_TRB

#Make a correlation coefficient matrix for selected variables
nba_points_spec <- nba_points %>% select(TS, MP, SALARY, FG., BLK, AST, STL, TRB)
cor_matrix <- round(cor(nba_points_spec), 2)
cor_matrix

#Why does it not work for SALARY? Check type.
typeof(nba_points_spec$SALARY)
typeof(nba_points_spec$STL)

#Try a linear model with the data
fit <- lm(nba_points$SALARY ~ nba_points$MP + nba_points$TRB + nba_points$STL, data=nba_points)
summary(fit)

#Write data to file
write_csv(nba_points, "nba_points.csv")
