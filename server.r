library(shiny)

shinyServer(function(input, output) {
  
  data <- reactive({
    file1 <- input$file
    if(is.null(file1)){return()} 
    read.table(file=file1$datapath, sep=input$sep)
    
    
  })
  output$choose_columns <- renderUI({
    
    if(is.null(data()))
      return()
    
    
    dat <- (data())
    colnames <- names(dat)
    
    checkboxGroupInput("columns", "Choose columns", 
                       choices  = colnames,
                       selected = colnames)
  })
  output$data_table <- renderTable({
    req(input$columns)
    dat <- data()[, input$columns, drop = FALSE]
    head(dat, 20)
  })
})