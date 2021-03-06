library(shiny)
library(tidyverse)
bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)

a <- 5
print(a^2)

# Define UI for application that draws a histogram
ui <- fluidPage(
    titlePanel("BC Liquor price app",
               windowTitle = "BCL app"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("priceInput", "Select your price",
                        min=0, max=100, value=c(15, 35), pre="$"),
            radioButtons("typeInput", "Select your beverage type.",
                         choices = unique(bcl$Type), # isnstructor recommended manual input
                         selected = "WINE")

        ),
        mainPanel(
            "We cannot put R code here!",
            plotOutput("price_hist"),
            tableOutput("bcl_data")
            )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    observe(print(input$priceInput))

    bcl_filtered <- reactive({ #needed for update
        bcl %>%
            filter(
                Price < input$priceInput[2], #
                Price > input$priceInput[1],
                Type == input$typeInput)})

    output$price_hist <- renderPlot(
        bcl_filtered() %>%
            ggplot(aes(Price)) + geom_histogram()
    )
    output$bcl_data <- renderTable(bcl_filtered())

}

# Run the application
shinyApp(ui = ui, server = server)
