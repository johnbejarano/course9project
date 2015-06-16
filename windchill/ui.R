library(shiny)
shinyUI(
     pageWithSidebar(
               headerPanel("Calculate Wind Chill"),
               
               sidebarPanel(
                         helpText("To calculate the wind chill index:",
                                  "1. Select the observed air temperature using the Temperature slider.",
                                  "2. Select the temperature scale (Farenheit or Celsius).",
                                  "3. Select the observed wind velocity using the Wind Velocity slider.",
                                  "4. Select the units for the wind velocity (miles per hour (MPH)",
                                  "   or kilometers per hour (km/h))."),
                         sliderInput("temp", "Temperature", min = -80, max = 50, value = 0, step = .5),
                         radioButtons("tempscale", "Farenheit or Celsius",
                                      c("Farenheit",
                                        "Celsius")),
                         sliderInput("windvel", "Wind Velocity", min = 0, max = 150, value = 10, step = 5),
                         radioButtons("windunits", "MPH or km/h",
                                      c("MPH",
                                        "km/h"))
                    ),
               
               mainPanel(
                    h3("Wind chill calculation"),
                    h4("If the air temperature is"),
                    verbatimTextOutput("inputtemp"),
                    h4("as measured in degrees"),
                    verbatimTextOutput("inputtempscale"),
                    h4("and the wind speed is"),
                    verbatimTextOutput("inputwindvel"),
                    h4("as measured in"),
                    verbatimTextOutput("inputwindunits"),
                    h4("Then the wind chill index indicates that it feels like:"),
                    verbatimTextOutput("outputwci")
                    )
          )     
)