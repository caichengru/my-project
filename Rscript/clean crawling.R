library(tidyverse)
df <- readRDS("D:/R/Recommender system/爬蟲/統計系/吳榮彬老師.rds")
df$paper <-  df$paper %>% gsub(pattern = "[\r\n\t]+", ., replacement = "")
df <- str_split(df$paper, "\"" )
df <- unlist(df) %>% 
  matrix(ncol = 3, byrow = T) %>% 
  data.frame()


df$`日期` <- unlist(regmatches(df$X3, 
                  regexec("[0-9]{4}-[0-9]{2}\\.",df$X3))) %>% 
  gsub(pattern = "\\.", ., replacement = "")
df$X3 <- df$X3 %>% gsub(pattern = ",[0-9]{4}-[0-9]{2}\\..+", ., replacement = "")
names(df) <- c("作者", "論文題目", "期刊", "日期")
