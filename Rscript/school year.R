data <- readRDS("ds/101到108學年資料.rds")
school_year<- unique(data$入學年度)
for(i in seq_along(school_year)){
  p <- data[data$入學年度 == school_year[[i]], ]
  saveRDS(p, paste0("分類/入學年度/", school_year[[i]], ".rds"))
}
