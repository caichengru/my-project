level1 <- list.files("分類")
for(i in seq_along(level1)){
  level2 <- list.files(paste0("分類/", level1[i]))
  for(j in  seq_along(list.files(paste0("分類/", level1[i])))){
    df <- readRDS(paste0("分類/", level1[i], 
                         "/",
                         level2[j]))
    source("Rscript/成績單.R")
    readRDS(transcript, paste0("ds/",level1, "/", level2, ".rds"))              
  }
}
