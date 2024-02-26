devtools::install_github("statsbomb/SDMTools")
devtools::install_github("statsbomb/StatsBombR")
library(tidyverse)
library(StatsBombR)
library(tidyr)
library(purrr)
library(dplyr)

# indhenter alle kampe fra alle ligaer
StatsBombData <- free_allevents()
FreeCompetitions()
Comp <- FreeCompetitions()
Matches <- FreeMatches(Comp)

# filtrerer data ud fra det Women's World Cup
fwc <- Matches %>%
  filter(competition.competition_name == "Women's World Cup")

# alle events forbundet med fwc
allevents <- free_allevents(fwc)

# df for pass
fwcevents_pass <- allevents %>% 
  filter(type.name == "Pass")

# df for shots
fwcevents_shot <- allevents %>% 
  filter(type.name == "Shot")

# rbind?
samlet_fwc <- rbind(fwcevents_pass,fwcevents_shot)

# test
print("Hej")



