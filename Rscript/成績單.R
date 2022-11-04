library(tidyverse)
# 把成績為999、555和 0 的拿掉 
df <- df %>% select(學號, 必選修_學生, 課程類別, 學院名稱, 送交成績) 
df <- df %>% filter(送交成績 != 999 & 送交成績 != 555 & 送交成績 != 0)

transcript <- df %>% group_by(學號 = 學號) %>% 
  summarise(總平均 = mean(送交成績), .groups = "drop")


calculate_grades <- function(x, subject){
  X_12 <- df %>% group_by(學號,x = df[x]) %>% 
    summarise(平均 = mean(送交成績), .groups = "drop") %>% filter(x == subject)
  p <- numeric()
  for(i in 1:NROW(transcript)){
    if((transcript$學號 %in% X_12$學號)[i]){
      p[i] <- X_12 %>% filter(學號 == transcript$學號[[i]]) %>%
        select(平均) %>% .[, 1,drop = T]
    }
    else{
      p[i] <- NA
    }
  }
  return(p)
}

for(i in names(df)[-c(1, NCOL(df))]){
  uni_col <- df %>% select(i) %>% unique() %>% filter(.[,1] != "NA") %>% .[[1]]
  for(j in uni_col){
    p <- calculate_grades(i, j)
    transcript <- transcript %>% mutate(p)
    names(transcript)[names(transcript) == "p"] <- j
  }
}