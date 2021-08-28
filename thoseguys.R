
# Load Library ------------------------------------------------------------

library(tidyverse)
library(magrittr)
library(quantmod)
library(lubridate)
library(data.table)

# Load Data ---------------------------------------------------------------

df_sp500_org <- read_csv("data/constituents-financials_csv.csv")
df_vix <- read_csv("data/vix-daily_csv.csv")

# Functions examples ------------------------------------------------------

# str = breakdown of data set
str(df_sp500)

summary(df_sp500)
# Reference specific data columns
unique(df_sp500_org$Sector)

df_sp500$Price
names(df_sp500)

# %>% - control-shift-M 
# piping - "and then..." 



#df_sp500 <- df_sp500_org %>% 
#  select(-`SEC Filings`)

#df_sp500 %<>% 
#  mutate(price_10down = Price - (Price * .1))

getSymbols("AAPL" , auto.assign = TRUE)
str(AAPL)
summary(AAPL)
unique(AAPL)
class(AAPL)
names(AAPL)
getSymbols("AMAT" , auto.assign = TRUE)
str(AMAT)
head(AMAT)  


setDT(AMAT , keep.rownames = "date")
