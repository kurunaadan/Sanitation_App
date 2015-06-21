shinyUI(fluidPage(
    
    titlePanel("Sanitation Data from 1990 to 2010"),
    
    sidebarLayout(
    sidebarPanel(
        uiOutput("choose_continent"),
        br(),
        uiOutput("choose_country")
        
    ),
    
    mainPanel(
        tabsetPanel(type = "tabs", 
             tabPanel("Summary", pre(includeMarkdown("include.md"))),
             tabPanel("Plot", plotOutput("data_plot"))
                   )

    )
)))

