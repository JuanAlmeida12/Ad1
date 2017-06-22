
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

library(plotly)

shinyUI(fluidPage(

  # Application title
  titlePanel("Lab02CP02"),
  h2("Comparando séries por episodio ou por temporada"),
  div("Você pode selecionar suas séries favoritas e comparalas por episódios ou por temporada"),
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      uiOutput("painelPlot")
      ),
    # Show a plot of the generated distribution
    mainPanel(tabsetPanel(type="tab", 
                          
                          tabPanel("Plot", plotlyOutput("distPlot"))
    )
  )
))
)