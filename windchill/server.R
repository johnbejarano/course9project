wci <- function(temp, tempscale, windvel, windunits) {
     if(tempscale == "Celsius") {
          t <- (temp * 9 / 5) + 32 #convert to Farenheit
     } else {
          t <- temp
     }
     
     if(windunits == "km/h") {
          v <- windvel / 1.60934 #convert to MPH
     } else {
          v <- windvel
     }
     
     #Calculate wind chill using Imperial units.
     if(t > 50) {
          windchill <- t
     } else {
          windchill <- (35.74) + (0.6215 * t) - (35.75 * v ^ 0.16) + (0.4275 * t * v ^ 0.16)          
     }
     
     if(tempscale == "Celsius") {
          windchill <- ((windchill - 32) * 5 / 9) #convert windchill back to Celsius
     }
     
     windchill <- round(windchill * 2, 0) / 2
     
     windchill
}

shinyServer(
     function(input, output) {
          output$inputtemp <- renderPrint({input$temp})
          output$inputtempscale <- renderPrint({input$tempscale})
          output$inputwindvel <- renderPrint({input$windvel})
          output$inputwindunits <- renderPrint({input$windunits})
          output$outputwci <- renderPrint({wci(input$temp, input$tempscale, input$windvel, input$windunits)})
     }
)
