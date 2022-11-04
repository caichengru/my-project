library(rvest)

article_detail <- function(url){
  raw_html <- read_html(url)
  
  author_css <- ".article-metaline:nth-child(1) .article-meta-value"
  title_css <- ".article-metaline-right+ .article-metaline .article-meta-value"
  time_css <- ".article-metaline+ .article-metaline .article-meta-value"
  main_content_css <- "#main-content"
  ip_css <- ".hl+ .f2"
  push_css <- ".push-tag"
  push_id_css <- ".push-userid"
  push_content_css <- ".push-content"
  push_time_css <- ".push-ipdatetime"
  
  article_detail_info <- list()
  columns <- c(author_css, title_css, time_css, main_content_css, ip_css, push_css, push_id_css, push_content_css, push_time_css)
  for (i in 1:length(columns)){
    article_content <- raw_html %>%
      html_nodes(css = columns[i]) %>%
      html_text()
    article_detail_info[[i]] <- article_content
  }
  names(article_detail_info) <- c("author", "title", "time", "main_content", "ip", "push", "push_id", "push_content", "push_time")
  return(article_detail_info)
}

article_url <- "https://www.ptt.cc/bbs/NBA/M.1496931569.A.682.html"
nba_article_details <- article_detail(article_url)
nba_article_details$main_content %>%
  gsub(pattern = "\n", ., replacement = "") %>% 
  gsub(pattern = "--.+", ., replacement = "") %>% 
  gsub(pattern = "作者.+:[0-9]{2}\\s[0-9]{4}", ., replacement = "")

ip_start <- regexpr(pattern = "[0-9]+", nba_article_details$ip)
ip_end <- nchar(nba_article_details$ip)
substr(nba_article_details$ip, start = ip_start, stop = ip_end)
nba_article_details$push_time

library(rvest)

url <- "https://www.ptt.cc/bbs/NBA/index.html"
raw_html <- read_html(url)

article_link_xpath <- "//div[@class='title']/a"
article_links <- raw_html %>%
  html_nodes(xpath = article_link_xpath) %>%
  html_attr("href")
article_links
