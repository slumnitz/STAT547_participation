library(shiny)
bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)

a <- 5 
print(a^2)

# Define UI for application that draws a histogram
ui <- fluidPage(
    "This is text.",
    br(),
    "This is more text.",
    br(),
    br(),
    "test str(tags) in console.",
    tags$h1("Level 1 header"),
    tags$blockquote("Tidy data sets are all the same. Each messy data set is messy in its own way.", cite = "Hadley Wickham"),
    h1("Level 1 header part II"),
    tags$code("This text will be displayed as computer code."),
    HTML("<h1>Level 1 header part 3</h1>"),
    tags$a(href="https://shiny.rstudio.com/articles/tag-glossary.html", "link to tags document"),
    print(a)
)

# Define server logic required to draw a histogram
server <- function(input, output) {

}

# Run the application 
shinyApp(ui = ui, server = server)
