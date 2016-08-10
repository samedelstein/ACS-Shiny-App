library(shiny);library(ggvis)
shinyUI(fluidPage(
  titlePanel("ACS data"),
  sidebarLayout(
    sidebarPanel(
      selectInput("yVariable", "Y Variable:",
                  c("Income" = "income",
                    "Age" = "age",
                    "Population" = "pop",
                    "Non US Citizens" = "non_us_citizens",
                    "Owner Occupied Housing" = "owner_occupied_housing_units",
                    "Median Property Value" = "median_property_value",
                    "US Citizens" = "us_citizens",
                    "Non English Speakers" = "non_eng_speakers_pct",
                    "Commute Time" = "mean_commute_minutes"),selected = "income"),
      selectInput("xVariable", "X Variable:",
                  c("Income" = "income",
                    "Age" = "age",
                    "Population" = "pop",
                    "Non US Citizens" = "non_us_citizens",
                    "Owner Occupied Housing" = "owner_occupied_housing_units",
                    "Median Property Value" = "median_property_value",
                    "US Citizens" = "us_citizens",
                    "Non English Speakers" = "non_eng_speakers_pct",
                    "Commute Time" = "mean_commute_minutes"),selected = "age")
    ),
    
    mainPanel(
      ggvisOutput("ggvisPlot")
    )
  )
))