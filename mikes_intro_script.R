# Load Library ------------------------------------------------------------
library(tidyverse)
library(magrittr)
library(lubridate)


# Import Data -------------------------------------------------------------
df_constituents_original <- read_csv("~/r_thoseguys/data/constituents-financials_csv.csv")
df_vix_daily <- read_csv("~/r_thoseguys/data/vix-daily_csv.csv")


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


# Quick Plot
plot(df_constituents$Price)

# Filtering data by Sector, Price, and Dividend Yield and plotting them
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


# Grouping by Sector and finding min and max prices
df_constituents %>% 
  group_by(Sector) %>% 
  summarise(min_price = min(Price),
            max_price = max(Price))



# Create Year column to make it easier to filer
df_vix_daily %<>% 
  mutate(year = year(Date))

# Filter on year 2020 and plot results
df_vix_daily %>% 
  filter(year == 2020) %>% 
  ggplot(aes(x = Date)) + 
  geom_line(aes(y = `VIX Open`), color = "blue") + 
  geom_line(aes(y = `VIX Close`), color = "red") + 
  theme_dark()


