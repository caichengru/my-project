data <- readRDS("ds/101到108學年資料.rds")
school <- unique(data$學院別)
for(i in seq_along(school)){
  p <- data[data$學院別 == school[[i]], ]
  saveRDS(p, paste0("分類/學院/", school[[i]], ".rds"))
}
