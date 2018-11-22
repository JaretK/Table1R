# Table 1 
library('tableone')
library('dplyr')
library('magrittr')
library('tidyverse')
input <- '' # input csv file
output <- '' # absolute path of output csv file
factorize <- c() # categorical variables to keep
continuous <- c() # continuous variables to keep

###################
# 
# Core logic
# 
all_variables = unique(c(factorize, continuous))
csv_file = read.csv(input)
csv_file %<>% mutate_at(factorize, funs(factor(.)))
csv_file %<>%
  select(one_of(all_variables))
tb1 <- CreateTableOne(data=csv_file)
tb1_mat <- print(tb1, showAllLevels=TRUE)
write.csv(tb1_mat,output)