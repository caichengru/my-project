p <- c("f0717f89ec9d2329",
       "a080b6c12b4b3d69",
       "677fa2739db02b7e",
       "222c48e9306db186",
       "59d3643dccc57f4e",
       "a8f73866141ed95c",
       "1d63156d1b6bcba6",
       "11605ba39006c076",
       "199fd383de1cf488",
       "27bfdec9b4d9b9a2",
       "494d67978c429d38",
       "3089858221faabd4",
       "50e35daa550c914d",
       "3c05bb50f77e1669",
       "0288b84c77c7b4db",
       "9d842f62fdc1c992")

url <- c(paste0("http://www.stat.fcu.edu.tw/wSite/ct?xItem=", p, "&ctNode=34492&mp=440101&submit=%E5%80%8B%E4%BA%BA%E8%B3%87%E6%96%99"))
source("Rscript/crawlingfunction.R", encoding = 'UTF-8')
for(i in url){
  teacher_detail(i)
}
