ui <- fluidPage(
  h2(textOutput("currentTime"))
)

server <- function(input, output, session) {
  output$currentTime <- renderText({
    invalidateLater(1000, session)
    paste("The current time is", Sys.time())
  })
}

shinyApp(ui = ui, server = server)