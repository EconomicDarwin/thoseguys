
# Save xts as dataframe

data_AMAT <- data.frame(AMAT)
setDT(data_AMAT, keep.rownames = "date")

# add year column

data_AMAT %<>%
  mutate(year = year(date)) 

# filter on year and assign to new df

data_AMAT_2020 <- data_AMAT %>% 
  filter(year == 2020)



