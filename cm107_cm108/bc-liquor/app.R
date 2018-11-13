library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    "This is text.",
    "This is more text.",
    "test str(tags) in console.",
    tags$h1("Level 1 header"),
    h1("Level 1 header part II"),
    HTML("<h1>Level 1 header part 3</h1>")
)

# Define server logic required to draw a histogram
server <- function(input, output) {

}

# Run the application 
shinyApp(ui = ui, server = server)
