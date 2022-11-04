library(shiny)
library(xlsx)

ui <- fluidPage(
    
    fluidRow(
        column(
            6,
            fileInput("file", "", multiple = TRUE)
            )
        ),
    
)

server <- function(input, output) {
    
    store_file <- write

}

# Run the application 
shinyApp(ui = ui, server = server)
