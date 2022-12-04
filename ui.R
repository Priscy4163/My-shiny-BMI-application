library(shiny)

# UI for the body mass index calculator.
shinyUI(fluidPage(
  
  
  # Title of application
  titlePanel("Body mass index calculator"),
  
  # Sidebars with mass and 
  sidebarLayout(
    sidebarPanel(
      h6("A medical screening tool called the body mass index (BMI) calculates the
      ratio of your height to weight to determine how much body fat you have.
      BMI is calculated by medical professionals by dividing weight in kilogrammes
      (kg) by the square of height in metres (m2)
         The majority of the time, BMI and body fat are correlated; the higher the number, 
         the more body fat you may possess. Heart disease, stroke, and Type 2 diabetes may be brought on by high body fat.
         Malnutrition may be linked to low fat mass. The proper quantity of body fat aids in the absorption of vitamins and minerals.
         It also gives your body a source of energy, aids in regulating body temperature,
         and shields your organs. Research more about it"),
      a(href="https://my.clevelandclinic.org/health/articles/9464-body-mass-index-bmi", h6("here")),
      sliderInput("cm",
                  "Height in centimeters:",
                  min = 100,
                  max = 260,
                  value = 180
      ),
      sliderInput("kg",
                  "Mass in kilograms:",
                  min = 40,
                  max = 160,
                  value = 80
      )
    ),
    # Generated BMI plot is shown on this panel
    mainPanel(
      plotOutput("bmiPlot")
    )
  )
))
