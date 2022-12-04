library(shiny)

# Set of server logic for a plot output
shinyServer(function(input, output) {
  output$bmiPlot <- renderPlot({
    kg_input <- input$kg
    cm_input <- input$cm
    bmi_output <- 10000 * kg_input / cm_input / cm_input
    
    # setting values of BMI categories
    cm <- seq(from = 100, to = 260)
    kg_min <- numeric(length(cm))+40
    kg_max <- numeric(length(cm))+160
    kg_udr <- cm^2 * 18.5 / 10000
    kg_udr[kg_udr>160] <- 160
    kg_udr[kg_udr<40] <- 40
    kg_ovr <- cm^2 * 25 / 10000
    kg_ovr[kg_ovr>160] <- 160
    kg_ovr[kg_ovr<40] <- 40
    kg_obe <- cm^2 * 30 / 10000
    kg_obe[kg_obe>160] <- 160
    kg_obe[kg_obe<40] <- 40
    
    plot(0, xlim=c(90,270), ylim=c(30,170), xlab="Height in cm", ylab="Mass in kg", cex.lab=2)
    polygon(c(cm,rev(cm)),c(kg_min,rev(kg_udr)),col="lightblue")
    polygon(c(cm,rev(cm)),c(kg_udr,rev(kg_ovr)),col="green")
    polygon(c(cm,rev(cm)),c(kg_ovr,rev(kg_obe)),col="yellow")
    polygon(c(cm,rev(cm)),c(kg_obe,rev(kg_max)),col="red")
    points(cm_input, kg_input, pch=4, bg="black", cex=2, lwd=3)
    text(cm_input, kg_input, paste0("BMI = ", round(bmi_output,1)), offset=1, cex=1.5, lwd=4, pos = 4)
    text(100, 150, paste0("Obese"), cex=1.5, lwd=4, pos=4)
    text(260, 50, paste0("Underweight"), cex=1.5, lwd=4, pos=2)
    text(235, 120, paste0("Normal"), cex=1.5, lwd=4)
    text(225, 140, paste0("Overweight"), cex=1.5, lwd=4)
  })
})