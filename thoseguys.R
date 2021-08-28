
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

#AAPL
getSymbols("AAPL" , auto.assign = TRUE)
str(AAPL)
summary(AAPL)
unique(AAPL)
class(AAPL)
names(AAPL)

data_AAPL <- data.frame(AAPL)
setDT(data_AAPL , keep.rownames = "date")

data_AAPL %<>%
  mutate(year = year(date))
data_AAPL_2020 <- data_AAPL%>%
  filter(year == 2020)

#AMAT
getSymbols("AMAT" , auto.assign = TRUE)
str(AMAT)
head(AMAT)  

data_AMAT <- data.frame(AMAT)
setDT(data_AMAT , keep.rownames = "date")

data_AMAT %<>% 
  mutate(year = year(date))

data_AMAT_2020 <- data_AMAT%>%
  filter(year == 2020)
