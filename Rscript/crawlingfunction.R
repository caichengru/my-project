library(rvest)
teacher_detail <- function(url){
  raw_html <- read_html(url)
  
  name_css <- ".base table tr:nth-child(1) td"
  expertise_css <- ".normal:nth-child(4) td+ td"
  education_css <- ".normal:nth-child(6) td+ td"
  inschool_css <- "#exptb td+ td"
  outschool_css <- ".normal:nth-child(11) td+ td"
  paper_css <- ".jounal td+ td"
  
  
  teacher_detail_info <- list()
  columns <- c(name_css, expertise_css, education_css, inschool_css, outschool_css, paper_css)
  for (i in 1:length(columns)){
    teacher_content <- raw_html %>%
      html_nodes(css = columns[i]) %>%
      html_text()
    teacher_detail_info[[i]] <- teacher_content
  }
  names(teacher_detail_info) <- c("name", "expertise", "education", "inschool", "outschool", "paper")
  saveRDS(teacher_detail_info, paste0("爬蟲/統計系/",teacher_detail_info$name, "老師.rds"))
}


