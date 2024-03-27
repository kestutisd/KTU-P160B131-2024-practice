library(shiny)
library(shinydashboard)
library(plotly)
library(tidyverse)

ui <- dashboardPage(
  dashboardHeader(title = "KTU Lab"),
  dashboardSidebar(
    selectizeInput("kodas",
                   "Iveskite imones pavadinima",
                   choices = NULL),
    selectizeInput("econame",
                   "Pasirinkite imones veiklos sriti",
                   choices = NULL)
  ),
  dashboardBody(
    tableOutput("table"),
    plotOutput("plot"),
    plotlyOutput("plot2")
  )
)

server <- function(input, output, session) {
  data <- readRDS("../data/kaunas.rds")
  updateSelectizeInput(session, "kodas", choices = data$name, server = TRUE)
  updateSelectizeInput(session, "econame", choices = data$ecoActName, server = TRUE)
  
  
  output$table <- renderTable({
    data %>%
      filter(name == input$kodas) %>%
      group_by(name) %>%
      summarise(max_apdraustuju = max(numInsured),
                max_vid_atlyginimas = max(avgWage))
    
  })
  
  output$plot <- renderPlot(
    data %>%
      filter(name == input$kodas) %>%
      ggplot(aes(x = `month`, y = numInsured)) +
      geom_point() + 
      geom_line() +
      theme_classic()
  ) 
  
  output$plot2 <- renderPlotly({
    
    top_eco <- data %>%
      filter(ecoActName == input$econame) %>%
      group_by(ecoActCode) %>%
      summarise(n = n()) %>%
      arrange(desc(n)) 
    top_eco
    
    agg_data <- data %>%
      filter(ecoActCode %in% top_eco$ecoActCode) %>%
      group_by(ecoActName, name) %>%
      summarise(avgWage = mean(avgWage, na.rm = TRUE), numInsured = mean(numInsured))
    
    pp <- ggplot(agg_data, aes(x = avgWage, y = numInsured, color = ecoActName, label = name)) +
      geom_point(alpha = 0.3, na.rm = TRUE) +
      geom_smooth(method = "glm", se = TRUE, na.rm = TRUE, color = "black", fill = "blue", alpha = 0.1) +
      theme_minimal() +
      guides(color = "none")
    ggplotly(pp)
  }
    
  )
}

shinyApp(ui, server)