library(shiny);library(ggvis)
shinyServer(function(input, output) {
  plotData <- reactive({
    df <- mergeACS[,c(input$xVariable,input$yVariable, "geo_name")]
    names(df) <- c("x","y", "geo_name")
    df
  })
  reactive({ plotData() %>%  ggvis(x=~x,y=~y) %>%
      #layer_points()%>%
      layer_model_predictions(model = "lm", formula=y~x)%>%
      add_axis("x", title = input$xVariable) %>%
      layer_text(text:=~geo_name) %>%
      add_axis("y", title = input$yVariable) 
  }) %>%  bind_shiny("ggvisPlot")
})


