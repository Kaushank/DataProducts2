###############################
### Google Analytics - ui.R ###
###############################

library(shiny) 

shinyUI(pageWithSidebar( 
  
  headerPanel("Google Analytics For a leading Management College in Bangalore"), 
  
  sidebarPanel( 
    
    dateRangeInput(inputId = "dateRange",  
                   label = "Date range", 
                   start = "2013-04-01",
                   max = Sys.Date()
    ),
    
    sliderInput(inputId = "minimumTime",
                label = "Hours of interest- minimum",
                min = 0,
                max = 23,
                value = 0,
                step = 1),
    
    sliderInput(inputId = "maximumTime",
                label = "Hours of interest- maximum",
                min = 0,
                max = 23,
                value = 23,
                step = 1),
    
    checkboxInput(inputId = "smoother",
                  label = "Add smoother?",
                  value = FALSE),
    
    checkboxGroupInput(inputId = "domainShow",
                       label = "Show TFI India and other domain (defaults to all)?",
                       choices = list("TFI users" = "TFI",
                                      "Other" = "Other")
    ),
    
    radioButtons(inputId = "outputType",
                 label = "Output required",
                 choices = list("Visitors" = "visitors",
                                "Bounce rate" = "bounceRate",
                                "Time on site" = "timeOnSite"))
  ),
  mainPanel(
    tabsetPanel( 
      tabPanel("Summary", textOutput("textDisplay")), 
      tabPanel("Monthly figures", plotOutput("monthGraph")),
      tabPanel("Hourly figures", plotOutput("hourGraph"))
    )
  )
))
