foodwrang <- food %>% filter(YEAR == 2005, COMMODITY == "Population") %>% select(COUNTRY, AMOUNT) %>% arrange(COUNTRY)

colnames(foodwrang) <- c("Country", "Population")

electricitywrang <- electricity %>% select(Country, X2005)

colnames(electricitywrang) <- c("Country", "ElectricityGeneration")

joined_data <- inner_join(foodwrang, electricitywrang, by = "Country")

joined_data %>% tbl_df
