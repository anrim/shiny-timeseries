shinyUI(pageWithSidebar(
  headerPanel("Forecast of GOOG stock"),
  sidebarPanel(
    h3("Parameters"),
    dateRangeInput("daterange", "Date range:",
                   start = "2008-01-01",
                   end   = "2013-12-31",
                   format = "mm/dd/yy"),
    sliderInput("ma", 
                "Moving average order", 
                min=1, max=5, value=3),
    sliderInput("forecastYears", 
                "Num years to forecast:", 
                min=1, max=10, value=5),
    p("(80% & 95% prediction interval for the forecast)"),
    h3("Instructions"),
    p("This shiny app plots the Google stock opening price for a date range."),
    p("The moving average parameter is used to smooth time series data using a simple moving average. You can set the order of the smoothing using the slider."),
    p("The forecast slider sets the number of years to forecast the opening price of the stock using a simple exponential smoothing predictive model called HoltWinters")
  ),
  mainPanel(
    plotOutput('plot')
  )
))