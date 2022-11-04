library(rvest)
url <- "http://www.stat.fcu.edu.tw/wSite/lp?ctNode=34492&mp=440101&idPath=34003_34492"
x <- read_html(url) %>% 
  html_nodes(css = ".teacher li")
p <- regmatches(x, regexec('name="xItem" value="[0-9a-z]{16}',x))
p <- unlist(p) 
p <- p[!duplicated(p)]
gsub(pattern = "[^0-9a-z]{16}", p, replacement = "")
p <- regmatches(p, regexec('[0-9a-z]{16}',p)) %>% unlist()
p <- p[!p == "63b42ed842c68261"]
url <- c(paste0("http://www.stat.fcu.edu.tw/wSite/ct?xItem=", p, "&ctNode=34492&mp=440101&submit=%E5%80%8B%E4%BA%BA%E8%B3%87%E6%96%99"))
source("Rscript/crawlingfunction.R", encoding = 'UTF-8')
for(i in url){
  teacher_detail(i)
}