library(quantmod)
library("TTR")
library("forecast")

fromDate <- as.Date("01/01/08", format="%m/%d/%y")
toDate <- as.Date("12/31/13", format="%m/%d/%y")
getSymbols("GOOG", src="google", from=fromDate, to=toDate)

mGoog <- to.monthly(GOOG[, 1:4])
googOpen <- Op(mGoog)
ts1 <- ts(googOpen, frequency=12)

getTimeseries <- function (from, to, symbol="GOOG", src="google") {
  getSymbols(symbol, src=src, from=from, to=to)
  
  mData <- to.monthly(GOOG[, 1:4])
  mOpen <- Op(mData)
  ts1 <- ts(mOpen, frequency=12)
}

shinyServer(
  function(input, output) {
    output$plot <- renderPlot({
      from <- as.Date(as.character(input$daterange[1]), format="%Y-%m-%d")
      to <- as.Date(as.character(input$daterange[2]), format="%Y-%m-%d")
      h <- input$forecastYears
      ma <- input$ma
      ts1 <- getTimeseries(from, to)
      
      ts1Forecast <- HoltWinters(ts1, beta=FALSE, gamma=FALSE)
      ts1SMA <- SMA(ts1, n=ma)
      
      ts1Forecast2 <- forecast.HoltWinters(ts1Forecast, h=h)
      
      plot.forecast(ts1Forecast2, main="Forecast of GOOG (HoltWinters exponential smoothing)", xlab="Year+1", ylab="GOOG Open")
      lines(ts1SMA,col="red")
    })
  }
)