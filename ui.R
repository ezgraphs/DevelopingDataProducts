library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Portfolio Analysis"),
  
  sidebarLayout(
    sidebarPanel(
      fluidPage(  
        fluidRow(column(3, h4("ETF Shares")), 
                 column(3, h4("Start")), 
                 column(3, h4("End"))),  
        
       fluidRow(column(3, numericInput("SPY",  label = "SPY", value = 1)), 
                column(3, textOutput("spy_begin")), 
                column(3, textOutput("spy_end"))),
       
       fluidRow(column(3, numericInput("QQQ",  label = "QQQ", value = 1)), 
                column(3, textOutput("qqq_begin")), 
                column(3, textOutput("qqq_end"))),
       
       fluidRow(column(3, numericInput("BND",  label = "BND", value = 1)), 
                column(3, textOutput("bnd_begin")), 
                column(3, textOutput("bnd_end"))),
       
       fluidRow(column(3, numericInput("GLD",  label = "GLD", value = 1)), 
                column(3, textOutput("gld_begin")), 
                column(3, textOutput("gld_end"))),
       
       fluidRow(column(3, 
	     checkboxInput("addBBands", label = "Add Bollinger Bands", value = FALSE)))   
    )),
    
    mainPanel(
      h1("Performance"),
      plotOutput("chart"), 
      fluidRow(	column(6,
	  "An ETF (exchange traded fund), is a marketable security 
	like a mutual fund.  It tracks an index, a commodity, bonds, 
	or other basket of assets.  This application allows you to
	explore the recent value for up to 4 funds if you had invested in
	2008.  Enter the number of shares for each fund, and the chart 
	will be updated with the aggregate performance of all funds.  
	In addition, the value of the particular
	fund at the beginning and end of the time period will be displayed
	to the right of the number of shares selected."),
	column(6,
		"In addition, a checkbox may be checked to include Bollinger 
     Bands - a indicator plotted two standard deviations away from the moving 
     average.  These bands are used as an indicator of volatility by 
     technical traders."
     )
   )
    ),

  )
)
)