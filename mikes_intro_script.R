# Load Library ------------------------------------------------------------
library(tidyverse)
library(magrittr)

# Import Data -------------------------------------------------------------
df_constituents_original <- read_csv("documents/r_thoseguys/data/constituents-financials_csv.csv")
df_vix_daily <- read_csv("documents/r_thoseguys/data/vix-daily_csv.csv")


# Initalize User Input Variables ------------------------------------------

price_min <- 15
price_max <- 75

div_yield_min <- 2
div_yield_max <- 6

# blah blah blah

# Exploratory Functions ---------------------------------------------------

# Functions used to understand the structure and class of the data
str(df_constituents_original)
summary(df_constituents_original)

class(df_constituents_original$Symbol)
unique(df_constituents_original$Symbol) 
unique(df_constituents_original$Sector)
names(df_constituents_original)

# Data Prep ---------------------------------------------------------------
# Preserving original dataset
#df_constituents <- df_constituents_original

df_constituents <- 
  df_constituents_original %>% 
  select(-`SEC Filings`)

df_constituents %<>% 
  mutate(price_10_below = Price - (Price * .1))

df_constituents %<>% 
  mutate(below_50 = ifelse(Price <= 50, 1, 0))
  
x <- df_constituents %>% filter(Price <= 5)

plot(df_constituents$Price)

x <- sample(df_constituents, 20)


df_constituents %>% 
  filter(Sector == "Health Care") %>% 
  filter(Price <= price_max) %>% 
  filter(Price >= price_min) %>% 
  filter(`Dividend Yield` >= div_yield_min) %>% 
  filter(`Dividend Yield` <= div_yield_max) %>% 
  ggplot(aes(x = Name, y = Price, fill = Name)) + 
  geom_col() + 
  coord_flip() + 
  ggtitle("Filtered Health Care by Price") +
  xlab("Health Care Company Name") +
  ylab("Price ($)")


