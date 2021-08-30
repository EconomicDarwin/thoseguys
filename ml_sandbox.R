
# Save xts as dataframe
data_AMAT <- data.frame(AMAT)
setDT(data_AMAT, keep.rownames = "date")

# add year column
data_AMAT %<>%
  mutate(year = year(date)) 

# filter on year and assign to new df
data_AMAT_2020 <- data_AMAT %>% 
  filter(year == 2020)


names_price <- c("date", "open", "high", "low", "close", "colume", "adjusted", "year")




names(data_AAPL_2020) <- names_price
names(data_AMAT_2020) <- names_price

list_price_2020 <- list(
  AAPL = data_AAPL_2020,
  AMAT = data_AMAT_2020)

df_price_2020 <- map_df(list_price_2020, 
                        ~as.data.frame(.x), 
                        .id= "Company Name")

df_price_2020 %<>% 
  mutate(date = ymd(date))

df_price_2020 %>% 
  ggplot(aes(x = date, y = close, group = id)) + geom_line(aes(color = id)) + 
  scale_x_date(date_breaks = "1 month", date_labels = "%b %Y") + 
  ylab("Close ($)")


