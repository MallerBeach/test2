library(shiny)
library(bslib)

# Definieren Sie die Benutzeroberfläche mit einem Seitenleistenlayout.
ui <- page_sidebar(
  title = "Hello Shiny!",
  sidebar = sidebar(
    sliderInput("bins", "Number of bins:", min = 5, max = 30, value = 10)
  ),
  plotOutput("distPlot")
)

# Definieren Sie die Serverlogik zur Erzeugung eines Histogramms.
server <- function(input, output) {
  output$distPlot <- renderPlot({
    x <- mtcars$mpg
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         main = "Histogram of MPG", xlab = "Miles Per Gallon")
  })
}

# Erstellen und Ausführen der Shiny-Anwendung.
shinyApp(ui = ui, server = server)

# shinylive::export(getwd(), "docs")
# httpuv::runStaticServer("docs/")
