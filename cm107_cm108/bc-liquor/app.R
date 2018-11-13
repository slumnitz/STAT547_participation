library(shiny)
bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)

a <- 5 
print(a^2)

# Define UI for application that draws a histogram
ui <- fluidPage(
    titlePanel("BC Liquor price app", 
               windowTitle = "BCL app"),
    sidebarLayout(
        sidebarPanel("This text is in the sidebar."),
        mainPanel(
            "We cannot put R code here!",
            plotOutput("price_hist"),
            tableOutput("bcl_data")
            )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    output$price_hist <- renderPlot(ggplot2::qplot(bcl$Price))
    output$bcl_data <- renderTable({summary(bcl)})
    
}

# Run the application 
shinyApp(ui = ui, server = server)
