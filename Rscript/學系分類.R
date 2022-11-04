data <- readRDS("ds/101到108學年資料.rds")
department <- unique(data$學系)
for(i in seq_along(department)){
  p <- data[data$學系 == department[[i]], ]
  saveRDS(p, paste0("分類/學系/", department[[i]], ".rds"))
}
