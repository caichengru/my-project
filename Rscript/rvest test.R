library(rvest)
library(tidyverse)
url <- "http://www.stat.fcu.edu.tw/wSite/ct?xItem=199fd383de1cf488&ctNode=34492&mp=440101&submit=%E5%80%8B%E4%BA%BA%E8%B3%87%E6%96%99"
read_html(url) %>% 
  html_nodes(".normal:nth-child(6) div , .normal:nth-child(6) td+ td") %>% 
  html_text()
html_table(".normal:nth-child(6) div , .normal:nth-child(6) td+ td")

