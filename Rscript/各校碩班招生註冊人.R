library(dplyr)
library(readxl)
dir <- list.files("data")
dir <- dir[grep("^ntus", dir)]
data_clean <- function(data){
  data <- data[,-(5+2*0:7)]
  names(data) <- paste0(data[1,], data[2,]) %>%
    gsub(pattern = "\n", replacement = "") %>% 
    gsub(pattern = "NA", replacement = "") %>% 
    gsub(pattern = "一般", replacement = "")
  data <- data[-c(1:2), ]
  data <- data[grep("[0-9A-Z]{3}", data$系所代碼),]
  # 理工學院台灣大學貌似代碼為2開頭
  science <- data %>% filter(grepl("^2", data$系所代碼)) %>% 
    select(系所別, 組別, 報名人數, 錄取人數, 錄取率)
  return(science)
}
for(i in dir){
  data <- read_excel(paste0("data/",i))
  data <- data_clean(data)
  writexl::write_xlsx(data, paste0("output/data/", i))
}

