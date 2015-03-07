#Select the total food aid amounts from 5 different countries from food security dataset
food_aid <- food %>% select(COUNTRY, COMMODITY, ITEM,AMOUNT,YEAR) %>% filter(ITEM =='Total', COMMODITY == 'Food Aid', YEAR == '2000' | YEAR == '2008',COUNTRY == 'Angola'| COUNTRY =='Peru'| COUNTRY == 'Ecuador'| COUNTRY =='Morocco' | COUNTRY == 'Egypt')

#Redefine food_aid with organized columns
food_aid <- food_aid %>% spread(YEAR, AMOUNT)

#Change names of columns and assign those columns to variables
colnames(food_aid) <- c('COUNTRY', 'COMMODITY', 'ITEM', 'food_aid2000','food_aid2008')
FOODAID2000 <- food_aid %>% select(food_aid2000) 
FOODAID2008 <- food_aid %>% select(food_aid2008)

#Select same 6 countries as before with their Net Savings % from Net Income
net_savings <- HDI %>% select(1, NETSAVINGS2000, NETSAVINGS2008) %>% filter(COLUMN1 == 'Egypt'|COLUMN1 == 'Angola'|COLUMN1 == 'Peru'|COLUMN1 == 'Ecuador'|COLUMN1 == 'Morocco') 

#Bind previously defined columns into new net_savings table
savings <- bind_cols(net_savings,FOODAID2000,FOODAID2008)
colnames(savings) <- c('Country','NETSAVINGS2000','NETSAVINGS2008','FOODAID2000','FOODAID2008')

savings %>% tbl_df
