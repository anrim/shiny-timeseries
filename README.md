# Forecast of GOOG stock

This is a simple shiny app that forecast the opening stock price of Google's stock (GOOG).

See the app here: [Forecast of GOOG stock](https://anrim.shinyapps.io/shiny-timeseries)

## Parameters

**Date range** - The date range to forecast the stock

**Moving average order** - a slider to the order of the moving average (using SMA from TTR package)

**Number of years to forecast** - a slider to set the number of years to forecast. The forecast is created by a simple exponential smoothing predictive model using HoltWinters. The darker blue indicates the 80% prediction interval and the lighter blue the 95% prediction interval.
