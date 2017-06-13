
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

library(tidyverse, warn.conflicts = F)
library(plotly)

data <- read.csv(file="./series_from_imdb.csv", header=TRUE, sep=",")
tv_shows_resume <- group_by(data,series_name,season) %>%
  summarize(eps = n(), median = median(UserRating, na.rm = T))

shinyServer(function(input, output) {

  output$distPlot <- renderPlotly({
    
    if(input$type == "Eps") {
      
      g <- data %>% 
        filter(series_name %in% input$filtros) %>% 
        ggplot(aes(series_ep, UserRating)) +
        geom_point(aes(colour = series_name)) +
        geom_line(aes(colour = series_name, linetype = series_name)) +
        xlab('Temporada') + 
        ylab('    ')
      
      ggplotly(g)
      
    } else {
      g <- tv_shows_resume %>% 
        filter(series_name %in% input$filtros) %>% 
        ggplot(aes(season, series_name)) +
        geom_point(aes(colour = median, size = median)) +
        scale_colour_gradient(low = "white", high = "black") +
        xlab('Temporada') + 
        ylab('    ')
      
      ggplotly(g)
    }

  })

})
