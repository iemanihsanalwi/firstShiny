# Load the iris dataset
iris <- read.csv("D:\\RStudio\\lab 5_ds\\Iris.csv")

# Define the UI
ui <- fluidPage(
  titlePanel("Shiny Text"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "dataset",
                  label = "Choose a dataset:",
                  choices = c("iris", "rock", "pressure", "cars")),
      numericInput(inputId = "obs",
                   label = "Number of observations to view:",
                   value = 10)
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Summary", verbatimTextOutput("summary")),
        tabPanel("Table", tableOutput("view"))
      )
    )
  )
)

# Define the server
server <- function(input, output) {
  datasetInput <- reactive({
    switch (input$dataset,
            "rock" = rock,
            "pressure" = pressure,
            "cars" = cars,
            "iris" = iris)
  })
  
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
}

# Run the app
shinyApp(ui = ui, server = server)
