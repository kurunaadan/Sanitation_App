
# Define a server for the Shiny app
shinyServer(function(input, output) {
    
    output$choose_continent <- renderUI({
        selectizeInput("continent", "Choose the continent",choices =  as.list(unique(sanitation.data$Continent)))
    })
    
    output$choose_country <- renderUI({
        if(is.null(input$continent))
            return()
        temp.data <-  subset(sanitation.data, Continent == input$continent)
        country.names <- as.list(unique(temp.data$Country))
        
        selectizeInput(inputId = "country",label =  "Choose one or more country", 
                            choices  = country.names)
        })

# Output the data
output$data_plot <- renderPlot({
    temp.data <-  subset(sanitation.data, Continent == input$continent)
    # Plot
    if(is.null(input$country))
        return()

    country.percent = temp.data[which(temp.data$Country==input$country),3:23]
    country.percent = as.numeric(t(country.percent))
    plot.data$country.percent <- country.percent

  
    
    
    p <- ggplot(data=plot.data, aes(x=year,y=country.percent ))
    p <- p + xlab("Year")+ylab("Percentage")+ylim(0,100)
    p <- p + geom_line()+geom_point(colour = "red", size = 2,na.rm = TRUE)
    
    p <- p + ggtitle(paste0("Sanitation facility improvement for ",input$country))
    
    
    print(p)    
#     plot(x = year, y = y, xlim = c(1990,2010), ylim = c(0,100) , type = 'l', col = "red")
})

    })
       

