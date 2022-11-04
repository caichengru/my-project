library(readxl)
col_df <- read_excel("data/學生端申請欄位.xlsx", col_names = F)
col_df <- col_df[-c(1:2),]
names(col_df) <- rep(c("勾選", "欄位名稱", "欄位說明"), 4)
col_df <- rbind(col_df[,1:3], col_df[,4:6], col_df[,7:9], col_df[,10:12])
real_colname <- col_df[c(1:13, 31:64, 75, 76, 110,
                     111, 65:67, 116:119, 30),]$欄位說明
xlxs_data <- list.files("data")
xlxs_data <- xlxs_data[grep("^10[4-8]", xlxs_data)]
dataset <- data.frame()
for(i in seq_along(xlxs_data)){
  p <- read_excel(paste0("data/",xlxs_data[[i]]))
  p <- p[, -c(28, 33, 39)]
  dataset <- rbind(dataset, p)
}
names(dataset) <- real_colname
saveRDS(dataset, "ds/104到108學年資料.rds")
