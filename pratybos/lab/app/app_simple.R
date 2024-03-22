library(shiny)

ui <- fluidPage(
  titlePanel("Test KTU"),
  sidebarLayout(
    sidebarPanel(
      numericInput("kodas",
                   "Iveskite Imones koda",
                   value = 908764)
    ),
    mainPanel(
      tableOutput("table")
    )
  )
)

server <- function(input, output) {
  data <- readRDS("../data/kaunas.rds")
  output$table <- renderTable({
    data %>%
      filter(`Draudėjo kodas (code)` == input$kodas) %>%
      group_by(`Pavadinimas (name)`) %>%
      summarise(max_apdraustuju = max(`Apdraustųjų skaičius (numInsured)`),
                max_vid_atlyginimas = max(`Vidutinis darbo užmokestis (avgWage)`))

  })
}

shinyApp(ui = ui, server = server)