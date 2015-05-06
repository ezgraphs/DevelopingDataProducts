library(shiny)
library(quantmod)

getSymbols(c('QQQ', 'SPY', 'BND', 'GLD'), src = "yahoo", 
           from = '2008-01-03',
           to = Sys.Date(),
           auto.assign = TRUE)

shinyServer(
  
  function(input, output) {
    
    begin_date<- time(head(QQQ, 1))
    end_date<- time(tail(QQQ, 1))
    
    output$qqq_begin <- renderText({QQQ[begin_date]$QQQ.Close * input$QQQ})
    output$qqq_end <- renderText({QQQ[end_date]$QQQ.Close * input$QQQ})
    
    output$spy_begin <- renderText({ SPY[begin_date]$SPY.Close * input$SPY})
    output$spy_end <- renderText({ SPY[end_date]$SPY.Close * input$SPY})
    
    output$bnd_begin <- renderText({ BND[begin_date]$BND.Close * input$BND})
    output$bnd_end <- renderText({ BND[end_date]$BND.Close * input$BND})
    
    output$gld_begin <- renderText({ GLD[begin_date]$GLD.Close * input$GLD})
    output$gld_end <- renderText({ GLD[end_date]$GLD.Close * input$GLD})
    output$chart <- renderPlot({ 
      
      candleChart(
        (SPY$SPY.Close * input$SPY) +
        (QQQ$QQQ.Close * input$QQQ) +
        (BND$BND.Close * input$BND) +  
        (GLD$GLD.Close * input$GLD)  
        ,name=paste("Performance since ",begin_date), theme="white")
      
      if (input$addBBands){
        addBBands()    
      }
      
    })
  }

)
