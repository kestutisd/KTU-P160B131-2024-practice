library(shiny)

ui <- fluidPage(
  titlePanel("Test KTU"),
  sidebarLayout(
    sidebarPanel(
      selectizeInput("kodas",
                   "Iveskite Imones koda",
                   choices = NULL),
                    
    ),
    mainPanel(
      tableOutput("table"),
      plotOutput("plot")
    )
  )
)

server <- function(input, output, session) {
  data <- readRDS("../data/kaunas.rds")
  updateSelectizeInput(session, "kodas", choices = data$`Pavadinimas (name)`, server = TRUE)
  output$table <- renderTable({
    data %>%
      filter(`Pavadinimas (name)` == input$kodas) %>%
      group_by(`Pavadinimas (name)`) %>%
      summarise(max_apdraustuju = max(`Apdraustųjų skaičius (numInsured)`),
                max_vid_atlyginimas = max(`Vidutinis darbo užmokestis (avgWage)`))

  })
  
  output$plot <- renderPlot(
    data %>%
      filter(`Pavadinimas (name)` == input$kodas) %>%
      ggplot(aes(x = `Mėnuo (month)`, y = `Apdraustųjų skaičius (numInsured)`)) +
      geom_point() + 
      geom_line() +
      theme_classic()
  ) 
}

shinyApp(ui = ui, server = server)