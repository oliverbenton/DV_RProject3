# Make variable for countries and the year 2011
CTYR <- food %>% select(COUNTRY, YEAR) %>% filter(COUNTRY == 'Algeria' | COUNTRY == 'Burundi' | COUNTRY == 'Lesotho' | COUNTRY == 'Kenya' | COUNTRY == 'Angola' | COUNTRY == 'Chad' | COUNTRY == 'Ghana', YEAR == 2011) %>% distinct()

# Join new variable data set with the GNI data
GNIJ <- GNI %>% select(COUNTRY, YEAR, UNIT, VALUE) %>% filter(COUNTRY == 'Algeria' | COUNTRY == 'Burundi' | COUNTRY == 'Kenya' | COUNTRY == 'Angola' | COUNTRY == 'Chad' | COUNTRY == 'Ghana') %>% full_join(CTYR, GNI, by = c('COUNTRY','YEAR')) %>% distinct()

GNIJ %>% tbl_df
