shinyUI(pageWithSidebar(
  
  headerPanel(""),
  
  sidebarPanel(
    fileInput("file","Upload the file"),
    radioButtons(inputId = 'sep', label = 'Separator', choices = c(Comma=',',Semicolon=';',Tab='\t', Space=''), selected = ','),
    uiOutput("choose_dataset"),
    
    uiOutput("choose_columns"),
    br(),
    a(href = "https://gist.github.com/4211337", "Source code")
  ),
  
  
  mainPanel(
    tableOutput("data_table")
  )
))